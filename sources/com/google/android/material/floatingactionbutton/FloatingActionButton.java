package com.google.android.material.floatingactionbutton;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Matrix;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.android.material.R$styleable;
import com.google.android.material.animation.MotionSpec;
import com.google.android.material.animation.TransformationCallback;
import com.google.android.material.appbar.AppBarLayout;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.android.material.expandable.ExpandableWidget;
import com.google.android.material.floatingactionbutton.FloatingActionButtonImpl;
import com.google.android.material.internal.DescendantOffsetUtils;
import com.google.android.material.internal.VisibilityAwareImageButton;
import com.google.android.material.shadow.ShadowViewDelegate;
import com.google.android.material.shape.ShapeAppearanceModel;
import com.google.android.material.shape.Shapeable;
import com.google.android.material.stateful.ExtendableSavedState;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public final class FloatingActionButton extends VisibilityAwareImageButton implements ExpandableWidget, Shapeable, CoordinatorLayout.AttachedBehavior {
    public ColorStateList backgroundTint;
    public PorterDuff.Mode backgroundTintMode;
    public FloatingActionButtonImplLollipop impl;

    /* loaded from: classes.dex */
    public static class BaseBehavior<T extends FloatingActionButton> extends CoordinatorLayout.Behavior<T> {
        public boolean autoHideEnabled;
        public Rect tmpRect;

        public BaseBehavior() {
            this.autoHideEnabled = true;
        }

        public void setInternalAutoHideListener(OnVisibilityChangedListener onVisibilityChangedListener) {
        }

        @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
        public final boolean getInsetDodgeRect(View view) {
            ((FloatingActionButton) view).getLeft();
            throw null;
        }

        @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
        public final void onAttachedToLayoutParams(CoordinatorLayout.LayoutParams layoutParams) {
            if (layoutParams.dodgeInsetEdges == 0) {
                layoutParams.dodgeInsetEdges = 80;
            }
        }

        @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
        public final boolean onDependentViewChanged(CoordinatorLayout coordinatorLayout, View view, View view2) {
            boolean z;
            FloatingActionButton floatingActionButton = (FloatingActionButton) view;
            if (view2 instanceof AppBarLayout) {
                updateFabVisibilityForAppBarLayout(coordinatorLayout, (AppBarLayout) view2, floatingActionButton);
            } else {
                ViewGroup.LayoutParams layoutParams = view2.getLayoutParams();
                if (layoutParams instanceof CoordinatorLayout.LayoutParams) {
                    z = ((CoordinatorLayout.LayoutParams) layoutParams).mBehavior instanceof BottomSheetBehavior;
                } else {
                    z = false;
                }
                if (z) {
                    updateFabVisibilityForBottomSheet(view2, floatingActionButton);
                }
            }
            return false;
        }

        @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
        public final boolean onLayoutChild(CoordinatorLayout coordinatorLayout, View view, int i) {
            boolean z;
            FloatingActionButton floatingActionButton = (FloatingActionButton) view;
            List<View> dependencies = coordinatorLayout.getDependencies(floatingActionButton);
            int size = dependencies.size();
            for (int i2 = 0; i2 < size; i2++) {
                View view2 = dependencies.get(i2);
                if (!(view2 instanceof AppBarLayout)) {
                    ViewGroup.LayoutParams layoutParams = view2.getLayoutParams();
                    if (layoutParams instanceof CoordinatorLayout.LayoutParams) {
                        z = ((CoordinatorLayout.LayoutParams) layoutParams).mBehavior instanceof BottomSheetBehavior;
                    } else {
                        z = false;
                    }
                    if (z && updateFabVisibilityForBottomSheet(view2, floatingActionButton)) {
                        break;
                    }
                } else if (updateFabVisibilityForAppBarLayout(coordinatorLayout, (AppBarLayout) view2, floatingActionButton)) {
                    break;
                }
            }
            coordinatorLayout.onLayoutChild(floatingActionButton, i);
            return true;
        }

        public BaseBehavior(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R$styleable.FloatingActionButton_Behavior_Layout);
            this.autoHideEnabled = obtainStyledAttributes.getBoolean(0, true);
            obtainStyledAttributes.recycle();
        }

        public final boolean updateFabVisibilityForAppBarLayout(CoordinatorLayout coordinatorLayout, AppBarLayout appBarLayout, FloatingActionButton floatingActionButton) {
            boolean z;
            CoordinatorLayout.LayoutParams layoutParams = (CoordinatorLayout.LayoutParams) floatingActionButton.getLayoutParams();
            if (this.autoHideEnabled && layoutParams.mAnchorId == appBarLayout.getId() && floatingActionButton.userSetVisibility == 0) {
                z = true;
            } else {
                z = false;
            }
            if (!z) {
                return false;
            }
            if (this.tmpRect == null) {
                this.tmpRect = new Rect();
            }
            Rect rect = this.tmpRect;
            DescendantOffsetUtils.getDescendantRect(coordinatorLayout, appBarLayout, rect);
            if (rect.bottom <= appBarLayout.getMinimumHeightForVisibleOverlappingContent()) {
                floatingActionButton.hide();
            } else {
                floatingActionButton.show();
            }
            return true;
        }

        public final boolean updateFabVisibilityForBottomSheet(View view, FloatingActionButton floatingActionButton) {
            boolean z;
            CoordinatorLayout.LayoutParams layoutParams = (CoordinatorLayout.LayoutParams) floatingActionButton.getLayoutParams();
            if (this.autoHideEnabled && layoutParams.mAnchorId == view.getId() && floatingActionButton.userSetVisibility == 0) {
                z = true;
            } else {
                z = false;
            }
            if (!z) {
                return false;
            }
            if (view.getTop() < (floatingActionButton.getHeight() / 2) + ((ViewGroup.MarginLayoutParams) ((CoordinatorLayout.LayoutParams) floatingActionButton.getLayoutParams())).topMargin) {
                floatingActionButton.hide();
            } else {
                floatingActionButton.show();
            }
            return true;
        }
    }

    /* loaded from: classes.dex */
    public static class Behavior extends BaseBehavior<FloatingActionButton> {
        public Behavior() {
        }

        public Behavior(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
        }

        @Override // com.google.android.material.floatingactionbutton.FloatingActionButton.BaseBehavior
        public /* bridge */ /* synthetic */ void setInternalAutoHideListener(OnVisibilityChangedListener onVisibilityChangedListener) {
            super.setInternalAutoHideListener(onVisibilityChangedListener);
        }
    }

    /* loaded from: classes.dex */
    public static abstract class OnVisibilityChangedListener {
    }

    /* loaded from: classes.dex */
    public class ShadowDelegateImpl implements ShadowViewDelegate {
        public ShadowDelegateImpl() {
        }
    }

    /* loaded from: classes.dex */
    public class TransformationCallbackWrapper<T extends FloatingActionButton> implements FloatingActionButtonImpl.InternalTransformationCallback {
        public final TransformationCallback<T> listener = null;

        public TransformationCallbackWrapper() {
        }

        public final boolean equals(Object obj) {
            if (!(obj instanceof TransformationCallbackWrapper) || !((TransformationCallbackWrapper) obj).listener.equals(this.listener)) {
                return false;
            }
            return true;
        }

        public final int hashCode() {
            return this.listener.hashCode();
        }

        @Override // com.google.android.material.floatingactionbutton.FloatingActionButtonImpl.InternalTransformationCallback
        public final void onScaleChanged() {
            this.listener.onScaleChanged();
        }

        @Override // com.google.android.material.floatingactionbutton.FloatingActionButtonImpl.InternalTransformationCallback
        public final void onTranslationChanged() {
            this.listener.onTranslationChanged();
        }
    }

    @Override // android.widget.ImageView, android.view.View
    public final void onMeasure(int i, int i2) {
        int sizeDimension = (getSizeDimension(0) - 0) / 2;
        getImpl().updatePadding();
        throw null;
    }

    @Override // android.widget.ImageView, android.view.View
    public final void setVisibility(int i) {
        internalSetVisibility(i, true);
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.AttachedBehavior
    public final CoordinatorLayout.Behavior<FloatingActionButton> getBehavior() {
        return new Behavior();
    }

    public final FloatingActionButtonImpl getImpl() {
        if (this.impl == null) {
            this.impl = new FloatingActionButtonImplLollipop(this, new ShadowDelegateImpl());
        }
        return this.impl;
    }

    @Override // android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof ExtendableSavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        ExtendableSavedState extendableSavedState = (ExtendableSavedState) parcelable;
        super.onRestoreInstanceState(extendableSavedState.mSuperState);
        extendableSavedState.extendableStates.getOrDefault("expandableWidgetHelper", null).getClass();
        throw null;
    }

    @Override // android.view.View
    public final void setBackgroundColor(int i) {
        Log.i("FloatingActionButton", "Setting a custom background is not supported.");
    }

    @Override // android.view.View
    public final void setBackgroundDrawable(Drawable drawable) {
        Log.i("FloatingActionButton", "Setting a custom background is not supported.");
    }

    @Override // android.view.View
    public final void setBackgroundResource(int i) {
        Log.i("FloatingActionButton", "Setting a custom background is not supported.");
    }

    @Override // android.view.View
    public final void setBackgroundTintList(ColorStateList colorStateList) {
        if (this.backgroundTint != colorStateList) {
            this.backgroundTint = colorStateList;
            getImpl().getClass();
        }
    }

    @Override // android.view.View
    public final void setBackgroundTintMode(PorterDuff.Mode mode) {
        if (this.backgroundTintMode != mode) {
            this.backgroundTintMode = mode;
            getImpl().getClass();
        }
    }

    @Override // android.widget.ImageView, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        getImpl().onDrawableStateChanged(getDrawableState());
    }

    public final int getSizeDimension(int i) {
        Resources resources = getResources();
        if (i != -1) {
            if (i != 1) {
                return resources.getDimensionPixelSize(R.dimen.design_fab_size_normal);
            }
            return resources.getDimensionPixelSize(R.dimen.design_fab_size_mini);
        } else if (Math.max(resources.getConfiguration().screenWidthDp, resources.getConfiguration().screenHeightDp) < 470) {
            return getSizeDimension(1);
        } else {
            return getSizeDimension(0);
        }
    }

    public final void hide() {
        boolean z;
        AnimatorSet animatorSet;
        final FloatingActionButtonImpl impl = getImpl();
        boolean z2 = true;
        if (impl.view.getVisibility() != 0 ? impl.animState == 2 : impl.animState != 1) {
            z = false;
        } else {
            z = true;
        }
        if (!z) {
            Animator animator = impl.currentAnimator;
            if (animator != null) {
                animator.cancel();
            }
            FloatingActionButton floatingActionButton = impl.view;
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            if (!ViewCompat.Api19Impl.isLaidOut(floatingActionButton) || impl.view.isInEditMode()) {
                z2 = false;
            }
            if (z2) {
                MotionSpec motionSpec = impl.hideMotionSpec;
                if (motionSpec != null) {
                    animatorSet = impl.createAnimator(motionSpec, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                } else {
                    animatorSet = impl.createDefaultAnimator(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 0.4f, 0.4f);
                }
                animatorSet.addListener(new AnimatorListenerAdapter() { // from class: com.google.android.material.floatingactionbutton.FloatingActionButtonImpl.1
                    public boolean cancelled;
                    public final /* synthetic */ boolean val$fromUser = false;
                    public final /* synthetic */ InternalVisibilityChangedListener val$listener = null;

                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public final void onAnimationCancel(Animator animator2) {
                        this.cancelled = true;
                    }

                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public final void onAnimationEnd(Animator animator2) {
                        int i;
                        FloatingActionButtonImpl floatingActionButtonImpl = FloatingActionButtonImpl.this;
                        floatingActionButtonImpl.animState = 0;
                        floatingActionButtonImpl.currentAnimator = null;
                        if (!this.cancelled) {
                            FloatingActionButton floatingActionButton2 = floatingActionButtonImpl.view;
                            boolean z3 = this.val$fromUser;
                            if (z3) {
                                i = 8;
                            } else {
                                i = 4;
                            }
                            floatingActionButton2.internalSetVisibility(i, z3);
                            InternalVisibilityChangedListener internalVisibilityChangedListener = this.val$listener;
                            if (internalVisibilityChangedListener != null) {
                                internalVisibilityChangedListener.onHidden();
                            }
                        }
                    }

                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public final void onAnimationStart(Animator animator2) {
                        FloatingActionButtonImpl.this.view.internalSetVisibility(0, this.val$fromUser);
                        FloatingActionButtonImpl floatingActionButtonImpl = FloatingActionButtonImpl.this;
                        floatingActionButtonImpl.animState = 1;
                        floatingActionButtonImpl.currentAnimator = animator2;
                        this.cancelled = false;
                    }
                });
                ArrayList<Animator.AnimatorListener> arrayList = impl.hideListeners;
                if (arrayList != null) {
                    Iterator<Animator.AnimatorListener> it = arrayList.iterator();
                    while (it.hasNext()) {
                        animatorSet.addListener(it.next());
                    }
                }
                animatorSet.start();
                return;
            }
            impl.view.internalSetVisibility(4, false);
        }
    }

    @Override // android.widget.ImageView, android.view.View
    public final void jumpDrawablesToCurrentState() {
        super.jumpDrawablesToCurrentState();
        getImpl().jumpDrawableToCurrentState();
    }

    /* JADX WARN: Type inference failed for: r1v1, types: [com.google.android.material.floatingactionbutton.FloatingActionButtonImpl$6] */
    @Override // android.widget.ImageView, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        final FloatingActionButtonImpl impl = getImpl();
        impl.getClass();
        if (!(impl instanceof FloatingActionButtonImplLollipop)) {
            ViewTreeObserver viewTreeObserver = impl.view.getViewTreeObserver();
            if (impl.preDrawListener == null) {
                impl.preDrawListener = new ViewTreeObserver.OnPreDrawListener() { // from class: com.google.android.material.floatingactionbutton.FloatingActionButtonImpl.6
                    @Override // android.view.ViewTreeObserver.OnPreDrawListener
                    public final boolean onPreDraw() {
                        FloatingActionButtonImpl floatingActionButtonImpl = FloatingActionButtonImpl.this;
                        float rotation = floatingActionButtonImpl.view.getRotation();
                        if (floatingActionButtonImpl.rotation == rotation) {
                            return true;
                        }
                        floatingActionButtonImpl.rotation = rotation;
                        floatingActionButtonImpl.updateFromViewRotation();
                        return true;
                    }
                };
            }
            viewTreeObserver.addOnPreDrawListener(impl.preDrawListener);
        }
    }

    @Override // android.widget.ImageView, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        FloatingActionButtonImpl impl = getImpl();
        ViewTreeObserver viewTreeObserver = impl.view.getViewTreeObserver();
        FloatingActionButtonImpl.AnonymousClass6 r1 = impl.preDrawListener;
        if (r1 != null) {
            viewTreeObserver.removeOnPreDrawListener(r1);
            impl.preDrawListener = null;
        }
    }

    @Override // android.view.View
    public final Parcelable onSaveInstanceState() {
        Parcelable onSaveInstanceState = super.onSaveInstanceState();
        if (onSaveInstanceState == null) {
            onSaveInstanceState = new Bundle();
        }
        new ExtendableSavedState(onSaveInstanceState);
        throw null;
    }

    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        if (motionEvent.getAction() == 0) {
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            if (ViewCompat.Api19Impl.isLaidOut(this)) {
                getWidth();
                getHeight();
                throw null;
            }
        }
        return super.onTouchEvent(motionEvent);
    }

    @Override // android.view.View
    public final void setElevation(float f) {
        super.setElevation(f);
        getImpl().getClass();
    }

    @Override // android.widget.ImageView
    public final void setImageDrawable(Drawable drawable) {
        if (getDrawable() != drawable) {
            super.setImageDrawable(drawable);
            FloatingActionButtonImpl impl = getImpl();
            impl.imageMatrixScale = impl.imageMatrixScale;
            Matrix matrix = impl.tmpMatrix;
            matrix.reset();
            impl.view.getDrawable();
            impl.view.setImageMatrix(matrix);
        }
    }

    @Override // android.view.View
    public final void setScaleX(float f) {
        super.setScaleX(f);
        ArrayList<FloatingActionButtonImpl.InternalTransformationCallback> arrayList = getImpl().transformationCallbacks;
        if (arrayList != null) {
            Iterator<FloatingActionButtonImpl.InternalTransformationCallback> it = arrayList.iterator();
            while (it.hasNext()) {
                it.next().onScaleChanged();
            }
        }
    }

    @Override // android.view.View
    public final void setScaleY(float f) {
        super.setScaleY(f);
        ArrayList<FloatingActionButtonImpl.InternalTransformationCallback> arrayList = getImpl().transformationCallbacks;
        if (arrayList != null) {
            Iterator<FloatingActionButtonImpl.InternalTransformationCallback> it = arrayList.iterator();
            while (it.hasNext()) {
                it.next().onScaleChanged();
            }
        }
    }

    public void setShadowPaddingEnabled(boolean z) {
        FloatingActionButtonImpl impl = getImpl();
        impl.shadowPaddingEnabled = z;
        impl.updatePadding();
        throw null;
    }

    @Override // com.google.android.material.shape.Shapeable
    public final void setShapeAppearanceModel(ShapeAppearanceModel shapeAppearanceModel) {
        getImpl().getClass();
    }

    @Override // android.view.View
    public final void setTranslationX(float f) {
        super.setTranslationX(f);
        getImpl().onTranslationChanged();
    }

    @Override // android.view.View
    public final void setTranslationY(float f) {
        super.setTranslationY(f);
        getImpl().onTranslationChanged();
    }

    @Override // android.view.View
    public final void setTranslationZ(float f) {
        super.setTranslationZ(f);
        getImpl().onTranslationChanged();
    }

    public final void show() {
        boolean z;
        boolean z2;
        AnimatorSet animatorSet;
        float f;
        float f2;
        final FloatingActionButtonImpl impl = getImpl();
        boolean z3 = true;
        if (impl.view.getVisibility() == 0 ? impl.animState == 1 : impl.animState != 2) {
            z = false;
        } else {
            z = true;
        }
        if (!z) {
            Animator animator = impl.currentAnimator;
            if (animator != null) {
                animator.cancel();
            }
            if (impl.showMotionSpec == null) {
                z2 = true;
            } else {
                z2 = false;
            }
            FloatingActionButton floatingActionButton = impl.view;
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            if (!ViewCompat.Api19Impl.isLaidOut(floatingActionButton) || impl.view.isInEditMode()) {
                z3 = false;
            }
            if (z3) {
                if (impl.view.getVisibility() != 0) {
                    FloatingActionButton floatingActionButton2 = impl.view;
                    float f3 = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
                    floatingActionButton2.setAlpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                    FloatingActionButton floatingActionButton3 = impl.view;
                    if (z2) {
                        f = 0.4f;
                    } else {
                        f = 0.0f;
                    }
                    floatingActionButton3.setScaleY(f);
                    FloatingActionButton floatingActionButton4 = impl.view;
                    if (z2) {
                        f2 = 0.4f;
                    } else {
                        f2 = 0.0f;
                    }
                    floatingActionButton4.setScaleX(f2);
                    if (z2) {
                        f3 = 0.4f;
                    }
                    impl.imageMatrixScale = f3;
                    Matrix matrix = impl.tmpMatrix;
                    matrix.reset();
                    impl.view.getDrawable();
                    impl.view.setImageMatrix(matrix);
                }
                MotionSpec motionSpec = impl.showMotionSpec;
                if (motionSpec != null) {
                    animatorSet = impl.createAnimator(motionSpec, 1.0f, 1.0f, 1.0f);
                } else {
                    animatorSet = impl.createDefaultAnimator(1.0f, 1.0f, 1.0f);
                }
                animatorSet.addListener(new AnimatorListenerAdapter() { // from class: com.google.android.material.floatingactionbutton.FloatingActionButtonImpl.2
                    public final /* synthetic */ boolean val$fromUser = false;
                    public final /* synthetic */ InternalVisibilityChangedListener val$listener = null;

                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public final void onAnimationEnd(Animator animator2) {
                        FloatingActionButtonImpl floatingActionButtonImpl = FloatingActionButtonImpl.this;
                        floatingActionButtonImpl.animState = 0;
                        floatingActionButtonImpl.currentAnimator = null;
                        InternalVisibilityChangedListener internalVisibilityChangedListener = this.val$listener;
                        if (internalVisibilityChangedListener != null) {
                            internalVisibilityChangedListener.onShown();
                        }
                    }

                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public final void onAnimationStart(Animator animator2) {
                        FloatingActionButtonImpl.this.view.internalSetVisibility(0, this.val$fromUser);
                        FloatingActionButtonImpl floatingActionButtonImpl = FloatingActionButtonImpl.this;
                        floatingActionButtonImpl.animState = 2;
                        floatingActionButtonImpl.currentAnimator = animator2;
                    }
                });
                ArrayList<Animator.AnimatorListener> arrayList = impl.showListeners;
                if (arrayList != null) {
                    Iterator<Animator.AnimatorListener> it = arrayList.iterator();
                    while (it.hasNext()) {
                        animatorSet.addListener(it.next());
                    }
                }
                animatorSet.start();
                return;
            }
            impl.view.internalSetVisibility(0, false);
            impl.view.setAlpha(1.0f);
            impl.view.setScaleY(1.0f);
            impl.view.setScaleX(1.0f);
            impl.imageMatrixScale = 1.0f;
            Matrix matrix2 = impl.tmpMatrix;
            matrix2.reset();
            impl.view.getDrawable();
            impl.view.setImageMatrix(matrix2);
        }
    }

    @Override // android.widget.ImageView
    public final void setImageResource(int i) {
        throw null;
    }

    @Override // android.view.View
    public final ColorStateList getBackgroundTintList() {
        return this.backgroundTint;
    }

    @Override // android.view.View
    public final PorterDuff.Mode getBackgroundTintMode() {
        return this.backgroundTintMode;
    }

    @Override // com.google.android.material.expandable.ExpandableWidget
    public final boolean isExpanded() {
        throw null;
    }
}
