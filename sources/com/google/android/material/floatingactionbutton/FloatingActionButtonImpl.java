package com.google.android.material.floatingactionbutton;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.TimeInterpolator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.TypedValue;
import android.view.View;
import android.view.animation.PathInterpolator;
import androidx.appcompat.view.SupportMenuInflater$$ExternalSyntheticOutline0;
import androidx.collection.ContainerHelpers;
import androidx.constraintlayout.solver.widgets.analyzer.DependencyGraph$$ExternalSyntheticOutline0;
import androidx.core.graphics.PathParser;
import androidx.core.util.Preconditions;
import androidx.interpolator.view.animation.FastOutLinearInInterpolator;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.android.material.animation.AnimationUtils;
import com.google.android.material.animation.ImageMatrixProperty;
import com.google.android.material.animation.MatrixEvaluator;
import com.google.android.material.animation.MotionSpec;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.internal.StateListAnimator;
import com.google.android.material.motion.MotionUtils;
import com.google.android.material.resources.MaterialAttributes;
import com.google.android.material.shadow.ShadowViewDelegate;
import java.util.ArrayList;
import java.util.Iterator;
/* loaded from: classes.dex */
public class FloatingActionButtonImpl {
    public Animator currentAnimator;
    public ArrayList<Animator.AnimatorListener> hideListeners;
    public MotionSpec hideMotionSpec;
    public AnonymousClass6 preDrawListener;
    public float rotation;
    public final ShadowViewDelegate shadowViewDelegate;
    public ArrayList<Animator.AnimatorListener> showListeners;
    public MotionSpec showMotionSpec;
    public final StateListAnimator stateListAnimator;
    public ArrayList<InternalTransformationCallback> transformationCallbacks;
    public final FloatingActionButton view;
    public static final FastOutLinearInInterpolator ELEVATION_ANIM_INTERPOLATOR = AnimationUtils.FAST_OUT_LINEAR_IN_INTERPOLATOR;
    public static final int[] PRESSED_ENABLED_STATE_SET = {16842919, 16842910};
    public static final int[] HOVERED_FOCUSED_ENABLED_STATE_SET = {16843623, 16842908, 16842910};
    public static final int[] FOCUSED_ENABLED_STATE_SET = {16842908, 16842910};
    public static final int[] HOVERED_ENABLED_STATE_SET = {16843623, 16842910};
    public static final int[] ENABLED_STATE_SET = {16842910};
    public static final int[] EMPTY_STATE_SET = new int[0];
    public boolean shadowPaddingEnabled = true;
    public float imageMatrixScale = 1.0f;
    public int animState = 0;
    public final Rect tmpRect = new Rect();
    public final Matrix tmpMatrix = new Matrix();

    /* loaded from: classes.dex */
    public class ElevateToHoveredFocusedTranslationZAnimation extends ShadowAnimatorImpl {
        public final /* synthetic */ FloatingActionButtonImpl this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public ElevateToHoveredFocusedTranslationZAnimation(FloatingActionButtonImplLollipop floatingActionButtonImplLollipop) {
            super(floatingActionButtonImplLollipop);
            this.this$0 = floatingActionButtonImplLollipop;
        }

        @Override // com.google.android.material.floatingactionbutton.FloatingActionButtonImpl.ShadowAnimatorImpl
        public final void getTargetShadowSize() {
            this.this$0.getClass();
            this.this$0.getClass();
        }
    }

    /* loaded from: classes.dex */
    public class ElevateToPressedTranslationZAnimation extends ShadowAnimatorImpl {
        public final /* synthetic */ FloatingActionButtonImpl this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public ElevateToPressedTranslationZAnimation(FloatingActionButtonImplLollipop floatingActionButtonImplLollipop) {
            super(floatingActionButtonImplLollipop);
            this.this$0 = floatingActionButtonImplLollipop;
        }

