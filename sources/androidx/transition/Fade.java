package androidx.transition;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.view.View;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import java.util.HashMap;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public final class Fade extends Visibility {

    /* loaded from: classes.dex */
    public static class FadeAnimatorListener extends AnimatorListenerAdapter {
        public boolean mLayerTypeChanged = false;
        public final View mView;

        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
        public final void onAnimationEnd(Animator animator) {
            View view = this.mView;
            ViewUtilsApi29 viewUtilsApi29 = ViewUtils.IMPL;
            view.setTransitionAlpha(1.0f);
            if (this.mLayerTypeChanged) {
                this.mView.setLayerType(0, null);
            }
        }

        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
        public final void onAnimationStart(Animator animator) {
            View view = this.mView;
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            if (ViewCompat.Api16Impl.hasOverlappingRendering(view) && this.mView.getLayerType() == 0) {
                this.mLayerTypeChanged = true;
                this.mView.setLayerType(2, null);
            }
        }

        public FadeAnimatorListener(View view) {
            this.mView = view;
        }
    }

    public Fade(int i) {
        if ((i & (-4)) == 0) {
            this.mMode = i;
            return;
        }
        throw new IllegalArgumentException("Only MODE_IN and MODE_OUT flags are allowed");
    }

    public final ObjectAnimator createAnimation(final View view, float f, float f2) {
        if (f == f2) {
            return null;
        }
        ViewUtilsApi29 viewUtilsApi29 = ViewUtils.IMPL;
        view.setTransitionAlpha(f);
        ObjectAnimator ofFloat = ObjectAnimator.ofFloat(view, ViewUtils.TRANSITION_ALPHA, f2);
        ofFloat.addListener(new FadeAnimatorListener(view));
        addListener(new TransitionListenerAdapter() { // from class: androidx.transition.Fade.1
            @Override // androidx.transition.Transition.TransitionListener
            public final void onTransitionEnd(Transition transition) {
                View view2 = view;
                ViewUtilsApi29 viewUtilsApi292 = ViewUtils.IMPL;
                view2.setTransitionAlpha(1.0f);
                transition.removeListener(this);
            }
        });
        return ofFloat;
    }

    @Override // androidx.transition.Transition
    public final void captureStartValues(TransitionValues transitionValues) {
        captureValues(transitionValues);
        HashMap hashMap = transitionValues.values;
        View view = transitionValues.view;
        ViewUtilsApi29 viewUtilsApi29 = ViewUtils.IMPL;
        hashMap.put("android:fade:transitionAlpha", Float.valueOf(view.getTransitionAlpha()));
    }

    public Fade() {
    }
}
