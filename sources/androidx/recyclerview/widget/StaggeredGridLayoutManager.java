package androidx.recyclerview.widget;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.PointF;
import android.graphics.Rect;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import androidx.recyclerview.widget.GapWorker;
import androidx.recyclerview.widget.RecyclerView;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.BitSet;
import java.util.List;
import java.util.Objects;
/* loaded from: classes.dex */
public class StaggeredGridLayoutManager extends RecyclerView.LayoutManager implements RecyclerView.SmoothScroller.ScrollVectorProvider {
    public boolean mLastLayoutFromEnd;
    public boolean mLastLayoutRTL;
    public final LayoutState mLayoutState;
    public int mOrientation;
    public SavedState mPendingSavedState;
    public int[] mPrefetchDistances;
    public OrientationHelper mPrimaryOrientation;
    public BitSet mRemainingSpans;
    public boolean mReverseLayout;
    public OrientationHelper mSecondaryOrientation;
    public int mSizePerSpan;
    public int mSpanCount;
    public Span[] mSpans;
    public boolean mShouldReverseLayout = false;
    public int mPendingScrollPosition = -1;
    public int mPendingScrollPositionOffset = RecyclerView.UNDEFINED_DURATION;
    public LazySpanLookup mLazySpanLookup = new LazySpanLookup();
    public int mGapStrategy = 2;
    public final Rect mTmpRect = new Rect();
    public final AnchorInfo mAnchorInfo = new AnchorInfo();
    public boolean mSmoothScrollbarEnabled = true;
    public final Runnable mCheckForGapsRunnable = new Runnable() { // from class: androidx.recyclerview.widget.StaggeredGridLayoutManager.1
        @Override // java.lang.Runnable
        public void run() {
            StaggeredGridLayoutManager.this.checkForGaps();
        }
    };

    /* loaded from: classes.dex */
    public class AnchorInfo {
        public boolean mInvalidateOffsets;
        public boolean mLayoutFromEnd;
        public int mOffset;
        public int mPosition;
        public int[] mSpanReferenceLines;
        public boolean mValid;

        public AnchorInfo() {
            reset();
        }

        public void assignCoordinateFromPadding() {
            this.mOffset = this.mLayoutFromEnd ? StaggeredGridLayoutManager.this.mPrimaryOrientation.getEndAfterPadding() : StaggeredGridLayoutManager.this.mPrimaryOrientation.getStartAfterPadding();
        }

        public void reset() {
            this.mPosition = -1;
            this.mOffset = RecyclerView.UNDEFINED_DURATION;
            this.mLayoutFromEnd = false;
            this.mInvalidateOffsets = false;
            this.mValid = false;
            int[] iArr = this.mSpanReferenceLines;
            if (iArr != null) {
                Arrays.fill(iArr, -1);
            }
        }
    }

    /* loaded from: classes.dex */
    public static class LayoutParams extends RecyclerView.LayoutParams {
        public Span mSpan;

        public LayoutParams(Context c, AttributeSet attrs) {
            super(c, attrs);
        }

        public LayoutParams(int width, int height) {
            super(width, height);
        }

        public LayoutParams(ViewGroup.MarginLayoutParams source) {
            super(source);
        }

        public LayoutParams(ViewGroup.LayoutParams source) {
            super(source);
        }
    }

    @SuppressLint({"BanParcelableUsage"})
    /* loaded from: classes.dex */
    public static class SavedState implements Parcelable {
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: androidx.recyclerview.widget.StaggeredGridLayoutManager.SavedState.1
            @Override // android.os.Parcelable.Creator
            public SavedState createFromParcel(Parcel in) {
                return new SavedState(in);
            }

            @Override // android.os.Parcelable.Creator
            public SavedState[] newArray(int size) {
                return new SavedState[size];
            }
        };
        public boolean mAnchorLayoutFromEnd;
        public int mAnchorPosition;
        public List<LazySpanLookup.FullSpanItem> mFullSpanItems;
        public boolean mLastLayoutRTL;
        public boolean mReverseLayout;
        public int[] mSpanLookup;
        public int mSpanLookupSize;
        public int[] mSpanOffsets;
        public int mSpanOffsetsSize;
        public int mVisibleAnchorPosition;