        @Override // com.google.android.material.floatingactionbutton.FloatingActionButtonImpl.ShadowAnimatorImpl
        public final void getTargetShadowSize() {
            this.this$0.getClass();
            this.this$0.getClass();
        }
    }

    /* loaded from: classes.dex */
    public interface InternalTransformationCallback {
        void onScaleChanged();

        void onTranslationChanged();
    }

    /* loaded from: classes.dex */
    public interface InternalVisibilityChangedListener {
        void onHidden();

        void onShown();
    }

    /* loaded from: classes.dex */
    public class ResetElevationAnimation extends ShadowAnimatorImpl {
        public final /* synthetic */ FloatingActionButtonImpl this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public ResetElevationAnimation(FloatingActionButtonImplLollipop floatingActionButtonImplLollipop) {
            super(floatingActionButtonImplLollipop);
            this.this$0 = floatingActionButtonImplLollipop;
        }

        @Override // com.google.android.material.floatingactionbutton.FloatingActionButtonImpl.ShadowAnimatorImpl
        public final void getTargetShadowSize() {
            this.this$0.getClass();
        }
    }

    /* loaded from: classes.dex */
    public abstract class ShadowAnimatorImpl extends AnimatorListenerAdapter implements ValueAnimator.AnimatorUpdateListener {
        public final /* synthetic */ FloatingActionButtonImpl this$0;
        public boolean validValues;

        public abstract void getTargetShadowSize();

        public ShadowAnimatorImpl(FloatingActionButtonImplLollipop floatingActionButtonImplLollipop) {
            this.this$0 = floatingActionButtonImplLollipop;
        }

        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
        public final void onAnimationEnd(Animator animator) {
            this.this$0.getClass();
            this.validValues = false;
        }

        @Override // android.animation.ValueAnimator.AnimatorUpdateListener
        public final void onAnimationUpdate(ValueAnimator valueAnimator) {
            if (!this.validValues) {
                this.this$0.getClass();
                getTargetShadowSize();
                this.validValues = true;
            }
            FloatingActionButtonImpl floatingActionButtonImpl = this.this$0;
            valueAnimator.getAnimatedFraction();
            floatingActionButtonImpl.getClass();
        }
    }

    public void getPadding(Rect rect) {
        throw null;
    }

    public void jumpDrawableToCurrentState() {
        throw null;
    }

    public void onDrawableStateChanged(int[] iArr) {
        throw null;
    }

    public void updateFromViewRotation() {
        throw null;
    }

    public static ValueAnimator createElevationAnimator(ShadowAnimatorImpl shadowAnimatorImpl) {
        ValueAnimator valueAnimator = new ValueAnimator();
        valueAnimator.setInterpolator(ELEVATION_ANIM_INTERPOLATOR);
        valueAnimator.setDuration(100L);
        valueAnimator.addListener(shadowAnimatorImpl);
        valueAnimator.addUpdateListener(shadowAnimatorImpl);
        valueAnimator.setFloatValues(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 1.0f);
        return valueAnimator;
    }

