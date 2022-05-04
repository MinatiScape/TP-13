package com.android.wallpaper.compat;

import android.annotation.SuppressLint;
import android.app.WallpaperManager;
import android.content.Context;
/* loaded from: classes.dex */
public class WallpaperManagerCompatV16 extends WallpaperManagerCompat {
    public WallpaperManager mWallpaperManager;

    @SuppressLint({"ServiceCast"})
    public WallpaperManagerCompatV16(Context context) {
        this.mWallpaperManager = (WallpaperManager) context.getSystemService("wallpaper");
    }
}