        public SavedState() {
        }

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            dest.writeInt(this.mAnchorPosition);
            dest.writeInt(this.mVisibleAnchorPosition);
            dest.writeInt(this.mSpanOffsetsSize);
            if (this.mSpanOffsetsSize > 0) {
                dest.writeIntArray(this.mSpanOffsets);
            }
            dest.writeInt(this.mSpanLookupSize);
            if (this.mSpanLookupSize > 0) {
                dest.writeIntArray(this.mSpanLookup);
            }
            dest.writeInt(this.mReverseLayout ? 1 : 0);
            dest.writeInt(this.mAnchorLayoutFromEnd ? 1 : 0);
            dest.writeInt(this.mLastLayoutRTL ? 1 : 0);
            dest.writeList(this.mFullSpanItems);
        }

        public SavedState(Parcel in) {
            this.mAnchorPosition = in.readInt();
            this.mVisibleAnchorPosition = in.readInt();
            int readInt = in.readInt();
            this.mSpanOffsetsSize = readInt;
            if (readInt > 0) {
                int[] iArr = new int[readInt];
                this.mSpanOffsets = iArr;
                in.readIntArray(iArr);
            }
            int readInt2 = in.readInt();
            this.mSpanLookupSize = readInt2;
            if (readInt2 > 0) {
                int[] iArr2 = new int[readInt2];
                this.mSpanLookup = iArr2;
                in.readIntArray(iArr2);
            }
            boolean z = false;
            this.mReverseLayout = in.readInt() == 1;
            this.mAnchorLayoutFromEnd = in.readInt() == 1;
            this.mLastLayoutRTL = in.readInt() == 1 ? true : z;
            this.mFullSpanItems = in.readArrayList(LazySpanLookup.FullSpanItem.class.getClassLoader());
        }

        public SavedState(SavedState other) {
            this.mSpanOffsetsSize = other.mSpanOffsetsSize;
            this.mAnchorPosition = other.mAnchorPosition;
            this.mVisibleAnchorPosition = other.mVisibleAnchorPosition;
            this.mSpanOffsets = other.mSpanOffsets;
            this.mSpanLookupSize = other.mSpanLookupSize;
            this.mSpanLookup = other.mSpanLookup;
            this.mReverseLayout = other.mReverseLayout;
            this.mAnchorLayoutFromEnd = other.mAnchorLayoutFromEnd;
            this.mLastLayoutRTL = other.mLastLayoutRTL;
            this.mFullSpanItems = other.mFullSpanItems;
        }
    }

    /* loaded from: classes.dex */
    public class Span {
        public final int mIndex;
        public ArrayList<View> mViews = new ArrayList<>();
        public int mCachedStart = RecyclerView.UNDEFINED_DURATION;
        public int mCachedEnd = RecyclerView.UNDEFINED_DURATION;
        public int mDeletedSize = 0;

        public Span(int index) {
            this.mIndex = index;
        }

        public void appendToSpan(View view) {
            LayoutParams layoutParams = getLayoutParams(view);
            layoutParams.mSpan = this;
            this.mViews.add(view);
            this.mCachedEnd = RecyclerView.UNDEFINED_DURATION;
            if (this.mViews.size() == 1) {
                this.mCachedStart = RecyclerView.UNDEFINED_DURATION;
            }
            if (layoutParams.isItemRemoved() || layoutParams.isItemChanged()) {
                this.mDeletedSize = StaggeredGridLayoutManager.this.mPrimaryOrientation.getDecoratedMeasurement(view) + this.mDeletedSize;
            }
        }

        public void calculateCachedEnd() {
            ArrayList<View> arrayList = this.mViews;
            View view = arrayList.get(arrayList.size() - 1);
            LayoutParams layoutParams = getLayoutParams(view);
            this.mCachedEnd = StaggeredGridLayoutManager.this.mPrimaryOrientation.getDecoratedEnd(view);
            Objects.requireNonNull(layoutParams);
        }

        public void calculateCachedStart() {
            View view = this.mViews.get(0);
            LayoutParams layoutParams = getLayoutParams(view);
            this.mCachedStart = StaggeredGridLayoutManager.this.mPrimaryOrientation.getDecoratedStart(view);
            Objects.requireNonNull(layoutParams);
        }

        public void clear() {
            this.mViews.clear();
            this.mCachedStart = RecyclerView.UNDEFINED_DURATION;
            this.mCachedEnd = RecyclerView.UNDEFINED_DURATION;
            this.mDeletedSize = 0;
        }

        public int findFirstPartiallyVisibleItemPosition() {
            if (StaggeredGridLayoutManager.this.mReverseLayout) {
                return findOnePartiallyVisibleChild(this.mViews.size() - 1, -1, true);
            }
            return findOnePartiallyVisibleChild(0, this.mViews.size(), true);
        }

        public int findLastPartiallyVisibleItemPosition() {
            if (StaggeredGridLayoutManager.this.mReverseLayout) {
                return findOnePartiallyVisibleChild(0, this.mViews.size(), true);
            }
            return findOnePartiallyVisibleChild(this.mViews.size() - 1, -1, true);
        }

        public int findOnePartiallyVisibleChild(int fromIndex, int toIndex, boolean acceptEndPointInclusion) {
            int startAfterPadding = StaggeredGridLayoutManager.this.mPrimaryOrientation.getStartAfterPadding();
            int endAfterPadding = StaggeredGridLayoutManager.this.mPrimaryOrientation.getEndAfterPadding();
            int i = toIndex > fromIndex ? 1 : -1;
            while (fromIndex != toIndex) {
                View view = this.mViews.get(fromIndex);
                int decoratedStart = StaggeredGridLayoutManager.this.mPrimaryOrientation.getDecoratedStart(view);
                int decoratedEnd = StaggeredGridLayoutManager.this.mPrimaryOrientation.getDecoratedEnd(view);
                boolean z = false;
                boolean z2 = !acceptEndPointInclusion ? decoratedStart < endAfterPadding : decoratedStart <= endAfterPadding;
                if (!acceptEndPointInclusion ? decoratedEnd > startAfterPadding : decoratedEnd >= startAfterPadding) {
                    z = true;
                }
                if (z2 && z && (decoratedStart < startAfterPadding || decoratedEnd > endAfterPadding)) {
                    return StaggeredGridLayoutManager.this.getPosition(view);
                }
                fromIndex += i;
            }
            return -1;
        }

        public int getEndLine(int def) {
            int i = this.mCachedEnd;
            if (i != Integer.MIN_VALUE) {
                return i;
            }
            if (this.mViews.size() == 0) {
                return def;
            }
            calculateCachedEnd();
            return this.mCachedEnd;
        }

        public View getFocusableViewAfter(int referenceChildPosition, int layoutDir) {
            View view = null;
            if (layoutDir != -1) {
                int size = this.mViews.size() - 1;
                while (size >= 0) {
                    View view2 = this.mViews.get(size);
                    StaggeredGridLayoutManager staggeredGridLayoutManager = StaggeredGridLayoutManager.this;
                    if (staggeredGridLayoutManager.mReverseLayout && staggeredGridLayoutManager.getPosition(view2) >= referenceChildPosition) {
                        break;
                    }
                    StaggeredGridLayoutManager staggeredGridLayoutManager2 = StaggeredGridLayoutManager.this;
                    if ((!staggeredGridLayoutManager2.mReverseLayout && staggeredGridLayoutManager2.getPosition(view2) <= referenceChildPosition) || !view2.hasFocusable()) {
                        break;
                    }
                    size--;
                    view = view2;
                }
            } else {
                int size2 = this.mViews.size();
                int i = 0;
                while (i < size2) {
                    View view3 = this.mViews.get(i);
                    StaggeredGridLayoutManager staggeredGridLayoutManager3 = StaggeredGridLayoutManager.this;
                    if (staggeredGridLayoutManager3.mReverseLayout && staggeredGridLayoutManager3.getPosition(view3) <= referenceChildPosition) {
                        break;
                    }
                    StaggeredGridLayoutManager staggeredGridLayoutManager4 = StaggeredGridLayoutManager.this;
                    if ((!staggeredGridLayoutManager4.mReverseLayout && staggeredGridLayoutManager4.getPosition(view3) >= referenceChildPosition) || !view3.hasFocusable()) {
                        break;
                    }
                    i++;
                    view = view3;
                }
            }
            return view;
        }

        public LayoutParams getLayoutParams(View view) {
            return (LayoutParams) view.getLayoutParams();
        }

        public int getStartLine(int def) {
            int i = this.mCachedStart;
            if (i != Integer.MIN_VALUE) {
                return i;
            }
            if (this.mViews.size() == 0) {
                return def;
            }
            calculateCachedStart();
            return this.mCachedStart;
        }

        public void popEnd() {
            int size = this.mViews.size();
            View remove = this.mViews.remove(size - 1);
            LayoutParams layoutParams = getLayoutParams(remove);
            layoutParams.mSpan = null;
            if (layoutParams.isItemRemoved() || layoutParams.isItemChanged()) {
                this.mDeletedSize -= StaggeredGridLayoutManager.this.mPrimaryOrientation.getDecoratedMeasurement(remove);
            }
            if (size == 1) {
                this.mCachedStart = RecyclerView.UNDEFINED_DURATION;
            }
            this.mCachedEnd = RecyclerView.UNDEFINED_DURATION;
        }

        public void popStart() {
            View remove = this.mViews.remove(0);
            LayoutParams layoutParams = getLayoutParams(remove);
            layoutParams.mSpan = null;
            if (this.mViews.size() == 0) {
                this.mCachedEnd = RecyclerView.UNDEFINED_DURATION;
            }
            if (layoutParams.isItemRemoved() || layoutParams.isItemChanged()) {
                this.mDeletedSize -= StaggeredGridLayoutManager.this.mPrimaryOrientation.getDecoratedMeasurement(remove);
            }
            this.mCachedStart = RecyclerView.UNDEFINED_DURATION;
        }

        public void prependToSpan(View view) {
            LayoutParams layoutParams = getLayoutParams(view);
            layoutParams.mSpan = this;
            this.mViews.add(0, view);
            this.mCachedStart = RecyclerView.UNDEFINED_DURATION;
            if (this.mViews.size() == 1) {
                this.mCachedEnd = RecyclerView.UNDEFINED_DURATION;
            }
            if (layoutParams.isItemRemoved() || layoutParams.isItemChanged()) {
                this.mDeletedSize = StaggeredGridLayoutManager.this.mPrimaryOrientation.getDecoratedMeasurement(view) + this.mDeletedSize;
            }
        }
    }

    public StaggeredGridLayoutManager(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        this.mSpanCount = -1;
        this.mReverseLayout = false;
        RecyclerView.LayoutManager.Properties properties = RecyclerView.LayoutManager.getProperties(context, attrs, defStyleAttr, defStyleRes);
        int i = properties.orientation;
        if (i == 0 || i == 1) {
            assertNotInLayoutOrScroll(null);
            if (i != this.mOrientation) {
                this.mOrientation = i;
                OrientationHelper orientationHelper = this.mPrimaryOrientation;
                this.mPrimaryOrientation = this.mSecondaryOrientation;
                this.mSecondaryOrientation = orientationHelper;
                requestLayout();
            }
            int i2 = properties.spanCount;
            assertNotInLayoutOrScroll(null);
            if (i2 != this.mSpanCount) {
                this.mLazySpanLookup.clear();
                requestLayout();
                this.mSpanCount = i2;
                this.mRemainingSpans = new BitSet(this.mSpanCount);
                this.mSpans = new Span[this.mSpanCount];
                for (int i3 = 0; i3 < this.mSpanCount; i3++) {
                    this.mSpans[i3] = new Span(i3);
                }
                requestLayout();
            }
            boolean z = properties.reverseLayout;
            assertNotInLayoutOrScroll(null);
            SavedState savedState = this.mPendingSavedState;
            if (!(savedState == null || savedState.mReverseLayout == z)) {
                savedState.mReverseLayout = z;
            }
            this.mReverseLayout = z;
            requestLayout();
            this.mLayoutState = new LayoutState();
            this.mPrimaryOrientation = OrientationHelper.createOrientationHelper(this, this.mOrientation);
            this.mSecondaryOrientation = OrientationHelper.createOrientationHelper(this, 1 - this.mOrientation);
            return;
        }
        throw new IllegalArgumentException("invalid orientation.");
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public void assertNotInLayoutOrScroll(String message) {
        RecyclerView recyclerView;
        if (this.mPendingSavedState == null && (recyclerView = this.mRecyclerView) != null) {
            recyclerView.assertNotInLayoutOrScroll(message);
        }
    }

    public final int calculateScrollDirectionForPosition(int position) {
        if (getChildCount() == 0) {
            return this.mShouldReverseLayout ? 1 : -1;
        }
        return (position < getFirstChildPosition()) != this.mShouldReverseLayout ? -1 : 1;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public boolean canScrollHorizontally() {
        return this.mOrientation == 0;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public boolean canScrollVertically() {
        return this.mOrientation == 1;
    }

    public boolean checkForGaps() {
        int i;
        if (!(getChildCount() == 0 || this.mGapStrategy == 0 || !this.mIsAttachedToWindow)) {
            if (this.mShouldReverseLayout) {
                i = getLastChildPosition();
                getFirstChildPosition();
            } else {
                i = getFirstChildPosition();
                getLastChildPosition();
            }
            if (i == 0 && hasGapsToFix() != null) {
                this.mLazySpanLookup.clear();
                this.mRequestedSimpleAnimations = true;
                requestLayout();
                return true;
            }
        }
        return false;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public boolean checkLayoutParams(RecyclerView.LayoutParams lp) {
        return lp instanceof LayoutParams;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public void collectAdjacentPrefetchPositions(int dx, int dy, RecyclerView.State state, RecyclerView.LayoutManager.LayoutPrefetchRegistry layoutPrefetchRegistry) {
        int i;
        int i2;
        if (this.mOrientation != 0) {
            dx = dy;
        }
        if (!(getChildCount() == 0 || dx == 0)) {
            prepareLayoutStateForDelta(dx, state);
            int[] iArr = this.mPrefetchDistances;
            if (iArr == null || iArr.length < this.mSpanCount) {
                this.mPrefetchDistances = new int[this.mSpanCount];
            }
            int i3 = 0;
            for (int i4 = 0; i4 < this.mSpanCount; i4++) {
                LayoutState layoutState = this.mLayoutState;
                if (layoutState.mItemDirection == -1) {
                    i2 = layoutState.mStartLine;
                    i = this.mSpans[i4].getStartLine(i2);
                } else {
                    i2 = this.mSpans[i4].getEndLine(layoutState.mEndLine);
                    i = this.mLayoutState.mEndLine;
                }
                int i5 = i2 - i;
                if (i5 >= 0) {
                    this.mPrefetchDistances[i3] = i5;
                    i3++;
                }
            }
            Arrays.sort(this.mPrefetchDistances, 0, i3);
            for (int i6 = 0; i6 < i3; i6++) {
                int i7 = this.mLayoutState.mCurrentPosition;
                if (i7 >= 0 && i7 < state.getItemCount()) {
                    ((GapWorker.LayoutPrefetchRegistryImpl) layoutPrefetchRegistry).addPosition(this.mLayoutState.mCurrentPosition, this.mPrefetchDistances[i6]);
                    LayoutState layoutState2 = this.mLayoutState;
                    layoutState2.mCurrentPosition += layoutState2.mItemDirection;
                } else {
                    return;
                }
            }
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public int computeHorizontalScrollExtent(RecyclerView.State state) {
        return computeScrollExtent(state);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public int computeHorizontalScrollOffset(RecyclerView.State state) {
        return computeScrollOffset(state);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public int computeHorizontalScrollRange(RecyclerView.State state) {
        return computeScrollRange(state);
    }

    public final int computeScrollExtent(RecyclerView.State state) {
        if (getChildCount() == 0) {
            return 0;
        }
        return ScrollbarHelper.computeScrollExtent(state, this.mPrimaryOrientation, findFirstVisibleItemClosestToStart(!this.mSmoothScrollbarEnabled), findFirstVisibleItemClosestToEnd(!this.mSmoothScrollbarEnabled), this, this.mSmoothScrollbarEnabled);
    }

    public final int computeScrollOffset(RecyclerView.State state) {
        if (getChildCount() == 0) {
            return 0;
        }
        return ScrollbarHelper.computeScrollOffset(state, this.mPrimaryOrientation, findFirstVisibleItemClosestToStart(!this.mSmoothScrollbarEnabled), findFirstVisibleItemClosestToEnd(!this.mSmoothScrollbarEnabled), this, this.mSmoothScrollbarEnabled, this.mShouldReverseLayout);
    }

    public final int computeScrollRange(RecyclerView.State state) {
        if (getChildCount() == 0) {
            return 0;
        }
        return ScrollbarHelper.computeScrollRange(state, this.mPrimaryOrientation, findFirstVisibleItemClosestToStart(!this.mSmoothScrollbarEnabled), findFirstVisibleItemClosestToEnd(!this.mSmoothScrollbarEnabled), this, this.mSmoothScrollbarEnabled);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.SmoothScroller.ScrollVectorProvider
    public PointF computeScrollVectorForPosition(int targetPosition) {
        int calculateScrollDirectionForPosition = calculateScrollDirectionForPosition(targetPosition);
        PointF pointF = new PointF();
        if (calculateScrollDirectionForPosition == 0) {
            return null;
        }
        if (this.mOrientation == 0) {
            pointF.x = calculateScrollDirectionForPosition;
            pointF.y = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        } else {
            pointF.x = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            pointF.y = calculateScrollDirectionForPosition;
        }
        return pointF;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public int computeVerticalScrollExtent(RecyclerView.State state) {
        return computeScrollExtent(state);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public int computeVerticalScrollOffset(RecyclerView.State state) {
        return computeScrollOffset(state);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public int computeVerticalScrollRange(RecyclerView.State state) {
        return computeScrollRange(state);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v19, types: [int] */
    /* JADX WARN: Type inference failed for: r3v21, types: [int] */
    /* JADX WARN: Type inference failed for: r3v30 */
    /* JADX WARN: Type inference failed for: r3v32 */
    public final int fill(RecyclerView.Recycler recycler, LayoutState layoutState, RecyclerView.State state) {
        int i;
        int i2;
        int i3;
        Span span;
        boolean z;
        int i4;
        int i5;
        int i6;
        int i7;
        boolean z2;
        int i8;
        int i9;
        int i10;
        int i11;
        boolean z3 = false;
        this.mRemainingSpans.set(0, this.mSpanCount, true);
        if (this.mLayoutState.mInfinite) {
            i = layoutState.mLayoutDirection == 1 ? Integer.MAX_VALUE : RecyclerView.UNDEFINED_DURATION;
        } else {
            if (layoutState.mLayoutDirection == 1) {
                i11 = layoutState.mEndLine + layoutState.mAvailable;
            } else {
                i11 = layoutState.mStartLine - layoutState.mAvailable;
            }
            i = i11;
        }
        updateAllRemainingSpans(layoutState.mLayoutDirection, i);
        if (this.mShouldReverseLayout) {
            i2 = this.mPrimaryOrientation.getEndAfterPadding();
        } else {
            i2 = this.mPrimaryOrientation.getStartAfterPadding();
        }
        int i12 = i2;
        boolean z4 = false;
        while (true) {
            int i13 = layoutState.mCurrentPosition;
            if (!((i13 < 0 || i13 >= state.getItemCount()) ? z3 : true) || (!this.mLayoutState.mInfinite && this.mRemainingSpans.isEmpty())) {
                break;
            }
            View view = recycler.tryGetViewHolderForPositionByDeadline(layoutState.mCurrentPosition, z3, RecyclerView.FOREVER_NS).itemView;
            layoutState.mCurrentPosition += layoutState.mItemDirection;
            LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
            int viewLayoutPosition = layoutParams.getViewLayoutPosition();
            int[] iArr = this.mLazySpanLookup.mData;
            int i14 = (iArr == null || viewLayoutPosition >= iArr.length) ? -1 : iArr[viewLayoutPosition];
            if (i14 == -1 ? true : z3) {
                if (preferLastSpan(layoutState.mLayoutDirection)) {
                    i9 = -1;
                    i8 = -1;
                    i10 = this.mSpanCount - 1;
                } else {
                    i9 = this.mSpanCount;
                    i10 = z3;
                    i8 = 1;
                }
                Span span2 = null;
                if (layoutState.mLayoutDirection == 1) {
                    int startAfterPadding = this.mPrimaryOrientation.getStartAfterPadding();
                    int i15 = Integer.MAX_VALUE;
                    for (int i16 = i10; i16 != i9; i16 += i8) {
                        Span span3 = this.mSpans[i16];
                        int endLine = span3.getEndLine(startAfterPadding);
                        if (endLine < i15) {
                            span2 = span3;
                            i15 = endLine;
                        }
                    }
                } else {
                    int endAfterPadding = this.mPrimaryOrientation.getEndAfterPadding();
                    int i17 = RecyclerView.UNDEFINED_DURATION;
                    for (int i18 = i10; i18 != i9; i18 += i8) {
                        Span span4 = this.mSpans[i18];
                        int startLine = span4.getStartLine(endAfterPadding);
                        if (startLine > i17) {
                            span2 = span4;
                            i17 = startLine;
                        }
                    }
                }
                span = span2;
                LazySpanLookup lazySpanLookup = this.mLazySpanLookup;
                lazySpanLookup.ensureSize(viewLayoutPosition);
                lazySpanLookup.mData[viewLayoutPosition] = span.mIndex;
            } else {
                span = this.mSpans[i14];
            }
            Span span5 = span;
            layoutParams.mSpan = span5;
            if (layoutState.mLayoutDirection == 1) {
                z = false;
                addViewInt(view, -1, false);
            } else {
                z = false;
                addViewInt(view, 0, false);
            }
            if (this.mOrientation == 1) {
                int i19 = this.mSizePerSpan;
                int i20 = this.mWidthMode;
                int i21 = ((ViewGroup.MarginLayoutParams) layoutParams).width;
                int i22 = z ? 1 : 0;
                int i23 = z ? 1 : 0;
                measureChildWithDecorationsAndMargin(view, RecyclerView.LayoutManager.getChildMeasureSpec(i19, i20, i22, i21, z), RecyclerView.LayoutManager.getChildMeasureSpec(this.mHeight, this.mHeightMode, getPaddingBottom() + getPaddingTop(), ((ViewGroup.MarginLayoutParams) layoutParams).height, true), z);
            } else {
                measureChildWithDecorationsAndMargin(view, RecyclerView.LayoutManager.getChildMeasureSpec(this.mWidth, this.mWidthMode, getPaddingRight() + getPaddingLeft(), ((ViewGroup.MarginLayoutParams) layoutParams).width, true), RecyclerView.LayoutManager.getChildMeasureSpec(this.mSizePerSpan, this.mHeightMode, 0, ((ViewGroup.MarginLayoutParams) layoutParams).height, false), false);
            }
            if (layoutState.mLayoutDirection == 1) {
                int endLine2 = span5.getEndLine(i12);
                i4 = this.mPrimaryOrientation.getDecoratedMeasurement(view) + endLine2;
                i5 = endLine2;
            } else {
                int startLine2 = span5.getStartLine(i12);
                i5 = startLine2 - this.mPrimaryOrientation.getDecoratedMeasurement(view);
                i4 = startLine2;
            }
            if (layoutState.mLayoutDirection == 1) {
                layoutParams.mSpan.appendToSpan(view);
            } else {
                layoutParams.mSpan.prependToSpan(view);
            }
            if (!isLayoutRTL() || this.mOrientation != 1) {
                i6 = this.mSecondaryOrientation.getStartAfterPadding() + (span5.mIndex * this.mSizePerSpan);
                i7 = this.mSecondaryOrientation.getDecoratedMeasurement(view) + i6;
            } else {
                i7 = this.mSecondaryOrientation.getEndAfterPadding() - (((this.mSpanCount - 1) - span5.mIndex) * this.mSizePerSpan);
                i6 = i7 - this.mSecondaryOrientation.getDecoratedMeasurement(view);
            }
            int i24 = i7;
            int i25 = i6;
            if (this.mOrientation == 1) {
                layoutDecoratedWithMargins(view, i25, i5, i24, i4);
            } else {
                layoutDecoratedWithMargins(view, i5, i25, i4, i24);
            }
            updateRemainingSpans(span5, this.mLayoutState.mLayoutDirection, i);
            recycle(recycler, this.mLayoutState);
            if (!this.mLayoutState.mStopInFocusable || !view.hasFocusable()) {
                z2 = false;
            } else {
                z2 = false;
                this.mRemainingSpans.set(span5.mIndex, false);
            }
            z3 = z2;
            z4 = true;
        }
        boolean z5 = z3;
        if (!z4) {
            recycle(recycler, this.mLayoutState);
        }
        if (this.mLayoutState.mLayoutDirection == -1) {
            i3 = this.mPrimaryOrientation.getStartAfterPadding() - getMinStart(this.mPrimaryOrientation.getStartAfterPadding());
        } else {
            i3 = getMaxEnd(this.mPrimaryOrientation.getEndAfterPadding()) - this.mPrimaryOrientation.getEndAfterPadding();
        }
        if (i3 > 0) {
            return Math.min(layoutState.mAvailable, i3);
        }
        return z5 ? 1 : 0;
    }

    public View findFirstVisibleItemClosestToEnd(boolean fullyVisible) {
        int startAfterPadding = this.mPrimaryOrientation.getStartAfterPadding();
        int endAfterPadding = this.mPrimaryOrientation.getEndAfterPadding();
        View view = null;
        for (int childCount = getChildCount() - 1; childCount >= 0; childCount--) {
            View childAt = getChildAt(childCount);
            int decoratedStart = this.mPrimaryOrientation.getDecoratedStart(childAt);
            int decoratedEnd = this.mPrimaryOrientation.getDecoratedEnd(childAt);
            if (decoratedEnd > startAfterPadding && decoratedStart < endAfterPadding) {
                if (decoratedEnd <= endAfterPadding || !fullyVisible) {
                    return childAt;
                }
                if (view == null) {
                    view = childAt;
                }
            }
        }
        return view;
    }

    public View findFirstVisibleItemClosestToStart(boolean fullyVisible) {
        int startAfterPadding = this.mPrimaryOrientation.getStartAfterPadding();
        int endAfterPadding = this.mPrimaryOrientation.getEndAfterPadding();
        int childCount = getChildCount();
        View view = null;
        for (int i = 0; i < childCount; i++) {
            View childAt = getChildAt(i);
            int decoratedStart = this.mPrimaryOrientation.getDecoratedStart(childAt);
            if (this.mPrimaryOrientation.getDecoratedEnd(childAt) > startAfterPadding && decoratedStart < endAfterPadding) {
                if (decoratedStart >= startAfterPadding || !fullyVisible) {
                    return childAt;
                }
                if (view == null) {
                    view = childAt;
                }
            }
        }
        return view;
    }

    public final void fixEndGap(RecyclerView.Recycler recycler, RecyclerView.State state, boolean canOffsetChildren) {
        int endAfterPadding;
        int maxEnd = getMaxEnd(RecyclerView.UNDEFINED_DURATION);
        if (maxEnd != Integer.MIN_VALUE && (endAfterPadding = this.mPrimaryOrientation.getEndAfterPadding() - maxEnd) > 0) {
            int i = endAfterPadding - (-scrollBy(-endAfterPadding, recycler, state));
            if (canOffsetChildren && i > 0) {
                this.mPrimaryOrientation.offsetChildren(i);
            }
        }
    }

    public final void fixStartGap(RecyclerView.Recycler recycler, RecyclerView.State state, boolean canOffsetChildren) {
        int startAfterPadding;
        int minStart = getMinStart(Integer.MAX_VALUE);
        if (minStart != Integer.MAX_VALUE && (startAfterPadding = minStart - this.mPrimaryOrientation.getStartAfterPadding()) > 0) {
            int scrollBy = startAfterPadding - scrollBy(startAfterPadding, recycler, state);
            if (canOffsetChildren && scrollBy > 0) {
                this.mPrimaryOrientation.offsetChildren(-scrollBy);
            }
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public RecyclerView.LayoutParams generateDefaultLayoutParams() {
        if (this.mOrientation == 0) {
            return new LayoutParams(-2, -1);
        }
        return new LayoutParams(-1, -2);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public RecyclerView.LayoutParams generateLayoutParams(Context c, AttributeSet attrs) {
        return new LayoutParams(c, attrs);
    }

    public int getFirstChildPosition() {
        if (getChildCount() == 0) {
            return 0;
        }
        return getPosition(getChildAt(0));
    }

    public int getLastChildPosition() {
        int childCount = getChildCount();
        if (childCount == 0) {
            return 0;
        }
        return getPosition(getChildAt(childCount - 1));
    }

    public final int getMaxEnd(int def) {
        int endLine = this.mSpans[0].getEndLine(def);
        for (int i = 1; i < this.mSpanCount; i++) {
            int endLine2 = this.mSpans[i].getEndLine(def);
            if (endLine2 > endLine) {
                endLine = endLine2;
            }
        }
        return endLine;
    }

    public final int getMinStart(int def) {
        int startLine = this.mSpans[0].getStartLine(def);
        for (int i = 1; i < this.mSpanCount; i++) {
            int startLine2 = this.mSpans[i].getStartLine(def);
            if (startLine2 < startLine) {
                startLine = startLine2;
            }
        }
        return startLine;
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0025  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x003c  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0043 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0044  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void handleUpdate(int r7, int r8, int r9) {
        /*
            r6 = this;
            boolean r0 = r6.mShouldReverseLayout
            if (r0 == 0) goto L9
            int r0 = r6.getLastChildPosition()
            goto Ld
        L9:
            int r0 = r6.getFirstChildPosition()
        Ld:
            r1 = 8
            if (r9 != r1) goto L1a
            if (r7 >= r8) goto L16
            int r2 = r8 + 1
            goto L1c
        L16:
            int r2 = r7 + 1
            r3 = r8
            goto L1d
        L1a:
            int r2 = r7 + r8
        L1c:
            r3 = r7
        L1d:
            androidx.recyclerview.widget.StaggeredGridLayoutManager$LazySpanLookup r4 = r6.mLazySpanLookup
            r4.invalidateAfter(r3)
            r4 = 1
            if (r9 == r4) goto L3c
            r5 = 2
            if (r9 == r5) goto L36
            if (r9 == r1) goto L2b
            goto L41
        L2b:
            androidx.recyclerview.widget.StaggeredGridLayoutManager$LazySpanLookup r9 = r6.mLazySpanLookup
            r9.offsetForRemoval(r7, r4)
            androidx.recyclerview.widget.StaggeredGridLayoutManager$LazySpanLookup r7 = r6.mLazySpanLookup
            r7.offsetForAddition(r8, r4)
            goto L41
        L36:
            androidx.recyclerview.widget.StaggeredGridLayoutManager$LazySpanLookup r9 = r6.mLazySpanLookup
            r9.offsetForRemoval(r7, r8)
            goto L41
        L3c:
            androidx.recyclerview.widget.StaggeredGridLayoutManager$LazySpanLookup r9 = r6.mLazySpanLookup
            r9.offsetForAddition(r7, r8)
        L41:
            if (r2 > r0) goto L44
            return
        L44:
            boolean r7 = r6.mShouldReverseLayout
            if (r7 == 0) goto L4d
            int r7 = r6.getFirstChildPosition()
            goto L51
        L4d:
            int r7 = r6.getLastChildPosition()
        L51:
            if (r3 > r7) goto L56
            r6.requestLayout()
        L56:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.StaggeredGridLayoutManager.handleUpdate(int, int, int):void");
    }

    /* JADX WARN: Code restructure failed: missing block: B:43:0x00bc, code lost:
        if (r10 == r11) goto L48;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x00ce, code lost:
        if (r10 == r11) goto L48;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x00d0, code lost:
        r10 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x00d2, code lost:
        r10 = false;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public android.view.View hasGapsToFix() {
        /*
            Method dump skipped, instructions count: 246
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.StaggeredGridLayoutManager.hasGapsToFix():android.view.View");
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public boolean isAutoMeasureEnabled() {
        return this.mGapStrategy != 0;
    }

    public boolean isLayoutRTL() {
        return getLayoutDirection() == 1;
    }

    public final void measureChildWithDecorationsAndMargin(View child, int widthSpec, int heightSpec, boolean alreadyMeasured) {
        boolean z;
        Rect rect = this.mTmpRect;
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView == null) {
            rect.set(0, 0, 0, 0);
        } else {
            rect.set(recyclerView.getItemDecorInsetsForChild(child));
        }
        LayoutParams layoutParams = (LayoutParams) child.getLayoutParams();
        int i = ((ViewGroup.MarginLayoutParams) layoutParams).leftMargin;
        Rect rect2 = this.mTmpRect;
        int updateSpecWithExtra = updateSpecWithExtra(widthSpec, i + rect2.left, ((ViewGroup.MarginLayoutParams) layoutParams).rightMargin + rect2.right);
        int i2 = ((ViewGroup.MarginLayoutParams) layoutParams).topMargin;
        Rect rect3 = this.mTmpRect;
        int updateSpecWithExtra2 = updateSpecWithExtra(heightSpec, i2 + rect3.top, ((ViewGroup.MarginLayoutParams) layoutParams).bottomMargin + rect3.bottom);
        if (alreadyMeasured) {
            z = shouldReMeasureChild(child, updateSpecWithExtra, updateSpecWithExtra2, layoutParams);
        } else {
            z = shouldMeasureChild(child, updateSpecWithExtra, updateSpecWithExtra2, layoutParams);
        }
        if (z) {
            child.measure(updateSpecWithExtra, updateSpecWithExtra2);
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public void offsetChildrenHorizontal(int dx) {
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView != null) {
            recyclerView.offsetChildrenHorizontal(dx);
        }
        for (int i = 0; i < this.mSpanCount; i++) {
            Span span = this.mSpans[i];
            int i2 = span.mCachedStart;
            if (i2 != Integer.MIN_VALUE) {
                span.mCachedStart = i2 + dx;
            }
            int i3 = span.mCachedEnd;
            if (i3 != Integer.MIN_VALUE) {
                span.mCachedEnd = i3 + dx;
            }
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public void offsetChildrenVertical(int dy) {
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView != null) {
            recyclerView.offsetChildrenVertical(dy);
        }
        for (int i = 0; i < this.mSpanCount; i++) {
            Span span = this.mSpans[i];
            int i2 = span.mCachedStart;
            if (i2 != Integer.MIN_VALUE) {
                span.mCachedStart = i2 + dy;
            }
            int i3 = span.mCachedEnd;
            if (i3 != Integer.MIN_VALUE) {
                span.mCachedEnd = i3 + dy;
            }
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public void onAdapterChanged(RecyclerView.Adapter oldAdapter, RecyclerView.Adapter newAdapter) {
        this.mLazySpanLookup.clear();
        for (int i = 0; i < this.mSpanCount; i++) {
            this.mSpans[i].clear();
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public void onDetachedFromWindow(RecyclerView view, RecyclerView.Recycler recycler) {
        Runnable runnable = this.mCheckForGapsRunnable;
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView != null) {
            recyclerView.removeCallbacks(runnable);
        }
        for (int i = 0; i < this.mSpanCount; i++) {
            this.mSpans[i].clear();
        }
        view.requestLayout();
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x003b, code lost:
        if (r8.mOrientation == 1) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0041, code lost:
        if (r8.mOrientation == 0) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x004d, code lost:
        if (isLayoutRTL() == false) goto L22;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x0059, code lost:
        if (isLayoutRTL() == false) goto L28;
     */
    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public android.view.View onFocusSearchFailed(android.view.View r9, int r10, androidx.recyclerview.widget.RecyclerView.Recycler r11, androidx.recyclerview.widget.RecyclerView.State r12) {
        /*
            Method dump skipped, instructions count: 331
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.StaggeredGridLayoutManager.onFocusSearchFailed(android.view.View, int, androidx.recyclerview.widget.RecyclerView$Recycler, androidx.recyclerview.widget.RecyclerView$State):android.view.View");
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public void onInitializeAccessibilityEvent(AccessibilityEvent event) {
        super.onInitializeAccessibilityEvent(event);
        if (getChildCount() > 0) {
            View findFirstVisibleItemClosestToStart = findFirstVisibleItemClosestToStart(false);
            View findFirstVisibleItemClosestToEnd = findFirstVisibleItemClosestToEnd(false);
            if (findFirstVisibleItemClosestToStart != null && findFirstVisibleItemClosestToEnd != null) {
                int position = getPosition(findFirstVisibleItemClosestToStart);
                int position2 = getPosition(findFirstVisibleItemClosestToEnd);
                if (position < position2) {
                    event.setFromIndex(position);
                    event.setToIndex(position2);
                    return;
                }
                event.setFromIndex(position2);
                event.setToIndex(position);
            }
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public void onItemsAdded(RecyclerView recyclerView, int positionStart, int itemCount) {
        handleUpdate(positionStart, itemCount, 1);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public void onItemsChanged(RecyclerView recyclerView) {
        this.mLazySpanLookup.clear();
        requestLayout();
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public void onItemsMoved(RecyclerView recyclerView, int from, int to, int itemCount) {
        handleUpdate(from, to, 8);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public void onItemsRemoved(RecyclerView recyclerView, int positionStart, int itemCount) {
        handleUpdate(positionStart, itemCount, 2);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public void onItemsUpdated(RecyclerView recyclerView, int positionStart, int itemCount, Object payload) {
        handleUpdate(positionStart, itemCount, 4);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public void onLayoutChildren(RecyclerView.Recycler recycler, RecyclerView.State state) {
        onLayoutChildren(recycler, state, true);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public void onLayoutCompleted(RecyclerView.State state) {
        this.mPendingScrollPosition = -1;
        this.mPendingScrollPositionOffset = RecyclerView.UNDEFINED_DURATION;
        this.mPendingSavedState = null;
        this.mAnchorInfo.reset();
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public void onRestoreInstanceState(Parcelable state) {
        if (state instanceof SavedState) {
            SavedState savedState = (SavedState) state;
            this.mPendingSavedState = savedState;
            if (this.mPendingScrollPosition != -1) {
                savedState.mSpanOffsets = null;
                savedState.mSpanOffsetsSize = 0;
                savedState.mAnchorPosition = -1;
                savedState.mVisibleAnchorPosition = -1;
                savedState.mSpanOffsets = null;
                savedState.mSpanOffsetsSize = 0;
                savedState.mSpanLookupSize = 0;
                savedState.mSpanLookup = null;
                savedState.mFullSpanItems = null;
            }
            requestLayout();
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public Parcelable onSaveInstanceState() {
        int i;
        int i2;
        int[] iArr;
        SavedState savedState = this.mPendingSavedState;
        if (savedState != null) {
            return new SavedState(savedState);
        }
        SavedState savedState2 = new SavedState();
        savedState2.mReverseLayout = this.mReverseLayout;
        savedState2.mAnchorLayoutFromEnd = this.mLastLayoutFromEnd;
        savedState2.mLastLayoutRTL = this.mLastLayoutRTL;
        LazySpanLookup lazySpanLookup = this.mLazySpanLookup;
        if (lazySpanLookup == null || (iArr = lazySpanLookup.mData) == null) {
            savedState2.mSpanLookupSize = 0;
        } else {
            savedState2.mSpanLookup = iArr;
            savedState2.mSpanLookupSize = iArr.length;
            savedState2.mFullSpanItems = lazySpanLookup.mFullSpanItems;
        }
        int i3 = -1;
        if (getChildCount() > 0) {
            savedState2.mAnchorPosition = this.mLastLayoutFromEnd ? getLastChildPosition() : getFirstChildPosition();
            View findFirstVisibleItemClosestToEnd = this.mShouldReverseLayout ? findFirstVisibleItemClosestToEnd(true) : findFirstVisibleItemClosestToStart(true);
            if (findFirstVisibleItemClosestToEnd != null) {
                i3 = getPosition(findFirstVisibleItemClosestToEnd);
            }
            savedState2.mVisibleAnchorPosition = i3;
            int i4 = this.mSpanCount;
            savedState2.mSpanOffsetsSize = i4;
            savedState2.mSpanOffsets = new int[i4];
            for (int i5 = 0; i5 < this.mSpanCount; i5++) {
                if (this.mLastLayoutFromEnd) {
                    i = this.mSpans[i5].getEndLine(RecyclerView.UNDEFINED_DURATION);
                    if (i != Integer.MIN_VALUE) {
                        i2 = this.mPrimaryOrientation.getEndAfterPadding();
                        i -= i2;
                        savedState2.mSpanOffsets[i5] = i;
                    } else {
                        savedState2.mSpanOffsets[i5] = i;
                    }
                } else {
                    i = this.mSpans[i5].getStartLine(RecyclerView.UNDEFINED_DURATION);
                    if (i != Integer.MIN_VALUE) {
                        i2 = this.mPrimaryOrientation.getStartAfterPadding();
                        i -= i2;
                        savedState2.mSpanOffsets[i5] = i;
                    } else {
                        savedState2.mSpanOffsets[i5] = i;
                    }
                }
            }
        } else {
            savedState2.mAnchorPosition = -1;
            savedState2.mVisibleAnchorPosition = -1;
            savedState2.mSpanOffsetsSize = 0;
        }
        return savedState2;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public void onScrollStateChanged(int state) {
        if (state == 0) {
            checkForGaps();
        }
    }

    public final boolean preferLastSpan(int layoutDir) {
        if (this.mOrientation == 0) {
            return (layoutDir == -1) != this.mShouldReverseLayout;
        }
        return ((layoutDir == -1) == this.mShouldReverseLayout) == isLayoutRTL();
    }

    public void prepareLayoutStateForDelta(int delta, RecyclerView.State state) {
        int i;
        int i2;
        if (delta > 0) {
            i2 = getLastChildPosition();
            i = 1;
        } else {
            i = -1;
            i2 = getFirstChildPosition();
        }
        this.mLayoutState.mRecycle = true;
        updateLayoutState(i2, state);
        setLayoutStateDirection(i);
        LayoutState layoutState = this.mLayoutState;
        layoutState.mCurrentPosition = i2 + layoutState.mItemDirection;
        layoutState.mAvailable = Math.abs(delta);
    }

    public final void recycle(RecyclerView.Recycler recycler, LayoutState layoutState) {
        int i;
        int i2;
        if (layoutState.mRecycle && !layoutState.mInfinite) {
            if (layoutState.mAvailable != 0) {
                int i3 = 1;
                if (layoutState.mLayoutDirection == -1) {
                    int i4 = layoutState.mStartLine;
                    int startLine = this.mSpans[0].getStartLine(i4);
                    while (i3 < this.mSpanCount) {
                        int startLine2 = this.mSpans[i3].getStartLine(i4);
                        if (startLine2 > startLine) {
                            startLine = startLine2;
                        }
                        i3++;
                    }
                    int i5 = i4 - startLine;
                    if (i5 < 0) {
                        i2 = layoutState.mEndLine;
                    } else {
                        i2 = layoutState.mEndLine - Math.min(i5, layoutState.mAvailable);
                    }
                    recycleFromEnd(recycler, i2);
                    return;
                }
                int i6 = layoutState.mEndLine;
                int endLine = this.mSpans[0].getEndLine(i6);
                while (i3 < this.mSpanCount) {
                    int endLine2 = this.mSpans[i3].getEndLine(i6);
                    if (endLine2 < endLine) {
                        endLine = endLine2;
                    }
                    i3++;
                }
                int i7 = endLine - layoutState.mEndLine;
                if (i7 < 0) {
                    i = layoutState.mStartLine;
                } else {
                    i = Math.min(i7, layoutState.mAvailable) + layoutState.mStartLine;
                }
                recycleFromStart(recycler, i);
            } else if (layoutState.mLayoutDirection == -1) {
                recycleFromEnd(recycler, layoutState.mEndLine);
            } else {
                recycleFromStart(recycler, layoutState.mStartLine);
            }
        }
    }

    public final void recycleFromEnd(RecyclerView.Recycler recycler, int line) {
        for (int childCount = getChildCount() - 1; childCount >= 0; childCount--) {
            View childAt = getChildAt(childCount);
            if (this.mPrimaryOrientation.getDecoratedStart(childAt) >= line && this.mPrimaryOrientation.getTransformedStartWithDecoration(childAt) >= line) {
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                Objects.requireNonNull(layoutParams);
                if (layoutParams.mSpan.mViews.size() != 1) {
                    layoutParams.mSpan.popEnd();
                    removeAndRecycleView(childAt, recycler);
                } else {
                    return;
                }
            } else {
                return;
            }
        }
    }

    public final void recycleFromStart(RecyclerView.Recycler recycler, int line) {
        while (getChildCount() > 0) {
            View childAt = getChildAt(0);
            if (this.mPrimaryOrientation.getDecoratedEnd(childAt) <= line && this.mPrimaryOrientation.getTransformedEndWithDecoration(childAt) <= line) {
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                Objects.requireNonNull(layoutParams);
                if (layoutParams.mSpan.mViews.size() != 1) {
                    layoutParams.mSpan.popStart();
                    removeAndRecycleView(childAt, recycler);
                } else {
                    return;
                }
            } else {
                return;
            }
        }
    }

    public final void resolveShouldLayoutReverse() {
        if (this.mOrientation == 1 || !isLayoutRTL()) {
            this.mShouldReverseLayout = this.mReverseLayout;
        } else {
            this.mShouldReverseLayout = !this.mReverseLayout;
        }
    }

    public int scrollBy(int dt, RecyclerView.Recycler recycler, RecyclerView.State state) {
        if (getChildCount() == 0 || dt == 0) {
            return 0;
        }
        prepareLayoutStateForDelta(dt, state);
        int fill = fill(recycler, this.mLayoutState, state);
        if (this.mLayoutState.mAvailable >= fill) {
            dt = dt < 0 ? -fill : fill;
        }
        this.mPrimaryOrientation.offsetChildren(-dt);
        this.mLastLayoutFromEnd = this.mShouldReverseLayout;
        LayoutState layoutState = this.mLayoutState;
        layoutState.mAvailable = 0;
        recycle(recycler, layoutState);
        return dt;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public int scrollHorizontallyBy(int dx, RecyclerView.Recycler recycler, RecyclerView.State state) {
        return scrollBy(dx, recycler, state);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public void scrollToPosition(int position) {
        SavedState savedState = this.mPendingSavedState;
        if (!(savedState == null || savedState.mAnchorPosition == position)) {
            savedState.mSpanOffsets = null;
            savedState.mSpanOffsetsSize = 0;
            savedState.mAnchorPosition = -1;
            savedState.mVisibleAnchorPosition = -1;
        }
        this.mPendingScrollPosition = position;
        this.mPendingScrollPositionOffset = RecyclerView.UNDEFINED_DURATION;
        requestLayout();
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public int scrollVerticallyBy(int dy, RecyclerView.Recycler recycler, RecyclerView.State state) {
        return scrollBy(dy, recycler, state);
    }

    public final void setLayoutStateDirection(int direction) {
        LayoutState layoutState = this.mLayoutState;
        layoutState.mLayoutDirection = direction;
        int i = 1;
        if (this.mShouldReverseLayout != (direction == -1)) {
            i = -1;
        }
        layoutState.mItemDirection = i;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public void setMeasuredDimension(Rect childrenBounds, int wSpec, int hSpec) {
        int i;
        int i2;
        int paddingRight = getPaddingRight() + getPaddingLeft();
        int paddingBottom = getPaddingBottom() + getPaddingTop();
        if (this.mOrientation == 1) {
            i2 = RecyclerView.LayoutManager.chooseSize(hSpec, childrenBounds.height() + paddingBottom, getMinimumHeight());
            i = RecyclerView.LayoutManager.chooseSize(wSpec, (this.mSizePerSpan * this.mSpanCount) + paddingRight, getMinimumWidth());
        } else {
            i = RecyclerView.LayoutManager.chooseSize(wSpec, childrenBounds.width() + paddingRight, getMinimumWidth());
            i2 = RecyclerView.LayoutManager.chooseSize(hSpec, (this.mSizePerSpan * this.mSpanCount) + paddingBottom, getMinimumHeight());
        }
        this.mRecyclerView.setMeasuredDimension(i, i2);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public void smoothScrollToPosition(RecyclerView recyclerView, RecyclerView.State state, int position) {
        LinearSmoothScroller linearSmoothScroller = new LinearSmoothScroller(recyclerView.getContext());
        linearSmoothScroller.mTargetPosition = position;
        startSmoothScroll(linearSmoothScroller);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public boolean supportsPredictiveItemAnimations() {
        return this.mPendingSavedState == null;
    }

    public final void updateAllRemainingSpans(int layoutDir, int targetLine) {
        for (int i = 0; i < this.mSpanCount; i++) {
            if (!this.mSpans[i].mViews.isEmpty()) {
                updateRemainingSpans(this.mSpans[i], layoutDir, targetLine);
            }
        }
    }

    public final void updateLayoutState(int anchorPosition, RecyclerView.State state) {
        int i;
        int i2;
        int i3;
        LayoutState layoutState = this.mLayoutState;
        boolean z = false;
        layoutState.mAvailable = 0;
        layoutState.mCurrentPosition = anchorPosition;
        RecyclerView.SmoothScroller smoothScroller = this.mSmoothScroller;
        if (!(smoothScroller != null && smoothScroller.mRunning) || (i3 = state.mTargetPosition) == -1) {
            i2 = 0;
            i = 0;
        } else {
            if (this.mShouldReverseLayout == (i3 < anchorPosition)) {
                i2 = this.mPrimaryOrientation.getTotalSpace();
                i = 0;
            } else {
                i = this.mPrimaryOrientation.getTotalSpace();
                i2 = 0;
            }
        }
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView != null && recyclerView.mClipToPadding) {
            this.mLayoutState.mStartLine = this.mPrimaryOrientation.getStartAfterPadding() - i;
            this.mLayoutState.mEndLine = this.mPrimaryOrientation.getEndAfterPadding() + i2;
        } else {
            this.mLayoutState.mEndLine = this.mPrimaryOrientation.getEnd() + i2;
            this.mLayoutState.mStartLine = -i;
        }
        LayoutState layoutState2 = this.mLayoutState;
        layoutState2.mStopInFocusable = false;
        layoutState2.mRecycle = true;
        if (this.mPrimaryOrientation.getMode() == 0 && this.mPrimaryOrientation.getEnd() == 0) {
            z = true;
        }
        layoutState2.mInfinite = z;
    }

    public final void updateRemainingSpans(Span span, int layoutDir, int targetLine) {
        int i = span.mDeletedSize;
        if (layoutDir == -1) {
            int i2 = span.mCachedStart;
            if (i2 == Integer.MIN_VALUE) {
                span.calculateCachedStart();
                i2 = span.mCachedStart;
            }
            if (i2 + i <= targetLine) {
                this.mRemainingSpans.set(span.mIndex, false);
                return;
            }
            return;
        }
        int i3 = span.mCachedEnd;
        if (i3 == Integer.MIN_VALUE) {
            span.calculateCachedEnd();
            i3 = span.mCachedEnd;
        }
        if (i3 - i >= targetLine) {
            this.mRemainingSpans.set(span.mIndex, false);
        }
    }

    public final int updateSpecWithExtra(int spec, int startInset, int endInset) {
        if (startInset == 0 && endInset == 0) {
            return spec;
        }
        int mode = View.MeasureSpec.getMode(spec);
        return (mode == Integer.MIN_VALUE || mode == 1073741824) ? View.MeasureSpec.makeMeasureSpec(Math.max(0, (View.MeasureSpec.getSize(spec) - startInset) - endInset), mode) : spec;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public RecyclerView.LayoutParams generateLayoutParams(ViewGroup.LayoutParams lp) {
        if (lp instanceof ViewGroup.MarginLayoutParams) {
            return new LayoutParams((ViewGroup.MarginLayoutParams) lp);
        }
        return new LayoutParams(lp);
    }

    /* JADX WARN: Code restructure failed: missing block: B:234:0x040c, code lost:
        if (checkForGaps() != false) goto L236;
     */
    /* JADX WARN: Removed duplicated region for block: B:107:0x01b9  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onLayoutChildren(androidx.recyclerview.widget.RecyclerView.Recycler r12, androidx.recyclerview.widget.RecyclerView.State r13, boolean r14) {
        /*
            Method dump skipped, instructions count: 1070
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.StaggeredGridLayoutManager.onLayoutChildren(androidx.recyclerview.widget.RecyclerView$Recycler, androidx.recyclerview.widget.RecyclerView$State, boolean):void");
    }

    /* loaded from: classes.dex */
    public static class LazySpanLookup {
        public int[] mData;
        public List<FullSpanItem> mFullSpanItems;

        public void clear() {
            int[] iArr = this.mData;
            if (iArr != null) {
                Arrays.fill(iArr, -1);
            }
            this.mFullSpanItems = null;
        }

        public void ensureSize(int position) {
            int[] iArr = this.mData;
            if (iArr == null) {
                int[] iArr2 = new int[Math.max(position, 10) + 1];
                this.mData = iArr2;
                Arrays.fill(iArr2, -1);
            } else if (position >= iArr.length) {
                int length = iArr.length;
                while (length <= position) {
                    length *= 2;
                }
                int[] iArr3 = new int[length];
                this.mData = iArr3;
                System.arraycopy(iArr, 0, iArr3, 0, iArr.length);
                int[] iArr4 = this.mData;
                Arrays.fill(iArr4, iArr.length, iArr4.length, -1);
            }
        }

        public FullSpanItem getFullSpanItem(int position) {
            List<FullSpanItem> list = this.mFullSpanItems;
            if (list == null) {
                return null;
            }
            for (int size = list.size() - 1; size >= 0; size--) {
                FullSpanItem fullSpanItem = this.mFullSpanItems.get(size);
                if (fullSpanItem.mPosition == position) {
                    return fullSpanItem;
                }
            }
            return null;
        }

        /* JADX WARN: Removed duplicated region for block: B:23:0x0048  */
        /* JADX WARN: Removed duplicated region for block: B:25:0x0052  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public int invalidateAfter(int r5) {
            /*
                r4 = this;
                int[] r0 = r4.mData
                r1 = -1
                if (r0 != 0) goto L6
                return r1
            L6:
                int r0 = r0.length
                if (r5 < r0) goto La
                return r1
            La:
                java.util.List<androidx.recyclerview.widget.StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem> r0 = r4.mFullSpanItems
                if (r0 != 0) goto L10
            Le:
                r0 = r1
                goto L46
            L10:
                androidx.recyclerview.widget.StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem r0 = r4.getFullSpanItem(r5)
                if (r0 == 0) goto L1b
                java.util.List<androidx.recyclerview.widget.StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem> r2 = r4.mFullSpanItems
                r2.remove(r0)
            L1b:
                java.util.List<androidx.recyclerview.widget.StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem> r0 = r4.mFullSpanItems
                int r0 = r0.size()
                r2 = 0
            L22:
                if (r2 >= r0) goto L34
                java.util.List<androidx.recyclerview.widget.StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem> r3 = r4.mFullSpanItems
                java.lang.Object r3 = r3.get(r2)
                androidx.recyclerview.widget.StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem r3 = (androidx.recyclerview.widget.StaggeredGridLayoutManager.LazySpanLookup.FullSpanItem) r3
                int r3 = r3.mPosition
                if (r3 < r5) goto L31
                goto L35
            L31:
                int r2 = r2 + 1
                goto L22
            L34:
                r2 = r1
            L35:
                if (r2 == r1) goto Le
                java.util.List<androidx.recyclerview.widget.StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem> r0 = r4.mFullSpanItems
                java.lang.Object r0 = r0.get(r2)
                androidx.recyclerview.widget.StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem r0 = (androidx.recyclerview.widget.StaggeredGridLayoutManager.LazySpanLookup.FullSpanItem) r0
                java.util.List<androidx.recyclerview.widget.StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem> r3 = r4.mFullSpanItems
                r3.remove(r2)
                int r0 = r0.mPosition
            L46:
                if (r0 != r1) goto L52
                int[] r0 = r4.mData
                int r2 = r0.length
                java.util.Arrays.fill(r0, r5, r2, r1)
                int[] r4 = r4.mData
                int r4 = r4.length
                return r4
            L52:
                int r0 = r0 + 1
                int[] r2 = r4.mData
                int r2 = r2.length
                int r0 = java.lang.Math.min(r0, r2)
                int[] r4 = r4.mData
                java.util.Arrays.fill(r4, r5, r0, r1)
                return r0
            */
            throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.StaggeredGridLayoutManager.LazySpanLookup.invalidateAfter(int):int");
        }

        public void offsetForAddition(int positionStart, int itemCount) {
            int[] iArr = this.mData;
            if (iArr != null && positionStart < iArr.length) {
                int i = positionStart + itemCount;
                ensureSize(i);
                int[] iArr2 = this.mData;
                System.arraycopy(iArr2, positionStart, iArr2, i, (iArr2.length - positionStart) - itemCount);
                Arrays.fill(this.mData, positionStart, i, -1);
                List<FullSpanItem> list = this.mFullSpanItems;
                if (list != null) {
                    for (int size = list.size() - 1; size >= 0; size--) {
                        FullSpanItem fullSpanItem = this.mFullSpanItems.get(size);
                        int i2 = fullSpanItem.mPosition;
                        if (i2 >= positionStart) {
                            fullSpanItem.mPosition = i2 + itemCount;
                        }
                    }
                }
            }
        }

        public void offsetForRemoval(int positionStart, int itemCount) {
            int[] iArr = this.mData;
            if (iArr != null && positionStart < iArr.length) {
                int i = positionStart + itemCount;
                ensureSize(i);
                int[] iArr2 = this.mData;
                System.arraycopy(iArr2, i, iArr2, positionStart, (iArr2.length - positionStart) - itemCount);
                int[] iArr3 = this.mData;
                Arrays.fill(iArr3, iArr3.length - itemCount, iArr3.length, -1);
                List<FullSpanItem> list = this.mFullSpanItems;
                if (list != null) {
                    for (int size = list.size() - 1; size >= 0; size--) {
                        FullSpanItem fullSpanItem = this.mFullSpanItems.get(size);
                        int i2 = fullSpanItem.mPosition;
                        if (i2 >= positionStart) {
                            if (i2 < i) {
                                this.mFullSpanItems.remove(size);
                            } else {
                                fullSpanItem.mPosition = i2 - itemCount;
                            }
                        }
                    }
                }
            }
        }

        @SuppressLint({"BanParcelableUsage"})
        /* loaded from: classes.dex */
        public static class FullSpanItem implements Parcelable {
            public static final Parcelable.Creator<FullSpanItem> CREATOR = new Parcelable.Creator<FullSpanItem>() { // from class: androidx.recyclerview.widget.StaggeredGridLayoutManager.LazySpanLookup.FullSpanItem.1
                @Override // android.os.Parcelable.Creator
                public FullSpanItem createFromParcel(Parcel in) {
                    return new FullSpanItem(in);
                }

                @Override // android.os.Parcelable.Creator
                public FullSpanItem[] newArray(int size) {
                    return new FullSpanItem[size];
                }
            };
            public int mGapDir;
            public int[] mGapPerSpan;
            public boolean mHasUnwantedGapAfter;
            public int mPosition;

            public FullSpanItem(Parcel in) {
                this.mPosition = in.readInt();
                this.mGapDir = in.readInt();
                this.mHasUnwantedGapAfter = in.readInt() != 1 ? false : true;
                int readInt = in.readInt();
                if (readInt > 0) {
                    int[] iArr = new int[readInt];
                    this.mGapPerSpan = iArr;
                    in.readIntArray(iArr);
                }
            }

            @Override // android.os.Parcelable
            public int describeContents() {
                return 0;
            }

            public String toString() {
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("FullSpanItem{mPosition=");
                m.append(this.mPosition);
                m.append(", mGapDir=");
                m.append(this.mGapDir);
                m.append(", mHasUnwantedGapAfter=");
                m.append(this.mHasUnwantedGapAfter);
                m.append(", mGapPerSpan=");
                m.append(Arrays.toString(this.mGapPerSpan));
                m.append('}');
                return m.toString();
            }

            @Override // android.os.Parcelable
            public void writeToParcel(Parcel dest, int flags) {
                dest.writeInt(this.mPosition);
                dest.writeInt(this.mGapDir);
                dest.writeInt(this.mHasUnwantedGapAfter ? 1 : 0);
                int[] iArr = this.mGapPerSpan;
                if (iArr == null || iArr.length <= 0) {
                    dest.writeInt(0);
                    return;
                }
                dest.writeInt(iArr.length);
                dest.writeIntArray(this.mGapPerSpan);
            }

            public FullSpanItem() {
            }
        }
    }
}
