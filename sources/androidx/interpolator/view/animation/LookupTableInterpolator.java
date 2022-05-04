package androidx.interpolator.view.animation;

import androidx.constraintlayout.solver.widgets.analyzer.DependencyGraph$$ExternalSyntheticOutline0;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
/* loaded from: classes.dex */
public final class LookupTableInterpolator {
    public static float interpolate(float[] values, float stepSize, float input) {
        if (input >= 1.0f) {
            return 1.0f;
        }
        if (input <= HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
            return HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        }
        int min = Math.min((int) ((values.length - 1) * input), values.length - 2);
        return DependencyGraph$$ExternalSyntheticOutline0.m(values[min + 1], values[min], (input - (min * stepSize)) / stepSize, values[min]);
    }
}
