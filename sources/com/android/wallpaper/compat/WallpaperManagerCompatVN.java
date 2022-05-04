package com.android.wallpaper.compat;

import android.content.Context;
import android.graphics.Bitmap;
import android.os.ParcelFileDescriptor;
import android.util.Log;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes.dex */
public final class WallpaperManagerCompatVN extends WallpaperManagerCompatV16 {
    @Override // com.android.wallpaper.compat.WallpaperManagerCompat
    public final ParcelFileDescriptor getWallpaperFile(int i) {
        try {
            return this.mWallpaperManager.getWallpaperFile(i);
        } catch (Exception e) {
            Log.e("WallpaperMgrCompatVN", "Exception on getWallpaperFile", e);
            return null;
        }
    }

    @Override // com.android.wallpaper.compat.WallpaperManagerCompat
    public final int getWallpaperId(int i) {
        return this.mWallpaperManager.getWallpaperId(i);
    }

    @Override // com.android.wallpaper.compat.WallpaperManagerCompat
    public final int setBitmap(Bitmap bitmap, boolean z, int i) throws IOException {
        return this.mWallpaperManager.setBitmap(bitmap, null, z, i);
    }

    @Override // com.android.wallpaper.compat.WallpaperManagerCompat
    public final int setStream(InputStream inputStream, boolean z, int i) throws IOException {
        return this.mWallpaperManager.setStream(inputStream, null, z, i);
    }

    public WallpaperManagerCompatVN(Context context) {
        super(context);
    }
}
