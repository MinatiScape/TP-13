package com.android.wallpaper.asset;

import android.app.WallpaperManager;
import android.content.Context;
/* loaded from: classes.dex */
public final class WallpaperModel {
    public WallpaperManager mWallpaperManager;
    public int mWallpaperSource = 0;

    public WallpaperModel(Context context) {
        this.mWallpaperManager = WallpaperManager.getInstance(context);
    }
}
