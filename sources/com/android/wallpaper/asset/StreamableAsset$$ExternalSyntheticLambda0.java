package com.android.wallpaper.asset;

import android.app.WallpaperColors;
import android.graphics.Point;
import android.os.Parcelable;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.picker.ImagePreviewFragment;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class StreamableAsset$$ExternalSyntheticLambda0 implements Runnable {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ Object f$0;
    public final /* synthetic */ Object f$1;

    public /* synthetic */ StreamableAsset$$ExternalSyntheticLambda0(Object obj, Parcelable parcelable, int i) {
        this.$r8$classId = i;
        this.f$0 = obj;
        this.f$1 = parcelable;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.$r8$classId) {
            case 0:
                ((Asset.DimensionsReceiver) this.f$0).onDimensionsDecoded((Point) this.f$1);
                return;
            default:
                ImagePreviewFragment.AnonymousClass4 r0 = (ImagePreviewFragment.AnonymousClass4) this.f$0;
                ImagePreviewFragment.this.onWallpaperColorsChanged((WallpaperColors) this.f$1);
                if (ImagePreviewFragment.this.mFullResImageView.getAlpha() == HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                    ImagePreviewFragment.this.crossFadeInMosaicView();
                    return;
                }
                return;
        }
    }
}
