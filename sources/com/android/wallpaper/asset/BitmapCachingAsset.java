package com.android.wallpaper.asset;

import android.app.Activity;
import android.app.ActivityManager;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.util.LruCache;
import android.widget.ImageView;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.asset.BitmapCachingAsset;
import java.util.Objects;
/* loaded from: classes.dex */
public final class BitmapCachingAsset extends Asset {
    public static AnonymousClass1 sCache = new LruCache<CacheKey, Bitmap>(104857600) { // from class: com.android.wallpaper.asset.BitmapCachingAsset.1
        @Override // android.util.LruCache
        public final int sizeOf(CacheKey cacheKey, Bitmap bitmap) {
            return bitmap.getByteCount();
        }
    };
    public final boolean mIsLowRam;
    public final Asset mOriginalAsset;

    /* loaded from: classes.dex */
    public static class CacheKey {
        public final Asset mAsset;
        public final int mHeight;
        public final Rect mRect;
        public final boolean mRtl;
        public final int mWidth;

        public final int hashCode() {
            return Objects.hash(this.mAsset, Integer.valueOf(this.mWidth), Integer.valueOf(this.mHeight));
        }

        public final boolean equals(Object obj) {
            if (obj instanceof CacheKey) {
                CacheKey cacheKey = (CacheKey) obj;
                if (Objects.equals(this.mAsset, cacheKey.mAsset) && cacheKey.mWidth == this.mWidth && cacheKey.mHeight == this.mHeight && cacheKey.mRtl == this.mRtl && Objects.equals(this.mRect, cacheKey.mRect)) {
                    return true;
                }
            }
            return false;
        }

        public CacheKey(Asset asset, int i, int i2, boolean z, Rect rect) {
            this.mAsset = asset;
            this.mWidth = i;
            this.mHeight = i2;
            this.mRtl = z;
            this.mRect = rect;
        }
    }

    @Override // com.android.wallpaper.asset.Asset
    public final void decodeBitmap(int i, int i2, final Asset.BitmapReceiver bitmapReceiver) {
        if (this.mIsLowRam) {
            this.mOriginalAsset.decodeBitmap(i, i2, new Asset.BitmapReceiver() { // from class: com.android.wallpaper.asset.BitmapCachingAsset$$ExternalSyntheticLambda0
                @Override // com.android.wallpaper.asset.Asset.BitmapReceiver
                public final void onBitmapDecoded(Bitmap bitmap) {
                    Asset.BitmapReceiver.this.onBitmapDecoded(bitmap);
                }
            });
            return;
        }
        final CacheKey cacheKey = new CacheKey(this.mOriginalAsset, i, i2, false, null);
        Bitmap bitmap = sCache.get(cacheKey);
        if (bitmap != null) {
            bitmapReceiver.onBitmapDecoded(bitmap);
        } else {
            this.mOriginalAsset.decodeBitmap(i, i2, new Asset.BitmapReceiver() { // from class: com.android.wallpaper.asset.BitmapCachingAsset$$ExternalSyntheticLambda1
                @Override // com.android.wallpaper.asset.Asset.BitmapReceiver
                public final void onBitmapDecoded(Bitmap bitmap2) {
                    BitmapCachingAsset.CacheKey cacheKey2 = BitmapCachingAsset.CacheKey.this;
                    Asset.BitmapReceiver bitmapReceiver2 = bitmapReceiver;
                    if (bitmap2 != null) {
                        BitmapCachingAsset.sCache.put(cacheKey2, bitmap2);
                    }
                    bitmapReceiver2.onBitmapDecoded(bitmap2);
                }
            });
        }
    }

    @Override // com.android.wallpaper.asset.Asset
    public final void decodeBitmapRegion(Rect rect, int i, int i2, boolean z, final Asset.BitmapReceiver bitmapReceiver) {
        if (this.mIsLowRam) {
            this.mOriginalAsset.decodeBitmapRegion(rect, i, i2, z, bitmapReceiver);
            return;
        }
        final CacheKey cacheKey = new CacheKey(this.mOriginalAsset, i, i2, z, rect);
        Bitmap bitmap = sCache.get(cacheKey);
        if (bitmap != null) {
            bitmapReceiver.onBitmapDecoded(bitmap);
        } else {
            this.mOriginalAsset.decodeBitmapRegion(rect, i, i2, z, new Asset.BitmapReceiver() { // from class: com.android.wallpaper.asset.BitmapCachingAsset$$ExternalSyntheticLambda2
                @Override // com.android.wallpaper.asset.Asset.BitmapReceiver
                public final void onBitmapDecoded(Bitmap bitmap2) {
                    BitmapCachingAsset.CacheKey cacheKey2 = BitmapCachingAsset.CacheKey.this;
                    Asset.BitmapReceiver bitmapReceiver2 = bitmapReceiver;
                    if (bitmap2 != null) {
                        BitmapCachingAsset.sCache.put(cacheKey2, bitmap2);
                    }
                    bitmapReceiver2.onBitmapDecoded(bitmap2);
                }
            });
        }
    }

    @Override // com.android.wallpaper.asset.Asset
    public final void decodeRawDimensions(Activity activity, Asset.DimensionsReceiver dimensionsReceiver) {
        this.mOriginalAsset.decodeRawDimensions(activity, dimensionsReceiver);
    }

    @Override // com.android.wallpaper.asset.Asset
    public final void loadPreviewImage(Activity activity, ImageView imageView, int i) {
        this.mOriginalAsset.loadPreviewImage(activity, imageView, i);
    }

    public BitmapCachingAsset(Context context, Asset asset) {
        this.mOriginalAsset = asset instanceof BitmapCachingAsset ? ((BitmapCachingAsset) asset).mOriginalAsset : asset;
        this.mIsLowRam = ((ActivityManager) context.getApplicationContext().getSystemService("activity")).isLowRamDevice();
    }
}
