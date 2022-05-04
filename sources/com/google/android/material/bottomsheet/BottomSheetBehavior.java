package com.google.android.material.bottomsheet;

import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityNodeInfo;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.core.math.MathUtils;
import androidx.core.view.AccessibilityDelegateCompat;
import androidx.core.view.OnApplyWindowInsetsListener;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.core.view.accessibility.AccessibilityNodeInfoCompat;
import androidx.core.view.accessibility.AccessibilityViewCommand;
import androidx.customview.view.AbsSavedState;
import androidx.customview.widget.ViewDragHelper;
import androidx.recyclerview.widget.RecyclerView;
import com.android.systemui.shared.R;
import com.android.systemui.shared.system.QuickStepContract;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.android.material.R$styleable;
import com.google.android.material.internal.ViewUtils;
import com.google.android.material.resources.MaterialResources;
import com.google.android.material.shape.MaterialShapeDrawable;
import com.google.android.material.shape.ShapeAppearanceModel;
import com.google.common.math.IntMath;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public class BottomSheetBehavior<V extends View> extends CoordinatorLayout.Behavior<V> {
    public int activePointerId;
    public ColorStateList backgroundTint;
    public final ArrayList<BottomSheetCallback> callbacks;
    public int childHeight;
    public int collapsedOffset;
    public final AnonymousClass4 dragCallback;
    public boolean draggable;
    public float elevation;
    public int expandHalfwayActionId;
    public int expandedOffset;
    public boolean fitToContents;
    public int fitToContentsOffset;
    public int gestureInsetBottom;
    public boolean gestureInsetBottomIgnored;
    public int halfExpandedOffset;
    public float halfExpandedRatio;
    public boolean hideable;
    public boolean ignoreEvents;
    public HashMap importantForAccessibilityMap;
    public int initialY;
    public int insetBottom;
    public int insetTop;
    public ValueAnimator interpolatorAnimator;
    public boolean isShapeExpanded;
    public int lastNestedScrollDy;
    public boolean marginLeftSystemWindowInsets;
    public boolean marginRightSystemWindowInsets;
    public boolean marginTopSystemWindowInsets;
    public MaterialShapeDrawable materialShapeDrawable;
    public int maxHeight;
    public int maxWidth;
    public float maximumVelocity;
    public boolean nestedScrolled;
    public WeakReference<View> nestedScrollingChildRef;
    public boolean paddingBottomSystemWindowInsets;
    public boolean paddingLeftSystemWindowInsets;
    public boolean paddingRightSystemWindowInsets;
    public boolean paddingTopSystemWindowInsets;
    public int parentHeight;
    public int parentWidth;
    public int peekHeight;
    public boolean peekHeightAuto;
    public int peekHeightGestureInsetBuffer;
    public int peekHeightMin;
    public int saveFlags;
    public BottomSheetBehavior<V>.SettleRunnable settleRunnable;
    public ShapeAppearanceModel shapeAppearanceModelDefault;
    public boolean skipCollapsed;
    public int state;
    public boolean touchingScrollingChild;
    public VelocityTracker velocityTracker;
    public ViewDragHelper viewDragHelper;
    public WeakReference<V> viewRef;

    /* renamed from: com.google.android.material.bottomsheet.BottomSheetBehavior$3  reason: invalid class name */
    /* loaded from: classes.dex */
    public final class AnonymousClass3 implements ViewUtils.OnApplyWindowInsetsListener {
        public final /* synthetic */ boolean val$shouldHandleGestureInsets;

        public AnonymousClass3(boolean z) {
            this.val$shouldHandleGestureInsets = z;
        }
    }

    /* loaded from: classes.dex */
    public static abstract class BottomSheetCallback {
        public abstract void onSlide(View view, float f);

        public abstract void onStateChanged(View view, int i);
    }

    /* loaded from: classes.dex */
    public static class SavedState extends AbsSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.ClassLoaderCreator<SavedState>() { // from class: com.google.android.material.bottomsheet.BottomSheetBehavior.SavedState.1
            @Override // android.os.Parcelable.ClassLoaderCreator
            public final SavedState createFromParcel(Parcel parcel, ClassLoader classLoader) {
                return new SavedState(parcel, classLoader);
            }

            @Override // android.os.Parcelable.Creator
            public final Object createFromParcel(Parcel parcel) {
                return new SavedState(parcel, (ClassLoader) null);
            }

            @Override // android.os.Parcelable.Creator
            public final Object[] newArray(int i) {
                return new SavedState[i];
            }
        };
        public boolean fitToContents;
        public boolean hideable;
        public int peekHeight;
        public boolean skipCollapsed;
        public final int state;

        public SavedState(Parcel parcel, ClassLoader classLoader) {
            super(parcel, classLoader);
            this.state = parcel.readInt();
            this.peekHeight = parcel.readInt();
            boolean z = false;
            this.fitToContents = parcel.readInt() == 1;
            this.hideable = parcel.readInt() == 1;
            this.skipCollapsed = parcel.readInt() == 1 ? true : z;
        }

        @Override // androidx.customview.view.AbsSavedState, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i) {
            parcel.writeParcelable(this.mSuperState, i);
            parcel.writeInt(this.state);
            parcel.writeInt(this.peekHeight);
            parcel.writeInt(this.fitToContents ? 1 : 0);
            parcel.writeInt(this.hideable ? 1 : 0);
            parcel.writeInt(this.skipCollapsed ? 1 : 0);
        }

        public SavedState(android.view.AbsSavedState absSavedState, BottomSheetBehavior bottomSheetBehavior) {
            super(absSavedState);
            this.state = bottomSheetBehavior.state;
            this.peekHeight = bottomSheetBehavior.peekHeight;
            this.fitToContents = bottomSheetBehavior.fitToContents;
            this.hideable = bottomSheetBehavior.hideable;
            this.skipCollapsed = bottomSheetBehavior.skipCollapsed;
        }
    }

    /* loaded from: classes.dex */
    public class SettleRunnable implements Runnable {
        public boolean isPosted;
        public int targetState;
        public final WeakReference<View> viewRef;

        public SettleRunnable(View view, int i) {
            this.viewRef = new WeakReference<>(view);
            this.targetState = i;
        }

        @Override // java.lang.Runnable
        public final void run() {
            ViewDragHelper viewDragHelper;
            if (this.viewRef.get() == null || (viewDragHelper = BottomSheetBehavior.this.viewDragHelper) == null || !viewDragHelper.continueSettling()) {
                BottomSheetBehavior.this.setStateInternal(this.targetState);
            } else {
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                ViewCompat.Api16Impl.postOnAnimation(this.viewRef.get(), this);
            }
            this.isPosted = false;
        }
    }

    /* JADX WARN: Type inference failed for: r0v4, types: [com.google.android.material.bottomsheet.BottomSheetBehavior$4] */
    public BottomSheetBehavior() {
        this.saveFlags = 0;
        this.fitToContents = true;
        this.maxWidth = -1;
        this.maxHeight = -1;
        this.settleRunnable = null;
        this.halfExpandedRatio = 0.5f;
        this.elevation = -1.0f;
        this.draggable = true;
        this.state = 4;
        this.callbacks = new ArrayList<>();
        this.expandHalfwayActionId = -1;
        this.dragCallback = new ViewDragHelper.Callback() { // from class: com.google.android.material.bottomsheet.BottomSheetBehavior.4
            @Override // androidx.customview.widget.ViewDragHelper.Callback
            public final void onViewDragStateChanged(int i) {
                if (i == 1) {
                    BottomSheetBehavior bottomSheetBehavior = BottomSheetBehavior.this;
                    if (bottomSheetBehavior.draggable) {
                        bottomSheetBehavior.setStateInternal(1);
                    }
                }
            }

            @Override // androidx.customview.widget.ViewDragHelper.Callback
            public final void onViewReleased(View view, float f, float f2) {
                int i;
                int i2;
                boolean z;
                int i3 = 4;
                if (f2 < HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                    BottomSheetBehavior bottomSheetBehavior = BottomSheetBehavior.this;
                    if (bottomSheetBehavior.fitToContents) {
                        i = bottomSheetBehavior.fitToContentsOffset;
                    } else {
                        int top = view.getTop();
                        System.currentTimeMillis();
                        BottomSheetBehavior.this.getClass();
                        BottomSheetBehavior bottomSheetBehavior2 = BottomSheetBehavior.this;
                        i2 = bottomSheetBehavior2.halfExpandedOffset;
                        if (top <= i2) {
                            i = bottomSheetBehavior2.getExpandedOffset();
                        }
                        i3 = 6;
                        i = i2;
                    }
                    i3 = 3;
                } else {
                    BottomSheetBehavior bottomSheetBehavior3 = BottomSheetBehavior.this;
                    if (bottomSheetBehavior3.hideable && bottomSheetBehavior3.shouldHide(view, f2)) {
                        if (Math.abs(f) >= Math.abs(f2) || f2 <= 500.0f) {
                            int top2 = view.getTop();
                            BottomSheetBehavior bottomSheetBehavior4 = BottomSheetBehavior.this;
                            if (top2 > (bottomSheetBehavior4.getExpandedOffset() + bottomSheetBehavior4.parentHeight) / 2) {
                                z = true;
                            } else {
                                z = false;
                            }
                            if (!z) {
                                BottomSheetBehavior bottomSheetBehavior5 = BottomSheetBehavior.this;
                                if (bottomSheetBehavior5.fitToContents) {
                                    i = bottomSheetBehavior5.fitToContentsOffset;
                                } else if (Math.abs(view.getTop() - BottomSheetBehavior.this.getExpandedOffset()) < Math.abs(view.getTop() - BottomSheetBehavior.this.halfExpandedOffset)) {
                                    i = BottomSheetBehavior.this.getExpandedOffset();
                                } else {
                                    i2 = BottomSheetBehavior.this.halfExpandedOffset;
                                    i3 = 6;
                                    i = i2;
                                }
                                i3 = 3;
                            }
                        }
                        i = BottomSheetBehavior.this.parentHeight;
                        i3 = 5;
                    } else if (f2 == HingeAngleProviderKt.FULLY_CLOSED_DEGREES || Math.abs(f) > Math.abs(f2)) {
                        int top3 = view.getTop();
                        BottomSheetBehavior bottomSheetBehavior6 = BottomSheetBehavior.this;
                        if (!bottomSheetBehavior6.fitToContents) {
                            int i4 = bottomSheetBehavior6.halfExpandedOffset;
                            if (top3 < i4) {
                                if (top3 < Math.abs(top3 - bottomSheetBehavior6.collapsedOffset)) {
                                    i = BottomSheetBehavior.this.getExpandedOffset();
                                    i3 = 3;
                                } else {
                                    BottomSheetBehavior.this.getClass();
                                    i2 = BottomSheetBehavior.this.halfExpandedOffset;
                                }
                            } else if (Math.abs(top3 - i4) < Math.abs(top3 - BottomSheetBehavior.this.collapsedOffset)) {
                                BottomSheetBehavior.this.getClass();
                                i2 = BottomSheetBehavior.this.halfExpandedOffset;
                            } else {
                                i = BottomSheetBehavior.this.collapsedOffset;
                            }
                            i3 = 6;
                            i = i2;
                        } else if (Math.abs(top3 - bottomSheetBehavior6.fitToContentsOffset) < Math.abs(top3 - BottomSheetBehavior.this.collapsedOffset)) {
                            i = BottomSheetBehavior.this.fitToContentsOffset;
                            i3 = 3;
                        } else {
                            i = BottomSheetBehavior.this.collapsedOffset;
                        }
                    } else {
                        BottomSheetBehavior bottomSheetBehavior7 = BottomSheetBehavior.this;
                        if (bottomSheetBehavior7.fitToContents) {
                            i = bottomSheetBehavior7.collapsedOffset;
                        } else {
                            int top4 = view.getTop();
                            if (Math.abs(top4 - BottomSheetBehavior.this.halfExpandedOffset) < Math.abs(top4 - BottomSheetBehavior.this.collapsedOffset)) {
                                BottomSheetBehavior.this.getClass();
                                i2 = BottomSheetBehavior.this.halfExpandedOffset;
                                i3 = 6;
                                i = i2;
                            } else {
                                i = BottomSheetBehavior.this.collapsedOffset;
                            }
                        }
                    }
                }
                BottomSheetBehavior bottomSheetBehavior8 = BottomSheetBehavior.this;
                bottomSheetBehavior8.getClass();
                bottomSheetBehavior8.startSettlingAnimation(view, i3, i, true);
            }

            @Override // androidx.customview.widget.ViewDragHelper.Callback
            public final int clampViewPositionVertical(View view, int i) {
                int i2;
                int expandedOffset = BottomSheetBehavior.this.getExpandedOffset();
                BottomSheetBehavior bottomSheetBehavior = BottomSheetBehavior.this;
                if (bottomSheetBehavior.hideable) {
                    i2 = bottomSheetBehavior.parentHeight;
                } else {
                    i2 = bottomSheetBehavior.collapsedOffset;
                }
                return MathUtils.clamp(i, expandedOffset, i2);
            }

            @Override // androidx.customview.widget.ViewDragHelper.Callback
            public final int getViewVerticalDragRange() {
                BottomSheetBehavior bottomSheetBehavior = BottomSheetBehavior.this;
                if (bottomSheetBehavior.hideable) {
                    return bottomSheetBehavior.parentHeight;
                }
                return bottomSheetBehavior.collapsedOffset;
            }

            @Override // androidx.customview.widget.ViewDragHelper.Callback
            public final void onViewPositionChanged(View view, int i, int i2) {
                BottomSheetBehavior.this.dispatchOnSlide(i2);
            }

            @Override // androidx.customview.widget.ViewDragHelper.Callback
            public final boolean tryCaptureView(View view, int i) {
                View view2;
                BottomSheetBehavior bottomSheetBehavior = BottomSheetBehavior.this;
                int i2 = bottomSheetBehavior.state;
                if (i2 == 1 || bottomSheetBehavior.touchingScrollingChild) {
                    return false;
                }
                if (i2 == 3 && bottomSheetBehavior.activePointerId == i) {
                    WeakReference<View> weakReference = bottomSheetBehavior.nestedScrollingChildRef;
                    if (weakReference != null) {
                        view2 = weakReference.get();
                    } else {
                        view2 = null;
                    }
                    if (view2 != null && view2.canScrollVertically(-1)) {
                        return false;
                    }
                }
                System.currentTimeMillis();
                WeakReference<V> weakReference2 = BottomSheetBehavior.this.viewRef;
                if (weakReference2 == null || weakReference2.get() != view) {
                    return false;
                }
                return true;
            }

            @Override // androidx.customview.widget.ViewDragHelper.Callback
            public final int clampViewPositionHorizontal(View view, int i) {
                return view.getLeft();
            }
        };
    }

    private void reset$1() {
        this.activePointerId = -1;
        VelocityTracker velocityTracker = this.velocityTracker;
        if (velocityTracker != null) {
            velocityTracker.recycle();
            this.velocityTracker = null;
        }
    }

    public void disableShapeAnimations() {
        this.interpolatorAnimator = null;
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public final void onAttachedToLayoutParams(CoordinatorLayout.LayoutParams layoutParams) {
        this.viewRef = null;
        this.viewDragHelper = null;
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public final void onDetachedFromLayoutParams() {
        this.viewRef = null;
        this.viewDragHelper = null;
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public final void onNestedPreScroll(CoordinatorLayout coordinatorLayout, V v, View view, int i, int i2, int[] iArr, int i3) {
        View view2;
        if (i3 != 1) {
            WeakReference<View> weakReference = this.nestedScrollingChildRef;
            if (weakReference != null) {
                view2 = weakReference.get();
            } else {
                view2 = null;
            }
            if (view == view2) {
                int top = v.getTop();
                int i4 = top - i2;
                if (i2 > 0) {
                    if (i4 < getExpandedOffset()) {
                        int expandedOffset = top - getExpandedOffset();
                        iArr[1] = expandedOffset;
                        int i5 = -expandedOffset;
                        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                        v.offsetTopAndBottom(i5);
                        setStateInternal(3);
                    } else if (this.draggable) {
                        iArr[1] = i2;
                        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap2 = ViewCompat.sViewPropertyAnimatorMap;
                        v.offsetTopAndBottom(-i2);
                        setStateInternal(1);
                    } else {
                        return;
                    }
                } else if (i2 < 0 && !view.canScrollVertically(-1)) {
                    int i6 = this.collapsedOffset;
                    if (i4 > i6 && !this.hideable) {
                        int i7 = top - i6;
                        iArr[1] = i7;
                        int i8 = -i7;
                        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap3 = ViewCompat.sViewPropertyAnimatorMap;
                        v.offsetTopAndBottom(i8);
                        setStateInternal(4);
                    } else if (this.draggable) {
                        iArr[1] = i2;
                        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap4 = ViewCompat.sViewPropertyAnimatorMap;
                        v.offsetTopAndBottom(-i2);
                        setStateInternal(1);
                    } else {
                        return;
                    }
                }
                dispatchOnSlide(v.getTop());
                this.lastNestedScrollDy = i2;
                this.nestedScrolled = true;
            }
        }
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public final void onNestedScroll(CoordinatorLayout coordinatorLayout, View view, int i, int i2, int i3, int[] iArr) {
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public final boolean onStartNestedScroll(CoordinatorLayout coordinatorLayout, View view, View view2, int i, int i2) {
        this.lastNestedScrollDy = 0;
        this.nestedScrolled = false;
        return (i & 2) != 0;
    }

    public final void setPeekHeight(int i) {
        boolean z = true;
        if (i == -1) {
            if (!this.peekHeightAuto) {
                this.peekHeightAuto = true;
            }
            z = false;
        } else {
            if (this.peekHeightAuto || this.peekHeight != i) {
                this.peekHeightAuto = false;
                this.peekHeight = Math.max(0, i);
            }
            z = false;
        }
        if (z) {
            updatePeekHeight();
        }
    }

    public final void settleToState(View view, int i) {
        int i2;
        int i3;
        if (i == 4) {
            i2 = this.collapsedOffset;
        } else if (i == 6) {
            int i4 = this.halfExpandedOffset;
            if (!this.fitToContents || i4 > (i3 = this.fitToContentsOffset)) {
                i2 = i4;
            } else {
                i = 3;
                i2 = i3;
            }
        } else if (i == 3) {
            i2 = getExpandedOffset();
        } else if (!this.hideable || i != 5) {
            Log.w("BottomSheetBehavior", "The bottom sheet may be in an invalid state. Ensure `hideable` is true when using `STATE_HIDDEN`.");
            return;
        } else {
            i2 = this.parentHeight;
        }
        startSettlingAnimation(view, i, i2, false);
    }

    public final void updateDrawableForTargetState(int i) {
        boolean z;
        ValueAnimator valueAnimator;
        float f;
        if (i != 2) {
            if (i == 3) {
                z = true;
            } else {
                z = false;
            }
            if (this.isShapeExpanded != z) {
                this.isShapeExpanded = z;
                if (this.materialShapeDrawable != null && (valueAnimator = this.interpolatorAnimator) != null) {
                    if (valueAnimator.isRunning()) {
                        this.interpolatorAnimator.reverse();
                        return;
                    }
                    if (z) {
                        f = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
                    } else {
                        f = 1.0f;
                    }
                    this.interpolatorAnimator.setFloatValues(1.0f - f, f);
                    this.interpolatorAnimator.start();
                }
            }
        }
    }

    public final int calculatePeekHeight() {
        int i;
        int i2;
        int i3;
        if (this.peekHeightAuto) {
            i = Math.min(Math.max(this.peekHeightMin, this.parentHeight - ((this.parentWidth * 9) / 16)), this.childHeight);
            i2 = this.insetBottom;
        } else if (!this.gestureInsetBottomIgnored && !this.paddingBottomSystemWindowInsets && (i3 = this.gestureInsetBottom) > 0) {
            return Math.max(this.peekHeight, i3 + this.peekHeightGestureInsetBuffer);
        } else {
            i = this.peekHeight;
            i2 = this.insetBottom;
        }
        return i + i2;
    }

    public final void dispatchOnSlide(int i) {
        float f;
        float f2;
        V v = this.viewRef.get();
        if (!(v == null || this.callbacks.isEmpty())) {
            int i2 = this.collapsedOffset;
            if (i > i2 || i2 == getExpandedOffset()) {
                int i3 = this.collapsedOffset;
                f = i3 - i;
                f2 = this.parentHeight - i3;
            } else {
                int i4 = this.collapsedOffset;
                f = i4 - i;
                f2 = i4 - getExpandedOffset();
            }
            float f3 = f / f2;
            for (int i5 = 0; i5 < this.callbacks.size(); i5++) {
                this.callbacks.get(i5).onSlide(v, f3);
            }
        }
    }

    public View findScrollingChild(View view) {
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        if (ViewCompat.Api21Impl.isNestedScrollingEnabled(view)) {
            return view;
        }
        if (!(view instanceof ViewGroup)) {
            return null;
        }
        ViewGroup viewGroup = (ViewGroup) view;
        int childCount = viewGroup.getChildCount();
        for (int i = 0; i < childCount; i++) {
            View findScrollingChild = findScrollingChild(viewGroup.getChildAt(i));
            if (findScrollingChild != null) {
                return findScrollingChild;
            }
        }
        return null;
    }

    public final int getExpandedOffset() {
        int i;
        if (this.fitToContents) {
            return this.fitToContentsOffset;
        }
        int i2 = this.expandedOffset;
        if (this.paddingTopSystemWindowInsets) {
            i = 0;
        } else {
            i = this.insetTop;
        }
        return Math.max(i2, i);
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public final boolean onLayoutChild(CoordinatorLayout coordinatorLayout, V v, int i) {
        boolean z;
        boolean z2;
        float f;
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        if (ViewCompat.Api16Impl.getFitsSystemWindows(coordinatorLayout) && !ViewCompat.Api16Impl.getFitsSystemWindows(v)) {
            v.setFitsSystemWindows(true);
        }
        if (this.viewRef == null) {
            this.peekHeightMin = coordinatorLayout.getResources().getDimensionPixelSize(R.dimen.design_bottom_sheet_peek_height_min);
            if (this.gestureInsetBottomIgnored || this.peekHeightAuto) {
                z = false;
            } else {
                z = true;
            }
            if (this.paddingBottomSystemWindowInsets || this.paddingLeftSystemWindowInsets || this.paddingRightSystemWindowInsets || this.marginLeftSystemWindowInsets || this.marginRightSystemWindowInsets || this.marginTopSystemWindowInsets || z) {
                final AnonymousClass3 r5 = new AnonymousClass3(z);
                final ViewUtils.RelativePadding relativePadding = new ViewUtils.RelativePadding(ViewCompat.Api17Impl.getPaddingStart(v), v.getPaddingTop(), ViewCompat.Api17Impl.getPaddingEnd(v), v.getPaddingBottom());
                ViewCompat.Api21Impl.setOnApplyWindowInsetsListener(v, new OnApplyWindowInsetsListener() { // from class: com.google.android.material.internal.ViewUtils.3
                    /* JADX WARN: Removed duplicated region for block: B:33:0x0093  */
                    /* JADX WARN: Removed duplicated region for block: B:36:0x00a1  */
                    @Override // androidx.core.view.OnApplyWindowInsetsListener
                    /*
                        Code decompiled incorrectly, please refer to instructions dump.
                        To view partially-correct add '--show-bad-code' argument
                    */
                    public final androidx.core.view.WindowInsetsCompat onApplyWindowInsets(android.view.View r12, androidx.core.view.WindowInsetsCompat r13) {
                        /*
                            r11 = this;
                            com.google.android.material.internal.ViewUtils$OnApplyWindowInsetsListener r0 = r1
                            com.google.android.material.internal.ViewUtils$RelativePadding r11 = r2
                            int r1 = r11.start
                            int r2 = r11.end
                            int r11 = r11.bottom
                            com.google.android.material.bottomsheet.BottomSheetBehavior$3 r0 = (com.google.android.material.bottomsheet.BottomSheetBehavior.AnonymousClass3) r0
                            r0.getClass()
                            androidx.core.view.WindowInsetsCompat$Impl r3 = r13.mImpl
                            r4 = 7
                            androidx.core.graphics.Insets r3 = r3.getInsets(r4)
                            r4 = 32
                            androidx.core.view.WindowInsetsCompat$Impl r5 = r13.mImpl
                            androidx.core.graphics.Insets r4 = r5.getInsets(r4)
                            com.google.android.material.bottomsheet.BottomSheetBehavior r5 = com.google.android.material.bottomsheet.BottomSheetBehavior.this
                            int r6 = r3.top
                            r5.insetTop = r6
                            boolean r5 = com.google.android.material.internal.ViewUtils.isLayoutRtl(r12)
                            int r6 = r12.getPaddingBottom()
                            int r7 = r12.getPaddingLeft()
                            int r8 = r12.getPaddingRight()
                            com.google.android.material.bottomsheet.BottomSheetBehavior r9 = com.google.android.material.bottomsheet.BottomSheetBehavior.this
                            boolean r10 = r9.paddingBottomSystemWindowInsets
                            if (r10 == 0) goto L45
                            int r6 = r13.getSystemWindowInsetBottom()
                            r9.insetBottom = r6
                            com.google.android.material.bottomsheet.BottomSheetBehavior r6 = com.google.android.material.bottomsheet.BottomSheetBehavior.this
                            int r6 = r6.insetBottom
                            int r6 = r6 + r11
                        L45:
                            com.google.android.material.bottomsheet.BottomSheetBehavior r11 = com.google.android.material.bottomsheet.BottomSheetBehavior.this
                            boolean r9 = r11.paddingLeftSystemWindowInsets
                            if (r9 == 0) goto L53
                            if (r5 == 0) goto L4f
                            r7 = r2
                            goto L50
                        L4f:
                            r7 = r1
                        L50:
                            int r9 = r3.left
                            int r7 = r7 + r9
                        L53:
                            boolean r11 = r11.paddingRightSystemWindowInsets
                            if (r11 == 0) goto L5f
                            if (r5 == 0) goto L5a
                            goto L5b
                        L5a:
                            r1 = r2
                        L5b:
                            int r11 = r3.right
                            int r8 = r1 + r11
                        L5f:
                            android.view.ViewGroup$LayoutParams r11 = r12.getLayoutParams()
                            android.view.ViewGroup$MarginLayoutParams r11 = (android.view.ViewGroup.MarginLayoutParams) r11
                            com.google.android.material.bottomsheet.BottomSheetBehavior r1 = com.google.android.material.bottomsheet.BottomSheetBehavior.this
                            boolean r2 = r1.marginLeftSystemWindowInsets
                            r5 = 0
                            r9 = 1
                            if (r2 == 0) goto L76
                            int r2 = r11.leftMargin
                            int r10 = r3.left
                            if (r2 == r10) goto L76
                            r11.leftMargin = r10
                            r5 = r9
                        L76:
                            boolean r2 = r1.marginRightSystemWindowInsets
                            if (r2 == 0) goto L83
                            int r2 = r11.rightMargin
                            int r10 = r3.right
                            if (r2 == r10) goto L83
                            r11.rightMargin = r10
                            r5 = r9
                        L83:
                            boolean r1 = r1.marginTopSystemWindowInsets
                            if (r1 == 0) goto L90
                            int r1 = r11.topMargin
                            int r2 = r3.top
                            if (r1 == r2) goto L90
                            r11.topMargin = r2
                            goto L91
                        L90:
                            r9 = r5
                        L91:
                            if (r9 == 0) goto L96
                            r12.setLayoutParams(r11)
                        L96:
                            int r11 = r12.getPaddingTop()
                            r12.setPadding(r7, r11, r8, r6)
                            boolean r11 = r0.val$shouldHandleGestureInsets
                            if (r11 == 0) goto La7
                            com.google.android.material.bottomsheet.BottomSheetBehavior r12 = com.google.android.material.bottomsheet.BottomSheetBehavior.this
                            int r1 = r4.bottom
                            r12.gestureInsetBottom = r1
                        La7:
                            com.google.android.material.bottomsheet.BottomSheetBehavior r12 = com.google.android.material.bottomsheet.BottomSheetBehavior.this
                            boolean r0 = r12.paddingBottomSystemWindowInsets
                            if (r0 != 0) goto Laf
                            if (r11 == 0) goto Lb2
                        Laf:
                            r12.updatePeekHeight()
                        Lb2:
                            return r13
                        */
                        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.internal.ViewUtils.AnonymousClass3.onApplyWindowInsets(android.view.View, androidx.core.view.WindowInsetsCompat):androidx.core.view.WindowInsetsCompat");
                    }
                });
                if (ViewCompat.Api19Impl.isAttachedToWindow(v)) {
                    ViewCompat.Api20Impl.requestApplyInsets(v);
                } else {
                    v.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() { // from class: com.google.android.material.internal.ViewUtils.4
                        @Override // android.view.View.OnAttachStateChangeListener
                        public final void onViewDetachedFromWindow(View view) {
                        }

                        @Override // android.view.View.OnAttachStateChangeListener
                        public final void onViewAttachedToWindow(View view) {
                            view.removeOnAttachStateChangeListener(this);
                            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap2 = ViewCompat.sViewPropertyAnimatorMap;
                            ViewCompat.Api20Impl.requestApplyInsets(view);
                        }
                    });
                }
            }
            this.viewRef = new WeakReference<>(v);
            MaterialShapeDrawable materialShapeDrawable = this.materialShapeDrawable;
            if (materialShapeDrawable != null) {
                ViewCompat.Api16Impl.setBackground(v, materialShapeDrawable);
                MaterialShapeDrawable materialShapeDrawable2 = this.materialShapeDrawable;
                float f2 = this.elevation;
                if (f2 == -1.0f) {
                    f2 = ViewCompat.Api21Impl.getElevation(v);
                }
                materialShapeDrawable2.setElevation(f2);
                if (this.state == 3) {
                    z2 = true;
                } else {
                    z2 = false;
                }
                this.isShapeExpanded = z2;
                MaterialShapeDrawable materialShapeDrawable3 = this.materialShapeDrawable;
                if (z2) {
                    f = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
                } else {
                    f = 1.0f;
                }
                MaterialShapeDrawable.MaterialShapeDrawableState materialShapeDrawableState = materialShapeDrawable3.drawableState;
                if (materialShapeDrawableState.interpolation != f) {
                    materialShapeDrawableState.interpolation = f;
                    materialShapeDrawable3.pathDirty = true;
                    materialShapeDrawable3.invalidateSelf();
                }
            } else {
                ColorStateList colorStateList = this.backgroundTint;
                if (colorStateList != null) {
                    ViewCompat.Api21Impl.setBackgroundTintList(v, colorStateList);
                }
            }
            updateAccessibilityActions$1();
            if (ViewCompat.Api16Impl.getImportantForAccessibility(v) == 0) {
                ViewCompat.Api16Impl.setImportantForAccessibility(v, 1);
            }
        }
        if (this.viewDragHelper == null) {
            this.viewDragHelper = new ViewDragHelper(coordinatorLayout.getContext(), coordinatorLayout, this.dragCallback);
        }
        int top = v.getTop();
        coordinatorLayout.onLayoutChild(v, i);
        this.parentWidth = coordinatorLayout.getWidth();
        this.parentHeight = coordinatorLayout.getHeight();
        int height = v.getHeight();
        this.childHeight = height;
        int i2 = this.parentHeight;
        int i3 = i2 - height;
        int i4 = this.insetTop;
        if (i3 < i4) {
            if (this.paddingTopSystemWindowInsets) {
                this.childHeight = i2;
            } else {
                this.childHeight = i2 - i4;
            }
        }
        this.fitToContentsOffset = Math.max(0, i2 - this.childHeight);
        this.halfExpandedOffset = (int) ((1.0f - this.halfExpandedRatio) * this.parentHeight);
        calculateCollapsedOffset();
        int i5 = this.state;
        if (i5 == 3) {
            v.offsetTopAndBottom(getExpandedOffset());
        } else if (i5 == 6) {
            v.offsetTopAndBottom(this.halfExpandedOffset);
        } else if (this.hideable && i5 == 5) {
            v.offsetTopAndBottom(this.parentHeight);
        } else if (i5 == 4) {
            v.offsetTopAndBottom(this.collapsedOffset);
        } else if (i5 == 1 || i5 == 2) {
            v.offsetTopAndBottom(top - v.getTop());
        }
        this.nestedScrollingChildRef = new WeakReference<>(findScrollingChild(v));
        for (int i6 = 0; i6 < this.callbacks.size(); i6++) {
            this.callbacks.get(i6).getClass();
        }
        return true;
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public final boolean onNestedPreFling(View view) {
        WeakReference<View> weakReference = this.nestedScrollingChildRef;
        if (weakReference == null || view != weakReference.get() || this.state == 3) {
            return false;
        }
        return true;
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public final void onRestoreInstanceState(View view, Parcelable parcelable) {
        SavedState savedState = (SavedState) parcelable;
        int i = this.saveFlags;
        if (i != 0) {
            if (i == -1 || (i & 1) == 1) {
                this.peekHeight = savedState.peekHeight;
            }
            if (i == -1 || (i & 2) == 2) {
                this.fitToContents = savedState.fitToContents;
            }
            if (i == -1 || (i & 4) == 4) {
                this.hideable = savedState.hideable;
            }
            if (i == -1 || (i & 8) == 8) {
                this.skipCollapsed = savedState.skipCollapsed;
            }
        }
        int i2 = savedState.state;
        if (i2 == 1 || i2 == 2) {
            this.state = 4;
        } else {
            this.state = i2;
        }
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public final Parcelable onSaveInstanceState(View view) {
        return new SavedState(View.BaseSavedState.EMPTY_STATE, this);
    }

    public final void setState(int i) {
        if (i != this.state) {
            if (this.viewRef != null) {
                settleToStatePendingLayout(i);
            } else if (i == 4 || i == 3 || i == 6 || (this.hideable && i == 5)) {
                this.state = i;
            }
        }
    }

    public final void setStateInternal(int i) {
        V v;
        if (this.state != i) {
            this.state = i;
            WeakReference<V> weakReference = this.viewRef;
            if (!(weakReference == null || (v = weakReference.get()) == null)) {
                if (i == 3) {
                    updateImportantForAccessibility(true);
                } else if (i == 6 || i == 5 || i == 4) {
                    updateImportantForAccessibility(false);
                }
                updateDrawableForTargetState(i);
                for (int i2 = 0; i2 < this.callbacks.size(); i2++) {
                    this.callbacks.get(i2).onStateChanged(v, i);
                }
                updateAccessibilityActions$1();
            }
        }
    }

    public final void settleToStatePendingLayout(final int i) {
        final V v = this.viewRef.get();
        if (v != null) {
            ViewParent parent = v.getParent();
            if (parent != null && parent.isLayoutRequested()) {
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                if (ViewCompat.Api19Impl.isAttachedToWindow(v)) {
                    v.post(new Runnable() { // from class: com.google.android.material.bottomsheet.BottomSheetBehavior.1
                        @Override // java.lang.Runnable
                        public final void run() {
                            BottomSheetBehavior.this.settleToState(v, i);
                        }
                    });
                    return;
                }
            }
            settleToState(v, i);
        }
    }

    public final boolean shouldHide(View view, float f) {
        if (this.skipCollapsed) {
            return true;
        }
        if (view.getTop() < this.collapsedOffset) {
            return false;
        }
        if (Math.abs(((f * 0.1f) + view.getTop()) - this.collapsedOffset) / calculatePeekHeight() > 0.5f) {
            return true;
        }
        return false;
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x002d, code lost:
        if (r7 != false) goto L15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x002f, code lost:
        r2 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:6:0x0010, code lost:
        if (r0.settleCapturedViewAt(r5.getLeft(), r7) != false) goto L15;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void startSettlingAnimation(android.view.View r5, int r6, int r7, boolean r8) {
        /*
            r4 = this;
            androidx.customview.widget.ViewDragHelper r0 = r4.viewDragHelper
            r1 = 1
            r2 = 0
            if (r0 == 0) goto L30
            if (r8 == 0) goto L13
            int r8 = r5.getLeft()
            boolean r7 = r0.settleCapturedViewAt(r8, r7)
            if (r7 == 0) goto L30
            goto L2f
        L13:
            int r8 = r5.getLeft()
            r0.mCapturedView = r5
            r3 = -1
            r0.mActivePointerId = r3
            boolean r7 = r0.forceSettleCapturedViewAt(r8, r7, r2, r2)
            if (r7 != 0) goto L2d
            int r8 = r0.mDragState
            if (r8 != 0) goto L2d
            android.view.View r8 = r0.mCapturedView
            if (r8 == 0) goto L2d
            r8 = 0
            r0.mCapturedView = r8
        L2d:
            if (r7 == 0) goto L30
        L2f:
            r2 = r1
        L30:
            if (r2 == 0) goto L59
            r7 = 2
            r4.setStateInternal(r7)
            r4.updateDrawableForTargetState(r6)
            com.google.android.material.bottomsheet.BottomSheetBehavior<V>$SettleRunnable r7 = r4.settleRunnable
            if (r7 != 0) goto L44
            com.google.android.material.bottomsheet.BottomSheetBehavior$SettleRunnable r7 = new com.google.android.material.bottomsheet.BottomSheetBehavior$SettleRunnable
            r7.<init>(r5, r6)
            r4.settleRunnable = r7
        L44:
            com.google.android.material.bottomsheet.BottomSheetBehavior<V>$SettleRunnable r7 = r4.settleRunnable
            boolean r8 = r7.isPosted
            if (r8 != 0) goto L56
            r7.targetState = r6
            java.util.WeakHashMap<android.view.View, androidx.core.view.ViewPropertyAnimatorCompat> r6 = androidx.core.view.ViewCompat.sViewPropertyAnimatorMap
            androidx.core.view.ViewCompat.Api16Impl.postOnAnimation(r5, r7)
            com.google.android.material.bottomsheet.BottomSheetBehavior<V>$SettleRunnable r4 = r4.settleRunnable
            r4.isPosted = r1
            goto L5c
        L56:
            r7.targetState = r6
            goto L5c
        L59:
            r4.setStateInternal(r6)
        L5c:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.bottomsheet.BottomSheetBehavior.startSettlingAnimation(android.view.View, int, int, boolean):void");
    }

    public final void updateAccessibilityActions$1() {
        V v;
        int i;
        boolean z;
        AccessibilityDelegateCompat accessibilityDelegateCompat;
        WeakReference<V> weakReference = this.viewRef;
        if (weakReference != null && (v = weakReference.get()) != null) {
            ViewCompat.removeActionWithId(QuickStepContract.SYSUI_STATE_MAGNIFICATION_OVERLAP, v);
            ViewCompat.notifyViewAccessibilityStateChangedIfNeeded(v, 0);
            ViewCompat.removeActionWithId(QuickStepContract.SYSUI_STATE_IME_SHOWING, v);
            ViewCompat.notifyViewAccessibilityStateChangedIfNeeded(v, 0);
            ViewCompat.removeActionWithId(QuickStepContract.SYSUI_STATE_IME_SWITCHER_SHOWING, v);
            ViewCompat.notifyViewAccessibilityStateChangedIfNeeded(v, 0);
            int i2 = this.expandHalfwayActionId;
            if (i2 != -1) {
                ViewCompat.removeActionWithId(i2, v);
                ViewCompat.notifyViewAccessibilityStateChangedIfNeeded(v, 0);
            }
            final int i3 = 6;
            if (!this.fitToContents && this.state != 6) {
                String string = v.getResources().getString(R.string.bottomsheet_action_expand_halfway);
                AccessibilityViewCommand accessibilityViewCommand = new AccessibilityViewCommand() { // from class: com.google.android.material.bottomsheet.BottomSheetBehavior.5
                    @Override // androidx.core.view.accessibility.AccessibilityViewCommand
                    public final boolean perform(View view) {
                        BottomSheetBehavior.this.setState(r2);
                        return true;
                    }
                };
                ArrayList actionList = ViewCompat.getActionList(v);
                int i4 = 0;
                while (true) {
                    if (i4 >= actionList.size()) {
                        int i5 = 0;
                        int i6 = -1;
                        while (true) {
                            int[] iArr = ViewCompat.ACCESSIBILITY_ACTIONS_RESOURCE_IDS;
                            if (i5 >= iArr.length || i6 != -1) {
                                break;
                            }
                            int i7 = iArr[i5];
                            boolean z2 = true;
                            for (int i8 = 0; i8 < actionList.size(); i8++) {
                                if (((AccessibilityNodeInfoCompat.AccessibilityActionCompat) actionList.get(i8)).getId() != i7) {
                                    z = true;
                                } else {
                                    z = false;
                                }
                                z2 &= z;
                            }
                            if (z2) {
                                i6 = i7;
                            }
                            i5++;
                        }
                        i = i6;
                    } else if (TextUtils.equals(string, ((AccessibilityNodeInfo.AccessibilityAction) ((AccessibilityNodeInfoCompat.AccessibilityActionCompat) actionList.get(i4)).mAction).getLabel())) {
                        i = ((AccessibilityNodeInfoCompat.AccessibilityActionCompat) actionList.get(i4)).getId();
                        break;
                    } else {
                        i4++;
                    }
                }
                if (i != -1) {
                    AccessibilityNodeInfoCompat.AccessibilityActionCompat accessibilityActionCompat = new AccessibilityNodeInfoCompat.AccessibilityActionCompat(null, i, string, accessibilityViewCommand, null);
                    View.AccessibilityDelegate accessibilityDelegate = ViewCompat.Api29Impl.getAccessibilityDelegate(v);
                    if (accessibilityDelegate == null) {
                        accessibilityDelegateCompat = null;
                    } else if (accessibilityDelegate instanceof AccessibilityDelegateCompat.AccessibilityDelegateAdapter) {
                        accessibilityDelegateCompat = ((AccessibilityDelegateCompat.AccessibilityDelegateAdapter) accessibilityDelegate).mCompat;
                    } else {
                        accessibilityDelegateCompat = new AccessibilityDelegateCompat(accessibilityDelegate);
                    }
                    if (accessibilityDelegateCompat == null) {
                        accessibilityDelegateCompat = new AccessibilityDelegateCompat();
                    }
                    ViewCompat.setAccessibilityDelegate(v, accessibilityDelegateCompat);
                    ViewCompat.removeActionWithId(accessibilityActionCompat.getId(), v);
                    ViewCompat.getActionList(v).add(accessibilityActionCompat);
                    ViewCompat.notifyViewAccessibilityStateChangedIfNeeded(v, 0);
                }
                this.expandHalfwayActionId = i;
            }
            if (this.hideable && this.state != 5) {
                ViewCompat.replaceAccessibilityAction(v, AccessibilityNodeInfoCompat.AccessibilityActionCompat.ACTION_DISMISS, new AccessibilityViewCommand() { // from class: com.google.android.material.bottomsheet.BottomSheetBehavior.5
                    @Override // androidx.core.view.accessibility.AccessibilityViewCommand
                    public final boolean perform(View view) {
                        BottomSheetBehavior.this.setState(r2);
                        return true;
                    }
                });
            }
            int i9 = this.state;
            if (i9 == 3) {
                if (this.fitToContents) {
                    i3 = 4;
                }
                ViewCompat.replaceAccessibilityAction(v, AccessibilityNodeInfoCompat.AccessibilityActionCompat.ACTION_COLLAPSE, new AccessibilityViewCommand() { // from class: com.google.android.material.bottomsheet.BottomSheetBehavior.5
                    @Override // androidx.core.view.accessibility.AccessibilityViewCommand
                    public final boolean perform(View view) {
                        BottomSheetBehavior.this.setState(i3);
                        return true;
                    }
                });
            } else if (i9 == 4) {
                if (this.fitToContents) {
                    i3 = 3;
                }
                ViewCompat.replaceAccessibilityAction(v, AccessibilityNodeInfoCompat.AccessibilityActionCompat.ACTION_EXPAND, new AccessibilityViewCommand() { // from class: com.google.android.material.bottomsheet.BottomSheetBehavior.5
                    @Override // androidx.core.view.accessibility.AccessibilityViewCommand
                    public final boolean perform(View view) {
                        BottomSheetBehavior.this.setState(i3);
                        return true;
                    }
                });
            } else if (i9 == 6) {
                ViewCompat.replaceAccessibilityAction(v, AccessibilityNodeInfoCompat.AccessibilityActionCompat.ACTION_COLLAPSE, new AccessibilityViewCommand() { // from class: com.google.android.material.bottomsheet.BottomSheetBehavior.5
                    @Override // androidx.core.view.accessibility.AccessibilityViewCommand
                    public final boolean perform(View view) {
                        BottomSheetBehavior.this.setState(i3);
                        return true;
                    }
                });
                ViewCompat.replaceAccessibilityAction(v, AccessibilityNodeInfoCompat.AccessibilityActionCompat.ACTION_EXPAND, new AccessibilityViewCommand() { // from class: com.google.android.material.bottomsheet.BottomSheetBehavior.5
                    @Override // androidx.core.view.accessibility.AccessibilityViewCommand
                    public final boolean perform(View view) {
                        BottomSheetBehavior.this.setState(i3);
                        return true;
                    }
                });
            }
        }
    }

    public final void updateImportantForAccessibility(boolean z) {
        WeakReference<V> weakReference = this.viewRef;
        if (weakReference != null) {
            ViewParent parent = weakReference.get().getParent();
            if (parent instanceof CoordinatorLayout) {
                CoordinatorLayout coordinatorLayout = (CoordinatorLayout) parent;
                int childCount = coordinatorLayout.getChildCount();
                if (z) {
                    if (this.importantForAccessibilityMap == null) {
                        this.importantForAccessibilityMap = new HashMap(childCount);
                    } else {
                        return;
                    }
                }
                for (int i = 0; i < childCount; i++) {
                    View childAt = coordinatorLayout.getChildAt(i);
                    if (childAt != this.viewRef.get() && z) {
                        this.importantForAccessibilityMap.put(childAt, Integer.valueOf(childAt.getImportantForAccessibility()));
                    }
                }
                if (!z) {
                    this.importantForAccessibilityMap = null;
                }
            }
        }
    }

    public final void updatePeekHeight() {
        V v;
        if (this.viewRef != null) {
            calculateCollapsedOffset();
            if (this.state == 4 && (v = this.viewRef.get()) != null) {
                v.requestLayout();
            }
        }
    }

    public static int getChildMeasureSpec(int i, int i2, int i3, int i4) {
        int childMeasureSpec = ViewGroup.getChildMeasureSpec(i, i2, i4);
        if (i3 == -1) {
            return childMeasureSpec;
        }
        int mode = View.MeasureSpec.getMode(childMeasureSpec);
        int size = View.MeasureSpec.getSize(childMeasureSpec);
        if (mode == 1073741824) {
            return View.MeasureSpec.makeMeasureSpec(Math.min(size, i3), IntMath.MAX_SIGNED_POWER_OF_TWO);
        }
        if (size != 0) {
            i3 = Math.min(size, i3);
        }
        return View.MeasureSpec.makeMeasureSpec(i3, RecyclerView.UNDEFINED_DURATION);
    }

    public final void calculateCollapsedOffset() {
        int calculatePeekHeight = calculatePeekHeight();
        if (this.fitToContents) {
            this.collapsedOffset = Math.max(this.parentHeight - calculatePeekHeight, this.fitToContentsOffset);
        } else {
            this.collapsedOffset = this.parentHeight - calculatePeekHeight;
        }
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public final boolean onInterceptTouchEvent(CoordinatorLayout coordinatorLayout, V v, MotionEvent motionEvent) {
        ViewDragHelper viewDragHelper;
        boolean z;
        View view;
        if (!v.isShown() || !this.draggable) {
            this.ignoreEvents = true;
            return false;
        }
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 0) {
            reset$1();
        }
        if (this.velocityTracker == null) {
            this.velocityTracker = VelocityTracker.obtain();
        }
        this.velocityTracker.addMovement(motionEvent);
        View view2 = null;
        if (actionMasked == 0) {
            int x = (int) motionEvent.getX();
            this.initialY = (int) motionEvent.getY();
            if (this.state != 2) {
                WeakReference<View> weakReference = this.nestedScrollingChildRef;
                if (weakReference != null) {
                    view = weakReference.get();
                } else {
                    view = null;
                }
                if (view != null && coordinatorLayout.isPointInChildBounds(view, x, this.initialY)) {
                    this.activePointerId = motionEvent.getPointerId(motionEvent.getActionIndex());
                    this.touchingScrollingChild = true;
                }
            }
            if (this.activePointerId != -1 || coordinatorLayout.isPointInChildBounds(v, x, this.initialY)) {
                z = false;
            } else {
                z = true;
            }
            this.ignoreEvents = z;
        } else if (actionMasked == 1 || actionMasked == 3) {
            this.touchingScrollingChild = false;
            this.activePointerId = -1;
            if (this.ignoreEvents) {
                this.ignoreEvents = false;
                return false;
            }
        }
        if (!this.ignoreEvents && (viewDragHelper = this.viewDragHelper) != null && viewDragHelper.shouldInterceptTouchEvent(motionEvent)) {
            return true;
        }
        WeakReference<View> weakReference2 = this.nestedScrollingChildRef;
        if (weakReference2 != null) {
            view2 = weakReference2.get();
        }
        if (actionMasked != 2 || view2 == null || this.ignoreEvents || this.state == 1 || coordinatorLayout.isPointInChildBounds(view2, (int) motionEvent.getX(), (int) motionEvent.getY()) || this.viewDragHelper == null || Math.abs(this.initialY - motionEvent.getY()) <= this.viewDragHelper.mTouchSlop) {
            return false;
        }
        return true;
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public final boolean onMeasureChild(CoordinatorLayout coordinatorLayout, View view, int i, int i2, int i3) {
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
        view.measure(getChildMeasureSpec(i, coordinatorLayout.getPaddingRight() + coordinatorLayout.getPaddingLeft() + marginLayoutParams.leftMargin + marginLayoutParams.rightMargin + i2, this.maxWidth, marginLayoutParams.width), getChildMeasureSpec(i3, coordinatorLayout.getPaddingBottom() + coordinatorLayout.getPaddingTop() + marginLayoutParams.topMargin + marginLayoutParams.bottomMargin + 0, this.maxHeight, marginLayoutParams.height));
        return true;
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public final void onStopNestedScroll(CoordinatorLayout coordinatorLayout, V v, View view, int i) {
        int i2;
        float f;
        int i3 = 3;
        if (v.getTop() == getExpandedOffset()) {
            setStateInternal(3);
            return;
        }
        WeakReference<View> weakReference = this.nestedScrollingChildRef;
        if (weakReference != null && view == weakReference.get() && this.nestedScrolled) {
            if (this.lastNestedScrollDy > 0) {
                if (this.fitToContents) {
                    i2 = this.fitToContentsOffset;
                } else {
                    int top = v.getTop();
                    int i4 = this.halfExpandedOffset;
                    if (top > i4) {
                        i2 = i4;
                        i3 = 6;
                    } else {
                        i2 = getExpandedOffset();
                    }
                }
                startSettlingAnimation(v, i3, i2, false);
                this.nestedScrolled = false;
            }
            if (this.hideable) {
                VelocityTracker velocityTracker = this.velocityTracker;
                if (velocityTracker == null) {
                    f = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
                } else {
                    velocityTracker.computeCurrentVelocity(1000, this.maximumVelocity);
                    f = this.velocityTracker.getYVelocity(this.activePointerId);
                }
                if (shouldHide(v, f)) {
                    i2 = this.parentHeight;
                    i3 = 5;
                    startSettlingAnimation(v, i3, i2, false);
                    this.nestedScrolled = false;
                }
            }
            if (this.lastNestedScrollDy == 0) {
                int top2 = v.getTop();
                if (!this.fitToContents) {
                    int i5 = this.halfExpandedOffset;
                    if (top2 < i5) {
                        if (top2 < Math.abs(top2 - this.collapsedOffset)) {
                            i2 = getExpandedOffset();
                        } else {
                            i2 = this.halfExpandedOffset;
                        }
                    } else if (Math.abs(top2 - i5) < Math.abs(top2 - this.collapsedOffset)) {
                        i2 = this.halfExpandedOffset;
                    } else {
                        i2 = this.collapsedOffset;
                        i3 = 4;
                    }
                    i3 = 6;
                } else if (Math.abs(top2 - this.fitToContentsOffset) < Math.abs(top2 - this.collapsedOffset)) {
                    i2 = this.fitToContentsOffset;
                } else {
                    i2 = this.collapsedOffset;
                    i3 = 4;
                }
            } else {
                if (this.fitToContents) {
                    i2 = this.collapsedOffset;
                } else {
                    int top3 = v.getTop();
                    if (Math.abs(top3 - this.halfExpandedOffset) < Math.abs(top3 - this.collapsedOffset)) {
                        i2 = this.halfExpandedOffset;
                        i3 = 6;
                    } else {
                        i2 = this.collapsedOffset;
                    }
                }
                i3 = 4;
            }
            startSettlingAnimation(v, i3, i2, false);
            this.nestedScrolled = false;
        }
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public final boolean onTouchEvent(CoordinatorLayout coordinatorLayout, V v, MotionEvent motionEvent) {
        boolean z;
        boolean z2 = false;
        if (!v.isShown()) {
            return false;
        }
        int actionMasked = motionEvent.getActionMasked();
        int i = this.state;
        if (i == 1 && actionMasked == 0) {
            return true;
        }
        ViewDragHelper viewDragHelper = this.viewDragHelper;
        if (viewDragHelper == null || (!this.draggable && i != 1)) {
            z = false;
        } else {
            z = true;
        }
        if (z) {
            viewDragHelper.processTouchEvent(motionEvent);
        }
        if (actionMasked == 0) {
            reset$1();
        }
        if (this.velocityTracker == null) {
            this.velocityTracker = VelocityTracker.obtain();
        }
        this.velocityTracker.addMovement(motionEvent);
        if (this.viewDragHelper != null && (this.draggable || this.state == 1)) {
            z2 = true;
        }
        if (z2 && actionMasked == 2 && !this.ignoreEvents) {
            float abs = Math.abs(this.initialY - motionEvent.getY());
            ViewDragHelper viewDragHelper2 = this.viewDragHelper;
            if (abs > viewDragHelper2.mTouchSlop) {
                viewDragHelper2.captureChildView(v, motionEvent.getPointerId(motionEvent.getActionIndex()));
            }
        }
        return !this.ignoreEvents;
    }

    /* JADX WARN: Type inference failed for: r6v1, types: [com.google.android.material.bottomsheet.BottomSheetBehavior$4] */
    public BottomSheetBehavior(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        int i;
        this.saveFlags = 0;
        this.fitToContents = true;
        this.maxWidth = -1;
        this.maxHeight = -1;
        this.settleRunnable = null;
        this.halfExpandedRatio = 0.5f;
        this.elevation = -1.0f;
        this.draggable = true;
        this.state = 4;
        this.callbacks = new ArrayList<>();
        this.expandHalfwayActionId = -1;
        this.dragCallback = new ViewDragHelper.Callback() { // from class: com.google.android.material.bottomsheet.BottomSheetBehavior.4
            @Override // androidx.customview.widget.ViewDragHelper.Callback
            public final void onViewDragStateChanged(int i2) {
                if (i2 == 1) {
                    BottomSheetBehavior bottomSheetBehavior = BottomSheetBehavior.this;
                    if (bottomSheetBehavior.draggable) {
                        bottomSheetBehavior.setStateInternal(1);
                    }
                }
            }

            @Override // androidx.customview.widget.ViewDragHelper.Callback
            public final void onViewReleased(View view, float f, float f2) {
                int i2;
                int i22;
                boolean z;
                int i3 = 4;
                if (f2 < HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                    BottomSheetBehavior bottomSheetBehavior = BottomSheetBehavior.this;
                    if (bottomSheetBehavior.fitToContents) {
                        i2 = bottomSheetBehavior.fitToContentsOffset;
                    } else {
                        int top = view.getTop();
                        System.currentTimeMillis();
                        BottomSheetBehavior.this.getClass();
                        BottomSheetBehavior bottomSheetBehavior2 = BottomSheetBehavior.this;
                        i22 = bottomSheetBehavior2.halfExpandedOffset;
                        if (top <= i22) {
                            i2 = bottomSheetBehavior2.getExpandedOffset();
                        }
                        i3 = 6;
                        i2 = i22;
                    }
                    i3 = 3;
                } else {
                    BottomSheetBehavior bottomSheetBehavior3 = BottomSheetBehavior.this;
                    if (bottomSheetBehavior3.hideable && bottomSheetBehavior3.shouldHide(view, f2)) {
                        if (Math.abs(f) >= Math.abs(f2) || f2 <= 500.0f) {
                            int top2 = view.getTop();
                            BottomSheetBehavior bottomSheetBehavior4 = BottomSheetBehavior.this;
                            if (top2 > (bottomSheetBehavior4.getExpandedOffset() + bottomSheetBehavior4.parentHeight) / 2) {
                                z = true;
                            } else {
                                z = false;
                            }
                            if (!z) {
                                BottomSheetBehavior bottomSheetBehavior5 = BottomSheetBehavior.this;
                                if (bottomSheetBehavior5.fitToContents) {
                                    i2 = bottomSheetBehavior5.fitToContentsOffset;
                                } else if (Math.abs(view.getTop() - BottomSheetBehavior.this.getExpandedOffset()) < Math.abs(view.getTop() - BottomSheetBehavior.this.halfExpandedOffset)) {
                                    i2 = BottomSheetBehavior.this.getExpandedOffset();
                                } else {
                                    i22 = BottomSheetBehavior.this.halfExpandedOffset;
                                    i3 = 6;
                                    i2 = i22;
                                }
                                i3 = 3;
                            }
                        }
                        i2 = BottomSheetBehavior.this.parentHeight;
                        i3 = 5;
                    } else if (f2 == HingeAngleProviderKt.FULLY_CLOSED_DEGREES || Math.abs(f) > Math.abs(f2)) {
                        int top3 = view.getTop();
                        BottomSheetBehavior bottomSheetBehavior6 = BottomSheetBehavior.this;
                        if (!bottomSheetBehavior6.fitToContents) {
                            int i4 = bottomSheetBehavior6.halfExpandedOffset;
                            if (top3 < i4) {
                                if (top3 < Math.abs(top3 - bottomSheetBehavior6.collapsedOffset)) {
                                    i2 = BottomSheetBehavior.this.getExpandedOffset();
                                    i3 = 3;
                                } else {
                                    BottomSheetBehavior.this.getClass();
                                    i22 = BottomSheetBehavior.this.halfExpandedOffset;
                                }
                            } else if (Math.abs(top3 - i4) < Math.abs(top3 - BottomSheetBehavior.this.collapsedOffset)) {
                                BottomSheetBehavior.this.getClass();
                                i22 = BottomSheetBehavior.this.halfExpandedOffset;
                            } else {
                                i2 = BottomSheetBehavior.this.collapsedOffset;
                            }
                            i3 = 6;
                            i2 = i22;
                        } else if (Math.abs(top3 - bottomSheetBehavior6.fitToContentsOffset) < Math.abs(top3 - BottomSheetBehavior.this.collapsedOffset)) {
                            i2 = BottomSheetBehavior.this.fitToContentsOffset;
                            i3 = 3;
                        } else {
                            i2 = BottomSheetBehavior.this.collapsedOffset;
                        }
                    } else {
                        BottomSheetBehavior bottomSheetBehavior7 = BottomSheetBehavior.this;
                        if (bottomSheetBehavior7.fitToContents) {
                            i2 = bottomSheetBehavior7.collapsedOffset;
                        } else {
                            int top4 = view.getTop();
                            if (Math.abs(top4 - BottomSheetBehavior.this.halfExpandedOffset) < Math.abs(top4 - BottomSheetBehavior.this.collapsedOffset)) {
                                BottomSheetBehavior.this.getClass();
                                i22 = BottomSheetBehavior.this.halfExpandedOffset;
                                i3 = 6;
                                i2 = i22;
                            } else {
                                i2 = BottomSheetBehavior.this.collapsedOffset;
                            }
                        }
                    }
                }
                BottomSheetBehavior bottomSheetBehavior8 = BottomSheetBehavior.this;
                bottomSheetBehavior8.getClass();
                bottomSheetBehavior8.startSettlingAnimation(view, i3, i2, true);
            }

            @Override // androidx.customview.widget.ViewDragHelper.Callback
            public final int clampViewPositionVertical(View view, int i2) {
                int i22;
                int expandedOffset = BottomSheetBehavior.this.getExpandedOffset();
                BottomSheetBehavior bottomSheetBehavior = BottomSheetBehavior.this;
                if (bottomSheetBehavior.hideable) {
                    i22 = bottomSheetBehavior.parentHeight;
                } else {
                    i22 = bottomSheetBehavior.collapsedOffset;
                }
                return MathUtils.clamp(i2, expandedOffset, i22);
            }

            @Override // androidx.customview.widget.ViewDragHelper.Callback
            public final int getViewVerticalDragRange() {
                BottomSheetBehavior bottomSheetBehavior = BottomSheetBehavior.this;
                if (bottomSheetBehavior.hideable) {
                    return bottomSheetBehavior.parentHeight;
                }
                return bottomSheetBehavior.collapsedOffset;
            }

            @Override // androidx.customview.widget.ViewDragHelper.Callback
            public final void onViewPositionChanged(View view, int i2, int i22) {
                BottomSheetBehavior.this.dispatchOnSlide(i22);
            }

            @Override // androidx.customview.widget.ViewDragHelper.Callback
            public final boolean tryCaptureView(View view, int i2) {
                View view2;
                BottomSheetBehavior bottomSheetBehavior = BottomSheetBehavior.this;
                int i22 = bottomSheetBehavior.state;
                if (i22 == 1 || bottomSheetBehavior.touchingScrollingChild) {
                    return false;
                }
                if (i22 == 3 && bottomSheetBehavior.activePointerId == i2) {
                    WeakReference<View> weakReference = bottomSheetBehavior.nestedScrollingChildRef;
                    if (weakReference != null) {
                        view2 = weakReference.get();
                    } else {
                        view2 = null;
                    }
                    if (view2 != null && view2.canScrollVertically(-1)) {
                        return false;
                    }
                }
                System.currentTimeMillis();
                WeakReference<V> weakReference2 = BottomSheetBehavior.this.viewRef;
                if (weakReference2 == null || weakReference2.get() != view) {
                    return false;
                }
                return true;
            }

            @Override // androidx.customview.widget.ViewDragHelper.Callback
            public final int clampViewPositionHorizontal(View view, int i2) {
                return view.getLeft();
            }
        };
        this.peekHeightGestureInsetBuffer = context.getResources().getDimensionPixelSize(R.dimen.mtrl_min_touch_target_size);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R$styleable.BottomSheetBehavior_Layout);
        int i2 = 3;
        if (obtainStyledAttributes.hasValue(3)) {
            this.backgroundTint = MaterialResources.getColorStateList(context, obtainStyledAttributes, 3);
        }
        if (obtainStyledAttributes.hasValue(20)) {
            this.shapeAppearanceModelDefault = new ShapeAppearanceModel(ShapeAppearanceModel.builder(context, attributeSet, (int) R.attr.bottomSheetStyle, (int) R.style.Widget_Design_BottomSheet_Modal));
        }
        if (this.shapeAppearanceModelDefault != null) {
            MaterialShapeDrawable materialShapeDrawable = new MaterialShapeDrawable(this.shapeAppearanceModelDefault);
            this.materialShapeDrawable = materialShapeDrawable;
            materialShapeDrawable.initializeElevationOverlay(context);
            ColorStateList colorStateList = this.backgroundTint;
            if (colorStateList != null) {
                this.materialShapeDrawable.setFillColor(colorStateList);
            } else {
                TypedValue typedValue = new TypedValue();
                context.getTheme().resolveAttribute(16842801, typedValue, true);
                this.materialShapeDrawable.setTint(typedValue.data);
            }
        }
        ValueAnimator ofFloat = ValueAnimator.ofFloat(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 1.0f);
        this.interpolatorAnimator = ofFloat;
        ofFloat.setDuration(500L);
        this.interpolatorAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.google.android.material.bottomsheet.BottomSheetBehavior.2
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                float floatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                MaterialShapeDrawable materialShapeDrawable2 = BottomSheetBehavior.this.materialShapeDrawable;
                if (materialShapeDrawable2 != null) {
                    MaterialShapeDrawable.MaterialShapeDrawableState materialShapeDrawableState = materialShapeDrawable2.drawableState;
                    if (materialShapeDrawableState.interpolation != floatValue) {
                        materialShapeDrawableState.interpolation = floatValue;
                        materialShapeDrawable2.pathDirty = true;
                        materialShapeDrawable2.invalidateSelf();
                    }
                }
            }
        });
        this.elevation = obtainStyledAttributes.getDimension(2, -1.0f);
        if (obtainStyledAttributes.hasValue(0)) {
            this.maxWidth = obtainStyledAttributes.getDimensionPixelSize(0, -1);
        }
        if (obtainStyledAttributes.hasValue(1)) {
            this.maxHeight = obtainStyledAttributes.getDimensionPixelSize(1, -1);
        }
        TypedValue peekValue = obtainStyledAttributes.peekValue(9);
        if (peekValue == null || (i = peekValue.data) != -1) {
            setPeekHeight(obtainStyledAttributes.getDimensionPixelSize(9, -1));
        } else {
            setPeekHeight(i);
        }
        boolean z = obtainStyledAttributes.getBoolean(8, false);
        if (this.hideable != z) {
            this.hideable = z;
            if (!z && this.state == 5) {
                setState(4);
            }
            updateAccessibilityActions$1();
        }
        this.gestureInsetBottomIgnored = obtainStyledAttributes.getBoolean(12, false);
        boolean z2 = obtainStyledAttributes.getBoolean(6, true);
        if (this.fitToContents != z2) {
            this.fitToContents = z2;
            if (this.viewRef != null) {
                calculateCollapsedOffset();
            }
            setStateInternal((!this.fitToContents || this.state != 6) ? this.state : i2);
            updateAccessibilityActions$1();
        }
        this.skipCollapsed = obtainStyledAttributes.getBoolean(11, false);
        this.draggable = obtainStyledAttributes.getBoolean(4, true);
        this.saveFlags = obtainStyledAttributes.getInt(10, 0);
        float f = obtainStyledAttributes.getFloat(7, 0.5f);
        if (f <= HingeAngleProviderKt.FULLY_CLOSED_DEGREES || f >= 1.0f) {
            throw new IllegalArgumentException("ratio must be a float value between 0 and 1");
        }
        this.halfExpandedRatio = f;
        if (this.viewRef != null) {
            this.halfExpandedOffset = (int) ((1.0f - f) * this.parentHeight);
        }
        TypedValue peekValue2 = obtainStyledAttributes.peekValue(5);
        if (peekValue2 == null || peekValue2.type != 16) {
            int dimensionPixelOffset = obtainStyledAttributes.getDimensionPixelOffset(5, 0);
            if (dimensionPixelOffset >= 0) {
                this.expandedOffset = dimensionPixelOffset;
            } else {
                throw new IllegalArgumentException("offset must be greater than or equal to 0");
            }
        } else {
            int i3 = peekValue2.data;
            if (i3 >= 0) {
                this.expandedOffset = i3;
            } else {
                throw new IllegalArgumentException("offset must be greater than or equal to 0");
            }
        }
        this.paddingBottomSystemWindowInsets = obtainStyledAttributes.getBoolean(16, false);
        this.paddingLeftSystemWindowInsets = obtainStyledAttributes.getBoolean(17, false);
        this.paddingRightSystemWindowInsets = obtainStyledAttributes.getBoolean(18, false);
        this.paddingTopSystemWindowInsets = obtainStyledAttributes.getBoolean(19, true);
        this.marginLeftSystemWindowInsets = obtainStyledAttributes.getBoolean(13, false);
        this.marginRightSystemWindowInsets = obtainStyledAttributes.getBoolean(14, false);
        this.marginTopSystemWindowInsets = obtainStyledAttributes.getBoolean(15, false);
        obtainStyledAttributes.recycle();
        this.maximumVelocity = ViewConfiguration.get(context).getScaledMaximumFlingVelocity();
    }

    public int getPeekHeightMin() {
        return this.peekHeightMin;
    }
}
