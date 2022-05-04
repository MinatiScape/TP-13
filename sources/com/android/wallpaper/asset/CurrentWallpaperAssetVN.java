package com.android.wallpaper.asset;

import android.app.Activity;
import android.app.WallpaperManager;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.os.ParcelFileDescriptor;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import android.widget.ImageView;
import androidx.fragment.app.FragmentActivity;
import com.android.wallpaper.compat.WallpaperManagerCompat;
import com.android.wallpaper.compat.WallpaperManagerCompatVN;
import com.android.wallpaper.picker.WallpaperPreviewBitmapTransformation;
import com.android.wallpaper.util.WallpaperCropUtils;
import com.bumptech.glide.Glide;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.MultiTransformation;
import com.bumptech.glide.load.resource.bitmap.FitCenter;
import com.bumptech.glide.load.resource.drawable.DrawableTransitionOptions;
import com.bumptech.glide.request.BaseRequestOptions;
import com.bumptech.glide.request.RequestOptions;
import java.io.InputStream;
import java.security.MessageDigest;
import java.util.concurrent.ExecutionException;
/* loaded from: classes.dex */
public final class CurrentWallpaperAssetVN extends StreamableAsset {
    public int mWallpaperId;
    public WallpaperManager mWallpaperManager;
    public WallpaperManagerCompat mWallpaperManagerCompat;
    public int mWallpaperManagerFlag;

    /* loaded from: classes.dex */
    public static final class CurrentWallpaperVNKey implements Key {
        public int mWallpaperFlag;
        public WallpaperManager mWallpaperManager;

        @Override // com.bumptech.glide.load.Key
        public final boolean equals(Object obj) {
            if (obj instanceof CurrentWallpaperVNKey) {
                return getCacheKey().equals(((CurrentWallpaperVNKey) obj).getCacheKey());
            }
            return false;
        }

        public final String getCacheKey() {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("CurrentWallpaperVNKey{flag=");
            m.append(this.mWallpaperFlag);
            m.append(",id=");
            m.append(this.mWallpaperManager.getWallpaperId(this.mWallpaperFlag));
            m.append('}');
            return m.toString();
        }

        public CurrentWallpaperVNKey(WallpaperManager wallpaperManager, int i) {
            this.mWallpaperManager = wallpaperManager;
            this.mWallpaperFlag = i;
        }

        @Override // com.bumptech.glide.load.Key
        public final int hashCode() {
            return getCacheKey().hashCode();
        }

        public final String toString() {
            return getCacheKey();
        }

        @Override // com.bumptech.glide.load.Key
        public final void updateDiskCacheKey(MessageDigest messageDigest) {
            messageDigest.update(getCacheKey().getBytes(Key.CHARSET));
        }
    }

    @Override // com.android.wallpaper.asset.Asset
    public final void adjustCropRect(Activity activity, Rect rect) {
        rect.offsetTo(0, 0);
        WallpaperCropUtils.adjustCropRect(activity, rect);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof CurrentWallpaperAssetVN)) {
            return false;
        }
        CurrentWallpaperAssetVN currentWallpaperAssetVN = (CurrentWallpaperAssetVN) obj;
        if (currentWallpaperAssetVN.mWallpaperManagerFlag == this.mWallpaperManagerFlag && currentWallpaperAssetVN.mWallpaperId == this.mWallpaperId) {
            return true;
        }
        return false;
    }

    public final int hashCode() {
        return ((527 + this.mWallpaperManagerFlag) * 31) + this.mWallpaperId;
    }

    @Override // com.android.wallpaper.asset.Asset
    public final void loadLowResDrawable(FragmentActivity fragmentActivity, ImageView imageView, int i, WallpaperPreviewBitmapTransformation wallpaperPreviewBitmapTransformation) {
        Glide.getRetriever(fragmentActivity).get((Activity) fragmentActivity).asDrawable().loadGeneric(this).mo32apply((BaseRequestOptions<?>) RequestOptions.bitmapTransform(new MultiTransformation(new FitCenter(), wallpaperPreviewBitmapTransformation)).placeholder(new ColorDrawable(i))).into(imageView);
    }

    @Override // com.android.wallpaper.asset.StreamableAsset
    public final InputStream openInputStream() {
        ParcelFileDescriptor wallpaperFile = this.mWallpaperManagerCompat.getWallpaperFile(this.mWallpaperManagerFlag);
        if (wallpaperFile != null) {
            return new ParcelFileDescriptor.AutoCloseInputStream(wallpaperFile);
        }
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("ParcelFileDescriptor for wallpaper ");
        m.append(this.mWallpaperManagerFlag);
        m.append(" is null, unable to open InputStream.");
        Log.e("CurrentWallpaperAssetVN", m.toString());
        return null;
    }

    public CurrentWallpaperAssetVN(Context context, int i) {
        WallpaperManagerCompatVN wallpaperManagerCompatVN;
        this.mWallpaperManager = WallpaperManager.getInstance(context);
        synchronized (WallpaperManagerCompat.sInstanceLock) {
            if (WallpaperManagerCompat.sInstance == null) {
                WallpaperManagerCompat.sInstance = new WallpaperManagerCompatVN(context.getApplicationContext());
            }
            wallpaperManagerCompatVN = WallpaperManagerCompat.sInstance;
        }
        this.mWallpaperManagerCompat = wallpaperManagerCompatVN;
        this.mWallpaperManagerFlag = i;
        this.mWallpaperId = wallpaperManagerCompatVN.getWallpaperId(i);
    }

    @Override // com.android.wallpaper.asset.Asset
    public final Bitmap getLowResBitmap(Context context) {
        try {
            return (Bitmap) Glide.getRetriever(context).get(context).asBitmap().loadGeneric(this).submit().get();
        } catch (InterruptedException | ExecutionException e) {
            Log.w("CurrentWallpaperAssetVN", "Couldn't obtain low res bitmap", e);
            return null;
        }
    }

    @Override // com.android.wallpaper.asset.Asset
    public final void loadDrawable(Activity activity, ImageView imageView, int i) {
        Glide.getRetriever(activity).get((Context) activity).asDrawable().loadGeneric(this).mo32apply((BaseRequestOptions<?>) RequestOptions.centerCropTransform()).transition(DrawableTransitionOptions.withCrossFade()).into(imageView);
    }
}
