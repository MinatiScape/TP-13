package com.google.android.material.shape;

import com.android.wallpaper.model.WallpaperInfo;
import com.google.android.apps.wallpaper.model.GoogleLiveWallpaperInfo;
import com.google.android.apps.wallpaper.model.MicropaperWallpaperInfo;
import wireless.android.learning.acmi.micropaper.frontend.MicropaperFrontend;
/* loaded from: classes.dex */
public class CornerTreatment {
    public CornerTreatment(int i) {
    }

    public void getCornerPath(ShapePath shapePath, float f, float f2, float f3) {
        throw null;
    }

    public WallpaperInfo getLiveWallpaperInfo(android.app.WallpaperInfo wallpaperInfo) {
        if (wallpaperInfo.getComponent().equals(MicropaperFrontend.MICROPAPER_SERVICE)) {
            return new MicropaperWallpaperInfo(wallpaperInfo);
        }
        return new GoogleLiveWallpaperInfo(wallpaperInfo);
    }
}
