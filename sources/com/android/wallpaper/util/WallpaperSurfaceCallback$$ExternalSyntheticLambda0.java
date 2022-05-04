package com.android.wallpaper.util;

import android.app.WallpaperColors;
import androidx.lifecycle.Observer;
import com.android.customization.model.color.ColorSectionController;
import com.android.wallpaper.module.PackageStatusNotifier;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class WallpaperSurfaceCallback$$ExternalSyntheticLambda0 implements Observer, PackageStatusNotifier.Listener {
    public final /* synthetic */ Object f$0;

    @Override // androidx.lifecycle.Observer
    public final void onChanged(Object obj) {
        ColorSectionController colorSectionController = (ColorSectionController) this.f$0;
        colorSectionController.mLockWallpaperColors = (WallpaperColors) obj;
        colorSectionController.mLockWallpaperColorsReady = true;
        colorSectionController.maybeLoadColors();
    }

    @Override // com.android.wallpaper.module.PackageStatusNotifier.Listener
    public final void onPackageChanged(String str, int i) {
        WallpaperSurfaceCallback wallpaperSurfaceCallback = (WallpaperSurfaceCallback) this.f$0;
        if (i == 3) {
            wallpaperSurfaceCallback.getClass();
        } else if (!wallpaperSurfaceCallback.mSurfaceCreated && wallpaperSurfaceCallback.mHost != null) {
            wallpaperSurfaceCallback.setupSurfaceWallpaper(false);
        }
    }
}
