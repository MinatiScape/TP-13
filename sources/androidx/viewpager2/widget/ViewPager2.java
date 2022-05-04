package androidx.viewpager2.widget;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.core.view.accessibility.AccessibilityNodeInfoCompat;
import androidx.core.view.accessibility.AccessibilityViewCommand;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.PagerSnapHelper;
import androidx.recyclerview.widget.RecyclerView;
import androidx.viewpager2.R$styleable;
import androidx.viewpager2.adapter.StatefulAdapter;
import androidx.viewpager2.widget.ScrollEventAdapter;
import com.android.systemui.shared.system.QuickStepContract;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public final class ViewPager2 extends ViewGroup {
    public static final WindowInsetsCompat EMPTY_INSETS = new WindowInsetsCompat.BuilderImpl30().build();
    public PageAwareAccessibilityProvider mAccessibilityProvider;
    public int mCurrentItem;
    public FakeDrag mFakeDragger;
    public LinearLayoutManagerImpl mLayoutManager;
    public CompositeOnPageChangeCallback mPageChangeEventDispatcher;
    public PagerSnapHelperImpl mPagerSnapHelper;
    public Parcelable mPendingAdapterState;
    public RecyclerViewImpl mRecyclerView;
    public ScrollEventAdapter mScrollEventAdapter;
    public final Rect mTmpContainerRect = new Rect();
    public final Rect mTmpChildRect = new Rect();
    public CompositeOnPageChangeCallback mExternalPageChangeCallbacks = new CompositeOnPageChangeCallback();
    public boolean mCurrentItemDirty = false;
    public AnonymousClass1 mCurrentItemDataSetChangeObserver = new DataSetChangeObserver() { // from class: androidx.viewpager2.widget.ViewPager2.1
        @Override // androidx.viewpager2.widget.ViewPager2.DataSetChangeObserver, androidx.recyclerview.widget.RecyclerView.AdapterDataObserver
        public final void onChanged() {
            ViewPager2 viewPager2 = ViewPager2.this;
            viewPager2.mCurrentItemDirty = true;
            viewPager2.mScrollEventAdapter.mDataSetChangeHappened = true;
        }
    };
    public int mPendingCurrentItem = -1;
    public boolean mUserInputEnabled = true;
    public int mOffscreenPageLimit = -1;

    /* loaded from: classes.dex */
    public abstract class AccessibilityProvider {
    }

    /* loaded from: classes.dex */
    public static abstract class DataSetChangeObserver extends RecyclerView.AdapterDataObserver {
        @Override // androidx.recyclerview.widget.RecyclerView.AdapterDataObserver
        public abstract void onChanged();

        @Override // androidx.recyclerview.widget.RecyclerView.AdapterDataObserver
        public final void onItemRangeChanged() {
            onChanged();
        }

        @Override // androidx.recyclerview.widget.RecyclerView.AdapterDataObserver
        public final void onItemRangeChanged(int i) {
            onChanged();
        }

        @Override // androidx.recyclerview.widget.RecyclerView.AdapterDataObserver
        public final void onItemRangeInserted(int i) {
            onChanged();
        }

        @Override // androidx.recyclerview.widget.RecyclerView.AdapterDataObserver
        public final void onItemRangeRemoved(int i) {
            onChanged();
        }
    }

    /* loaded from: classes.dex */
    public class LinearLayoutManagerImpl extends LinearLayoutManager {
        @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
        public final boolean requestChildRectangleOnScreen(RecyclerView recyclerView, View view, Rect rect, boolean z, boolean z2) {
            return false;
        }

        public LinearLayoutManagerImpl() {
            super(1);
        }

        @Override // androidx.recyclerview.widget.LinearLayoutManager
        public final void calculateExtraLayoutSpace(RecyclerView.State state, int[] iArr) {
            int i;
            int i2;
            ViewPager2 viewPager2 = ViewPager2.this;
            int i3 = viewPager2.mOffscreenPageLimit;
            if (i3 == -1) {
                super.calculateExtraLayoutSpace(state, iArr);
                return;
            }
            RecyclerViewImpl recyclerViewImpl = viewPager2.mRecyclerView;
            if (viewPager2.mLayoutManager.mOrientation == 0) {
                i = recyclerViewImpl.getWidth() - recyclerViewImpl.getPaddingLeft();
                i2 = recyclerViewImpl.getPaddingRight();
            } else {
                i = recyclerViewImpl.getHeight() - recyclerViewImpl.getPaddingTop();
                i2 = recyclerViewImpl.getPaddingBottom();
            }
            int i4 = (i - i2) * i3;
            iArr[0] = i4;
            iArr[1] = i4;
        }

        @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
        public final void onInitializeAccessibilityNodeInfoForItem(RecyclerView.Recycler recycler, RecyclerView.State state, View view, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat) {
            int i;
            int i2;
            PageAwareAccessibilityProvider pageAwareAccessibilityProvider = ViewPager2.this.mAccessibilityProvider;
            if (ViewPager2.this.mLayoutManager.mOrientation == 1) {
                i = RecyclerView.LayoutManager.getPosition(view);
            } else {
                i = 0;
            }
            if (ViewPager2.this.mLayoutManager.mOrientation == 0) {
                i2 = RecyclerView.LayoutManager.getPosition(view);
            } else {
                i2 = 0;
            }
            accessibilityNodeInfoCompat.setCollectionItemInfo(AccessibilityNodeInfoCompat.CollectionItemInfoCompat.obtain(i, 1, i2, 1, false));
        }

        @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
        public final boolean performAccessibilityAction(RecyclerView.Recycler recycler, RecyclerView.State state, int i, Bundle bundle) {
            ViewPager2.this.mAccessibilityProvider.getClass();
            return super.performAccessibilityAction(recycler, state, i, bundle);
        }

        @Override // androidx.recyclerview.widget.RecyclerView.LayoutManager
        public final void onInitializeAccessibilityNodeInfo(RecyclerView.Recycler recycler, RecyclerView.State state, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat) {
            super.onInitializeAccessibilityNodeInfo(recycler, state, accessibilityNodeInfoCompat);
            ViewPager2.this.mAccessibilityProvider.getClass();
        }
    }

    /* loaded from: classes.dex */
    public static abstract class OnPageChangeCallback {
        public void onPageScrollStateChanged(int i) {
        }

        public void onPageScrolled(int i, float f, int i2) {
        }

        public void onPageSelected(int i) {
        }
    }

    /* loaded from: classes.dex */
    public class PageAwareAccessibilityProvider extends AccessibilityProvider {
        public AnonymousClass3 mAdapterDataObserver;
        public final AnonymousClass1 mActionPageForward = new AccessibilityViewCommand() { // from class: androidx.viewpager2.widget.ViewPager2.PageAwareAccessibilityProvider.1
            @Override // androidx.core.view.accessibility.AccessibilityViewCommand
            public final boolean perform(View view) {
                PageAwareAccessibilityProvider pageAwareAccessibilityProvider = PageAwareAccessibilityProvider.this;
                int i = ((ViewPager2) view).mCurrentItem + 1;
                ViewPager2 viewPager2 = ViewPager2.this;
                if (viewPager2.mUserInputEnabled) {
                    viewPager2.setCurrentItemInternal(i, true);
                }
                return true;
            }
        };
        public final AnonymousClass2 mActionPageBackward = new AccessibilityViewCommand() { // from class: androidx.viewpager2.widget.ViewPager2.PageAwareAccessibilityProvider.2
            @Override // androidx.core.view.accessibility.AccessibilityViewCommand
            public final boolean perform(View view) {
                PageAwareAccessibilityProvider pageAwareAccessibilityProvider = PageAwareAccessibilityProvider.this;
                int i = ((ViewPager2) view).mCurrentItem - 1;
                ViewPager2 viewPager2 = ViewPager2.this;
                if (viewPager2.mUserInputEnabled) {
                    viewPager2.setCurrentItemInternal(i, true);
                }
                return true;
            }
        };

        /* JADX WARN: Type inference failed for: r1v1, types: [androidx.viewpager2.widget.ViewPager2$PageAwareAccessibilityProvider$1] */
        /* JADX WARN: Type inference failed for: r1v2, types: [androidx.viewpager2.widget.ViewPager2$PageAwareAccessibilityProvider$2] */
        public PageAwareAccessibilityProvider() {
        }

        public final void onDetachAdapter(RecyclerView.Adapter<?> adapter) {
            if (adapter != null) {
                adapter.mObservable.unregisterObserver(this.mAdapterDataObserver);
            }
        }

        /* JADX WARN: Type inference failed for: r2v1, types: [androidx.viewpager2.widget.ViewPager2$PageAwareAccessibilityProvider$3] */
        public final void onInitialize(RecyclerView recyclerView) {
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            ViewCompat.Api16Impl.setImportantForAccessibility(recyclerView, 2);
            this.mAdapterDataObserver = new DataSetChangeObserver() { // from class: androidx.viewpager2.widget.ViewPager2.PageAwareAccessibilityProvider.3
                @Override // androidx.viewpager2.widget.ViewPager2.DataSetChangeObserver, androidx.recyclerview.widget.RecyclerView.AdapterDataObserver
                public final void onChanged() {
                    PageAwareAccessibilityProvider.this.updatePageAccessibilityActions();
                }
            };
            if (ViewCompat.Api16Impl.getImportantForAccessibility(ViewPager2.this) == 0) {
                ViewCompat.Api16Impl.setImportantForAccessibility(ViewPager2.this, 1);
            }
        }

        public final void updatePageAccessibilityActions() {
            int itemCount;
            int i;
            ViewPager2 viewPager2 = ViewPager2.this;
            int i2 = 16908360;
            ViewCompat.removeActionWithId(16908360, viewPager2);
            boolean z = false;
            ViewCompat.notifyViewAccessibilityStateChangedIfNeeded(viewPager2, 0);
            ViewCompat.removeActionWithId(16908361, viewPager2);
            ViewCompat.notifyViewAccessibilityStateChangedIfNeeded(viewPager2, 0);
            ViewCompat.removeActionWithId(16908358, viewPager2);
            ViewCompat.notifyViewAccessibilityStateChangedIfNeeded(viewPager2, 0);
            ViewCompat.removeActionWithId(16908359, viewPager2);
            ViewCompat.notifyViewAccessibilityStateChangedIfNeeded(viewPager2, 0);
            if (ViewPager2.this.getAdapter() != null && (itemCount = ViewPager2.this.getAdapter().getItemCount()) != 0) {
                ViewPager2 viewPager22 = ViewPager2.this;
                if (viewPager22.mUserInputEnabled) {
                    LinearLayoutManagerImpl linearLayoutManagerImpl = viewPager22.mLayoutManager;
                    if (linearLayoutManagerImpl.mOrientation == 0) {
                        if (linearLayoutManagerImpl.getLayoutDirection() == 1) {
                            z = true;
                        }
                        if (z) {
                            i = 16908360;
                        } else {
                            i = 16908361;
                        }
                        if (z) {
                            i2 = 16908361;
                        }
                        if (ViewPager2.this.mCurrentItem < itemCount - 1) {
                            ViewCompat.replaceAccessibilityAction(viewPager2, new AccessibilityNodeInfoCompat.AccessibilityActionCompat(i), this.mActionPageForward);
                        }
                        if (ViewPager2.this.mCurrentItem > 0) {
                            ViewCompat.replaceAccessibilityAction(viewPager2, new AccessibilityNodeInfoCompat.AccessibilityActionCompat(i2), this.mActionPageBackward);
                            return;
                        }
                        return;
                    }
                    if (viewPager22.mCurrentItem < itemCount - 1) {
                        ViewCompat.replaceAccessibilityAction(viewPager2, new AccessibilityNodeInfoCompat.AccessibilityActionCompat(16908359), this.mActionPageForward);
                    }
                    if (ViewPager2.this.mCurrentItem > 0) {
                        ViewCompat.replaceAccessibilityAction(viewPager2, new AccessibilityNodeInfoCompat.AccessibilityActionCompat(16908358), this.mActionPageBackward);
                    }
                }
            }
        }

        public final void onAttachAdapter(RecyclerView.Adapter<?> adapter) {
            updatePageAccessibilityActions();
            if (adapter != null) {
                adapter.mObservable.registerObserver(this.mAdapterDataObserver);
            }
        }
    }

    /* loaded from: classes.dex */
    public class PagerSnapHelperImpl extends PagerSnapHelper {
        public PagerSnapHelperImpl() {
        }

        @Override // androidx.recyclerview.widget.PagerSnapHelper, androidx.recyclerview.widget.SnapHelper
        public final View findSnapView(RecyclerView.LayoutManager layoutManager) {
            if (ViewPager2.this.mFakeDragger.mScrollEventAdapter.mFakeDragging) {
                return null;
            }
            return super.findSnapView(layoutManager);
        }
    }

    /* loaded from: classes.dex */
    public class RecyclerViewImpl extends RecyclerView {
        public RecyclerViewImpl(Context context) {
            super(context);
        }

        @Override // androidx.recyclerview.widget.RecyclerView, android.view.ViewGroup, android.view.View
        public final CharSequence getAccessibilityClassName() {
            ViewPager2.this.mAccessibilityProvider.getClass();
            return super.getAccessibilityClassName();
        }

        @Override // androidx.recyclerview.widget.RecyclerView, android.view.ViewGroup
        public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
            if (!ViewPager2.this.mUserInputEnabled || !super.onInterceptTouchEvent(motionEvent)) {
                return false;
            }
            return true;
        }

        @Override // androidx.recyclerview.widget.RecyclerView, android.view.View
        @SuppressLint({"ClickableViewAccessibility"})
        public final boolean onTouchEvent(MotionEvent motionEvent) {
            if (!ViewPager2.this.mUserInputEnabled || !super.onTouchEvent(motionEvent)) {
                return false;
            }
            return true;
        }

        @Override // android.view.View
        public final void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
            super.onInitializeAccessibilityEvent(accessibilityEvent);
            accessibilityEvent.setFromIndex(ViewPager2.this.mCurrentItem);
            accessibilityEvent.setToIndex(ViewPager2.this.mCurrentItem);
            accessibilityEvent.setSource(ViewPager2.this);
            accessibilityEvent.setClassName("androidx.viewpager.widget.ViewPager");
        }
    }

    /* loaded from: classes.dex */
    public static class SmoothScrollToPosition implements Runnable {
        public final int mPosition;
        public final RecyclerView mRecyclerView;

        @Override // java.lang.Runnable
        public final void run() {
            this.mRecyclerView.smoothScrollToPosition(this.mPosition);
        }

        public SmoothScrollToPosition(int i, RecyclerViewImpl recyclerViewImpl) {
            this.mPosition = i;
            this.mRecyclerView = recyclerViewImpl;
        }
    }

    /* JADX WARN: Type inference failed for: r0v4, types: [androidx.viewpager2.widget.ViewPager2$1] */
    public ViewPager2(Context context) {
        super(context);
        initialize(context, null);
    }

    /* loaded from: classes.dex */
    public static class SavedState extends View.BaseSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.ClassLoaderCreator<SavedState>() { // from class: androidx.viewpager2.widget.ViewPager2.SavedState.1
            @Override // android.os.Parcelable.Creator
            public final Object createFromParcel(Parcel parcel) {
                return new SavedState(parcel, null);
            }

            @Override // android.os.Parcelable.ClassLoaderCreator
            public final SavedState createFromParcel(Parcel parcel, ClassLoader classLoader) {
                return new SavedState(parcel, classLoader);
            }

            @Override // android.os.Parcelable.Creator
            public final Object[] newArray(int i) {
                return new SavedState[i];
            }
        };
        public Parcelable mAdapterState;
        public int mCurrentItem;
        public int mRecyclerViewId;

        public SavedState() {
            throw null;
        }

        public SavedState(Parcel parcel, ClassLoader classLoader) {
            super(parcel, classLoader);
            this.mRecyclerViewId = parcel.readInt();
            this.mCurrentItem = parcel.readInt();
            this.mAdapterState = parcel.readParcelable(classLoader);
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i);
            parcel.writeInt(this.mRecyclerViewId);
            parcel.writeInt(this.mCurrentItem);
            parcel.writeParcelable(this.mAdapterState, i);
        }

        public SavedState(Parcelable parcelable) {
            super(parcelable);
        }
    }

    @Override // android.view.View
    public final boolean canScrollHorizontally(int i) {
        return this.mRecyclerView.canScrollHorizontally(i);
    }

    @Override // android.view.View
    public final boolean canScrollVertically(int i) {
        return this.mRecyclerView.canScrollVertically(i);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final CharSequence getAccessibilityClassName() {
        this.mAccessibilityProvider.getClass();
        this.mAccessibilityProvider.getClass();
        return "androidx.viewpager.widget.ViewPager";
    }

    public final RecyclerView.Adapter getAdapter() {
        return this.mRecyclerView.getAdapter();
    }

    /* JADX WARN: Finally extract failed */
    public final void initialize(Context context, AttributeSet attributeSet) {
        this.mAccessibilityProvider = new PageAwareAccessibilityProvider();
        RecyclerViewImpl recyclerViewImpl = new RecyclerViewImpl(context);
        this.mRecyclerView = recyclerViewImpl;
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        recyclerViewImpl.setId(ViewCompat.Api17Impl.generateViewId());
        this.mRecyclerView.setDescendantFocusability(QuickStepContract.SYSUI_STATE_ALLOW_GESTURE_IGNORING_BAR_VISIBILITY);
        LinearLayoutManagerImpl linearLayoutManagerImpl = new LinearLayoutManagerImpl();
        this.mLayoutManager = linearLayoutManagerImpl;
        this.mRecyclerView.setLayoutManager(linearLayoutManagerImpl);
        this.mRecyclerView.setScrollingTouchSlop(1);
        int[] iArr = R$styleable.ViewPager2;
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, iArr);
        ViewCompat.Api29Impl.saveAttributeDataForStyleable(this, context, iArr, attributeSet, obtainStyledAttributes, 0, 0);
        try {
            this.mLayoutManager.setOrientation(obtainStyledAttributes.getInt(0, 0));
            this.mAccessibilityProvider.updatePageAccessibilityActions();
            obtainStyledAttributes.recycle();
            this.mRecyclerView.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
            this.mRecyclerView.addOnChildAttachStateChangeListener(new RecyclerView.OnChildAttachStateChangeListener() { // from class: androidx.viewpager2.widget.ViewPager2.4
                @Override // androidx.recyclerview.widget.RecyclerView.OnChildAttachStateChangeListener
                public final void onChildViewDetachedFromWindow() {
                }

                @Override // androidx.recyclerview.widget.RecyclerView.OnChildAttachStateChangeListener
                public final void onChildViewAttachedToWindow(View view) {
                    RecyclerView.LayoutParams layoutParams = (RecyclerView.LayoutParams) view.getLayoutParams();
                    if (((ViewGroup.MarginLayoutParams) layoutParams).width != -1 || ((ViewGroup.MarginLayoutParams) layoutParams).height != -1) {
                        throw new IllegalStateException("Pages must fill the whole ViewPager2 (use match_parent)");
                    }
                }
            });
            ScrollEventAdapter scrollEventAdapter = new ScrollEventAdapter(this);
            this.mScrollEventAdapter = scrollEventAdapter;
            this.mFakeDragger = new FakeDrag(scrollEventAdapter);
            PagerSnapHelperImpl pagerSnapHelperImpl = new PagerSnapHelperImpl();
            this.mPagerSnapHelper = pagerSnapHelperImpl;
            pagerSnapHelperImpl.attachToRecyclerView(this.mRecyclerView);
            this.mRecyclerView.addOnScrollListener(this.mScrollEventAdapter);
            CompositeOnPageChangeCallback compositeOnPageChangeCallback = new CompositeOnPageChangeCallback();
            this.mPageChangeEventDispatcher = compositeOnPageChangeCallback;
            this.mScrollEventAdapter.mCallback = compositeOnPageChangeCallback;
            OnPageChangeCallback onPageChangeCallback = new OnPageChangeCallback() { // from class: androidx.viewpager2.widget.ViewPager2.2
                @Override // androidx.viewpager2.widget.ViewPager2.OnPageChangeCallback
                public final void onPageScrollStateChanged(int i) {
                    if (i == 0) {
                        ViewPager2.this.updateCurrentItem();
                    }
                }

                @Override // androidx.viewpager2.widget.ViewPager2.OnPageChangeCallback
                public final void onPageSelected(int i) {
                    ViewPager2 viewPager2 = ViewPager2.this;
                    if (viewPager2.mCurrentItem != i) {
                        viewPager2.mCurrentItem = i;
                        viewPager2.mAccessibilityProvider.updatePageAccessibilityActions();
                    }
                }
            };
            OnPageChangeCallback onPageChangeCallback2 = new OnPageChangeCallback() { // from class: androidx.viewpager2.widget.ViewPager2.3
                @Override // androidx.viewpager2.widget.ViewPager2.OnPageChangeCallback
                public final void onPageSelected(int i) {
                    ViewPager2.this.clearFocus();
                    if (ViewPager2.this.hasFocus()) {
                        ViewPager2.this.mRecyclerView.requestFocus(2);
                    }
                }
            };
            compositeOnPageChangeCallback.mCallbacks.add(onPageChangeCallback);
            this.mPageChangeEventDispatcher.mCallbacks.add(onPageChangeCallback2);
            this.mAccessibilityProvider.onInitialize(this.mRecyclerView);
            CompositeOnPageChangeCallback compositeOnPageChangeCallback2 = this.mPageChangeEventDispatcher;
            compositeOnPageChangeCallback2.mCallbacks.add(this.mExternalPageChangeCallbacks);
            this.mPageChangeEventDispatcher.mCallbacks.add(new PageTransformerAdapter(this.mLayoutManager));
            RecyclerViewImpl recyclerViewImpl2 = this.mRecyclerView;
            attachViewToParent(recyclerViewImpl2, 0, recyclerViewImpl2.getLayoutParams());
        } catch (Throwable th) {
            obtainStyledAttributes.recycle();
            throw th;
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int measuredWidth = this.mRecyclerView.getMeasuredWidth();
        int measuredHeight = this.mRecyclerView.getMeasuredHeight();
        this.mTmpContainerRect.left = getPaddingLeft();
        this.mTmpContainerRect.right = (i3 - i) - getPaddingRight();
        this.mTmpContainerRect.top = getPaddingTop();
        this.mTmpContainerRect.bottom = (i4 - i2) - getPaddingBottom();
        Gravity.apply(8388659, measuredWidth, measuredHeight, this.mTmpContainerRect, this.mTmpChildRect);
        RecyclerViewImpl recyclerViewImpl = this.mRecyclerView;
        Rect rect = this.mTmpChildRect;
        recyclerViewImpl.layout(rect.left, rect.top, rect.right, rect.bottom);
        if (this.mCurrentItemDirty) {
            updateCurrentItem();
        }
    }

    @Override // android.view.View
    public final void onMeasure(int i, int i2) {
        measureChild(this.mRecyclerView, i, i2);
        int measuredWidth = this.mRecyclerView.getMeasuredWidth();
        int measuredHeight = this.mRecyclerView.getMeasuredHeight();
        int measuredState = this.mRecyclerView.getMeasuredState();
        int paddingRight = getPaddingRight() + getPaddingLeft() + measuredWidth;
        int paddingTop = getPaddingTop();
        setMeasuredDimension(View.resolveSizeAndState(Math.max(paddingRight, getSuggestedMinimumWidth()), i, measuredState), View.resolveSizeAndState(Math.max(getPaddingBottom() + paddingTop + measuredHeight, getSuggestedMinimumHeight()), i2, measuredState << 16));
    }

    @Override // android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.getSuperState());
        this.mPendingCurrentItem = savedState.mCurrentItem;
        this.mPendingAdapterState = savedState.mAdapterState;
    }

    @Override // android.view.ViewGroup
    public final void onViewAdded(View view) {
        throw new IllegalStateException("ViewPager2 does not support direct child views");
    }

    @Override // android.view.View
    public final boolean performAccessibilityAction(int i, Bundle bundle) {
        boolean z;
        int i2;
        this.mAccessibilityProvider.getClass();
        boolean z2 = false;
        if (i == 8192 || i == 4096) {
            z = true;
        } else {
            z = false;
        }
        if (!z) {
            return super.performAccessibilityAction(i, bundle);
        }
        PageAwareAccessibilityProvider pageAwareAccessibilityProvider = this.mAccessibilityProvider;
        pageAwareAccessibilityProvider.getClass();
        if (i == 8192 || i == 4096) {
            z2 = true;
        }
        if (z2) {
            if (i == 8192) {
                i2 = ViewPager2.this.mCurrentItem - 1;
            } else {
                i2 = ViewPager2.this.mCurrentItem + 1;
            }
            ViewPager2 viewPager2 = ViewPager2.this;
            if (viewPager2.mUserInputEnabled) {
                viewPager2.setCurrentItemInternal(i2, true);
            }
            return true;
        }
        throw new IllegalStateException();
    }

    public final void restorePendingState() {
        RecyclerView.Adapter adapter;
        if (this.mPendingCurrentItem != -1 && (adapter = getAdapter()) != null) {
            if (this.mPendingAdapterState != null) {
                if (adapter instanceof StatefulAdapter) {
                    ((StatefulAdapter) adapter).restoreState();
                }
                this.mPendingAdapterState = null;
            }
            int max = Math.max(0, Math.min(this.mPendingCurrentItem, adapter.getItemCount() - 1));
            this.mCurrentItem = max;
            this.mPendingCurrentItem = -1;
            this.mRecyclerView.scrollToPosition(max);
            this.mAccessibilityProvider.updatePageAccessibilityActions();
        }
    }

    public final void setAdapter(RecyclerView.Adapter adapter) {
        RecyclerView.Adapter<?> adapter2 = this.mRecyclerView.getAdapter();
        this.mAccessibilityProvider.onDetachAdapter(adapter2);
        if (adapter2 != null) {
            adapter2.mObservable.unregisterObserver(this.mCurrentItemDataSetChangeObserver);
        }
        this.mRecyclerView.setAdapter(adapter);
        this.mCurrentItem = 0;
        restorePendingState();
        this.mAccessibilityProvider.onAttachAdapter(adapter);
        if (adapter != null) {
            adapter.mObservable.registerObserver(this.mCurrentItemDataSetChangeObserver);
        }
    }

    public final void setCurrentItem(int i, boolean z) {
        if (!this.mFakeDragger.mScrollEventAdapter.mFakeDragging) {
            setCurrentItemInternal(i, z);
            return;
        }
        throw new IllegalStateException("Cannot change current item when ViewPager2 is fake dragging");
    }

    public final void updateCurrentItem() {
        PagerSnapHelperImpl pagerSnapHelperImpl = this.mPagerSnapHelper;
        if (pagerSnapHelperImpl != null) {
            View findSnapView = pagerSnapHelperImpl.findSnapView(this.mLayoutManager);
            if (findSnapView != null) {
                this.mLayoutManager.getClass();
                int position = RecyclerView.LayoutManager.getPosition(findSnapView);
                if (position != this.mCurrentItem && this.mScrollEventAdapter.mScrollState == 0) {
                    this.mPageChangeEventDispatcher.onPageSelected(position);
                }
                this.mCurrentItemDirty = false;
                return;
            }
            return;
        }
        throw new IllegalStateException("Design assumption violated.");
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchRestoreInstanceState(SparseArray<Parcelable> sparseArray) {
        Parcelable parcelable = sparseArray.get(getId());
        if (parcelable instanceof SavedState) {
            int i = ((SavedState) parcelable).mRecyclerViewId;
            sparseArray.put(this.mRecyclerView.getId(), sparseArray.get(i));
            sparseArray.remove(i);
        }
        super.dispatchRestoreInstanceState(sparseArray);
        restorePendingState();
    }

    @Override // android.view.View
    public final WindowInsets onApplyWindowInsets(WindowInsets windowInsets) {
        WindowInsets onApplyWindowInsets = super.onApplyWindowInsets(windowInsets);
        if (onApplyWindowInsets.isConsumed()) {
            return onApplyWindowInsets;
        }
        int childCount = this.mRecyclerView.getChildCount();
        for (int i = 0; i < childCount; i++) {
            this.mRecyclerView.getChildAt(i).dispatchApplyWindowInsets(new WindowInsets(onApplyWindowInsets));
        }
        WindowInsetsCompat windowInsetsCompat = EMPTY_INSETS;
        if (windowInsetsCompat.toWindowInsets() != null) {
            return windowInsetsCompat.toWindowInsets();
        }
        return windowInsets.consumeSystemWindowInsets().consumeStableInsets();
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        int i;
        int i2;
        int itemCount;
        super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
        PageAwareAccessibilityProvider pageAwareAccessibilityProvider = this.mAccessibilityProvider;
        if (ViewPager2.this.getAdapter() != null) {
            ViewPager2 viewPager2 = ViewPager2.this;
            if (viewPager2.mLayoutManager.mOrientation == 1) {
                i2 = viewPager2.getAdapter().getItemCount();
                i = 1;
            } else {
                i = viewPager2.getAdapter().getItemCount();
                i2 = 1;
            }
        } else {
            i2 = 0;
            i = 0;
        }
        accessibilityNodeInfo.setCollectionInfo((AccessibilityNodeInfo.CollectionInfo) AccessibilityNodeInfoCompat.CollectionInfoCompat.obtain(i2, i, 0).mInfo);
        RecyclerView.Adapter adapter = ViewPager2.this.getAdapter();
        if (adapter != null && (itemCount = adapter.getItemCount()) != 0) {
            ViewPager2 viewPager22 = ViewPager2.this;
            if (viewPager22.mUserInputEnabled) {
                if (viewPager22.mCurrentItem > 0) {
                    accessibilityNodeInfo.addAction(QuickStepContract.SYSUI_STATE_ASSIST_GESTURE_CONSTRAINED);
                }
                if (ViewPager2.this.mCurrentItem < itemCount - 1) {
                    accessibilityNodeInfo.addAction(QuickStepContract.SYSUI_STATE_TRACING_ENABLED);
                }
                accessibilityNodeInfo.setScrollable(true);
            }
        }
    }

    @Override // android.view.View
    public final Parcelable onSaveInstanceState() {
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        savedState.mRecyclerViewId = this.mRecyclerView.getId();
        int i = this.mPendingCurrentItem;
        if (i == -1) {
            i = this.mCurrentItem;
        }
        savedState.mCurrentItem = i;
        Parcelable parcelable = this.mPendingAdapterState;
        if (parcelable != null) {
            savedState.mAdapterState = parcelable;
        } else {
            RecyclerView.Adapter adapter = this.mRecyclerView.getAdapter();
            if (adapter instanceof StatefulAdapter) {
                savedState.mAdapterState = ((StatefulAdapter) adapter).saveState();
            }
        }
        return savedState;
    }

    public final void setCurrentItemInternal(int i, boolean z) {
        boolean z2;
        int i2;
        int i3;
        OnPageChangeCallback onPageChangeCallback;
        boolean z3;
        RecyclerView.Adapter adapter = getAdapter();
        boolean z4 = false;
        if (adapter == null) {
            if (this.mPendingCurrentItem != -1) {
                this.mPendingCurrentItem = Math.max(i, 0);
            }
        } else if (adapter.getItemCount() > 0) {
            int min = Math.min(Math.max(i, 0), adapter.getItemCount() - 1);
            int i4 = this.mCurrentItem;
            if (min == i4) {
                if (this.mScrollEventAdapter.mScrollState == 0) {
                    z3 = true;
                } else {
                    z3 = false;
                }
                if (z3) {
                    return;
                }
            }
            if (min != i4 || !z) {
                double d = i4;
                this.mCurrentItem = min;
                this.mAccessibilityProvider.updatePageAccessibilityActions();
                ScrollEventAdapter scrollEventAdapter = this.mScrollEventAdapter;
                if (scrollEventAdapter.mScrollState == 0) {
                    z2 = true;
                } else {
                    z2 = false;
                }
                if (!z2) {
                    scrollEventAdapter.updateScrollEventValues();
                    ScrollEventAdapter.ScrollEventValues scrollEventValues = scrollEventAdapter.mScrollValues;
                    d = scrollEventValues.mPosition + scrollEventValues.mOffset;
                }
                ScrollEventAdapter scrollEventAdapter2 = this.mScrollEventAdapter;
                if (z) {
                    i2 = 2;
                } else {
                    i2 = 3;
                }
                scrollEventAdapter2.mAdapterState = i2;
                scrollEventAdapter2.mFakeDragging = false;
                if (scrollEventAdapter2.mTarget != min) {
                    z4 = true;
                }
                scrollEventAdapter2.mTarget = min;
                scrollEventAdapter2.dispatchStateChanged(2);
                if (z4 && (onPageChangeCallback = scrollEventAdapter2.mCallback) != null) {
                    onPageChangeCallback.onPageSelected(min);
                }
                if (!z) {
                    this.mRecyclerView.scrollToPosition(min);
                    return;
                }
                double d2 = min;
                if (Math.abs(d2 - d) > 3.0d) {
                    RecyclerViewImpl recyclerViewImpl = this.mRecyclerView;
                    if (d2 > d) {
                        i3 = min - 3;
                    } else {
                        i3 = min + 3;
                    }
                    recyclerViewImpl.scrollToPosition(i3);
                    RecyclerViewImpl recyclerViewImpl2 = this.mRecyclerView;
                    recyclerViewImpl2.post(new SmoothScrollToPosition(min, recyclerViewImpl2));
                    return;
                }
                this.mRecyclerView.smoothScrollToPosition(min);
            }
        }
    }

    @Override // android.view.View
    public final void setLayoutDirection(int i) {
        super.setLayoutDirection(i);
        this.mAccessibilityProvider.updatePageAccessibilityActions();
    }

    /* JADX WARN: Type inference failed for: r0v4, types: [androidx.viewpager2.widget.ViewPager2$1] */
    public ViewPager2(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        initialize(context, attributeSet);
    }

    /* JADX WARN: Type inference failed for: r4v5, types: [androidx.viewpager2.widget.ViewPager2$1] */
    public ViewPager2(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        initialize(context, attributeSet);
    }

    /* JADX WARN: Type inference failed for: r3v5, types: [androidx.viewpager2.widget.ViewPager2$1] */
    public ViewPager2(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
        initialize(context, attributeSet);
    }
}
