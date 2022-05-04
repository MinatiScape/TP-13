package com.android.wallpaper.asset;

import android.app.Activity;
import android.app.WallpaperInfo;
import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import android.widget.ImageView;
import androidx.fragment.app.FragmentActivity;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.picker.WallpaperPreviewBitmapTransformation;
import com.bumptech.glide.Glide;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.MultiTransformation;
import com.bumptech.glide.load.Transformation;
import com.bumptech.glide.load.engine.DiskCacheStrategy;
import com.bumptech.glide.load.resource.bitmap.FitCenter;
import com.bumptech.glide.load.resource.drawable.DrawableTransitionOptions;
import com.bumptech.glide.request.BaseRequestOptions;
import com.bumptech.glide.request.RequestOptions;
import java.io.IOException;
import java.security.MessageDigest;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
/* loaded from: classes.dex */
public class LiveWallpaperThumbAsset extends Asset {
    public static final ExecutorService sExecutorService = Executors.newCachedThreadPool();
    public final Context mContext;
    public final WallpaperInfo mInfo;
    public Drawable mThumbnailDrawable;
    public Uri mUri;

    /* loaded from: classes.dex */
    public static final class LiveWallpaperThumbKey implements Key {
        public WallpaperInfo mInfo;

        @Override // com.bumptech.glide.load.Key
        public final boolean equals(Object obj) {
            if (!(obj instanceof LiveWallpaperThumbKey)) {
                return false;
            }
            return getCacheKey().equals(((LiveWallpaperThumbKey) obj).getCacheKey());
        }

        public final String getCacheKey() {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("LiveWallpaperThumbKey{packageName=");
            m.append(this.mInfo.getPackageName());
            m.append(",serviceName=");
            m.append(this.mInfo.getServiceName());
            m.append('}');
            return m.toString();
        }

        public LiveWallpaperThumbKey(WallpaperInfo wallpaperInfo) {
            this.mInfo = wallpaperInfo;
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
    public final void decodeBitmapRegion(Rect rect, int i, int i2, boolean z, Asset.BitmapReceiver bitmapReceiver) {
        bitmapReceiver.onBitmapDecoded(null);
    }

    @Override // com.android.wallpaper.asset.Asset
    public final void decodeRawDimensions(Activity activity, Asset.DimensionsReceiver dimensionsReceiver) {
        dimensionsReceiver.onDimensionsDecoded(null);
    }

    @Override // com.android.wallpaper.asset.Asset
    public final Bitmap getLowResBitmap(Context context) {
        Bitmap bitmap;
        try {
            Drawable drawable = (Drawable) Glide.getRetriever(context).get(context).asDrawable().loadGeneric(this).submit().get(2L, TimeUnit.SECONDS);
            if ((drawable instanceof BitmapDrawable) && (bitmap = ((BitmapDrawable) drawable).getBitmap()) != null) {
                return bitmap;
            }
            if (drawable.getIntrinsicWidth() > 0 && drawable.getIntrinsicHeight() > 0) {
                Bitmap createBitmap = Bitmap.createBitmap(drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight(), Bitmap.Config.RGB_565);
                Canvas canvas = new Canvas(createBitmap);
                drawable.setBounds(0, 0, canvas.getWidth(), canvas.getHeight());
                drawable.draw(canvas);
                return createBitmap;
            }
            return null;
        } catch (InterruptedException | ExecutionException | TimeoutException e) {
            Log.w("LiveWallpaperThumbAsset", "Couldn't obtain low res bitmap", e);
            return null;
        }
    }

    @Override // com.android.wallpaper.asset.Asset
    public void decodeBitmap(final int i, final int i2, final Asset.BitmapReceiver bitmapReceiver) {
        sExecutorService.execute(new Runnable() { // from class: com.android.wallpaper.asset.LiveWallpaperThumbAsset$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                LiveWallpaperThumbAsset liveWallpaperThumbAsset = LiveWallpaperThumbAsset.this;
                Asset.BitmapReceiver bitmapReceiver2 = bitmapReceiver;
                int i3 = i;
                int i4 = i2;
                Drawable loadThumbnail = liveWallpaperThumbAsset.mInfo.loadThumbnail(liveWallpaperThumbAsset.mContext.getPackageManager());
                if (loadThumbnail instanceof BitmapDrawable) {
                    Asset.decodeBitmapCompleted(bitmapReceiver2, Bitmap.createScaledBitmap(((BitmapDrawable) loadThumbnail).getBitmap(), i3, i4, true));
                } else if (loadThumbnail == null) {
                    Asset.decodeBitmapCompleted(bitmapReceiver2, null);
                } else if (loadThumbnail.getIntrinsicWidth() <= 0 || loadThumbnail.getIntrinsicHeight() <= 0) {
                    Asset.decodeBitmapCompleted(bitmapReceiver2, null);
                } else {
                    Bitmap createBitmap = Bitmap.createBitmap(loadThumbnail.getIntrinsicWidth(), loadThumbnail.getIntrinsicHeight(), Bitmap.Config.ARGB_8888);
                    Canvas canvas = new Canvas(createBitmap);
                    loadThumbnail.setBounds(0, 0, canvas.getWidth(), canvas.getHeight());
                    loadThumbnail.draw(canvas);
                    Asset.decodeBitmapCompleted(bitmapReceiver2, Bitmap.createScaledBitmap(createBitmap, i3, i4, true));
                }
            }
        });
    }

