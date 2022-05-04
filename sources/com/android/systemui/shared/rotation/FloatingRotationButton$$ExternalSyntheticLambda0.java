package com.android.systemui.shared.rotation;
/* loaded from: classes.dex */
public final /* synthetic */ class FloatingRotationButton$$ExternalSyntheticLambda0 implements Runnable {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ FloatingRotationButton f$0;

    public /* synthetic */ FloatingRotationButton$$ExternalSyntheticLambda0(FloatingRotationButton floatingRotationButton, int i) {
        this.$r8$classId = i;
        this.f$0 = floatingRotationButton;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.$r8$classId) {
            case 0:
                FloatingRotationButton.m12$r8$lambda$ru2bO1n_Sw5453EhPqos_J4PT8(this.f$0);
                return;
            default:
                FloatingRotationButton.$r8$lambda$KlNtkQsfU8KBz67x5m2ktsr8jd0(this.f$0);
                return;
        }
    }
}
