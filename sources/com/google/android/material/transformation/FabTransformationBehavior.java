package com.google.android.material.transformation;

import android.content.Context;
import android.graphics.Rect;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.util.Pair;
import android.view.View;
import android.view.animation.LinearInterpolator;
import androidx.constraintlayout.solver.widgets.analyzer.DependencyGraph$$ExternalSyntheticOutline0;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.viewpager2.R$styleable;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.android.material.animation.AnimationUtils;
import com.google.android.material.animation.MotionSpec;
import com.google.android.material.animation.MotionTiming;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
@Deprecated
/* loaded from: classes.dex */
public abstract class FabTransformationBehavior extends ExpandableTransformationBehavior {
    public float dependencyOriginalTranslationX;
    public float dependencyOriginalTranslationY;
    public final int[] tmpArray;
    public final Rect tmpRect;
    public final RectF tmpRectF1;
    public final RectF tmpRectF2;

    /* loaded from: classes.dex */
    public static class FabTransformationSpec {
        public R$styleable positioning;
        public MotionSpec timings;
    }

    public FabTransformationBehavior() {
        this.tmpRect = new Rect();
        this.tmpRectF1 = new RectF();
        this.tmpRectF2 = new RectF();
        this.tmpArray = new int[2];
    }

    public static Pair calculateMotionTiming(float f, float f2, boolean z, FabTransformationSpec fabTransformationSpec) {
        MotionTiming motionTiming;
        MotionTiming motionTiming2;
        int i;
        if (f == HingeAngleProviderKt.FULLY_CLOSED_DEGREES || f2 == HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
            motionTiming2 = fabTransformationSpec.timings.getTiming("translationXLinear");
            motionTiming = fabTransformationSpec.timings.getTiming("translationYLinear");
        } else if ((!z || f2 >= HingeAngleProviderKt.FULLY_CLOSED_DEGREES) && (z || i <= 0)) {
            motionTiming2 = fabTransformationSpec.timings.getTiming("translationXCurveDownwards");
            motionTiming = fabTransformationSpec.timings.getTiming("translationYCurveDownwards");
        } else {
            motionTiming2 = fabTransformationSpec.timings.getTiming("translationXCurveUpwards");
            motionTiming = fabTransformationSpec.timings.getTiming("translationYCurveUpwards");
        }
        return new Pair(motionTiming2, motionTiming);
    }

    public abstract FabTransformationSpec onCreateMotionSpec(Context context, boolean z);

    public static float calculateValueOfAnimationAtEndOfExpansion(FabTransformationSpec fabTransformationSpec, MotionTiming motionTiming, float f) {
        long j = motionTiming.delay;
        long j2 = motionTiming.duration;
        MotionTiming timing = fabTransformationSpec.timings.getTiming("expansion");
        float interpolation = motionTiming.getInterpolator().getInterpolation(((float) (((timing.delay + timing.duration) + 17) - j)) / ((float) j2));
        LinearInterpolator linearInterpolator = AnimationUtils.LINEAR_INTERPOLATOR;
        return DependencyGraph$$ExternalSyntheticOutline0.m(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, f, interpolation, f);
    }

    public final float calculateTranslationX(View view, View view2, R$styleable r$styleable) {
        RectF rectF = this.tmpRectF1;
        RectF rectF2 = this.tmpRectF2;
        calculateWindowBounds(view, rectF);
        rectF.offset(this.dependencyOriginalTranslationX, this.dependencyOriginalTranslationY);
        calculateWindowBounds(view2, rectF2);
        r$styleable.getClass();
        return (rectF2.centerX() - rectF.centerX()) + HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
    }

    public final float calculateTranslationY(View view, View view2, R$styleable r$styleable) {
        RectF rectF = this.tmpRectF1;
        RectF rectF2 = this.tmpRectF2;
        calculateWindowBounds(view, rectF);
        rectF.offset(this.dependencyOriginalTranslationX, this.dependencyOriginalTranslationY);
        calculateWindowBounds(view2, rectF2);
        r$styleable.getClass();
        return (rectF2.centerY() - rectF.centerY()) + HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public final void onAttachedToLayoutParams(CoordinatorLayout.LayoutParams layoutParams) {
        if (layoutParams.dodgeInsetEdges == 0) {
            layoutParams.dodgeInsetEdges = 80;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:103:0x038d  */
    /* JADX WARN: Removed duplicated region for block: B:111:0x03dc A[LOOP:1: B:110:0x03da->B:111:0x03dc, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0190  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0198  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0314  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0319  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x0372  */
    @Override // com.google.android.material.transformation.ExpandableTransformationBehavior
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final android.animation.AnimatorSet onCreateExpandedStateChangeAnimation(final android.view.View r27, final android.view.View r28, boolean r29, boolean r30) {
        /*
            Method dump skipped, instructions count: 1015
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.transformation.FabTransformationBehavior.onCreateExpandedStateChangeAnimation(android.view.View, android.view.View, boolean, boolean):android.animation.AnimatorSet");
    }

    public final void calculateWindowBounds(View view, RectF rectF) {
        rectF.set(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, view.getWidth(), view.getHeight());
        int[] iArr = this.tmpArray;
        view.getLocationInWindow(iArr);
        rectF.offsetTo(iArr[0], iArr[1]);
        rectF.offset((int) (-view.getTranslationX()), (int) (-view.getTranslationY()));
    }

    @Override // com.google.android.material.transformation.ExpandableBehavior, androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public final boolean layoutDependsOn(View view, View view2) {
        if (view.getVisibility() == 8) {
            throw new IllegalStateException("This behavior cannot be attached to a GONE view. Set the view to INVISIBLE instead.");
        } else if (!(view2 instanceof FloatingActionButton)) {
            return false;
        } else {
            ((FloatingActionButton) view2).getClass();
            throw null;
        }
    }

    public FabTransformationBehavior(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.tmpRect = new Rect();
        this.tmpRectF1 = new RectF();
        this.tmpRectF2 = new RectF();
        this.tmpArray = new int[2];
    }
}
