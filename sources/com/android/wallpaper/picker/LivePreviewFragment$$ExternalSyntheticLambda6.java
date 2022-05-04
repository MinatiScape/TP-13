package com.android.wallpaper.picker;

import android.app.WallpaperColors;
import android.widget.ImageView;
import androidx.lifecycle.Observer;
import com.android.customization.model.color.ColorSectionController;
import com.android.customization.picker.WallpaperPreviewer;
import com.android.wallpaper.asset.Asset$$ExternalSyntheticLambda1;
import com.android.wallpaper.module.PackageStatusNotifier;
import com.android.wallpaper.util.WallpaperSurfaceCallback;
import com.android.wallpaper.widget.WallpaperColorsLoader;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class LivePreviewFragment$$ExternalSyntheticLambda6 implements Observer, WallpaperSurfaceCallback.SurfaceListener, WallpaperColorsLoader.Callback, PackageStatusNotifier.Listener {
    public final /* synthetic */ Object f$0;

    public /* synthetic */ LivePreviewFragment$$ExternalSyntheticLambda6(Object obj) {
        this.f$0 = obj;
    }

    @Override // androidx.lifecycle.Observer
    public final void onChanged(Object obj) {
        ColorSectionController colorSectionController = (ColorSectionController) this.f$0;
        colorSectionController.mHomeWallpaperColors = (WallpaperColors) obj;
        colorSectionController.mHomeWallpaperColorsReady = true;
        colorSectionController.maybeLoadColors();
    }

    @Override // com.android.wallpaper.widget.WallpaperColorsLoader.Callback
    public final void onLoaded(WallpaperColors wallpaperColors) {
        int i = LivePreviewFragment.$r8$clinit;
        ((LivePreviewFragment) this.f$0).onWallpaperColorsChanged(wallpaperColors, 0);
    }

    @Override // com.android.wallpaper.module.PackageStatusNotifier.Listener
    public final void onPackageChanged(String str, int i) {
        WallpaperPickerDelegate wallpaperPickerDelegate = (WallpaperPickerDelegate) this.f$0;
        if (i != 3) {
            wallpaperPickerDelegate.populateCategories(true);
        } else {
            wallpaperPickerDelegate.getClass();
        }
    }

    @Override // com.android.wallpaper.util.WallpaperSurfaceCallback.SurfaceListener
    public final void onSurfaceCreated() {
        WallpaperPreviewer wallpaperPreviewer = (WallpaperPreviewer) this.f$0;
        ImageView imageView = wallpaperPreviewer.mWallpaperSurfaceCallback.mHomeImageWallpaper;
        if (wallpaperPreviewer.mWallpaper != null && imageView != null) {
            imageView.post(new Asset$$ExternalSyntheticLambda1(wallpaperPreviewer, imageView, 1));
        }
    }
}
