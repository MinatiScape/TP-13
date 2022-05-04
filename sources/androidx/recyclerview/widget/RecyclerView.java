package androidx.recyclerview.widget;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.LayoutTransition;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.database.Observable;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.SystemClock;
import android.os.Trace;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.view.Display;
import android.view.FocusFinder;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewPropertyAnimator;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.animation.Interpolator;
import android.widget.EdgeEffect;
import android.widget.OverScroller;
import androidx.constraintlayout.solver.SolverVariable$Type$r8$EnumUnboxingUtility;
import androidx.core.util.Pools$SimplePool;
import androidx.core.util.Preconditions;
import androidx.core.view.NestedScrollingChild;
import androidx.core.view.NestedScrollingChildHelper;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.core.view.accessibility.AccessibilityNodeInfoCompat;
import androidx.core.widget.EdgeEffectCompat$Api31Impl;
import androidx.customview.view.AbsSavedState;
import androidx.recyclerview.R$styleable;
import androidx.recyclerview.widget.AdapterHelper;
import androidx.recyclerview.widget.ChildHelper;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.GapWorker;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.RecyclerViewAccessibilityDelegate;
import androidx.recyclerview.widget.ViewBoundsCheck;
import androidx.recyclerview.widget.ViewInfoStore;
import com.android.systemui.shared.R;
import com.android.systemui.shared.system.QuickStepContract;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.common.math.IntMath;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public class RecyclerView extends ViewGroup implements NestedScrollingChild {
    public static final boolean DEBUG = false;
    public static final int DEFAULT_ORIENTATION = 1;
    public static final boolean DISPATCH_TEMP_DETACH = false;
    public static final long FOREVER_NS = Long.MAX_VALUE;
    public static final int HORIZONTAL = 0;
    private static final int INVALID_POINTER = -1;
    public static final int INVALID_TYPE = -1;
    private static final Class<?>[] LAYOUT_MANAGER_CONSTRUCTOR_SIGNATURE;
    public static final int MAX_SCROLL_DURATION = 2000;
    public static final long NO_ID = -1;
    public static final int NO_POSITION = -1;
    public static final int SCROLL_STATE_DRAGGING = 1;
    public static final int SCROLL_STATE_IDLE = 0;
    public static final int SCROLL_STATE_SETTLING = 2;
    public static final String TAG = "RecyclerView";
    public static final int TOUCH_SLOP_DEFAULT = 0;
    public static final int TOUCH_SLOP_PAGING = 1;
    public static final String TRACE_BIND_VIEW_TAG = "RV OnBindView";
    public static final String TRACE_CREATE_VIEW_TAG = "RV CreateView";
    private static final String TRACE_HANDLE_ADAPTER_UPDATES_TAG = "RV PartialInvalidate";
    public static final String TRACE_NESTED_PREFETCH_TAG = "RV Nested Prefetch";
    private static final String TRACE_ON_DATA_SET_CHANGE_LAYOUT_TAG = "RV FullInvalidate";
    private static final String TRACE_ON_LAYOUT_TAG = "RV OnLayout";
    public static final String TRACE_PREFETCH_TAG = "RV Prefetch";
    public static final String TRACE_SCROLL_TAG = "RV Scroll";
    public static final int UNDEFINED_DURATION = Integer.MIN_VALUE;
    public static final boolean VERBOSE_TRACING = false;
    public static final int VERTICAL = 1;
    public RecyclerViewAccessibilityDelegate mAccessibilityDelegate;
    private final AccessibilityManager mAccessibilityManager;
    public Adapter mAdapter;
    public AdapterHelper mAdapterHelper;
    public boolean mAdapterUpdateDuringMeasure;
    private EdgeEffect mBottomGlow;
    private ChildDrawingOrderCallback mChildDrawingOrderCallback;
    public ChildHelper mChildHelper;
    public boolean mClipToPadding;
    public boolean mDataSetHasChangedAfterLayout;
    public boolean mDispatchItemsChangedEvent;
    private int mDispatchScrollCounter;
    private int mEatenAccessibilityChangeFlags;
    private EdgeEffectFactory mEdgeEffectFactory;
    public boolean mEnableFastScroller;
    public boolean mFirstLayoutComplete;
    public GapWorker mGapWorker;
    public boolean mHasFixedSize;
    private boolean mIgnoreMotionEventTillDown;
    private int mInitialTouchX;
    private int mInitialTouchY;
    private int mInterceptRequestLayoutDepth;
    private OnItemTouchListener mInterceptingOnItemTouchListener;
    public boolean mIsAttached;
    public ItemAnimator mItemAnimator;
    private ItemAnimator.ItemAnimatorListener mItemAnimatorListener;
    private Runnable mItemAnimatorRunner;
    public final ArrayList<ItemDecoration> mItemDecorations;
    public boolean mItemsAddedOrRemoved;
    public boolean mItemsChanged;
    private int mLastAutoMeasureNonExactMeasuredHeight;
    private int mLastAutoMeasureNonExactMeasuredWidth;
    private boolean mLastAutoMeasureSkippedDueToExact;
    private int mLastTouchX;
    private int mLastTouchY;
    public LayoutManager mLayout;
    private int mLayoutOrScrollCounter;
    public boolean mLayoutSuppressed;
    public boolean mLayoutWasDefered;
    private EdgeEffect mLeftGlow;
    private final int mMaxFlingVelocity;
    private final int mMinFlingVelocity;
    private final int[] mMinMaxLayoutPositions;
    private final int[] mNestedOffsets;
    private final RecyclerViewDataObserver mObserver;
    private List<OnChildAttachStateChangeListener> mOnChildAttachStateListeners;
    private OnFlingListener mOnFlingListener;
    private final ArrayList<OnItemTouchListener> mOnItemTouchListeners;
    public final List<ViewHolder> mPendingAccessibilityImportanceChange;
    public SavedState mPendingSavedState;
    public boolean mPostedAnimatorRunner;
    public GapWorker.LayoutPrefetchRegistryImpl mPrefetchRegistry;
    private boolean mPreserveFocusAfterLayout;
    public final Recycler mRecycler;
    public RecyclerListener mRecyclerListener;
    public final List<RecyclerListener> mRecyclerListeners;
    public final int[] mReusableIntPair;
    private EdgeEffect mRightGlow;
    private float mScaledHorizontalScrollFactor;
    private float mScaledVerticalScrollFactor;
    private OnScrollListener mScrollListener;
    private List<OnScrollListener> mScrollListeners;
    private final int[] mScrollOffset;
    private int mScrollPointerId;
    private int mScrollState;
    private NestedScrollingChildHelper mScrollingChildHelper;
    public final State mState;
    public final Rect mTempRect;
    private final Rect mTempRect2;
    public final RectF mTempRectF;
    private EdgeEffect mTopGlow;
    private int mTouchSlop;
    public final Runnable mUpdateChildViewsRunnable;
    private VelocityTracker mVelocityTracker;
    public final ViewFlinger mViewFlinger;
    private final ViewInfoStore.ProcessCallback mViewInfoProcessCallback;
    public final ViewInfoStore mViewInfoStore;
    private static final int[] NESTED_SCROLLING_ATTRS = {16843830};
    public static final boolean FORCE_INVALIDATE_DISPLAY_LIST = false;
    public static final boolean ALLOW_SIZE_IN_UNSPECIFIED_SPEC = true;
    public static final boolean POST_UPDATES_ON_ANIMATION = true;
    public static final boolean ALLOW_THREAD_GAP_WORK = true;
    private static final boolean FORCE_ABS_FOCUS_SEARCH_DIRECTION = false;
    private static final boolean IGNORE_DETACHED_FOCUSED_CHILD = false;
    public static final Interpolator sQuinticInterpolator = new Interpolator() { // from class: androidx.recyclerview.widget.RecyclerView.3
        @Override // android.animation.TimeInterpolator
        public float getInterpolation(float t) {
            float f = t - 1.0f;
            return (f * f * f * f * f) + 1.0f;
        }
    };
    public static final StretchEdgeEffectFactory sDefaultEdgeEffectFactory = new StretchEdgeEffectFactory();

    /* renamed from: androidx.recyclerview.widget.RecyclerView$4  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass4 implements ViewInfoStore.ProcessCallback {
        public AnonymousClass4() {
        }
    }

    /* renamed from: androidx.recyclerview.widget.RecyclerView$5  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass5 implements ChildHelper.Callback {
        public AnonymousClass5() {
        }

        public View getChildAt(int offset) {
            return RecyclerView.this.getChildAt(offset);
        }

        public int getChildCount() {
            return RecyclerView.this.getChildCount();
        }

        public void removeViewAt(int index) {
            View childAt = RecyclerView.this.getChildAt(index);
            if (childAt != null) {
                RecyclerView.this.dispatchChildDetached(childAt);
                childAt.clearAnimation();
            }
            RecyclerView.this.removeViewAt(index);
        }
    }

    /* renamed from: androidx.recyclerview.widget.RecyclerView$6  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass6 implements AdapterHelper.Callback {
        public AnonymousClass6() {
        }

        public void dispatchUpdate(AdapterHelper.UpdateOp op) {
            int i = op.cmd;
            if (i == 1) {
                RecyclerView recyclerView = RecyclerView.this;
                recyclerView.mLayout.onItemsAdded(recyclerView, op.positionStart, op.itemCount);
            } else if (i == 2) {
                RecyclerView recyclerView2 = RecyclerView.this;
                recyclerView2.mLayout.onItemsRemoved(recyclerView2, op.positionStart, op.itemCount);
            } else if (i == 4) {
                RecyclerView recyclerView3 = RecyclerView.this;
                recyclerView3.mLayout.onItemsUpdated(recyclerView3, op.positionStart, op.itemCount, op.payload);
            } else if (i == 8) {
                RecyclerView recyclerView4 = RecyclerView.this;
                recyclerView4.mLayout.onItemsMoved(recyclerView4, op.positionStart, op.itemCount, 1);
            }
        }

        public ViewHolder findViewHolder(int position) {
            ViewHolder findViewHolderForPosition = RecyclerView.this.findViewHolderForPosition(position, true);
            if (findViewHolderForPosition != null && !RecyclerView.this.mChildHelper.isHidden(findViewHolderForPosition.itemView)) {
                return findViewHolderForPosition;
            }
            return null;
        }

        public void markViewHoldersUpdated(int positionStart, int itemCount, Object payload) {
            RecyclerView.this.viewRangeUpdate(positionStart, itemCount, payload);
            RecyclerView.this.mItemsChanged = true;
        }
    }

    /* loaded from: classes.dex */
    public static abstract class Adapter<VH extends ViewHolder> {
        public final AdapterDataObservable mObservable = new AdapterDataObservable();
        public boolean mHasStableIds = false;
        public int mStateRestorationPolicy = 1;

        public abstract int getItemCount();

        public long getItemId(int position) {
            return -1L;
        }

        public int getItemViewType(int position) {
            return 0;
        }

        public final void notifyItemChanged(int position) {
            this.mObservable.notifyItemRangeChanged(position, 1);
        }

        public abstract void onBindViewHolder(VH holder, int position);

        public abstract VH onCreateViewHolder(ViewGroup parent, int viewType);
    }

    /* loaded from: classes.dex */
    public static class AdapterDataObservable extends Observable<AdapterDataObserver> {
        public boolean hasObservers() {
            return !((Observable) this).mObservers.isEmpty();
        }

        public void notifyChanged() {
            for (int size = ((Observable) this).mObservers.size() - 1; size >= 0; size--) {
                ((AdapterDataObserver) ((Observable) this).mObservers.get(size)).onChanged();
            }
        }

        public void notifyItemRangeChanged(int positionStart, int itemCount) {
            int size = ((Observable) this).mObservers.size();
            while (true) {
                size--;
                if (size >= 0) {
                    ((AdapterDataObserver) ((Observable) this).mObservers.get(size)).onItemRangeChanged(positionStart, itemCount, null);
                } else {
                    return;
                }
            }
        }

        public void notifyItemRangeInserted(int positionStart, int itemCount) {
            for (int size = ((Observable) this).mObservers.size() - 1; size >= 0; size--) {
                ((AdapterDataObserver) ((Observable) this).mObservers.get(size)).onItemRangeInserted(positionStart, itemCount);
            }
        }

        public void notifyItemRangeRemoved(int positionStart, int itemCount) {
            for (int size = ((Observable) this).mObservers.size() - 1; size >= 0; size--) {
                ((AdapterDataObserver) ((Observable) this).mObservers.get(size)).onItemRangeRemoved(positionStart, itemCount);
            }
        }
    }

    /* loaded from: classes.dex */
    public static abstract class AdapterDataObserver {
        public void onChanged() {
        }

        public void onItemRangeChanged(int positionStart, int itemCount) {
        }

        public void onItemRangeChanged(int positionStart, int itemCount, Object payload) {
            onItemRangeChanged(positionStart, itemCount);
        }

        public void onItemRangeInserted(int positionStart, int itemCount) {
        }

        public void onItemRangeRemoved(int positionStart, int itemCount) {
        }
    }

    /* loaded from: classes.dex */
    public interface ChildDrawingOrderCallback {
        int onGetChildDrawingOrder(int childCount, int i);
    }

    /* loaded from: classes.dex */
    public static class EdgeEffectFactory {
        public EdgeEffect createEdgeEffect(RecyclerView view, int direction) {
            throw null;
        }
    }

    /* loaded from: classes.dex */
    public static abstract class ItemAnimator {
        public ItemAnimatorListener mListener = null;
        public ArrayList<ItemAnimatorFinishedListener> mFinishedListeners = new ArrayList<>();
        public long mAddDuration = 120;
        public long mRemoveDuration = 120;
        public long mMoveDuration = 250;
        public long mChangeDuration = 250;

        /* loaded from: classes.dex */
        public interface ItemAnimatorFinishedListener {
            void onAnimationsFinished();
        }

        /* loaded from: classes.dex */
        public interface ItemAnimatorListener {
        }

        /* loaded from: classes.dex */
        public static class ItemHolderInfo {
            public int left;
            public int top;
        }

        public static int buildAdapterChangeFlagsForAnimations(ViewHolder viewHolder) {
            int i = viewHolder.mFlags & 14;
            if (viewHolder.isInvalid()) {
                return 4;
            }
            if ((i & 4) != 0) {
                return i;
            }
            int i2 = viewHolder.mOldPosition;
            int absoluteAdapterPosition = viewHolder.getAbsoluteAdapterPosition();
            return (i2 == -1 || absoluteAdapterPosition == -1 || i2 == absoluteAdapterPosition) ? i : i | QuickStepContract.SYSUI_STATE_QUICK_SETTINGS_EXPANDED;
        }

        public abstract boolean animateChange(ViewHolder oldHolder, ViewHolder newHolder, ItemHolderInfo preLayoutInfo, ItemHolderInfo postLayoutInfo);

        public final void dispatchAnimationFinished(ViewHolder viewHolder) {
            ItemAnimatorListener itemAnimatorListener = this.mListener;
            if (itemAnimatorListener != null) {
                ItemAnimatorRestoreListener itemAnimatorRestoreListener = (ItemAnimatorRestoreListener) itemAnimatorListener;
                Objects.requireNonNull(itemAnimatorRestoreListener);
                boolean z = true;
                viewHolder.setIsRecyclable(true);
                if (viewHolder.mShadowedHolder != null && viewHolder.mShadowingHolder == null) {
                    viewHolder.mShadowedHolder = null;
                }
                viewHolder.mShadowingHolder = null;
                if ((viewHolder.mFlags & 16) == 0) {
                    z = false;
                }
                if (!z && !RecyclerView.this.removeAnimatingView(viewHolder.itemView) && viewHolder.isTmpDetached()) {
                    RecyclerView.this.removeDetachedView(viewHolder.itemView, false);
                }
            }
        }

        public final void dispatchAnimationsFinished() {
            int size = this.mFinishedListeners.size();
            for (int i = 0; i < size; i++) {
                this.mFinishedListeners.get(i).onAnimationsFinished();
            }
            this.mFinishedListeners.clear();
        }

        public abstract void endAnimation(ViewHolder item);

        public abstract void endAnimations();

        public abstract boolean isRunning();

        public ItemHolderInfo recordPreLayoutInformation(ViewHolder viewHolder) {
            ItemHolderInfo itemHolderInfo = new ItemHolderInfo();
            View view = viewHolder.itemView;
            itemHolderInfo.left = view.getLeft();
            itemHolderInfo.top = view.getTop();
            view.getRight();
            view.getBottom();
            return itemHolderInfo;
        }
    }

    /* loaded from: classes.dex */
    public class ItemAnimatorRestoreListener implements ItemAnimator.ItemAnimatorListener {
        public ItemAnimatorRestoreListener() {
        }
    }

    /* loaded from: classes.dex */
    public static abstract class ItemDecoration {
        public void getItemOffsets(Rect outRect, View view, RecyclerView parent, State state) {
            ((LayoutParams) view.getLayoutParams()).getViewLayoutPosition();
            outRect.set(0, 0, 0, 0);
        }

        public void onDraw(Canvas c, RecyclerView parent, State state) {
        }

        public void onDrawOver(Canvas c, RecyclerView parent, State state) {
        }
    }

    /* loaded from: classes.dex */
    public interface OnChildAttachStateChangeListener {
        void onChildViewAttachedToWindow(View view);

        void onChildViewDetachedFromWindow(View view);
    }

    /* loaded from: classes.dex */
    public static abstract class OnFlingListener {
    }

    /* loaded from: classes.dex */
    public interface OnItemTouchListener {
        boolean onInterceptTouchEvent(RecyclerView rv, MotionEvent e);

        void onRequestDisallowInterceptTouchEvent(boolean disallowIntercept);

        void onTouchEvent(RecyclerView rv, MotionEvent e);
    }

    /* loaded from: classes.dex */
    public static abstract class OnScrollListener {
        public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
        }

        public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
        }
    }

    /* loaded from: classes.dex */
    public static class RecycledViewPool {
        public SparseArray<ScrapData> mScrap = new SparseArray<>();
        public int mAttachCount = 0;

        /* loaded from: classes.dex */
        public static class ScrapData {
            public final ArrayList<ViewHolder> mScrapHeap = new ArrayList<>();
            public int mMaxScrap = 5;
            public long mCreateRunningAverageNs = 0;
            public long mBindRunningAverageNs = 0;
        }

        public final ScrapData getScrapDataForType(int viewType) {
            ScrapData scrapData = this.mScrap.get(viewType);
            if (scrapData != null) {
                return scrapData;
            }
            ScrapData scrapData2 = new ScrapData();
            this.mScrap.put(viewType, scrapData2);
            return scrapData2;
        }

        public long runningAverage(long oldAverage, long newValue) {
            if (oldAverage == 0) {
                return newValue;
            }
            return (newValue / 4) + ((oldAverage / 4) * 3);
        }
    }

    /* loaded from: classes.dex */
    public final class Recycler {
        public final ArrayList<ViewHolder> mAttachedScrap;
        public RecycledViewPool mRecyclerPool;
        public final List<ViewHolder> mUnmodifiableAttachedScrap;
        public ArrayList<ViewHolder> mChangedScrap = null;
        public final ArrayList<ViewHolder> mCachedViews = new ArrayList<>();
        public int mRequestedCacheMax = 2;
        public int mViewCacheMax = 2;

        public Recycler() {
            ArrayList<ViewHolder> arrayList = new ArrayList<>();
            this.mAttachedScrap = arrayList;
            this.mUnmodifiableAttachedScrap = Collections.unmodifiableList(arrayList);
        }

        public void addViewHolderToRecycledViewPool(ViewHolder holder, boolean dispatchRecycled) {
            RecyclerView.clearNestedRecyclerViewIfNotNested(holder);
            View view = holder.itemView;
            RecyclerViewAccessibilityDelegate recyclerViewAccessibilityDelegate = RecyclerView.this.mAccessibilityDelegate;
            if (recyclerViewAccessibilityDelegate != null) {
                RecyclerViewAccessibilityDelegate.ItemDelegate itemDelegate = recyclerViewAccessibilityDelegate.mItemDelegate;
                ViewCompat.setAccessibilityDelegate(view, itemDelegate instanceof RecyclerViewAccessibilityDelegate.ItemDelegate ? itemDelegate.mOriginalItemDelegates.remove(view) : null);
            }
            if (dispatchRecycled) {
                RecyclerListener recyclerListener = RecyclerView.this.mRecyclerListener;
                if (recyclerListener != null) {
                    recyclerListener.onViewRecycled(holder);
                }
                int size = RecyclerView.this.mRecyclerListeners.size();
                for (int i = 0; i < size; i++) {
                    RecyclerView.this.mRecyclerListeners.get(i).onViewRecycled(holder);
                }
                RecyclerView recyclerView = RecyclerView.this;
                Adapter adapter = recyclerView.mAdapter;
                if (recyclerView.mState != null) {
                    recyclerView.mViewInfoStore.removeViewHolder(holder);
                }
            }
            holder.mBindingAdapter = null;
            holder.mOwnerRecyclerView = null;
            RecycledViewPool recycledViewPool = getRecycledViewPool();
            Objects.requireNonNull(recycledViewPool);
            int i2 = holder.mItemViewType;
            ArrayList<ViewHolder> arrayList = recycledViewPool.getScrapDataForType(i2).mScrapHeap;
            if (recycledViewPool.mScrap.get(i2).mMaxScrap > arrayList.size()) {
                holder.resetInternal();
                arrayList.add(holder);
            }
        }

        public void clear() {
            this.mAttachedScrap.clear();
            recycleAndClearCachedViews();
        }

        public int convertPreLayoutPositionToPostLayout(int position) {
            if (position < 0 || position >= RecyclerView.this.mState.getItemCount()) {
                StringBuilder sb = new StringBuilder();
                sb.append("invalid position ");
                sb.append(position);
                sb.append(". State item count is ");
                sb.append(RecyclerView.this.mState.getItemCount());
                throw new IndexOutOfBoundsException(ChildHelper$$ExternalSyntheticOutline0.m(RecyclerView.this, sb));
            }
            RecyclerView recyclerView = RecyclerView.this;
            return !recyclerView.mState.mInPreLayout ? position : recyclerView.mAdapterHelper.findPositionOffset(position, 0);
        }

        public RecycledViewPool getRecycledViewPool() {
            if (this.mRecyclerPool == null) {
                this.mRecyclerPool = new RecycledViewPool();
            }
            return this.mRecyclerPool;
        }

        public final void invalidateDisplayListInt(ViewGroup viewGroup, boolean invalidateThis) {
            for (int childCount = viewGroup.getChildCount() - 1; childCount >= 0; childCount--) {
                View childAt = viewGroup.getChildAt(childCount);
                if (childAt instanceof ViewGroup) {
                    invalidateDisplayListInt((ViewGroup) childAt, true);
                }
            }
            if (invalidateThis) {
                if (viewGroup.getVisibility() == 4) {
                    viewGroup.setVisibility(0);
                    viewGroup.setVisibility(4);
                    return;
                }
                int visibility = viewGroup.getVisibility();
                viewGroup.setVisibility(4);
                viewGroup.setVisibility(visibility);
            }
        }

        public void recycleAndClearCachedViews() {
            for (int size = this.mCachedViews.size() - 1; size >= 0; size--) {
                recycleCachedViewAt(size);
            }
            this.mCachedViews.clear();
            if (RecyclerView.ALLOW_THREAD_GAP_WORK) {
                GapWorker.LayoutPrefetchRegistryImpl layoutPrefetchRegistryImpl = RecyclerView.this.mPrefetchRegistry;
                int[] iArr = layoutPrefetchRegistryImpl.mPrefetchArray;
                if (iArr != null) {
                    Arrays.fill(iArr, -1);
                }
                layoutPrefetchRegistryImpl.mCount = 0;
            }
        }

        public void recycleCachedViewAt(int cachedViewIndex) {
            addViewHolderToRecycledViewPool(this.mCachedViews.get(cachedViewIndex), true);
            this.mCachedViews.remove(cachedViewIndex);
        }

        public void recycleView(View view) {
            ViewHolder childViewHolderInt = RecyclerView.getChildViewHolderInt(view);
            if (childViewHolderInt.isTmpDetached()) {
                RecyclerView.this.removeDetachedView(view, false);
            }
            if (childViewHolderInt.isScrap()) {
                childViewHolderInt.mScrapContainer.unscrapView(childViewHolderInt);
            } else if (childViewHolderInt.wasReturnedFromScrap()) {
                childViewHolderInt.clearReturnedFromScrapFlag();
            }
            recycleViewHolderInternal(childViewHolderInt);
            if (RecyclerView.this.mItemAnimator != null && !childViewHolderInt.isRecyclable()) {
                RecyclerView.this.mItemAnimator.endAnimation(childViewHolderInt);
            }
        }

        /* JADX WARN: Removed duplicated region for block: B:18:0x003b  */
        /* JADX WARN: Removed duplicated region for block: B:41:0x0094  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public void recycleViewHolderInternal(androidx.recyclerview.widget.RecyclerView.ViewHolder r7) {
            /*
                Method dump skipped, instructions count: 253
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.RecyclerView.Recycler.recycleViewHolderInternal(androidx.recyclerview.widget.RecyclerView$ViewHolder):void");
        }

        public void scrapView(View view) {
            ViewHolder childViewHolderInt = RecyclerView.getChildViewHolderInt(view);
            if (!childViewHolderInt.hasAnyOfTheFlags(12) && childViewHolderInt.isUpdated() && !RecyclerView.this.canReuseUpdatedViewHolder(childViewHolderInt)) {
                if (this.mChangedScrap == null) {
                    this.mChangedScrap = new ArrayList<>();
                }
                childViewHolderInt.mScrapContainer = this;
                childViewHolderInt.mInChangeScrap = true;
                this.mChangedScrap.add(childViewHolderInt);
            } else if (!childViewHolderInt.isInvalid() || childViewHolderInt.isRemoved() || RecyclerView.this.mAdapter.mHasStableIds) {
                childViewHolderInt.mScrapContainer = this;
                childViewHolderInt.mInChangeScrap = false;
                this.mAttachedScrap.add(childViewHolderInt);
            } else {
                throw new IllegalArgumentException(ChildHelper$$ExternalSyntheticOutline0.m(RecyclerView.this, ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Called scrap view with an invalid view. Invalid views cannot be reused from scrap, they should rebound from recycler pool.")));
            }
        }

        /* JADX WARN: Code restructure failed: missing block: B:162:0x02ff, code lost:
            r7 = null;
         */
        /* JADX WARN: Code restructure failed: missing block: B:233:0x0457, code lost:
            if (r7.isInvalid() == false) goto L243;
         */
        /* JADX WARN: Code restructure failed: missing block: B:242:0x048d, code lost:
            if ((r10 == 0 || r10 + r8 < r19) == false) goto L243;
         */
        /* JADX WARN: Removed duplicated region for block: B:126:0x024b  */
        /* JADX WARN: Removed duplicated region for block: B:219:0x041f  */
        /* JADX WARN: Removed duplicated region for block: B:227:0x0449  */
        /* JADX WARN: Removed duplicated region for block: B:236:0x0476  */
        /* JADX WARN: Removed duplicated region for block: B:246:0x049e  */
        /* JADX WARN: Removed duplicated region for block: B:247:0x04a0  */
        /* JADX WARN: Removed duplicated region for block: B:249:0x04a3  */
        /* JADX WARN: Removed duplicated region for block: B:255:0x04c4  */
        /* JADX WARN: Removed duplicated region for block: B:264:0x0502  */
        /* JADX WARN: Removed duplicated region for block: B:277:0x0532  */
        /* JADX WARN: Removed duplicated region for block: B:280:0x053b  */
        /* JADX WARN: Removed duplicated region for block: B:284:0x0546  */
        /* JADX WARN: Removed duplicated region for block: B:285:0x0554  */
        /* JADX WARN: Removed duplicated region for block: B:291:0x0571 A[ADDED_TO_REGION] */
        /* JADX WARN: Removed duplicated region for block: B:36:0x0089  */
        /* JADX WARN: Removed duplicated region for block: B:41:0x0090  */
        /* JADX WARN: Removed duplicated region for block: B:94:0x01bc  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public androidx.recyclerview.widget.RecyclerView.ViewHolder tryGetViewHolderForPositionByDeadline(int r17, boolean r18, long r19) {
            /*
                Method dump skipped, instructions count: 1448
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.RecyclerView.Recycler.tryGetViewHolderForPositionByDeadline(int, boolean, long):androidx.recyclerview.widget.RecyclerView$ViewHolder");
        }

        public void unscrapView(ViewHolder holder) {
            if (holder.mInChangeScrap) {
                this.mChangedScrap.remove(holder);
            } else {
                this.mAttachedScrap.remove(holder);
            }
            holder.mScrapContainer = null;
            holder.mInChangeScrap = false;
            holder.clearReturnedFromScrapFlag();
        }

        public void updateViewCacheSize() {
            LayoutManager layoutManager = RecyclerView.this.mLayout;
            this.mViewCacheMax = this.mRequestedCacheMax + (layoutManager != null ? layoutManager.mPrefetchMaxCountObserved : 0);
            for (int size = this.mCachedViews.size() - 1; size >= 0 && this.mCachedViews.size() > this.mViewCacheMax; size--) {
                recycleCachedViewAt(size);
            }
        }
    }

    /* loaded from: classes.dex */
    public interface RecyclerListener {
        void onViewRecycled(ViewHolder holder);
    }

    /* loaded from: classes.dex */
    public class RecyclerViewDataObserver extends AdapterDataObserver {
        public RecyclerViewDataObserver() {
        }

        @Override // androidx.recyclerview.widget.RecyclerView.AdapterDataObserver
        public void onChanged() {
            RecyclerView.this.assertNotInLayoutOrScroll(null);
            RecyclerView recyclerView = RecyclerView.this;
            recyclerView.mState.mStructureChanged = true;
            recyclerView.processDataSetCompletelyChanged(true);
            if (!RecyclerView.this.mAdapterHelper.hasPendingUpdates()) {
                RecyclerView.this.requestLayout();
            }
        }

        @Override // androidx.recyclerview.widget.RecyclerView.AdapterDataObserver
        public void onItemRangeChanged(int positionStart, int itemCount, Object payload) {
            RecyclerView.this.assertNotInLayoutOrScroll(null);
            AdapterHelper adapterHelper = RecyclerView.this.mAdapterHelper;
            Objects.requireNonNull(adapterHelper);
            boolean z = false;
            if (itemCount >= 1) {
                adapterHelper.mPendingUpdates.add(adapterHelper.obtainUpdateOp(4, positionStart, itemCount, payload));
                adapterHelper.mExistingUpdateTypes |= 4;
                if (adapterHelper.mPendingUpdates.size() == 1) {
                    z = true;
                }
            }
            if (z) {
                triggerUpdateProcessor();
            }
        }

        @Override // androidx.recyclerview.widget.RecyclerView.AdapterDataObserver
        public void onItemRangeInserted(int positionStart, int itemCount) {
            RecyclerView.this.assertNotInLayoutOrScroll(null);
            AdapterHelper adapterHelper = RecyclerView.this.mAdapterHelper;
            Objects.requireNonNull(adapterHelper);
            boolean z = false;
            if (itemCount >= 1) {
                adapterHelper.mPendingUpdates.add(adapterHelper.obtainUpdateOp(1, positionStart, itemCount, null));
                adapterHelper.mExistingUpdateTypes |= 1;
                if (adapterHelper.mPendingUpdates.size() == 1) {
                    z = true;
                }
            }
            if (z) {
                triggerUpdateProcessor();
            }
        }

        @Override // androidx.recyclerview.widget.RecyclerView.AdapterDataObserver
        public void onItemRangeRemoved(int positionStart, int itemCount) {
            RecyclerView.this.assertNotInLayoutOrScroll(null);
            AdapterHelper adapterHelper = RecyclerView.this.mAdapterHelper;
            Objects.requireNonNull(adapterHelper);
            boolean z = false;
            if (itemCount >= 1) {
                adapterHelper.mPendingUpdates.add(adapterHelper.obtainUpdateOp(2, positionStart, itemCount, null));
                adapterHelper.mExistingUpdateTypes |= 2;
                if (adapterHelper.mPendingUpdates.size() == 1) {
                    z = true;
                }
            }
            if (z) {
                triggerUpdateProcessor();
            }
        }

        public void triggerUpdateProcessor() {
            if (RecyclerView.POST_UPDATES_ON_ANIMATION) {
                RecyclerView recyclerView = RecyclerView.this;
                if (recyclerView.mHasFixedSize && recyclerView.mIsAttached) {
                    Runnable runnable = recyclerView.mUpdateChildViewsRunnable;
                    WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                    recyclerView.postOnAnimation(runnable);
                    return;
                }
            }
            RecyclerView recyclerView2 = RecyclerView.this;
            recyclerView2.mAdapterUpdateDuringMeasure = true;
            recyclerView2.requestLayout();
        }
    }

    /* loaded from: classes.dex */
    public static abstract class SmoothScroller {
        public LayoutManager mLayoutManager;
        public boolean mPendingInitialRun;
        public RecyclerView mRecyclerView;
        public boolean mRunning;
        public boolean mStarted;
        public View mTargetView;
        public int mTargetPosition = -1;
        public final Action mRecyclingAction = new Action(0, 0);

        /* loaded from: classes.dex */
        public static class Action {
            public int mDx;
            public int mDy;
            public int mJumpToPosition = -1;
            public boolean mChanged = false;
            public int mConsecutiveUpdates = 0;
            public int mDuration = RecyclerView.UNDEFINED_DURATION;
            public Interpolator mInterpolator = null;

            public Action(int dx, int dy) {
                this.mDx = dx;
                this.mDy = dy;
            }

            public void runIfNecessary(RecyclerView recyclerView) {
                int i = this.mJumpToPosition;
                if (i >= 0) {
                    this.mJumpToPosition = -1;
                    recyclerView.jumpToPositionForSmoothScroller(i);
                    this.mChanged = false;
                } else if (this.mChanged) {
                    Interpolator interpolator = this.mInterpolator;
                    if (interpolator == null || this.mDuration >= 1) {
                        int i2 = this.mDuration;
                        if (i2 >= 1) {
                            recyclerView.mViewFlinger.smoothScrollBy(this.mDx, this.mDy, i2, interpolator);
                            int i3 = this.mConsecutiveUpdates + 1;
                            this.mConsecutiveUpdates = i3;
                            if (i3 > 10) {
                                Log.e(RecyclerView.TAG, "Smooth Scroll action is being updated too frequently. Make sure you are not changing it unless necessary");
                            }
                            this.mChanged = false;
                            return;
                        }
                        throw new IllegalStateException("Scroll duration must be a positive number");
                    }
                    throw new IllegalStateException("If you provide an interpolator, you must set a positive duration");
                } else {
                    this.mConsecutiveUpdates = 0;
                }
            }

            public void update(int dx, int dy, int duration, Interpolator interpolator) {
                this.mDx = dx;
                this.mDy = dy;
                this.mDuration = duration;
                this.mInterpolator = interpolator;
                this.mChanged = true;
            }
        }

        /* loaded from: classes.dex */
        public interface ScrollVectorProvider {
            PointF computeScrollVectorForPosition(int targetPosition);
        }

        public PointF computeScrollVectorForPosition(int targetPosition) {
            LayoutManager layoutManager = this.mLayoutManager;
            if (layoutManager instanceof ScrollVectorProvider) {
                return ((ScrollVectorProvider) layoutManager).computeScrollVectorForPosition(targetPosition);
            }
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("You should override computeScrollVectorForPosition when the LayoutManager does not implement ");
            m.append(ScrollVectorProvider.class.getCanonicalName());
            Log.w(RecyclerView.TAG, m.toString());
            return null;
        }

        public void onAnimation(int dx, int dy) {
            float f;
            PointF computeScrollVectorForPosition;
            RecyclerView recyclerView = this.mRecyclerView;
            if (this.mTargetPosition == -1 || recyclerView == null) {
                stop();
            }
            if (this.mPendingInitialRun && this.mTargetView == null && this.mLayoutManager != null && (computeScrollVectorForPosition = computeScrollVectorForPosition(this.mTargetPosition)) != null) {
                float f2 = computeScrollVectorForPosition.x;
                if (!(f2 == HingeAngleProviderKt.FULLY_CLOSED_DEGREES && computeScrollVectorForPosition.y == HingeAngleProviderKt.FULLY_CLOSED_DEGREES)) {
                    recyclerView.scrollStep((int) Math.signum(f2), (int) Math.signum(computeScrollVectorForPosition.y), null);
                }
            }
            boolean z = false;
            this.mPendingInitialRun = false;
            View view = this.mTargetView;
            if (view != null) {
                if (this.mRecyclerView.getChildLayoutPosition(view) == this.mTargetPosition) {
                    onTargetFound(this.mTargetView, recyclerView.mState, this.mRecyclingAction);
                    this.mRecyclingAction.runIfNecessary(recyclerView);
                    stop();
                } else {
                    Log.e(RecyclerView.TAG, "Passed over target position while smooth scrolling.");
                    this.mTargetView = null;
                }
            }
            if (this.mRunning) {
                State state = recyclerView.mState;
                Action action = this.mRecyclingAction;
                LinearSmoothScroller linearSmoothScroller = (LinearSmoothScroller) this;
                if (linearSmoothScroller.mRecyclerView.mLayout.getChildCount() == 0) {
                    linearSmoothScroller.stop();
                } else {
                    int i = linearSmoothScroller.mInterimTargetDx;
                    int i2 = i - dx;
                    if (i * i2 <= 0) {
                        i2 = 0;
                    }
                    linearSmoothScroller.mInterimTargetDx = i2;
                    int i3 = linearSmoothScroller.mInterimTargetDy;
                    int i4 = i3 - dy;
                    if (i3 * i4 <= 0) {
                        i4 = 0;
                    }
                    linearSmoothScroller.mInterimTargetDy = i4;
                    if (i2 == 0 && i4 == 0) {
                        PointF computeScrollVectorForPosition2 = linearSmoothScroller.computeScrollVectorForPosition(linearSmoothScroller.mTargetPosition);
                        if (computeScrollVectorForPosition2 != null) {
                            if (!(computeScrollVectorForPosition2.x == HingeAngleProviderKt.FULLY_CLOSED_DEGREES && computeScrollVectorForPosition2.y == HingeAngleProviderKt.FULLY_CLOSED_DEGREES)) {
                                float f3 = computeScrollVectorForPosition2.y;
                                float sqrt = (float) Math.sqrt((f3 * f3) + (f * f));
                                float f4 = computeScrollVectorForPosition2.x / sqrt;
                                computeScrollVectorForPosition2.x = f4;
                                float f5 = computeScrollVectorForPosition2.y / sqrt;
                                computeScrollVectorForPosition2.y = f5;
                                linearSmoothScroller.mTargetVector = computeScrollVectorForPosition2;
                                linearSmoothScroller.mInterimTargetDx = (int) (f4 * 10000.0f);
                                linearSmoothScroller.mInterimTargetDy = (int) (f5 * 10000.0f);
                                action.update((int) (linearSmoothScroller.mInterimTargetDx * 1.2f), (int) (linearSmoothScroller.mInterimTargetDy * 1.2f), (int) (linearSmoothScroller.calculateTimeForScrolling(10000) * 1.2f), linearSmoothScroller.mLinearInterpolator);
                            }
                        }
                        action.mJumpToPosition = linearSmoothScroller.mTargetPosition;
                        linearSmoothScroller.stop();
                    }
                }
                Action action2 = this.mRecyclingAction;
                if (action2.mJumpToPosition >= 0) {
                    z = true;
                }
                action2.runIfNecessary(recyclerView);
                if (z && this.mRunning) {
                    this.mPendingInitialRun = true;
                    recyclerView.mViewFlinger.postOnAnimation();
                }
            }
        }

        public abstract void onTargetFound(View targetView, State state, Action action);

        public final void stop() {
            if (this.mRunning) {
                this.mRunning = false;
                LinearSmoothScroller linearSmoothScroller = (LinearSmoothScroller) this;
                linearSmoothScroller.mInterimTargetDy = 0;
                linearSmoothScroller.mInterimTargetDx = 0;
                linearSmoothScroller.mTargetVector = null;
                this.mRecyclerView.mState.mTargetPosition = -1;
                this.mTargetView = null;
                this.mTargetPosition = -1;
                this.mPendingInitialRun = false;
                LayoutManager layoutManager = this.mLayoutManager;
                if (layoutManager.mSmoothScroller == this) {
                    layoutManager.mSmoothScroller = null;
                }
                this.mLayoutManager = null;
                this.mRecyclerView = null;
            }
        }
    }

    /* loaded from: classes.dex */
    public static class State {
        public long mFocusedItemId;
        public int mFocusedItemPosition;
        public int mFocusedSubChildId;
        public int mTargetPosition = -1;
        public int mPreviousLayoutItemCount = 0;
        public int mDeletedInvisibleItemCountSincePreviousLayout = 0;
        public int mLayoutStep = 1;
        public int mItemCount = 0;
        public boolean mStructureChanged = false;
        public boolean mInPreLayout = false;
        public boolean mTrackOldChangeHolders = false;
        public boolean mIsMeasuring = false;
        public boolean mRunSimpleAnimations = false;
        public boolean mRunPredictiveAnimations = false;

        public void assertLayoutStep(int accepted) {
            if ((this.mLayoutStep & accepted) == 0) {
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Layout state should be one of ");
                m.append(Integer.toBinaryString(accepted));
                m.append(" but it is ");
                m.append(Integer.toBinaryString(this.mLayoutStep));
                throw new IllegalStateException(m.toString());
            }
        }

        public int getItemCount() {
            if (this.mInPreLayout) {
                return this.mPreviousLayoutItemCount - this.mDeletedInvisibleItemCountSincePreviousLayout;
            }
            return this.mItemCount;
        }

        public String toString() {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("State{mTargetPosition=");
            m.append(this.mTargetPosition);
            m.append(", mData=");
            m.append((Object) null);
            m.append(", mItemCount=");
            m.append(this.mItemCount);
            m.append(", mIsMeasuring=");
            m.append(this.mIsMeasuring);
            m.append(", mPreviousLayoutItemCount=");
            m.append(this.mPreviousLayoutItemCount);
            m.append(", mDeletedInvisibleItemCountSincePreviousLayout=");
            m.append(this.mDeletedInvisibleItemCountSincePreviousLayout);
            m.append(", mStructureChanged=");
            m.append(this.mStructureChanged);
            m.append(", mInPreLayout=");
            m.append(this.mInPreLayout);
            m.append(", mRunSimpleAnimations=");
            m.append(this.mRunSimpleAnimations);
            m.append(", mRunPredictiveAnimations=");
            m.append(this.mRunPredictiveAnimations);
            m.append('}');
            return m.toString();
        }
    }

    /* loaded from: classes.dex */
    public static class StretchEdgeEffectFactory extends EdgeEffectFactory {
        @Override // androidx.recyclerview.widget.RecyclerView.EdgeEffectFactory
        public EdgeEffect createEdgeEffect(RecyclerView view, int direction) {
            return new EdgeEffect(view.getContext());
        }
    }

    /* loaded from: classes.dex */
    public static abstract class ViewCacheExtension {
    }

    /* loaded from: classes.dex */
    public class ViewFlinger implements Runnable {
        public Interpolator mInterpolator;
        public int mLastFlingX;
        public int mLastFlingY;
        public OverScroller mOverScroller;
        public boolean mEatRunOnAnimationRequest = false;
        public boolean mReSchedulePostAnimationCallback = false;

        public ViewFlinger() {
            Interpolator interpolator = RecyclerView.sQuinticInterpolator;
            this.mInterpolator = interpolator;
            this.mOverScroller = new OverScroller(RecyclerView.this.getContext(), interpolator);
        }

        public void postOnAnimation() {
            if (this.mEatRunOnAnimationRequest) {
                this.mReSchedulePostAnimationCallback = true;
                return;
            }
            RecyclerView.this.removeCallbacks(this);
            RecyclerView recyclerView = RecyclerView.this;
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            recyclerView.postOnAnimation(this);
        }

        @Override // java.lang.Runnable
        public void run() {
            int i;
            int i2;
            RecyclerView recyclerView = RecyclerView.this;
            if (recyclerView.mLayout == null) {
                stop();
                return;
            }
            this.mReSchedulePostAnimationCallback = false;
            this.mEatRunOnAnimationRequest = true;
            recyclerView.consumePendingUpdateOperations();
            OverScroller overScroller = this.mOverScroller;
            if (overScroller.computeScrollOffset()) {
                int currX = overScroller.getCurrX();
                int currY = overScroller.getCurrY();
                int i3 = currX - this.mLastFlingX;
                int i4 = currY - this.mLastFlingY;
                this.mLastFlingX = currX;
                this.mLastFlingY = currY;
                RecyclerView recyclerView2 = RecyclerView.this;
                int[] iArr = recyclerView2.mReusableIntPair;
                iArr[0] = 0;
                iArr[1] = 0;
                if (recyclerView2.dispatchNestedPreScroll(i3, i4, iArr, null, 1)) {
                    int[] iArr2 = RecyclerView.this.mReusableIntPair;
                    i3 -= iArr2[0];
                    i4 -= iArr2[1];
                }
                if (RecyclerView.this.getOverScrollMode() != 2) {
                    RecyclerView.this.considerReleasingGlowsOnScroll(i3, i4);
                }
                RecyclerView recyclerView3 = RecyclerView.this;
                if (recyclerView3.mAdapter != null) {
                    int[] iArr3 = recyclerView3.mReusableIntPair;
                    iArr3[0] = 0;
                    iArr3[1] = 0;
                    recyclerView3.scrollStep(i3, i4, iArr3);
                    RecyclerView recyclerView4 = RecyclerView.this;
                    int[] iArr4 = recyclerView4.mReusableIntPair;
                    i = iArr4[0];
                    i2 = iArr4[1];
                    i3 -= i;
                    i4 -= i2;
                    SmoothScroller smoothScroller = recyclerView4.mLayout.mSmoothScroller;
                    if (smoothScroller != null && !smoothScroller.mPendingInitialRun && smoothScroller.mRunning) {
                        int itemCount = recyclerView4.mState.getItemCount();
                        if (itemCount == 0) {
                            smoothScroller.stop();
                        } else if (smoothScroller.mTargetPosition >= itemCount) {
                            smoothScroller.mTargetPosition = itemCount - 1;
                            smoothScroller.onAnimation(i, i2);
                        } else {
                            smoothScroller.onAnimation(i, i2);
                        }
                    }
                } else {
                    i2 = 0;
                    i = 0;
                }
                if (!RecyclerView.this.mItemDecorations.isEmpty()) {
                    RecyclerView.this.invalidate();
                }
                RecyclerView recyclerView5 = RecyclerView.this;
                int[] iArr5 = recyclerView5.mReusableIntPair;
                iArr5[0] = 0;
                iArr5[1] = 0;
                recyclerView5.dispatchNestedScroll(i, i2, i3, i4, null, 1, iArr5);
                RecyclerView recyclerView6 = RecyclerView.this;
                int[] iArr6 = recyclerView6.mReusableIntPair;
                int i5 = i3 - iArr6[0];
                int i6 = i4 - iArr6[1];
                if (!(i == 0 && i2 == 0)) {
                    recyclerView6.dispatchOnScrolled(i, i2);
                }
                if (!RecyclerView.this.awakenScrollBars()) {
                    RecyclerView.this.invalidate();
                }
                boolean z = overScroller.isFinished() || (((overScroller.getCurrX() == overScroller.getFinalX()) || i5 != 0) && ((overScroller.getCurrY() == overScroller.getFinalY()) || i6 != 0));
                RecyclerView recyclerView7 = RecyclerView.this;
                SmoothScroller smoothScroller2 = recyclerView7.mLayout.mSmoothScroller;
                if ((smoothScroller2 != null && smoothScroller2.mPendingInitialRun) || !z) {
                    postOnAnimation();
                    RecyclerView recyclerView8 = RecyclerView.this;
                    GapWorker gapWorker = recyclerView8.mGapWorker;
                    if (gapWorker != null) {
                        gapWorker.postFromTraversal(recyclerView8, i, i2);
                    }
                } else {
                    if (recyclerView7.getOverScrollMode() != 2) {
                        int currVelocity = (int) overScroller.getCurrVelocity();
                        int i7 = i5 < 0 ? -currVelocity : i5 > 0 ? currVelocity : 0;
                        if (i6 < 0) {
                            currVelocity = -currVelocity;
                        } else if (i6 <= 0) {
                            currVelocity = 0;
                        }
                        RecyclerView.this.absorbGlows(i7, currVelocity);
                    }
                    if (RecyclerView.ALLOW_THREAD_GAP_WORK) {
                        GapWorker.LayoutPrefetchRegistryImpl layoutPrefetchRegistryImpl = RecyclerView.this.mPrefetchRegistry;
                        int[] iArr7 = layoutPrefetchRegistryImpl.mPrefetchArray;
                        if (iArr7 != null) {
                            Arrays.fill(iArr7, -1);
                        }
                        layoutPrefetchRegistryImpl.mCount = 0;
                    }
                }
            }
            SmoothScroller smoothScroller3 = RecyclerView.this.mLayout.mSmoothScroller;
            if (smoothScroller3 != null && smoothScroller3.mPendingInitialRun) {
                smoothScroller3.onAnimation(0, 0);
            }
            this.mEatRunOnAnimationRequest = false;
            if (this.mReSchedulePostAnimationCallback) {
                RecyclerView.this.removeCallbacks(this);
                RecyclerView recyclerView9 = RecyclerView.this;
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                recyclerView9.postOnAnimation(this);
                return;
            }
            RecyclerView.this.setScrollState(0);
            RecyclerView.this.stopNestedScroll(1);
        }

        public void smoothScrollBy(int dx, int dy, int duration, Interpolator interpolator) {
            if (duration == Integer.MIN_VALUE) {
                int abs = Math.abs(dx);
                int abs2 = Math.abs(dy);
                boolean z = abs > abs2;
                RecyclerView recyclerView = RecyclerView.this;
                int width = z ? recyclerView.getWidth() : recyclerView.getHeight();
                if (!z) {
                    abs = abs2;
                }
                duration = Math.min((int) (((abs / width) + 1.0f) * 300.0f), (int) RecyclerView.MAX_SCROLL_DURATION);
            }
            int i = duration;
            if (interpolator == null) {
                interpolator = RecyclerView.sQuinticInterpolator;
            }
            if (this.mInterpolator != interpolator) {
                this.mInterpolator = interpolator;
                this.mOverScroller = new OverScroller(RecyclerView.this.getContext(), interpolator);
            }
            this.mLastFlingY = 0;
            this.mLastFlingX = 0;
            RecyclerView.this.setScrollState(2);
            this.mOverScroller.startScroll(0, 0, dx, dy, i);
            postOnAnimation();
        }

        public void stop() {
            RecyclerView.this.removeCallbacks(this);
            this.mOverScroller.abortAnimation();
        }
    }

    /* loaded from: classes.dex */
    public static abstract class ViewHolder {
        public static final List<Object> FULLUPDATE_PAYLOADS = Collections.emptyList();
        public final View itemView;
        public Adapter<? extends ViewHolder> mBindingAdapter;
        public int mFlags;
        public WeakReference<RecyclerView> mNestedRecyclerView;
        public RecyclerView mOwnerRecyclerView;
        public int mPosition = -1;
        public int mOldPosition = -1;
        public long mItemId = -1;
        public int mItemViewType = -1;
        public int mPreLayoutPosition = -1;
        public ViewHolder mShadowedHolder = null;
        public ViewHolder mShadowingHolder = null;
        public List<Object> mPayloads = null;
        public List<Object> mUnmodifiedPayloads = null;
        public int mIsRecyclableCount = 0;
        public Recycler mScrapContainer = null;
        public boolean mInChangeScrap = false;
        public int mWasImportantForAccessibilityBeforeHidden = 0;
        public int mPendingAccessibilityState = -1;

        public ViewHolder(View itemView) {
            if (itemView != null) {
                this.itemView = itemView;
                return;
            }
            throw new IllegalArgumentException("itemView may not be null");
        }

        public void addChangePayload(Object payload) {
            if (payload == null) {
                addFlags(QuickStepContract.SYSUI_STATE_SEARCH_DISABLED);
            } else if ((1024 & this.mFlags) == 0) {
                if (this.mPayloads == null) {
                    ArrayList arrayList = new ArrayList();
                    this.mPayloads = arrayList;
                    this.mUnmodifiedPayloads = Collections.unmodifiableList(arrayList);
                }
                this.mPayloads.add(payload);
            }
        }

        public void addFlags(int flags) {
            this.mFlags = flags | this.mFlags;
        }

        public void clearOldPosition() {
            this.mOldPosition = -1;
            this.mPreLayoutPosition = -1;
        }

        public void clearReturnedFromScrapFlag() {
            this.mFlags &= -33;
        }

        public final int getAbsoluteAdapterPosition() {
            RecyclerView recyclerView = this.mOwnerRecyclerView;
            if (recyclerView == null) {
                return -1;
            }
            return recyclerView.getAdapterPositionInRecyclerView(this);
        }

        public final int getLayoutPosition() {
            int i = this.mPreLayoutPosition;
            return i == -1 ? this.mPosition : i;
        }

        public List<Object> getUnmodifiedPayloads() {
            if ((this.mFlags & QuickStepContract.SYSUI_STATE_SEARCH_DISABLED) != 0) {
                return FULLUPDATE_PAYLOADS;
            }
            List<Object> list = this.mPayloads;
            if (list == null || list.size() == 0) {
                return FULLUPDATE_PAYLOADS;
            }
            return this.mUnmodifiedPayloads;
        }

        public boolean hasAnyOfTheFlags(int flags) {
            return (this.mFlags & flags) != 0;
        }

        public boolean isAttachedToTransitionOverlay() {
            return (this.itemView.getParent() == null || this.itemView.getParent() == this.mOwnerRecyclerView) ? false : true;
        }

        public boolean isBound() {
            return (this.mFlags & 1) != 0;
        }

        public boolean isInvalid() {
            return (this.mFlags & 4) != 0;
        }

        public final boolean isRecyclable() {
            if ((this.mFlags & 16) == 0) {
                View view = this.itemView;
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                if (!view.hasTransientState()) {
                    return true;
                }
            }
            return false;
        }

        public boolean isRemoved() {
            return (this.mFlags & 8) != 0;
        }

        public boolean isScrap() {
            return this.mScrapContainer != null;
        }

        public boolean isTmpDetached() {
            return (this.mFlags & 256) != 0;
        }

        public boolean isUpdated() {
            return (this.mFlags & 2) != 0;
        }

        public void offsetPosition(int offset, boolean applyToPreLayout) {
            if (this.mOldPosition == -1) {
                this.mOldPosition = this.mPosition;
            }
            if (this.mPreLayoutPosition == -1) {
                this.mPreLayoutPosition = this.mPosition;
            }
            if (applyToPreLayout) {
                this.mPreLayoutPosition += offset;
            }
            this.mPosition += offset;
            if (this.itemView.getLayoutParams() != null) {
                ((LayoutParams) this.itemView.getLayoutParams()).mInsetsDirty = true;
            }
        }

        public void resetInternal() {
            this.mFlags = 0;
            this.mPosition = -1;
            this.mOldPosition = -1;
            this.mItemId = -1L;
            this.mPreLayoutPosition = -1;
            this.mIsRecyclableCount = 0;
            this.mShadowedHolder = null;
            this.mShadowingHolder = null;
            List<Object> list = this.mPayloads;
            if (list != null) {
                list.clear();
            }
            this.mFlags &= -1025;
            this.mWasImportantForAccessibilityBeforeHidden = 0;
            this.mPendingAccessibilityState = -1;
            RecyclerView.clearNestedRecyclerViewIfNotNested(this);
        }

        void setFlags(int flags, int mask) {
            this.mFlags = (flags & mask) | (this.mFlags & (~mask));
        }

        public final void setIsRecyclable(boolean recyclable) {
            int i = this.mIsRecyclableCount;
            int i2 = recyclable ? i - 1 : i + 1;
            this.mIsRecyclableCount = i2;
            if (i2 < 0) {
                this.mIsRecyclableCount = 0;
                Log.e("View", "isRecyclable decremented below 0: unmatched pair of setIsRecyable() calls for " + this);
            } else if (!recyclable && i2 == 1) {
                this.mFlags |= 16;
            } else if (recyclable && i2 == 0) {
                this.mFlags &= -17;
            }
        }

        public boolean shouldIgnore() {
            return (this.mFlags & 128) != 0;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder((getClass().isAnonymousClass() ? "ViewHolder" : getClass().getSimpleName()) + "{" + Integer.toHexString(hashCode()) + " position=" + this.mPosition + " id=" + this.mItemId + ", oldPos=" + this.mOldPosition + ", pLpos:" + this.mPreLayoutPosition);
            if (isScrap()) {
                sb.append(" scrap ");
                sb.append(this.mInChangeScrap ? "[changeScrap]" : "[attachedScrap]");
            }
            if (isInvalid()) {
                sb.append(" invalid");
            }
            if (!isBound()) {
                sb.append(" unbound");
            }
            boolean z = true;
            if ((this.mFlags & 2) != 0) {
                sb.append(" update");
            }
            if (isRemoved()) {
                sb.append(" removed");
            }
            if (shouldIgnore()) {
                sb.append(" ignored");
            }
            if (isTmpDetached()) {
                sb.append(" tmpDetached");
            }
            if (!isRecyclable()) {
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m(" not recyclable(");
                m.append(this.mIsRecyclableCount);
                m.append(")");
                sb.append(m.toString());
            }
            if ((this.mFlags & QuickStepContract.SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED) == 0 && !isInvalid()) {
                z = false;
            }
            if (z) {
                sb.append(" undefined adapter position");
            }
            if (this.itemView.getParent() == null) {
                sb.append(" no parent");
            }
            sb.append("}");
            return sb.toString();
        }

        public boolean wasReturnedFromScrap() {
            return (this.mFlags & 32) != 0;
        }
    }

    static {
        Class<?> cls = Integer.TYPE;
        LAYOUT_MANAGER_CONSTRUCTOR_SIGNATURE = new Class[]{Context.class, AttributeSet.class, cls, cls};
    }

    public RecyclerView(Context context) {
        this(context, null);
    }

    private void addAnimatingView(ViewHolder viewHolder) {
        View view = viewHolder.itemView;
        boolean z = view.getParent() == this;
        this.mRecycler.unscrapView(getChildViewHolder(view));
        if (viewHolder.isTmpDetached()) {
            this.mChildHelper.attachViewToParent(view, -1, view.getLayoutParams(), true);
        } else if (!z) {
            this.mChildHelper.addView(view, -1, true);
        } else {
            ChildHelper childHelper = this.mChildHelper;
            int indexOfChild = RecyclerView.this.indexOfChild(view);
            if (indexOfChild >= 0) {
                childHelper.mBucket.set(indexOfChild);
                childHelper.hideViewInternal(view);
                return;
            }
            throw new IllegalArgumentException("view is not a child, cannot hide " + view);
        }
    }

    private void animateChange(ViewHolder oldHolder, ViewHolder newHolder, ItemAnimator.ItemHolderInfo preInfo, ItemAnimator.ItemHolderInfo postInfo, boolean oldHolderDisappearing, boolean newHolderDisappearing) {
        oldHolder.setIsRecyclable(false);
        if (oldHolderDisappearing) {
            addAnimatingView(oldHolder);
        }
        if (oldHolder != newHolder) {
            if (newHolderDisappearing) {
                addAnimatingView(newHolder);
            }
            oldHolder.mShadowedHolder = newHolder;
            addAnimatingView(oldHolder);
            this.mRecycler.unscrapView(oldHolder);
            newHolder.setIsRecyclable(false);
            newHolder.mShadowingHolder = oldHolder;
        }
        if (this.mItemAnimator.animateChange(oldHolder, newHolder, preInfo, postInfo)) {
            postAnimationRunner();
        }
    }

    private void cancelScroll() {
        resetScroll();
        setScrollState(0);
    }

    public static void clearNestedRecyclerViewIfNotNested(ViewHolder holder) {
        WeakReference<RecyclerView> weakReference = holder.mNestedRecyclerView;
        if (weakReference != null) {
            RecyclerView recyclerView = weakReference.get();
            while (recyclerView != null) {
                if (recyclerView != holder.itemView) {
                    ViewParent parent = recyclerView.getParent();
                    recyclerView = parent instanceof View ? (View) parent : null;
                } else {
                    return;
                }
            }
            holder.mNestedRecyclerView = null;
        }
    }

    private void createLayoutManager(Context context, String className, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        ClassLoader classLoader;
        Constructor constructor;
        if (className != null) {
            String trim = className.trim();
            if (!trim.isEmpty()) {
                String fullClassName = getFullClassName(context, trim);
                try {
                    if (isInEditMode()) {
                        classLoader = getClass().getClassLoader();
                    } else {
                        classLoader = context.getClassLoader();
                    }
                    Class<? extends U> asSubclass = Class.forName(fullClassName, false, classLoader).asSubclass(LayoutManager.class);
                    Object[] objArr = null;
                    try {
                        constructor = asSubclass.getConstructor(LAYOUT_MANAGER_CONSTRUCTOR_SIGNATURE);
                        objArr = new Object[]{context, attrs, Integer.valueOf(defStyleAttr), Integer.valueOf(defStyleRes)};
                    } catch (NoSuchMethodException e) {
                        try {
                            constructor = asSubclass.getConstructor(new Class[0]);
                        } catch (NoSuchMethodException e2) {
                            e2.initCause(e);
                            throw new IllegalStateException(attrs.getPositionDescription() + ": Error creating LayoutManager " + fullClassName, e2);
                        }
                    }
                    constructor.setAccessible(true);
                    setLayoutManager((LayoutManager) constructor.newInstance(objArr));
                } catch (ClassCastException e3) {
                    throw new IllegalStateException(attrs.getPositionDescription() + ": Class is not a LayoutManager " + fullClassName, e3);
                } catch (ClassNotFoundException e4) {
                    throw new IllegalStateException(attrs.getPositionDescription() + ": Unable to find LayoutManager " + fullClassName, e4);
                } catch (IllegalAccessException e5) {
                    throw new IllegalStateException(attrs.getPositionDescription() + ": Cannot access non-public constructor " + fullClassName, e5);
                } catch (InstantiationException e6) {
                    throw new IllegalStateException(attrs.getPositionDescription() + ": Could not instantiate the LayoutManager: " + fullClassName, e6);
                } catch (InvocationTargetException e7) {
                    throw new IllegalStateException(attrs.getPositionDescription() + ": Could not instantiate the LayoutManager: " + fullClassName, e7);
                }
            }
        }
    }

    private boolean didChildRangeChange(int minPositionPreLayout, int maxPositionPreLayout) {
        findMinMaxChildLayoutPositions(this.mMinMaxLayoutPositions);
        int[] iArr = this.mMinMaxLayoutPositions;
        return (iArr[0] == minPositionPreLayout && iArr[1] == maxPositionPreLayout) ? false : true;
    }

    private void dispatchContentChangedIfNecessary() {
        int i = this.mEatenAccessibilityChangeFlags;
        this.mEatenAccessibilityChangeFlags = 0;
        if (i != 0 && isAccessibilityEnabled()) {
            AccessibilityEvent obtain = AccessibilityEvent.obtain();
            obtain.setEventType(QuickStepContract.SYSUI_STATE_QUICK_SETTINGS_EXPANDED);
            obtain.setContentChangeTypes(i);
            sendAccessibilityEventUnchecked(obtain);
        }
    }

    private void dispatchLayoutStep1() {
        this.mState.assertLayoutStep(1);
        fillRemainingScrollValues(this.mState);
        this.mState.mIsMeasuring = false;
        startInterceptRequestLayout();
        ViewInfoStore viewInfoStore = this.mViewInfoStore;
        viewInfoStore.mLayoutHolderMap.clear();
        viewInfoStore.mOldChangedHolders.clear();
        onEnterLayoutOrScroll();
        processAdapterUpdatesAndSetAnimationFlags();
        saveFocusInfo();
        State state = this.mState;
        state.mTrackOldChangeHolders = state.mRunSimpleAnimations && this.mItemsChanged;
        this.mItemsChanged = false;
        this.mItemsAddedOrRemoved = false;
        state.mInPreLayout = state.mRunPredictiveAnimations;
        state.mItemCount = this.mAdapter.getItemCount();
        findMinMaxChildLayoutPositions(this.mMinMaxLayoutPositions);
        if (this.mState.mRunSimpleAnimations) {
            int childCount = this.mChildHelper.getChildCount();
            for (int i = 0; i < childCount; i++) {
                ViewHolder childViewHolderInt = getChildViewHolderInt(this.mChildHelper.getChildAt(i));
                if (!childViewHolderInt.shouldIgnore() && (!childViewHolderInt.isInvalid() || this.mAdapter.mHasStableIds)) {
                    ItemAnimator itemAnimator = this.mItemAnimator;
                    ItemAnimator.buildAdapterChangeFlagsForAnimations(childViewHolderInt);
                    childViewHolderInt.getUnmodifiedPayloads();
                    this.mViewInfoStore.addToPreLayout(childViewHolderInt, itemAnimator.recordPreLayoutInformation(childViewHolderInt));
                    if (this.mState.mTrackOldChangeHolders && childViewHolderInt.isUpdated() && !childViewHolderInt.isRemoved() && !childViewHolderInt.shouldIgnore() && !childViewHolderInt.isInvalid()) {
                        this.mViewInfoStore.mOldChangedHolders.put(getChangedHolderKey(childViewHolderInt), childViewHolderInt);
                    }
                }
            }
        }
        if (this.mState.mRunPredictiveAnimations) {
            saveOldPositions();
            State state2 = this.mState;
            boolean z = state2.mStructureChanged;
            state2.mStructureChanged = false;
            this.mLayout.onLayoutChildren(this.mRecycler, state2);
            this.mState.mStructureChanged = z;
            for (int i2 = 0; i2 < this.mChildHelper.getChildCount(); i2++) {
                ViewHolder childViewHolderInt2 = getChildViewHolderInt(this.mChildHelper.getChildAt(i2));
                if (!childViewHolderInt2.shouldIgnore()) {
                    ViewInfoStore.InfoRecord orDefault = this.mViewInfoStore.mLayoutHolderMap.getOrDefault(childViewHolderInt2, null);
                    if (!((orDefault == null || (orDefault.flags & 4) == 0) ? false : true)) {
                        ItemAnimator.buildAdapterChangeFlagsForAnimations(childViewHolderInt2);
                        boolean hasAnyOfTheFlags = childViewHolderInt2.hasAnyOfTheFlags(QuickStepContract.SYSUI_STATE_ASSIST_GESTURE_CONSTRAINED);
                        ItemAnimator itemAnimator2 = this.mItemAnimator;
                        childViewHolderInt2.getUnmodifiedPayloads();
                        ItemAnimator.ItemHolderInfo recordPreLayoutInformation = itemAnimator2.recordPreLayoutInformation(childViewHolderInt2);
                        if (hasAnyOfTheFlags) {
                            recordAnimationInfoIfBouncedHiddenView(childViewHolderInt2, recordPreLayoutInformation);
                        } else {
                            ViewInfoStore viewInfoStore2 = this.mViewInfoStore;
                            ViewInfoStore.InfoRecord orDefault2 = viewInfoStore2.mLayoutHolderMap.getOrDefault(childViewHolderInt2, null);
                            if (orDefault2 == null) {
                                orDefault2 = ViewInfoStore.InfoRecord.obtain();
                                viewInfoStore2.mLayoutHolderMap.put(childViewHolderInt2, orDefault2);
                            }
                            orDefault2.flags |= 2;
                            orDefault2.preInfo = recordPreLayoutInformation;
                        }
                    }
                }
            }
            clearOldPositions();
        } else {
            clearOldPositions();
        }
        onExitLayoutOrScroll();
        stopInterceptRequestLayout(false);
        this.mState.mLayoutStep = 2;
    }

    private void dispatchLayoutStep2() {
        startInterceptRequestLayout();
        onEnterLayoutOrScroll();
        this.mState.assertLayoutStep(6);
        this.mAdapterHelper.consumeUpdatesInOnePass();
        this.mState.mItemCount = this.mAdapter.getItemCount();
        this.mState.mDeletedInvisibleItemCountSincePreviousLayout = 0;
        boolean z = true;
        if (this.mPendingSavedState != null) {
            Adapter adapter = this.mAdapter;
            int $enumboxing$ordinal = SolverVariable$Type$r8$EnumUnboxingUtility.$enumboxing$ordinal(adapter.mStateRestorationPolicy);
            if ($enumboxing$ordinal == 1 ? adapter.getItemCount() > 0 : $enumboxing$ordinal != 2) {
                Parcelable parcelable = this.mPendingSavedState.mLayoutState;
                if (parcelable != null) {
                    this.mLayout.onRestoreInstanceState(parcelable);
                }
                this.mPendingSavedState = null;
            }
        }
        State state = this.mState;
        state.mInPreLayout = false;
        this.mLayout.onLayoutChildren(this.mRecycler, state);
        State state2 = this.mState;
        state2.mStructureChanged = false;
        if (!state2.mRunSimpleAnimations || this.mItemAnimator == null) {
            z = false;
        }
        state2.mRunSimpleAnimations = z;
        state2.mLayoutStep = 4;
        onExitLayoutOrScroll();
        stopInterceptRequestLayout(false);
    }

    private void dispatchLayoutStep3() {
        boolean z;
        this.mState.assertLayoutStep(4);
        startInterceptRequestLayout();
        onEnterLayoutOrScroll();
        State state = this.mState;
        state.mLayoutStep = 1;
        if (state.mRunSimpleAnimations) {
            for (int childCount = this.mChildHelper.getChildCount() - 1; childCount >= 0; childCount--) {
                ViewHolder childViewHolderInt = getChildViewHolderInt(this.mChildHelper.getChildAt(childCount));
                if (!childViewHolderInt.shouldIgnore()) {
                    long changedHolderKey = getChangedHolderKey(childViewHolderInt);
                    Objects.requireNonNull(this.mItemAnimator);
                    ItemAnimator.ItemHolderInfo itemHolderInfo = new ItemAnimator.ItemHolderInfo();
                    View view = childViewHolderInt.itemView;
                    itemHolderInfo.left = view.getLeft();
                    itemHolderInfo.top = view.getTop();
                    view.getRight();
                    view.getBottom();
                    ViewHolder viewHolder = this.mViewInfoStore.mOldChangedHolders.get(changedHolderKey, null);
                    if (viewHolder == null || viewHolder.shouldIgnore()) {
                        this.mViewInfoStore.addToPostLayout(childViewHolderInt, itemHolderInfo);
                    } else {
                        boolean isDisappearing = this.mViewInfoStore.isDisappearing(viewHolder);
                        boolean isDisappearing2 = this.mViewInfoStore.isDisappearing(childViewHolderInt);
                        if (!isDisappearing || viewHolder != childViewHolderInt) {
                            ItemAnimator.ItemHolderInfo popFromLayoutStep = this.mViewInfoStore.popFromLayoutStep(viewHolder, 4);
                            this.mViewInfoStore.addToPostLayout(childViewHolderInt, itemHolderInfo);
                            ItemAnimator.ItemHolderInfo popFromLayoutStep2 = this.mViewInfoStore.popFromLayoutStep(childViewHolderInt, 8);
                            if (popFromLayoutStep == null) {
                                handleMissingPreInfoForChangeError(changedHolderKey, childViewHolderInt, viewHolder);
                            } else {
                                animateChange(viewHolder, childViewHolderInt, popFromLayoutStep, popFromLayoutStep2, isDisappearing, isDisappearing2);
                            }
                        } else {
                            this.mViewInfoStore.addToPostLayout(childViewHolderInt, itemHolderInfo);
                        }
                    }
                }
            }
            ViewInfoStore viewInfoStore = this.mViewInfoStore;
            ViewInfoStore.ProcessCallback processCallback = this.mViewInfoProcessCallback;
            for (int i = viewInfoStore.mLayoutHolderMap.mSize - 1; i >= 0; i--) {
                ViewHolder keyAt = viewInfoStore.mLayoutHolderMap.keyAt(i);
                ViewInfoStore.InfoRecord removeAt = viewInfoStore.mLayoutHolderMap.removeAt(i);
                int i2 = removeAt.flags;
                if ((i2 & 3) == 3) {
                    RecyclerView recyclerView = RecyclerView.this;
                    recyclerView.mLayout.removeAndRecycleView(keyAt.itemView, recyclerView.mRecycler);
                } else if ((i2 & 1) != 0) {
                    ItemAnimator.ItemHolderInfo itemHolderInfo2 = removeAt.preInfo;
                    if (itemHolderInfo2 == null) {
                        RecyclerView recyclerView2 = RecyclerView.this;
                        recyclerView2.mLayout.removeAndRecycleView(keyAt.itemView, recyclerView2.mRecycler);
                    } else {
                        ItemAnimator.ItemHolderInfo itemHolderInfo3 = removeAt.postInfo;
                        AnonymousClass4 r8 = (AnonymousClass4) processCallback;
                        RecyclerView.this.mRecycler.unscrapView(keyAt);
                        RecyclerView.this.animateDisappearance(keyAt, itemHolderInfo2, itemHolderInfo3);
                    }
                } else if ((i2 & 14) == 14) {
                    RecyclerView.this.animateAppearance(keyAt, removeAt.preInfo, removeAt.postInfo);
                } else if ((i2 & 12) == 12) {
                    ItemAnimator.ItemHolderInfo itemHolderInfo4 = removeAt.preInfo;
                    ItemAnimator.ItemHolderInfo itemHolderInfo5 = removeAt.postInfo;
                    AnonymousClass4 r82 = (AnonymousClass4) processCallback;
                    Objects.requireNonNull(r82);
                    keyAt.setIsRecyclable(false);
                    RecyclerView recyclerView3 = RecyclerView.this;
                    if (!recyclerView3.mDataSetHasChangedAfterLayout) {
                        SimpleItemAnimator simpleItemAnimator = (SimpleItemAnimator) recyclerView3.mItemAnimator;
                        Objects.requireNonNull(simpleItemAnimator);
                        int i3 = itemHolderInfo4.left;
                        int i4 = itemHolderInfo5.left;
                        if (i3 == i4 && itemHolderInfo4.top == itemHolderInfo5.top) {
                            simpleItemAnimator.dispatchAnimationFinished(keyAt);
                            z = false;
                        } else {
                            z = simpleItemAnimator.animateMove(keyAt, i3, itemHolderInfo4.top, i4, itemHolderInfo5.top);
                        }
                        if (z) {
                            RecyclerView.this.postAnimationRunner();
                        }
                    } else if (recyclerView3.mItemAnimator.animateChange(keyAt, keyAt, itemHolderInfo4, itemHolderInfo5)) {
                        RecyclerView.this.postAnimationRunner();
                    }
                } else if ((i2 & 4) != 0) {
                    ItemAnimator.ItemHolderInfo itemHolderInfo6 = removeAt.preInfo;
                    AnonymousClass4 r6 = (AnonymousClass4) processCallback;
                    RecyclerView.this.mRecycler.unscrapView(keyAt);
                    RecyclerView.this.animateDisappearance(keyAt, itemHolderInfo6, null);
                } else if ((i2 & 8) != 0) {
                    RecyclerView.this.animateAppearance(keyAt, removeAt.preInfo, removeAt.postInfo);
                }
                ViewInfoStore.InfoRecord.recycle(removeAt);
            }
        }
        this.mLayout.removeAndRecycleScrapInt(this.mRecycler);
        State state2 = this.mState;
        state2.mPreviousLayoutItemCount = state2.mItemCount;
        this.mDataSetHasChangedAfterLayout = false;
        this.mDispatchItemsChangedEvent = false;
        state2.mRunSimpleAnimations = false;
        state2.mRunPredictiveAnimations = false;
        this.mLayout.mRequestedSimpleAnimations = false;
        ArrayList<ViewHolder> arrayList = this.mRecycler.mChangedScrap;
        if (arrayList != null) {
            arrayList.clear();
        }
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager.mPrefetchMaxObservedInInitialPrefetch) {
            layoutManager.mPrefetchMaxCountObserved = 0;
            layoutManager.mPrefetchMaxObservedInInitialPrefetch = false;
            this.mRecycler.updateViewCacheSize();
        }
        this.mLayout.onLayoutCompleted(this.mState);
        onExitLayoutOrScroll();
        stopInterceptRequestLayout(false);
        ViewInfoStore viewInfoStore2 = this.mViewInfoStore;
        viewInfoStore2.mLayoutHolderMap.clear();
        viewInfoStore2.mOldChangedHolders.clear();
        int[] iArr = this.mMinMaxLayoutPositions;
        if (didChildRangeChange(iArr[0], iArr[1])) {
            dispatchOnScrolled(0, 0);
        }
        recoverFocusFromState();
        resetFocusInfo();
    }

    private boolean dispatchToOnItemTouchListeners(MotionEvent e) {
        OnItemTouchListener onItemTouchListener = this.mInterceptingOnItemTouchListener;
        if (onItemTouchListener != null) {
            onItemTouchListener.onTouchEvent(this, e);
            int action = e.getAction();
            if (action == 3 || action == 1) {
                this.mInterceptingOnItemTouchListener = null;
            }
            return true;
        } else if (e.getAction() == 0) {
            return false;
        } else {
            return findInterceptingOnItemTouchListener(e);
        }
    }

    private boolean findInterceptingOnItemTouchListener(MotionEvent e) {
        int action = e.getAction();
        int size = this.mOnItemTouchListeners.size();
        for (int i = 0; i < size; i++) {
            OnItemTouchListener onItemTouchListener = this.mOnItemTouchListeners.get(i);
            if (onItemTouchListener.onInterceptTouchEvent(this, e) && action != 3) {
                this.mInterceptingOnItemTouchListener = onItemTouchListener;
                return true;
            }
        }
        return false;
    }

    private void findMinMaxChildLayoutPositions(int[] into) {
        int childCount = this.mChildHelper.getChildCount();
        if (childCount == 0) {
            into[0] = -1;
            into[1] = -1;
            return;
        }
        int i = Integer.MAX_VALUE;
        int i2 = UNDEFINED_DURATION;
        for (int i3 = 0; i3 < childCount; i3++) {
            ViewHolder childViewHolderInt = getChildViewHolderInt(this.mChildHelper.getChildAt(i3));
            if (!childViewHolderInt.shouldIgnore()) {
                int layoutPosition = childViewHolderInt.getLayoutPosition();
                if (layoutPosition < i) {
                    i = layoutPosition;
                }
                if (layoutPosition > i2) {
                    i2 = layoutPosition;
                }
            }
        }
        into[0] = i;
        into[1] = i2;
    }

    public static RecyclerView findNestedRecyclerView(View view) {
        if (!(view instanceof ViewGroup)) {
            return null;
        }
        if (view instanceof RecyclerView) {
            return (RecyclerView) view;
        }
        ViewGroup viewGroup = (ViewGroup) view;
        int childCount = viewGroup.getChildCount();
        for (int i = 0; i < childCount; i++) {
            RecyclerView findNestedRecyclerView = findNestedRecyclerView(viewGroup.getChildAt(i));
            if (findNestedRecyclerView != null) {
                return findNestedRecyclerView;
            }
        }
        return null;
    }

    private View findNextViewToFocus() {
        ViewHolder findViewHolderForAdapterPosition;
        State state = this.mState;
        int i = state.mFocusedItemPosition;
        if (i == -1) {
            i = 0;
        }
        int itemCount = state.getItemCount();
        for (int i2 = i; i2 < itemCount; i2++) {
            ViewHolder findViewHolderForAdapterPosition2 = findViewHolderForAdapterPosition(i2);
            if (findViewHolderForAdapterPosition2 == null) {
                break;
            } else if (findViewHolderForAdapterPosition2.itemView.hasFocusable()) {
                return findViewHolderForAdapterPosition2.itemView;
            }
        }
        int min = Math.min(itemCount, i);
        while (true) {
            min--;
            if (min < 0 || (findViewHolderForAdapterPosition = findViewHolderForAdapterPosition(min)) == null) {
                return null;
            }
            if (findViewHolderForAdapterPosition.itemView.hasFocusable()) {
                return findViewHolderForAdapterPosition.itemView;
            }
        }
    }

    public static ViewHolder getChildViewHolderInt(View child) {
        if (child == null) {
            return null;
        }
        return ((LayoutParams) child.getLayoutParams()).mViewHolder;
    }

    public static void getDecoratedBoundsWithMarginsInt(View view, Rect outBounds) {
        LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
        Rect rect = layoutParams.mDecorInsets;
        outBounds.set((view.getLeft() - rect.left) - ((ViewGroup.MarginLayoutParams) layoutParams).leftMargin, (view.getTop() - rect.top) - ((ViewGroup.MarginLayoutParams) layoutParams).topMargin, view.getRight() + rect.right + ((ViewGroup.MarginLayoutParams) layoutParams).rightMargin, view.getBottom() + rect.bottom + ((ViewGroup.MarginLayoutParams) layoutParams).bottomMargin);
    }

    private int getDeepestFocusedViewWithId(View view) {
        int id = view.getId();
        while (!view.isFocused() && (view instanceof ViewGroup) && view.hasFocus()) {
            view = ((ViewGroup) view).getFocusedChild();
            if (view.getId() != -1) {
                id = view.getId();
            }
        }
        return id;
    }

    private String getFullClassName(Context context, String className) {
        if (className.charAt(0) == '.') {
            return context.getPackageName() + className;
        } else if (className.contains(".")) {
            return className;
        } else {
            return RecyclerView.class.getPackage().getName() + '.' + className;
        }
    }

    private NestedScrollingChildHelper getScrollingChildHelper() {
        if (this.mScrollingChildHelper == null) {
            this.mScrollingChildHelper = new NestedScrollingChildHelper(this);
        }
        return this.mScrollingChildHelper;
    }

    private void handleMissingPreInfoForChangeError(long key, ViewHolder holder, ViewHolder oldChangeViewHolder) {
        int childCount = this.mChildHelper.getChildCount();
        for (int i = 0; i < childCount; i++) {
            ViewHolder childViewHolderInt = getChildViewHolderInt(this.mChildHelper.getChildAt(i));
            if (childViewHolderInt != holder && getChangedHolderKey(childViewHolderInt) == key) {
                Adapter adapter = this.mAdapter;
                if (adapter == null || !adapter.mHasStableIds) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Two different ViewHolders have the same change ID. This might happen due to inconsistent Adapter update events or if the LayoutManager lays out the same View multiple times.\n ViewHolder 1:");
                    sb.append(childViewHolderInt);
                    sb.append(" \n View Holder 2:");
                    sb.append(holder);
                    throw new IllegalStateException(ChildHelper$$ExternalSyntheticOutline0.m(this, sb));
                }
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Two different ViewHolders have the same stable ID. Stable IDs in your adapter MUST BE unique and SHOULD NOT change.\n ViewHolder 1:");
                sb2.append(childViewHolderInt);
                sb2.append(" \n View Holder 2:");
                sb2.append(holder);
                throw new IllegalStateException(ChildHelper$$ExternalSyntheticOutline0.m(this, sb2));
            }
        }
        Log.e(TAG, "Problem while matching changed view holders with the newones. The pre-layout information for the change holder " + oldChangeViewHolder + " cannot be found but it is necessary for " + holder + exceptionLabel());
    }

    private boolean hasUpdatedView() {
        int childCount = this.mChildHelper.getChildCount();
        for (int i = 0; i < childCount; i++) {
            ViewHolder childViewHolderInt = getChildViewHolderInt(this.mChildHelper.getChildAt(i));
            if (!(childViewHolderInt == null || childViewHolderInt.shouldIgnore() || !childViewHolderInt.isUpdated())) {
                return true;
            }
        }
        return false;
    }

    @SuppressLint({"InlinedApi"})
    private void initAutofill() {
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        if (getImportantForAutofill() == 0) {
            setImportantForAutofill(8);
        }
    }

    private void initChildrenHelper() {
        this.mChildHelper = new ChildHelper(new AnonymousClass5());
    }

    private boolean isPreferredNextFocus(View focused, View next, int direction) {
        int i;
        if (next == null || next == this || next == focused || findContainingItemView(next) == null) {
            return false;
        }
        if (focused == null || findContainingItemView(focused) == null) {
            return true;
        }
        this.mTempRect.set(0, 0, focused.getWidth(), focused.getHeight());
        this.mTempRect2.set(0, 0, next.getWidth(), next.getHeight());
        offsetDescendantRectToMyCoords(focused, this.mTempRect);
        offsetDescendantRectToMyCoords(next, this.mTempRect2);
        char c = 65535;
        int i2 = this.mLayout.getLayoutDirection() == 1 ? -1 : 1;
        Rect rect = this.mTempRect;
        int i3 = rect.left;
        Rect rect2 = this.mTempRect2;
        int i4 = rect2.left;
        if ((i3 < i4 || rect.right <= i4) && rect.right < rect2.right) {
            i = 1;
        } else {
            int i5 = rect.right;
            int i6 = rect2.right;
            i = ((i5 > i6 || i3 >= i6) && i3 > i4) ? -1 : 0;
        }
        int i7 = rect.top;
        int i8 = rect2.top;
        if ((i7 < i8 || rect.bottom <= i8) && rect.bottom < rect2.bottom) {
            c = 1;
        } else {
            int i9 = rect.bottom;
            int i10 = rect2.bottom;
            if ((i9 <= i10 && i7 < i10) || i7 <= i8) {
                c = 0;
            }
        }
        if (direction == 1) {
            return c < 0 || (c == 0 && i * i2 < 0);
        }
        if (direction == 2) {
            return c > 0 || (c == 0 && i * i2 > 0);
        }
        if (direction == 17) {
            return i < 0;
        }
        if (direction == 33) {
            return c < 0;
        }
        if (direction == 66) {
            return i > 0;
        }
        if (direction == 130) {
            return c > 0;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Invalid direction: ");
        sb.append(direction);
        throw new IllegalArgumentException(ChildHelper$$ExternalSyntheticOutline0.m(this, sb));
    }

    private void nestedScrollByInternal(int x, int y, MotionEvent motionEvent, int type) {
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager == null) {
            Log.e(TAG, "Cannot scroll without a LayoutManager set. Call setLayoutManager with a non-null argument.");
        } else if (!this.mLayoutSuppressed) {
            int[] iArr = this.mReusableIntPair;
            int i = 0;
            iArr[0] = 0;
            iArr[1] = 0;
            boolean canScrollHorizontally = layoutManager.canScrollHorizontally();
            boolean canScrollVertically = this.mLayout.canScrollVertically();
            int i2 = canScrollVertically ? canScrollHorizontally | 2 : canScrollHorizontally;
            float height = motionEvent == null ? getHeight() / 2.0f : motionEvent.getY();
            float width = motionEvent == null ? getWidth() / 2.0f : motionEvent.getX();
            int releaseHorizontalGlow = x - releaseHorizontalGlow(x, height);
            int releaseVerticalGlow = y - releaseVerticalGlow(y, width);
            startNestedScroll(i2, type);
            if (dispatchNestedPreScroll(canScrollHorizontally ? releaseHorizontalGlow : 0, canScrollVertically ? releaseVerticalGlow : 0, this.mReusableIntPair, this.mScrollOffset, type)) {
                int[] iArr2 = this.mReusableIntPair;
                releaseHorizontalGlow -= iArr2[0];
                releaseVerticalGlow -= iArr2[1];
            }
            int i3 = canScrollHorizontally ? releaseHorizontalGlow : 0;
            if (canScrollVertically) {
                i = releaseVerticalGlow;
            }
            scrollByInternal(i3, i, motionEvent, type);
            GapWorker gapWorker = this.mGapWorker;
            if (!(gapWorker == null || (releaseHorizontalGlow == 0 && releaseVerticalGlow == 0))) {
                gapWorker.postFromTraversal(this, releaseHorizontalGlow, releaseVerticalGlow);
            }
            stopNestedScroll(type);
        }
    }

    private void onPointerUp(MotionEvent e) {
        int actionIndex = e.getActionIndex();
        if (e.getPointerId(actionIndex) == this.mScrollPointerId) {
            int i = actionIndex == 0 ? 1 : 0;
            this.mScrollPointerId = e.getPointerId(i);
            int x = (int) (e.getX(i) + 0.5f);
            this.mLastTouchX = x;
            this.mInitialTouchX = x;
            int y = (int) (e.getY(i) + 0.5f);
            this.mLastTouchY = y;
            this.mInitialTouchY = y;
        }
    }

    private boolean predictiveItemAnimationsEnabled() {
        return this.mItemAnimator != null && this.mLayout.supportsPredictiveItemAnimations();
    }

    private void processAdapterUpdatesAndSetAnimationFlags() {
        boolean z;
        boolean z2 = false;
        if (this.mDataSetHasChangedAfterLayout) {
            AdapterHelper adapterHelper = this.mAdapterHelper;
            adapterHelper.recycleUpdateOpsAndClearList(adapterHelper.mPendingUpdates);
            adapterHelper.recycleUpdateOpsAndClearList(adapterHelper.mPostponedList);
            adapterHelper.mExistingUpdateTypes = 0;
            if (this.mDispatchItemsChangedEvent) {
                this.mLayout.onItemsChanged(this);
            }
        }
        if (predictiveItemAnimationsEnabled()) {
            this.mAdapterHelper.preProcess();
        } else {
            this.mAdapterHelper.consumeUpdatesInOnePass();
        }
        boolean z3 = this.mItemsAddedOrRemoved || this.mItemsChanged;
        State state = this.mState;
        boolean z4 = this.mFirstLayoutComplete && this.mItemAnimator != null && ((z = this.mDataSetHasChangedAfterLayout) || z3 || this.mLayout.mRequestedSimpleAnimations) && (!z || this.mAdapter.mHasStableIds);
        state.mRunSimpleAnimations = z4;
        if (z4 && z3 && !this.mDataSetHasChangedAfterLayout && predictiveItemAnimationsEnabled()) {
            z2 = true;
        }
        state.mRunPredictiveAnimations = z2;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0040  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0056  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void pullGlows(float r7, float r8, float r9, float r10) {
        /*
            r6 = this;
            r0 = 0
            int r1 = (r8 > r0 ? 1 : (r8 == r0 ? 0 : -1))
            r2 = 1065353216(0x3f800000, float:1.0)
            r3 = 1
            if (r1 >= 0) goto L21
            r6.ensureLeftGlow()
            android.widget.EdgeEffect r1 = r6.mLeftGlow
            float r4 = -r8
            int r5 = r6.getWidth()
            float r5 = (float) r5
            float r4 = r4 / r5
            int r5 = r6.getHeight()
            float r5 = (float) r5
            float r9 = r9 / r5
            float r9 = r2 - r9
            androidx.core.widget.EdgeEffectCompat$Api31Impl.onPullDistance(r1, r4, r9)
        L1f:
            r9 = r3
            goto L3c
        L21:
            int r1 = (r8 > r0 ? 1 : (r8 == r0 ? 0 : -1))
            if (r1 <= 0) goto L3b
            r6.ensureRightGlow()
            android.widget.EdgeEffect r1 = r6.mRightGlow
            int r4 = r6.getWidth()
            float r4 = (float) r4
            float r4 = r8 / r4
            int r5 = r6.getHeight()
            float r5 = (float) r5
            float r9 = r9 / r5
            androidx.core.widget.EdgeEffectCompat$Api31Impl.onPullDistance(r1, r4, r9)
            goto L1f
        L3b:
            r9 = 0
        L3c:
            int r1 = (r10 > r0 ? 1 : (r10 == r0 ? 0 : -1))
            if (r1 >= 0) goto L56
            r6.ensureTopGlow()
            android.widget.EdgeEffect r9 = r6.mTopGlow
            float r1 = -r10
            int r2 = r6.getHeight()
            float r2 = (float) r2
            float r1 = r1 / r2
            int r2 = r6.getWidth()
            float r2 = (float) r2
            float r7 = r7 / r2
            androidx.core.widget.EdgeEffectCompat$Api31Impl.onPullDistance(r9, r1, r7)
            goto L72
        L56:
            int r1 = (r10 > r0 ? 1 : (r10 == r0 ? 0 : -1))
            if (r1 <= 0) goto L71
            r6.ensureBottomGlow()
            android.widget.EdgeEffect r9 = r6.mBottomGlow
            int r1 = r6.getHeight()
            float r1 = (float) r1
            float r1 = r10 / r1
            int r4 = r6.getWidth()
            float r4 = (float) r4
            float r7 = r7 / r4
            float r2 = r2 - r7
            androidx.core.widget.EdgeEffectCompat$Api31Impl.onPullDistance(r9, r1, r2)
            goto L72
        L71:
            r3 = r9
        L72:
            if (r3 != 0) goto L7c
            int r7 = (r8 > r0 ? 1 : (r8 == r0 ? 0 : -1))
            if (r7 != 0) goto L7c
            int r7 = (r10 > r0 ? 1 : (r10 == r0 ? 0 : -1))
            if (r7 == 0) goto L81
        L7c:
            java.util.WeakHashMap<android.view.View, androidx.core.view.ViewPropertyAnimatorCompat> r7 = androidx.core.view.ViewCompat.sViewPropertyAnimatorMap
            r6.postInvalidateOnAnimation()
        L81:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.RecyclerView.pullGlows(float, float, float, float):void");
    }

    private void recoverFocusFromState() {
        View findViewById;
        if (this.mPreserveFocusAfterLayout && this.mAdapter != null && hasFocus() && getDescendantFocusability() != 393216) {
            if (getDescendantFocusability() != 131072 || !isFocused()) {
                if (!isFocused()) {
                    View focusedChild = getFocusedChild();
                    if (!IGNORE_DETACHED_FOCUSED_CHILD || (focusedChild.getParent() != null && focusedChild.hasFocus())) {
                        if (!this.mChildHelper.isHidden(focusedChild)) {
                            return;
                        }
                    } else if (this.mChildHelper.getChildCount() == 0) {
                        requestFocus();
                        return;
                    }
                }
                long j = this.mState.mFocusedItemId;
                View view = null;
                ViewHolder findViewHolderForItemId = (j == -1 || !this.mAdapter.mHasStableIds) ? null : findViewHolderForItemId(j);
                if (findViewHolderForItemId != null && !this.mChildHelper.isHidden(findViewHolderForItemId.itemView) && findViewHolderForItemId.itemView.hasFocusable()) {
                    view = findViewHolderForItemId.itemView;
                } else if (this.mChildHelper.getChildCount() > 0) {
                    view = findNextViewToFocus();
                }
                if (view != null) {
                    int i = this.mState.mFocusedSubChildId;
                    if (!(i == -1 || (findViewById = view.findViewById(i)) == null || !findViewById.isFocusable())) {
                        view = findViewById;
                    }
                    view.requestFocus();
                }
            }
        }
    }

    private void releaseGlows() {
        boolean z;
        EdgeEffect edgeEffect = this.mLeftGlow;
        if (edgeEffect != null) {
            edgeEffect.onRelease();
            z = this.mLeftGlow.isFinished();
        } else {
            z = false;
        }
        EdgeEffect edgeEffect2 = this.mTopGlow;
        if (edgeEffect2 != null) {
            edgeEffect2.onRelease();
            z |= this.mTopGlow.isFinished();
        }
        EdgeEffect edgeEffect3 = this.mRightGlow;
        if (edgeEffect3 != null) {
            edgeEffect3.onRelease();
            z |= this.mRightGlow.isFinished();
        }
        EdgeEffect edgeEffect4 = this.mBottomGlow;
        if (edgeEffect4 != null) {
            edgeEffect4.onRelease();
            z |= this.mBottomGlow.isFinished();
        }
        if (z) {
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            postInvalidateOnAnimation();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0064  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private int releaseHorizontalGlow(int r4, float r5) {
        /*
            r3 = this;
            int r0 = r3.getHeight()
            float r0 = (float) r0
            float r5 = r5 / r0
            float r4 = (float) r4
            int r0 = r3.getWidth()
            float r0 = (float) r0
            float r4 = r4 / r0
            android.widget.EdgeEffect r0 = r3.mLeftGlow
            r1 = 0
            if (r0 == 0) goto L36
            float r0 = androidx.core.widget.EdgeEffectCompat$Api31Impl.getDistance(r0)
            int r0 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1))
            if (r0 == 0) goto L36
            android.widget.EdgeEffect r0 = r3.mLeftGlow
            float r4 = -r4
            r2 = 1065353216(0x3f800000, float:1.0)
            float r2 = r2 - r5
            float r4 = androidx.core.widget.EdgeEffectCompat$Api31Impl.onPullDistance(r0, r4, r2)
            float r4 = -r4
            android.widget.EdgeEffect r5 = r3.mLeftGlow
            float r5 = androidx.core.widget.EdgeEffectCompat$Api31Impl.getDistance(r5)
            int r5 = (r5 > r1 ? 1 : (r5 == r1 ? 0 : -1))
            if (r5 != 0) goto L34
            android.widget.EdgeEffect r5 = r3.mLeftGlow
            r5.onRelease()
        L34:
            r1 = r4
            goto L58
        L36:
            android.widget.EdgeEffect r0 = r3.mRightGlow
            if (r0 == 0) goto L58
            float r0 = androidx.core.widget.EdgeEffectCompat$Api31Impl.getDistance(r0)
            int r0 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1))
            if (r0 == 0) goto L58
            android.widget.EdgeEffect r0 = r3.mRightGlow
            float r4 = androidx.core.widget.EdgeEffectCompat$Api31Impl.onPullDistance(r0, r4, r5)
            android.widget.EdgeEffect r5 = r3.mRightGlow
            float r5 = androidx.core.widget.EdgeEffectCompat$Api31Impl.getDistance(r5)
            int r5 = (r5 > r1 ? 1 : (r5 == r1 ? 0 : -1))
            if (r5 != 0) goto L34
            android.widget.EdgeEffect r5 = r3.mRightGlow
            r5.onRelease()
            goto L34
        L58:
            int r4 = r3.getWidth()
            float r4 = (float) r4
            float r1 = r1 * r4
            int r4 = java.lang.Math.round(r1)
            if (r4 == 0) goto L67
            r3.invalidate()
        L67:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.RecyclerView.releaseHorizontalGlow(int, float):int");
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0064  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private int releaseVerticalGlow(int r4, float r5) {
        /*
            r3 = this;
            int r0 = r3.getWidth()
            float r0 = (float) r0
            float r5 = r5 / r0
            float r4 = (float) r4
            int r0 = r3.getHeight()
            float r0 = (float) r0
            float r4 = r4 / r0
            android.widget.EdgeEffect r0 = r3.mTopGlow
            r1 = 0
            if (r0 == 0) goto L33
            float r0 = androidx.core.widget.EdgeEffectCompat$Api31Impl.getDistance(r0)
            int r0 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1))
            if (r0 == 0) goto L33
            android.widget.EdgeEffect r0 = r3.mTopGlow
            float r4 = -r4
            float r4 = androidx.core.widget.EdgeEffectCompat$Api31Impl.onPullDistance(r0, r4, r5)
            float r4 = -r4
            android.widget.EdgeEffect r5 = r3.mTopGlow
            float r5 = androidx.core.widget.EdgeEffectCompat$Api31Impl.getDistance(r5)
            int r5 = (r5 > r1 ? 1 : (r5 == r1 ? 0 : -1))
            if (r5 != 0) goto L31
            android.widget.EdgeEffect r5 = r3.mTopGlow
            r5.onRelease()
        L31:
            r1 = r4
            goto L58
        L33:
            android.widget.EdgeEffect r0 = r3.mBottomGlow
            if (r0 == 0) goto L58
            float r0 = androidx.core.widget.EdgeEffectCompat$Api31Impl.getDistance(r0)
            int r0 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1))
            if (r0 == 0) goto L58
            android.widget.EdgeEffect r0 = r3.mBottomGlow
            r2 = 1065353216(0x3f800000, float:1.0)
            float r2 = r2 - r5
            float r4 = androidx.core.widget.EdgeEffectCompat$Api31Impl.onPullDistance(r0, r4, r2)
            android.widget.EdgeEffect r5 = r3.mBottomGlow
            float r5 = androidx.core.widget.EdgeEffectCompat$Api31Impl.getDistance(r5)
            int r5 = (r5 > r1 ? 1 : (r5 == r1 ? 0 : -1))
            if (r5 != 0) goto L31
            android.widget.EdgeEffect r5 = r3.mBottomGlow
            r5.onRelease()
            goto L31
        L58:
            int r4 = r3.getHeight()
            float r4 = (float) r4
            float r1 = r1 * r4
            int r4 = java.lang.Math.round(r1)
            if (r4 == 0) goto L67
            r3.invalidate()
        L67:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.RecyclerView.releaseVerticalGlow(int, float):int");
    }

    private void requestChildOnScreen(View child, View focused) {
        View view = focused != null ? focused : child;
        this.mTempRect.set(0, 0, view.getWidth(), view.getHeight());
        ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
        if (layoutParams instanceof LayoutParams) {
            LayoutParams layoutParams2 = (LayoutParams) layoutParams;
            if (!layoutParams2.mInsetsDirty) {
                Rect rect = layoutParams2.mDecorInsets;
                Rect rect2 = this.mTempRect;
                rect2.left -= rect.left;
                rect2.right += rect.right;
                rect2.top -= rect.top;
                rect2.bottom += rect.bottom;
            }
        }
        if (focused != null) {
            offsetDescendantRectToMyCoords(focused, this.mTempRect);
            offsetRectIntoDescendantCoords(child, this.mTempRect);
        }
        LayoutManager layoutManager = this.mLayout;
        Rect rect3 = this.mTempRect;
        boolean z = true;
        boolean z2 = !this.mFirstLayoutComplete;
        if (focused != null) {
            z = false;
        }
        layoutManager.requestChildRectangleOnScreen(this, child, rect3, z2, z);
    }

    private void resetFocusInfo() {
        State state = this.mState;
        state.mFocusedItemId = -1L;
        state.mFocusedItemPosition = -1;
        state.mFocusedSubChildId = -1;
    }

    private void resetScroll() {
        VelocityTracker velocityTracker = this.mVelocityTracker;
        if (velocityTracker != null) {
            velocityTracker.clear();
        }
        stopNestedScroll(0);
        releaseGlows();
    }

    private void saveFocusInfo() {
        int i;
        ViewHolder viewHolder = null;
        View focusedChild = (!this.mPreserveFocusAfterLayout || !hasFocus() || this.mAdapter == null) ? null : getFocusedChild();
        if (focusedChild != null) {
            viewHolder = findContainingViewHolder(focusedChild);
        }
        if (viewHolder == null) {
            resetFocusInfo();
            return;
        }
        State state = this.mState;
        state.mFocusedItemId = this.mAdapter.mHasStableIds ? viewHolder.mItemId : -1L;
        if (this.mDataSetHasChangedAfterLayout) {
            i = -1;
        } else {
            i = viewHolder.isRemoved() ? viewHolder.mOldPosition : viewHolder.getAbsoluteAdapterPosition();
        }
        state.mFocusedItemPosition = i;
        this.mState.mFocusedSubChildId = getDeepestFocusedViewWithId(viewHolder.itemView);
    }

    private void setAdapterInternal(Adapter adapter, boolean compatibleWithPrevious, boolean removeAndRecycleViews) {
        Adapter adapter2 = this.mAdapter;
        if (adapter2 != null) {
            adapter2.mObservable.unregisterObserver(this.mObserver);
            Objects.requireNonNull(this.mAdapter);
        }
        if (!compatibleWithPrevious || removeAndRecycleViews) {
            removeAndRecycleViews();
        }
        AdapterHelper adapterHelper = this.mAdapterHelper;
        adapterHelper.recycleUpdateOpsAndClearList(adapterHelper.mPendingUpdates);
        adapterHelper.recycleUpdateOpsAndClearList(adapterHelper.mPostponedList);
        adapterHelper.mExistingUpdateTypes = 0;
        Adapter adapter3 = this.mAdapter;
        this.mAdapter = adapter;
        if (adapter != null) {
            adapter.mObservable.registerObserver(this.mObserver);
        }
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager != null) {
            layoutManager.onAdapterChanged(adapter3, this.mAdapter);
        }
        Recycler recycler = this.mRecycler;
        Adapter adapter4 = this.mAdapter;
        recycler.clear();
        RecycledViewPool recycledViewPool = recycler.getRecycledViewPool();
        Objects.requireNonNull(recycledViewPool);
        if (adapter3 != null) {
            recycledViewPool.mAttachCount--;
        }
        if (!compatibleWithPrevious && recycledViewPool.mAttachCount == 0) {
            for (int i = 0; i < recycledViewPool.mScrap.size(); i++) {
                recycledViewPool.mScrap.valueAt(i).mScrapHeap.clear();
            }
        }
        if (adapter4 != null) {
            recycledViewPool.mAttachCount++;
        }
        this.mState.mStructureChanged = true;
    }

    private boolean stopGlowAnimations(MotionEvent e) {
        boolean z;
        EdgeEffect edgeEffect = this.mLeftGlow;
        if (edgeEffect == null || EdgeEffectCompat$Api31Impl.getDistance(edgeEffect) == HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
            z = false;
        } else {
            EdgeEffectCompat$Api31Impl.onPullDistance(this.mLeftGlow, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 1.0f - (e.getY() / getHeight()));
            z = true;
        }
        EdgeEffect edgeEffect2 = this.mRightGlow;
        if (!(edgeEffect2 == null || EdgeEffectCompat$Api31Impl.getDistance(edgeEffect2) == HingeAngleProviderKt.FULLY_CLOSED_DEGREES)) {
            EdgeEffectCompat$Api31Impl.onPullDistance(this.mRightGlow, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, e.getY() / getHeight());
            z = true;
        }
        EdgeEffect edgeEffect3 = this.mTopGlow;
        if (!(edgeEffect3 == null || EdgeEffectCompat$Api31Impl.getDistance(edgeEffect3) == HingeAngleProviderKt.FULLY_CLOSED_DEGREES)) {
            EdgeEffectCompat$Api31Impl.onPullDistance(this.mTopGlow, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, e.getX() / getWidth());
            z = true;
        }
        EdgeEffect edgeEffect4 = this.mBottomGlow;
        if (edgeEffect4 == null || EdgeEffectCompat$Api31Impl.getDistance(edgeEffect4) == HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
            return z;
        }
        EdgeEffectCompat$Api31Impl.onPullDistance(this.mBottomGlow, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 1.0f - (e.getX() / getWidth()));
        return true;
    }

    private void stopScrollersInternal() {
        SmoothScroller smoothScroller;
        this.mViewFlinger.stop();
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager != null && (smoothScroller = layoutManager.mSmoothScroller) != null) {
            smoothScroller.stop();
        }
    }

    public void absorbGlows(int velocityX, int velocityY) {
        if (velocityX < 0) {
            ensureLeftGlow();
            if (this.mLeftGlow.isFinished()) {
                this.mLeftGlow.onAbsorb(-velocityX);
            }
        } else if (velocityX > 0) {
            ensureRightGlow();
            if (this.mRightGlow.isFinished()) {
                this.mRightGlow.onAbsorb(velocityX);
            }
        }
        if (velocityY < 0) {
            ensureTopGlow();
            if (this.mTopGlow.isFinished()) {
                this.mTopGlow.onAbsorb(-velocityY);
            }
        } else if (velocityY > 0) {
            ensureBottomGlow();
            if (this.mBottomGlow.isFinished()) {
                this.mBottomGlow.onAbsorb(velocityY);
            }
        }
        if (velocityX != 0 || velocityY != 0) {
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            postInvalidateOnAnimation();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void addFocusables(ArrayList<View> views, int direction, int focusableMode) {
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager != null) {
            Objects.requireNonNull(layoutManager);
        }
        super.addFocusables(views, direction, focusableMode);
    }

    public void addItemDecoration(ItemDecoration decor, int index) {
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager != null) {
            layoutManager.assertNotInLayoutOrScroll("Cannot add item decoration during a scroll  or layout");
        }
        if (this.mItemDecorations.isEmpty()) {
            setWillNotDraw(false);
        }
        if (index < 0) {
            this.mItemDecorations.add(decor);
        } else {
            this.mItemDecorations.add(index, decor);
        }
        markItemDecorInsetsDirty();
        requestLayout();
    }

    public void addOnChildAttachStateChangeListener(OnChildAttachStateChangeListener listener) {
        if (this.mOnChildAttachStateListeners == null) {
            this.mOnChildAttachStateListeners = new ArrayList();
        }
        this.mOnChildAttachStateListeners.add(listener);
    }

    public void addOnItemTouchListener(OnItemTouchListener listener) {
        this.mOnItemTouchListeners.add(listener);
    }

    public void addOnScrollListener(OnScrollListener listener) {
        if (this.mScrollListeners == null) {
            this.mScrollListeners = new ArrayList();
        }
        this.mScrollListeners.add(listener);
    }

    public void addRecyclerListener(RecyclerListener listener) {
        Preconditions.checkArgument(listener != null, "'listener' arg cannot be null.");
        this.mRecyclerListeners.add(listener);
    }

    public void animateAppearance(ViewHolder itemHolder, ItemAnimator.ItemHolderInfo preLayoutInfo, ItemAnimator.ItemHolderInfo postLayoutInfo) {
        boolean z;
        int i;
        int i2;
        itemHolder.setIsRecyclable(false);
        SimpleItemAnimator simpleItemAnimator = (SimpleItemAnimator) this.mItemAnimator;
        Objects.requireNonNull(simpleItemAnimator);
        if (preLayoutInfo == null || ((i = preLayoutInfo.left) == (i2 = postLayoutInfo.left) && preLayoutInfo.top == postLayoutInfo.top)) {
            DefaultItemAnimator defaultItemAnimator = (DefaultItemAnimator) simpleItemAnimator;
            defaultItemAnimator.resetAnimation(itemHolder);
            itemHolder.itemView.setAlpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            defaultItemAnimator.mPendingAdditions.add(itemHolder);
            z = true;
        } else {
            z = simpleItemAnimator.animateMove(itemHolder, i, preLayoutInfo.top, i2, postLayoutInfo.top);
        }
        if (z) {
            postAnimationRunner();
        }
    }

    public void animateDisappearance(ViewHolder holder, ItemAnimator.ItemHolderInfo preLayoutInfo, ItemAnimator.ItemHolderInfo postLayoutInfo) {
        boolean z;
        addAnimatingView(holder);
        holder.setIsRecyclable(false);
        SimpleItemAnimator simpleItemAnimator = (SimpleItemAnimator) this.mItemAnimator;
        Objects.requireNonNull(simpleItemAnimator);
        int i = preLayoutInfo.left;
        int i2 = preLayoutInfo.top;
        View view = holder.itemView;
        int left = postLayoutInfo == null ? view.getLeft() : postLayoutInfo.left;
        int top = postLayoutInfo == null ? view.getTop() : postLayoutInfo.top;
        if (holder.isRemoved() || (i == left && i2 == top)) {
            DefaultItemAnimator defaultItemAnimator = (DefaultItemAnimator) simpleItemAnimator;
            defaultItemAnimator.resetAnimation(holder);
            defaultItemAnimator.mPendingRemovals.add(holder);
            z = true;
        } else {
            view.layout(left, top, view.getWidth() + left, view.getHeight() + top);
            z = simpleItemAnimator.animateMove(holder, i, i2, left, top);
        }
        if (z) {
            postAnimationRunner();
        }
    }

    public void assertInLayoutOrScroll(String message) {
        if (isComputingLayout()) {
            return;
        }
        if (message == null) {
            throw new IllegalStateException(ChildHelper$$ExternalSyntheticOutline0.m(this, ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Cannot call this method unless RecyclerView is computing a layout or scrolling")));
        }
        throw new IllegalStateException(ChildHelper$$ExternalSyntheticOutline0.m(this, ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m(message)));
    }

    public void assertNotInLayoutOrScroll(String message) {
        if (isComputingLayout()) {
            if (message == null) {
                throw new IllegalStateException(ChildHelper$$ExternalSyntheticOutline0.m(this, ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Cannot call this method while RecyclerView is computing a layout or scrolling")));
            }
            throw new IllegalStateException(message);
        } else if (this.mDispatchScrollCounter > 0) {
            Log.w(TAG, "Cannot call this method in a scroll callback. Scroll callbacks mightbe run during a measure & layout pass where you cannot change theRecyclerView data. Any method call that might change the structureof the RecyclerView or the adapter contents should be postponed tothe next frame.", new IllegalStateException(ChildHelper$$ExternalSyntheticOutline0.m(this, ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m(""))));
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:18:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean canReuseUpdatedViewHolder(androidx.recyclerview.widget.RecyclerView.ViewHolder r4) {
        /*
            r3 = this;
            androidx.recyclerview.widget.RecyclerView$ItemAnimator r3 = r3.mItemAnimator
            r0 = 0
            r1 = 1
            if (r3 == 0) goto L2b
            java.util.List r2 = r4.getUnmodifiedPayloads()
            androidx.recyclerview.widget.DefaultItemAnimator r3 = (androidx.recyclerview.widget.DefaultItemAnimator) r3
            java.util.Objects.requireNonNull(r3)
            boolean r2 = r2.isEmpty()
            if (r2 == 0) goto L28
            boolean r3 = r3.mSupportsChangeAnimations
            if (r3 == 0) goto L22
            boolean r3 = r4.isInvalid()
            if (r3 == 0) goto L20
            goto L22
        L20:
            r3 = r0
            goto L23
        L22:
            r3 = r1
        L23:
            if (r3 == 0) goto L26
            goto L28
        L26:
            r3 = r0
            goto L29
        L28:
            r3 = r1
        L29:
            if (r3 == 0) goto L2c
        L2b:
            r0 = r1
        L2c:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.RecyclerView.canReuseUpdatedViewHolder(androidx.recyclerview.widget.RecyclerView$ViewHolder):boolean");
    }

    @Override // android.view.ViewGroup
    public boolean checkLayoutParams(ViewGroup.LayoutParams p) {
        return (p instanceof LayoutParams) && this.mLayout.checkLayoutParams((LayoutParams) p);
    }

    public void clearOldPositions() {
        int unfilteredChildCount = this.mChildHelper.getUnfilteredChildCount();
        for (int i = 0; i < unfilteredChildCount; i++) {
            ViewHolder childViewHolderInt = getChildViewHolderInt(this.mChildHelper.getUnfilteredChildAt(i));
            if (!childViewHolderInt.shouldIgnore()) {
                childViewHolderInt.clearOldPosition();
            }
        }
        Recycler recycler = this.mRecycler;
        int size = recycler.mCachedViews.size();
        for (int i2 = 0; i2 < size; i2++) {
            recycler.mCachedViews.get(i2).clearOldPosition();
        }
        int size2 = recycler.mAttachedScrap.size();
        for (int i3 = 0; i3 < size2; i3++) {
            recycler.mAttachedScrap.get(i3).clearOldPosition();
        }
        ArrayList<ViewHolder> arrayList = recycler.mChangedScrap;
        if (arrayList != null) {
            int size3 = arrayList.size();
            for (int i4 = 0; i4 < size3; i4++) {
                recycler.mChangedScrap.get(i4).clearOldPosition();
            }
        }
    }

    public void clearOnChildAttachStateChangeListeners() {
        List<OnChildAttachStateChangeListener> list = this.mOnChildAttachStateListeners;
        if (list != null) {
            list.clear();
        }
    }

    public void clearOnScrollListeners() {
        List<OnScrollListener> list = this.mScrollListeners;
        if (list != null) {
            list.clear();
        }
    }

    @Override // android.view.View
    public int computeHorizontalScrollExtent() {
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager != null && layoutManager.canScrollHorizontally()) {
            return this.mLayout.computeHorizontalScrollExtent(this.mState);
        }
        return 0;
    }

    @Override // android.view.View
    public int computeHorizontalScrollOffset() {
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager != null && layoutManager.canScrollHorizontally()) {
            return this.mLayout.computeHorizontalScrollOffset(this.mState);
        }
        return 0;
    }

    @Override // android.view.View
    public int computeHorizontalScrollRange() {
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager != null && layoutManager.canScrollHorizontally()) {
            return this.mLayout.computeHorizontalScrollRange(this.mState);
        }
        return 0;
    }

    @Override // android.view.View
    public int computeVerticalScrollExtent() {
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager != null && layoutManager.canScrollVertically()) {
            return this.mLayout.computeVerticalScrollExtent(this.mState);
        }
        return 0;
    }

    @Override // android.view.View
    public int computeVerticalScrollOffset() {
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager != null && layoutManager.canScrollVertically()) {
            return this.mLayout.computeVerticalScrollOffset(this.mState);
        }
        return 0;
    }

    @Override // android.view.View
    public int computeVerticalScrollRange() {
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager != null && layoutManager.canScrollVertically()) {
            return this.mLayout.computeVerticalScrollRange(this.mState);
        }
        return 0;
    }

    public void considerReleasingGlowsOnScroll(int dx, int dy) {
        boolean z;
        EdgeEffect edgeEffect = this.mLeftGlow;
        if (edgeEffect == null || edgeEffect.isFinished() || dx <= 0) {
            z = false;
        } else {
            this.mLeftGlow.onRelease();
            z = this.mLeftGlow.isFinished();
        }
        EdgeEffect edgeEffect2 = this.mRightGlow;
        if (edgeEffect2 != null && !edgeEffect2.isFinished() && dx < 0) {
            this.mRightGlow.onRelease();
            z |= this.mRightGlow.isFinished();
        }
        EdgeEffect edgeEffect3 = this.mTopGlow;
        if (edgeEffect3 != null && !edgeEffect3.isFinished() && dy > 0) {
            this.mTopGlow.onRelease();
            z |= this.mTopGlow.isFinished();
        }
        EdgeEffect edgeEffect4 = this.mBottomGlow;
        if (edgeEffect4 != null && !edgeEffect4.isFinished() && dy < 0) {
            this.mBottomGlow.onRelease();
            z |= this.mBottomGlow.isFinished();
        }
        if (z) {
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            postInvalidateOnAnimation();
        }
    }

    public void consumePendingUpdateOperations() {
        if (!this.mFirstLayoutComplete || this.mDataSetHasChangedAfterLayout) {
            Trace.beginSection(TRACE_ON_DATA_SET_CHANGE_LAYOUT_TAG);
            dispatchLayout();
            Trace.endSection();
        } else if (this.mAdapterHelper.hasPendingUpdates()) {
            AdapterHelper adapterHelper = this.mAdapterHelper;
            int i = adapterHelper.mExistingUpdateTypes;
            boolean z = false;
            if ((i & 4) != 0) {
                if ((i & 11) != 0) {
                    z = true;
                }
                if (!z) {
                    Trace.beginSection(TRACE_HANDLE_ADAPTER_UPDATES_TAG);
                    startInterceptRequestLayout();
                    onEnterLayoutOrScroll();
                    this.mAdapterHelper.preProcess();
                    if (!this.mLayoutWasDefered) {
                        if (hasUpdatedView()) {
                            dispatchLayout();
                        } else {
                            this.mAdapterHelper.consumePostponedUpdates();
                        }
                    }
                    stopInterceptRequestLayout(true);
                    onExitLayoutOrScroll();
                    Trace.endSection();
                    return;
                }
            }
            if (adapterHelper.hasPendingUpdates()) {
                Trace.beginSection(TRACE_ON_DATA_SET_CHANGE_LAYOUT_TAG);
                dispatchLayout();
                Trace.endSection();
            }
        }
    }

    public void defaultOnMeasure(int widthSpec, int heightSpec) {
        int paddingRight = getPaddingRight() + getPaddingLeft();
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        setMeasuredDimension(LayoutManager.chooseSize(widthSpec, paddingRight, getMinimumWidth()), LayoutManager.chooseSize(heightSpec, getPaddingBottom() + getPaddingTop(), getMinimumHeight()));
    }

    public void dispatchChildAttached(View child) {
        ViewHolder childViewHolderInt = getChildViewHolderInt(child);
        onChildAttachedToWindow(child);
        Adapter adapter = this.mAdapter;
        if (!(adapter == null || childViewHolderInt == null)) {
            Objects.requireNonNull(adapter);
        }
        List<OnChildAttachStateChangeListener> list = this.mOnChildAttachStateListeners;
        if (list != null) {
            for (int size = list.size() - 1; size >= 0; size--) {
                this.mOnChildAttachStateListeners.get(size).onChildViewAttachedToWindow(child);
            }
        }
    }

    public void dispatchChildDetached(View child) {
        ViewHolder childViewHolderInt = getChildViewHolderInt(child);
        onChildDetachedFromWindow(child);
        Adapter adapter = this.mAdapter;
        if (!(adapter == null || childViewHolderInt == null)) {
            Objects.requireNonNull(adapter);
        }
        List<OnChildAttachStateChangeListener> list = this.mOnChildAttachStateListeners;
        if (list != null) {
            for (int size = list.size() - 1; size >= 0; size--) {
                this.mOnChildAttachStateListeners.get(size).onChildViewDetachedFromWindow(child);
            }
        }
    }

    public void dispatchLayout() {
        if (this.mAdapter == null) {
            Log.w(TAG, "No adapter attached; skipping layout");
        } else if (this.mLayout == null) {
            Log.e(TAG, "No layout manager attached; skipping layout");
        } else {
            boolean z = false;
            this.mState.mIsMeasuring = false;
            boolean z2 = this.mLastAutoMeasureSkippedDueToExact && !(this.mLastAutoMeasureNonExactMeasuredWidth == getWidth() && this.mLastAutoMeasureNonExactMeasuredHeight == getHeight());
            this.mLastAutoMeasureNonExactMeasuredWidth = 0;
            this.mLastAutoMeasureNonExactMeasuredHeight = 0;
            this.mLastAutoMeasureSkippedDueToExact = false;
            if (this.mState.mLayoutStep == 1) {
                dispatchLayoutStep1();
                this.mLayout.setExactMeasureSpecsFrom(this);
                dispatchLayoutStep2();
            } else {
                AdapterHelper adapterHelper = this.mAdapterHelper;
                if (!adapterHelper.mPostponedList.isEmpty() && !adapterHelper.mPendingUpdates.isEmpty()) {
                    z = true;
                }
                if (z || z2 || this.mLayout.mWidth != getWidth() || this.mLayout.mHeight != getHeight()) {
                    this.mLayout.setExactMeasureSpecsFrom(this);
                    dispatchLayoutStep2();
                } else {
                    this.mLayout.setExactMeasureSpecsFrom(this);
                }
            }
            dispatchLayoutStep3();
        }
    }

    @Override // android.view.View
    public boolean dispatchNestedFling(float velocityX, float velocityY, boolean consumed) {
        return getScrollingChildHelper().dispatchNestedFling(velocityX, velocityY, consumed);
    }

    @Override // android.view.View
    public boolean dispatchNestedPreFling(float velocityX, float velocityY) {
        return getScrollingChildHelper().dispatchNestedPreFling(velocityX, velocityY);
    }

    @Override // android.view.View
    public boolean dispatchNestedPreScroll(int dx, int dy, int[] consumed, int[] offsetInWindow) {
        return getScrollingChildHelper().dispatchNestedPreScroll(dx, dy, consumed, offsetInWindow, 0);
    }

    @Override // android.view.View
    public boolean dispatchNestedScroll(int dxConsumed, int dyConsumed, int dxUnconsumed, int dyUnconsumed, int[] offsetInWindow) {
        return getScrollingChildHelper().dispatchNestedScroll(dxConsumed, dyConsumed, dxUnconsumed, dyUnconsumed, offsetInWindow);
    }

    public void dispatchOnScrollStateChanged(int state) {
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager != null) {
            layoutManager.onScrollStateChanged(state);
        }
        onScrollStateChanged(state);
        OnScrollListener onScrollListener = this.mScrollListener;
        if (onScrollListener != null) {
            onScrollListener.onScrollStateChanged(this, state);
        }
        List<OnScrollListener> list = this.mScrollListeners;
        if (list != null) {
            for (int size = list.size() - 1; size >= 0; size--) {
                this.mScrollListeners.get(size).onScrollStateChanged(this, state);
            }
        }
    }

    public void dispatchOnScrolled(int hresult, int vresult) {
        this.mDispatchScrollCounter++;
        int scrollX = getScrollX();
        int scrollY = getScrollY();
        onScrollChanged(scrollX, scrollY, scrollX - hresult, scrollY - vresult);
        onScrolled(hresult, vresult);
        OnScrollListener onScrollListener = this.mScrollListener;
        if (onScrollListener != null) {
            onScrollListener.onScrolled(this, hresult, vresult);
        }
        List<OnScrollListener> list = this.mScrollListeners;
        if (list != null) {
            for (int size = list.size() - 1; size >= 0; size--) {
                this.mScrollListeners.get(size).onScrolled(this, hresult, vresult);
            }
        }
        this.mDispatchScrollCounter--;
    }

    public void dispatchPendingImportantForAccessibilityChanges() {
        int i;
        for (int size = this.mPendingAccessibilityImportanceChange.size() - 1; size >= 0; size--) {
            ViewHolder viewHolder = this.mPendingAccessibilityImportanceChange.get(size);
            if (viewHolder.itemView.getParent() == this && !viewHolder.shouldIgnore() && (i = viewHolder.mPendingAccessibilityState) != -1) {
                View view = viewHolder.itemView;
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                view.setImportantForAccessibility(i);
                viewHolder.mPendingAccessibilityState = -1;
            }
        }
        this.mPendingAccessibilityImportanceChange.clear();
    }

    @Override // android.view.View
    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent event) {
        onPopulateAccessibilityEvent(event);
        return true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void dispatchRestoreInstanceState(SparseArray<Parcelable> container) {
        dispatchThawSelfOnly(container);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void dispatchSaveInstanceState(SparseArray<Parcelable> container) {
        dispatchFreezeSelfOnly(container);
    }

    @Override // android.view.View
    public void draw(Canvas c) {
        boolean z;
        super.draw(c);
        int size = this.mItemDecorations.size();
        boolean z2 = false;
        for (int i = 0; i < size; i++) {
            this.mItemDecorations.get(i).onDrawOver(c, this, this.mState);
        }
        EdgeEffect edgeEffect = this.mLeftGlow;
        boolean z3 = true;
        if (edgeEffect == null || edgeEffect.isFinished()) {
            z = false;
        } else {
            int save = c.save();
            int paddingBottom = this.mClipToPadding ? getPaddingBottom() : 0;
            c.rotate(270.0f);
            c.translate((-getHeight()) + paddingBottom, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            EdgeEffect edgeEffect2 = this.mLeftGlow;
            z = edgeEffect2 != null && edgeEffect2.draw(c);
            c.restoreToCount(save);
        }
        EdgeEffect edgeEffect3 = this.mTopGlow;
        if (edgeEffect3 != null && !edgeEffect3.isFinished()) {
            int save2 = c.save();
            if (this.mClipToPadding) {
                c.translate(getPaddingLeft(), getPaddingTop());
            }
            EdgeEffect edgeEffect4 = this.mTopGlow;
            z |= edgeEffect4 != null && edgeEffect4.draw(c);
            c.restoreToCount(save2);
        }
        EdgeEffect edgeEffect5 = this.mRightGlow;
        if (edgeEffect5 != null && !edgeEffect5.isFinished()) {
            int save3 = c.save();
            int width = getWidth();
            int paddingTop = this.mClipToPadding ? getPaddingTop() : 0;
            c.rotate(90.0f);
            c.translate(paddingTop, -width);
            EdgeEffect edgeEffect6 = this.mRightGlow;
            z |= edgeEffect6 != null && edgeEffect6.draw(c);
            c.restoreToCount(save3);
        }
        EdgeEffect edgeEffect7 = this.mBottomGlow;
        if (edgeEffect7 != null && !edgeEffect7.isFinished()) {
            int save4 = c.save();
            c.rotate(180.0f);
            if (this.mClipToPadding) {
                c.translate(getPaddingRight() + (-getWidth()), getPaddingBottom() + (-getHeight()));
            } else {
                c.translate(-getWidth(), -getHeight());
            }
            EdgeEffect edgeEffect8 = this.mBottomGlow;
            if (edgeEffect8 != null && edgeEffect8.draw(c)) {
                z2 = true;
            }
            z |= z2;
            c.restoreToCount(save4);
        }
        if (z || this.mItemAnimator == null || this.mItemDecorations.size() <= 0 || !this.mItemAnimator.isRunning()) {
            z3 = z;
        }
        if (z3) {
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            postInvalidateOnAnimation();
        }
    }

    @Override // android.view.ViewGroup
    public boolean drawChild(Canvas canvas, View child, long drawingTime) {
        return super.drawChild(canvas, child, drawingTime);
    }

    public void ensureBottomGlow() {
        if (this.mBottomGlow == null) {
            EdgeEffect createEdgeEffect = this.mEdgeEffectFactory.createEdgeEffect(this, 3);
            this.mBottomGlow = createEdgeEffect;
            if (this.mClipToPadding) {
                createEdgeEffect.setSize((getMeasuredWidth() - getPaddingLeft()) - getPaddingRight(), (getMeasuredHeight() - getPaddingTop()) - getPaddingBottom());
            } else {
                createEdgeEffect.setSize(getMeasuredWidth(), getMeasuredHeight());
            }
        }
    }

    public void ensureLeftGlow() {
        if (this.mLeftGlow == null) {
            EdgeEffect createEdgeEffect = this.mEdgeEffectFactory.createEdgeEffect(this, 0);
            this.mLeftGlow = createEdgeEffect;
            if (this.mClipToPadding) {
                createEdgeEffect.setSize((getMeasuredHeight() - getPaddingTop()) - getPaddingBottom(), (getMeasuredWidth() - getPaddingLeft()) - getPaddingRight());
            } else {
                createEdgeEffect.setSize(getMeasuredHeight(), getMeasuredWidth());
            }
        }
    }

    public void ensureRightGlow() {
        if (this.mRightGlow == null) {
            EdgeEffect createEdgeEffect = this.mEdgeEffectFactory.createEdgeEffect(this, 2);
            this.mRightGlow = createEdgeEffect;
            if (this.mClipToPadding) {
                createEdgeEffect.setSize((getMeasuredHeight() - getPaddingTop()) - getPaddingBottom(), (getMeasuredWidth() - getPaddingLeft()) - getPaddingRight());
            } else {
                createEdgeEffect.setSize(getMeasuredHeight(), getMeasuredWidth());
            }
        }
    }

    public void ensureTopGlow() {
        if (this.mTopGlow == null) {
            EdgeEffect createEdgeEffect = this.mEdgeEffectFactory.createEdgeEffect(this, 1);
            this.mTopGlow = createEdgeEffect;
            if (this.mClipToPadding) {
                createEdgeEffect.setSize((getMeasuredWidth() - getPaddingLeft()) - getPaddingRight(), (getMeasuredHeight() - getPaddingTop()) - getPaddingBottom());
            } else {
                createEdgeEffect.setSize(getMeasuredWidth(), getMeasuredHeight());
            }
        }
    }

    public String exceptionLabel() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m(" ");
        m.append(super.toString());
        m.append(", adapter:");
        m.append(this.mAdapter);
        m.append(", layout:");
        m.append(this.mLayout);
        m.append(", context:");
        m.append(getContext());
        return m.toString();
    }

    public final void fillRemainingScrollValues(State state) {
        if (getScrollState() == 2) {
            OverScroller overScroller = this.mViewFlinger.mOverScroller;
            overScroller.getFinalX();
            overScroller.getCurrX();
            Objects.requireNonNull(state);
            overScroller.getFinalY();
            overScroller.getCurrY();
            return;
        }
        Objects.requireNonNull(state);
    }

    public View findChildViewUnder(float x, float y) {
        for (int childCount = this.mChildHelper.getChildCount() - 1; childCount >= 0; childCount--) {
            View childAt = this.mChildHelper.getChildAt(childCount);
            float translationX = childAt.getTranslationX();
            float translationY = childAt.getTranslationY();
            if (x >= childAt.getLeft() + translationX && x <= childAt.getRight() + translationX && y >= childAt.getTop() + translationY && y <= childAt.getBottom() + translationY) {
                return childAt;
            }
        }
        return null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:?, code lost:
        return r3;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public android.view.View findContainingItemView(android.view.View r3) {
        /*
            r2 = this;
            android.view.ViewParent r0 = r3.getParent()
        L4:
            if (r0 == 0) goto L14
            if (r0 == r2) goto L14
            boolean r1 = r0 instanceof android.view.View
            if (r1 == 0) goto L14
            r3 = r0
            android.view.View r3 = (android.view.View) r3
            android.view.ViewParent r0 = r3.getParent()
            goto L4
        L14:
            if (r0 != r2) goto L17
            goto L18
        L17:
            r3 = 0
        L18:
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.RecyclerView.findContainingItemView(android.view.View):android.view.View");
    }

    public ViewHolder findContainingViewHolder(View view) {
        View findContainingItemView = findContainingItemView(view);
        if (findContainingItemView == null) {
            return null;
        }
        return getChildViewHolder(findContainingItemView);
    }

    public ViewHolder findViewHolderForAdapterPosition(int position) {
        ViewHolder viewHolder = null;
        if (this.mDataSetHasChangedAfterLayout) {
            return null;
        }
        int unfilteredChildCount = this.mChildHelper.getUnfilteredChildCount();
        for (int i = 0; i < unfilteredChildCount; i++) {
            ViewHolder childViewHolderInt = getChildViewHolderInt(this.mChildHelper.getUnfilteredChildAt(i));
            if (childViewHolderInt != null && !childViewHolderInt.isRemoved() && getAdapterPositionInRecyclerView(childViewHolderInt) == position) {
                if (!this.mChildHelper.isHidden(childViewHolderInt.itemView)) {
                    return childViewHolderInt;
                }
                viewHolder = childViewHolderInt;
            }
        }
        return viewHolder;
    }

    public ViewHolder findViewHolderForItemId(long id) {
        Adapter adapter = this.mAdapter;
        ViewHolder viewHolder = null;
        if (adapter != null && adapter.mHasStableIds) {
            int unfilteredChildCount = this.mChildHelper.getUnfilteredChildCount();
            for (int i = 0; i < unfilteredChildCount; i++) {
                ViewHolder childViewHolderInt = getChildViewHolderInt(this.mChildHelper.getUnfilteredChildAt(i));
                if (childViewHolderInt != null && !childViewHolderInt.isRemoved() && childViewHolderInt.mItemId == id) {
                    if (!this.mChildHelper.isHidden(childViewHolderInt.itemView)) {
                        return childViewHolderInt;
                    }
                    viewHolder = childViewHolderInt;
                }
            }
        }
        return viewHolder;
    }

    public ViewHolder findViewHolderForLayoutPosition(int position) {
        return findViewHolderForPosition(position, false);
    }

    @Deprecated
    public ViewHolder findViewHolderForPosition(int position) {
        return findViewHolderForPosition(position, false);
    }

    /* JADX WARN: Code restructure failed: missing block: B:103:0x015b, code lost:
        if (r0 < r13) goto L105;
     */
    /* JADX WARN: Removed duplicated region for block: B:107:0x0161  */
    /* JADX WARN: Removed duplicated region for block: B:108:0x0163  */
    /* JADX WARN: Removed duplicated region for block: B:110:0x016b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean fling(int r20, int r21) {
        /*
            Method dump skipped, instructions count: 474
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.RecyclerView.fling(int, int):boolean");
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public View focusSearch(View focused, int direction) {
        View view;
        boolean z;
        Objects.requireNonNull(this.mLayout);
        boolean z2 = true;
        boolean z3 = this.mAdapter != null && this.mLayout != null && !isComputingLayout() && !this.mLayoutSuppressed;
        FocusFinder focusFinder = FocusFinder.getInstance();
        if (!z3 || !(direction == 2 || direction == 1)) {
            View findNextFocus = focusFinder.findNextFocus(this, focused, direction);
            if (findNextFocus != null || !z3) {
                view = findNextFocus;
            } else {
                consumePendingUpdateOperations();
                if (findContainingItemView(focused) == null) {
                    return null;
                }
                startInterceptRequestLayout();
                view = this.mLayout.onFocusSearchFailed(focused, direction, this.mRecycler, this.mState);
                stopInterceptRequestLayout(false);
            }
        } else {
            if (this.mLayout.canScrollVertically()) {
                int i = direction == 2 ? 130 : 33;
                z = focusFinder.findNextFocus(this, focused, i) == null;
                if (FORCE_ABS_FOCUS_SEARCH_DIRECTION) {
                    direction = i;
                }
            } else {
                z = false;
            }
            if (!z && this.mLayout.canScrollHorizontally()) {
                int i2 = (this.mLayout.getLayoutDirection() == 1) ^ (direction == 2) ? 66 : 17;
                if (focusFinder.findNextFocus(this, focused, i2) != null) {
                    z2 = false;
                }
                if (FORCE_ABS_FOCUS_SEARCH_DIRECTION) {
                    direction = i2;
                }
                z = z2;
            }
            if (z) {
                consumePendingUpdateOperations();
                if (findContainingItemView(focused) == null) {
                    return null;
                }
                startInterceptRequestLayout();
                this.mLayout.onFocusSearchFailed(focused, direction, this.mRecycler, this.mState);
                stopInterceptRequestLayout(false);
            }
            view = focusFinder.findNextFocus(this, focused, direction);
        }
        if (view == null || view.hasFocusable()) {
            return isPreferredNextFocus(focused, view, direction) ? view : super.focusSearch(focused, direction);
        }
        if (getFocusedChild() == null) {
            return super.focusSearch(focused, direction);
        }
        requestChildOnScreen(view, null);
        return focused;
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateDefaultLayoutParams() {
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager != null) {
            return layoutManager.generateDefaultLayoutParams();
        }
        throw new IllegalStateException(ChildHelper$$ExternalSyntheticOutline0.m(this, ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("RecyclerView has no LayoutManager")));
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateLayoutParams(AttributeSet attrs) {
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager != null) {
            return layoutManager.generateLayoutParams(getContext(), attrs);
        }
        throw new IllegalStateException(ChildHelper$$ExternalSyntheticOutline0.m(this, ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("RecyclerView has no LayoutManager")));
    }

    @Override // android.view.ViewGroup, android.view.View
    public CharSequence getAccessibilityClassName() {
        return "androidx.recyclerview.widget.RecyclerView";
    }

    public Adapter getAdapter() {
        return this.mAdapter;
    }

    public int getAdapterPositionInRecyclerView(ViewHolder viewHolder) {
        if (viewHolder.hasAnyOfTheFlags(524) || !viewHolder.isBound()) {
            return -1;
        }
        AdapterHelper adapterHelper = this.mAdapterHelper;
        int i = viewHolder.mPosition;
        int size = adapterHelper.mPendingUpdates.size();
        for (int i2 = 0; i2 < size; i2++) {
            AdapterHelper.UpdateOp updateOp = adapterHelper.mPendingUpdates.get(i2);
            int i3 = updateOp.cmd;
            if (i3 != 1) {
                if (i3 == 2) {
                    int i4 = updateOp.positionStart;
                    if (i4 <= i) {
                        int i5 = updateOp.itemCount;
                        if (i4 + i5 > i) {
                            return -1;
                        }
                        i -= i5;
                    } else {
                        continue;
                    }
                } else if (i3 == 8) {
                    int i6 = updateOp.positionStart;
                    if (i6 == i) {
                        i = updateOp.itemCount;
                    } else {
                        if (i6 < i) {
                            i--;
                        }
                        if (updateOp.itemCount <= i) {
                            i++;
                        }
                    }
                }
            } else if (updateOp.positionStart <= i) {
                i += updateOp.itemCount;
            }
        }
        return i;
    }

    @Override // android.view.View
    public int getBaseline() {
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager == null) {
            return super.getBaseline();
        }
        Objects.requireNonNull(layoutManager);
        return -1;
    }

    public long getChangedHolderKey(ViewHolder holder) {
        if (this.mAdapter.mHasStableIds) {
            return holder.mItemId;
        }
        return holder.mPosition;
    }

    public int getChildAdapterPosition(View child) {
        ViewHolder childViewHolderInt = getChildViewHolderInt(child);
        if (childViewHolderInt != null) {
            return childViewHolderInt.getAbsoluteAdapterPosition();
        }
        return -1;
    }

    @Override // android.view.ViewGroup
    public int getChildDrawingOrder(int childCount, int i) {
        ChildDrawingOrderCallback childDrawingOrderCallback = this.mChildDrawingOrderCallback;
        if (childDrawingOrderCallback == null) {
            return super.getChildDrawingOrder(childCount, i);
        }
        return childDrawingOrderCallback.onGetChildDrawingOrder(childCount, i);
    }

    public long getChildItemId(View child) {
        ViewHolder childViewHolderInt;
        Adapter adapter = this.mAdapter;
        if (adapter == null || !adapter.mHasStableIds || (childViewHolderInt = getChildViewHolderInt(child)) == null) {
            return -1L;
        }
        return childViewHolderInt.mItemId;
    }

    public int getChildLayoutPosition(View child) {
        ViewHolder childViewHolderInt = getChildViewHolderInt(child);
        if (childViewHolderInt != null) {
            return childViewHolderInt.getLayoutPosition();
        }
        return -1;
    }

    @Deprecated
    public int getChildPosition(View child) {
        return getChildAdapterPosition(child);
    }

    public ViewHolder getChildViewHolder(View child) {
        ViewParent parent = child.getParent();
        if (parent == null || parent == this) {
            return getChildViewHolderInt(child);
        }
        throw new IllegalArgumentException("View " + child + " is not a direct child of " + this);
    }

    @Override // android.view.ViewGroup
    public boolean getClipToPadding() {
        return this.mClipToPadding;
    }

    public RecyclerViewAccessibilityDelegate getCompatAccessibilityDelegate() {
        return this.mAccessibilityDelegate;
    }

    public void getDecoratedBoundsWithMargins(View view, Rect outBounds) {
        getDecoratedBoundsWithMarginsInt(view, outBounds);
    }

    public EdgeEffectFactory getEdgeEffectFactory() {
        return this.mEdgeEffectFactory;
    }

    public ItemAnimator getItemAnimator() {
        return this.mItemAnimator;
    }

    public Rect getItemDecorInsetsForChild(View child) {
        LayoutParams layoutParams = (LayoutParams) child.getLayoutParams();
        if (!layoutParams.mInsetsDirty) {
            return layoutParams.mDecorInsets;
        }
        if (this.mState.mInPreLayout && (layoutParams.isItemChanged() || layoutParams.mViewHolder.isInvalid())) {
            return layoutParams.mDecorInsets;
        }
        Rect rect = layoutParams.mDecorInsets;
        rect.set(0, 0, 0, 0);
        int size = this.mItemDecorations.size();
        for (int i = 0; i < size; i++) {
            this.mTempRect.set(0, 0, 0, 0);
            this.mItemDecorations.get(i).getItemOffsets(this.mTempRect, child, this, this.mState);
            int i2 = rect.left;
            Rect rect2 = this.mTempRect;
            rect.left = i2 + rect2.left;
            rect.top += rect2.top;
            rect.right += rect2.right;
            rect.bottom += rect2.bottom;
        }
        layoutParams.mInsetsDirty = false;
        return rect;
    }

    public ItemDecoration getItemDecorationAt(int index) {
        int itemDecorationCount = getItemDecorationCount();
        if (index >= 0 && index < itemDecorationCount) {
            return this.mItemDecorations.get(index);
        }
        throw new IndexOutOfBoundsException(index + " is an invalid index for size " + itemDecorationCount);
    }

    public int getItemDecorationCount() {
        return this.mItemDecorations.size();
    }

    public LayoutManager getLayoutManager() {
        return this.mLayout;
    }

    public int getMaxFlingVelocity() {
        return this.mMaxFlingVelocity;
    }

    public int getMinFlingVelocity() {
        return this.mMinFlingVelocity;
    }

    public long getNanoTime() {
        if (ALLOW_THREAD_GAP_WORK) {
            return System.nanoTime();
        }
        return 0L;
    }

    public OnFlingListener getOnFlingListener() {
        return this.mOnFlingListener;
    }

    public boolean getPreserveFocusAfterLayout() {
        return this.mPreserveFocusAfterLayout;
    }

    public RecycledViewPool getRecycledViewPool() {
        return this.mRecycler.getRecycledViewPool();
    }

    public int getScrollState() {
        return this.mScrollState;
    }

    public boolean hasFixedSize() {
        return this.mHasFixedSize;
    }

    @Override // android.view.View
    public boolean hasNestedScrollingParent() {
        return getScrollingChildHelper().hasNestedScrollingParent(0);
    }

    public boolean hasPendingAdapterUpdates() {
        return !this.mFirstLayoutComplete || this.mDataSetHasChangedAfterLayout || this.mAdapterHelper.hasPendingUpdates();
    }

    public void initAdapterManager() {
        this.mAdapterHelper = new AdapterHelper(new AnonymousClass6());
    }

    public void initFastScroller(StateListDrawable verticalThumbDrawable, Drawable verticalTrackDrawable, StateListDrawable horizontalThumbDrawable, Drawable horizontalTrackDrawable) {
        if (verticalThumbDrawable == null || verticalTrackDrawable == null || horizontalThumbDrawable == null || horizontalTrackDrawable == null) {
            throw new IllegalArgumentException(ChildHelper$$ExternalSyntheticOutline0.m(this, ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Trying to set fast scroller without both required drawables.")));
        }
        Resources resources = getContext().getResources();
        new FastScroller(this, verticalThumbDrawable, verticalTrackDrawable, horizontalThumbDrawable, horizontalTrackDrawable, resources.getDimensionPixelSize(R.dimen.fastscroll_default_thickness), resources.getDimensionPixelSize(R.dimen.fastscroll_minimum_range), resources.getDimensionPixelOffset(R.dimen.fastscroll_margin));
    }

    public void invalidateGlows() {
        this.mBottomGlow = null;
        this.mTopGlow = null;
        this.mRightGlow = null;
        this.mLeftGlow = null;
    }

    public void invalidateItemDecorations() {
        if (this.mItemDecorations.size() != 0) {
            LayoutManager layoutManager = this.mLayout;
            if (layoutManager != null) {
                layoutManager.assertNotInLayoutOrScroll("Cannot invalidate item decorations during a scroll or layout");
            }
            markItemDecorInsetsDirty();
            requestLayout();
        }
    }

    public boolean isAccessibilityEnabled() {
        AccessibilityManager accessibilityManager = this.mAccessibilityManager;
        return accessibilityManager != null && accessibilityManager.isEnabled();
    }

    public boolean isAnimating() {
        ItemAnimator itemAnimator = this.mItemAnimator;
        return itemAnimator != null && itemAnimator.isRunning();
    }

    @Override // android.view.View
    public boolean isAttachedToWindow() {
        return this.mIsAttached;
    }

    public boolean isComputingLayout() {
        return this.mLayoutOrScrollCounter > 0;
    }

    @Deprecated
    public boolean isLayoutFrozen() {
        return isLayoutSuppressed();
    }

    @Override // android.view.ViewGroup
    public final boolean isLayoutSuppressed() {
        return this.mLayoutSuppressed;
    }

    @Override // android.view.View
    public boolean isNestedScrollingEnabled() {
        return getScrollingChildHelper().mIsNestedScrollingEnabled;
    }

    public void jumpToPositionForSmoothScroller(int position) {
        if (this.mLayout != null) {
            setScrollState(2);
            this.mLayout.scrollToPosition(position);
            awakenScrollBars();
        }
    }

    public void markItemDecorInsetsDirty() {
        int unfilteredChildCount = this.mChildHelper.getUnfilteredChildCount();
        for (int i = 0; i < unfilteredChildCount; i++) {
            ((LayoutParams) this.mChildHelper.getUnfilteredChildAt(i).getLayoutParams()).mInsetsDirty = true;
        }
        Recycler recycler = this.mRecycler;
        int size = recycler.mCachedViews.size();
        for (int i2 = 0; i2 < size; i2++) {
            LayoutParams layoutParams = (LayoutParams) recycler.mCachedViews.get(i2).itemView.getLayoutParams();
            if (layoutParams != null) {
                layoutParams.mInsetsDirty = true;
            }
        }
    }

    public void markKnownViewsInvalid() {
        int unfilteredChildCount = this.mChildHelper.getUnfilteredChildCount();
        for (int i = 0; i < unfilteredChildCount; i++) {
            ViewHolder childViewHolderInt = getChildViewHolderInt(this.mChildHelper.getUnfilteredChildAt(i));
            if (childViewHolderInt != null && !childViewHolderInt.shouldIgnore()) {
                childViewHolderInt.addFlags(6);
            }
        }
        markItemDecorInsetsDirty();
        Recycler recycler = this.mRecycler;
        int size = recycler.mCachedViews.size();
        for (int i2 = 0; i2 < size; i2++) {
            ViewHolder viewHolder = recycler.mCachedViews.get(i2);
            if (viewHolder != null) {
                viewHolder.addFlags(6);
                viewHolder.addChangePayload(null);
            }
        }
        Adapter adapter = RecyclerView.this.mAdapter;
        if (adapter == null || !adapter.mHasStableIds) {
            recycler.recycleAndClearCachedViews();
        }
    }

    public void nestedScrollBy(int x, int y) {
        nestedScrollByInternal(x, y, null, 1);
    }

    public void offsetChildrenHorizontal(int dx) {
        int childCount = this.mChildHelper.getChildCount();
        for (int i = 0; i < childCount; i++) {
            this.mChildHelper.getChildAt(i).offsetLeftAndRight(dx);
        }
    }

    public void offsetChildrenVertical(int dy) {
        int childCount = this.mChildHelper.getChildCount();
        for (int i = 0; i < childCount; i++) {
            this.mChildHelper.getChildAt(i).offsetTopAndBottom(dy);
        }
    }

    public void offsetPositionRecordsForInsert(int positionStart, int itemCount) {
        int unfilteredChildCount = this.mChildHelper.getUnfilteredChildCount();
        for (int i = 0; i < unfilteredChildCount; i++) {
            ViewHolder childViewHolderInt = getChildViewHolderInt(this.mChildHelper.getUnfilteredChildAt(i));
            if (childViewHolderInt != null && !childViewHolderInt.shouldIgnore() && childViewHolderInt.mPosition >= positionStart) {
                childViewHolderInt.offsetPosition(itemCount, false);
                this.mState.mStructureChanged = true;
            }
        }
        Recycler recycler = this.mRecycler;
        int size = recycler.mCachedViews.size();
        for (int i2 = 0; i2 < size; i2++) {
            ViewHolder viewHolder = recycler.mCachedViews.get(i2);
            if (viewHolder != null && viewHolder.mPosition >= positionStart) {
                viewHolder.offsetPosition(itemCount, false);
            }
        }
        requestLayout();
    }

    public void offsetPositionRecordsForMove(int from, int to) {
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        int unfilteredChildCount = this.mChildHelper.getUnfilteredChildCount();
        int i8 = -1;
        if (from < to) {
            i3 = from;
            i2 = to;
            i = -1;
        } else {
            i2 = from;
            i3 = to;
            i = 1;
        }
        for (int i9 = 0; i9 < unfilteredChildCount; i9++) {
            ViewHolder childViewHolderInt = getChildViewHolderInt(this.mChildHelper.getUnfilteredChildAt(i9));
            if (childViewHolderInt != null && (i7 = childViewHolderInt.mPosition) >= i3 && i7 <= i2) {
                if (i7 == from) {
                    childViewHolderInt.offsetPosition(to - from, false);
                } else {
                    childViewHolderInt.offsetPosition(i, false);
                }
                this.mState.mStructureChanged = true;
            }
        }
        Recycler recycler = this.mRecycler;
        if (from < to) {
            i5 = from;
            i4 = to;
        } else {
            i4 = from;
            i8 = 1;
            i5 = to;
        }
        int size = recycler.mCachedViews.size();
        for (int i10 = 0; i10 < size; i10++) {
            ViewHolder viewHolder = recycler.mCachedViews.get(i10);
            if (viewHolder != null && (i6 = viewHolder.mPosition) >= i5 && i6 <= i4) {
                if (i6 == from) {
                    viewHolder.offsetPosition(to - from, false);
                } else {
                    viewHolder.offsetPosition(i8, false);
                }
            }
        }
        requestLayout();
    }

    public void offsetPositionRecordsForRemove(int positionStart, int itemCount, boolean applyToPreLayout) {
        int i = positionStart + itemCount;
        int unfilteredChildCount = this.mChildHelper.getUnfilteredChildCount();
        for (int i2 = 0; i2 < unfilteredChildCount; i2++) {
            ViewHolder childViewHolderInt = getChildViewHolderInt(this.mChildHelper.getUnfilteredChildAt(i2));
            if (childViewHolderInt != null && !childViewHolderInt.shouldIgnore()) {
                int i3 = childViewHolderInt.mPosition;
                if (i3 >= i) {
                    childViewHolderInt.offsetPosition(-itemCount, applyToPreLayout);
                    this.mState.mStructureChanged = true;
                } else if (i3 >= positionStart) {
                    childViewHolderInt.addFlags(8);
                    childViewHolderInt.offsetPosition(-itemCount, applyToPreLayout);
                    childViewHolderInt.mPosition = positionStart - 1;
                    this.mState.mStructureChanged = true;
                }
            }
        }
        Recycler recycler = this.mRecycler;
        int size = recycler.mCachedViews.size();
        while (true) {
            size--;
            if (size >= 0) {
                ViewHolder viewHolder = recycler.mCachedViews.get(size);
                if (viewHolder != null) {
                    int i4 = viewHolder.mPosition;
                    if (i4 >= i) {
                        viewHolder.offsetPosition(-itemCount, applyToPreLayout);
                    } else if (i4 >= positionStart) {
                        viewHolder.addFlags(8);
                        recycler.recycleCachedViewAt(size);
                    }
                }
            } else {
                requestLayout();
                return;
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.mLayoutOrScrollCounter = 0;
        this.mIsAttached = true;
        this.mFirstLayoutComplete = this.mFirstLayoutComplete && !isLayoutRequested();
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager != null) {
            layoutManager.mIsAttachedToWindow = true;
        }
        this.mPostedAnimatorRunner = false;
        if (ALLOW_THREAD_GAP_WORK) {
            ThreadLocal<GapWorker> threadLocal = GapWorker.sGapWorker;
            GapWorker gapWorker = threadLocal.get();
            this.mGapWorker = gapWorker;
            if (gapWorker == null) {
                this.mGapWorker = new GapWorker();
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                Display display = getDisplay();
                float f = 60.0f;
                if (!isInEditMode() && display != null) {
                    float refreshRate = display.getRefreshRate();
                    if (refreshRate >= 30.0f) {
                        f = refreshRate;
                    }
                }
                GapWorker gapWorker2 = this.mGapWorker;
                gapWorker2.mFrameIntervalNs = 1.0E9f / f;
                threadLocal.set(gapWorker2);
            }
            this.mGapWorker.mRecyclerViews.add(this);
        }
    }

    public void onChildAttachedToWindow(View child) {
    }

    public void onChildDetachedFromWindow(View child) {
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        GapWorker gapWorker;
        super.onDetachedFromWindow();
        ItemAnimator itemAnimator = this.mItemAnimator;
        if (itemAnimator != null) {
            itemAnimator.endAnimations();
        }
        stopScroll();
        this.mIsAttached = false;
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager != null) {
            Recycler recycler = this.mRecycler;
            layoutManager.mIsAttachedToWindow = false;
            layoutManager.onDetachedFromWindow(this, recycler);
        }
        this.mPendingAccessibilityImportanceChange.clear();
        removeCallbacks(this.mItemAnimatorRunner);
        Objects.requireNonNull(this.mViewInfoStore);
        do {
        } while (((Pools$SimplePool) ViewInfoStore.InfoRecord.sPool).acquire() != null);
        if (ALLOW_THREAD_GAP_WORK && (gapWorker = this.mGapWorker) != null) {
            gapWorker.mRecyclerViews.remove(this);
            this.mGapWorker = null;
        }
    }

    @Override // android.view.View
    public void onDraw(Canvas c) {
        super.onDraw(c);
        int size = this.mItemDecorations.size();
        for (int i = 0; i < size; i++) {
            this.mItemDecorations.get(i).onDraw(c, this, this.mState);
        }
    }

    public void onEnterLayoutOrScroll() {
        this.mLayoutOrScrollCounter++;
    }

    public void onExitLayoutOrScroll() {
        onExitLayoutOrScroll(true);
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x0068  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean onGenericMotionEvent(android.view.MotionEvent r6) {
        /*
            r5 = this;
            androidx.recyclerview.widget.RecyclerView$LayoutManager r0 = r5.mLayout
            r1 = 0
            if (r0 != 0) goto L6
            return r1
        L6:
            boolean r0 = r5.mLayoutSuppressed
            if (r0 == 0) goto Lb
            return r1
        Lb:
            int r0 = r6.getAction()
            r2 = 8
            if (r0 != r2) goto L78
            int r0 = r6.getSource()
            r0 = r0 & 2
            r2 = 0
            if (r0 == 0) goto L3e
            androidx.recyclerview.widget.RecyclerView$LayoutManager r0 = r5.mLayout
            boolean r0 = r0.canScrollVertically()
            if (r0 == 0) goto L2c
            r0 = 9
            float r0 = r6.getAxisValue(r0)
            float r0 = -r0
            goto L2d
        L2c:
            r0 = r2
        L2d:
            androidx.recyclerview.widget.RecyclerView$LayoutManager r3 = r5.mLayout
            boolean r3 = r3.canScrollHorizontally()
            if (r3 == 0) goto L3c
            r3 = 10
            float r3 = r6.getAxisValue(r3)
            goto L64
        L3c:
            r3 = r2
            goto L64
        L3e:
            int r0 = r6.getSource()
            r3 = 4194304(0x400000, float:5.877472E-39)
            r0 = r0 & r3
            if (r0 == 0) goto L62
            r0 = 26
            float r0 = r6.getAxisValue(r0)
            androidx.recyclerview.widget.RecyclerView$LayoutManager r3 = r5.mLayout
            boolean r3 = r3.canScrollVertically()
            if (r3 == 0) goto L57
            float r0 = -r0
            goto L3c
        L57:
            androidx.recyclerview.widget.RecyclerView$LayoutManager r3 = r5.mLayout
            boolean r3 = r3.canScrollHorizontally()
            if (r3 == 0) goto L62
            r3 = r0
            r0 = r2
            goto L64
        L62:
            r0 = r2
            r3 = r0
        L64:
            int r4 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1))
            if (r4 != 0) goto L6c
            int r2 = (r3 > r2 ? 1 : (r3 == r2 ? 0 : -1))
            if (r2 == 0) goto L78
        L6c:
            float r2 = r5.mScaledHorizontalScrollFactor
            float r3 = r3 * r2
            int r2 = (int) r3
            float r3 = r5.mScaledVerticalScrollFactor
            float r0 = r0 * r3
            int r0 = (int) r0
            r3 = 1
            r5.nestedScrollByInternal(r2, r0, r6, r3)
        L78:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.RecyclerView.onGenericMotionEvent(android.view.MotionEvent):boolean");
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent e) {
        Object[] objArr;
        if (this.mLayoutSuppressed) {
            return false;
        }
        this.mInterceptingOnItemTouchListener = null;
        if (findInterceptingOnItemTouchListener(e)) {
            cancelScroll();
            return true;
        }
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager == null) {
            return false;
        }
        boolean canScrollHorizontally = layoutManager.canScrollHorizontally();
        boolean canScrollVertically = this.mLayout.canScrollVertically();
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(e);
        int actionMasked = e.getActionMasked();
        int actionIndex = e.getActionIndex();
        if (actionMasked == 0) {
            if (this.mIgnoreMotionEventTillDown) {
                this.mIgnoreMotionEventTillDown = false;
            }
            this.mScrollPointerId = e.getPointerId(0);
            int x = (int) (e.getX() + 0.5f);
            this.mLastTouchX = x;
            this.mInitialTouchX = x;
            int y = (int) (e.getY() + 0.5f);
            this.mLastTouchY = y;
            this.mInitialTouchY = y;
            if (stopGlowAnimations(e) || this.mScrollState == 2) {
                getParent().requestDisallowInterceptTouchEvent(true);
                setScrollState(1);
                stopNestedScroll(1);
            }
            int[] iArr = this.mNestedOffsets;
            iArr[1] = 0;
            iArr[0] = 0;
            if (canScrollVertically) {
                boolean z = canScrollHorizontally ? 1 : 0;
                char c = canScrollHorizontally ? 1 : 0;
                canScrollHorizontally = z | true;
            }
            int i = canScrollHorizontally ? 1 : 0;
            int i2 = canScrollHorizontally ? 1 : 0;
            startNestedScroll(i, 0);
        } else if (actionMasked == 1) {
            this.mVelocityTracker.clear();
            stopNestedScroll(0);
        } else if (actionMasked == 2) {
            int findPointerIndex = e.findPointerIndex(this.mScrollPointerId);
            if (findPointerIndex < 0) {
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Error processing scroll; pointer index for id ");
                m.append(this.mScrollPointerId);
                m.append(" not found. Did any MotionEvents get skipped?");
                Log.e(TAG, m.toString());
                return false;
            }
            int x2 = (int) (e.getX(findPointerIndex) + 0.5f);
            int y2 = (int) (e.getY(findPointerIndex) + 0.5f);
            if (this.mScrollState != 1) {
                int i3 = x2 - this.mInitialTouchX;
                int i4 = y2 - this.mInitialTouchY;
                if (!canScrollHorizontally || Math.abs(i3) <= this.mTouchSlop) {
                    objArr = null;
                } else {
                    this.mLastTouchX = x2;
                    objArr = 1;
                }
                if (canScrollVertically && Math.abs(i4) > this.mTouchSlop) {
                    this.mLastTouchY = y2;
                    objArr = 1;
                }
                if (objArr != null) {
                    setScrollState(1);
                }
            }
        } else if (actionMasked == 3) {
            cancelScroll();
        } else if (actionMasked == 5) {
            this.mScrollPointerId = e.getPointerId(actionIndex);
            int x3 = (int) (e.getX(actionIndex) + 0.5f);
            this.mLastTouchX = x3;
            this.mInitialTouchX = x3;
            int y3 = (int) (e.getY(actionIndex) + 0.5f);
            this.mLastTouchY = y3;
            this.mInitialTouchY = y3;
        } else if (actionMasked == 6) {
            onPointerUp(e);
        }
        return this.mScrollState == 1;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onLayout(boolean changed, int l, int t, int r, int b) {
        Trace.beginSection(TRACE_ON_LAYOUT_TAG);
        dispatchLayout();
        Trace.endSection();
        this.mFirstLayoutComplete = true;
    }

    @Override // android.view.View
    public void onMeasure(int widthSpec, int heightSpec) {
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager == null) {
            defaultOnMeasure(widthSpec, heightSpec);
            return;
        }
        boolean z = false;
        if (layoutManager.isAutoMeasureEnabled()) {
            int mode = View.MeasureSpec.getMode(widthSpec);
            int mode2 = View.MeasureSpec.getMode(heightSpec);
            this.mLayout.mRecyclerView.defaultOnMeasure(widthSpec, heightSpec);
            if (mode == 1073741824 && mode2 == 1073741824) {
                z = true;
            }
            this.mLastAutoMeasureSkippedDueToExact = z;
            if (!z && this.mAdapter != null) {
                if (this.mState.mLayoutStep == 1) {
                    dispatchLayoutStep1();
                }
                this.mLayout.setMeasureSpecs(widthSpec, heightSpec);
                this.mState.mIsMeasuring = true;
                dispatchLayoutStep2();
                this.mLayout.setMeasuredDimensionFromChildren(widthSpec, heightSpec);
                if (this.mLayout.shouldMeasureTwice()) {
                    this.mLayout.setMeasureSpecs(View.MeasureSpec.makeMeasureSpec(getMeasuredWidth(), IntMath.MAX_SIGNED_POWER_OF_TWO), View.MeasureSpec.makeMeasureSpec(getMeasuredHeight(), IntMath.MAX_SIGNED_POWER_OF_TWO));
                    this.mState.mIsMeasuring = true;
                    dispatchLayoutStep2();
                    this.mLayout.setMeasuredDimensionFromChildren(widthSpec, heightSpec);
                }
                this.mLastAutoMeasureNonExactMeasuredWidth = getMeasuredWidth();
                this.mLastAutoMeasureNonExactMeasuredHeight = getMeasuredHeight();
            }
        } else if (this.mHasFixedSize) {
            this.mLayout.mRecyclerView.defaultOnMeasure(widthSpec, heightSpec);
        } else {
            if (this.mAdapterUpdateDuringMeasure) {
                startInterceptRequestLayout();
                onEnterLayoutOrScroll();
                processAdapterUpdatesAndSetAnimationFlags();
                onExitLayoutOrScroll();
                State state = this.mState;
                if (state.mRunPredictiveAnimations) {
                    state.mInPreLayout = true;
                } else {
                    this.mAdapterHelper.consumeUpdatesInOnePass();
                    this.mState.mInPreLayout = false;
                }
                this.mAdapterUpdateDuringMeasure = false;
                stopInterceptRequestLayout(false);
            } else if (this.mState.mRunPredictiveAnimations) {
                setMeasuredDimension(getMeasuredWidth(), getMeasuredHeight());
                return;
            }
            Adapter adapter = this.mAdapter;
            if (adapter != null) {
                this.mState.mItemCount = adapter.getItemCount();
            } else {
                this.mState.mItemCount = 0;
            }
            startInterceptRequestLayout();
            this.mLayout.mRecyclerView.defaultOnMeasure(widthSpec, heightSpec);
            stopInterceptRequestLayout(false);
            this.mState.mInPreLayout = false;
        }
    }

    @Override // android.view.ViewGroup
    public boolean onRequestFocusInDescendants(int direction, Rect previouslyFocusedRect) {
        if (isComputingLayout()) {
            return false;
        }
        return super.onRequestFocusInDescendants(direction, previouslyFocusedRect);
    }

    @Override // android.view.View
    public void onRestoreInstanceState(Parcelable state) {
        if (!(state instanceof SavedState)) {
            super.onRestoreInstanceState(state);
            return;
        }
        SavedState savedState = (SavedState) state;
        this.mPendingSavedState = savedState;
        super.onRestoreInstanceState(savedState.mSuperState);
        requestLayout();
    }

    @Override // android.view.View
    public Parcelable onSaveInstanceState() {
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        SavedState savedState2 = this.mPendingSavedState;
        if (savedState2 != null) {
            savedState.mLayoutState = savedState2.mLayoutState;
        } else {
            LayoutManager layoutManager = this.mLayout;
            if (layoutManager != null) {
                savedState.mLayoutState = layoutManager.onSaveInstanceState();
            } else {
                savedState.mLayoutState = null;
            }
        }
        return savedState;
    }

    public void onScrollStateChanged(int state) {
    }

    public void onScrolled(int dx, int dy) {
    }

    @Override // android.view.View
    public void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        if (w != oldw || h != oldh) {
            invalidateGlows();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:47:0x00de  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00f4  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean onTouchEvent(android.view.MotionEvent r18) {
        /*
            Method dump skipped, instructions count: 495
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.RecyclerView.onTouchEvent(android.view.MotionEvent):boolean");
    }

    public void postAnimationRunner() {
        if (!this.mPostedAnimatorRunner && this.mIsAttached) {
            Runnable runnable = this.mItemAnimatorRunner;
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            postOnAnimation(runnable);
            this.mPostedAnimatorRunner = true;
        }
    }

    public void processDataSetCompletelyChanged(boolean dispatchItemsChanged) {
        this.mDispatchItemsChangedEvent = dispatchItemsChanged | this.mDispatchItemsChangedEvent;
        this.mDataSetHasChangedAfterLayout = true;
        markKnownViewsInvalid();
    }

    public void recordAnimationInfoIfBouncedHiddenView(ViewHolder viewHolder, ItemAnimator.ItemHolderInfo animationInfo) {
        viewHolder.setFlags(0, QuickStepContract.SYSUI_STATE_ASSIST_GESTURE_CONSTRAINED);
        if (this.mState.mTrackOldChangeHolders && viewHolder.isUpdated() && !viewHolder.isRemoved() && !viewHolder.shouldIgnore()) {
            this.mViewInfoStore.mOldChangedHolders.put(getChangedHolderKey(viewHolder), viewHolder);
        }
        this.mViewInfoStore.addToPreLayout(viewHolder, animationInfo);
    }

    public void removeAndRecycleViews() {
        ItemAnimator itemAnimator = this.mItemAnimator;
        if (itemAnimator != null) {
            itemAnimator.endAnimations();
        }
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager != null) {
            layoutManager.removeAndRecycleAllViews(this.mRecycler);
            this.mLayout.removeAndRecycleScrapInt(this.mRecycler);
        }
        this.mRecycler.clear();
    }

    public boolean removeAnimatingView(View view) {
        startInterceptRequestLayout();
        ChildHelper childHelper = this.mChildHelper;
        int indexOfChild = RecyclerView.this.indexOfChild(view);
        boolean z = true;
        if (indexOfChild == -1) {
            childHelper.unhideViewInternal(view);
        } else if (childHelper.mBucket.get(indexOfChild)) {
            childHelper.mBucket.remove(indexOfChild);
            childHelper.unhideViewInternal(view);
            ((AnonymousClass5) childHelper.mCallback).removeViewAt(indexOfChild);
        } else {
            z = false;
        }
        if (z) {
            ViewHolder childViewHolderInt = getChildViewHolderInt(view);
            this.mRecycler.unscrapView(childViewHolderInt);
            this.mRecycler.recycleViewHolderInternal(childViewHolderInt);
        }
        stopInterceptRequestLayout(!z);
        return z;
    }

    @Override // android.view.ViewGroup
    public void removeDetachedView(View child, boolean animate) {
        ViewHolder childViewHolderInt = getChildViewHolderInt(child);
        if (childViewHolderInt != null) {
            if (childViewHolderInt.isTmpDetached()) {
                childViewHolderInt.mFlags &= -257;
            } else if (!childViewHolderInt.shouldIgnore()) {
                StringBuilder sb = new StringBuilder();
                sb.append("Called removeDetachedView with a view which is not flagged as tmp detached.");
                sb.append(childViewHolderInt);
                throw new IllegalArgumentException(ChildHelper$$ExternalSyntheticOutline0.m(this, sb));
            }
        }
        child.clearAnimation();
        dispatchChildDetached(child);
        super.removeDetachedView(child, animate);
    }

    public void removeItemDecoration(ItemDecoration decor) {
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager != null) {
            layoutManager.assertNotInLayoutOrScroll("Cannot remove item decoration during a scroll  or layout");
        }
        this.mItemDecorations.remove(decor);
        if (this.mItemDecorations.isEmpty()) {
            setWillNotDraw(getOverScrollMode() == 2);
        }
        markItemDecorInsetsDirty();
        requestLayout();
    }

    public void removeItemDecorationAt(int index) {
        int itemDecorationCount = getItemDecorationCount();
        if (index < 0 || index >= itemDecorationCount) {
            throw new IndexOutOfBoundsException(index + " is an invalid index for size " + itemDecorationCount);
        }
        removeItemDecoration(getItemDecorationAt(index));
    }

    public void removeOnChildAttachStateChangeListener(OnChildAttachStateChangeListener listener) {
        List<OnChildAttachStateChangeListener> list = this.mOnChildAttachStateListeners;
        if (list != null) {
            list.remove(listener);
        }
    }

    public void removeOnItemTouchListener(OnItemTouchListener listener) {
        this.mOnItemTouchListeners.remove(listener);
        if (this.mInterceptingOnItemTouchListener == listener) {
            this.mInterceptingOnItemTouchListener = null;
        }
    }

    public void removeOnScrollListener(OnScrollListener listener) {
        List<OnScrollListener> list = this.mScrollListeners;
        if (list != null) {
            list.remove(listener);
        }
    }

    public void removeRecyclerListener(RecyclerListener listener) {
        this.mRecyclerListeners.remove(listener);
    }

    public void repositionShadowingViews() {
        ViewHolder viewHolder;
        int childCount = this.mChildHelper.getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = this.mChildHelper.getChildAt(i);
            ViewHolder childViewHolder = getChildViewHolder(childAt);
            if (!(childViewHolder == null || (viewHolder = childViewHolder.mShadowingHolder) == null)) {
                View view = viewHolder.itemView;
                int left = childAt.getLeft();
                int top = childAt.getTop();
                if (left != view.getLeft() || top != view.getTop()) {
                    view.layout(left, top, view.getWidth() + left, view.getHeight() + top);
                }
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public void requestChildFocus(View child, View focused) {
        SmoothScroller smoothScroller = this.mLayout.mSmoothScroller;
        boolean z = true;
        if (!(smoothScroller != null && smoothScroller.mRunning) && !isComputingLayout()) {
            z = false;
        }
        if (!z && focused != null) {
            requestChildOnScreen(child, focused);
        }
        super.requestChildFocus(child, focused);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public boolean requestChildRectangleOnScreen(View child, Rect rect, boolean immediate) {
        return this.mLayout.requestChildRectangleOnScreen(this, child, rect, immediate, false);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public void requestDisallowInterceptTouchEvent(boolean disallowIntercept) {
        int size = this.mOnItemTouchListeners.size();
        for (int i = 0; i < size; i++) {
            this.mOnItemTouchListeners.get(i).onRequestDisallowInterceptTouchEvent(disallowIntercept);
        }
        super.requestDisallowInterceptTouchEvent(disallowIntercept);
    }

    @Override // android.view.View, android.view.ViewParent
    public void requestLayout() {
        if (this.mInterceptRequestLayoutDepth != 0 || this.mLayoutSuppressed) {
            this.mLayoutWasDefered = true;
        } else {
            super.requestLayout();
        }
    }

    public void saveOldPositions() {
        int unfilteredChildCount = this.mChildHelper.getUnfilteredChildCount();
        for (int i = 0; i < unfilteredChildCount; i++) {
            ViewHolder childViewHolderInt = getChildViewHolderInt(this.mChildHelper.getUnfilteredChildAt(i));
            if (!childViewHolderInt.shouldIgnore() && childViewHolderInt.mOldPosition == -1) {
                childViewHolderInt.mOldPosition = childViewHolderInt.mPosition;
            }
        }
    }

    @Override // android.view.View
    public void scrollBy(int x, int y) {
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager == null) {
            Log.e(TAG, "Cannot scroll without a LayoutManager set. Call setLayoutManager with a non-null argument.");
        } else if (!this.mLayoutSuppressed) {
            boolean canScrollHorizontally = layoutManager.canScrollHorizontally();
            boolean canScrollVertically = this.mLayout.canScrollVertically();
            if (canScrollHorizontally || canScrollVertically) {
                if (!canScrollHorizontally) {
                    x = 0;
                }
                if (!canScrollVertically) {
                    y = 0;
                }
                scrollByInternal(x, y, null, 0);
            }
        }
    }

    public boolean scrollByInternal(int x, int y, MotionEvent ev, int type) {
        int i;
        int i2;
        int i3;
        int i4;
        consumePendingUpdateOperations();
        if (this.mAdapter != null) {
            int[] iArr = this.mReusableIntPair;
            iArr[0] = 0;
            iArr[1] = 0;
            scrollStep(x, y, iArr);
            int[] iArr2 = this.mReusableIntPair;
            int i5 = iArr2[0];
            int i6 = iArr2[1];
            i2 = x - i5;
            i = y - i6;
            i4 = i6;
            i3 = i5;
        } else {
            i4 = 0;
            i3 = 0;
            i2 = 0;
            i = 0;
        }
        if (!this.mItemDecorations.isEmpty()) {
            invalidate();
        }
        int[] iArr3 = this.mReusableIntPair;
        iArr3[0] = 0;
        iArr3[1] = 0;
        dispatchNestedScroll(i3, i4, i2, i, this.mScrollOffset, type, iArr3);
        int[] iArr4 = this.mReusableIntPair;
        int i7 = i2 - iArr4[0];
        int i8 = i - iArr4[1];
        boolean z = (iArr4[0] == 0 && iArr4[1] == 0) ? false : true;
        int i9 = this.mLastTouchX;
        int[] iArr5 = this.mScrollOffset;
        this.mLastTouchX = i9 - iArr5[0];
        this.mLastTouchY -= iArr5[1];
        int[] iArr6 = this.mNestedOffsets;
        iArr6[0] = iArr6[0] + iArr5[0];
        iArr6[1] = iArr6[1] + iArr5[1];
        if (getOverScrollMode() != 2) {
            if (ev != null) {
                if (!((ev.getSource() & 8194) == 8194)) {
                    pullGlows(ev.getX(), i7, ev.getY(), i8);
                }
            }
            considerReleasingGlowsOnScroll(x, y);
        }
        if (!(i3 == 0 && i4 == 0)) {
            dispatchOnScrolled(i3, i4);
        }
        if (!awakenScrollBars()) {
            invalidate();
        }
        return (!z && i3 == 0 && i4 == 0) ? false : true;
    }

    public void scrollStep(int dx, int dy, int[] consumed) {
        startInterceptRequestLayout();
        onEnterLayoutOrScroll();
        Trace.beginSection(TRACE_SCROLL_TAG);
        fillRemainingScrollValues(this.mState);
        int scrollHorizontallyBy = dx != 0 ? this.mLayout.scrollHorizontallyBy(dx, this.mRecycler, this.mState) : 0;
        int scrollVerticallyBy = dy != 0 ? this.mLayout.scrollVerticallyBy(dy, this.mRecycler, this.mState) : 0;
        Trace.endSection();
        repositionShadowingViews();
        onExitLayoutOrScroll();
        stopInterceptRequestLayout(false);
        if (consumed != null) {
            consumed[0] = scrollHorizontallyBy;
            consumed[1] = scrollVerticallyBy;
        }
    }

    @Override // android.view.View
    public void scrollTo(int x, int y) {
        Log.w(TAG, "RecyclerView does not support scrolling to an absolute position. Use scrollToPosition instead");
    }

    public void scrollToPosition(int position) {
        if (!this.mLayoutSuppressed) {
            stopScroll();
            LayoutManager layoutManager = this.mLayout;
            if (layoutManager == null) {
                Log.e(TAG, "Cannot scroll to position a LayoutManager set. Call setLayoutManager with a non-null argument.");
                return;
            }
            layoutManager.scrollToPosition(position);
            awakenScrollBars();
        }
    }

    @Override // android.view.View, android.view.accessibility.AccessibilityEventSource
    public void sendAccessibilityEventUnchecked(AccessibilityEvent event) {
        if (!shouldDeferAccessibilityEvent(event)) {
            super.sendAccessibilityEventUnchecked(event);
        }
    }

    public void setAccessibilityDelegateCompat(RecyclerViewAccessibilityDelegate accessibilityDelegate) {
        this.mAccessibilityDelegate = accessibilityDelegate;
        ViewCompat.setAccessibilityDelegate(this, accessibilityDelegate);
    }

    public void setAdapter(Adapter adapter) {
        setLayoutFrozen(false);
        setAdapterInternal(adapter, false, true);
        processDataSetCompletelyChanged(false);
        requestLayout();
    }

    public void setChildDrawingOrderCallback(ChildDrawingOrderCallback childDrawingOrderCallback) {
        if (childDrawingOrderCallback != this.mChildDrawingOrderCallback) {
            this.mChildDrawingOrderCallback = childDrawingOrderCallback;
            setChildrenDrawingOrderEnabled(childDrawingOrderCallback != null);
        }
    }

    public boolean setChildImportantForAccessibilityInternal(ViewHolder viewHolder, int importantForAccessibility) {
        if (isComputingLayout()) {
            viewHolder.mPendingAccessibilityState = importantForAccessibility;
            this.mPendingAccessibilityImportanceChange.add(viewHolder);
            return false;
        }
        View view = viewHolder.itemView;
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        view.setImportantForAccessibility(importantForAccessibility);
        return true;
    }

    @Override // android.view.ViewGroup
    public void setClipToPadding(boolean clipToPadding) {
        if (clipToPadding != this.mClipToPadding) {
            invalidateGlows();
        }
        this.mClipToPadding = clipToPadding;
        super.setClipToPadding(clipToPadding);
        if (this.mFirstLayoutComplete) {
            requestLayout();
        }
    }

    public void setEdgeEffectFactory(EdgeEffectFactory edgeEffectFactory) {
        Objects.requireNonNull(edgeEffectFactory);
        this.mEdgeEffectFactory = edgeEffectFactory;
        invalidateGlows();
    }

    public void setHasFixedSize(boolean hasFixedSize) {
        this.mHasFixedSize = hasFixedSize;
    }

    public void setItemAnimator(ItemAnimator animator) {
        ItemAnimator itemAnimator = this.mItemAnimator;
        if (itemAnimator != null) {
            itemAnimator.endAnimations();
            this.mItemAnimator.mListener = null;
        }
        this.mItemAnimator = animator;
        if (animator != null) {
            animator.mListener = this.mItemAnimatorListener;
        }
    }

    public void setItemViewCacheSize(int size) {
        Recycler recycler = this.mRecycler;
        recycler.mRequestedCacheMax = size;
        recycler.updateViewCacheSize();
    }

    @Deprecated
    public void setLayoutFrozen(boolean frozen) {
        suppressLayout(frozen);
    }

    public void setLayoutManager(LayoutManager layout) {
        if (layout != this.mLayout) {
            stopScroll();
            if (this.mLayout != null) {
                ItemAnimator itemAnimator = this.mItemAnimator;
                if (itemAnimator != null) {
                    itemAnimator.endAnimations();
                }
                this.mLayout.removeAndRecycleAllViews(this.mRecycler);
                this.mLayout.removeAndRecycleScrapInt(this.mRecycler);
                this.mRecycler.clear();
                if (this.mIsAttached) {
                    LayoutManager layoutManager = this.mLayout;
                    Recycler recycler = this.mRecycler;
                    layoutManager.mIsAttachedToWindow = false;
                    layoutManager.onDetachedFromWindow(this, recycler);
                }
                this.mLayout.setRecyclerView(null);
                this.mLayout = null;
            } else {
                this.mRecycler.clear();
            }
            ChildHelper childHelper = this.mChildHelper;
            ChildHelper.Bucket bucket = childHelper.mBucket;
            bucket.mData = 0L;
            ChildHelper.Bucket bucket2 = bucket.mNext;
            if (bucket2 != null) {
                bucket2.reset();
            }
            int size = childHelper.mHiddenViews.size();
            while (true) {
                size--;
                if (size < 0) {
                    break;
                }
                AnonymousClass5 r3 = (AnonymousClass5) childHelper.mCallback;
                Objects.requireNonNull(r3);
                ViewHolder childViewHolderInt = getChildViewHolderInt(childHelper.mHiddenViews.get(size));
                if (childViewHolderInt != null) {
                    RecyclerView.this.setChildImportantForAccessibilityInternal(childViewHolderInt, childViewHolderInt.mWasImportantForAccessibilityBeforeHidden);
                    childViewHolderInt.mWasImportantForAccessibilityBeforeHidden = 0;
                }
                childHelper.mHiddenViews.remove(size);
            }
            AnonymousClass5 r0 = (AnonymousClass5) childHelper.mCallback;
            int childCount = r0.getChildCount();
            for (int i = 0; i < childCount; i++) {
                View childAt = r0.getChildAt(i);
                RecyclerView.this.dispatchChildDetached(childAt);
                childAt.clearAnimation();
            }
            RecyclerView.this.removeAllViews();
            this.mLayout = layout;
            if (layout != null) {
                if (layout.mRecyclerView == null) {
                    layout.setRecyclerView(this);
                    if (this.mIsAttached) {
                        this.mLayout.mIsAttachedToWindow = true;
                    }
                } else {
                    StringBuilder sb = new StringBuilder();
                    sb.append("LayoutManager ");
                    sb.append(layout);
                    sb.append(" is already attached to a RecyclerView:");
                    throw new IllegalArgumentException(ChildHelper$$ExternalSyntheticOutline0.m(layout.mRecyclerView, sb));
                }
            }
            this.mRecycler.updateViewCacheSize();
            requestLayout();
        }
    }

    @Override // android.view.ViewGroup
    @Deprecated
    public void setLayoutTransition(LayoutTransition transition) {
        if (transition == null) {
            super.setLayoutTransition(null);
            return;
        }
        throw new IllegalArgumentException("Providing a LayoutTransition into RecyclerView is not supported. Please use setItemAnimator() instead for animating changes to the items in this RecyclerView");
    }

    @Override // android.view.View
    public void setNestedScrollingEnabled(boolean enabled) {
        NestedScrollingChildHelper scrollingChildHelper = getScrollingChildHelper();
        if (scrollingChildHelper.mIsNestedScrollingEnabled) {
            View view = scrollingChildHelper.mView;
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            view.stopNestedScroll();
        }
        scrollingChildHelper.mIsNestedScrollingEnabled = enabled;
    }

    public void setOnFlingListener(OnFlingListener onFlingListener) {
        this.mOnFlingListener = onFlingListener;
    }

    @Deprecated
    public void setOnScrollListener(OnScrollListener listener) {
        this.mScrollListener = listener;
    }

    public void setPreserveFocusAfterLayout(boolean preserveFocusAfterLayout) {
        this.mPreserveFocusAfterLayout = preserveFocusAfterLayout;
    }

    public void setRecycledViewPool(RecycledViewPool pool) {
        RecycledViewPool recycledViewPool;
        Recycler recycler = this.mRecycler;
        if (recycler.mRecyclerPool != null) {
            recycledViewPool.mAttachCount--;
        }
        recycler.mRecyclerPool = pool;
        if (pool != null && RecyclerView.this.getAdapter() != null) {
            recycler.mRecyclerPool.mAttachCount++;
        }
    }

    @Deprecated
    public void setRecyclerListener(RecyclerListener listener) {
        this.mRecyclerListener = listener;
    }

    void setScrollState(int state) {
        if (state != this.mScrollState) {
            this.mScrollState = state;
            if (state != 2) {
                stopScrollersInternal();
            }
            dispatchOnScrollStateChanged(state);
        }
    }

    public void setScrollingTouchSlop(int slopConstant) {
        ViewConfiguration viewConfiguration = ViewConfiguration.get(getContext());
        if (slopConstant != 0) {
            if (slopConstant != 1) {
                Log.w(TAG, "setScrollingTouchSlop(): bad argument constant " + slopConstant + "; using default value");
            } else {
                this.mTouchSlop = viewConfiguration.getScaledPagingTouchSlop();
                return;
            }
        }
        this.mTouchSlop = viewConfiguration.getScaledTouchSlop();
    }

    public void setViewCacheExtension(ViewCacheExtension extension) {
        Objects.requireNonNull(this.mRecycler);
    }

    public boolean shouldDeferAccessibilityEvent(AccessibilityEvent event) {
        int i = 0;
        if (!isComputingLayout()) {
            return false;
        }
        int contentChangeTypes = event != null ? event.getContentChangeTypes() : 0;
        if (contentChangeTypes != 0) {
            i = contentChangeTypes;
        }
        this.mEatenAccessibilityChangeFlags |= i;
        return true;
    }

    public void smoothScrollBy(int dx, int dy) {
        smoothScrollBy(dx, dy, null);
    }

    public void smoothScrollToPosition(int position) {
        if (!this.mLayoutSuppressed) {
            LayoutManager layoutManager = this.mLayout;
            if (layoutManager == null) {
                Log.e(TAG, "Cannot smooth scroll without a LayoutManager set. Call setLayoutManager with a non-null argument.");
            } else {
                layoutManager.smoothScrollToPosition(this, this.mState, position);
            }
        }
    }

    public void startInterceptRequestLayout() {
        int i = this.mInterceptRequestLayoutDepth + 1;
        this.mInterceptRequestLayoutDepth = i;
        if (i == 1 && !this.mLayoutSuppressed) {
            this.mLayoutWasDefered = false;
        }
    }

    @Override // android.view.View
    public boolean startNestedScroll(int axes) {
        return getScrollingChildHelper().startNestedScroll(axes, 0);
    }

    public void stopInterceptRequestLayout(boolean performLayoutChildren) {
        if (this.mInterceptRequestLayoutDepth < 1) {
            this.mInterceptRequestLayoutDepth = 1;
        }
        if (!performLayoutChildren && !this.mLayoutSuppressed) {
            this.mLayoutWasDefered = false;
        }
        if (this.mInterceptRequestLayoutDepth == 1) {
            if (performLayoutChildren && this.mLayoutWasDefered && !this.mLayoutSuppressed && this.mLayout != null && this.mAdapter != null) {
                dispatchLayout();
            }
            if (!this.mLayoutSuppressed) {
                this.mLayoutWasDefered = false;
            }
        }
        this.mInterceptRequestLayoutDepth--;
    }

    @Override // android.view.View
    public void stopNestedScroll() {
        getScrollingChildHelper().stopNestedScroll(0);
    }

    public void stopScroll() {
        setScrollState(0);
        stopScrollersInternal();
    }

    @Override // android.view.ViewGroup
    public final void suppressLayout(boolean suppress) {
        if (suppress != this.mLayoutSuppressed) {
            assertNotInLayoutOrScroll("Do not suppressLayout in layout or scroll");
            if (!suppress) {
                this.mLayoutSuppressed = false;
                if (!(!this.mLayoutWasDefered || this.mLayout == null || this.mAdapter == null)) {
                    requestLayout();
                }
                this.mLayoutWasDefered = false;
                return;
            }
            long uptimeMillis = SystemClock.uptimeMillis();
            onTouchEvent(MotionEvent.obtain(uptimeMillis, uptimeMillis, 3, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 0));
            this.mLayoutSuppressed = true;
            this.mIgnoreMotionEventTillDown = true;
            stopScroll();
        }
    }

    public void swapAdapter(Adapter adapter, boolean removeAndRecycleExistingViews) {
        setLayoutFrozen(false);
        setAdapterInternal(adapter, true, removeAndRecycleExistingViews);
        processDataSetCompletelyChanged(true);
        requestLayout();
    }

    public void viewRangeUpdate(int positionStart, int itemCount, Object payload) {
        int i;
        int i2;
        int unfilteredChildCount = this.mChildHelper.getUnfilteredChildCount();
        int i3 = itemCount + positionStart;
        for (int i4 = 0; i4 < unfilteredChildCount; i4++) {
            View unfilteredChildAt = this.mChildHelper.getUnfilteredChildAt(i4);
            ViewHolder childViewHolderInt = getChildViewHolderInt(unfilteredChildAt);
            if (childViewHolderInt != null && !childViewHolderInt.shouldIgnore() && (i2 = childViewHolderInt.mPosition) >= positionStart && i2 < i3) {
                childViewHolderInt.addFlags(2);
                childViewHolderInt.addChangePayload(payload);
                ((LayoutParams) unfilteredChildAt.getLayoutParams()).mInsetsDirty = true;
            }
        }
        Recycler recycler = this.mRecycler;
        int size = recycler.mCachedViews.size();
        while (true) {
            size--;
            if (size >= 0) {
                ViewHolder viewHolder = recycler.mCachedViews.get(size);
                if (viewHolder != null && (i = viewHolder.mPosition) >= positionStart && i < i3) {
                    viewHolder.addFlags(2);
                    recycler.recycleCachedViewAt(size);
                }
            } else {
                return;
            }
        }
    }

    public RecyclerView(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.recyclerViewStyle);
    }

    public boolean dispatchNestedScroll(int dxConsumed, int dyConsumed, int dxUnconsumed, int dyUnconsumed, int[] offsetInWindow, int type) {
        return getScrollingChildHelper().dispatchNestedScrollInternal(dxConsumed, dyConsumed, dxUnconsumed, dyUnconsumed, offsetInWindow, type, null);
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0034  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0036 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public androidx.recyclerview.widget.RecyclerView.ViewHolder findViewHolderForPosition(int r6, boolean r7) {
        /*
            r5 = this;
            androidx.recyclerview.widget.ChildHelper r0 = r5.mChildHelper
            int r0 = r0.getUnfilteredChildCount()
            r1 = 0
            r2 = 0
        L8:
            if (r2 >= r0) goto L3a
            androidx.recyclerview.widget.ChildHelper r3 = r5.mChildHelper
            android.view.View r3 = r3.getUnfilteredChildAt(r2)
            androidx.recyclerview.widget.RecyclerView$ViewHolder r3 = getChildViewHolderInt(r3)
            if (r3 == 0) goto L37
            boolean r4 = r3.isRemoved()
            if (r4 != 0) goto L37
            if (r7 == 0) goto L23
            int r4 = r3.mPosition
            if (r4 == r6) goto L2a
            goto L37
        L23:
            int r4 = r3.getLayoutPosition()
            if (r4 == r6) goto L2a
            goto L37
        L2a:
            androidx.recyclerview.widget.ChildHelper r1 = r5.mChildHelper
            android.view.View r4 = r3.itemView
            boolean r1 = r1.isHidden(r4)
            if (r1 == 0) goto L36
            r1 = r3
            goto L37
        L36:
            return r3
        L37:
            int r2 = r2 + 1
            goto L8
        L3a:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.RecyclerView.findViewHolderForPosition(int, boolean):androidx.recyclerview.widget.RecyclerView$ViewHolder");
    }

    public void onExitLayoutOrScroll(boolean enableChangeEvents) {
        int i = this.mLayoutOrScrollCounter - 1;
        this.mLayoutOrScrollCounter = i;
        if (i < 1) {
            this.mLayoutOrScrollCounter = 0;
            if (enableChangeEvents) {
                dispatchContentChangedIfNecessary();
                dispatchPendingImportantForAccessibilityChanges();
            }
        }
    }

    public void smoothScrollBy(int dx, int dy, Interpolator interpolator) {
        smoothScrollBy(dx, dy, interpolator, UNDEFINED_DURATION);
    }

    /* loaded from: classes.dex */
    public static class SavedState extends AbsSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.ClassLoaderCreator<SavedState>() { // from class: androidx.recyclerview.widget.RecyclerView.SavedState.1
            @Override // android.os.Parcelable.ClassLoaderCreator
            public SavedState createFromParcel(Parcel in, ClassLoader loader) {
                return new SavedState(in, loader);
            }

            @Override // android.os.Parcelable.Creator
            public Object[] newArray(int size) {
                return new SavedState[size];
            }

            @Override // android.os.Parcelable.Creator
            public Object createFromParcel(Parcel in) {
                return new SavedState(in, null);
            }
        };
        public Parcelable mLayoutState;

        public SavedState(Parcel in, ClassLoader loader) {
            super(in, loader);
            this.mLayoutState = in.readParcelable(loader == null ? LayoutManager.class.getClassLoader() : loader);
        }

        @Override // androidx.customview.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            dest.writeParcelable(this.mSuperState, flags);
            dest.writeParcelable(this.mLayoutState, 0);
        }

        public SavedState(Parcelable superState) {
            super(superState);
        }
    }

    public RecyclerView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mObserver = new RecyclerViewDataObserver();
        this.mRecycler = new Recycler();
        this.mViewInfoStore = new ViewInfoStore();
        this.mUpdateChildViewsRunnable = new Runnable() { // from class: androidx.recyclerview.widget.RecyclerView.1
            @Override // java.lang.Runnable
            public void run() {
                RecyclerView recyclerView = RecyclerView.this;
                if (recyclerView.mFirstLayoutComplete && !recyclerView.isLayoutRequested()) {
                    RecyclerView recyclerView2 = RecyclerView.this;
                    if (!recyclerView2.mIsAttached) {
                        recyclerView2.requestLayout();
                    } else if (recyclerView2.mLayoutSuppressed) {
                        recyclerView2.mLayoutWasDefered = true;
                    } else {
                        recyclerView2.consumePendingUpdateOperations();
                    }
                }
            }
        };
        this.mTempRect = new Rect();
        this.mTempRect2 = new Rect();
        this.mTempRectF = new RectF();
        this.mRecyclerListeners = new ArrayList();
        this.mItemDecorations = new ArrayList<>();
        this.mOnItemTouchListeners = new ArrayList<>();
        this.mInterceptRequestLayoutDepth = 0;
        this.mDataSetHasChangedAfterLayout = false;
        this.mDispatchItemsChangedEvent = false;
        this.mLayoutOrScrollCounter = 0;
        this.mDispatchScrollCounter = 0;
        this.mEdgeEffectFactory = sDefaultEdgeEffectFactory;
        this.mItemAnimator = new DefaultItemAnimator();
        this.mScrollState = 0;
        this.mScrollPointerId = -1;
        this.mScaledHorizontalScrollFactor = Float.MIN_VALUE;
        this.mScaledVerticalScrollFactor = Float.MIN_VALUE;
        this.mPreserveFocusAfterLayout = true;
        this.mViewFlinger = new ViewFlinger();
        this.mPrefetchRegistry = ALLOW_THREAD_GAP_WORK ? new GapWorker.LayoutPrefetchRegistryImpl() : null;
        this.mState = new State();
        this.mItemsAddedOrRemoved = false;
        this.mItemsChanged = false;
        this.mItemAnimatorListener = new ItemAnimatorRestoreListener();
        this.mPostedAnimatorRunner = false;
        this.mMinMaxLayoutPositions = new int[2];
        this.mScrollOffset = new int[2];
        this.mNestedOffsets = new int[2];
        this.mReusableIntPair = new int[2];
        this.mPendingAccessibilityImportanceChange = new ArrayList();
        this.mItemAnimatorRunner = new Runnable() { // from class: androidx.recyclerview.widget.RecyclerView.2
            @Override // java.lang.Runnable
            public void run() {
                ItemAnimator itemAnimator = RecyclerView.this.mItemAnimator;
                if (itemAnimator != null) {
                    final DefaultItemAnimator defaultItemAnimator = (DefaultItemAnimator) itemAnimator;
                    boolean z = !defaultItemAnimator.mPendingRemovals.isEmpty();
                    boolean z2 = !defaultItemAnimator.mPendingMoves.isEmpty();
                    boolean z3 = !defaultItemAnimator.mPendingChanges.isEmpty();
                    boolean z4 = !defaultItemAnimator.mPendingAdditions.isEmpty();
                    if (z || z2 || z4 || z3) {
                        Iterator<ViewHolder> it = defaultItemAnimator.mPendingRemovals.iterator();
                        while (it.hasNext()) {
                            final ViewHolder next = it.next();
                            final View view = next.itemView;
                            final ViewPropertyAnimator animate = view.animate();
                            defaultItemAnimator.mRemoveAnimations.add(next);
                            animate.setDuration(defaultItemAnimator.mRemoveDuration).alpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES).setListener(new AnimatorListenerAdapter() { // from class: androidx.recyclerview.widget.DefaultItemAnimator.4
                                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                                public void onAnimationEnd(Animator animator) {
                                    animate.setListener(null);
                                    view.setAlpha(1.0f);
                                    DefaultItemAnimator.this.dispatchAnimationFinished(next);
                                    DefaultItemAnimator.this.mRemoveAnimations.remove(next);
                                    DefaultItemAnimator.this.dispatchFinishedWhenDone();
                                }

                                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                                public void onAnimationStart(Animator animator) {
                                    Objects.requireNonNull(DefaultItemAnimator.this);
                                }
                            }).start();
                        }
                        defaultItemAnimator.mPendingRemovals.clear();
                        if (z2) {
                            final ArrayList<DefaultItemAnimator.MoveInfo> arrayList = new ArrayList<>();
                            arrayList.addAll(defaultItemAnimator.mPendingMoves);
                            defaultItemAnimator.mMovesList.add(arrayList);
                            defaultItemAnimator.mPendingMoves.clear();
                            Runnable runnable = new Runnable() { // from class: androidx.recyclerview.widget.DefaultItemAnimator.1
                                @Override // java.lang.Runnable
                                public void run() {
                                    Iterator it2 = arrayList.iterator();
                                    while (it2.hasNext()) {
                                        MoveInfo moveInfo = (MoveInfo) it2.next();
                                        final DefaultItemAnimator defaultItemAnimator2 = DefaultItemAnimator.this;
                                        final RecyclerView.ViewHolder viewHolder = moveInfo.holder;
                                        int i = moveInfo.fromX;
                                        int i2 = moveInfo.fromY;
                                        int i3 = moveInfo.toX;
                                        int i4 = moveInfo.toY;
                                        Objects.requireNonNull(defaultItemAnimator2);
                                        final View view2 = viewHolder.itemView;
                                        final int i5 = i3 - i;
                                        final int i6 = i4 - i2;
                                        if (i5 != 0) {
                                            view2.animate().translationX(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                                        }
                                        if (i6 != 0) {
                                            view2.animate().translationY(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                                        }
                                        final ViewPropertyAnimator animate2 = view2.animate();
                                        defaultItemAnimator2.mMoveAnimations.add(viewHolder);
                                        animate2.setDuration(defaultItemAnimator2.mMoveDuration).setListener(new AnimatorListenerAdapter() { // from class: androidx.recyclerview.widget.DefaultItemAnimator.6
                                            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                                            public void onAnimationCancel(Animator animator) {
                                                if (i5 != 0) {
                                                    view2.setTranslationX(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                                                }
                                                if (i6 != 0) {
                                                    view2.setTranslationY(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                                                }
                                            }

                                            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                                            public void onAnimationEnd(Animator animator) {
                                                animate2.setListener(null);
                                                DefaultItemAnimator.this.dispatchAnimationFinished(viewHolder);
                                                DefaultItemAnimator.this.mMoveAnimations.remove(viewHolder);
                                                DefaultItemAnimator.this.dispatchFinishedWhenDone();
                                            }

                                            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                                            public void onAnimationStart(Animator animator) {
                                                Objects.requireNonNull(DefaultItemAnimator.this);
                                            }
                                        }).start();
                                    }
                                    arrayList.clear();
                                    DefaultItemAnimator.this.mMovesList.remove(arrayList);
                                }
                            };
                            if (z) {
                                View view2 = arrayList.get(0).holder.itemView;
                                long j = defaultItemAnimator.mRemoveDuration;
                                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                                view2.postOnAnimationDelayed(runnable, j);
                            } else {
                                runnable.run();
                            }
                        }
                        if (z3) {
                            final ArrayList<DefaultItemAnimator.ChangeInfo> arrayList2 = new ArrayList<>();
                            arrayList2.addAll(defaultItemAnimator.mPendingChanges);
                            defaultItemAnimator.mChangesList.add(arrayList2);
                            defaultItemAnimator.mPendingChanges.clear();
                            Runnable runnable2 = new Runnable() { // from class: androidx.recyclerview.widget.DefaultItemAnimator.2
                                @Override // java.lang.Runnable
                                public void run() {
                                    Iterator it2 = arrayList2.iterator();
                                    while (it2.hasNext()) {
                                        final ChangeInfo changeInfo = (ChangeInfo) it2.next();
                                        final DefaultItemAnimator defaultItemAnimator2 = DefaultItemAnimator.this;
                                        Objects.requireNonNull(defaultItemAnimator2);
                                        RecyclerView.ViewHolder viewHolder = changeInfo.oldHolder;
                                        final View view3 = null;
                                        final View view4 = viewHolder == null ? null : viewHolder.itemView;
                                        RecyclerView.ViewHolder viewHolder2 = changeInfo.newHolder;
                                        if (viewHolder2 != null) {
                                            view3 = viewHolder2.itemView;
                                        }
                                        if (view4 != null) {
                                            final ViewPropertyAnimator duration = view4.animate().setDuration(defaultItemAnimator2.mChangeDuration);
                                            defaultItemAnimator2.mChangeAnimations.add(changeInfo.oldHolder);
                                            duration.translationX(changeInfo.toX - changeInfo.fromX);
                                            duration.translationY(changeInfo.toY - changeInfo.fromY);
                                            duration.alpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES).setListener(new AnimatorListenerAdapter() { // from class: androidx.recyclerview.widget.DefaultItemAnimator.7
                                                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                                                public void onAnimationEnd(Animator animator) {
                                                    duration.setListener(null);
                                                    view4.setAlpha(1.0f);
                                                    view4.setTranslationX(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                                                    view4.setTranslationY(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                                                    DefaultItemAnimator.this.dispatchAnimationFinished(changeInfo.oldHolder);
                                                    DefaultItemAnimator.this.mChangeAnimations.remove(changeInfo.oldHolder);
                                                    DefaultItemAnimator.this.dispatchFinishedWhenDone();
                                                }

                                                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                                                public void onAnimationStart(Animator animator) {
                                                    DefaultItemAnimator defaultItemAnimator3 = DefaultItemAnimator.this;
                                                    RecyclerView.ViewHolder viewHolder3 = changeInfo.oldHolder;
                                                    Objects.requireNonNull(defaultItemAnimator3);
                                                }
                                            }).start();
                                        }
                                        if (view3 != null) {
                                            final ViewPropertyAnimator animate2 = view3.animate();
                                            defaultItemAnimator2.mChangeAnimations.add(changeInfo.newHolder);
                                            animate2.translationX(HingeAngleProviderKt.FULLY_CLOSED_DEGREES).translationY(HingeAngleProviderKt.FULLY_CLOSED_DEGREES).setDuration(defaultItemAnimator2.mChangeDuration).alpha(1.0f).setListener(new AnimatorListenerAdapter() { // from class: androidx.recyclerview.widget.DefaultItemAnimator.8
                                                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                                                public void onAnimationEnd(Animator animator) {
                                                    animate2.setListener(null);
                                                    view3.setAlpha(1.0f);
                                                    view3.setTranslationX(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                                                    view3.setTranslationY(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                                                    DefaultItemAnimator.this.dispatchAnimationFinished(changeInfo.newHolder);
                                                    DefaultItemAnimator.this.mChangeAnimations.remove(changeInfo.newHolder);
                                                    DefaultItemAnimator.this.dispatchFinishedWhenDone();
                                                }

                                                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                                                public void onAnimationStart(Animator animator) {
                                                    DefaultItemAnimator defaultItemAnimator3 = DefaultItemAnimator.this;
                                                    RecyclerView.ViewHolder viewHolder3 = changeInfo.newHolder;
                                                    Objects.requireNonNull(defaultItemAnimator3);
                                                }
                                            }).start();
                                        }
                                    }
                                    arrayList2.clear();
                                    DefaultItemAnimator.this.mChangesList.remove(arrayList2);
                                }
                            };
                            if (z) {
                                View view3 = arrayList2.get(0).oldHolder.itemView;
                                long j2 = defaultItemAnimator.mRemoveDuration;
                                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap2 = ViewCompat.sViewPropertyAnimatorMap;
                                view3.postOnAnimationDelayed(runnable2, j2);
                            } else {
                                runnable2.run();
                            }
                        }
                        if (z4) {
                            final ArrayList<ViewHolder> arrayList3 = new ArrayList<>();
                            arrayList3.addAll(defaultItemAnimator.mPendingAdditions);
                            defaultItemAnimator.mAdditionsList.add(arrayList3);
                            defaultItemAnimator.mPendingAdditions.clear();
                            Runnable runnable3 = new Runnable() { // from class: androidx.recyclerview.widget.DefaultItemAnimator.3
                                @Override // java.lang.Runnable
                                public void run() {
                                    Iterator it2 = arrayList3.iterator();
                                    while (it2.hasNext()) {
                                        final RecyclerView.ViewHolder viewHolder = (RecyclerView.ViewHolder) it2.next();
                                        final DefaultItemAnimator defaultItemAnimator2 = DefaultItemAnimator.this;
                                        Objects.requireNonNull(defaultItemAnimator2);
                                        final View view4 = viewHolder.itemView;
                                        final ViewPropertyAnimator animate2 = view4.animate();
                                        defaultItemAnimator2.mAddAnimations.add(viewHolder);
                                        animate2.alpha(1.0f).setDuration(defaultItemAnimator2.mAddDuration).setListener(new AnimatorListenerAdapter() { // from class: androidx.recyclerview.widget.DefaultItemAnimator.5
                                            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                                            public void onAnimationCancel(Animator animator) {
                                                view4.setAlpha(1.0f);
                                            }

                                            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                                            public void onAnimationEnd(Animator animator) {
                                                animate2.setListener(null);
                                                DefaultItemAnimator.this.dispatchAnimationFinished(viewHolder);
                                                DefaultItemAnimator.this.mAddAnimations.remove(viewHolder);
                                                DefaultItemAnimator.this.dispatchFinishedWhenDone();
                                            }

                                            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                                            public void onAnimationStart(Animator animator) {
                                                Objects.requireNonNull(DefaultItemAnimator.this);
                                            }
                                        }).start();
                                    }
                                    arrayList3.clear();
                                    DefaultItemAnimator.this.mAdditionsList.remove(arrayList3);
                                }
                            };
                            if (z || z2 || z3) {
                                long j3 = 0;
                                long j4 = z ? defaultItemAnimator.mRemoveDuration : 0L;
                                long j5 = z2 ? defaultItemAnimator.mMoveDuration : 0L;
                                if (z3) {
                                    j3 = defaultItemAnimator.mChangeDuration;
                                }
                                View view4 = arrayList3.get(0).itemView;
                                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap3 = ViewCompat.sViewPropertyAnimatorMap;
                                view4.postOnAnimationDelayed(runnable3, Math.max(j5, j3) + j4);
                            } else {
                                runnable3.run();
                            }
                        }
                    }
                }
                RecyclerView.this.mPostedAnimatorRunner = false;
            }
        };
        this.mLastAutoMeasureNonExactMeasuredWidth = 0;
        this.mLastAutoMeasureNonExactMeasuredHeight = 0;
        this.mViewInfoProcessCallback = new AnonymousClass4();
        setScrollContainer(true);
        setFocusableInTouchMode(true);
        ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
        this.mTouchSlop = viewConfiguration.getScaledTouchSlop();
        this.mScaledHorizontalScrollFactor = viewConfiguration.getScaledHorizontalScrollFactor();
        this.mScaledVerticalScrollFactor = viewConfiguration.getScaledVerticalScrollFactor();
        this.mMinFlingVelocity = viewConfiguration.getScaledMinimumFlingVelocity();
        this.mMaxFlingVelocity = viewConfiguration.getScaledMaximumFlingVelocity();
        setWillNotDraw(getOverScrollMode() == 2);
        this.mItemAnimator.mListener = this.mItemAnimatorListener;
        initAdapterManager();
        initChildrenHelper();
        initAutofill();
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        if (getImportantForAccessibility() == 0) {
            setImportantForAccessibility(1);
        }
        this.mAccessibilityManager = (AccessibilityManager) getContext().getSystemService("accessibility");
        setAccessibilityDelegateCompat(new RecyclerViewAccessibilityDelegate(this));
        int[] iArr = R$styleable.RecyclerView;
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attrs, iArr, defStyleAttr, 0);
        ViewCompat.Api29Impl.saveAttributeDataForStyleable(this, context, iArr, attrs, obtainStyledAttributes, defStyleAttr, 0);
        String string = obtainStyledAttributes.getString(8);
        if (obtainStyledAttributes.getInt(2, -1) == -1) {
            setDescendantFocusability(QuickStepContract.SYSUI_STATE_IME_SHOWING);
        }
        this.mClipToPadding = obtainStyledAttributes.getBoolean(1, true);
        boolean z = obtainStyledAttributes.getBoolean(3, false);
        this.mEnableFastScroller = z;
        if (z) {
            initFastScroller((StateListDrawable) obtainStyledAttributes.getDrawable(6), obtainStyledAttributes.getDrawable(7), (StateListDrawable) obtainStyledAttributes.getDrawable(4), obtainStyledAttributes.getDrawable(5));
        }
        obtainStyledAttributes.recycle();
        createLayoutManager(context, string, attrs, defStyleAttr, 0);
        int[] iArr2 = NESTED_SCROLLING_ATTRS;
        TypedArray obtainStyledAttributes2 = context.obtainStyledAttributes(attrs, iArr2, defStyleAttr, 0);
        ViewCompat.Api29Impl.saveAttributeDataForStyleable(this, context, iArr2, attrs, obtainStyledAttributes2, defStyleAttr, 0);
        boolean z2 = obtainStyledAttributes2.getBoolean(0, true);
        obtainStyledAttributes2.recycle();
        setNestedScrollingEnabled(z2);
    }

    public boolean dispatchNestedPreScroll(int dx, int dy, int[] consumed, int[] offsetInWindow, int type) {
        return getScrollingChildHelper().dispatchNestedPreScroll(dx, dy, consumed, offsetInWindow, type);
    }

    public boolean hasNestedScrollingParent(int type) {
        return getScrollingChildHelper().getNestedScrollingParentForType(type) != null;
    }

    public void smoothScrollBy(int dx, int dy, Interpolator interpolator, int duration) {
        smoothScrollBy(dx, dy, interpolator, duration, false);
    }

    public boolean startNestedScroll(int axes, int type) {
        return getScrollingChildHelper().startNestedScroll(axes, type);
    }

    public void stopNestedScroll(int type) {
        getScrollingChildHelper().stopNestedScroll(type);
    }

    /* loaded from: classes.dex */
    public static class LayoutParams extends ViewGroup.MarginLayoutParams {
        public final Rect mDecorInsets = new Rect();
        public boolean mInsetsDirty = true;
        public boolean mPendingInvalidate = false;
        public ViewHolder mViewHolder;

        public LayoutParams(Context c, AttributeSet attrs) {
            super(c, attrs);
        }

        public int getViewLayoutPosition() {
            return this.mViewHolder.getLayoutPosition();
        }

        public boolean isItemChanged() {
            return this.mViewHolder.isUpdated();
        }

        public boolean isItemRemoved() {
            return this.mViewHolder.isRemoved();
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

        public LayoutParams(LayoutParams source) {
            super((ViewGroup.LayoutParams) source);
        }
    }

    public final void dispatchNestedScroll(int dxConsumed, int dyConsumed, int dxUnconsumed, int dyUnconsumed, int[] offsetInWindow, int type, int[] consumed) {
        getScrollingChildHelper().dispatchNestedScrollInternal(dxConsumed, dyConsumed, dxUnconsumed, dyUnconsumed, offsetInWindow, type, consumed);
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams p) {
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager != null) {
            return layoutManager.generateLayoutParams(p);
        }
        throw new IllegalStateException(ChildHelper$$ExternalSyntheticOutline0.m(this, ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("RecyclerView has no LayoutManager")));
    }

    public void smoothScrollBy(int dx, int dy, Interpolator interpolator, int duration, boolean withNestedScrolling) {
        LayoutManager layoutManager = this.mLayout;
        if (layoutManager == null) {
            Log.e(TAG, "Cannot smooth scroll without a LayoutManager set. Call setLayoutManager with a non-null argument.");
        } else if (!this.mLayoutSuppressed) {
            int i = 0;
            if (!layoutManager.canScrollHorizontally()) {
                dx = 0;
            }
            if (!this.mLayout.canScrollVertically()) {
                dy = 0;
            }
            if (dx != 0 || dy != 0) {
                if (duration == Integer.MIN_VALUE || duration > 0) {
                    if (withNestedScrolling) {
                        if (dx != 0) {
                            i = 1;
                        }
                        if (dy != 0) {
                            i |= 2;
                        }
                        startNestedScroll(i, 1);
                    }
                    this.mViewFlinger.smoothScrollBy(dx, dy, duration, interpolator);
                    return;
                }
                scrollBy(dx, dy);
            }
        }
    }

    /* loaded from: classes.dex */
    public static abstract class LayoutManager {
        public ChildHelper mChildHelper;
        public int mHeight;
        public int mHeightMode;
        public ViewBoundsCheck mHorizontalBoundCheck;
        public int mPrefetchMaxCountObserved;
        public boolean mPrefetchMaxObservedInInitialPrefetch;
        public RecyclerView mRecyclerView;
        public SmoothScroller mSmoothScroller;
        public ViewBoundsCheck mVerticalBoundCheck;
        public int mWidth;
        public int mWidthMode;
        public boolean mRequestedSimpleAnimations = false;
        public boolean mIsAttachedToWindow = false;
        public boolean mMeasurementCacheEnabled = true;
        public boolean mItemPrefetchEnabled = true;

        /* loaded from: classes.dex */
        public interface LayoutPrefetchRegistry {
        }

        /* loaded from: classes.dex */
        public static class Properties {
            public int orientation;
            public boolean reverseLayout;
            public int spanCount;
            public boolean stackFromEnd;
        }

        public LayoutManager() {
            ViewBoundsCheck.Callback callback = new ViewBoundsCheck.Callback() { // from class: androidx.recyclerview.widget.RecyclerView.LayoutManager.1
                @Override // androidx.recyclerview.widget.ViewBoundsCheck.Callback
                public View getChildAt(int index) {
                    return LayoutManager.this.getChildAt(index);
                }

                @Override // androidx.recyclerview.widget.ViewBoundsCheck.Callback
                public int getChildEnd(View view) {
                    return LayoutManager.this.getDecoratedRight(view) + ((ViewGroup.MarginLayoutParams) ((LayoutParams) view.getLayoutParams())).rightMargin;
                }

                @Override // androidx.recyclerview.widget.ViewBoundsCheck.Callback
                public int getChildStart(View view) {
                    return LayoutManager.this.getDecoratedLeft(view) - ((ViewGroup.MarginLayoutParams) ((LayoutParams) view.getLayoutParams())).leftMargin;
                }

                @Override // androidx.recyclerview.widget.ViewBoundsCheck.Callback
                public int getParentEnd() {
                    LayoutManager layoutManager = LayoutManager.this;
                    return layoutManager.mWidth - layoutManager.getPaddingRight();
                }

                @Override // androidx.recyclerview.widget.ViewBoundsCheck.Callback
                public int getParentStart() {
                    return LayoutManager.this.getPaddingLeft();
                }
            };
            ViewBoundsCheck.Callback callback2 = new ViewBoundsCheck.Callback() { // from class: androidx.recyclerview.widget.RecyclerView.LayoutManager.2
                @Override // androidx.recyclerview.widget.ViewBoundsCheck.Callback
                public View getChildAt(int index) {
                    return LayoutManager.this.getChildAt(index);
                }

                @Override // androidx.recyclerview.widget.ViewBoundsCheck.Callback
                public int getChildEnd(View view) {
                    return LayoutManager.this.getDecoratedBottom(view) + ((ViewGroup.MarginLayoutParams) ((LayoutParams) view.getLayoutParams())).bottomMargin;
                }

                @Override // androidx.recyclerview.widget.ViewBoundsCheck.Callback
                public int getChildStart(View view) {
                    return LayoutManager.this.getDecoratedTop(view) - ((ViewGroup.MarginLayoutParams) ((LayoutParams) view.getLayoutParams())).topMargin;
                }

                @Override // androidx.recyclerview.widget.ViewBoundsCheck.Callback
                public int getParentEnd() {
                    LayoutManager layoutManager = LayoutManager.this;
                    return layoutManager.mHeight - layoutManager.getPaddingBottom();
                }

                @Override // androidx.recyclerview.widget.ViewBoundsCheck.Callback
                public int getParentStart() {
                    return LayoutManager.this.getPaddingTop();
                }
            };
            this.mHorizontalBoundCheck = new ViewBoundsCheck(callback);
            this.mVerticalBoundCheck = new ViewBoundsCheck(callback2);
        }

        public static int chooseSize(int spec, int desired, int min) {
            int mode = View.MeasureSpec.getMode(spec);
            int size = View.MeasureSpec.getSize(spec);
            if (mode != Integer.MIN_VALUE) {
                return mode != 1073741824 ? Math.max(desired, min) : size;
            }
            return Math.min(size, Math.max(desired, min));
        }

        /* JADX WARN: Code restructure failed: missing block: B:8:0x0017, code lost:
            if (r5 == 1073741824) goto L12;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public static int getChildMeasureSpec(int r4, int r5, int r6, int r7, boolean r8) {
            /*
                int r4 = r4 - r6
                r6 = 0
                int r4 = java.lang.Math.max(r6, r4)
                r0 = -2
                r1 = -1
                r2 = -2147483648(0xffffffff80000000, float:-0.0)
                r3 = 1073741824(0x40000000, float:2.0)
                if (r8 == 0) goto L1a
                if (r7 < 0) goto L11
                goto L1c
            L11:
                if (r7 != r1) goto L2f
                if (r5 == r2) goto L20
                if (r5 == 0) goto L2f
                if (r5 == r3) goto L20
                goto L2f
            L1a:
                if (r7 < 0) goto L1e
            L1c:
                r5 = r3
                goto L31
            L1e:
                if (r7 != r1) goto L22
            L20:
                r7 = r4
                goto L31
            L22:
                if (r7 != r0) goto L2f
                if (r5 == r2) goto L2c
                if (r5 != r3) goto L29
                goto L2c
            L29:
                r7 = r4
                r5 = r6
                goto L31
            L2c:
                r7 = r4
                r5 = r2
                goto L31
            L2f:
                r5 = r6
                r7 = r5
            L31:
                int r4 = android.view.View.MeasureSpec.makeMeasureSpec(r7, r5)
                return r4
            */
            throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.RecyclerView.LayoutManager.getChildMeasureSpec(int, int, int, int, boolean):int");
        }

        public static Properties getProperties(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
            Properties properties = new Properties();
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attrs, R$styleable.RecyclerView, defStyleAttr, defStyleRes);
            properties.orientation = obtainStyledAttributes.getInt(0, 1);
            properties.spanCount = obtainStyledAttributes.getInt(10, 1);
            properties.reverseLayout = obtainStyledAttributes.getBoolean(9, false);
            properties.stackFromEnd = obtainStyledAttributes.getBoolean(11, false);
            obtainStyledAttributes.recycle();
            return properties;
        }

        public static boolean isMeasurementUpToDate(int childSize, int spec, int dimension) {
            int mode = View.MeasureSpec.getMode(spec);
            int size = View.MeasureSpec.getSize(spec);
            if (dimension > 0 && childSize != dimension) {
                return false;
            }
            if (mode == Integer.MIN_VALUE) {
                return size >= childSize;
            }
            if (mode != 0) {
                return mode == 1073741824 && size == childSize;
            }
            return true;
        }

        public void addView(View child) {
            addViewInt(child, -1, false);
        }

        public final void addViewInt(View child, int index, boolean disappearing) {
            ViewHolder childViewHolderInt = RecyclerView.getChildViewHolderInt(child);
            if (disappearing || childViewHolderInt.isRemoved()) {
                this.mRecyclerView.mViewInfoStore.addToDisappearedInLayout(childViewHolderInt);
            } else {
                this.mRecyclerView.mViewInfoStore.removeFromDisappearedInLayout(childViewHolderInt);
            }
            LayoutParams layoutParams = (LayoutParams) child.getLayoutParams();
            if (childViewHolderInt.wasReturnedFromScrap() || childViewHolderInt.isScrap()) {
                if (childViewHolderInt.isScrap()) {
                    childViewHolderInt.mScrapContainer.unscrapView(childViewHolderInt);
                } else {
                    childViewHolderInt.clearReturnedFromScrapFlag();
                }
                this.mChildHelper.attachViewToParent(child, index, child.getLayoutParams(), false);
            } else if (child.getParent() == this.mRecyclerView) {
                int indexOfChild = this.mChildHelper.indexOfChild(child);
                if (index == -1) {
                    index = this.mChildHelper.getChildCount();
                }
                if (indexOfChild == -1) {
                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Added View has RecyclerView as parent but view is not a real child. Unfiltered index:");
                    m.append(this.mRecyclerView.indexOfChild(child));
                    throw new IllegalStateException(ChildHelper$$ExternalSyntheticOutline0.m(this.mRecyclerView, m));
                } else if (indexOfChild != index) {
                    LayoutManager layoutManager = this.mRecyclerView.mLayout;
                    View childAt = layoutManager.getChildAt(indexOfChild);
                    if (childAt != null) {
                        layoutManager.getChildAt(indexOfChild);
                        layoutManager.mChildHelper.detachViewFromParent(indexOfChild);
                        LayoutParams layoutParams2 = (LayoutParams) childAt.getLayoutParams();
                        ViewHolder childViewHolderInt2 = RecyclerView.getChildViewHolderInt(childAt);
                        if (childViewHolderInt2.isRemoved()) {
                            layoutManager.mRecyclerView.mViewInfoStore.addToDisappearedInLayout(childViewHolderInt2);
                        } else {
                            layoutManager.mRecyclerView.mViewInfoStore.removeFromDisappearedInLayout(childViewHolderInt2);
                        }
                        layoutManager.mChildHelper.attachViewToParent(childAt, index, layoutParams2, childViewHolderInt2.isRemoved());
                    } else {
                        throw new IllegalArgumentException("Cannot move a child from non-existing index:" + indexOfChild + layoutManager.mRecyclerView.toString());
                    }
                }
            } else {
                this.mChildHelper.addView(child, index, false);
                layoutParams.mInsetsDirty = true;
                SmoothScroller smoothScroller = this.mSmoothScroller;
                if (smoothScroller != null && smoothScroller.mRunning && smoothScroller.mRecyclerView.getChildLayoutPosition(child) == smoothScroller.mTargetPosition) {
                    smoothScroller.mTargetView = child;
                }
            }
            if (layoutParams.mPendingInvalidate) {
                childViewHolderInt.itemView.invalidate();
                layoutParams.mPendingInvalidate = false;
            }
        }

        public void assertNotInLayoutOrScroll(String message) {
            RecyclerView recyclerView = this.mRecyclerView;
            if (recyclerView != null) {
                recyclerView.assertNotInLayoutOrScroll(message);
            }
        }

        public boolean canScrollHorizontally() {
            return false;
        }

        public boolean canScrollVertically() {
            return false;
        }

        public boolean checkLayoutParams(LayoutParams lp) {
            return lp != null;
        }

        public void collectAdjacentPrefetchPositions(int dx, int dy, State state, LayoutPrefetchRegistry layoutPrefetchRegistry) {
        }

        public void collectInitialPrefetchPositions(int adapterItemCount, LayoutPrefetchRegistry layoutPrefetchRegistry) {
        }

        public int computeHorizontalScrollExtent(State state) {
            return 0;
        }

        public int computeHorizontalScrollOffset(State state) {
            return 0;
        }

        public int computeHorizontalScrollRange(State state) {
            return 0;
        }

        public int computeVerticalScrollExtent(State state) {
            return 0;
        }

        public int computeVerticalScrollOffset(State state) {
            return 0;
        }

        public int computeVerticalScrollRange(State state) {
            return 0;
        }

        public void detachAndScrapAttachedViews(Recycler recycler) {
            int childCount = getChildCount();
            while (true) {
                childCount--;
                if (childCount >= 0) {
                    View childAt = getChildAt(childCount);
                    ViewHolder childViewHolderInt = RecyclerView.getChildViewHolderInt(childAt);
                    if (!childViewHolderInt.shouldIgnore()) {
                        if (!childViewHolderInt.isInvalid() || childViewHolderInt.isRemoved() || this.mRecyclerView.mAdapter.mHasStableIds) {
                            getChildAt(childCount);
                            this.mChildHelper.detachViewFromParent(childCount);
                            recycler.scrapView(childAt);
                            this.mRecyclerView.mViewInfoStore.removeFromDisappearedInLayout(childViewHolderInt);
                        } else {
                            removeViewAt(childCount);
                            recycler.recycleViewHolderInternal(childViewHolderInt);
                        }
                    }
                } else {
                    return;
                }
            }
        }

        public View findContainingItemView(View view) {
            View findContainingItemView;
            RecyclerView recyclerView = this.mRecyclerView;
            if (recyclerView == null || (findContainingItemView = recyclerView.findContainingItemView(view)) == null || this.mChildHelper.mHiddenViews.contains(findContainingItemView)) {
                return null;
            }
            return findContainingItemView;
        }

        public View findViewByPosition(int position) {
            int childCount = getChildCount();
            for (int i = 0; i < childCount; i++) {
                View childAt = getChildAt(i);
                ViewHolder childViewHolderInt = RecyclerView.getChildViewHolderInt(childAt);
                if (childViewHolderInt != null && childViewHolderInt.getLayoutPosition() == position && !childViewHolderInt.shouldIgnore() && (this.mRecyclerView.mState.mInPreLayout || !childViewHolderInt.isRemoved())) {
                    return childAt;
                }
            }
            return null;
        }

        public abstract LayoutParams generateDefaultLayoutParams();

        public LayoutParams generateLayoutParams(ViewGroup.LayoutParams lp) {
            if (lp instanceof LayoutParams) {
                return new LayoutParams((LayoutParams) lp);
            }
            if (lp instanceof ViewGroup.MarginLayoutParams) {
                return new LayoutParams((ViewGroup.MarginLayoutParams) lp);
            }
            return new LayoutParams(lp);
        }

        public View getChildAt(int index) {
            ChildHelper childHelper = this.mChildHelper;
            if (childHelper == null) {
                return null;
            }
            return ((AnonymousClass5) childHelper.mCallback).getChildAt(childHelper.getOffset(index));
        }

        public int getChildCount() {
            ChildHelper childHelper = this.mChildHelper;
            if (childHelper != null) {
                return childHelper.getChildCount();
            }
            return 0;
        }

        public int getColumnCountForAccessibility(Recycler recycler, State state) {
            return -1;
        }

        public int getDecoratedBottom(View child) {
            return child.getBottom() + ((LayoutParams) child.getLayoutParams()).mDecorInsets.bottom;
        }

        public int getDecoratedLeft(View child) {
            return child.getLeft() - ((LayoutParams) child.getLayoutParams()).mDecorInsets.left;
        }

        public int getDecoratedMeasuredHeight(View child) {
            Rect rect = ((LayoutParams) child.getLayoutParams()).mDecorInsets;
            return child.getMeasuredHeight() + rect.top + rect.bottom;
        }

        public int getDecoratedMeasuredWidth(View child) {
            Rect rect = ((LayoutParams) child.getLayoutParams()).mDecorInsets;
            return child.getMeasuredWidth() + rect.left + rect.right;
        }

        public int getDecoratedRight(View child) {
            return child.getRight() + ((LayoutParams) child.getLayoutParams()).mDecorInsets.right;
        }

        public int getDecoratedTop(View child) {
            return child.getTop() - ((LayoutParams) child.getLayoutParams()).mDecorInsets.top;
        }

        public View getFocusedChild() {
            View focusedChild;
            RecyclerView recyclerView = this.mRecyclerView;
            if (recyclerView == null || (focusedChild = recyclerView.getFocusedChild()) == null || this.mChildHelper.mHiddenViews.contains(focusedChild)) {
                return null;
            }
            return focusedChild;
        }

        public int getItemCount() {
            RecyclerView recyclerView = this.mRecyclerView;
            Adapter adapter = recyclerView != null ? recyclerView.getAdapter() : null;
            if (adapter != null) {
                return adapter.getItemCount();
            }
            return 0;
        }

        public int getLayoutDirection() {
            RecyclerView recyclerView = this.mRecyclerView;
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            return recyclerView.getLayoutDirection();
        }

        public int getMinimumHeight() {
            RecyclerView recyclerView = this.mRecyclerView;
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            return recyclerView.getMinimumHeight();
        }

        public int getMinimumWidth() {
            RecyclerView recyclerView = this.mRecyclerView;
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            return recyclerView.getMinimumWidth();
        }

        public int getPaddingBottom() {
            RecyclerView recyclerView = this.mRecyclerView;
            if (recyclerView != null) {
                return recyclerView.getPaddingBottom();
            }
            return 0;
        }

        public int getPaddingLeft() {
            RecyclerView recyclerView = this.mRecyclerView;
            if (recyclerView != null) {
                return recyclerView.getPaddingLeft();
            }
            return 0;
        }

        public int getPaddingRight() {
            RecyclerView recyclerView = this.mRecyclerView;
            if (recyclerView != null) {
                return recyclerView.getPaddingRight();
            }
            return 0;
        }

        public int getPaddingTop() {
            RecyclerView recyclerView = this.mRecyclerView;
            if (recyclerView != null) {
                return recyclerView.getPaddingTop();
            }
            return 0;
        }

        public int getPosition(View view) {
            return ((LayoutParams) view.getLayoutParams()).getViewLayoutPosition();
        }

        public int getRowCountForAccessibility(Recycler recycler, State state) {
            return -1;
        }

        public void getTransformedBoundingBox(View child, boolean includeDecorInsets, Rect out) {
            Matrix matrix;
            if (includeDecorInsets) {
                Rect rect = ((LayoutParams) child.getLayoutParams()).mDecorInsets;
                out.set(-rect.left, -rect.top, child.getWidth() + rect.right, child.getHeight() + rect.bottom);
            } else {
                out.set(0, 0, child.getWidth(), child.getHeight());
            }
            if (!(this.mRecyclerView == null || (matrix = child.getMatrix()) == null || matrix.isIdentity())) {
                RectF rectF = this.mRecyclerView.mTempRectF;
                rectF.set(out);
                matrix.mapRect(rectF);
                out.set((int) Math.floor(rectF.left), (int) Math.floor(rectF.top), (int) Math.ceil(rectF.right), (int) Math.ceil(rectF.bottom));
            }
            out.offset(child.getLeft(), child.getTop());
        }

        public boolean isAutoMeasureEnabled() {
            return false;
        }

        public void layoutDecoratedWithMargins(View child, int left, int top, int right, int bottom) {
            LayoutParams layoutParams = (LayoutParams) child.getLayoutParams();
            Rect rect = layoutParams.mDecorInsets;
            child.layout(left + rect.left + ((ViewGroup.MarginLayoutParams) layoutParams).leftMargin, top + rect.top + ((ViewGroup.MarginLayoutParams) layoutParams).topMargin, (right - rect.right) - ((ViewGroup.MarginLayoutParams) layoutParams).rightMargin, (bottom - rect.bottom) - ((ViewGroup.MarginLayoutParams) layoutParams).bottomMargin);
        }

        public void offsetChildrenHorizontal(int dx) {
            RecyclerView recyclerView = this.mRecyclerView;
            if (recyclerView != null) {
                recyclerView.offsetChildrenHorizontal(dx);
            }
        }

        public void offsetChildrenVertical(int dy) {
            RecyclerView recyclerView = this.mRecyclerView;
            if (recyclerView != null) {
                recyclerView.offsetChildrenVertical(dy);
            }
        }

        public void onAdapterChanged(Adapter oldAdapter, Adapter newAdapter) {
        }

        public void onDetachedFromWindow(RecyclerView view, Recycler recycler) {
        }

        public View onFocusSearchFailed(View focused, int direction, Recycler recycler, State state) {
            return null;
        }

        public void onInitializeAccessibilityEvent(AccessibilityEvent event) {
            RecyclerView recyclerView = this.mRecyclerView;
            Recycler recycler = recyclerView.mRecycler;
            State state = recyclerView.mState;
            if (recyclerView != null && event != null) {
                boolean z = true;
                if (!recyclerView.canScrollVertically(1) && !this.mRecyclerView.canScrollVertically(-1) && !this.mRecyclerView.canScrollHorizontally(-1) && !this.mRecyclerView.canScrollHorizontally(1)) {
                    z = false;
                }
                event.setScrollable(z);
                Adapter adapter = this.mRecyclerView.mAdapter;
                if (adapter != null) {
                    event.setItemCount(adapter.getItemCount());
                }
            }
        }

        public void onInitializeAccessibilityNodeInfo(Recycler recycler, State state, AccessibilityNodeInfoCompat info) {
            if (this.mRecyclerView.canScrollVertically(-1) || this.mRecyclerView.canScrollHorizontally(-1)) {
                info.mInfo.addAction(QuickStepContract.SYSUI_STATE_ASSIST_GESTURE_CONSTRAINED);
                info.mInfo.setScrollable(true);
            }
            if (this.mRecyclerView.canScrollVertically(1) || this.mRecyclerView.canScrollHorizontally(1)) {
                info.mInfo.addAction(QuickStepContract.SYSUI_STATE_TRACING_ENABLED);
                info.mInfo.setScrollable(true);
            }
            info.setCollectionInfo(AccessibilityNodeInfoCompat.CollectionInfoCompat.obtain(getRowCountForAccessibility(recycler, state), getColumnCountForAccessibility(recycler, state), false, 0));
        }

        public void onInitializeAccessibilityNodeInfoForItem(View host, AccessibilityNodeInfoCompat info) {
            ViewHolder childViewHolderInt = RecyclerView.getChildViewHolderInt(host);
            if (childViewHolderInt != null && !childViewHolderInt.isRemoved() && !this.mChildHelper.isHidden(childViewHolderInt.itemView)) {
                RecyclerView recyclerView = this.mRecyclerView;
                onInitializeAccessibilityNodeInfoForItem(recyclerView.mRecycler, recyclerView.mState, host, info);
            }
        }

        public void onInitializeAccessibilityNodeInfoForItem(Recycler recycler, State state, View host, AccessibilityNodeInfoCompat info) {
        }

        public void onItemsAdded(RecyclerView recyclerView, int positionStart, int itemCount) {
        }

        public void onItemsChanged(RecyclerView recyclerView) {
        }

        public void onItemsMoved(RecyclerView recyclerView, int from, int to, int itemCount) {
        }

        public void onItemsRemoved(RecyclerView recyclerView, int positionStart, int itemCount) {
        }

        public void onItemsUpdated(RecyclerView recyclerView, int positionStart, int itemCount, Object payload) {
        }

        public void onLayoutChildren(Recycler recycler, State state) {
            Log.e(RecyclerView.TAG, "You must override onLayoutChildren(Recycler recycler, State state) ");
        }

        public void onLayoutCompleted(State state) {
        }

        public void onRestoreInstanceState(Parcelable state) {
        }

        public Parcelable onSaveInstanceState() {
            return null;
        }

        public void onScrollStateChanged(int state) {
        }

        public boolean performAccessibilityAction(Recycler recycler, State state, int action, Bundle args) {
            int i;
            int i2;
            int i3;
            int i4;
            RecyclerView recyclerView = this.mRecyclerView;
            if (recyclerView == null) {
                return false;
            }
            if (action == 4096) {
                i3 = recyclerView.canScrollVertically(1) ? (this.mHeight - getPaddingTop()) - getPaddingBottom() : 0;
                if (this.mRecyclerView.canScrollHorizontally(1)) {
                    i4 = (this.mWidth - getPaddingLeft()) - getPaddingRight();
                    i = i3;
                    i2 = i4;
                }
                i = i3;
                i2 = 0;
            } else if (action != 8192) {
                i2 = 0;
                i = 0;
            } else {
                i3 = recyclerView.canScrollVertically(-1) ? -((this.mHeight - getPaddingTop()) - getPaddingBottom()) : 0;
                if (this.mRecyclerView.canScrollHorizontally(-1)) {
                    i4 = -((this.mWidth - getPaddingLeft()) - getPaddingRight());
                    i = i3;
                    i2 = i4;
                }
                i = i3;
                i2 = 0;
            }
            if (i == 0 && i2 == 0) {
                return false;
            }
            this.mRecyclerView.smoothScrollBy(i2, i, null, RecyclerView.UNDEFINED_DURATION, true);
            return true;
        }

        public void removeAndRecycleAllViews(Recycler recycler) {
            for (int childCount = getChildCount() - 1; childCount >= 0; childCount--) {
                if (!RecyclerView.getChildViewHolderInt(getChildAt(childCount)).shouldIgnore()) {
                    removeAndRecycleViewAt(childCount, recycler);
                }
            }
        }

        public void removeAndRecycleScrapInt(Recycler recycler) {
            int size = recycler.mAttachedScrap.size();
            for (int i = size - 1; i >= 0; i--) {
                View view = recycler.mAttachedScrap.get(i).itemView;
                ViewHolder childViewHolderInt = RecyclerView.getChildViewHolderInt(view);
                if (!childViewHolderInt.shouldIgnore()) {
                    childViewHolderInt.setIsRecyclable(false);
                    if (childViewHolderInt.isTmpDetached()) {
                        this.mRecyclerView.removeDetachedView(view, false);
                    }
                    ItemAnimator itemAnimator = this.mRecyclerView.mItemAnimator;
                    if (itemAnimator != null) {
                        itemAnimator.endAnimation(childViewHolderInt);
                    }
                    childViewHolderInt.setIsRecyclable(true);
                    ViewHolder childViewHolderInt2 = RecyclerView.getChildViewHolderInt(view);
                    childViewHolderInt2.mScrapContainer = null;
                    childViewHolderInt2.mInChangeScrap = false;
                    childViewHolderInt2.clearReturnedFromScrapFlag();
                    recycler.recycleViewHolderInternal(childViewHolderInt2);
                }
            }
            recycler.mAttachedScrap.clear();
            ArrayList<ViewHolder> arrayList = recycler.mChangedScrap;
            if (arrayList != null) {
                arrayList.clear();
            }
            if (size > 0) {
                this.mRecyclerView.invalidate();
            }
        }

        public void removeAndRecycleView(View child, Recycler recycler) {
            ChildHelper childHelper = this.mChildHelper;
            int indexOfChild = RecyclerView.this.indexOfChild(child);
            if (indexOfChild >= 0) {
                if (childHelper.mBucket.remove(indexOfChild)) {
                    childHelper.unhideViewInternal(child);
                }
                ((AnonymousClass5) childHelper.mCallback).removeViewAt(indexOfChild);
            }
            recycler.recycleView(child);
        }

        public void removeAndRecycleViewAt(int index, Recycler recycler) {
            View childAt = getChildAt(index);
            removeViewAt(index);
            recycler.recycleView(childAt);
        }

        public void removeViewAt(int index) {
            ChildHelper childHelper;
            int offset;
            View childAt;
            if (getChildAt(index) != null && (childAt = ((AnonymousClass5) childHelper.mCallback).getChildAt((offset = (childHelper = this.mChildHelper).getOffset(index)))) != null) {
                if (childHelper.mBucket.remove(offset)) {
                    childHelper.unhideViewInternal(childAt);
                }
                ((AnonymousClass5) childHelper.mCallback).removeViewAt(offset);
            }
        }

        /* JADX WARN: Code restructure failed: missing block: B:25:0x00b3, code lost:
            if (r9 == false) goto L28;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public boolean requestChildRectangleOnScreen(androidx.recyclerview.widget.RecyclerView r10, android.view.View r11, android.graphics.Rect r12, boolean r13, boolean r14) {
            /*
                r9 = this;
                r0 = 2
                int[] r0 = new int[r0]
                int r1 = r9.getPaddingLeft()
                int r2 = r9.getPaddingTop()
                int r3 = r9.mWidth
                int r4 = r9.getPaddingRight()
                int r3 = r3 - r4
                int r4 = r9.mHeight
                int r5 = r9.getPaddingBottom()
                int r4 = r4 - r5
                int r5 = r11.getLeft()
                int r6 = r12.left
                int r5 = r5 + r6
                int r6 = r11.getScrollX()
                int r5 = r5 - r6
                int r6 = r11.getTop()
                int r7 = r12.top
                int r6 = r6 + r7
                int r11 = r11.getScrollY()
                int r6 = r6 - r11
                int r11 = r12.width()
                int r11 = r11 + r5
                int r12 = r12.height()
                int r12 = r12 + r6
                int r5 = r5 - r1
                r1 = 0
                int r7 = java.lang.Math.min(r1, r5)
                int r6 = r6 - r2
                int r2 = java.lang.Math.min(r1, r6)
                int r11 = r11 - r3
                int r3 = java.lang.Math.max(r1, r11)
                int r12 = r12 - r4
                int r12 = java.lang.Math.max(r1, r12)
                int r4 = r9.getLayoutDirection()
                r8 = 1
                if (r4 != r8) goto L5f
                if (r3 == 0) goto L5a
                goto L67
            L5a:
                int r3 = java.lang.Math.max(r7, r11)
                goto L67
            L5f:
                if (r7 == 0) goto L62
                goto L66
            L62:
                int r7 = java.lang.Math.min(r5, r3)
            L66:
                r3 = r7
            L67:
                if (r2 == 0) goto L6a
                goto L6e
            L6a:
                int r2 = java.lang.Math.min(r6, r12)
            L6e:
                r0[r1] = r3
                r0[r8] = r2
                r11 = r0[r1]
                r12 = r0[r8]
                if (r14 == 0) goto Lb5
                android.view.View r14 = r10.getFocusedChild()
                if (r14 != 0) goto L80
            L7e:
                r9 = r1
                goto Lb3
            L80:
                int r0 = r9.getPaddingLeft()
                int r2 = r9.getPaddingTop()
                int r3 = r9.mWidth
                int r4 = r9.getPaddingRight()
                int r3 = r3 - r4
                int r4 = r9.mHeight
                int r5 = r9.getPaddingBottom()
                int r4 = r4 - r5
                androidx.recyclerview.widget.RecyclerView r9 = r9.mRecyclerView
                android.graphics.Rect r9 = r9.mTempRect
                androidx.recyclerview.widget.RecyclerView.getDecoratedBoundsWithMarginsInt(r14, r9)
                int r14 = r9.left
                int r14 = r14 - r11
                if (r14 >= r3) goto L7e
                int r14 = r9.right
                int r14 = r14 - r11
                if (r14 <= r0) goto L7e
                int r14 = r9.top
                int r14 = r14 - r12
                if (r14 >= r4) goto L7e
                int r9 = r9.bottom
                int r9 = r9 - r12
                if (r9 > r2) goto Lb2
                goto L7e
            Lb2:
                r9 = r8
            Lb3:
                if (r9 == 0) goto Lba
            Lb5:
                if (r11 != 0) goto Lbb
                if (r12 == 0) goto Lba
                goto Lbb
            Lba:
                return r1
            Lbb:
                if (r13 == 0) goto Lc1
                r10.scrollBy(r11, r12)
                goto Lc4
            Lc1:
                r10.smoothScrollBy(r11, r12)
            Lc4:
                return r8
            */
            throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.RecyclerView.LayoutManager.requestChildRectangleOnScreen(androidx.recyclerview.widget.RecyclerView, android.view.View, android.graphics.Rect, boolean, boolean):boolean");
        }

        public void requestLayout() {
            RecyclerView recyclerView = this.mRecyclerView;
            if (recyclerView != null) {
                recyclerView.requestLayout();
            }
        }

        public int scrollHorizontallyBy(int dx, Recycler recycler, State state) {
            return 0;
        }

        public void scrollToPosition(int position) {
        }

        public int scrollVerticallyBy(int dy, Recycler recycler, State state) {
            return 0;
        }

        public void setExactMeasureSpecsFrom(RecyclerView recyclerView) {
            setMeasureSpecs(View.MeasureSpec.makeMeasureSpec(recyclerView.getWidth(), IntMath.MAX_SIGNED_POWER_OF_TWO), View.MeasureSpec.makeMeasureSpec(recyclerView.getHeight(), IntMath.MAX_SIGNED_POWER_OF_TWO));
        }

        public void setMeasureSpecs(int wSpec, int hSpec) {
            this.mWidth = View.MeasureSpec.getSize(wSpec);
            int mode = View.MeasureSpec.getMode(wSpec);
            this.mWidthMode = mode;
            if (mode == 0 && !RecyclerView.ALLOW_SIZE_IN_UNSPECIFIED_SPEC) {
                this.mWidth = 0;
            }
            this.mHeight = View.MeasureSpec.getSize(hSpec);
            int mode2 = View.MeasureSpec.getMode(hSpec);
            this.mHeightMode = mode2;
            if (mode2 == 0 && !RecyclerView.ALLOW_SIZE_IN_UNSPECIFIED_SPEC) {
                this.mHeight = 0;
            }
        }

        public void setMeasuredDimension(Rect childrenBounds, int wSpec, int hSpec) {
            int paddingRight = getPaddingRight() + getPaddingLeft() + childrenBounds.width();
            int paddingBottom = getPaddingBottom() + getPaddingTop() + childrenBounds.height();
            this.mRecyclerView.setMeasuredDimension(chooseSize(wSpec, paddingRight, getMinimumWidth()), chooseSize(hSpec, paddingBottom, getMinimumHeight()));
        }

        public void setMeasuredDimensionFromChildren(int widthSpec, int heightSpec) {
            int childCount = getChildCount();
            if (childCount == 0) {
                this.mRecyclerView.defaultOnMeasure(widthSpec, heightSpec);
                return;
            }
            int i = RecyclerView.UNDEFINED_DURATION;
            int i2 = Integer.MAX_VALUE;
            int i3 = Integer.MAX_VALUE;
            int i4 = Integer.MIN_VALUE;
            for (int i5 = 0; i5 < childCount; i5++) {
                View childAt = getChildAt(i5);
                Rect rect = this.mRecyclerView.mTempRect;
                RecyclerView.getDecoratedBoundsWithMarginsInt(childAt, rect);
                int i6 = rect.left;
                if (i6 < i2) {
                    i2 = i6;
                }
                int i7 = rect.right;
                if (i7 > i) {
                    i = i7;
                }
                int i8 = rect.top;
                if (i8 < i3) {
                    i3 = i8;
                }
                int i9 = rect.bottom;
                if (i9 > i4) {
                    i4 = i9;
                }
            }
            this.mRecyclerView.mTempRect.set(i2, i3, i, i4);
            setMeasuredDimension(this.mRecyclerView.mTempRect, widthSpec, heightSpec);
        }

        public void setRecyclerView(RecyclerView recyclerView) {
            if (recyclerView == null) {
                this.mRecyclerView = null;
                this.mChildHelper = null;
                this.mWidth = 0;
                this.mHeight = 0;
            } else {
                this.mRecyclerView = recyclerView;
                this.mChildHelper = recyclerView.mChildHelper;
                this.mWidth = recyclerView.getWidth();
                this.mHeight = recyclerView.getHeight();
            }
            this.mWidthMode = IntMath.MAX_SIGNED_POWER_OF_TWO;
            this.mHeightMode = IntMath.MAX_SIGNED_POWER_OF_TWO;
        }

        public boolean shouldMeasureChild(View child, int widthSpec, int heightSpec, LayoutParams lp) {
            return child.isLayoutRequested() || !this.mMeasurementCacheEnabled || !isMeasurementUpToDate(child.getWidth(), widthSpec, ((ViewGroup.MarginLayoutParams) lp).width) || !isMeasurementUpToDate(child.getHeight(), heightSpec, ((ViewGroup.MarginLayoutParams) lp).height);
        }

        public boolean shouldMeasureTwice() {
            return false;
        }

        public boolean shouldReMeasureChild(View child, int widthSpec, int heightSpec, LayoutParams lp) {
            return !this.mMeasurementCacheEnabled || !isMeasurementUpToDate(child.getMeasuredWidth(), widthSpec, ((ViewGroup.MarginLayoutParams) lp).width) || !isMeasurementUpToDate(child.getMeasuredHeight(), heightSpec, ((ViewGroup.MarginLayoutParams) lp).height);
        }

        public void smoothScrollToPosition(RecyclerView recyclerView, State state, int position) {
            Log.e(RecyclerView.TAG, "You must override smoothScrollToPosition to support smooth scrolling");
        }

        public void startSmoothScroll(SmoothScroller smoothScroller) {
            SmoothScroller smoothScroller2 = this.mSmoothScroller;
            if (!(smoothScroller2 == null || smoothScroller == smoothScroller2 || !smoothScroller2.mRunning)) {
                smoothScroller2.stop();
            }
            this.mSmoothScroller = smoothScroller;
            RecyclerView recyclerView = this.mRecyclerView;
            recyclerView.mViewFlinger.stop();
            if (smoothScroller.mStarted) {
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("An instance of ");
                m.append(smoothScroller.getClass().getSimpleName());
                m.append(" was started more than once. Each instance of");
                m.append(smoothScroller.getClass().getSimpleName());
                m.append(" is intended to only be used once. You should create a new instance for each use.");
                Log.w(RecyclerView.TAG, m.toString());
            }
            smoothScroller.mRecyclerView = recyclerView;
            smoothScroller.mLayoutManager = this;
            int i = smoothScroller.mTargetPosition;
            if (i != -1) {
                recyclerView.mState.mTargetPosition = i;
                smoothScroller.mRunning = true;
                smoothScroller.mPendingInitialRun = true;
                smoothScroller.mTargetView = recyclerView.mLayout.findViewByPosition(i);
                smoothScroller.mRecyclerView.mViewFlinger.postOnAnimation();
                smoothScroller.mStarted = true;
                return;
            }
            throw new IllegalArgumentException("Invalid target position");
        }

        public boolean supportsPredictiveItemAnimations() {
            return false;
        }

        public LayoutParams generateLayoutParams(Context c, AttributeSet attrs) {
            return new LayoutParams(c, attrs);
        }
    }

    public void addItemDecoration(ItemDecoration decor) {
        addItemDecoration(decor, -1);
    }
}
