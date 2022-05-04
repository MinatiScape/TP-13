package com.google.android.material.bottomappbar;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.content.Context;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.view.View;
import androidx.appcompat.R$layout;
import androidx.appcompat.widget.Toolbar;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.customview.view.AbsSavedState;
import com.android.systemui.shared.R;
import com.google.android.material.animation.MotionSpec;
import com.google.android.material.behavior.HideBottomViewOnScrollBehavior;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.floatingactionbutton.FloatingActionButtonImpl;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public final class BottomAppBar extends Toolbar implements CoordinatorLayout.AttachedBehavior {
    public static final /* synthetic */ int $r8$clinit = 0;
    public Behavior behavior;
    public int fabAlignmentMode;
    public boolean fabAttached;

    /* loaded from: classes.dex */
    public static class Behavior extends HideBottomViewOnScrollBehavior<BottomAppBar> {
        public WeakReference<BottomAppBar> viewRef;
        public final AnonymousClass1 fabLayoutListener = new View.OnLayoutChangeListener() { // from class: com.google.android.material.bottomappbar.BottomAppBar.Behavior.1
            @Override // android.view.View.OnLayoutChangeListener
            public final void onLayoutChange(View view, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
                if (Behavior.this.viewRef.get() == null || !(view instanceof FloatingActionButton)) {
                    view.removeOnLayoutChangeListener(this);
                    return;
                }
                FloatingActionButton floatingActionButton = (FloatingActionButton) view;
                Behavior.this.fabContentRect.set(0, 0, floatingActionButton.getMeasuredWidth(), floatingActionButton.getMeasuredHeight());
                throw null;
            }
        };
        public final Rect fabContentRect = new Rect();

        /* JADX WARN: Type inference failed for: r0v0, types: [com.google.android.material.bottomappbar.BottomAppBar$Behavior$1] */
        public Behavior() {
        }

        @Override // com.google.android.material.behavior.HideBottomViewOnScrollBehavior, androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
        public final boolean onLayoutChild(CoordinatorLayout coordinatorLayout, View view, int i) {
            final BottomAppBar bottomAppBar = (BottomAppBar) view;
            this.viewRef = new WeakReference<>(bottomAppBar);
            int i2 = BottomAppBar.$r8$clinit;
            View findDependentView = bottomAppBar.findDependentView();
            if (findDependentView != null) {
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                if (!ViewCompat.Api19Impl.isLaidOut(findDependentView)) {
                    ((CoordinatorLayout.LayoutParams) findDependentView.getLayoutParams()).anchorGravity = 49;
                    if (findDependentView instanceof FloatingActionButton) {
                        FloatingActionButton floatingActionButton = (FloatingActionButton) findDependentView;
                        if (floatingActionButton.getImpl().showMotionSpec == null) {
                            floatingActionButton.getImpl().showMotionSpec = MotionSpec.createFromResource(floatingActionButton.getContext(), R.animator.mtrl_fab_show_motion_spec);
                        }
                        if (floatingActionButton.getImpl().hideMotionSpec == null) {
                            floatingActionButton.getImpl().hideMotionSpec = MotionSpec.createFromResource(floatingActionButton.getContext(), R.animator.mtrl_fab_hide_motion_spec);
                        }
                        floatingActionButton.addOnLayoutChangeListener(this.fabLayoutListener);
                        FloatingActionButtonImpl impl = floatingActionButton.getImpl();
                        if (impl.hideListeners == null) {
                            impl.hideListeners = new ArrayList<>();
                        }
                        impl.hideListeners.add(null);
                        AnimatorListenerAdapter animatorListenerAdapter = new AnimatorListenerAdapter() { // from class: com.google.android.material.bottomappbar.BottomAppBar.9
                            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                            public final void onAnimationStart(Animator animator) {
                                BottomAppBar.this.getClass();
                                throw null;
                            }
                        };
                        FloatingActionButtonImpl impl2 = floatingActionButton.getImpl();
                        if (impl2.showListeners == null) {
                            impl2.showListeners = new ArrayList<>();
                        }
                        impl2.showListeners.add(animatorListenerAdapter);
                        FloatingActionButtonImpl impl3 = floatingActionButton.getImpl();
                        FloatingActionButton.TransformationCallbackWrapper transformationCallbackWrapper = new FloatingActionButton.TransformationCallbackWrapper();
                        if (impl3.transformationCallbacks == null) {
                            impl3.transformationCallbacks = new ArrayList<>();
                        }
                        impl3.transformationCallbacks.add(transformationCallbackWrapper);
                    }
                    throw null;
                }
            }
            coordinatorLayout.onLayoutChild(bottomAppBar, i);
            super.onLayoutChild(coordinatorLayout, bottomAppBar, i);
            return false;
        }

        @Override // com.google.android.material.behavior.HideBottomViewOnScrollBehavior, androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
        public final boolean onStartNestedScroll(CoordinatorLayout coordinatorLayout, View view, View view2, int i, int i2) {
            BottomAppBar bottomAppBar = (BottomAppBar) view;
            return false;
        }

        /* JADX WARN: Type inference failed for: r1v1, types: [com.google.android.material.bottomappbar.BottomAppBar$Behavior$1] */
        public Behavior(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
        }
    }

    /* loaded from: classes.dex */
    public static class SavedState extends AbsSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.ClassLoaderCreator<SavedState>() { // from class: com.google.android.material.bottomappbar.BottomAppBar.SavedState.1
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
        public int fabAlignmentMode;
        public boolean fabAttached;

        public SavedState(Toolbar.SavedState savedState) {
            super(savedState);
        }

        public SavedState(Parcel parcel, ClassLoader classLoader) {
            super(parcel, classLoader);
            this.fabAlignmentMode = parcel.readInt();
            this.fabAttached = parcel.readInt() != 0;
        }

        @Override // androidx.customview.view.AbsSavedState, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i) {
            parcel.writeParcelable(this.mSuperState, i);
            parcel.writeInt(this.fabAlignmentMode);
            parcel.writeInt(this.fabAttached ? 1 : 0);
        }
    }

    @Override // androidx.appcompat.widget.Toolbar
    public final void setSubtitle(CharSequence charSequence) {
    }

    @Override // androidx.appcompat.widget.Toolbar
    public final void setTitle(CharSequence charSequence) {
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.AttachedBehavior
    public final CoordinatorLayout.Behavior getBehavior() {
        if (this.behavior == null) {
            this.behavior = new Behavior();
        }
        return this.behavior;
    }

    @Override // androidx.appcompat.widget.Toolbar, android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.mSuperState);
        this.fabAlignmentMode = savedState.fabAlignmentMode;
        this.fabAttached = savedState.fabAttached;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0033  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final android.view.View findDependentView() {
        /*
            r3 = this;
            android.view.ViewParent r0 = r3.getParent()
            boolean r0 = r0 instanceof androidx.coordinatorlayout.widget.CoordinatorLayout
            r1 = 0
            if (r0 != 0) goto La
            return r1
        La:
            android.view.ViewParent r0 = r3.getParent()
            androidx.coordinatorlayout.widget.CoordinatorLayout r0 = (androidx.coordinatorlayout.widget.CoordinatorLayout) r0
            androidx.coordinatorlayout.widget.DirectedAcyclicGraph<android.view.View> r0 = r0.mChildDag
            androidx.collection.SimpleArrayMap<T, java.util.ArrayList<T>> r0 = r0.mGraph
            java.lang.Object r3 = r0.getOrDefault(r3, r1)
            java.util.ArrayList r3 = (java.util.ArrayList) r3
            if (r3 != 0) goto L1e
            r0 = r1
            goto L23
        L1e:
            java.util.ArrayList r0 = new java.util.ArrayList
            r0.<init>(r3)
        L23:
            if (r0 != 0) goto L29
            java.util.List r0 = java.util.Collections.emptyList()
        L29:
            java.util.Iterator r3 = r0.iterator()
        L2d:
            boolean r0 = r3.hasNext()
            if (r0 == 0) goto L42
            java.lang.Object r0 = r3.next()
            android.view.View r0 = (android.view.View) r0
            boolean r2 = r0 instanceof com.google.android.material.floatingactionbutton.FloatingActionButton
            if (r2 != 0) goto L41
            boolean r2 = r0 instanceof com.google.android.material.floatingactionbutton.ExtendedFloatingActionButton
            if (r2 == 0) goto L2d
        L41:
            return r0
        L42:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.bottomappbar.BottomAppBar.findDependentView():android.view.View");
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        R$layout.setParentAbsoluteElevation(this, null);
        throw null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x004b, code lost:
        if (r2 != false) goto L28;
     */
    @Override // androidx.appcompat.widget.Toolbar, android.view.ViewGroup, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onLayout(boolean r1, int r2, int r3, int r4, int r5) {
        /*
            r0 = this;
            super.onLayout(r1, r2, r3, r4, r5)
            r2 = 0
            if (r1 != 0) goto L67
            r1 = 0
            r3 = r1
        L8:
            int r4 = r0.getChildCount()
            if (r3 >= r4) goto L1c
            android.view.View r4 = r0.getChildAt(r3)
            boolean r5 = r4 instanceof androidx.appcompat.widget.ActionMenuView
            if (r5 == 0) goto L19
            androidx.appcompat.widget.ActionMenuView r4 = (androidx.appcompat.widget.ActionMenuView) r4
            goto L1d
        L19:
            int r3 = r3 + 1
            goto L8
        L1c:
            r4 = r2
        L1d:
            if (r4 == 0) goto L66
            r3 = 1065353216(0x3f800000, float:1.0)
            r4.setAlpha(r3)
            android.view.View r3 = r0.findDependentView()
            boolean r5 = r3 instanceof com.google.android.material.floatingactionbutton.FloatingActionButton
            if (r5 == 0) goto L2f
            r2 = r3
            com.google.android.material.floatingactionbutton.FloatingActionButton r2 = (com.google.android.material.floatingactionbutton.FloatingActionButton) r2
        L2f:
            r3 = 1
            if (r2 == 0) goto L4e
            com.google.android.material.floatingactionbutton.FloatingActionButtonImpl r2 = r2.getImpl()
            com.google.android.material.floatingactionbutton.FloatingActionButton r5 = r2.view
            int r5 = r5.getVisibility()
            if (r5 == 0) goto L44
            int r2 = r2.animState
            r5 = 2
            if (r2 != r5) goto L4a
            goto L48
        L44:
            int r2 = r2.animState
            if (r2 == r3) goto L4a
        L48:
            r2 = r3
            goto L4b
        L4a:
            r2 = r1
        L4b:
            if (r2 == 0) goto L4e
            goto L4f
        L4e:
            r3 = r1
        L4f:
            if (r3 != 0) goto L5a
            com.google.android.material.bottomappbar.BottomAppBar$8 r2 = new com.google.android.material.bottomappbar.BottomAppBar$8
            r2.<init>()
            r2.run()
            goto L66
        L5a:
            int r1 = r0.fabAlignmentMode
            boolean r2 = r0.fabAttached
            com.google.android.material.bottomappbar.BottomAppBar$8 r3 = new com.google.android.material.bottomappbar.BottomAppBar$8
            r3.<init>()
            r3.run()
        L66:
            return
        L67:
            throw r2
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.bottomappbar.BottomAppBar.onLayout(boolean, int, int, int, int):void");
    }

    @Override // androidx.appcompat.widget.Toolbar, android.view.View
    public final Parcelable onSaveInstanceState() {
        SavedState savedState = new SavedState((Toolbar.SavedState) super.onSaveInstanceState());
        savedState.fabAlignmentMode = this.fabAlignmentMode;
        savedState.fabAttached = this.fabAttached;
        return savedState;
    }

    @Override // android.view.View
    public final void setElevation(float f) {
        throw null;
    }

    @Override // androidx.appcompat.widget.Toolbar
    public final void setNavigationIcon(Drawable drawable) {
        super.setNavigationIcon(drawable);
    }
}
