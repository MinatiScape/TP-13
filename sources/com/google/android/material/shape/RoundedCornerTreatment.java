package com.google.android.material.shape;

import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
/* loaded from: classes.dex */
public class RoundedCornerTreatment extends CornerTreatment {
    public RoundedCornerTreatment() {
        super(0);
    }

    @Override // com.google.android.material.shape.CornerTreatment
    public void getCornerPath(ShapePath shapePath, float f, float f2, float f3) {
        shapePath.reset(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, f3 * f2, 180.0f, 180.0f - f);
        float f4 = f3 * 2.0f * f2;
        shapePath.addArc(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, f4, f4, 180.0f, f);
    }
}
