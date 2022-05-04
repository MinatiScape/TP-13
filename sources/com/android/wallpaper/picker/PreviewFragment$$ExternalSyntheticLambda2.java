package com.android.wallpaper.picker;

import android.view.animation.Interpolator;
/* loaded from: classes.dex */
public final /* synthetic */ class PreviewFragment$$ExternalSyntheticLambda2 implements Runnable {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ PreviewFragment f$0;

    public /* synthetic */ PreviewFragment$$ExternalSyntheticLambda2(PreviewFragment previewFragment, int i) {
        this.$r8$classId = i;
        this.f$0 = previewFragment;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.$r8$classId) {
            case 0:
                this.f$0.mFullScreenAnimation.startAnimation(true);
                return;
            default:
                PreviewFragment previewFragment = this.f$0;
                Interpolator interpolator = PreviewFragment.ALPHA_OUT;
                previewFragment.finishActivity(true);
                return;
        }
    }
}