    public final AnimatorSet createAnimator(MotionSpec motionSpec, float f, float f2, float f3) {
        ArrayList arrayList = new ArrayList();
        ObjectAnimator ofFloat = ObjectAnimator.ofFloat(this.view, View.ALPHA, f);
        motionSpec.getTiming("opacity").apply(ofFloat);
        arrayList.add(ofFloat);
        ObjectAnimator ofFloat2 = ObjectAnimator.ofFloat(this.view, View.SCALE_X, f2);
        motionSpec.getTiming("scale").apply(ofFloat2);
        arrayList.add(ofFloat2);
        ObjectAnimator ofFloat3 = ObjectAnimator.ofFloat(this.view, View.SCALE_Y, f2);
        motionSpec.getTiming("scale").apply(ofFloat3);
        arrayList.add(ofFloat3);
        this.tmpMatrix.reset();
        this.view.getDrawable();
        ObjectAnimator ofObject = ObjectAnimator.ofObject(this.view, new ImageMatrixProperty(), new MatrixEvaluator() { // from class: com.google.android.material.floatingactionbutton.FloatingActionButtonImpl.3
            @Override // android.animation.TypeEvaluator
            public final Matrix evaluate(float f4, Matrix matrix, Matrix matrix2) {
                FloatingActionButtonImpl.this.imageMatrixScale = f4;
                matrix.getValues(this.tempStartValues);
                matrix2.getValues(this.tempEndValues);
                for (int i = 0; i < 9; i++) {
                    float[] fArr = this.tempEndValues;
                    float f5 = fArr[i];
                    float f6 = this.tempStartValues[i];
                    fArr[i] = DependencyGraph$$ExternalSyntheticOutline0.m(f5, f6, f4, f6);
                }
                this.tempMatrix.setValues(this.tempEndValues);
                return this.tempMatrix;
            }
        }, new Matrix(this.tmpMatrix));
        motionSpec.getTiming("iconScale").apply(ofObject);
        arrayList.add(ofObject);
        AnimatorSet animatorSet = new AnimatorSet();
        ContainerHelpers.playTogether(animatorSet, arrayList);
        return animatorSet;
    }

