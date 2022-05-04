package com.android.wallpaper.widget;

import android.app.Activity;
import android.app.WallpaperColors;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.util.Log;
import android.util.LruCache;
import android.view.WindowManager;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.asset.BitmapCachingAsset;
import com.android.wallpaper.util.ScreenSizeCalculator;
import com.android.wallpaper.widget.WallpaperColorsLoader;
/* loaded from: classes.dex */
public final class WallpaperColorsLoader {
    public static LruCache<Asset, WallpaperColors> sCache = new LruCache<>(6);

    /* loaded from: classes.dex */
    public interface Callback {
        void onLoaded(WallpaperColors wallpaperColors);
    }

    public static void getWallpaperColors(Activity activity, final Asset asset, final Callback callback) {
        WallpaperColors wallpaperColors = sCache.get(asset);
        if (wallpaperColors != null) {
            callback.onLoaded(wallpaperColors);
            return;
        }
        Point screenSize = ScreenSizeCalculator.getInstance().getScreenSize(((WindowManager) activity.getSystemService(WindowManager.class)).getDefaultDisplay());
        new BitmapCachingAsset(activity, asset).decodeBitmap(screenSize.y / 2, screenSize.x / 2, new Asset.BitmapReceiver() { // from class: com.android.wallpaper.widget.WallpaperColorsLoader$$ExternalSyntheticLambda0
            @Override // com.android.wallpaper.asset.Asset.BitmapReceiver
            public final void onBitmapDecoded(Bitmap bitmap) {
                Asset asset2 = Asset.this;
                WallpaperColorsLoader.Callback callback2 = callback;
                if (bitmap != null) {
                    boolean z = false;
                    if (bitmap.getConfig() == Bitmap.Config.HARDWARE) {
                        bitmap = bitmap.copy(Bitmap.Config.ARGB_8888, false);
                        z = true;
                    }
                    WallpaperColors fromBitmap = WallpaperColors.fromBitmap(bitmap);
                    WallpaperColorsLoader.sCache.put(asset2, fromBitmap);
                    callback2.onLoaded(fromBitmap);
                    if (z) {
                        bitmap.recycle();
                        return;
                    }
                    return;
                }
                Log.i("WallpaperColorsLoader", "Can't get wallpaper colors from a null bitmap, uses null color.");
                callback2.onLoaded(null);
            }
        });
    }
}
