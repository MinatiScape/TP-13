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
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.recyclerview.widget.GapWorker;
import androidx.recyclerview.widget.RecyclerView;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.BitSet;
import java.util.List;
import java.util.WeakHashMap;
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
    public final AnonymousClass1 mCheckForGapsRunnable = new Runnable() { // from class: androidx.recyclerview.widget.StaggeredGridLayoutManager.1
        @Override // java.lang.Runnable
        public final void run() {
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

        public final void reset() {
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

        public AnchorInfo() {
            reset();
        }
    }

    /* loaded from: classes.dex */
    public static class LayoutParams extends RecyclerView.LayoutParams {
        public Span mSpan;

        public LayoutParams(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
        }

        public LayoutParams(int i, int i2) {
            super(i, i2);
        }

        public LayoutParams(ViewGroup.MarginLayoutParams marginLayoutParams) {
            super(marginLayoutParams);
        }

        public LayoutParams(ViewGroup.LayoutParams layoutParams) {
            super(layoutParams);
        }
    }

    /* loaded from: classes.dex */
    public static class LazySpanLookup {
        public int[] mData;
        public List<FullSpanItem> mFullSpanItems;

        @SuppressLint({"BanParcelableUsage"})
        /* loaded from: classes.dex */
        public static class FullSpanItem implements Parcelable {
            public static final Parcelable.Creator<FullSpanItem> CREATOR = new Parcelable.Creator<FullSpanItem>() { // from class: androidx.recyclerview.widget.StaggeredGridLayoutManager.LazySpanLookup.FullSpanItem.1
                @Override // android.os.Parcelable.Creator
                public final FullSpanItem createFromParcel(Parcel parcel) {
                    return new FullSpanItem(parcel);
                }

                @Override // android.os.Parcelable.Creator
                public final FullSpanItem[] newArray(int i) {
                    return new FullSpanItem[i];
                }
            };
            public int mGapDir;
            public int[] mGapPerSpan;
            public boolean mHasUnwantedGapAfter;
            public int mPosition;

            public FullSpanItem(Parcel parcel) {
                this.mPosition = parcel.readInt();
                this.mGapDir = parcel.readInt();
                this.mHasUnwantedGapAfter = parcel.readInt() != 1 ? false : true;
                int readInt = parcel.readInt();
                if (readInt > 0) {
                    int[] iArr = new int[readInt];
                    this.mGapPerSpan = iArr;
                    parcel.readIntArray(iArr);
                }
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final String toString() {
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
            public final void writeToParcel(Parcel parcel, int i) {
                parcel.writeInt(this.mPosition);
                parcel.writeInt(this.mGapDir);
                parcel.writeInt(this.mHasUnwantedGapAfter ? 1 : 0);
                int[] iArr = this.mGapPerSpan;
                if (iArr == null || iArr.length <= 0) {
                    parcel.writeInt(0);
                    return;
                }
                parcel.writeInt(iArr.length);
                parcel.writeIntArray(this.mGapPerSpan);
            }

            public FullSpanItem() {
            }
        }

        public final void clear() {
            int[] iArr = this.mData;
            if (iArr != null) {
                Arrays.fill(iArr, -1);
            }
            this.mFullSpanItems = null;
        }

        public final void ensureSize(int i) {
            int[] iArr = this.mData;
            if (iArr == null) {
                int[] iArr2 = new int[Math.max(i, 10) + 1];
                this.mData = iArr2;
                Arrays.fill(iArr2, -1);
            } else if (i >= iArr.length) {
                int length = iArr.length;
                while (length <= i) {
                    length *= 2;
                }
                int[] iArr3 = new int[length];
                this.mData = iArr3;
                System.arraycopy(iArr, 0, iArr3, 0, iArr.length);
                int[] iArr4 = this.mData;
                Arrays.fill(iArr4, iArr.length, iArr4.length, -1);
            }
        }

        /* JADX WARN: Removed duplicated region for block: B:30:0x0061  */
        /* JADX WARN: Removed duplicated region for block: B:32:0x006b  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final int invalidateAfter(int r6) {
            /*
                r5 = this;
                int[] r0 = r5.mData
                r1 = -1
                if (r0 != 0) goto L6
                return r1
            L6:
                int r0 = r0.length
                if (r6 < r0) goto La
                return r1
            La:
                java.util.List<androidx.recyclerview.widget.StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem> r0 = r5.mFullSpanItems
                if (r0 != 0) goto Lf
                goto L5e
            Lf:
                r2 = 0
                if (r0 != 0) goto L13
                goto L2b
            L13:
                int r0 = r0.size()
                int r0 = r0 + r1
            L18:
                if (r0 < 0) goto L2b
                java.util.List<androidx.recyclerview.widget.StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem> r3 = r5.mFullSpanItems
                java.lang.Object r3 = r3.get(r0)
                androidx.recyclerview.widget.StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem r3 = (androidx.recyclerview.widget.StaggeredGridLayoutManager.LazySpanLookup.FullSpanItem) r3
                int r4 = r3.mPosition
                if (r4 != r6) goto L28
                r2 = r3
                goto L2b
            L28:
                int r0 = r0 + (-1)
                goto L18
            L2b:
                if (r2 == 0) goto L32
                java.util.List<androidx.recyclerview.widget.StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem> r0 = r5.mFullSpanItems
                r0.remove(r2)
            L32:
                java.util.List<androidx.recyclerview.widget.StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem> r0 = r5.mFullSpanItems
                int r0 = r0.size()
                r2 = 0
            L39:
                if (r2 >= r0) goto L4b
                java.util.List<androidx.recyclerview.widget.StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem> r3 = r5.mFullSpanItems
                java.lang.Object r3 = r3.get(r2)
                androidx.recyclerview.widget.StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem r3 = (androidx.recyclerview.widget.StaggeredGridLayoutManager.LazySpanLookup.FullSpanItem) r3
                int r3 = r3.mPosition
                if (r3 < r6) goto L48
                goto L4c
            L48:
                int r2 = r2 + 1
                goto L39
            L4b:
                r2 = r1
            L4c:
                if (r2 == r1) goto L5e
                java.util.List<androidx.recyclerview.widget.StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem> r0 = r5.mFullSpanItems
                java.lang.Object r0 = r0.get(r2)
                androidx.recyclerview.widget.StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem r0 = (androidx.recyclerview.widget.StaggeredGridLayoutManager.LazySpanLookup.FullSpanItem) r0
                java.util.List<androidx.recyclerview.widget.StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem> r3 = r5.mFullSpanItems
                r3.remove(r2)
                int r0 = r0.mPosition
                goto L5f
            L5e:
                r0 = r1
            L5f:
                if (r0 != r1) goto L6b
                int[] r0 = r5.mData
                int r2 = r0.length
                java.util.Arrays.fill(r0, r6, r2, r1)
                int[] r5 = r5.mData
                int r5 = r5.length
                return r5
            L6b:
                int r0 = r0 + 1
                int[] r2 = r5.mData
                int r2 = r2.length
                int r0 = java.lang.Math.min(r0, r2)
                int[] r5 = r5.mData
                java.util.Arrays.fill(r5, r6, r0, r1)
                return r0
            */
            throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.StaggeredGridLayoutManager.LazySpanLookup.invalidateAfter(int):int");
        }

        public final void offsetForAddition(int i, int i2) {
            int[] iArr = this.mData;
            if (iArr != null && i < iArr.length) {
                int i3 = i + i2;
                ensureSize(i3);
                int[] iArr2 = this.mData;
                System.arraycopy(iArr2, i, iArr2, i3, (iArr2.length - i) - i2);
                Arrays.fill(this.mData, i, i3, -1);
                List<FullSpanItem> list = this.mFullSpanItems;
                if (list != null) {
                    for (int size = list.size() - 1; size >= 0; size--) {
                        FullSpanItem fullSpanItem = this.mFullSpanItems.get(size);
                        int i4 = fullSpanItem.mPosition;
                        if (i4 >= i) {
                            fullSpanItem.mPosition = i4 + i2;
                        }
                    }
                }
            }
        }

        public final void offsetForRemoval(int i, int i2) {
            int[] iArr = this.mData;
            if (iArr != null && i < iArr.length) {
                int i3 = i + i2;
                ensureSize(i3);
                int[] iArr2 = this.mData;
                System.arraycopy(iArr2, i3, iArr2, i, (iArr2.length - i) - i2);
                int[] iArr3 = this.mData;
                Arrays.fill(iArr3, iArr3.length - i2, iArr3.length, -1);
                List<FullSpanItem> list = this.mFullSpanItems;
                if (list != null) {
                    for (int size = list.size() - 1; size >= 0; size--) {
                        FullSpanItem fullSpanItem = this.mFullSpanItems.get(size);
                        int i4 = fullSpanItem.mPosition;
                        if (i4 >= i) {
                            if (i4 < i3) {
                                this.mFullSpanItems.remove(size);
                            } else {
                                fullSpanItem.mPosition = i4 - i2;
                            }
                        }
                    }
                }
            }
        }
    }

    @SuppressLint({"BanParcelableUsage"})
    /* loaded from: classes.dex */
    public static class SavedState implements Parcelable {
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: androidx.recyclerview.widget.StaggeredGridLayoutManager.SavedState.1
            @Override // android.os.Parcelable.Creator
            public final SavedState createFromParcel(Parcel parcel) {
                return new SavedState(parcel);
            }

            @Override // android.os.Parcelable.Creator
            public final SavedState[] newArray(int i) {
                return new SavedState[i];
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
        public final int describeContents() {
            return 0;
        }

        public SavedState(Parcel parcel) {
            this.mAnchorPosition = parcel.readInt();
            this.mVisibleAnchorPosition = parcel.readInt();
            int readInt = parcel.readInt();
            this.mSpanOffsetsSize = readInt;
            if (readInt > 0) {
                int[] iArr = new int[readInt];
                this.mSpanOffsets = iArr;
                parcel.readIntArray(iArr);
            }
            int readInt2 = parcel.readInt();
            this.mSpanLookupSize = readInt2;
            if (readInt2 > 0) {
                int[] iArr2 = new int[readInt2];
                this.mSpanLookup = iArr2;
                parcel.readIntArray(iArr2);
            }
            boolean z = false;
            this.mReverseLayout = parcel.readInt() == 1;
            this.mAnchorLayoutFromEnd = parcel.readInt() == 1;
            this.mLastLayoutRTL = parcel.readInt() == 1 ? true : z;
            this.mFullSpanItems = parcel.readArrayList(LazySpanLookup.FullSpanItem.class.getClassLoader());
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i) {
            parcel.writeInt(this.mAnchorPosition);
            parcel.writeInt(this.mVisibleAnchorPosition);
            parcel.writeInt(this.mSpanOffsetsSize);
            if (this.mSpanOffsetsSize > 0) {
                parcel.writeIntArray(this.mSpanOffsets);
            }
            parcel.writeInt(this.mSpanLookupSize);
            if (this.mSpanLookupSize > 0) {
                parcel.writeIntArray(this.mSpanLookup);
            }
            parcel.writeInt(this.mReverseLayout ? 1 : 0);
            parcel.writeInt(this.mAnchorLayoutFromEnd ? 1 : 0);
            parcel.writeInt(this.mLastLayoutRTL ? 1 : 0);
            parcel.writeList(this.mFullSpanItems);
        }

        public SavedState(SavedState savedState) {
            this.mSpanOffsetsSize = savedState.mSpanOffsetsSize;
            this.mAnchorPosition = savedState.mAnchorPosition;
            this.mVisibleAnchorPosition = savedState.mVisibleAnchorPosition;
            this.mSpanOffsets = savedState.mSpanOffsets;
            this.mSpanLookupSize = savedState.mSpanLookupSize;
            this.mSpanLookup = savedState.mSpanLookup;
            this.mReverseLayout = savedState.mReverseLayout;
            this.mAnchorLayoutFromEnd = savedState.mAnchorLayoutFromEnd;
            this.mLastLayoutRTL = savedState.mLastLayoutRTL;
            this.mFullSpanItems = savedState.mFullSpanItems;
        }
    }

    /* loaded from: classes.dex */
    public class Span {
        public final int mIndex;
        public ArrayList<View> mViews = new ArrayList<>();
        public int mCachedStart = RecyclerView.UNDEFINED_DURATION;
        public int mCachedEnd = RecyclerView.UNDEFINED_DURATION;
        public int mDeletedSize = 0;

        public final View getFocusableViewAfter(int i, int i2) {
            View view = null;
            if (i2 != -1) {
                int size = this.mViews.size() - 1;
                while (size >= 0) {
                    View view2 = this.mViews.get(size);
                    if ((StaggeredGridLayoutManager.this.mReverseLayout && RecyclerView.LayoutManager.getPosition(view2) >= i) || ((!StaggeredGridLayoutManager.this.mReverseLayout && RecyclerView.LayoutManager.getPosition(view2) <= i) || !view2.hasFocusable())) {
                        break;
                    }
                    size--;
                    view = view2;
                }
            } else {
                int size2 = this.mViews.size();
                int i3 = 0;
                while (i3 < size2) {
                    View view3 = this.mViews.get(i3);
                    if ((StaggeredGridLayoutManager.this.mReverseLayout && RecyclerView.LayoutManager.getPosition(view3) <= i) || ((!StaggeredGridLayoutManager.this.mReverseLayout && RecyclerView.LayoutManager.getPosition(view3) >= i) || !view3.hasFocusable())) {
                        break;
                    }
                    i3++;
                    view = view3;
                }
            }
            return view;
        }

        public Span(int i) {
            this.mIndex = i;
        }

        public final void calculateCachedEnd() {
            ArrayList<View> arrayList = this.mViews;
            View view = arrayList.get(arrayList.size() - 1);
            LayoutParams layoutParams = getLayoutParams(view);
            this.mCachedEnd = StaggeredGridLayoutManager.this.mPrimaryOrientation.getDecoratedEnd(view);
            layoutParams.getClass();
        }

        public final void clear() {
            this.mViews.clear();
            this.mCachedStart = RecyclerView.UNDEFINED_DURATION;
            this.mCachedEnd = RecyclerView.UNDEFINED_DURATION;
            this.mDeletedSize = 0;
        }

        public final int findFirstPartiallyVisibleItemPosition() {
            if (StaggeredGridLayoutManager.this.mReverseLayout) {
                return findOnePartiallyVisibleChild(this.mViews.size() - 1, -1);
            }
            return findOnePartiallyVisibleChild(0, this.mViews.size());
        }

        public final int findLastPartiallyVisibleItemPosition() {
            if (StaggeredGridLayoutManager.this.mReverseLayout) {
                return findOnePartiallyVisibleChild(0, this.mViews.size());
            }
            return findOnePartiallyVisibleChild(this.mViews.size() - 1, -1);
        }

        public final int findOnePartiallyVisibleChild(int i, int i2) {
            int i3;
            boolean z;
            int startAfterPadding = StaggeredGridLayoutManager.this.mPrimaryOrientation.getStartAfterPadding();
            int endAfterPadding = StaggeredGridLayoutManager.this.mPrimaryOrientation.getEndAfterPadding();
            if (i2 > i) {
                i3 = 1;
            } else {
                i3 = -1;
            }
            while (i != i2) {
                View view = this.mViews.get(i);
                int decoratedStart = StaggeredGridLayoutManager.this.mPrimaryOrientation.getDecoratedStart(view);
                int decoratedEnd = StaggeredGridLayoutManager.this.mPrimaryOrientation.getDecoratedEnd(view);
                boolean z2 = false;
                if (decoratedStart <= endAfterPadding) {
                    z = true;
                } else {
                    z = false;
                }
                if (decoratedEnd >= startAfterPadding) {
                    z2 = true;
                }
                if (!z || !z2 || (decoratedStart >= startAfterPadding && decoratedEnd <= endAfterPadding)) {
                    i += i3;
                } else {
                    StaggeredGridLayoutManager.this.getClass();
                    return RecyclerView.LayoutManager.getPosition(view);
                }
            }
            return -1;
        }

        public final int getEndLine(int i) {
            int i2 = this.mCachedEnd;
            if (i2 != Integer.MIN_VALUE) {
                return i2;
            }
            if (this.mViews.size() == 0) {
                return i;
            }
            calculateCachedEnd();
            return this.mCachedEnd;
        }

        public final int getStartLine(int i) {
            int i2 = this.mCachedStart;
            if (i2 != Integer.MIN_VALUE) {
                return i2;
            }
            if (this.mViews.size() == 0) {
                return i;
            }
            View view = this.mViews.get(0);
            LayoutParams layoutParams = getLayoutParams(view);
            this.mCachedStart = StaggeredGridLayoutManager.this.mPrimaryOrientation.getDecoratedStart(view);
            layoutParams.getClass();
            return this.mCachedStart;
        }

        public static LayoutParams getLayoutParams(View view) {
            return (LayoutParams) view.getLayoutParams();
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final RecyclerView.LayoutParams generateLayoutParams(Context context, AttributeSet attributeSet) {
        return new LayoutParams(context, attributeSet);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final void onItemsAdded(int i, int i2) {
        handleUpdate(i, i2, 1);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final void onItemsRemoved(int i, int i2) {
        handleUpdate(i, i2, 2);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final void onItemsUpdated(int i, int i2) {
        handleUpdate(i, i2, 4);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final void onLayoutChildren(RecyclerView.Recycler recycler, RecyclerView.State state) {
        onLayoutChildren(recycler, state, true);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final void onLayoutCompleted(RecyclerView.State state) {
        this.mPendingScrollPosition = -1;
        this.mPendingScrollPositionOffset = RecyclerView.UNDEFINED_DURATION;
        this.mPendingSavedState = null;
        this.mAnchorInfo.reset();
    }

    public final void prepareLayoutStateForDelta(int i, RecyclerView.State state) {
        int i2;
        int i3;
        if (i > 0) {
            i3 = getLastChildPosition();
            i2 = 1;
        } else {
            i2 = -1;
            i3 = getFirstChildPosition();
        }
        this.mLayoutState.mRecycle = true;
        updateLayoutState(i3, state);
        setLayoutStateDirection(i2);
        LayoutState layoutState = this.mLayoutState;
        layoutState.mCurrentPosition = i3 + layoutState.mItemDirection;
        layoutState.mAvailable = Math.abs(i);
    }

    public static int updateSpecWithExtra(int i, int i2, int i3) {
        if (i2 == 0 && i3 == 0) {
            return i;
        }
        int mode = View.MeasureSpec.getMode(i);
        if (mode == Integer.MIN_VALUE || mode == 1073741824) {
            return View.MeasureSpec.makeMeasureSpec(Math.max(0, (View.MeasureSpec.getSize(i) - i2) - i3), mode);
        }
        return i;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final void assertNotInLayoutOrScroll(String str) {
        if (this.mPendingSavedState == null) {
            super.assertNotInLayoutOrScroll(str);
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final boolean canScrollHorizontally() {
        if (this.mOrientation == 0) {
            return true;
        }
        return false;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final boolean canScrollVertically() {
        if (this.mOrientation == 1) {
            return true;
        }
        return false;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final void collectAdjacentPrefetchPositions(int i, int i2, RecyclerView.State state, RecyclerView.LayoutManager.LayoutPrefetchRegistry layoutPrefetchRegistry) {
        boolean z;
        int i3;
        int i4;
        if (this.mOrientation != 0) {
            i = i2;
        }
        if (!(getChildCount() == 0 || i == 0)) {
            prepareLayoutStateForDelta(i, state);
            int[] iArr = this.mPrefetchDistances;
            if (iArr == null || iArr.length < this.mSpanCount) {
                this.mPrefetchDistances = new int[this.mSpanCount];
            }
            int i5 = 0;
            for (int i6 = 0; i6 < this.mSpanCount; i6++) {
                LayoutState layoutState = this.mLayoutState;
                if (layoutState.mItemDirection == -1) {
                    i4 = layoutState.mStartLine;
                    i3 = this.mSpans[i6].getStartLine(i4);
                } else {
                    i4 = this.mSpans[i6].getEndLine(layoutState.mEndLine);
                    i3 = this.mLayoutState.mEndLine;
                }
                int i7 = i4 - i3;
                if (i7 >= 0) {
                    this.mPrefetchDistances[i5] = i7;
                    i5++;
                }
            }
            Arrays.sort(this.mPrefetchDistances, 0, i5);
            for (int i8 = 0; i8 < i5; i8++) {
                int i9 = this.mLayoutState.mCurrentPosition;
                if (i9 < 0 || i9 >= state.getItemCount()) {
                    z = false;
                } else {
                    z = true;
                }
                if (z) {
                    ((GapWorker.LayoutPrefetchRegistryImpl) layoutPrefetchRegistry).addPosition(this.mLayoutState.mCurrentPosition, this.mPrefetchDistances[i8]);
                    LayoutState layoutState2 = this.mLayoutState;
                    layoutState2.mCurrentPosition += layoutState2.mItemDirection;
                } else {
                    return;
                }
            }
        }
    }

    public final int fill(RecyclerView.Recycler recycler, LayoutState layoutState, RecyclerView.State state) {
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        int i6;
        Span span;
        boolean z;
        int i7;
        int i8;
        int i9;
        int i10;
        int i11;
        int i12;
        int i13;
        int i14;
        int i15 = 0;
        this.mRemainingSpans.set(0, this.mSpanCount, true);
        if (this.mLayoutState.mInfinite) {
            if (layoutState.mLayoutDirection == 1) {
                i = Integer.MAX_VALUE;
            } else {
                i = RecyclerView.UNDEFINED_DURATION;
            }
        } else if (layoutState.mLayoutDirection == 1) {
            i = layoutState.mEndLine + layoutState.mAvailable;
        } else {
            i = layoutState.mStartLine - layoutState.mAvailable;
        }
        int i16 = layoutState.mLayoutDirection;
        for (int i17 = 0; i17 < this.mSpanCount; i17++) {
            if (!this.mSpans[i17].mViews.isEmpty()) {
                updateRemainingSpans(this.mSpans[i17], i16, i);
            }
        }
        if (this.mShouldReverseLayout) {
            i2 = this.mPrimaryOrientation.getEndAfterPadding();
        } else {
            i2 = this.mPrimaryOrientation.getStartAfterPadding();
        }
        Object[] objArr = null;
        while (true) {
            int i18 = layoutState.mCurrentPosition;
            if (i18 < 0 || i18 >= state.getItemCount()) {
                i3 = i15;
            } else {
                i3 = 1;
            }
            if (i3 == 0 || (!this.mLayoutState.mInfinite && this.mRemainingSpans.isEmpty())) {
                break;
            }
            View view = recycler.tryGetViewHolderForPositionByDeadline(layoutState.mCurrentPosition, RecyclerView.FOREVER_NS).itemView;
            layoutState.mCurrentPosition += layoutState.mItemDirection;
            LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
            int viewLayoutPosition = layoutParams.getViewLayoutPosition();
            int[] iArr = this.mLazySpanLookup.mData;
            if (iArr == null || viewLayoutPosition >= iArr.length) {
                i5 = -1;
            } else {
                i5 = iArr[viewLayoutPosition];
            }
            if (i5 == -1) {
                i6 = 1;
            } else {
                i6 = i15;
            }
            if (i6 != 0) {
                if (preferLastSpan(layoutState.mLayoutDirection)) {
                    i12 = -1;
                    i13 = this.mSpanCount - 1;
                    i14 = -1;
                } else {
                    i14 = this.mSpanCount;
                    i13 = i15;
                    i12 = 1;
                }
                Span span2 = null;
                if (layoutState.mLayoutDirection == 1) {
                    int startAfterPadding = this.mPrimaryOrientation.getStartAfterPadding();
                    int i19 = Integer.MAX_VALUE;
                    while (i13 != i14) {
                        Span span3 = this.mSpans[i13];
                        int endLine = span3.getEndLine(startAfterPadding);
                        if (endLine < i19) {
                            span2 = span3;
                            i19 = endLine;
                        }
                        i13 += i12;
                    }
                } else {
                    int endAfterPadding = this.mPrimaryOrientation.getEndAfterPadding();
                    int i20 = RecyclerView.UNDEFINED_DURATION;
                    while (i13 != i14) {
                        Span span4 = this.mSpans[i13];
                        int startLine = span4.getStartLine(endAfterPadding);
                        if (startLine > i20) {
                            span2 = span4;
                            i20 = startLine;
                        }
                        i13 += i12;
                    }
                }
                span = span2;
                LazySpanLookup lazySpanLookup = this.mLazySpanLookup;
                lazySpanLookup.ensureSize(viewLayoutPosition);
                lazySpanLookup.mData[viewLayoutPosition] = span.mIndex;
            } else {
                span = this.mSpans[i5];
            }
            layoutParams.mSpan = span;
            if (layoutState.mLayoutDirection == 1) {
                z = false;
                addViewInt(view, -1, false);
            } else {
                z = false;
                addViewInt(view, 0, false);
            }
            if (this.mOrientation == 1) {
                int i21 = this.mSizePerSpan;
                int i22 = this.mWidthMode;
                int i23 = ((ViewGroup.MarginLayoutParams) layoutParams).width;
                int i24 = z ? 1 : 0;
                int i25 = z ? 1 : 0;
                measureChildWithDecorationsAndMargin(view, RecyclerView.LayoutManager.getChildMeasureSpec(i21, i22, i24, i23, z), RecyclerView.LayoutManager.getChildMeasureSpec(this.mHeight, this.mHeightMode, getPaddingBottom() + getPaddingTop(), ((ViewGroup.MarginLayoutParams) layoutParams).height, true), z);
            } else {
                measureChildWithDecorationsAndMargin(view, RecyclerView.LayoutManager.getChildMeasureSpec(this.mWidth, this.mWidthMode, getPaddingRight() + getPaddingLeft(), ((ViewGroup.MarginLayoutParams) layoutParams).width, true), RecyclerView.LayoutManager.getChildMeasureSpec(this.mSizePerSpan, this.mHeightMode, 0, ((ViewGroup.MarginLayoutParams) layoutParams).height, false), false);
            }
            if (layoutState.mLayoutDirection == 1) {
                i8 = span.getEndLine(i2);
                i7 = this.mPrimaryOrientation.getDecoratedMeasurement(view) + i8;
            } else {
                i7 = span.getStartLine(i2);
                i8 = i7 - this.mPrimaryOrientation.getDecoratedMeasurement(view);
            }
            if (layoutState.mLayoutDirection == 1) {
                Span span5 = layoutParams.mSpan;
                span5.getClass();
                LayoutParams layoutParams2 = (LayoutParams) view.getLayoutParams();
                layoutParams2.mSpan = span5;
                span5.mViews.add(view);
                span5.mCachedEnd = RecyclerView.UNDEFINED_DURATION;
                if (span5.mViews.size() == 1) {
                    span5.mCachedStart = RecyclerView.UNDEFINED_DURATION;
                }
                if (layoutParams2.isItemRemoved() || layoutParams2.isItemChanged()) {
                    span5.mDeletedSize = StaggeredGridLayoutManager.this.mPrimaryOrientation.getDecoratedMeasurement(view) + span5.mDeletedSize;
                }
            } else {
                Span span6 = layoutParams.mSpan;
                span6.getClass();
                LayoutParams layoutParams3 = (LayoutParams) view.getLayoutParams();
                layoutParams3.mSpan = span6;
                span6.mViews.add(0, view);
                span6.mCachedStart = RecyclerView.UNDEFINED_DURATION;
                if (span6.mViews.size() == 1) {
                    span6.mCachedEnd = RecyclerView.UNDEFINED_DURATION;
                }
                if (layoutParams3.isItemRemoved() || layoutParams3.isItemChanged()) {
                    span6.mDeletedSize = StaggeredGridLayoutManager.this.mPrimaryOrientation.getDecoratedMeasurement(view) + span6.mDeletedSize;
                }
            }
            if (!isLayoutRTL() || this.mOrientation != 1) {
                i9 = this.mSecondaryOrientation.getStartAfterPadding() + (span.mIndex * this.mSizePerSpan);
                i10 = this.mSecondaryOrientation.getDecoratedMeasurement(view) + i9;
            } else {
                i10 = this.mSecondaryOrientation.getEndAfterPadding() - (((this.mSpanCount - 1) - span.mIndex) * this.mSizePerSpan);
                i9 = i10 - this.mSecondaryOrientation.getDecoratedMeasurement(view);
            }
            if (this.mOrientation == 1) {
                RecyclerView.LayoutManager.layoutDecoratedWithMargins(view, i9, i8, i10, i7);
            } else {
                RecyclerView.LayoutManager.layoutDecoratedWithMargins(view, i8, i9, i7, i10);
            }
            updateRemainingSpans(span, this.mLayoutState.mLayoutDirection, i);
            recycle(recycler, this.mLayoutState);
            if (!this.mLayoutState.mStopInFocusable || !view.hasFocusable()) {
                i11 = 0;
            } else {
                i11 = 0;
                this.mRemainingSpans.set(span.mIndex, false);
            }
            objArr = 1;
            i15 = i11;
        }
        int i26 = i15;
        if (objArr == null) {
            recycle(recycler, this.mLayoutState);
        }
        if (this.mLayoutState.mLayoutDirection == -1) {
            i4 = this.mPrimaryOrientation.getStartAfterPadding() - getMinStart(this.mPrimaryOrientation.getStartAfterPadding());
        } else {
            i4 = getMaxEnd(this.mPrimaryOrientation.getEndAfterPadding()) - this.mPrimaryOrientation.getEndAfterPadding();
        }
        if (i4 > 0) {
            return Math.min(layoutState.mAvailable, i4);
        }
        return i26;
    }

    public final View findFirstVisibleItemClosestToEnd(boolean z) {
        int startAfterPadding = this.mPrimaryOrientation.getStartAfterPadding();
        int endAfterPadding = this.mPrimaryOrientation.getEndAfterPadding();
        View view = null;
        for (int childCount = getChildCount() - 1; childCount >= 0; childCount--) {
            View childAt = getChildAt(childCount);
            int decoratedStart = this.mPrimaryOrientation.getDecoratedStart(childAt);
            int decoratedEnd = this.mPrimaryOrientation.getDecoratedEnd(childAt);
            if (decoratedEnd > startAfterPadding && decoratedStart < endAfterPadding) {
                if (decoratedEnd <= endAfterPadding || !z) {
                    return childAt;
                }
                if (view == null) {
                    view = childAt;
                }
            }
        }
        return view;
    }

    public final View findFirstVisibleItemClosestToStart(boolean z) {
        int startAfterPadding = this.mPrimaryOrientation.getStartAfterPadding();
        int endAfterPadding = this.mPrimaryOrientation.getEndAfterPadding();
        int childCount = getChildCount();
        View view = null;
        for (int i = 0; i < childCount; i++) {
            View childAt = getChildAt(i);
            int decoratedStart = this.mPrimaryOrientation.getDecoratedStart(childAt);
            if (this.mPrimaryOrientation.getDecoratedEnd(childAt) > startAfterPadding && decoratedStart < endAfterPadding) {
                if (decoratedStart >= startAfterPadding || !z) {
                    return childAt;
                }
                if (view == null) {
                    view = childAt;
                }
            }
        }
        return view;
    }

    public final void fixEndGap(RecyclerView.Recycler recycler, RecyclerView.State state, boolean z) {
        int endAfterPadding;
        int maxEnd = getMaxEnd(RecyclerView.UNDEFINED_DURATION);
        if (maxEnd != Integer.MIN_VALUE && (endAfterPadding = this.mPrimaryOrientation.getEndAfterPadding() - maxEnd) > 0) {
            int i = endAfterPadding - (-scrollBy(-endAfterPadding, recycler, state));
            if (z && i > 0) {
                this.mPrimaryOrientation.offsetChildren(i);
            }
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final RecyclerView.LayoutParams generateDefaultLayoutParams() {
        if (this.mOrientation == 0) {
            return new LayoutParams(-2, -1);
        }
        return new LayoutParams(-1, -2);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final RecyclerView.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        if (layoutParams instanceof ViewGroup.MarginLayoutParams) {
            return new LayoutParams((ViewGroup.MarginLayoutParams) layoutParams);
        }
        return new LayoutParams(layoutParams);
    }

    public final int getMaxEnd(int i) {
        int endLine = this.mSpans[0].getEndLine(i);
        for (int i2 = 1; i2 < this.mSpanCount; i2++) {
            int endLine2 = this.mSpans[i2].getEndLine(i);
            if (endLine2 > endLine) {
                endLine = endLine2;
            }
        }
        return endLine;
    }

    public final int getMinStart(int i) {
        int startLine = this.mSpans[0].getStartLine(i);
        for (int i2 = 1; i2 < this.mSpanCount; i2++) {
            int startLine2 = this.mSpans[i2].getStartLine(i);
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

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final boolean isAutoMeasureEnabled() {
        if (this.mGapStrategy != 0) {
            return true;
        }
        return false;
    }

    public final void measureChildWithDecorationsAndMargin(View view, int i, int i2, boolean z) {
        Rect rect = this.mTmpRect;
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView == null) {
            rect.set(0, 0, 0, 0);
        } else {
            rect.set(recyclerView.getItemDecorInsetsForChild(view));
        }
        LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
        int i3 = ((ViewGroup.MarginLayoutParams) layoutParams).leftMargin;
        Rect rect2 = this.mTmpRect;
        int updateSpecWithExtra = updateSpecWithExtra(i, i3 + rect2.left, ((ViewGroup.MarginLayoutParams) layoutParams).rightMargin + rect2.right);
        int i4 = ((ViewGroup.MarginLayoutParams) layoutParams).topMargin;
        Rect rect3 = this.mTmpRect;
        int updateSpecWithExtra2 = updateSpecWithExtra(i2, i4 + rect3.top, ((ViewGroup.MarginLayoutParams) layoutParams).bottomMargin + rect3.bottom);
        if (shouldMeasureChild(view, updateSpecWithExtra, updateSpecWithExtra2, layoutParams)) {
            view.measure(updateSpecWithExtra, updateSpecWithExtra2);
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final void onAdapterChanged() {
        this.mLazySpanLookup.clear();
        for (int i = 0; i < this.mSpanCount; i++) {
            this.mSpans[i].clear();
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final void onDetachedFromWindow(RecyclerView recyclerView) {
        AnonymousClass1 r0 = this.mCheckForGapsRunnable;
        RecyclerView recyclerView2 = this.mRecyclerView;
        if (recyclerView2 != null) {
            recyclerView2.removeCallbacks(r0);
        }
        for (int i = 0; i < this.mSpanCount; i++) {
            this.mSpans[i].clear();
        }
        recyclerView.requestLayout();
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final void onItemsChanged() {
        this.mLazySpanLookup.clear();
        requestLayout();
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final void onItemsMoved(int i, int i2) {
        handleUpdate(i, i2, 8);
    }

    /* JADX WARN: Code restructure failed: missing block: B:238:0x041f, code lost:
        if (checkForGaps() != false) goto L240;
     */
    /* JADX WARN: Removed duplicated region for block: B:111:0x01cc  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onLayoutChildren(androidx.recyclerview.widget.RecyclerView.Recycler r12, androidx.recyclerview.widget.RecyclerView.State r13, boolean r14) {
        /*
            Method dump skipped, instructions count: 1089
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.StaggeredGridLayoutManager.onLayoutChildren(androidx.recyclerview.widget.RecyclerView$Recycler, androidx.recyclerview.widget.RecyclerView$State, boolean):void");
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final void onRestoreInstanceState(Parcelable parcelable) {
        if (parcelable instanceof SavedState) {
            SavedState savedState = (SavedState) parcelable;
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
    public final Parcelable onSaveInstanceState() {
        int i;
        View view;
        int i2;
        int i3;
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
        int i4 = -1;
        if (getChildCount() > 0) {
            if (this.mLastLayoutFromEnd) {
                i = getLastChildPosition();
            } else {
                i = getFirstChildPosition();
            }
            savedState2.mAnchorPosition = i;
            if (this.mShouldReverseLayout) {
                view = findFirstVisibleItemClosestToEnd(true);
            } else {
                view = findFirstVisibleItemClosestToStart(true);
            }
            if (view != null) {
                i4 = RecyclerView.LayoutManager.getPosition(view);
            }
            savedState2.mVisibleAnchorPosition = i4;
            int i5 = this.mSpanCount;
            savedState2.mSpanOffsetsSize = i5;
            savedState2.mSpanOffsets = new int[i5];
            for (int i6 = 0; i6 < this.mSpanCount; i6++) {
                if (this.mLastLayoutFromEnd) {
                    i2 = this.mSpans[i6].getEndLine(RecyclerView.UNDEFINED_DURATION);
                    if (i2 != Integer.MIN_VALUE) {
                        i3 = this.mPrimaryOrientation.getEndAfterPadding();
                        i2 -= i3;
                        savedState2.mSpanOffsets[i6] = i2;
                    } else {
                        savedState2.mSpanOffsets[i6] = i2;
                    }
                } else {
                    i2 = this.mSpans[i6].getStartLine(RecyclerView.UNDEFINED_DURATION);
                    if (i2 != Integer.MIN_VALUE) {
                        i3 = this.mPrimaryOrientation.getStartAfterPadding();
                        i2 -= i3;
                        savedState2.mSpanOffsets[i6] = i2;
                    } else {
                        savedState2.mSpanOffsets[i6] = i2;
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
    public final void onScrollStateChanged(int i) {
        if (i == 0) {
            checkForGaps();
        }
    }

    public final boolean preferLastSpan(int i) {
        boolean z;
        boolean z2;
        boolean z3;
        if (this.mOrientation == 0) {
            if (i == -1) {
                z3 = true;
            } else {
                z3 = false;
            }
            if (z3 != this.mShouldReverseLayout) {
                return true;
            }
            return false;
        }
        if (i == -1) {
            z = true;
        } else {
            z = false;
        }
        if (z == this.mShouldReverseLayout) {
            z2 = true;
        } else {
            z2 = false;
        }
        if (z2 == isLayoutRTL()) {
            return true;
        }
        return false;
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

    public final void resolveShouldLayoutReverse() {
        if (this.mOrientation == 1 || !isLayoutRTL()) {
            this.mShouldReverseLayout = this.mReverseLayout;
        } else {
            this.mShouldReverseLayout = !this.mReverseLayout;
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final void scrollToPosition(int i) {
        SavedState savedState = this.mPendingSavedState;
        if (!(savedState == null || savedState.mAnchorPosition == i)) {
            savedState.mSpanOffsets = null;
            savedState.mSpanOffsetsSize = 0;
            savedState.mAnchorPosition = -1;
            savedState.mVisibleAnchorPosition = -1;
        }
        this.mPendingScrollPosition = i;
        this.mPendingScrollPositionOffset = RecyclerView.UNDEFINED_DURATION;
        requestLayout();
    }

    public final void setLayoutStateDirection(int i) {
        boolean z;
        LayoutState layoutState = this.mLayoutState;
        layoutState.mLayoutDirection = i;
        boolean z2 = this.mShouldReverseLayout;
        int i2 = 1;
        if (i == -1) {
            z = true;
        } else {
            z = false;
        }
        if (z2 != z) {
            i2 = -1;
        }
        layoutState.mItemDirection = i2;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final void smoothScrollToPosition(RecyclerView recyclerView, int i) {
        LinearSmoothScroller linearSmoothScroller = new LinearSmoothScroller(recyclerView.getContext());
        linearSmoothScroller.mTargetPosition = i;
        startSmoothScroll(linearSmoothScroller);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final boolean supportsPredictiveItemAnimations() {
        if (this.mPendingSavedState == null) {
            return true;
        }
        return false;
    }

    public final void updateLayoutState(int i, RecyclerView.State state) {
        boolean z;
        int i2;
        int i3;
        boolean z2;
        int i4;
        boolean z3;
        LayoutState layoutState = this.mLayoutState;
        boolean z4 = false;
        layoutState.mAvailable = 0;
        layoutState.mCurrentPosition = i;
        RecyclerView.SmoothScroller smoothScroller = this.mSmoothScroller;
        if (smoothScroller == null || !smoothScroller.mRunning) {
            z = false;
        } else {
            z = true;
        }
        if (!z || (i4 = state.mTargetPosition) == -1) {
            i3 = 0;
            i2 = 0;
        } else {
            boolean z5 = this.mShouldReverseLayout;
            if (i4 < i) {
                z3 = true;
            } else {
                z3 = false;
            }
            if (z5 == z3) {
                i3 = this.mPrimaryOrientation.getTotalSpace();
                i2 = 0;
            } else {
                i2 = this.mPrimaryOrientation.getTotalSpace();
                i3 = 0;
            }
        }
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView == null || !recyclerView.mClipToPadding) {
            z2 = false;
        } else {
            z2 = true;
        }
        if (z2) {
            this.mLayoutState.mStartLine = this.mPrimaryOrientation.getStartAfterPadding() - i2;
            this.mLayoutState.mEndLine = this.mPrimaryOrientation.getEndAfterPadding() + i3;
        } else {
            this.mLayoutState.mEndLine = this.mPrimaryOrientation.getEnd() + i3;
            this.mLayoutState.mStartLine = -i2;
        }
        LayoutState layoutState2 = this.mLayoutState;
        layoutState2.mStopInFocusable = false;
        layoutState2.mRecycle = true;
        if (this.mPrimaryOrientation.getMode() == 0 && this.mPrimaryOrientation.getEnd() == 0) {
            z4 = true;
        }
        layoutState2.mInfinite = z4;
    }

    public final void updateRemainingSpans(Span span, int i, int i2) {
        int i3 = span.mDeletedSize;
        if (i == -1) {
            int i4 = span.mCachedStart;
            if (i4 == Integer.MIN_VALUE) {
                View view = span.mViews.get(0);
                LayoutParams layoutParams = Span.getLayoutParams(view);
                span.mCachedStart = StaggeredGridLayoutManager.this.mPrimaryOrientation.getDecoratedStart(view);
                layoutParams.getClass();
                i4 = span.mCachedStart;
            }
            if (i4 + i3 <= i2) {
                this.mRemainingSpans.set(span.mIndex, false);
                return;
            }
            return;
        }
        int i5 = span.mCachedEnd;
        if (i5 == Integer.MIN_VALUE) {
            span.calculateCachedEnd();
            i5 = span.mCachedEnd;
        }
        if (i5 - i3 >= i2) {
            this.mRemainingSpans.set(span.mIndex, false);
        }
    }

    /* JADX WARN: Type inference failed for: r2v0, types: [androidx.recyclerview.widget.StaggeredGridLayoutManager$1] */
    public StaggeredGridLayoutManager(Context context, AttributeSet attributeSet, int i, int i2) {
        this.mSpanCount = -1;
        this.mReverseLayout = false;
        RecyclerView.LayoutManager.Properties properties = RecyclerView.LayoutManager.getProperties(context, attributeSet, i, i2);
        int i3 = properties.orientation;
        if (i3 == 0 || i3 == 1) {
            assertNotInLayoutOrScroll(null);
            if (i3 != this.mOrientation) {
                this.mOrientation = i3;
                OrientationHelper orientationHelper = this.mPrimaryOrientation;
                this.mPrimaryOrientation = this.mSecondaryOrientation;
                this.mSecondaryOrientation = orientationHelper;
                requestLayout();
            }
            int i4 = properties.spanCount;
            assertNotInLayoutOrScroll(null);
            if (i4 != this.mSpanCount) {
                this.mLazySpanLookup.clear();
                requestLayout();
                this.mSpanCount = i4;
                this.mRemainingSpans = new BitSet(this.mSpanCount);
                this.mSpans = new Span[this.mSpanCount];
                for (int i5 = 0; i5 < this.mSpanCount; i5++) {
                    this.mSpans[i5] = new Span(i5);
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

    public final int calculateScrollDirectionForPosition(int i) {
        boolean z;
        if (getChildCount() != 0) {
            if (i < getFirstChildPosition()) {
                z = true;
            } else {
                z = false;
            }
            if (z != this.mShouldReverseLayout) {
                return -1;
            }
            return 1;
        } else if (this.mShouldReverseLayout) {
            return 1;
        } else {
            return -1;
        }
    }

    public final boolean checkForGaps() {
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
    public final int computeHorizontalScrollExtent(RecyclerView.State state) {
        return computeScrollExtent(state);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final int computeHorizontalScrollOffset(RecyclerView.State state) {
        return computeScrollOffset(state);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final int computeHorizontalScrollRange(RecyclerView.State state) {
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
    public final PointF computeScrollVectorForPosition(int i) {
        int calculateScrollDirectionForPosition = calculateScrollDirectionForPosition(i);
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
    public final int computeVerticalScrollExtent(RecyclerView.State state) {
        return computeScrollExtent(state);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final int computeVerticalScrollOffset(RecyclerView.State state) {
        return computeScrollOffset(state);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final int computeVerticalScrollRange(RecyclerView.State state) {
        return computeScrollRange(state);
    }

    public final void fixStartGap(RecyclerView.Recycler recycler, RecyclerView.State state, boolean z) {
        int startAfterPadding;
        int minStart = getMinStart(Integer.MAX_VALUE);
        if (minStart != Integer.MAX_VALUE && (startAfterPadding = minStart - this.mPrimaryOrientation.getStartAfterPadding()) > 0) {
            int scrollBy = startAfterPadding - scrollBy(startAfterPadding, recycler, state);
            if (z && scrollBy > 0) {
                this.mPrimaryOrientation.offsetChildren(-scrollBy);
            }
        }
    }

    public final int getFirstChildPosition() {
        if (getChildCount() == 0) {
            return 0;
        }
        return RecyclerView.LayoutManager.getPosition(getChildAt(0));
    }

    public final int getLastChildPosition() {
        int childCount = getChildCount();
        if (childCount == 0) {
            return 0;
        }
        return RecyclerView.LayoutManager.getPosition(getChildAt(childCount - 1));
    }

    /* JADX WARN: Code restructure failed: missing block: B:43:0x00d1, code lost:
        if (r10 == r11) goto L48;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x00e3, code lost:
        if (r10 == r11) goto L48;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x00e5, code lost:
        r10 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x00e7, code lost:
        r10 = false;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final android.view.View hasGapsToFix() {
        /*
            Method dump skipped, instructions count: 264
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.StaggeredGridLayoutManager.hasGapsToFix():android.view.View");
    }

    public final boolean isLayoutRTL() {
        if (getLayoutDirection() == 1) {
            return true;
        }
        return false;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final void offsetChildrenHorizontal(int i) {
        super.offsetChildrenHorizontal(i);
        for (int i2 = 0; i2 < this.mSpanCount; i2++) {
            Span span = this.mSpans[i2];
            int i3 = span.mCachedStart;
            if (i3 != Integer.MIN_VALUE) {
                span.mCachedStart = i3 + i;
            }
            int i4 = span.mCachedEnd;
            if (i4 != Integer.MIN_VALUE) {
                span.mCachedEnd = i4 + i;
            }
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final void offsetChildrenVertical(int i) {
        super.offsetChildrenVertical(i);
        for (int i2 = 0; i2 < this.mSpanCount; i2++) {
            Span span = this.mSpans[i2];
            int i3 = span.mCachedStart;
            if (i3 != Integer.MIN_VALUE) {
                span.mCachedStart = i3 + i;
            }
            int i4 = span.mCachedEnd;
            if (i4 != Integer.MIN_VALUE) {
                span.mCachedEnd = i4 + i;
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:31:0x004a, code lost:
        if (r8.mOrientation == 1) goto L44;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x004f, code lost:
        if (r8.mOrientation == 0) goto L44;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x005d, code lost:
        if (isLayoutRTL() == false) goto L43;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x0069, code lost:
        if (isLayoutRTL() == false) goto L44;
     */
    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final android.view.View onFocusSearchFailed(android.view.View r9, int r10, androidx.recyclerview.widget.RecyclerView.Recycler r11, androidx.recyclerview.widget.RecyclerView.State r12) {
        /*
            Method dump skipped, instructions count: 349
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.StaggeredGridLayoutManager.onFocusSearchFailed(android.view.View, int, androidx.recyclerview.widget.RecyclerView$Recycler, androidx.recyclerview.widget.RecyclerView$State):android.view.View");
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        super.onInitializeAccessibilityEvent(accessibilityEvent);
        if (getChildCount() > 0) {
            View findFirstVisibleItemClosestToStart = findFirstVisibleItemClosestToStart(false);
            View findFirstVisibleItemClosestToEnd = findFirstVisibleItemClosestToEnd(false);
            if (findFirstVisibleItemClosestToStart != null && findFirstVisibleItemClosestToEnd != null) {
                int position = RecyclerView.LayoutManager.getPosition(findFirstVisibleItemClosestToStart);
                int position2 = RecyclerView.LayoutManager.getPosition(findFirstVisibleItemClosestToEnd);
                if (position < position2) {
                    accessibilityEvent.setFromIndex(position);
                    accessibilityEvent.setToIndex(position2);
                    return;
                }
                accessibilityEvent.setFromIndex(position2);
                accessibilityEvent.setToIndex(position);
            }
        }
    }

    public final void recycleFromEnd(RecyclerView.Recycler recycler, int i) {
        for (int childCount = getChildCount() - 1; childCount >= 0; childCount--) {
            View childAt = getChildAt(childCount);
            if (this.mPrimaryOrientation.getDecoratedStart(childAt) >= i && this.mPrimaryOrientation.getTransformedStartWithDecoration(childAt) >= i) {
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                layoutParams.getClass();
                if (layoutParams.mSpan.mViews.size() != 1) {
                    Span span = layoutParams.mSpan;
                    int size = span.mViews.size();
                    View remove = span.mViews.remove(size - 1);
                    LayoutParams layoutParams2 = Span.getLayoutParams(remove);
                    layoutParams2.mSpan = null;
                    if (layoutParams2.isItemRemoved() || layoutParams2.isItemChanged()) {
                        span.mDeletedSize -= StaggeredGridLayoutManager.this.mPrimaryOrientation.getDecoratedMeasurement(remove);
                    }
                    if (size == 1) {
                        span.mCachedStart = RecyclerView.UNDEFINED_DURATION;
                    }
                    span.mCachedEnd = RecyclerView.UNDEFINED_DURATION;
                    removeAndRecycleView(childAt, recycler);
                } else {
                    return;
                }
            } else {
                return;
            }
        }
    }

    public final void recycleFromStart(RecyclerView.Recycler recycler, int i) {
        while (getChildCount() > 0) {
            View childAt = getChildAt(0);
            if (this.mPrimaryOrientation.getDecoratedEnd(childAt) <= i && this.mPrimaryOrientation.getTransformedEndWithDecoration(childAt) <= i) {
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                layoutParams.getClass();
                if (layoutParams.mSpan.mViews.size() != 1) {
                    Span span = layoutParams.mSpan;
                    View remove = span.mViews.remove(0);
                    LayoutParams layoutParams2 = Span.getLayoutParams(remove);
                    layoutParams2.mSpan = null;
                    if (span.mViews.size() == 0) {
                        span.mCachedEnd = RecyclerView.UNDEFINED_DURATION;
                    }
                    if (layoutParams2.isItemRemoved() || layoutParams2.isItemChanged()) {
                        span.mDeletedSize -= StaggeredGridLayoutManager.this.mPrimaryOrientation.getDecoratedMeasurement(remove);
                    }
                    span.mCachedStart = RecyclerView.UNDEFINED_DURATION;
                    removeAndRecycleView(childAt, recycler);
                } else {
                    return;
                }
            } else {
                return;
            }
        }
    }

    public final int scrollBy(int i, RecyclerView.Recycler recycler, RecyclerView.State state) {
        if (getChildCount() == 0 || i == 0) {
            return 0;
        }
        prepareLayoutStateForDelta(i, state);
        int fill = fill(recycler, this.mLayoutState, state);
        if (this.mLayoutState.mAvailable >= fill) {
            if (i < 0) {
                i = -fill;
            } else {
                i = fill;
            }
        }
        this.mPrimaryOrientation.offsetChildren(-i);
        this.mLastLayoutFromEnd = this.mShouldReverseLayout;
        LayoutState layoutState = this.mLayoutState;
        layoutState.mAvailable = 0;
        recycle(recycler, layoutState);
        return i;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final int scrollHorizontallyBy(int i, RecyclerView.Recycler recycler, RecyclerView.State state) {
        return scrollBy(i, recycler, state);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final int scrollVerticallyBy(int i, RecyclerView.Recycler recycler, RecyclerView.State state) {
        return scrollBy(i, recycler, state);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final void setMeasuredDimension(Rect rect, int i, int i2) {
        int i3;
        int i4;
        int paddingRight = getPaddingRight() + getPaddingLeft();
        int paddingBottom = getPaddingBottom() + getPaddingTop();
        if (this.mOrientation == 1) {
            int height = rect.height() + paddingBottom;
            RecyclerView recyclerView = this.mRecyclerView;
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            i4 = RecyclerView.LayoutManager.chooseSize(i2, height, ViewCompat.Api16Impl.getMinimumHeight(recyclerView));
            i3 = RecyclerView.LayoutManager.chooseSize(i, (this.mSizePerSpan * this.mSpanCount) + paddingRight, ViewCompat.Api16Impl.getMinimumWidth(this.mRecyclerView));
        } else {
            int width = rect.width() + paddingRight;
            RecyclerView recyclerView2 = this.mRecyclerView;
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap2 = ViewCompat.sViewPropertyAnimatorMap;
            i3 = RecyclerView.LayoutManager.chooseSize(i, width, ViewCompat.Api16Impl.getMinimumWidth(recyclerView2));
            i4 = RecyclerView.LayoutManager.chooseSize(i2, (this.mSizePerSpan * this.mSpanCount) + paddingBottom, ViewCompat.Api16Impl.getMinimumHeight(this.mRecyclerView));
        }
        this.mRecyclerView.setMeasuredDimension(i3, i4);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
    public final boolean checkLayoutParams(RecyclerView.LayoutParams layoutParams) {
        return layoutParams instanceof LayoutParams;
    }
}