    public final AnimatorSet createDefaultAnimator(final float f, final float f2, final float f3) {
        AnimatorSet animatorSet = new AnimatorSet();
        ArrayList arrayList = new ArrayList();
        ValueAnimator ofFloat = ValueAnimator.ofFloat(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 1.0f);
        final float alpha = this.view.getAlpha();
        final float scaleX = this.view.getScaleX();
        final float scaleY = this.view.getScaleY();
        final float f4 = this.imageMatrixScale;
        final Matrix matrix = new Matrix(this.tmpMatrix);
        ofFloat.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.google.android.material.floatingactionbutton.FloatingActionButtonImpl.4
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                float floatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                FloatingActionButtonImpl.this.view.setAlpha(AnimationUtils.lerp(alpha, f, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 0.2f, floatValue));
                FloatingActionButton floatingActionButton = FloatingActionButtonImpl.this.view;
                float f5 = scaleX;
                floatingActionButton.setScaleX(((f2 - f5) * floatValue) + f5);
                FloatingActionButton floatingActionButton2 = FloatingActionButtonImpl.this.view;
                float f6 = scaleY;
                floatingActionButton2.setScaleY(((f2 - f6) * floatValue) + f6);
                FloatingActionButtonImpl floatingActionButtonImpl = FloatingActionButtonImpl.this;
                float f7 = f4;
                floatingActionButtonImpl.imageMatrixScale = DependencyGraph$$ExternalSyntheticOutline0.m(f3, f7, floatValue, f7);
                Matrix matrix2 = matrix;
                floatingActionButtonImpl.getClass();
                matrix2.reset();
                floatingActionButtonImpl.view.getDrawable();
                FloatingActionButtonImpl.this.view.setImageMatrix(matrix);
            }
        });
        arrayList.add(ofFloat);
        ContainerHelpers.playTogether(animatorSet, arrayList);
        Context context = this.view.getContext();
        int integer = this.view.getContext().getResources().getInteger(R.integer.material_motion_duration_long_1);
        TypedValue resolve = MaterialAttributes.resolve(context, R.attr.motionDurationLong1);
        if (resolve != null && resolve.type == 16) {
            integer = resolve.data;
        }
        animatorSet.setDuration(integer);
        Context context2 = this.view.getContext();
        TimeInterpolator timeInterpolator = AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR;
        TypedValue typedValue = new TypedValue();
        if (context2.getTheme().resolveAttribute(R.attr.motionEasingStandard, typedValue, true)) {
            if (typedValue.type == 3) {
                String valueOf = String.valueOf(typedValue.string);
                if (MotionUtils.isEasingType(valueOf, "cubic-bezier")) {
                    String[] split = valueOf.substring(13, valueOf.length() - 1).split(",");
                    if (split.length == 4) {
                        timeInterpolator = new PathInterpolator(MotionUtils.getControlPoint(split, 0), MotionUtils.getControlPoint(split, 1), MotionUtils.getControlPoint(split, 2), MotionUtils.getControlPoint(split, 3));
                    } else {
                        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Motion easing theme attribute must have 4 control points if using bezier curve format; instead got: ");
                        m.append(split.length);
                        throw new IllegalArgumentException(m.toString());
                    }
                } else if (MotionUtils.isEasingType(valueOf, "path")) {
                    timeInterpolator = new PathInterpolator(PathParser.createPathFromPathData(valueOf.substring(5, valueOf.length() - 1)));
                } else {
                    throw new IllegalArgumentException(SupportMenuInflater$$ExternalSyntheticOutline0.m("Invalid motion easing type: ", valueOf));
                }
            } else {
                throw new IllegalArgumentException("Motion easing theme attribute must be a string");
            }
        }
        animatorSet.setInterpolator(timeInterpolator);
        return animatorSet;
    }

    public final void onTranslationChanged() {
        ArrayList<InternalTransformationCallback> arrayList = this.transformationCallbacks;
        if (arrayList != null) {
            Iterator<InternalTransformationCallback> it = arrayList.iterator();
            while (it.hasNext()) {
                it.next().onTranslationChanged();
            }
        }
    }

    public final void updatePadding() {
        getPadding(this.tmpRect);
        Preconditions.checkNotNull(null, "Didn't initialize content background");
        throw null;
    }

    public FloatingActionButtonImpl(FloatingActionButton floatingActionButton, FloatingActionButton.ShadowDelegateImpl shadowDelegateImpl) {
        new RectF();
        new RectF();
        this.view = floatingActionButton;
        this.shadowViewDelegate = shadowDelegateImpl;
        StateListAnimator stateListAnimator = new StateListAnimator();
        this.stateListAnimator = stateListAnimator;
        FloatingActionButtonImplLollipop floatingActionButtonImplLollipop = (FloatingActionButtonImplLollipop) this;
        stateListAnimator.addState(PRESSED_ENABLED_STATE_SET, createElevationAnimator(new ElevateToPressedTranslationZAnimation(floatingActionButtonImplLollipop)));
        stateListAnimator.addState(HOVERED_FOCUSED_ENABLED_STATE_SET, createElevationAnimator(new ElevateToHoveredFocusedTranslationZAnimation(floatingActionButtonImplLollipop)));
        stateListAnimator.addState(FOCUSED_ENABLED_STATE_SET, createElevationAnimator(new ElevateToHoveredFocusedTranslationZAnimation(floatingActionButtonImplLollipop)));
        stateListAnimator.addState(HOVERED_ENABLED_STATE_SET, createElevationAnimator(new ElevateToHoveredFocusedTranslationZAnimation(floatingActionButtonImplLollipop)));
        stateListAnimator.addState(ENABLED_STATE_SET, createElevationAnimator(new ResetElevationAnimation(floatingActionButtonImplLollipop)));
        stateListAnimator.addState(EMPTY_STATE_SET, createElevationAnimator(new DisabledElevationAnimation(floatingActionButtonImplLollipop)));
        this.rotation = floatingActionButton.getRotation();
    }

    /* loaded from: classes.dex */
    public class DisabledElevationAnimation extends ShadowAnimatorImpl {
        @Override // com.google.android.material.floatingactionbutton.FloatingActionButtonImpl.ShadowAnimatorImpl
        public final void getTargetShadowSize() {
        }

        public DisabledElevationAnimation(FloatingActionButtonImplLollipop floatingActionButtonImplLollipop) {
            super(floatingActionButtonImplLollipop);
        }
    }
}
