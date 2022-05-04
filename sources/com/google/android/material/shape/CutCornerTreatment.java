package com.google.android.material.shape;

import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.bumptech.glide.manager.ApplicationLifecycle;
/* loaded from: classes.dex */
public final class CutCornerTreatment extends ApplicationLifecycle {
    @Override // com.bumptech.glide.manager.ApplicationLifecycle
    public final void getCornerPath(ShapePath shapePath, float f, float f2) {
        shapePath.reset(f2 * f, 180.0f, 90.0f);
        double d = f2;
        double d2 = f;
        shapePath.lineTo((float) (Math.sin(Math.toRadians(90.0f)) * d * d2), (float) (Math.sin(Math.toRadians((double) HingeAngleProviderKt.FULLY_CLOSED_DEGREES)) * d * d2));
    }
}
