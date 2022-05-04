package com.android.wallpaper.util;

import com.android.wallpaper.asset.Asset;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class WallpaperConnection$$ExternalSyntheticLambda0 implements Runnable {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ Object f$0;

    public /* synthetic */ WallpaperConnection$$ExternalSyntheticLambda0(Object obj, int i) {
        this.$r8$classId = i;
        this.f$0 = obj;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.$r8$classId) {
            case 0:
                WallpaperConnection.m30$r8$lambda$caOSgknIvlqlVpoioFcEp8xlv8((WallpaperConnection) this.f$0);
                return;
            default:
                ((Asset.DimensionsReceiver) this.f$0).onDimensionsDecoded(null);
                return;
        }
    }
}
