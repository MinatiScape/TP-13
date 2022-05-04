package com.google.android.material.shape;

import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.bumptech.glide.manager.ApplicationLifecycle;
/* loaded from: classes.dex */
public final class RoundedCornerTreatment extends ApplicationLifecycle {
    @Override // com.bumptech.glide.manager.ApplicationLifecycle
    public final void getCornerPath(ShapePath shapePath, float f, float f2) {
        shapePath.reset(f2 * f, 180.0f, 90.0f);
        float f3 = f2 * 2.0f * f;
        shapePath.addArc(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, f3, f3, 180.0f, 90.0f);
    }
}
