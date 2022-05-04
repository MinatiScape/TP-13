package com.google.android.material.appbar;

import android.animation.AnimatorInflater;
import android.animation.ObjectAnimator;
import android.animation.StateListAnimator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.animation.Interpolator;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ScrollView;
import androidx.appcompat.R$layout;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.core.math.MathUtils;
import androidx.core.view.NestedScrollingChild;
import androidx.core.view.OnApplyWindowInsetsListener;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.core.view.accessibility.AccessibilityNodeInfoCompat;
import androidx.core.view.accessibility.AccessibilityViewCommand;
import androidx.customview.view.AbsSavedState;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.android.material.R$styleable;
import com.google.android.material.animation.AnimationUtils;
import com.google.android.material.internal.ThemeEnforcement;
import com.google.android.material.shape.MaterialShapeDrawable;
import com.google.android.material.theme.overlay.MaterialThemeOverlay;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public class AppBarLayout extends LinearLayout implements CoordinatorLayout.AttachedBehavior {
    public Behavior behavior;
    public int currentOffset;
    public int downPreScrollRange;
    public int downScrollRange;
    public ValueAnimator elevationOverlayAnimator;
    public boolean haveChildWithInterpolator;
    public WindowInsetsCompat lastInsets;
    public boolean liftOnScroll;
    public final ArrayList liftOnScrollListeners;
    public WeakReference<View> liftOnScrollTargetView;
    public int liftOnScrollTargetViewId;
    public boolean liftable;
    public boolean lifted;
    public ArrayList listeners;
    public int pendingAction;
    public Drawable statusBarForeground;
    public int[] tmpStatesArray;
    public int totalScrollRange;

    /* loaded from: classes.dex */
    public static class BaseBehavior<T extends AppBarLayout> extends HeaderBehavior<T> {
        public WeakReference<View> lastNestedScrollingChildRef;
        public int lastStartedType;
        public ValueAnimator offsetAnimator;
        public int offsetDelta;
        public SavedState savedState;

        /* loaded from: classes.dex */
        public static class SavedState extends AbsSavedState {
            public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.ClassLoaderCreator<SavedState>() { // from class: com.google.android.material.appbar.AppBarLayout.BaseBehavior.SavedState.1
                @Override // android.os.Parcelable.ClassLoaderCreator
                public final SavedState createFromParcel(Parcel parcel, ClassLoader classLoader) {
                    return new SavedState(parcel, classLoader);
                }

                @Override // android.os.Parcelable.Creator
                public final Object createFromParcel(Parcel parcel) {
                    return new SavedState(parcel, null);
                }

                @Override // android.os.Parcelable.Creator
                public final Object[] newArray(int i) {
                    return new SavedState[i];
                }
            };
            public boolean firstVisibleChildAtMinimumHeight;
            public int firstVisibleChildIndex;
            public float firstVisibleChildPercentageShown;
            public boolean fullyExpanded;
            public boolean fullyScrolled;

            public SavedState(Parcel parcel, ClassLoader classLoader) {
                super(parcel, classLoader);
                boolean z = true;
                this.fullyScrolled = parcel.readByte() != 0;
                this.fullyExpanded = parcel.readByte() != 0;
                this.firstVisibleChildIndex = parcel.readInt();
                this.firstVisibleChildPercentageShown = parcel.readFloat();
                this.firstVisibleChildAtMinimumHeight = parcel.readByte() == 0 ? false : z;
            }

            @Override // androidx.customview.view.AbsSavedState, android.os.Parcelable
            public final void writeToParcel(Parcel parcel, int i) {
                parcel.writeParcelable(this.mSuperState, i);
                parcel.writeByte(this.fullyScrolled ? (byte) 1 : (byte) 0);
                parcel.writeByte(this.fullyExpanded ? (byte) 1 : (byte) 0);
                parcel.writeInt(this.firstVisibleChildIndex);
                parcel.writeFloat(this.firstVisibleChildPercentageShown);
                parcel.writeByte(this.firstVisibleChildAtMinimumHeight ? (byte) 1 : (byte) 0);
            }

            public SavedState(Parcelable parcelable) {
                super(parcelable);
            }
        }

        public BaseBehavior() {
        }

        @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
        public final /* bridge */ /* synthetic */ void onNestedPreScroll(CoordinatorLayout coordinatorLayout, View view, View view2, int i, int i2, int[] iArr, int i3) {
            onNestedPreScroll(coordinatorLayout, (AppBarLayout) view, view2, i2, iArr);
        }

        public BaseBehavior(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
        }

        @Override // com.google.android.material.appbar.HeaderBehavior
        public final boolean canDragView(View view) {
            View view2;
            AppBarLayout appBarLayout = (AppBarLayout) view;
            WeakReference<View> weakReference = this.lastNestedScrollingChildRef;
            if (weakReference == null || ((view2 = weakReference.get()) != null && view2.isShown() && !view2.canScrollVertically(-1))) {
                return true;
            }
            return false;
        }

        @Override // com.google.android.material.appbar.HeaderBehavior
        public final int getMaxDragOffset(View view) {
            return -((AppBarLayout) view).getDownNestedScrollRange();
        }

        @Override // com.google.android.material.appbar.HeaderBehavior
        public final int getScrollRangeForDragFling(View view) {
            return ((AppBarLayout) view).getTotalScrollRange();
        }

        public boolean isOffsetAnimatorRunning() {
            ValueAnimator valueAnimator = this.offsetAnimator;
            if (valueAnimator == null || !valueAnimator.isRunning()) {
                return false;
            }
            return true;
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // com.google.android.material.appbar.HeaderBehavior
        public final void onFlingFinished(CoordinatorLayout coordinatorLayout, View view) {
            AppBarLayout appBarLayout = (AppBarLayout) view;
            snapToChildIfNeeded(coordinatorLayout, appBarLayout);
            if (appBarLayout.liftOnScroll) {
                appBarLayout.setLiftedState(appBarLayout.shouldLift(findFirstScrollingChild(coordinatorLayout)));
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // com.google.android.material.appbar.ViewOffsetBehavior, androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
        public final boolean onLayoutChild(CoordinatorLayout coordinatorLayout, View view, int i) {
            boolean z;
            int i2;
            AppBarLayout appBarLayout = (AppBarLayout) view;
            super.onLayoutChild(coordinatorLayout, appBarLayout, i);
            int i3 = appBarLayout.pendingAction;
            SavedState savedState = this.savedState;
            if (savedState == null || (i3 & 8) != 0) {
                if (i3 != 0) {
                    if ((i3 & 4) != 0) {
                        z = true;
                    } else {
                        z = false;
                    }
                    if ((i3 & 2) != 0) {
                        int i4 = -appBarLayout.getTotalScrollRange();
                        if (z) {
                            animateOffsetTo(coordinatorLayout, appBarLayout, i4);
                        } else {
                            setHeaderTopBottomOffset(coordinatorLayout, appBarLayout, i4);
                        }
                    } else if ((i3 & 1) != 0) {
                        if (z) {
                            animateOffsetTo(coordinatorLayout, appBarLayout, 0);
                        } else {
                            setHeaderTopBottomOffset(coordinatorLayout, appBarLayout, 0);
                        }
                    }
                }
            } else if (savedState.fullyScrolled) {
                setHeaderTopBottomOffset(coordinatorLayout, appBarLayout, -appBarLayout.getTotalScrollRange());
            } else if (savedState.fullyExpanded) {
                setHeaderTopBottomOffset(coordinatorLayout, appBarLayout, 0);
            } else {
                View childAt = appBarLayout.getChildAt(savedState.firstVisibleChildIndex);
                int i5 = -childAt.getBottom();
                if (this.savedState.firstVisibleChildAtMinimumHeight) {
                    WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                    i2 = appBarLayout.getTopInset() + ViewCompat.Api16Impl.getMinimumHeight(childAt) + i5;
                } else {
                    i2 = Math.round(childAt.getHeight() * this.savedState.firstVisibleChildPercentageShown) + i5;
                }
                setHeaderTopBottomOffset(coordinatorLayout, appBarLayout, i2);
            }
            appBarLayout.pendingAction = 0;
            this.savedState = null;
            int clamp = MathUtils.clamp(getTopAndBottomOffset(), -appBarLayout.getTotalScrollRange(), 0);
            ViewOffsetHelper viewOffsetHelper = this.viewOffsetHelper;
            if (viewOffsetHelper != null) {
                viewOffsetHelper.setTopAndBottomOffset(clamp);
            } else {
                this.tempTopBottomOffset = clamp;
            }
            updateAppBarLayoutDrawableState(coordinatorLayout, appBarLayout, getTopAndBottomOffset(), 0, true);
            appBarLayout.onOffsetChanged(getTopAndBottomOffset());
            updateAccessibilityActions(coordinatorLayout, appBarLayout);
            return true;
        }

        @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
        public final boolean onMeasureChild(CoordinatorLayout coordinatorLayout, View view, int i, int i2, int i3) {
            AppBarLayout appBarLayout = (AppBarLayout) view;
            if (((ViewGroup.MarginLayoutParams) ((CoordinatorLayout.LayoutParams) appBarLayout.getLayoutParams())).height != -2) {
                return false;
            }
            coordinatorLayout.onMeasureChild(appBarLayout, i, i2, View.MeasureSpec.makeMeasureSpec(0, 0));
            return true;
        }

        public final void onNestedPreScroll(CoordinatorLayout coordinatorLayout, AppBarLayout appBarLayout, View view, int i, int[] iArr) {
            int i2;
            int i3;
            if (i != 0) {
                if (i < 0) {
                    i3 = -appBarLayout.getTotalScrollRange();
                    i2 = appBarLayout.getDownNestedPreScrollRange() + i3;
                } else {
                    i3 = -appBarLayout.getTotalScrollRange();
                    i2 = 0;
                }
                int i4 = i3;
                int i5 = i2;
                if (i4 != i5) {
                    iArr[1] = setHeaderTopBottomOffset(coordinatorLayout, appBarLayout, getTopBottomOffsetForScrollingSibling() - i, i4, i5);
                }
            }
            if (appBarLayout.liftOnScroll) {
                appBarLayout.setLiftedState(appBarLayout.shouldLift(view));
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
        public final void onNestedScroll(CoordinatorLayout coordinatorLayout, View view, int i, int i2, int i3, int[] iArr) {
            AppBarLayout appBarLayout = (AppBarLayout) view;
            if (i3 < 0) {
                iArr[1] = setHeaderTopBottomOffset(coordinatorLayout, appBarLayout, getTopBottomOffsetForScrollingSibling() - i3, -appBarLayout.getDownNestedScrollRange(), 0);
            }
            if (i3 == 0) {
                updateAccessibilityActions(coordinatorLayout, appBarLayout);
            }
        }

        @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
        public final void onRestoreInstanceState(View view, Parcelable parcelable) {
            AppBarLayout appBarLayout = (AppBarLayout) view;
            if (parcelable instanceof SavedState) {
                SavedState savedState = this.savedState;
                this.savedState = (SavedState) parcelable;
                return;
            }
            this.savedState = null;
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
        public final Parcelable onSaveInstanceState(View view) {
            android.view.AbsSavedState absSavedState = View.BaseSavedState.EMPTY_STATE;
            SavedState saveScrollState = saveScrollState(absSavedState, (AppBarLayout) view);
            if (saveScrollState == null) {
                return absSavedState;
            }
            return saveScrollState;
        }

        /* JADX WARN: Code restructure failed: missing block: B:15:0x0029, code lost:
            if (r3 != false) goto L17;
         */
        @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final boolean onStartNestedScroll(androidx.coordinatorlayout.widget.CoordinatorLayout r3, android.view.View r4, android.view.View r5, int r6, int r7) {
            /*
                r2 = this;
                com.google.android.material.appbar.AppBarLayout r4 = (com.google.android.material.appbar.AppBarLayout) r4
                r6 = r6 & 2
                r0 = 1
                r1 = 0
                if (r6 == 0) goto L2c
                boolean r6 = r4.liftOnScroll
                if (r6 != 0) goto L2d
                int r6 = r4.getTotalScrollRange()
                if (r6 == 0) goto L14
                r6 = r0
                goto L15
            L14:
                r6 = r1
            L15:
                if (r6 == 0) goto L28
                int r3 = r3.getHeight()
                int r5 = r5.getHeight()
                int r3 = r3 - r5
                int r4 = r4.getHeight()
                if (r3 > r4) goto L28
                r3 = r0
                goto L29
            L28:
                r3 = r1
            L29:
                if (r3 == 0) goto L2c
                goto L2d
            L2c:
                r0 = r1
            L2d:
                if (r0 == 0) goto L36
                android.animation.ValueAnimator r3 = r2.offsetAnimator
                if (r3 == 0) goto L36
                r3.cancel()
            L36:
                r3 = 0
                r2.lastNestedScrollingChildRef = r3
                r2.lastStartedType = r7
                return r0
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.appbar.AppBarLayout.BaseBehavior.onStartNestedScroll(androidx.coordinatorlayout.widget.CoordinatorLayout, android.view.View, android.view.View, int, int):boolean");
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
        public final void onStopNestedScroll(CoordinatorLayout coordinatorLayout, View view, View view2, int i) {
            AppBarLayout appBarLayout = (AppBarLayout) view;
            if (this.lastStartedType == 0 || i == 1) {
                snapToChildIfNeeded(coordinatorLayout, appBarLayout);
                if (appBarLayout.liftOnScroll) {
                    appBarLayout.setLiftedState(appBarLayout.shouldLift(view2));
                }
            }
            this.lastNestedScrollingChildRef = new WeakReference<>(view2);
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // com.google.android.material.appbar.HeaderBehavior
        public final int setHeaderTopBottomOffset(CoordinatorLayout coordinatorLayout, View view, int i, int i2, int i3) {
            int i4;
            boolean z;
            ArrayList<View> orDefault;
            int i5;
            AppBarLayout appBarLayout = (AppBarLayout) view;
            int topBottomOffsetForScrollingSibling = getTopBottomOffsetForScrollingSibling();
            int i6 = 0;
            if (i2 == 0 || topBottomOffsetForScrollingSibling < i2 || topBottomOffsetForScrollingSibling > i3) {
                this.offsetDelta = 0;
            } else {
                int clamp = MathUtils.clamp(i, i2, i3);
                if (topBottomOffsetForScrollingSibling != clamp) {
                    if (appBarLayout.haveChildWithInterpolator) {
                        int abs = Math.abs(clamp);
                        int childCount = appBarLayout.getChildCount();
                        int i7 = 0;
                        while (true) {
                            if (i7 >= childCount) {
                                break;
                            }
                            View childAt = appBarLayout.getChildAt(i7);
                            LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                            Interpolator interpolator = layoutParams.scrollInterpolator;
                            if (abs < childAt.getTop() || abs > childAt.getBottom()) {
                                i7++;
                            } else if (interpolator != null) {
                                int i8 = layoutParams.scrollFlags;
                                if ((i8 & 1) != 0) {
                                    i5 = childAt.getHeight() + ((LinearLayout.LayoutParams) layoutParams).topMargin + ((LinearLayout.LayoutParams) layoutParams).bottomMargin + 0;
                                    if ((i8 & 2) != 0) {
                                        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                                        i5 -= ViewCompat.Api16Impl.getMinimumHeight(childAt);
                                    }
                                } else {
                                    i5 = 0;
                                }
                                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap2 = ViewCompat.sViewPropertyAnimatorMap;
                                if (ViewCompat.Api16Impl.getFitsSystemWindows(childAt)) {
                                    i5 -= appBarLayout.getTopInset();
                                }
                                if (i5 > 0) {
                                    float f = i5;
                                    i4 = (childAt.getTop() + Math.round(interpolator.getInterpolation((abs - childAt.getTop()) / f) * f)) * Integer.signum(clamp);
                                }
                            }
                        }
                    }
                    i4 = clamp;
                    ViewOffsetHelper viewOffsetHelper = this.viewOffsetHelper;
                    if (viewOffsetHelper != null) {
                        z = viewOffsetHelper.setTopAndBottomOffset(i4);
                    } else {
                        this.tempTopBottomOffset = i4;
                        z = false;
                    }
                    int i9 = topBottomOffsetForScrollingSibling - clamp;
                    this.offsetDelta = clamp - i4;
                    int i10 = 1;
                    if (z) {
                        for (int i11 = 0; i11 < appBarLayout.getChildCount(); i11++) {
                            LayoutParams layoutParams2 = (LayoutParams) appBarLayout.getChildAt(i11).getLayoutParams();
                            ChildScrollEffect childScrollEffect = layoutParams2.scrollEffect;
                            if (!(childScrollEffect == null || (layoutParams2.scrollFlags & 1) == 0)) {
                                View childAt2 = appBarLayout.getChildAt(i11);
                                CompressChildScrollEffect compressChildScrollEffect = (CompressChildScrollEffect) childScrollEffect;
                                Rect rect = compressChildScrollEffect.relativeRect;
                                childAt2.getDrawingRect(rect);
                                appBarLayout.offsetDescendantRectToMyCoords(childAt2, rect);
                                rect.offset(0, -appBarLayout.getTopInset());
                                float abs2 = compressChildScrollEffect.relativeRect.top - Math.abs(getTopAndBottomOffset());
                                float f2 = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
                                if (abs2 <= HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                                    float abs3 = Math.abs(abs2 / compressChildScrollEffect.relativeRect.height());
                                    if (abs3 >= HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                                        if (abs3 > 1.0f) {
                                            f2 = 1.0f;
                                        } else {
                                            f2 = abs3;
                                        }
                                    }
                                    float f3 = 1.0f - f2;
                                    float height = (-abs2) - ((compressChildScrollEffect.relativeRect.height() * 0.3f) * (1.0f - (f3 * f3)));
                                    childAt2.setTranslationY(height);
                                    childAt2.getDrawingRect(compressChildScrollEffect.ghostRect);
                                    compressChildScrollEffect.ghostRect.offset(0, (int) (-height));
                                    Rect rect2 = compressChildScrollEffect.ghostRect;
                                    WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap3 = ViewCompat.sViewPropertyAnimatorMap;
                                    ViewCompat.Api18Impl.setClipBounds(childAt2, rect2);
                                } else {
                                    WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap4 = ViewCompat.sViewPropertyAnimatorMap;
                                    ViewCompat.Api18Impl.setClipBounds(childAt2, null);
                                    childAt2.setTranslationY(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                                }
                            }
                        }
                    }
                    if (!z && appBarLayout.haveChildWithInterpolator && (orDefault = coordinatorLayout.mChildDag.mGraph.getOrDefault(appBarLayout, null)) != null && !orDefault.isEmpty()) {
                        for (int i12 = 0; i12 < orDefault.size(); i12++) {
                            View view2 = orDefault.get(i12);
                            CoordinatorLayout.Behavior behavior = ((CoordinatorLayout.LayoutParams) view2.getLayoutParams()).mBehavior;
                            if (behavior != null) {
                                behavior.onDependentViewChanged(coordinatorLayout, view2, appBarLayout);
                            }
                        }
                    }
                    appBarLayout.onOffsetChanged(getTopAndBottomOffset());
                    if (clamp < topBottomOffsetForScrollingSibling) {
                        i10 = -1;
                    }
                    updateAppBarLayoutDrawableState(coordinatorLayout, appBarLayout, clamp, i10, false);
                    i6 = i9;
                }
            }
            updateAccessibilityActions(coordinatorLayout, appBarLayout);
            return i6;
        }

        public final void updateAccessibilityActions(final CoordinatorLayout coordinatorLayout, final T t) {
            AccessibilityNodeInfoCompat.AccessibilityActionCompat accessibilityActionCompat = AccessibilityNodeInfoCompat.AccessibilityActionCompat.ACTION_SCROLL_FORWARD;
            ViewCompat.removeActionWithId(accessibilityActionCompat.getId(), coordinatorLayout);
            ViewCompat.notifyViewAccessibilityStateChangedIfNeeded(coordinatorLayout, 0);
            AccessibilityNodeInfoCompat.AccessibilityActionCompat accessibilityActionCompat2 = AccessibilityNodeInfoCompat.AccessibilityActionCompat.ACTION_SCROLL_BACKWARD;
            ViewCompat.removeActionWithId(accessibilityActionCompat2.getId(), coordinatorLayout);
            ViewCompat.notifyViewAccessibilityStateChangedIfNeeded(coordinatorLayout, 0);
            final View findFirstScrollingChild = findFirstScrollingChild(coordinatorLayout);
            if (findFirstScrollingChild != null && t.getTotalScrollRange() != 0 && (((CoordinatorLayout.LayoutParams) findFirstScrollingChild.getLayoutParams()).mBehavior instanceof ScrollingViewBehavior)) {
                if (getTopBottomOffsetForScrollingSibling() != (-t.getTotalScrollRange()) && findFirstScrollingChild.canScrollVertically(1)) {
                    ViewCompat.replaceAccessibilityAction(coordinatorLayout, accessibilityActionCompat, new AccessibilityViewCommand() { // from class: com.google.android.material.appbar.AppBarLayout.BaseBehavior.3
                        @Override // androidx.core.view.accessibility.AccessibilityViewCommand
                        public final boolean perform(View view) {
                            AppBarLayout appBarLayout = AppBarLayout.this;
                            boolean z = r2;
                            appBarLayout.getClass();
                            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                            appBarLayout.setExpanded(z, ViewCompat.Api19Impl.isLaidOut(appBarLayout), true);
                            return true;
                        }
                    });
                }
                if (getTopBottomOffsetForScrollingSibling() == 0) {
                    return;
                }
                if (findFirstScrollingChild.canScrollVertically(-1)) {
                    final int i = -t.getDownNestedPreScrollRange();
                    if (i != 0) {
                        ViewCompat.replaceAccessibilityAction(coordinatorLayout, accessibilityActionCompat2, new AccessibilityViewCommand() { // from class: com.google.android.material.appbar.AppBarLayout.BaseBehavior.2
                            @Override // androidx.core.view.accessibility.AccessibilityViewCommand
                            public final boolean perform(View view) {
                                BaseBehavior.this.onNestedPreScroll(coordinatorLayout, t, findFirstScrollingChild, i, new int[]{0, 0});
                                return true;
                            }
                        });
                        return;
                    }
                    return;
                }
                ViewCompat.replaceAccessibilityAction(coordinatorLayout, accessibilityActionCompat2, new AccessibilityViewCommand() { // from class: com.google.android.material.appbar.AppBarLayout.BaseBehavior.3
                    @Override // androidx.core.view.accessibility.AccessibilityViewCommand
                    public final boolean perform(View view) {
                        AppBarLayout appBarLayout = AppBarLayout.this;
                        boolean z = r2;
                        appBarLayout.getClass();
                        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                        appBarLayout.setExpanded(z, ViewCompat.Api19Impl.isLaidOut(appBarLayout), true);
                        return true;
                    }
                });
            }
        }

        public static View findFirstScrollingChild(CoordinatorLayout coordinatorLayout) {
            int childCount = coordinatorLayout.getChildCount();
            for (int i = 0; i < childCount; i++) {
                View childAt = coordinatorLayout.getChildAt(i);
                if ((childAt instanceof NestedScrollingChild) || (childAt instanceof ListView) || (childAt instanceof ScrollView)) {
                    return childAt;
                }
            }
            return null;
        }

        /* JADX WARN: Removed duplicated region for block: B:29:0x0063  */
        /* JADX WARN: Removed duplicated region for block: B:32:0x0071  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public static void updateAppBarLayoutDrawableState(androidx.coordinatorlayout.widget.CoordinatorLayout r7, com.google.android.material.appbar.AppBarLayout r8, int r9, int r10, boolean r11) {
            /*
                int r0 = java.lang.Math.abs(r9)
                int r1 = r8.getChildCount()
                r2 = 0
                r3 = r2
            La:
                r4 = 0
                if (r3 >= r1) goto L21
                android.view.View r5 = r8.getChildAt(r3)
                int r6 = r5.getTop()
                if (r0 < r6) goto L1e
                int r6 = r5.getBottom()
                if (r0 > r6) goto L1e
                goto L22
            L1e:
                int r3 = r3 + 1
                goto La
            L21:
                r5 = r4
            L22:
                r0 = 1
                if (r5 == 0) goto L5e
                android.view.ViewGroup$LayoutParams r1 = r5.getLayoutParams()
                com.google.android.material.appbar.AppBarLayout$LayoutParams r1 = (com.google.android.material.appbar.AppBarLayout.LayoutParams) r1
                int r1 = r1.scrollFlags
                r3 = r1 & 1
                if (r3 == 0) goto L5e
                java.util.WeakHashMap<android.view.View, androidx.core.view.ViewPropertyAnimatorCompat> r3 = androidx.core.view.ViewCompat.sViewPropertyAnimatorMap
                int r3 = androidx.core.view.ViewCompat.Api16Impl.getMinimumHeight(r5)
                if (r10 <= 0) goto L4b
                r10 = r1 & 12
                if (r10 == 0) goto L4b
                int r9 = -r9
                int r10 = r5.getBottom()
                int r10 = r10 - r3
                int r1 = r8.getTopInset()
                int r10 = r10 - r1
                if (r9 < r10) goto L5e
                goto L5c
            L4b:
                r10 = r1 & 2
                if (r10 == 0) goto L5e
                int r9 = -r9
                int r10 = r5.getBottom()
                int r10 = r10 - r3
                int r1 = r8.getTopInset()
                int r10 = r10 - r1
                if (r9 < r10) goto L5e
            L5c:
                r9 = r0
                goto L5f
            L5e:
                r9 = r2
            L5f:
                boolean r10 = r8.liftOnScroll
                if (r10 == 0) goto L6b
                android.view.View r9 = findFirstScrollingChild(r7)
                boolean r9 = r8.shouldLift(r9)
            L6b:
                boolean r9 = r8.setLiftedState(r9)
                if (r11 != 0) goto Lb1
                if (r9 == 0) goto Lb4
                androidx.coordinatorlayout.widget.DirectedAcyclicGraph<android.view.View> r7 = r7.mChildDag
                androidx.collection.SimpleArrayMap<T, java.util.ArrayList<T>> r7 = r7.mGraph
                java.lang.Object r7 = r7.getOrDefault(r8, r4)
                java.util.ArrayList r7 = (java.util.ArrayList) r7
                if (r7 != 0) goto L80
                goto L85
            L80:
                java.util.ArrayList r4 = new java.util.ArrayList
                r4.<init>(r7)
            L85:
                if (r4 != 0) goto L8b
                java.util.List r4 = java.util.Collections.emptyList()
            L8b:
                int r7 = r4.size()
                r9 = r2
            L90:
                if (r9 >= r7) goto Laf
                java.lang.Object r10 = r4.get(r9)
                android.view.View r10 = (android.view.View) r10
                android.view.ViewGroup$LayoutParams r10 = r10.getLayoutParams()
                androidx.coordinatorlayout.widget.CoordinatorLayout$LayoutParams r10 = (androidx.coordinatorlayout.widget.CoordinatorLayout.LayoutParams) r10
                androidx.coordinatorlayout.widget.CoordinatorLayout$Behavior r10 = r10.mBehavior
                boolean r11 = r10 instanceof com.google.android.material.appbar.AppBarLayout.ScrollingViewBehavior
                if (r11 == 0) goto Lac
                com.google.android.material.appbar.AppBarLayout$ScrollingViewBehavior r10 = (com.google.android.material.appbar.AppBarLayout.ScrollingViewBehavior) r10
                int r7 = r10.overlayTop
                if (r7 == 0) goto Laf
                r2 = r0
                goto Laf
            Lac:
                int r9 = r9 + 1
                goto L90
            Laf:
                if (r2 == 0) goto Lb4
            Lb1:
                r8.jumpDrawablesToCurrentState()
            Lb4:
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.appbar.AppBarLayout.BaseBehavior.updateAppBarLayoutDrawableState(androidx.coordinatorlayout.widget.CoordinatorLayout, com.google.android.material.appbar.AppBarLayout, int, int, boolean):void");
        }

        public final void animateOffsetTo(final CoordinatorLayout coordinatorLayout, final AppBarLayout appBarLayout, int i) {
            int i2;
            int abs = Math.abs(getTopBottomOffsetForScrollingSibling() - i);
            float abs2 = Math.abs((float) HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            if (abs2 > HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                i2 = Math.round((abs / abs2) * 1000.0f) * 3;
            } else {
                i2 = (int) (((abs / appBarLayout.getHeight()) + 1.0f) * 150.0f);
            }
            int topBottomOffsetForScrollingSibling = getTopBottomOffsetForScrollingSibling();
            if (topBottomOffsetForScrollingSibling == i) {
                ValueAnimator valueAnimator = this.offsetAnimator;
                if (valueAnimator != null && valueAnimator.isRunning()) {
                    this.offsetAnimator.cancel();
                    return;
                }
                return;
            }
            ValueAnimator valueAnimator2 = this.offsetAnimator;
            if (valueAnimator2 == null) {
                ValueAnimator valueAnimator3 = new ValueAnimator();
                this.offsetAnimator = valueAnimator3;
                valueAnimator3.setInterpolator(AnimationUtils.DECELERATE_INTERPOLATOR);
                this.offsetAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.google.android.material.appbar.AppBarLayout.BaseBehavior.1
                    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                    public final void onAnimationUpdate(ValueAnimator valueAnimator4) {
                        BaseBehavior.this.setHeaderTopBottomOffset(coordinatorLayout, appBarLayout, ((Integer) valueAnimator4.getAnimatedValue()).intValue());
                    }
                });
            } else {
                valueAnimator2.cancel();
            }
            this.offsetAnimator.setDuration(Math.min(i2, 600));
            this.offsetAnimator.setIntValues(topBottomOffsetForScrollingSibling, i);
            this.offsetAnimator.start();
        }

        @Override // com.google.android.material.appbar.HeaderBehavior
        public final int getTopBottomOffsetForScrollingSibling() {
            return getTopAndBottomOffset() + this.offsetDelta;
        }

        public final SavedState saveScrollState(Parcelable parcelable, T t) {
            boolean z;
            boolean z2;
            int topAndBottomOffset = getTopAndBottomOffset();
            int childCount = t.getChildCount();
            boolean z3 = false;
            for (int i = 0; i < childCount; i++) {
                View childAt = t.getChildAt(i);
                int bottom = childAt.getBottom() + topAndBottomOffset;
                if (childAt.getTop() + topAndBottomOffset <= 0 && bottom >= 0) {
                    if (parcelable == null) {
                        parcelable = AbsSavedState.EMPTY_STATE;
                    }
                    SavedState savedState = new SavedState(parcelable);
                    if (topAndBottomOffset == 0) {
                        z = true;
                    } else {
                        z = false;
                    }
                    savedState.fullyExpanded = z;
                    if (z || (-topAndBottomOffset) < t.getTotalScrollRange()) {
                        z2 = false;
                    } else {
                        z2 = true;
                    }
                    savedState.fullyScrolled = z2;
                    savedState.firstVisibleChildIndex = i;
                    WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                    if (bottom == t.getTopInset() + ViewCompat.Api16Impl.getMinimumHeight(childAt)) {
                        z3 = true;
                    }
                    savedState.firstVisibleChildAtMinimumHeight = z3;
                    savedState.firstVisibleChildPercentageShown = bottom / childAt.getHeight();
                    return savedState;
                }
            }
            return null;
        }

        public final void snapToChildIfNeeded(CoordinatorLayout coordinatorLayout, T t) {
            boolean z;
            boolean z2;
            boolean z3;
            boolean z4;
            int paddingTop = t.getPaddingTop() + t.getTopInset();
            int topBottomOffsetForScrollingSibling = getTopBottomOffsetForScrollingSibling() - paddingTop;
            int childCount = t.getChildCount();
            int i = 0;
            while (true) {
                z = true;
                if (i >= childCount) {
                    i = -1;
                    break;
                }
                View childAt = t.getChildAt(i);
                int top = childAt.getTop();
                int bottom = childAt.getBottom();
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                if ((layoutParams.scrollFlags & 32) == 32) {
                    z4 = true;
                } else {
                    z4 = false;
                }
                if (z4) {
                    top -= ((LinearLayout.LayoutParams) layoutParams).topMargin;
                    bottom += ((LinearLayout.LayoutParams) layoutParams).bottomMargin;
                }
                int i2 = -topBottomOffsetForScrollingSibling;
                if (top <= i2 && bottom >= i2) {
                    break;
                }
                i++;
            }
            if (i >= 0) {
                View childAt2 = t.getChildAt(i);
                LayoutParams layoutParams2 = (LayoutParams) childAt2.getLayoutParams();
                int i3 = layoutParams2.scrollFlags;
                if ((i3 & 17) == 17) {
                    int i4 = -childAt2.getTop();
                    int i5 = -childAt2.getBottom();
                    if (i == 0) {
                        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                        if (ViewCompat.Api16Impl.getFitsSystemWindows(t) && ViewCompat.Api16Impl.getFitsSystemWindows(childAt2)) {
                            i4 -= t.getTopInset();
                        }
                    }
                    if ((i3 & 2) == 2) {
                        z2 = true;
                    } else {
                        z2 = false;
                    }
                    if (z2) {
                        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap2 = ViewCompat.sViewPropertyAnimatorMap;
                        i5 += ViewCompat.Api16Impl.getMinimumHeight(childAt2);
                    } else {
                        if ((i3 & 5) == 5) {
                            z3 = true;
                        } else {
                            z3 = false;
                        }
                        if (z3) {
                            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap3 = ViewCompat.sViewPropertyAnimatorMap;
                            int minimumHeight = ViewCompat.Api16Impl.getMinimumHeight(childAt2) + i5;
                            if (topBottomOffsetForScrollingSibling < minimumHeight) {
                                i4 = minimumHeight;
                            } else {
                                i5 = minimumHeight;
                            }
                        }
                    }
                    if ((i3 & 32) != 32) {
                        z = false;
                    }
                    if (z) {
                        i4 += ((LinearLayout.LayoutParams) layoutParams2).topMargin;
                        i5 -= ((LinearLayout.LayoutParams) layoutParams2).bottomMargin;
                    }
                    if (topBottomOffsetForScrollingSibling < (i5 + i4) / 2) {
                        i4 = i5;
                    }
                    animateOffsetTo(coordinatorLayout, t, MathUtils.clamp(i4 + paddingTop, -t.getTotalScrollRange(), 0));
                }
            }
        }
    }

    /* loaded from: classes.dex */
    public interface BaseOnOffsetChangedListener<T extends AppBarLayout> {
        void onOffsetChanged(int i);
    }

    /* loaded from: classes.dex */
    public static class Behavior extends BaseBehavior<AppBarLayout> {
        public Behavior() {
        }

        public Behavior(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
        }
    }

    /* loaded from: classes.dex */
    public static abstract class ChildScrollEffect {
    }

    /* loaded from: classes.dex */
    public static class CompressChildScrollEffect extends ChildScrollEffect {
        public final Rect relativeRect = new Rect();
        public final Rect ghostRect = new Rect();
    }

    /* loaded from: classes.dex */
    public interface LiftOnScrollListener {
        void onUpdate();
    }

    /* loaded from: classes.dex */
    public static class ScrollingViewBehavior extends HeaderScrollingViewBehavior {
        public ScrollingViewBehavior() {
        }

        public ScrollingViewBehavior(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R$styleable.ScrollingViewBehavior_Layout);
            this.overlayTop = obtainStyledAttributes.getDimensionPixelSize(0, 0);
            obtainStyledAttributes.recycle();
        }

        @Override // com.google.android.material.appbar.HeaderScrollingViewBehavior
        public final float getOverlapRatioForOffset(View view) {
            int i;
            int i2;
            if (view instanceof AppBarLayout) {
                AppBarLayout appBarLayout = (AppBarLayout) view;
                int totalScrollRange = appBarLayout.getTotalScrollRange();
                int downNestedPreScrollRange = appBarLayout.getDownNestedPreScrollRange();
                CoordinatorLayout.Behavior behavior = ((CoordinatorLayout.LayoutParams) appBarLayout.getLayoutParams()).mBehavior;
                if (behavior instanceof BaseBehavior) {
                    i = ((BaseBehavior) behavior).getTopBottomOffsetForScrollingSibling();
                } else {
                    i = 0;
                }
                if ((downNestedPreScrollRange == 0 || totalScrollRange + i > downNestedPreScrollRange) && (i2 = totalScrollRange - downNestedPreScrollRange) != 0) {
                    return (i / i2) + 1.0f;
                }
            }
            return HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        }

        @Override // com.google.android.material.appbar.HeaderScrollingViewBehavior
        public final int getScrollRange(View view) {
            if (view instanceof AppBarLayout) {
                return ((AppBarLayout) view).getTotalScrollRange();
            }
            return view.getMeasuredHeight();
        }

        @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
        public final void onDependentViewRemoved(CoordinatorLayout coordinatorLayout, View view) {
            if (view instanceof AppBarLayout) {
                ViewCompat.removeActionWithId(AccessibilityNodeInfoCompat.AccessibilityActionCompat.ACTION_SCROLL_FORWARD.getId(), coordinatorLayout);
                ViewCompat.notifyViewAccessibilityStateChangedIfNeeded(coordinatorLayout, 0);
                ViewCompat.removeActionWithId(AccessibilityNodeInfoCompat.AccessibilityActionCompat.ACTION_SCROLL_BACKWARD.getId(), coordinatorLayout);
                ViewCompat.notifyViewAccessibilityStateChangedIfNeeded(coordinatorLayout, 0);
            }
        }

        @Override // com.google.android.material.appbar.HeaderScrollingViewBehavior
        public final AppBarLayout findFirstDependency$1(List list) {
            int size = list.size();
            for (int i = 0; i < size; i++) {
                View view = (View) list.get(i);
                if (view instanceof AppBarLayout) {
                    return (AppBarLayout) view;
                }
            }
            return null;
        }

        @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
        public final boolean onDependentViewChanged(CoordinatorLayout coordinatorLayout, View view, View view2) {
            int i;
            CoordinatorLayout.Behavior behavior = ((CoordinatorLayout.LayoutParams) view2.getLayoutParams()).mBehavior;
            if (behavior instanceof BaseBehavior) {
                int bottom = (view2.getBottom() - view.getTop()) + ((BaseBehavior) behavior).offsetDelta + this.verticalLayoutGap;
                if (this.overlayTop == 0) {
                    i = 0;
                } else {
                    float overlapRatioForOffset = getOverlapRatioForOffset(view2);
                    int i2 = this.overlayTop;
                    i = MathUtils.clamp((int) (overlapRatioForOffset * i2), 0, i2);
                }
                int i3 = bottom - i;
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                view.offsetTopAndBottom(i3);
            }
            if (view2 instanceof AppBarLayout) {
                AppBarLayout appBarLayout = (AppBarLayout) view2;
                if (appBarLayout.liftOnScroll) {
                    appBarLayout.setLiftedState(appBarLayout.shouldLift(view));
                }
            }
            return false;
        }

        @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
        public final boolean onRequestChildRectangleOnScreen(CoordinatorLayout coordinatorLayout, View view, Rect rect, boolean z) {
            AppBarLayout appBarLayout;
            List<View> dependencies = coordinatorLayout.getDependencies(view);
            int size = dependencies.size();
            int i = 0;
            while (true) {
                if (i >= size) {
                    appBarLayout = null;
                    break;
                }
                View view2 = dependencies.get(i);
                if (view2 instanceof AppBarLayout) {
                    appBarLayout = (AppBarLayout) view2;
                    break;
                }
                i++;
            }
            if (appBarLayout != null) {
                rect.offset(view.getLeft(), view.getTop());
                Rect rect2 = this.tempRect1;
                rect2.set(0, 0, coordinatorLayout.getWidth(), coordinatorLayout.getHeight());
                if (!rect2.contains(rect)) {
                    appBarLayout.setExpanded(false, !z, true);
                    return true;
                }
            }
            return false;
        }

        @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
        public final boolean layoutDependsOn(View view, View view2) {
            return view2 instanceof AppBarLayout;
        }
    }

    public AppBarLayout(Context context) {
        this(context, null);
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup
    public final ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams();
    }

    @Override // android.widget.LinearLayout
    public final void setOrientation(int i) {
        if (i == 1) {
            super.setOrientation(i);
            return;
        }
        throw new IllegalArgumentException("AppBarLayout is always vertical and does not support horizontal orientation");
    }

    public AppBarLayout(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, R.attr.appBarLayoutStyle);
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup
    /* renamed from: generateDefaultLayoutParams  reason: collision with other method in class */
    public final LinearLayout.LayoutParams mo37generateDefaultLayoutParams() {
        return new LayoutParams();
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.AttachedBehavior
    public final CoordinatorLayout.Behavior<AppBarLayout> getBehavior() {
        Behavior behavior = new Behavior();
        this.behavior = behavior;
        return behavior;
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0047  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int getDownNestedPreScrollRange() {
        /*
            r9 = this;
            int r0 = r9.downPreScrollRange
            r1 = -1
            if (r0 == r1) goto L6
            return r0
        L6:
            int r0 = r9.getChildCount()
            int r0 = r0 + (-1)
            r1 = 0
            r2 = r1
        Le:
            if (r0 < 0) goto L60
            android.view.View r3 = r9.getChildAt(r0)
            android.view.ViewGroup$LayoutParams r4 = r3.getLayoutParams()
            com.google.android.material.appbar.AppBarLayout$LayoutParams r4 = (com.google.android.material.appbar.AppBarLayout.LayoutParams) r4
            int r5 = r3.getMeasuredHeight()
            int r6 = r4.scrollFlags
            r7 = r6 & 5
            r8 = 5
            if (r7 != r8) goto L5a
            int r7 = r4.topMargin
            int r4 = r4.bottomMargin
            int r7 = r7 + r4
            r4 = r6 & 8
            if (r4 == 0) goto L36
            java.util.WeakHashMap<android.view.View, androidx.core.view.ViewPropertyAnimatorCompat> r4 = androidx.core.view.ViewCompat.sViewPropertyAnimatorMap
            int r4 = androidx.core.view.ViewCompat.Api16Impl.getMinimumHeight(r3)
        L34:
            int r4 = r4 + r7
            goto L45
        L36:
            r4 = r6 & 2
            if (r4 == 0) goto L43
            java.util.WeakHashMap<android.view.View, androidx.core.view.ViewPropertyAnimatorCompat> r4 = androidx.core.view.ViewCompat.sViewPropertyAnimatorMap
            int r4 = androidx.core.view.ViewCompat.Api16Impl.getMinimumHeight(r3)
            int r4 = r5 - r4
            goto L34
        L43:
            int r4 = r7 + r5
        L45:
            if (r0 != 0) goto L58
            java.util.WeakHashMap<android.view.View, androidx.core.view.ViewPropertyAnimatorCompat> r6 = androidx.core.view.ViewCompat.sViewPropertyAnimatorMap
            boolean r3 = androidx.core.view.ViewCompat.Api16Impl.getFitsSystemWindows(r3)
            if (r3 == 0) goto L58
            int r3 = r9.getTopInset()
            int r5 = r5 - r3
            int r4 = java.lang.Math.min(r4, r5)
        L58:
            int r2 = r2 + r4
            goto L5d
        L5a:
            if (r2 <= 0) goto L5d
            goto L60
        L5d:
            int r0 = r0 + (-1)
            goto Le
        L60:
            int r0 = java.lang.Math.max(r1, r2)
            r9.downPreScrollRange = r0
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.appbar.AppBarLayout.getDownNestedPreScrollRange():int");
    }

    public final int getDownNestedScrollRange() {
        int i = this.downScrollRange;
        if (i != -1) {
            return i;
        }
        int childCount = getChildCount();
        int i2 = 0;
        int i3 = 0;
        while (true) {
            if (i2 >= childCount) {
                break;
            }
            View childAt = getChildAt(i2);
            LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
            int measuredHeight = ((LinearLayout.LayoutParams) layoutParams).topMargin + ((LinearLayout.LayoutParams) layoutParams).bottomMargin + childAt.getMeasuredHeight();
            int i4 = layoutParams.scrollFlags;
            if ((i4 & 1) == 0) {
                break;
            }
            i3 += measuredHeight;
            if ((i4 & 2) != 0) {
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                i3 -= ViewCompat.Api16Impl.getMinimumHeight(childAt);
                break;
            }
            i2++;
        }
        int max = Math.max(0, i3);
        this.downScrollRange = max;
        return max;
    }

    public final int getTopInset() {
        WindowInsetsCompat windowInsetsCompat = this.lastInsets;
        if (windowInsetsCompat != null) {
            return windowInsetsCompat.getSystemWindowInsetTop();
        }
        return 0;
    }

    public final int getTotalScrollRange() {
        int i = this.totalScrollRange;
        if (i != -1) {
            return i;
        }
        int childCount = getChildCount();
        int i2 = 0;
        int i3 = 0;
        while (true) {
            if (i2 >= childCount) {
                break;
            }
            View childAt = getChildAt(i2);
            LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
            int measuredHeight = childAt.getMeasuredHeight();
            int i4 = layoutParams.scrollFlags;
            if ((i4 & 1) == 0) {
                break;
            }
            int i5 = measuredHeight + ((LinearLayout.LayoutParams) layoutParams).topMargin + ((LinearLayout.LayoutParams) layoutParams).bottomMargin + i3;
            if (i2 == 0) {
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                if (ViewCompat.Api16Impl.getFitsSystemWindows(childAt)) {
                    i5 -= getTopInset();
                }
            }
            i3 = i5;
            if ((i4 & 2) != 0) {
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap2 = ViewCompat.sViewPropertyAnimatorMap;
                i3 -= ViewCompat.Api16Impl.getMinimumHeight(childAt);
                break;
            }
            i2++;
        }
        int max = Math.max(0, i3);
        this.totalScrollRange = max;
        return max;
    }

    public final void invalidateScrollRanges() {
        BaseBehavior.SavedState savedState;
        Behavior behavior = this.behavior;
        if (behavior == null || this.totalScrollRange == -1) {
            savedState = null;
        } else {
            savedState = behavior.saveScrollState(AbsSavedState.EMPTY_STATE, this);
        }
        this.totalScrollRange = -1;
        this.downPreScrollRange = -1;
        this.downScrollRange = -1;
        if (savedState != null) {
            Behavior behavior2 = this.behavior;
            if (behavior2.savedState == null) {
                behavior2.savedState = savedState;
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final int[] onCreateDrawableState(int i) {
        int i2;
        int i3;
        int i4;
        int i5;
        if (this.tmpStatesArray == null) {
            this.tmpStatesArray = new int[4];
        }
        int[] iArr = this.tmpStatesArray;
        int[] onCreateDrawableState = super.onCreateDrawableState(i + iArr.length);
        boolean z = this.liftable;
        if (z) {
            i2 = R.attr.state_liftable;
        } else {
            i2 = -2130969492;
        }
        iArr[0] = i2;
        if (!z || !this.lifted) {
            i3 = -2130969493;
        } else {
            i3 = R.attr.state_lifted;
        }
        iArr[1] = i3;
        if (z) {
            i4 = R.attr.state_collapsible;
        } else {
            i4 = -2130969490;
        }
        iArr[2] = i4;
        if (!z || !this.lifted) {
            i5 = -2130969489;
        } else {
            i5 = R.attr.state_collapsed;
        }
        iArr[3] = i5;
        return View.mergeDrawableStates(onCreateDrawableState, iArr);
    }

    public final void onOffsetChanged(int i) {
        this.currentOffset = i;
        if (!willNotDraw()) {
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            ViewCompat.Api16Impl.postInvalidateOnAnimation(this);
        }
        ArrayList arrayList = this.listeners;
        if (arrayList != null) {
            int size = arrayList.size();
            for (int i2 = 0; i2 < size; i2++) {
                BaseOnOffsetChangedListener baseOnOffsetChangedListener = (BaseOnOffsetChangedListener) this.listeners.get(i2);
                if (baseOnOffsetChangedListener != null) {
                    baseOnOffsetChangedListener.onOffsetChanged(i);
                }
            }
        }
    }

    public final void setExpanded(boolean z, boolean z2, boolean z3) {
        int i;
        int i2;
        if (z) {
            i = 1;
        } else {
            i = 2;
        }
        int i3 = 0;
        if (z2) {
            i2 = 4;
        } else {
            i2 = 0;
        }
        int i4 = i | i2;
        if (z3) {
            i3 = 8;
        }
        this.pendingAction = i4 | i3;
        requestLayout();
    }

    public final boolean setLiftedState(boolean z) {
        float f;
        if (this.lifted == z) {
            return false;
        }
        this.lifted = z;
        refreshDrawableState();
        if (this.liftOnScroll && (getBackground() instanceof MaterialShapeDrawable)) {
            final MaterialShapeDrawable materialShapeDrawable = (MaterialShapeDrawable) getBackground();
            float dimension = getResources().getDimension(R.dimen.design_appbar_elevation);
            if (z) {
                f = 0.0f;
            } else {
                f = dimension;
            }
            if (!z) {
                dimension = 0.0f;
            }
            ValueAnimator valueAnimator = this.elevationOverlayAnimator;
            if (valueAnimator != null) {
                valueAnimator.cancel();
            }
            ValueAnimator ofFloat = ValueAnimator.ofFloat(f, dimension);
            this.elevationOverlayAnimator = ofFloat;
            ofFloat.setDuration(getResources().getInteger(R.integer.app_bar_elevation_anim_duration));
            this.elevationOverlayAnimator.setInterpolator(AnimationUtils.LINEAR_INTERPOLATOR);
            this.elevationOverlayAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.google.android.material.appbar.AppBarLayout.2
                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public final void onAnimationUpdate(ValueAnimator valueAnimator2) {
                    float floatValue = ((Float) valueAnimator2.getAnimatedValue()).floatValue();
                    materialShapeDrawable.setElevation(floatValue);
                    Drawable drawable = AppBarLayout.this.statusBarForeground;
                    if (drawable instanceof MaterialShapeDrawable) {
                        ((MaterialShapeDrawable) drawable).setElevation(floatValue);
                    }
                    Iterator it = AppBarLayout.this.liftOnScrollListeners.iterator();
                    while (it.hasNext()) {
                        int i = materialShapeDrawable.resolvedTintColor;
                        ((LiftOnScrollListener) it.next()).onUpdate();
                    }
                }
            });
            this.elevationOverlayAnimator.start();
        }
        return true;
    }

    public final boolean shouldLift(View view) {
        int i;
        View view2;
        View view3 = null;
        if (this.liftOnScrollTargetView == null && (i = this.liftOnScrollTargetViewId) != -1) {
            if (view != null) {
                view2 = view.findViewById(i);
            } else {
                view2 = null;
            }
            if (view2 == null && (getParent() instanceof ViewGroup)) {
                view2 = ((ViewGroup) getParent()).findViewById(this.liftOnScrollTargetViewId);
            }
            if (view2 != null) {
                this.liftOnScrollTargetView = new WeakReference<>(view2);
            }
        }
        WeakReference<View> weakReference = this.liftOnScrollTargetView;
        if (weakReference != null) {
            view3 = weakReference.get();
        }
        if (view3 != null) {
            view = view3;
        }
        if (view == null || (!view.canScrollVertically(-1) && view.getScrollY() <= 0)) {
            return false;
        }
        return true;
    }

    /* JADX WARN: Finally extract failed */
    public AppBarLayout(Context context, AttributeSet attributeSet, int i) {
        super(MaterialThemeOverlay.wrap(context, attributeSet, i, R.style.Widget_Design_AppBarLayout), attributeSet, i);
        this.totalScrollRange = -1;
        this.downPreScrollRange = -1;
        this.downScrollRange = -1;
        boolean z = false;
        this.pendingAction = 0;
        this.liftOnScrollListeners = new ArrayList();
        Context context2 = getContext();
        setOrientation(1);
        if (getOutlineProvider() == ViewOutlineProvider.BACKGROUND) {
            setOutlineProvider(ViewOutlineProvider.BOUNDS);
        }
        Context context3 = getContext();
        TypedArray obtainStyledAttributes = ThemeEnforcement.obtainStyledAttributes(context3, attributeSet, ViewUtilsLollipop.STATE_LIST_ANIM_ATTRS, i, R.style.Widget_Design_AppBarLayout, new int[0]);
        try {
            if (obtainStyledAttributes.hasValue(0)) {
                setStateListAnimator(AnimatorInflater.loadStateListAnimator(context3, obtainStyledAttributes.getResourceId(0, 0)));
            }
            obtainStyledAttributes.recycle();
            TypedArray obtainStyledAttributes2 = ThemeEnforcement.obtainStyledAttributes(context2, attributeSet, R$styleable.AppBarLayout, i, R.style.Widget_Design_AppBarLayout, new int[0]);
            Drawable drawable = obtainStyledAttributes2.getDrawable(0);
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            ViewCompat.Api16Impl.setBackground(this, drawable);
            if (getBackground() instanceof ColorDrawable) {
                MaterialShapeDrawable materialShapeDrawable = new MaterialShapeDrawable();
                materialShapeDrawable.setFillColor(ColorStateList.valueOf(((ColorDrawable) getBackground()).getColor()));
                materialShapeDrawable.initializeElevationOverlay(context2);
                ViewCompat.Api16Impl.setBackground(this, materialShapeDrawable);
            }
            if (obtainStyledAttributes2.hasValue(4)) {
                setExpanded(obtainStyledAttributes2.getBoolean(4, false), false, false);
            }
            if (obtainStyledAttributes2.hasValue(3)) {
                int integer = getResources().getInteger(R.integer.app_bar_elevation_anim_duration);
                StateListAnimator stateListAnimator = new StateListAnimator();
                long j = integer;
                stateListAnimator.addState(new int[]{16842910, R.attr.state_liftable, -2130969493}, ObjectAnimator.ofFloat(this, "elevation", HingeAngleProviderKt.FULLY_CLOSED_DEGREES).setDuration(j));
                stateListAnimator.addState(new int[]{16842910}, ObjectAnimator.ofFloat(this, "elevation", obtainStyledAttributes2.getDimensionPixelSize(3, 0)).setDuration(j));
                stateListAnimator.addState(new int[0], ObjectAnimator.ofFloat(this, "elevation", HingeAngleProviderKt.FULLY_CLOSED_DEGREES).setDuration(0L));
                setStateListAnimator(stateListAnimator);
            }
            if (obtainStyledAttributes2.hasValue(2)) {
                setKeyboardNavigationCluster(obtainStyledAttributes2.getBoolean(2, false));
            }
            if (obtainStyledAttributes2.hasValue(1)) {
                setTouchscreenBlocksFocus(obtainStyledAttributes2.getBoolean(1, false));
            }
            this.liftOnScroll = obtainStyledAttributes2.getBoolean(5, false);
            this.liftOnScrollTargetViewId = obtainStyledAttributes2.getResourceId(6, -1);
            Drawable drawable2 = obtainStyledAttributes2.getDrawable(7);
            Drawable drawable3 = this.statusBarForeground;
            if (drawable3 != drawable2) {
                Drawable drawable4 = null;
                if (drawable3 != null) {
                    drawable3.setCallback(null);
                }
                drawable4 = drawable2 != null ? drawable2.mutate() : drawable4;
                this.statusBarForeground = drawable4;
                if (drawable4 != null) {
                    if (drawable4.isStateful()) {
                        this.statusBarForeground.setState(getDrawableState());
                    }
                    this.statusBarForeground.setLayoutDirection(ViewCompat.Api17Impl.getLayoutDirection(this));
                    this.statusBarForeground.setVisible(getVisibility() == 0, false);
                    this.statusBarForeground.setCallback(this);
                }
                if (this.statusBarForeground != null && getTopInset() > 0) {
                    z = true;
                }
                setWillNotDraw(!z);
                ViewCompat.Api16Impl.postInvalidateOnAnimation(this);
            }
            obtainStyledAttributes2.recycle();
            ViewCompat.Api21Impl.setOnApplyWindowInsetsListener(this, new OnApplyWindowInsetsListener() { // from class: com.google.android.material.appbar.AppBarLayout.1
                @Override // androidx.core.view.OnApplyWindowInsetsListener
                public final WindowInsetsCompat onApplyWindowInsets(View view, WindowInsetsCompat windowInsetsCompat) {
                    WindowInsetsCompat windowInsetsCompat2;
                    boolean z2;
                    AppBarLayout appBarLayout = AppBarLayout.this;
                    appBarLayout.getClass();
                    WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap2 = ViewCompat.sViewPropertyAnimatorMap;
                    if (ViewCompat.Api16Impl.getFitsSystemWindows(appBarLayout)) {
                        windowInsetsCompat2 = windowInsetsCompat;
                    } else {
                        windowInsetsCompat2 = null;
                    }
                    if (!Objects.equals(appBarLayout.lastInsets, windowInsetsCompat2)) {
                        appBarLayout.lastInsets = windowInsetsCompat2;
                        if (appBarLayout.statusBarForeground == null || appBarLayout.getTopInset() <= 0) {
                            z2 = false;
                        } else {
                            z2 = true;
                        }
                        appBarLayout.setWillNotDraw(!z2);
                        appBarLayout.requestLayout();
                    }
                    return windowInsetsCompat;
                }
            });
        } catch (Throwable th) {
            obtainStyledAttributes.recycle();
            throw th;
        }
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
        boolean z;
        super.draw(canvas);
        if (this.statusBarForeground == null || getTopInset() <= 0) {
            z = false;
        } else {
            z = true;
        }
        if (z) {
            int save = canvas.save();
            canvas.translate(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, -this.currentOffset);
            this.statusBarForeground.draw(canvas);
            canvas.restoreToCount(save);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        int[] drawableState = getDrawableState();
        Drawable drawable = this.statusBarForeground;
        if (drawable != null && drawable.isStateful() && drawable.setState(drawableState)) {
            invalidateDrawable(drawable);
        }
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new LayoutParams(getContext(), attributeSet);
    }

    public final int getMinimumHeightForVisibleOverlappingContent() {
        int topInset = getTopInset();
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        int minimumHeight = ViewCompat.Api16Impl.getMinimumHeight(this);
        if (minimumHeight == 0) {
            int childCount = getChildCount();
            if (childCount >= 1) {
                minimumHeight = ViewCompat.Api16Impl.getMinimumHeight(getChildAt(childCount - 1));
            } else {
                minimumHeight = 0;
            }
            if (minimumHeight == 0) {
                return getHeight() / 3;
            }
        }
        return (minimumHeight * 2) + topInset;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        Drawable background = getBackground();
        if (background instanceof MaterialShapeDrawable) {
            R$layout.setParentAbsoluteElevation(this, (MaterialShapeDrawable) background);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        WeakReference<View> weakReference = this.liftOnScrollTargetView;
        if (weakReference != null) {
            weakReference.clear();
        }
        this.liftOnScrollTargetView = null;
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        boolean z2;
        boolean z3;
        super.onLayout(z, i, i2, i3, i4);
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        boolean z4 = true;
        if (ViewCompat.Api16Impl.getFitsSystemWindows(this) && shouldOffsetFirstChild()) {
            int topInset = getTopInset();
            for (int childCount = getChildCount() - 1; childCount >= 0; childCount--) {
                getChildAt(childCount).offsetTopAndBottom(topInset);
            }
        }
        invalidateScrollRanges();
        this.haveChildWithInterpolator = false;
        int childCount2 = getChildCount();
        int i5 = 0;
        while (true) {
            if (i5 >= childCount2) {
                break;
            } else if (((LayoutParams) getChildAt(i5).getLayoutParams()).scrollInterpolator != null) {
                this.haveChildWithInterpolator = true;
                break;
            } else {
                i5++;
            }
        }
        Drawable drawable = this.statusBarForeground;
        if (drawable != null) {
            drawable.setBounds(0, 0, getWidth(), getTopInset());
        }
        if (!this.liftOnScroll) {
            int childCount3 = getChildCount();
            int i6 = 0;
            while (true) {
                if (i6 >= childCount3) {
                    z2 = false;
                    break;
                }
                int i7 = ((LayoutParams) getChildAt(i6).getLayoutParams()).scrollFlags;
                if ((i7 & 1) != 1 || (i7 & 10) == 0) {
                    z3 = false;
                } else {
                    z3 = true;
                }
                if (z3) {
                    z2 = true;
                    break;
                }
                i6++;
            }
            if (!z2) {
                z4 = false;
            }
        }
        if (this.liftable != z4) {
            this.liftable = z4;
            refreshDrawableState();
        }
    }

    @Override // android.widget.LinearLayout, android.view.View
    public final void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
        int mode = View.MeasureSpec.getMode(i2);
        if (mode != 1073741824) {
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            if (ViewCompat.Api16Impl.getFitsSystemWindows(this) && shouldOffsetFirstChild()) {
                int measuredHeight = getMeasuredHeight();
                if (mode == Integer.MIN_VALUE) {
                    measuredHeight = MathUtils.clamp(getTopInset() + getMeasuredHeight(), 0, View.MeasureSpec.getSize(i2));
                } else if (mode == 0) {
                    measuredHeight += getTopInset();
                }
                setMeasuredDimension(getMeasuredWidth(), measuredHeight);
            }
        }
        invalidateScrollRanges();
    }

    @Override // android.view.View
    public final void setElevation(float f) {
        super.setElevation(f);
        Drawable background = getBackground();
        if (background instanceof MaterialShapeDrawable) {
            ((MaterialShapeDrawable) background).setElevation(f);
        }
    }

    @Override // android.view.View
    public final void setVisibility(int i) {
        boolean z;
        super.setVisibility(i);
        if (i == 0) {
            z = true;
        } else {
            z = false;
        }
        Drawable drawable = this.statusBarForeground;
        if (drawable != null) {
            drawable.setVisible(z, false);
        }
    }

    public final boolean shouldOffsetFirstChild() {
        if (getChildCount() <= 0) {
            return false;
        }
        View childAt = getChildAt(0);
        if (childAt.getVisibility() == 8) {
            return false;
        }
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        if (!ViewCompat.Api16Impl.getFitsSystemWindows(childAt)) {
            return true;
        }
        return false;
    }

    @Override // android.view.View
    public final boolean verifyDrawable(Drawable drawable) {
        if (super.verifyDrawable(drawable) || drawable == this.statusBarForeground) {
            return true;
        }
        return false;
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup
    /* renamed from: generateLayoutParams  reason: collision with other method in class */
    public final LinearLayout.LayoutParams mo38generateLayoutParams(AttributeSet attributeSet) {
        return new LayoutParams(getContext(), attributeSet);
    }

    public static LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        if (layoutParams instanceof LinearLayout.LayoutParams) {
            return new LayoutParams((LinearLayout.LayoutParams) layoutParams);
        }
        if (layoutParams instanceof ViewGroup.MarginLayoutParams) {
            return new LayoutParams((ViewGroup.MarginLayoutParams) layoutParams);
        }
        return new LayoutParams(layoutParams);
    }

    /* loaded from: classes.dex */
    public static class LayoutParams extends LinearLayout.LayoutParams {
        public ChildScrollEffect scrollEffect;
        public int scrollFlags;
        public Interpolator scrollInterpolator;

        public LayoutParams(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            this.scrollFlags = 1;
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R$styleable.AppBarLayout_Layout);
            this.scrollFlags = obtainStyledAttributes.getInt(1, 0);
            this.scrollEffect = obtainStyledAttributes.getInt(0, 0) != 1 ? null : new CompressChildScrollEffect();
            if (obtainStyledAttributes.hasValue(2)) {
                this.scrollInterpolator = android.view.animation.AnimationUtils.loadInterpolator(context, obtainStyledAttributes.getResourceId(2, 0));
            }
            obtainStyledAttributes.recycle();
        }

        public LayoutParams() {
            super(-1, -2);
            this.scrollFlags = 1;
        }

        public LayoutParams(ViewGroup.LayoutParams layoutParams) {
            super(layoutParams);
            this.scrollFlags = 1;
        }

        public LayoutParams(ViewGroup.MarginLayoutParams marginLayoutParams) {
            super(marginLayoutParams);
            this.scrollFlags = 1;
        }

        public LayoutParams(LinearLayout.LayoutParams layoutParams) {
            super(layoutParams);
            this.scrollFlags = 1;
        }
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup
    public final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof LayoutParams;
    }
}
