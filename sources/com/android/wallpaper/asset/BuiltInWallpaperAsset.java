package com.android.wallpaper.asset;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.WallpaperManager;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.AsyncTask;
import android.widget.ImageView;
import com.android.wallpaper.asset.Asset;
import com.bumptech.glide.Glide;
import com.bumptech.glide.load.resource.drawable.DrawableTransitionOptions;
import com.bumptech.glide.request.BaseRequestOptions;
import com.bumptech.glide.request.RequestOptions;
@TargetApi(19)
/* loaded from: classes.dex */
public final class BuiltInWallpaperAsset extends Asset {
    public WallpaperModel mBuiltInWallpaperModel;
    public final Context mContext;
    public Point mDimensions;

    /* loaded from: classes.dex */
    public class DecodeBitmapAsyncTask extends AsyncTask<Void, Void, Bitmap> {
        public int mHeight;
        public Asset.BitmapReceiver mReceiver;
        public int mWidth;

        public DecodeBitmapAsyncTask(int i, int i2, Asset.BitmapReceiver bitmapReceiver) {
            this.mWidth = i;
            this.mHeight = i2;
            this.mReceiver = bitmapReceiver;
        }

        @Override // android.os.AsyncTask
        public final Bitmap doInBackground(Void[] voidArr) {
            WallpaperManager wallpaperManager = WallpaperManager.getInstance(BuiltInWallpaperAsset.this.mContext);
            Drawable builtInDrawable = wallpaperManager.getBuiltInDrawable(this.mWidth, this.mHeight, true, 0.5f, 0.5f);
            wallpaperManager.forgetLoadedWallpaper();
            return ((BitmapDrawable) builtInDrawable).getBitmap();
        }

        @Override // android.os.AsyncTask
        public final void onPostExecute(Bitmap bitmap) {
            this.mReceiver.onBitmapDecoded(bitmap);
        }
    }

    /* loaded from: classes.dex */
    public class DecodeBitmapRegionAsyncTask extends AsyncTask<Void, Void, Bitmap> {
        public Asset.BitmapReceiver mReceiver;
        public Rect mRect;

        public DecodeBitmapRegionAsyncTask(Rect rect, Asset.BitmapReceiver bitmapReceiver) {
            this.mRect = rect;
            this.mReceiver = bitmapReceiver;
        }

        @Override // android.os.AsyncTask
        public final Bitmap doInBackground(Void[] voidArr) {
            float f;
            Point point = BuiltInWallpaperAsset.m25$$Nest$mcalculateRawDimensions(BuiltInWallpaperAsset.this);
            Rect rect = this.mRect;
            int i = rect.left;
            int i2 = point.x - rect.right;
            float f2 = 0.5f;
            if (i + i2 == 0) {
                f = 0.5f;
            } else {
                float f3 = i;
                f = f3 / (i2 + f3);
            }
            int i3 = rect.top;
            int i4 = point.y - rect.bottom;
            if (i3 + i4 != 0) {
                float f4 = i3;
                f2 = f4 / (i4 + f4);
            }
            return ((BitmapDrawable) WallpaperManager.getInstance(BuiltInWallpaperAsset.this.mContext).getBuiltInDrawable(this.mRect.width(), this.mRect.height(), false, f, f2)).getBitmap();
        }

        @Override // android.os.AsyncTask
        public final void onPostExecute(Bitmap bitmap) {
            this.mReceiver.onBitmapDecoded(bitmap);
        }
    }

    /* loaded from: classes.dex */
    public class DecodeDimensionsAsyncTask extends AsyncTask<Void, Void, Point> {
        public Asset.DimensionsReceiver mReceiver;

        public DecodeDimensionsAsyncTask(Asset.DimensionsReceiver dimensionsReceiver) {
            this.mReceiver = dimensionsReceiver;
        }

        @Override // android.os.AsyncTask
        public final Point doInBackground(Void[] voidArr) {
            return BuiltInWallpaperAsset.m25$$Nest$mcalculateRawDimensions(BuiltInWallpaperAsset.this);
        }

        @Override // android.os.AsyncTask
        public final void onPostExecute(Point point) {
            this.mReceiver.onDimensionsDecoded(point);
        }
    }

    /* renamed from: -$$Nest$mcalculateRawDimensions  reason: not valid java name */
    public static Point m25$$Nest$mcalculateRawDimensions(BuiltInWallpaperAsset builtInWallpaperAsset) {
        Point point = builtInWallpaperAsset.mDimensions;
        if (point != null) {
            return point;
        }
        Bitmap bitmap = ((BitmapDrawable) WallpaperManager.getInstance(builtInWallpaperAsset.mContext).getBuiltInDrawable()).getBitmap();
        Point point2 = new Point(bitmap.getWidth(), bitmap.getHeight());
        builtInWallpaperAsset.mDimensions = point2;
        return point2;
    }

    @Override // com.android.wallpaper.asset.Asset
    public final void decodeBitmap(int i, int i2, Asset.BitmapReceiver bitmapReceiver) {
        new DecodeBitmapAsyncTask(i, i2, bitmapReceiver).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
    }

    @Override // com.android.wallpaper.asset.Asset
    public final void decodeBitmapRegion(Rect rect, int i, int i2, boolean z, Asset.BitmapReceiver bitmapReceiver) {
        new DecodeBitmapRegionAsyncTask(rect, bitmapReceiver).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
    }

    @Override // com.android.wallpaper.asset.Asset
    public final void decodeRawDimensions(Activity activity, Asset.DimensionsReceiver dimensionsReceiver) {
        new DecodeDimensionsAsyncTask(dimensionsReceiver).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
    }

    @Override // com.android.wallpaper.asset.Asset
    public final void loadDrawable(Activity activity, ImageView imageView, int i) {
        if (this.mBuiltInWallpaperModel == null) {
            this.mBuiltInWallpaperModel = new WallpaperModel(activity.getApplicationContext());
        }
        Glide.getRetriever(activity).get((Context) activity).asDrawable().loadGeneric(this.mBuiltInWallpaperModel).mo32apply((BaseRequestOptions<?>) RequestOptions.centerCropTransform().placeholder(new ColorDrawable(i))).transition(DrawableTransitionOptions.withCrossFade()).into(imageView);
    }

    public BuiltInWallpaperAsset(Context context) {
        this.mContext = context.getApplicationContext();
    }
}