    public Drawable getThumbnailDrawable() {
        Drawable drawable = this.mThumbnailDrawable;
        if (drawable != null) {
            return drawable;
        }
        if (this.mUri != null) {
            try {
                AssetFileDescriptor openAssetFileDescriptor = this.mContext.getContentResolver().openAssetFileDescriptor(this.mUri, "r");
                if (openAssetFileDescriptor != null) {
                    BitmapDrawable bitmapDrawable = new BitmapDrawable(this.mContext.getResources(), BitmapFactory.decodeStream(openAssetFileDescriptor.createInputStream()));
                    this.mThumbnailDrawable = bitmapDrawable;
                    openAssetFileDescriptor.close();
                    return bitmapDrawable;
                } else if (openAssetFileDescriptor != null) {
                    openAssetFileDescriptor.close();
                }
            } catch (IOException unused) {
                Log.w("LiveWallpaperThumbAsset", "Not found thumbnail from URI.");
            }
        }
        Drawable loadThumbnail = this.mInfo.loadThumbnail(this.mContext.getPackageManager());
        this.mThumbnailDrawable = loadThumbnail;
        return loadThumbnail;
    }

    @Override // com.android.wallpaper.asset.Asset
    public void loadDrawable(Activity activity, ImageView imageView, int i) {
        RequestOptions requestOptions;
        if (this.mUri != null) {
            requestOptions = (RequestOptions) ((RequestOptions) RequestOptions.centerCropTransform().mo32apply(new RequestOptions().diskCacheStrategy(DiskCacheStrategy.NONE).skipMemoryCache(true))).placeholder(new ColorDrawable(i));
        } else {
            requestOptions = (RequestOptions) RequestOptions.centerCropTransform().placeholder(new ColorDrawable(i));
        }
        imageView.setBackgroundColor(i);
        Glide.getRetriever(activity).get((Context) activity).asDrawable().loadGeneric(this).mo32apply((BaseRequestOptions<?>) requestOptions).transition(DrawableTransitionOptions.withCrossFade()).into(imageView);
    }

    @Override // com.android.wallpaper.asset.Asset
    public final void loadLowResDrawable(FragmentActivity fragmentActivity, ImageView imageView, int i, WallpaperPreviewBitmapTransformation wallpaperPreviewBitmapTransformation) {
        Transformation transformation;
        if (wallpaperPreviewBitmapTransformation == null) {
            transformation = new FitCenter();
        } else {
            transformation = new MultiTransformation(new FitCenter(), wallpaperPreviewBitmapTransformation);
        }
        Glide.getRetriever(fragmentActivity).get((Activity) fragmentActivity).asDrawable().loadGeneric(this).mo32apply((BaseRequestOptions<?>) RequestOptions.bitmapTransform(transformation).placeholder(new ColorDrawable(i))).into(imageView);
    }

    public LiveWallpaperThumbAsset(Context context, WallpaperInfo wallpaperInfo) {
        this.mContext = context.getApplicationContext();
        this.mInfo = wallpaperInfo;
    }
}
