package com.google.android.apps.wallpaper.asset;

import android.app.Activity;
import android.app.WallpaperInfo;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.widget.ImageView;
import androidx.cardview.R$style;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.asset.LiveWallpaperThumbAsset;
import com.android.wallpaper.module.DeviceColorLayerResolver;
import com.android.wallpaper.module.DrawableLayerResolver;
import com.bumptech.glide.Glide;
import com.bumptech.glide.load.resource.drawable.DrawableTransitionOptions;
import com.bumptech.glide.request.BaseRequestOptions;
import com.bumptech.glide.request.RequestOptions;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
/* loaded from: classes.dex */
public final class GoogleLiveWallpaperThumbAsset extends LiveWallpaperThumbAsset {
    public static final ExecutorService sExecutorService = Executors.newCachedThreadPool();
    public DrawableLayerResolver mLayerResolver = R$style.getInjector().getDrawableLayerResolver();

    @Override // com.android.wallpaper.asset.LiveWallpaperThumbAsset, com.android.wallpaper.asset.Asset
    public final void decodeBitmap(final int i, final int i2, final Asset.BitmapReceiver bitmapReceiver) {
        sExecutorService.execute(new Runnable() { // from class: com.google.android.apps.wallpaper.asset.GoogleLiveWallpaperThumbAsset$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                GoogleLiveWallpaperThumbAsset googleLiveWallpaperThumbAsset = GoogleLiveWallpaperThumbAsset.this;
                Asset.BitmapReceiver bitmapReceiver2 = bitmapReceiver;
                int i3 = i;
                int i4 = i2;
                Drawable loadThumbnail = googleLiveWallpaperThumbAsset.mInfo.loadThumbnail(googleLiveWallpaperThumbAsset.mContext.getPackageManager());
                if (loadThumbnail instanceof BitmapDrawable) {
                    Asset.decodeBitmapCompleted(bitmapReceiver2, Bitmap.createScaledBitmap(((BitmapDrawable) loadThumbnail).getBitmap(), i3, i4, true));
                    return;
                }
                if (loadThumbnail instanceof LayerDrawable) {
                    LayerDrawable layerDrawable = (LayerDrawable) loadThumbnail;
                    ((DeviceColorLayerResolver) googleLiveWallpaperThumbAsset.mLayerResolver).getClass();
                    Drawable drawable = layerDrawable.getDrawable(Math.min(DeviceColorLayerResolver.LAYER_INDEX, layerDrawable.getNumberOfLayers() - 1));
                    if (drawable instanceof BitmapDrawable) {
                        Asset.decodeBitmapCompleted(bitmapReceiver2, Bitmap.createScaledBitmap(((BitmapDrawable) drawable).getBitmap(), i3, i4, true));
                        return;
                    }
                }
                Asset.decodeBitmapCompleted(bitmapReceiver2, null);
            }
        });
    }

    @Override // com.android.wallpaper.asset.LiveWallpaperThumbAsset
    public final Drawable getThumbnailDrawable() {
        Drawable loadThumbnail = this.mInfo.loadThumbnail(this.mContext.getPackageManager());
        if (!(loadThumbnail instanceof LayerDrawable)) {
            return loadThumbnail;
        }
        LayerDrawable layerDrawable = (LayerDrawable) loadThumbnail;
        ((DeviceColorLayerResolver) this.mLayerResolver).getClass();
        return layerDrawable.getDrawable(Math.min(DeviceColorLayerResolver.LAYER_INDEX, layerDrawable.getNumberOfLayers() - 1));
    }

    public GoogleLiveWallpaperThumbAsset(Context context, WallpaperInfo wallpaperInfo) {
        super(context, wallpaperInfo);
    }

    @Override // com.android.wallpaper.asset.LiveWallpaperThumbAsset, com.android.wallpaper.asset.Asset
    public final void loadDrawable(Activity activity, ImageView imageView, int i) {
        imageView.setBackgroundColor(i);
        Glide.getRetriever(activity).get((Context) activity).asDrawable().loadGeneric(this).mo32apply((BaseRequestOptions<?>) RequestOptions.centerCropTransform().placeholder(new ColorDrawable(i))).transition(DrawableTransitionOptions.withCrossFade()).into(imageView);
    }
}
