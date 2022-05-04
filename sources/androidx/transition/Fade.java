package androidx.transition;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.util.Property;
import android.view.View;
import android.view.ViewGroup;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import java.util.Map;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public class Fade extends Visibility {

    /* loaded from: classes.dex */
    public static class FadeAnimatorListener extends AnimatorListenerAdapter {
        public boolean mLayerTypeChanged = false;
        public final View mView;

        public FadeAnimatorListener(View view) {
            this.mView = view;
        }

        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
        public void onAnimationEnd(Animator animator) {
            View view = this.mView;
            Property<View, Float> property = ViewUtils.TRANSITION_ALPHA;
            view.setTransitionAlpha(1.0f);
            if (this.mLayerTypeChanged) {
                this.mView.setLayerType(0, null);
            }
        }

        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
        public void onAnimationStart(Animator animator) {
            View view = this.mView;
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            if (view.hasOverlappingRendering() && this.mView.getLayerType() == 0) {
                this.mLayerTypeChanged = true;
                this.mView.setLayerType(2, null);
            }
        }
    }

    public Fade(int i) {
        if ((i & (-4)) == 0) {
            this.mMode = i;
            return;
        }
        throw new IllegalArgumentException("Only MODE_IN and MODE_OUT flags are allowed");
    }

    @Override // androidx.transition.Transition
    public void captureStartValues(TransitionValues transitionValues) {
        captureValues(transitionValues);
        Map<String, Object> map = transitionValues.values;
        View view = transitionValues.view;
        Property<View, Float> property = ViewUtils.TRANSITION_ALPHA;
        map.put("android:fade:transitionAlpha", Float.valueOf(view.getTransitionAlpha()));
    }

    public final Animator createAnimation(final View view, float f, float f2) {
        if (f == f2) {
            return null;
        }
        Property<View, Float> property = ViewUtils.TRANSITION_ALPHA;
        view.setTransitionAlpha(f);
        ObjectAnimator ofFloat = ObjectAnimator.ofFloat(view, ViewUtils.TRANSITION_ALPHA, f2);
        ofFloat.addListener(new FadeAnimatorListener(view));
        addListener(new TransitionListenerAdapter(this) { // from class: androidx.transition.Fade.1
            @Override // androidx.transition.Transition.TransitionListener
            public void onTransitionEnd(Transition transition) {
                View view2 = view;
                Property<View, Float> property2 = ViewUtils.TRANSITION_ALPHA;
                view2.setTransitionAlpha(1.0f);
                transition.removeListener(this);
            }
        });
        return ofFloat;
    }

    @Override // androidx.transition.Visibility
    public Animator onDisappear(ViewGroup viewGroup, View view, TransitionValues transitionValues, TransitionValues transitionValues2) {
        Property<View, Float> property = ViewUtils.TRANSITION_ALPHA;
        Float f = (Float) transitionValues.values.get("android:fade:transitionAlpha");
        return createAnimation(view, f != null ? f.floatValue() : 1.0f, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
    }
}
