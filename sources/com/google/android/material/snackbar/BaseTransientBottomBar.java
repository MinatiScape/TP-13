package com.google.android.material.snackbar;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ValueAnimator;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityManager;
import android.widget.FrameLayout;
import androidx.appcompat.R$bool;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.core.view.AccessibilityDelegateCompat;
import androidx.core.view.OnApplyWindowInsetsListener;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.core.view.accessibility.AccessibilityNodeInfoCompat;
import com.android.systemui.shared.R;
import com.android.systemui.shared.system.QuickStepContract;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.android.material.R$styleable;
import com.google.android.material.animation.AnimationUtils;
import com.google.android.material.behavior.SwipeDismissBehavior;
import com.google.android.material.internal.ThemeEnforcement;
import com.google.android.material.internal.ViewUtils;
import com.google.android.material.resources.MaterialResources;
import com.google.android.material.snackbar.BaseTransientBottomBar;
import com.google.android.material.snackbar.SnackbarManager;
import com.google.android.material.theme.overlay.MaterialThemeOverlay;
import com.google.common.math.IntMath;
import java.util.List;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public abstract class BaseTransientBottomBar<B extends BaseTransientBottomBar<B>> {
    public static final int[] SNACKBAR_STYLE_ATTR = {R.attr.snackbarStyle};
    public static final Handler handler = new Handler(Looper.getMainLooper(), new Handler.Callback() { // from class: com.google.android.material.snackbar.BaseTransientBottomBar.1
        @Override // android.os.Handler.Callback
        public final boolean handleMessage(Message message) {
            boolean z;
            List<AccessibilityServiceInfo> enabledAccessibilityServiceList;
            int i = message.what;
            if (i == 0) {
                BaseTransientBottomBar baseTransientBottomBar = (BaseTransientBottomBar) message.obj;
                if (baseTransientBottomBar.view.getParent() == null) {
                    ViewGroup.LayoutParams layoutParams = baseTransientBottomBar.view.getLayoutParams();
                    if (layoutParams instanceof CoordinatorLayout.LayoutParams) {
                        CoordinatorLayout.LayoutParams layoutParams2 = (CoordinatorLayout.LayoutParams) layoutParams;
                        Behavior behavior = new Behavior();
                        BehaviorDelegate behaviorDelegate = behavior.delegate;
                        behaviorDelegate.getClass();
                        behaviorDelegate.managerCallback = baseTransientBottomBar.managerCallback;
                        behavior.listener = new AnonymousClass7();
                        layoutParams2.setBehavior(behavior);
                        layoutParams2.insetEdge = 80;
                    }
                    baseTransientBottomBar.targetParent.addView(baseTransientBottomBar.view);
                    baseTransientBottomBar.updateMargins();
                    baseTransientBottomBar.view.setVisibility(4);
                }
                SnackbarBaseLayout snackbarBaseLayout = baseTransientBottomBar.view;
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                if (ViewCompat.Api19Impl.isLaidOut(snackbarBaseLayout)) {
                    baseTransientBottomBar.showViewImpl();
                } else {
                    baseTransientBottomBar.pendingShowingView = true;
                }
                return true;
            } else if (i != 1) {
                return false;
            } else {
                final BaseTransientBottomBar baseTransientBottomBar2 = (BaseTransientBottomBar) message.obj;
                final int i2 = message.arg1;
                AccessibilityManager accessibilityManager = baseTransientBottomBar2.accessibilityManager;
                if (accessibilityManager != null && ((enabledAccessibilityServiceList = accessibilityManager.getEnabledAccessibilityServiceList(1)) == null || !enabledAccessibilityServiceList.isEmpty())) {
                    z = false;
                } else {
                    z = true;
                }
                if (!z || baseTransientBottomBar2.view.getVisibility() != 0) {
                    baseTransientBottomBar2.onViewHidden();
                } else if (baseTransientBottomBar2.view.animationMode == 1) {
                    ValueAnimator ofFloat = ValueAnimator.ofFloat(1.0f, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                    ofFloat.setInterpolator(AnimationUtils.LINEAR_INTERPOLATOR);
                    ofFloat.addUpdateListener(new AnonymousClass11());
                    ofFloat.setDuration(75L);
                    ofFloat.addListener(new AnimatorListenerAdapter() { // from class: com.google.android.material.snackbar.BaseTransientBottomBar.10
                        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                        public final void onAnimationEnd(Animator animator) {
                            BaseTransientBottomBar.this.onViewHidden();
                        }
                    });
                    ofFloat.start();
                } else {
                    ValueAnimator valueAnimator = new ValueAnimator();
                    int[] iArr = new int[2];
                    iArr[0] = 0;
                    int height = baseTransientBottomBar2.view.getHeight();
                    ViewGroup.LayoutParams layoutParams3 = baseTransientBottomBar2.view.getLayoutParams();
                    if (layoutParams3 instanceof ViewGroup.MarginLayoutParams) {
                        height += ((ViewGroup.MarginLayoutParams) layoutParams3).bottomMargin;
                    }
                    iArr[1] = height;
                    valueAnimator.setIntValues(iArr);
                    valueAnimator.setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR);
                    valueAnimator.setDuration(250L);
                    valueAnimator.addListener(new AnimatorListenerAdapter() { // from class: com.google.android.material.snackbar.BaseTransientBottomBar.15
                        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                        public final void onAnimationEnd(Animator animator) {
                            BaseTransientBottomBar.this.onViewHidden();
                        }

                        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                        public final void onAnimationStart(Animator animator) {
                            SnackbarContentLayout snackbarContentLayout = (SnackbarContentLayout) BaseTransientBottomBar.this.contentViewCallback;
                            snackbarContentLayout.messageView.setAlpha(1.0f);
                            long j = 180;
                            long j2 = 0;
                            snackbarContentLayout.messageView.animate().alpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES).setDuration(j).setStartDelay(j2).start();
                            if (snackbarContentLayout.actionView.getVisibility() == 0) {
                                snackbarContentLayout.actionView.setAlpha(1.0f);
                                snackbarContentLayout.actionView.animate().alpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES).setDuration(j).setStartDelay(j2).start();
                            }
                        }
                    });
                    valueAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.google.android.material.snackbar.BaseTransientBottomBar.16
                        @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                        public final void onAnimationUpdate(ValueAnimator valueAnimator2) {
                            int intValue = ((Integer) valueAnimator2.getAnimatedValue()).intValue();
                            Handler handler2 = BaseTransientBottomBar.handler;
                            BaseTransientBottomBar.this.view.setTranslationY(intValue);
                        }
                    });
                    valueAnimator.start();
                }
                return true;
            }
        }
    });
    public final AccessibilityManager accessibilityManager;
    public final ContentViewCallback contentViewCallback;
    public final Context context;
    public int duration;
    public int extraBottomMarginGestureInset;
    public int extraBottomMarginWindowInset;
    public int extraLeftMarginWindowInset;
    public int extraRightMarginWindowInset;
    public boolean pendingShowingView;
    public final ViewGroup targetParent;
    public final SnackbarBaseLayout view;
    public final AnonymousClass2 bottomMarginGestureInsetRunnable = new Runnable() { // from class: com.google.android.material.snackbar.BaseTransientBottomBar.2
        @Override // java.lang.Runnable
        public final void run() {
            Context context;
            BaseTransientBottomBar baseTransientBottomBar = BaseTransientBottomBar.this;
            if (baseTransientBottomBar.view != null && (context = baseTransientBottomBar.context) != null) {
                DisplayMetrics displayMetrics = new DisplayMetrics();
                ((WindowManager) context.getSystemService("window")).getDefaultDisplay().getRealMetrics(displayMetrics);
                int i = displayMetrics.heightPixels;
                BaseTransientBottomBar baseTransientBottomBar2 = BaseTransientBottomBar.this;
                int[] iArr = new int[2];
                baseTransientBottomBar2.view.getLocationOnScreen(iArr);
                int height = (i - (baseTransientBottomBar2.view.getHeight() + iArr[1])) + ((int) BaseTransientBottomBar.this.view.getTranslationY());
                BaseTransientBottomBar baseTransientBottomBar3 = BaseTransientBottomBar.this;
                if (height < baseTransientBottomBar3.extraBottomMarginGestureInset) {
                    ViewGroup.LayoutParams layoutParams = baseTransientBottomBar3.view.getLayoutParams();
                    if (!(layoutParams instanceof ViewGroup.MarginLayoutParams)) {
                        Handler handler2 = BaseTransientBottomBar.handler;
                        Log.w("BaseTransientBottomBar", "Unable to apply gesture inset because layout params are not MarginLayoutParams");
                        return;
                    }
                    ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams;
                    int i2 = marginLayoutParams.bottomMargin;
                    BaseTransientBottomBar baseTransientBottomBar4 = BaseTransientBottomBar.this;
                    marginLayoutParams.bottomMargin = (baseTransientBottomBar4.extraBottomMarginGestureInset - height) + i2;
                    baseTransientBottomBar4.view.requestLayout();
                }
            }
        }
    };
    public AnonymousClass5 managerCallback = new SnackbarManager.Callback() { // from class: com.google.android.material.snackbar.BaseTransientBottomBar.5
        @Override // com.google.android.material.snackbar.SnackbarManager.Callback
        public final void dismiss(int i) {
            Handler handler2 = BaseTransientBottomBar.handler;
            handler2.sendMessage(handler2.obtainMessage(1, i, 0, BaseTransientBottomBar.this));
        }

        @Override // com.google.android.material.snackbar.SnackbarManager.Callback
        public final void show() {
            Handler handler2 = BaseTransientBottomBar.handler;
            handler2.sendMessage(handler2.obtainMessage(0, BaseTransientBottomBar.this));
        }
    };

    /* renamed from: com.google.android.material.snackbar.BaseTransientBottomBar$11  reason: invalid class name */
    /* loaded from: classes.dex */
    public final class AnonymousClass11 implements ValueAnimator.AnimatorUpdateListener {
        public AnonymousClass11() {
        }

        @Override // android.animation.ValueAnimator.AnimatorUpdateListener
        public final void onAnimationUpdate(ValueAnimator valueAnimator) {
            BaseTransientBottomBar.this.view.setAlpha(((Float) valueAnimator.getAnimatedValue()).floatValue());
        }
    }

    /* renamed from: com.google.android.material.snackbar.BaseTransientBottomBar$7  reason: invalid class name */
    /* loaded from: classes.dex */
    public final class AnonymousClass7 implements SwipeDismissBehavior.OnDismissListener {
        public AnonymousClass7() {
        }

        public final void onDismiss(View view) {
            if (view.getParent() != null) {
                view.setVisibility(8);
            }
            BaseTransientBottomBar.this.dispatchDismiss(0);
        }
    }

    /* loaded from: classes.dex */
    public static class Behavior extends SwipeDismissBehavior<View> {
        public final BehaviorDelegate delegate = new BehaviorDelegate(this);

        @Override // com.google.android.material.behavior.SwipeDismissBehavior
        public final boolean canSwipeDismissView(View view) {
            this.delegate.getClass();
            return view instanceof SnackbarBaseLayout;
        }

        @Override // com.google.android.material.behavior.SwipeDismissBehavior, androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
        public final boolean onInterceptTouchEvent(CoordinatorLayout coordinatorLayout, View view, MotionEvent motionEvent) {
            BehaviorDelegate behaviorDelegate = this.delegate;
            behaviorDelegate.getClass();
            int actionMasked = motionEvent.getActionMasked();
            if (actionMasked != 0) {
                if (actionMasked == 1 || actionMasked == 3) {
                    SnackbarManager snackbarManager = SnackbarManager.getInstance();
                    AnonymousClass5 r0 = behaviorDelegate.managerCallback;
                    synchronized (snackbarManager.lock) {
                        if (snackbarManager.isCurrentSnackbarLocked(r0)) {
                            SnackbarManager.SnackbarRecord snackbarRecord = snackbarManager.currentSnackbar;
                            if (snackbarRecord.paused) {
                                snackbarRecord.paused = false;
                                snackbarManager.scheduleTimeoutLocked(snackbarRecord);
                            }
                        }
                    }
                }
            } else if (coordinatorLayout.isPointInChildBounds(view, (int) motionEvent.getX(), (int) motionEvent.getY())) {
                SnackbarManager snackbarManager2 = SnackbarManager.getInstance();
                AnonymousClass5 r02 = behaviorDelegate.managerCallback;
                synchronized (snackbarManager2.lock) {
                    if (snackbarManager2.isCurrentSnackbarLocked(r02)) {
                        SnackbarManager.SnackbarRecord snackbarRecord2 = snackbarManager2.currentSnackbar;
                        if (!snackbarRecord2.paused) {
                            snackbarRecord2.paused = true;
                            snackbarManager2.handler.removeCallbacksAndMessages(snackbarRecord2);
                        }
                    }
                }
            }
            return super.onInterceptTouchEvent(coordinatorLayout, view, motionEvent);
        }
    }

    /* loaded from: classes.dex */
    public static class SnackbarBaseLayout extends FrameLayout {
        public static final AnonymousClass1 consumeAllTouchListener = new View.OnTouchListener() { // from class: com.google.android.material.snackbar.BaseTransientBottomBar.SnackbarBaseLayout.1
            @Override // android.view.View.OnTouchListener
            @SuppressLint({"ClickableViewAccessibility"})
            public final boolean onTouch(View view, MotionEvent motionEvent) {
                return true;
            }
        };
        public final float actionTextColorAlpha;
        public int animationMode;
        public ColorStateList backgroundTint;
        public PorterDuff.Mode backgroundTintMode;
        public BaseTransientBottomBar<?> baseTransientBottomBar;
        public final int maxInlineActionWidth;
        public final int maxWidth;
        public Rect originalMargins;

        public SnackbarBaseLayout(Context context) {
            this(context, null);
        }

        public SnackbarBaseLayout(Context context, AttributeSet attributeSet) {
            super(MaterialThemeOverlay.wrap(context, attributeSet, 0, 0), attributeSet);
            Context context2 = getContext();
            TypedArray obtainStyledAttributes = context2.obtainStyledAttributes(attributeSet, R$styleable.SnackbarLayout);
            if (obtainStyledAttributes.hasValue(6)) {
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                ViewCompat.Api21Impl.setElevation(this, obtainStyledAttributes.getDimensionPixelSize(6, 0));
            }
            this.animationMode = obtainStyledAttributes.getInt(2, 0);
            float f = obtainStyledAttributes.getFloat(3, 1.0f);
            setBackgroundTintList(MaterialResources.getColorStateList(context2, obtainStyledAttributes, 4));
            setBackgroundTintMode(ViewUtils.parseTintMode(obtainStyledAttributes.getInt(5, -1), PorterDuff.Mode.SRC_IN));
            this.actionTextColorAlpha = obtainStyledAttributes.getFloat(1, 1.0f);
            this.maxWidth = obtainStyledAttributes.getDimensionPixelSize(0, -1);
            this.maxInlineActionWidth = obtainStyledAttributes.getDimensionPixelSize(7, -1);
            obtainStyledAttributes.recycle();
            setOnTouchListener(consumeAllTouchListener);
            setFocusable(true);
            if (getBackground() == null) {
                float dimension = getResources().getDimension(R.dimen.mtrl_snackbar_background_corner_radius);
                GradientDrawable gradientDrawable = new GradientDrawable();
                gradientDrawable.setShape(0);
                gradientDrawable.setCornerRadius(dimension);
                gradientDrawable.setColor(R$bool.layer(R$bool.getColor(this, R.attr.colorSurface), R$bool.getColor(this, R.attr.colorOnSurface), f));
                ColorStateList colorStateList = this.backgroundTint;
                if (colorStateList != null) {
                    gradientDrawable.setTintList(colorStateList);
                }
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap2 = ViewCompat.sViewPropertyAnimatorMap;
                ViewCompat.Api16Impl.setBackground(this, gradientDrawable);
            }
        }

        @Override // android.view.View
        public final void setBackgroundDrawable(Drawable drawable) {
            if (!(drawable == null || this.backgroundTint == null)) {
                drawable = drawable.mutate();
                drawable.setTintList(this.backgroundTint);
                drawable.setTintMode(this.backgroundTintMode);
            }
            super.setBackgroundDrawable(drawable);
        }

        @Override // android.view.View
        public final void setBackgroundTintList(ColorStateList colorStateList) {
            this.backgroundTint = colorStateList;
            if (getBackground() != null) {
                Drawable mutate = getBackground().mutate();
                mutate.setTintList(colorStateList);
                mutate.setTintMode(this.backgroundTintMode);
                if (mutate != getBackground()) {
                    super.setBackgroundDrawable(mutate);
                }
            }
        }

        @Override // android.view.View
        public final void setBackgroundTintMode(PorterDuff.Mode mode) {
            this.backgroundTintMode = mode;
            if (getBackground() != null) {
                Drawable mutate = getBackground().mutate();
                mutate.setTintMode(mode);
                if (mutate != getBackground()) {
                    super.setBackgroundDrawable(mutate);
                }
            }
        }

        @Override // android.view.View
        public final void setOnClickListener(View.OnClickListener onClickListener) {
            AnonymousClass1 r0;
            if (onClickListener != null) {
                r0 = null;
            } else {
                r0 = consumeAllTouchListener;
            }
            setOnTouchListener(r0);
            super.setOnClickListener(onClickListener);
        }

        @Override // android.view.ViewGroup, android.view.View
        public final void onAttachedToWindow() {
            WindowInsets rootWindowInsets;
            super.onAttachedToWindow();
            BaseTransientBottomBar<?> baseTransientBottomBar = this.baseTransientBottomBar;
            if (!(baseTransientBottomBar == null || (rootWindowInsets = baseTransientBottomBar.view.getRootWindowInsets()) == null)) {
                baseTransientBottomBar.extraBottomMarginGestureInset = rootWindowInsets.getMandatorySystemGestureInsets().bottom;
                baseTransientBottomBar.updateMargins();
            }
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            ViewCompat.Api20Impl.requestApplyInsets(this);
        }

        /* JADX WARN: Code restructure failed: missing block: B:20:0x0030, code lost:
            if (r0 == false) goto L22;
         */
        @Override // android.view.ViewGroup, android.view.View
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final void onDetachedFromWindow() {
            /*
                r6 = this;
                super.onDetachedFromWindow()
                com.google.android.material.snackbar.BaseTransientBottomBar<?> r6 = r6.baseTransientBottomBar
                if (r6 == 0) goto L43
                com.google.android.material.snackbar.SnackbarManager r0 = com.google.android.material.snackbar.SnackbarManager.getInstance()
                com.google.android.material.snackbar.BaseTransientBottomBar$5 r1 = r6.managerCallback
                java.lang.Object r2 = r0.lock
                monitor-enter(r2)
                boolean r3 = r0.isCurrentSnackbarLocked(r1)     // Catch: java.lang.Throwable -> L28
                r4 = 0
                r5 = 1
                if (r3 != 0) goto L32
                com.google.android.material.snackbar.SnackbarManager$SnackbarRecord r0 = r0.nextSnackbar     // Catch: java.lang.Throwable -> L28
                if (r0 == 0) goto L2f
                if (r1 == 0) goto L2a
                java.lang.ref.WeakReference<com.google.android.material.snackbar.SnackbarManager$Callback> r0 = r0.callback     // Catch: java.lang.Throwable -> L28
                java.lang.Object r0 = r0.get()     // Catch: java.lang.Throwable -> L28
                if (r0 != r1) goto L2a
                r0 = r5
                goto L2b
            L28:
                r6 = move-exception
                goto L41
            L2a:
                r0 = r4
            L2b:
                if (r0 == 0) goto L2f
                r0 = r5
                goto L30
            L2f:
                r0 = r4
            L30:
                if (r0 == 0) goto L33
            L32:
                r4 = r5
            L33:
                monitor-exit(r2)     // Catch: java.lang.Throwable -> L28
                if (r4 == 0) goto L43
                android.os.Handler r0 = com.google.android.material.snackbar.BaseTransientBottomBar.handler
                com.google.android.material.snackbar.BaseTransientBottomBar$6 r1 = new com.google.android.material.snackbar.BaseTransientBottomBar$6
                r1.<init>()
                r0.post(r1)
                goto L43
            L41:
                monitor-exit(r2)     // Catch: java.lang.Throwable -> L28
                throw r6
            L43:
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.snackbar.BaseTransientBottomBar.SnackbarBaseLayout.onDetachedFromWindow():void");
        }

        @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
        public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
            super.onLayout(z, i, i2, i3, i4);
            BaseTransientBottomBar<?> baseTransientBottomBar = this.baseTransientBottomBar;
            if (baseTransientBottomBar != null && baseTransientBottomBar.pendingShowingView) {
                baseTransientBottomBar.showViewImpl();
                baseTransientBottomBar.pendingShowingView = false;
            }
        }

        @Override // android.widget.FrameLayout, android.view.View
        public void onMeasure(int i, int i2) {
            super.onMeasure(i, i2);
            if (this.maxWidth > 0) {
                int measuredWidth = getMeasuredWidth();
                int i3 = this.maxWidth;
                if (measuredWidth > i3) {
                    super.onMeasure(View.MeasureSpec.makeMeasureSpec(i3, IntMath.MAX_SIGNED_POWER_OF_TWO), i2);
                }
            }
        }

        @Override // android.view.View
        public final void setLayoutParams(ViewGroup.LayoutParams layoutParams) {
            super.setLayoutParams(layoutParams);
            if (layoutParams instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams;
                this.originalMargins = new Rect(marginLayoutParams.leftMargin, marginLayoutParams.topMargin, marginLayoutParams.rightMargin, marginLayoutParams.bottomMargin);
                BaseTransientBottomBar<?> baseTransientBottomBar = this.baseTransientBottomBar;
                if (baseTransientBottomBar != null) {
                    Handler handler = BaseTransientBottomBar.handler;
                    baseTransientBottomBar.updateMargins();
                }
            }
        }

        @Override // android.view.View
        public final void setBackground(Drawable drawable) {
            setBackgroundDrawable(drawable);
        }
    }

    public void dismiss() {
        dispatchDismiss(3);
    }

    /* loaded from: classes.dex */
    public static class BehaviorDelegate {
        public AnonymousClass5 managerCallback;

        public BehaviorDelegate(SwipeDismissBehavior<?> swipeDismissBehavior) {
            swipeDismissBehavior.getClass();
            swipeDismissBehavior.alphaStartSwipeDistance = Math.min(Math.max((float) HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 0.1f), 1.0f);
            swipeDismissBehavior.alphaEndSwipeDistance = Math.min(Math.max((float) HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 0.6f), 1.0f);
            swipeDismissBehavior.swipeDirection = 0;
        }
    }

    public final void showViewImpl() {
        List<AccessibilityServiceInfo> enabledAccessibilityServiceList;
        AccessibilityManager accessibilityManager = this.accessibilityManager;
        boolean z = true;
        if (accessibilityManager != null && ((enabledAccessibilityServiceList = accessibilityManager.getEnabledAccessibilityServiceList(1)) == null || !enabledAccessibilityServiceList.isEmpty())) {
            z = false;
        }
        if (z) {
            this.view.post(new Runnable() { // from class: com.google.android.material.snackbar.BaseTransientBottomBar.8
                @Override // java.lang.Runnable
                public final void run() {
                    SnackbarBaseLayout snackbarBaseLayout = BaseTransientBottomBar.this.view;
                    if (snackbarBaseLayout != null) {
                        if (snackbarBaseLayout.getParent() != null) {
                            BaseTransientBottomBar.this.view.setVisibility(0);
                        }
                        final BaseTransientBottomBar baseTransientBottomBar = BaseTransientBottomBar.this;
                        SnackbarBaseLayout snackbarBaseLayout2 = baseTransientBottomBar.view;
                        if (snackbarBaseLayout2.animationMode == 1) {
                            ValueAnimator ofFloat = ValueAnimator.ofFloat(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 1.0f);
                            ofFloat.setInterpolator(AnimationUtils.LINEAR_INTERPOLATOR);
                            ofFloat.addUpdateListener(new AnonymousClass11());
                            ValueAnimator ofFloat2 = ValueAnimator.ofFloat(0.8f, 1.0f);
                            ofFloat2.setInterpolator(AnimationUtils.LINEAR_OUT_SLOW_IN_INTERPOLATOR);
                            ofFloat2.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.google.android.material.snackbar.BaseTransientBottomBar.12
                                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                                public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                                    float floatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                                    BaseTransientBottomBar.this.view.setScaleX(floatValue);
                                    BaseTransientBottomBar.this.view.setScaleY(floatValue);
                                }
                            });
                            AnimatorSet animatorSet = new AnimatorSet();
                            animatorSet.playTogether(ofFloat, ofFloat2);
                            animatorSet.setDuration(150L);
                            animatorSet.addListener(new AnimatorListenerAdapter() { // from class: com.google.android.material.snackbar.BaseTransientBottomBar.9
                                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                                public final void onAnimationEnd(Animator animator) {
                                    BaseTransientBottomBar.this.onViewShown();
                                }
                            });
                            animatorSet.start();
                            return;
                        }
                        int height = snackbarBaseLayout2.getHeight();
                        ViewGroup.LayoutParams layoutParams = baseTransientBottomBar.view.getLayoutParams();
                        if (layoutParams instanceof ViewGroup.MarginLayoutParams) {
                            height += ((ViewGroup.MarginLayoutParams) layoutParams).bottomMargin;
                        }
                        baseTransientBottomBar.view.setTranslationY(height);
                        ValueAnimator valueAnimator = new ValueAnimator();
                        valueAnimator.setIntValues(height, 0);
                        valueAnimator.setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR);
                        valueAnimator.setDuration(250L);
                        valueAnimator.addListener(new AnimatorListenerAdapter() { // from class: com.google.android.material.snackbar.BaseTransientBottomBar.13
                            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                            public final void onAnimationEnd(Animator animator) {
                                BaseTransientBottomBar.this.onViewShown();
                            }

                            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                            public final void onAnimationStart(Animator animator) {
                                SnackbarContentLayout snackbarContentLayout = (SnackbarContentLayout) BaseTransientBottomBar.this.contentViewCallback;
                                snackbarContentLayout.messageView.setAlpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                                long j = 180;
                                long j2 = 70;
                                snackbarContentLayout.messageView.animate().alpha(1.0f).setDuration(j).setStartDelay(j2).start();
                                if (snackbarContentLayout.actionView.getVisibility() == 0) {
                                    snackbarContentLayout.actionView.setAlpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                                    snackbarContentLayout.actionView.animate().alpha(1.0f).setDuration(j).setStartDelay(j2).start();
                                }
                            }
                        });
                        valueAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener(height) { // from class: com.google.android.material.snackbar.BaseTransientBottomBar.14
                            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                            public final void onAnimationUpdate(ValueAnimator valueAnimator2) {
                                int intValue = ((Integer) valueAnimator2.getAnimatedValue()).intValue();
                                Handler handler2 = BaseTransientBottomBar.handler;
                                BaseTransientBottomBar.this.view.setTranslationY(intValue);
                            }
                        });
                        valueAnimator.start();
                    }
                }
            });
            return;
        }
        if (this.view.getParent() != null) {
            this.view.setVisibility(0);
        }
        onViewShown();
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x0055, code lost:
        if (r0 != false) goto L19;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void updateMargins() {
        /*
            r5 = this;
            com.google.android.material.snackbar.BaseTransientBottomBar$SnackbarBaseLayout r0 = r5.view
            android.view.ViewGroup$LayoutParams r0 = r0.getLayoutParams()
            boolean r1 = r0 instanceof android.view.ViewGroup.MarginLayoutParams
            if (r1 == 0) goto L6a
            com.google.android.material.snackbar.BaseTransientBottomBar$SnackbarBaseLayout r1 = r5.view
            android.graphics.Rect r2 = r1.originalMargins
            if (r2 != 0) goto L11
            goto L6a
        L11:
            android.view.ViewParent r1 = r1.getParent()
            if (r1 != 0) goto L18
            return
        L18:
            int r1 = r5.extraBottomMarginWindowInset
            android.view.ViewGroup$MarginLayoutParams r0 = (android.view.ViewGroup.MarginLayoutParams) r0
            com.google.android.material.snackbar.BaseTransientBottomBar$SnackbarBaseLayout r2 = r5.view
            android.graphics.Rect r3 = r2.originalMargins
            int r4 = r3.bottom
            int r4 = r4 + r1
            r0.bottomMargin = r4
            int r1 = r3.left
            int r4 = r5.extraLeftMarginWindowInset
            int r1 = r1 + r4
            r0.leftMargin = r1
            int r1 = r3.right
            int r4 = r5.extraRightMarginWindowInset
            int r1 = r1 + r4
            r0.rightMargin = r1
            int r1 = r3.top
            r0.topMargin = r1
            r2.requestLayout()
            int r0 = r5.extraBottomMarginGestureInset
            r1 = 1
            r2 = 0
            if (r0 <= 0) goto L58
            com.google.android.material.snackbar.BaseTransientBottomBar$SnackbarBaseLayout r0 = r5.view
            android.view.ViewGroup$LayoutParams r0 = r0.getLayoutParams()
            boolean r3 = r0 instanceof androidx.coordinatorlayout.widget.CoordinatorLayout.LayoutParams
            if (r3 == 0) goto L54
            androidx.coordinatorlayout.widget.CoordinatorLayout$LayoutParams r0 = (androidx.coordinatorlayout.widget.CoordinatorLayout.LayoutParams) r0
            androidx.coordinatorlayout.widget.CoordinatorLayout$Behavior r0 = r0.mBehavior
            boolean r0 = r0 instanceof com.google.android.material.behavior.SwipeDismissBehavior
            if (r0 == 0) goto L54
            r0 = r1
            goto L55
        L54:
            r0 = r2
        L55:
            if (r0 == 0) goto L58
            goto L59
        L58:
            r1 = r2
        L59:
            if (r1 == 0) goto L69
            com.google.android.material.snackbar.BaseTransientBottomBar$SnackbarBaseLayout r0 = r5.view
            com.google.android.material.snackbar.BaseTransientBottomBar$2 r1 = r5.bottomMarginGestureInsetRunnable
            r0.removeCallbacks(r1)
            com.google.android.material.snackbar.BaseTransientBottomBar$SnackbarBaseLayout r0 = r5.view
            com.google.android.material.snackbar.BaseTransientBottomBar$2 r5 = r5.bottomMarginGestureInsetRunnable
            r0.post(r5)
        L69:
            return
        L6a:
            java.lang.String r5 = "BaseTransientBottomBar"
            java.lang.String r0 = "Unable to update margins because layout params are not MarginLayoutParams"
            android.util.Log.w(r5, r0)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.snackbar.BaseTransientBottomBar.updateMargins():void");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0, types: [com.google.android.material.snackbar.BaseTransientBottomBar$2] */
    /* JADX WARN: Type inference failed for: r0v1, types: [com.google.android.material.snackbar.BaseTransientBottomBar$5] */
    public BaseTransientBottomBar(Context context, ViewGroup viewGroup, SnackbarContentLayout snackbarContentLayout, SnackbarContentLayout snackbarContentLayout2) {
        boolean z;
        int i;
        if (snackbarContentLayout == null) {
            throw new IllegalArgumentException("Transient bottom bar must have non-null content");
        } else if (snackbarContentLayout2 != null) {
            this.targetParent = viewGroup;
            this.contentViewCallback = snackbarContentLayout2;
            this.context = context;
            ThemeEnforcement.checkTheme(context, ThemeEnforcement.APPCOMPAT_CHECK_ATTRS, "Theme.AppCompat");
            LayoutInflater from = LayoutInflater.from(context);
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(SNACKBAR_STYLE_ATTR);
            int resourceId = obtainStyledAttributes.getResourceId(0, -1);
            obtainStyledAttributes.recycle();
            if (resourceId != -1) {
                z = true;
            } else {
                z = false;
            }
            if (z) {
                i = R.layout.mtrl_layout_snackbar;
            } else {
                i = R.layout.design_layout_snackbar;
            }
            SnackbarBaseLayout snackbarBaseLayout = (SnackbarBaseLayout) from.inflate(i, viewGroup, false);
            this.view = snackbarBaseLayout;
            snackbarBaseLayout.baseTransientBottomBar = this;
            float f = snackbarBaseLayout.actionTextColorAlpha;
            if (f != 1.0f) {
                snackbarContentLayout.actionView.setTextColor(R$bool.layer(R$bool.getColor(snackbarContentLayout, R.attr.colorSurface), snackbarContentLayout.actionView.getCurrentTextColor(), f));
            }
            snackbarContentLayout.maxInlineActionWidth = snackbarBaseLayout.maxInlineActionWidth;
            snackbarBaseLayout.addView(snackbarContentLayout);
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            ViewCompat.Api19Impl.setAccessibilityLiveRegion(snackbarBaseLayout, 1);
            ViewCompat.Api16Impl.setImportantForAccessibility(snackbarBaseLayout, 1);
            snackbarBaseLayout.setFitsSystemWindows(true);
            ViewCompat.Api21Impl.setOnApplyWindowInsetsListener(snackbarBaseLayout, new OnApplyWindowInsetsListener() { // from class: com.google.android.material.snackbar.BaseTransientBottomBar.3
                @Override // androidx.core.view.OnApplyWindowInsetsListener
                public final WindowInsetsCompat onApplyWindowInsets(View view, WindowInsetsCompat windowInsetsCompat) {
                    BaseTransientBottomBar.this.extraBottomMarginWindowInset = windowInsetsCompat.getSystemWindowInsetBottom();
                    BaseTransientBottomBar.this.extraLeftMarginWindowInset = windowInsetsCompat.getSystemWindowInsetLeft();
                    BaseTransientBottomBar.this.extraRightMarginWindowInset = windowInsetsCompat.getSystemWindowInsetRight();
                    BaseTransientBottomBar.this.updateMargins();
                    return windowInsetsCompat;
                }
            });
            ViewCompat.setAccessibilityDelegate(snackbarBaseLayout, new AccessibilityDelegateCompat() { // from class: com.google.android.material.snackbar.BaseTransientBottomBar.4
                @Override // androidx.core.view.AccessibilityDelegateCompat
                public final void onInitializeAccessibilityNodeInfo(View view, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat) {
                    this.mOriginalDelegate.onInitializeAccessibilityNodeInfo(view, accessibilityNodeInfoCompat.mInfo);
                    accessibilityNodeInfoCompat.addAction(QuickStepContract.SYSUI_STATE_IME_SWITCHER_SHOWING);
                    accessibilityNodeInfoCompat.mInfo.setDismissable(true);
                }

                @Override // androidx.core.view.AccessibilityDelegateCompat
                public final boolean performAccessibilityAction(View view, int i2, Bundle bundle) {
                    if (i2 != 1048576) {
                        return super.performAccessibilityAction(view, i2, bundle);
                    }
                    BaseTransientBottomBar.this.dismiss();
                    return true;
                }
            });
            this.accessibilityManager = (AccessibilityManager) context.getSystemService("accessibility");
        } else {
            throw new IllegalArgumentException("Transient bottom bar must have non-null callback");
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x002e A[Catch: all -> 0x0037, TryCatch #0 {, blocks: (B:4:0x0009, B:6:0x000f, B:7:0x0015, B:10:0x001d, B:18:0x002e, B:19:0x0033), top: B:24:0x0009 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void dispatchDismiss(int r6) {
        /*
            r5 = this;
            com.google.android.material.snackbar.SnackbarManager r0 = com.google.android.material.snackbar.SnackbarManager.getInstance()
            com.google.android.material.snackbar.BaseTransientBottomBar$5 r5 = r5.managerCallback
            java.lang.Object r1 = r0.lock
            monitor-enter(r1)
            boolean r2 = r0.isCurrentSnackbarLocked(r5)     // Catch: java.lang.Throwable -> L37
            if (r2 == 0) goto L15
            com.google.android.material.snackbar.SnackbarManager$SnackbarRecord r5 = r0.currentSnackbar     // Catch: java.lang.Throwable -> L37
            r0.cancelSnackbarLocked(r5, r6)     // Catch: java.lang.Throwable -> L37
            goto L33
        L15:
            com.google.android.material.snackbar.SnackbarManager$SnackbarRecord r2 = r0.nextSnackbar     // Catch: java.lang.Throwable -> L37
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2b
            if (r5 == 0) goto L27
            java.lang.ref.WeakReference<com.google.android.material.snackbar.SnackbarManager$Callback> r2 = r2.callback     // Catch: java.lang.Throwable -> L37
            java.lang.Object r2 = r2.get()     // Catch: java.lang.Throwable -> L37
            if (r2 != r5) goto L27
            r5 = r3
            goto L28
        L27:
            r5 = r4
        L28:
            if (r5 == 0) goto L2b
            goto L2c
        L2b:
            r3 = r4
        L2c:
            if (r3 == 0) goto L33
            com.google.android.material.snackbar.SnackbarManager$SnackbarRecord r5 = r0.nextSnackbar     // Catch: java.lang.Throwable -> L37
            r0.cancelSnackbarLocked(r5, r6)     // Catch: java.lang.Throwable -> L37
        L33:
            monitor-exit(r1)     // Catch: java.lang.Throwable -> L37
            return
        L35:
            monitor-exit(r1)     // Catch: java.lang.Throwable -> L37
            throw r5
        L37:
            r5 = move-exception
            goto L35
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.snackbar.BaseTransientBottomBar.dispatchDismiss(int):void");
    }

    public final void onViewHidden() {
        SnackbarManager snackbarManager = SnackbarManager.getInstance();
        AnonymousClass5 r1 = this.managerCallback;
        synchronized (snackbarManager.lock) {
            try {
                if (snackbarManager.isCurrentSnackbarLocked(r1)) {
                    snackbarManager.currentSnackbar = null;
                    SnackbarManager.SnackbarRecord snackbarRecord = snackbarManager.nextSnackbar;
                    if (!(snackbarRecord == null || snackbarRecord == null)) {
                        snackbarManager.currentSnackbar = snackbarRecord;
                        snackbarManager.nextSnackbar = null;
                        SnackbarManager.Callback callback = snackbarRecord.callback.get();
                        if (callback != null) {
                            callback.show();
                        } else {
                            snackbarManager.currentSnackbar = null;
                        }
                    }
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        ViewParent parent = this.view.getParent();
        if (parent instanceof ViewGroup) {
            ((ViewGroup) parent).removeView(this.view);
        }
    }

    public final void onViewShown() {
        SnackbarManager snackbarManager = SnackbarManager.getInstance();
        AnonymousClass5 r2 = this.managerCallback;
        synchronized (snackbarManager.lock) {
            if (snackbarManager.isCurrentSnackbarLocked(r2)) {
                snackbarManager.scheduleTimeoutLocked(snackbarManager.currentSnackbar);
            }
        }
    }
}
