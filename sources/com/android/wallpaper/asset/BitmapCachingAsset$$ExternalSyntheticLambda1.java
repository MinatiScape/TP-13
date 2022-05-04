package com.android.wallpaper.asset;

import android.app.WallpaperColors;
import android.graphics.Bitmap;
import android.util.Log;
import android.util.LruCache;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.asset.BitmapCachingAsset;
import com.android.wallpaper.widget.WallpaperColorsLoader;
/* loaded from: classes.dex */
public final /* synthetic */ class BitmapCachingAsset$$ExternalSyntheticLambda1 implements Asset.BitmapReceiver {
    public final /* synthetic */ int $r8$classId = 1;
    public final /* synthetic */ Object f$0;
    public final /* synthetic */ Object f$1;

    public /* synthetic */ BitmapCachingAsset$$ExternalSyntheticLambda1(Asset asset, WallpaperColorsLoader.Callback callback) {
        this.f$0 = asset;
        this.f$1 = callback;
    }

    public /* synthetic */ BitmapCachingAsset$$ExternalSyntheticLambda1(BitmapCachingAsset.CacheKey cacheKey, Asset.BitmapReceiver bitmapReceiver) {
        this.f$0 = cacheKey;
        this.f$1 = bitmapReceiver;
    }

    @Override // com.android.wallpaper.asset.Asset.BitmapReceiver
    public final void onBitmapDecoded(Bitmap bitmap) {
        switch (this.$r8$classId) {
            case 0:
                BitmapCachingAsset.CacheKey cacheKey = (BitmapCachingAsset.CacheKey) this.f$0;
                Asset.BitmapReceiver bitmapReceiver = (Asset.BitmapReceiver) this.f$1;
                if (bitmap != null) {
                    BitmapCachingAsset.sCache.put(cacheKey, bitmap);
                }
                bitmapReceiver.onBitmapDecoded(bitmap);
                return;
            default:
                Asset asset = (Asset) this.f$0;
                WallpaperColorsLoader.Callback callback = (WallpaperColorsLoader.Callback) this.f$1;
                LruCache<Asset, WallpaperColors> lruCache = WallpaperColorsLoader.sCache;
                if (bitmap != null) {
                    boolean z = false;
                    if (bitmap.getConfig() == Bitmap.Config.HARDWARE) {
                        bitmap = bitmap.copy(Bitmap.Config.ARGB_8888, false);
                        z = true;
                    }
                    WallpaperColors fromBitmap = WallpaperColors.fromBitmap(bitmap);
                    WallpaperColorsLoader.sCache.put(asset, fromBitmap);
                    callback.onLoaded(fromBitmap);
                    if (z) {
                        bitmap.recycle();
                        return;
                    }
                    return;
                }
                Log.i("WallpaperColorsLoader", "Can't get wallpaper colors from a null bitmap, uses null color.");
                callback.onLoaded(null);
                return;
        }
    }
}
