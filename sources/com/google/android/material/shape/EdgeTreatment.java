package com.google.android.material.shape;

import android.app.WallpaperManager;
import android.content.Context;
import android.os.ParcelFileDescriptor;
import android.util.Log;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.android.wallpaper.compat.WallpaperManagerCompatV16;
import com.android.wallpaper.module.InjectorProvider;
import java.io.IOException;
/* loaded from: classes.dex */
public class EdgeTreatment {
    public EdgeTreatment(int i) {
    }

    public void getEdgePath(float f, float f2, float f3, ShapePath shapePath) {
        shapePath.lineTo(f, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
    }

    public boolean isHomeStaticWallpaperSet(Context context) {
        WallpaperManagerCompatV16 wallpaperManagerCompat = InjectorProvider.getInjector().getWallpaperManagerCompat(context);
        boolean z = true;
        ParcelFileDescriptor wallpaperFile = wallpaperManagerCompat.getWallpaperFile(1);
        if (wallpaperFile == null) {
            z = false;
        }
        if (wallpaperFile != null) {
            try {
                wallpaperFile.close();
            } catch (IOException e) {
                Log.e("DefaultWallpaperStatusChecker", "Unable to close system wallpaper ParcelFileDescriptor", e);
            }
        }
        return z;
    }

    public boolean isLockWallpaperSet(Context context) {
        return WallpaperManager.getInstance(context).getWallpaperId(2) > 0;
    }
}
