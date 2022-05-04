package com.google.android.material.behavior;

import android.view.MotionEvent;
import android.view.View;
import android.view.ViewParent;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.core.view.accessibility.AccessibilityNodeInfoCompat;
import androidx.core.view.accessibility.AccessibilityViewCommand;
import androidx.customview.widget.ViewDragHelper;
import com.android.systemui.shared.system.QuickStepContract;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.android.material.snackbar.BaseTransientBottomBar;
import com.google.android.material.snackbar.SnackbarManager;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public class SwipeDismissBehavior<V extends View> extends CoordinatorLayout.Behavior<V> {
    public boolean interceptingEvents;
    public OnDismissListener listener;
    public ViewDragHelper viewDragHelper;
    public int swipeDirection = 2;
    public float dragDismissThreshold = 0.5f;
    public float alphaStartSwipeDistance = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
    public float alphaEndSwipeDistance = 0.5f;
    public final AnonymousClass1 dragCallback = new ViewDragHelper.Callback() { // from class: com.google.android.material.behavior.SwipeDismissBehavior.1
        public int activePointerId = -1;
        public int originalCapturedViewLeft;

        /* JADX WARN: Code restructure failed: missing block: B:21:0x0052, code lost:
            if (java.lang.Math.abs(r8.getLeft() - r7.originalCapturedViewLeft) >= java.lang.Math.round(r8.getWidth() * r7.this$0.dragDismissThreshold)) goto L22;
         */
        @Override // androidx.customview.widget.ViewDragHelper.Callback
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final void onViewReleased(android.view.View r8, float r9, float r10) {
            /*
                r7 = this;
                r10 = -1
                r7.activePointerId = r10
                int r10 = r8.getWidth()
                r0 = 0
                int r1 = (r9 > r0 ? 1 : (r9 == r0 ? 0 : -1))
                r2 = 1
                r3 = 0
                if (r1 == 0) goto L39
                java.util.WeakHashMap<android.view.View, androidx.core.view.ViewPropertyAnimatorCompat> r4 = androidx.core.view.ViewCompat.sViewPropertyAnimatorMap
                int r4 = androidx.core.view.ViewCompat.Api17Impl.getLayoutDirection(r8)
                if (r4 != r2) goto L18
                r4 = r2
                goto L19
            L18:
                r4 = r3
            L19:
                com.google.android.material.behavior.SwipeDismissBehavior r5 = com.google.android.material.behavior.SwipeDismissBehavior.this
                int r5 = r5.swipeDirection
                r6 = 2
                if (r5 != r6) goto L21
                goto L54
            L21:
                if (r5 != 0) goto L2d
                if (r4 == 0) goto L2a
                int r9 = (r9 > r0 ? 1 : (r9 == r0 ? 0 : -1))
                if (r9 >= 0) goto L56
                goto L54
            L2a:
                if (r1 <= 0) goto L56
                goto L54
            L2d:
                if (r5 != r2) goto L56
                if (r4 == 0) goto L34
                if (r1 <= 0) goto L56
                goto L54
            L34:
                int r9 = (r9 > r0 ? 1 : (r9 == r0 ? 0 : -1))
                if (r9 >= 0) goto L56
                goto L54
            L39:
                int r9 = r8.getLeft()
                int r0 = r7.originalCapturedViewLeft
                int r9 = r9 - r0
                int r0 = r8.getWidth()
                float r0 = (float) r0
                com.google.android.material.behavior.SwipeDismissBehavior r1 = com.google.android.material.behavior.SwipeDismissBehavior.this
                float r1 = r1.dragDismissThreshold
                float r0 = r0 * r1
                int r0 = java.lang.Math.round(r0)
                int r9 = java.lang.Math.abs(r9)
                if (r9 < r0) goto L56
            L54:
                r9 = r2
                goto L57
            L56:
                r9 = r3
            L57:
                if (r9 == 0) goto L65
                int r9 = r8.getLeft()
                int r0 = r7.originalCapturedViewLeft
                if (r9 >= r0) goto L63
                int r0 = r0 - r10
                goto L68
            L63:
                int r0 = r0 + r10
                goto L68
            L65:
                int r0 = r7.originalCapturedViewLeft
                r2 = r3
            L68:
                com.google.android.material.behavior.SwipeDismissBehavior r9 = com.google.android.material.behavior.SwipeDismissBehavior.this
                androidx.customview.widget.ViewDragHelper r9 = r9.viewDragHelper
                int r10 = r8.getTop()
                boolean r9 = r9.settleCapturedViewAt(r0, r10)
                if (r9 == 0) goto L83
                com.google.android.material.behavior.SwipeDismissBehavior$SettleRunnable r9 = new com.google.android.material.behavior.SwipeDismissBehavior$SettleRunnable
                com.google.android.material.behavior.SwipeDismissBehavior r7 = com.google.android.material.behavior.SwipeDismissBehavior.this
                r9.<init>(r8, r2)
                java.util.WeakHashMap<android.view.View, androidx.core.view.ViewPropertyAnimatorCompat> r7 = androidx.core.view.ViewCompat.sViewPropertyAnimatorMap
                androidx.core.view.ViewCompat.Api16Impl.postOnAnimation(r8, r9)
                goto L90
            L83:
                if (r2 == 0) goto L90
                com.google.android.material.behavior.SwipeDismissBehavior r7 = com.google.android.material.behavior.SwipeDismissBehavior.this
                com.google.android.material.behavior.SwipeDismissBehavior$OnDismissListener r7 = r7.listener
                if (r7 == 0) goto L90
                com.google.android.material.snackbar.BaseTransientBottomBar$7 r7 = (com.google.android.material.snackbar.BaseTransientBottomBar.AnonymousClass7) r7
                r7.onDismiss(r8)
            L90:
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.behavior.SwipeDismissBehavior.AnonymousClass1.onViewReleased(android.view.View, float, float):void");
        }

        @Override // androidx.customview.widget.ViewDragHelper.Callback
        public final int clampViewPositionHorizontal(View view, int i) {
            boolean z;
            int i2;
            int i3;
            int i4;
            int width;
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            if (ViewCompat.Api17Impl.getLayoutDirection(view) == 1) {
                z = true;
            } else {
                z = false;
            }
            int i5 = SwipeDismissBehavior.this.swipeDirection;
            if (i5 == 0) {
                if (z) {
                    i3 = this.originalCapturedViewLeft - view.getWidth();
                    i2 = this.originalCapturedViewLeft;
                } else {
                    i4 = this.originalCapturedViewLeft;
                    width = view.getWidth();
                    i3 = i4;
                    i2 = width + i3;
                }
            } else if (i5 != 1) {
                i3 = this.originalCapturedViewLeft - view.getWidth();
                i2 = this.originalCapturedViewLeft + view.getWidth();
            } else if (z) {
                i4 = this.originalCapturedViewLeft;
                width = view.getWidth();
                i3 = i4;
                i2 = width + i3;
            } else {
                i3 = this.originalCapturedViewLeft - view.getWidth();
                i2 = this.originalCapturedViewLeft;
            }
            return Math.min(Math.max(i3, i), i2);
        }

        @Override // androidx.customview.widget.ViewDragHelper.Callback
        public final void onViewCaptured(View view, int i) {
            this.activePointerId = i;
            this.originalCapturedViewLeft = view.getLeft();
            ViewParent parent = view.getParent();
            if (parent != null) {
                parent.requestDisallowInterceptTouchEvent(true);
            }
        }

        @Override // androidx.customview.widget.ViewDragHelper.Callback
        public final void onViewDragStateChanged(int i) {
            OnDismissListener onDismissListener = SwipeDismissBehavior.this.listener;
            if (onDismissListener != null) {
                BaseTransientBottomBar.AnonymousClass7 r3 = (BaseTransientBottomBar.AnonymousClass7) onDismissListener;
                if (i == 0) {
                    SnackbarManager snackbarManager = SnackbarManager.getInstance();
                    BaseTransientBottomBar.AnonymousClass5 r32 = BaseTransientBottomBar.this.managerCallback;
                    synchronized (snackbarManager.lock) {
                        if (snackbarManager.isCurrentSnackbarLocked(r32)) {
                            SnackbarManager.SnackbarRecord snackbarRecord = snackbarManager.currentSnackbar;
                            if (snackbarRecord.paused) {
                                snackbarRecord.paused = false;
                                snackbarManager.scheduleTimeoutLocked(snackbarRecord);
                            }
                        }
                    }
                } else if (i == 1 || i == 2) {
                    SnackbarManager snackbarManager2 = SnackbarManager.getInstance();
                    BaseTransientBottomBar.AnonymousClass5 r33 = BaseTransientBottomBar.this.managerCallback;
                    synchronized (snackbarManager2.lock) {
                        if (snackbarManager2.isCurrentSnackbarLocked(r33)) {
                            SnackbarManager.SnackbarRecord snackbarRecord2 = snackbarManager2.currentSnackbar;
                            if (!snackbarRecord2.paused) {
                                snackbarRecord2.paused = true;
                                snackbarManager2.handler.removeCallbacksAndMessages(snackbarRecord2);
                            }
                        }
                    }
                }
            }
        }

        @Override // androidx.customview.widget.ViewDragHelper.Callback
        public final void onViewPositionChanged(View view, int i, int i2) {
            float width = (view.getWidth() * SwipeDismissBehavior.this.alphaStartSwipeDistance) + this.originalCapturedViewLeft;
            float width2 = (view.getWidth() * SwipeDismissBehavior.this.alphaEndSwipeDistance) + this.originalCapturedViewLeft;
            float f = i;
            if (f <= width) {
                view.setAlpha(1.0f);
            } else if (f >= width2) {
                view.setAlpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            } else {
                view.setAlpha(Math.min(Math.max((float) HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 1.0f - ((f - width) / (width2 - width))), 1.0f));
            }
        }

        @Override // androidx.customview.widget.ViewDragHelper.Callback
        public final boolean tryCaptureView(View view, int i) {
            int i2 = this.activePointerId;
            if ((i2 == -1 || i2 == i) && SwipeDismissBehavior.this.canSwipeDismissView(view)) {
                return true;
            }
            return false;
        }

        @Override // androidx.customview.widget.ViewDragHelper.Callback
        public final int clampViewPositionVertical(View view, int i) {
            return view.getTop();
        }

        @Override // androidx.customview.widget.ViewDragHelper.Callback
        public final int getViewHorizontalDragRange(View view) {
            return view.getWidth();
        }
    };

    /* loaded from: classes.dex */
    public interface OnDismissListener {
    }

    /* loaded from: classes.dex */
    public class SettleRunnable implements Runnable {
        public final boolean dismiss;
        public final View view;

        public SettleRunnable(View view, boolean z) {
            this.view = view;
            this.dismiss = z;
        }

        @Override // java.lang.Runnable
        public final void run() {
            OnDismissListener onDismissListener;
            ViewDragHelper viewDragHelper = SwipeDismissBehavior.this.viewDragHelper;
            if (viewDragHelper != null && viewDragHelper.continueSettling()) {
                View view = this.view;
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                ViewCompat.Api16Impl.postOnAnimation(view, this);
            } else if (this.dismiss && (onDismissListener = SwipeDismissBehavior.this.listener) != null) {
                ((BaseTransientBottomBar.AnonymousClass7) onDismissListener).onDismiss(this.view);
            }
        }
    }

    public boolean canSwipeDismissView(View view) {
        return true;
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public boolean onInterceptTouchEvent(CoordinatorLayout coordinatorLayout, V v, MotionEvent motionEvent) {
        boolean z = this.interceptingEvents;
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 0) {
            z = coordinatorLayout.isPointInChildBounds(v, (int) motionEvent.getX(), (int) motionEvent.getY());
            this.interceptingEvents = z;
        } else if (actionMasked == 1 || actionMasked == 3) {
            this.interceptingEvents = false;
        }
        if (!z) {
            return false;
        }
        if (this.viewDragHelper == null) {
            this.viewDragHelper = new ViewDragHelper(coordinatorLayout.getContext(), coordinatorLayout, this.dragCallback);
        }
        return this.viewDragHelper.shouldInterceptTouchEvent(motionEvent);
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public final boolean onLayoutChild(CoordinatorLayout coordinatorLayout, V v, int i) {
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        if (ViewCompat.Api16Impl.getImportantForAccessibility(v) == 0) {
            ViewCompat.Api16Impl.setImportantForAccessibility(v, 1);
            ViewCompat.removeActionWithId(QuickStepContract.SYSUI_STATE_IME_SWITCHER_SHOWING, v);
            ViewCompat.notifyViewAccessibilityStateChangedIfNeeded(v, 0);
            if (canSwipeDismissView(v)) {
                ViewCompat.replaceAccessibilityAction(v, AccessibilityNodeInfoCompat.AccessibilityActionCompat.ACTION_DISMISS, new AccessibilityViewCommand() { // from class: com.google.android.material.behavior.SwipeDismissBehavior.2
                    @Override // androidx.core.view.accessibility.AccessibilityViewCommand
                    public final boolean perform(View view) {
                        boolean z;
                        boolean z2 = false;
                        if (!SwipeDismissBehavior.this.canSwipeDismissView(view)) {
                            return false;
                        }
                        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap2 = ViewCompat.sViewPropertyAnimatorMap;
                        if (ViewCompat.Api17Impl.getLayoutDirection(view) == 1) {
                            z = true;
                        } else {
                            z = false;
                        }
                        int i2 = SwipeDismissBehavior.this.swipeDirection;
                        if ((i2 == 0 && z) || (i2 == 1 && !z)) {
                            z2 = true;
                        }
                        int width = view.getWidth();
                        if (z2) {
                            width = -width;
                        }
                        view.offsetLeftAndRight(width);
                        view.setAlpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                        OnDismissListener onDismissListener = SwipeDismissBehavior.this.listener;
                        if (onDismissListener != null) {
                            ((BaseTransientBottomBar.AnonymousClass7) onDismissListener).onDismiss(view);
                        }
                        return true;
                    }
                });
            }
        }
        return false;
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public final boolean onTouchEvent(CoordinatorLayout coordinatorLayout, V v, MotionEvent motionEvent) {
        ViewDragHelper viewDragHelper = this.viewDragHelper;
        if (viewDragHelper == null) {
            return false;
        }
        viewDragHelper.processTouchEvent(motionEvent);
        return true;
    }

    public OnDismissListener getListener() {
        return this.listener;
    }
}
