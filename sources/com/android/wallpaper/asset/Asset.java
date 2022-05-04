package com.android.wallpaper.asset;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.TransitionDrawable;
import android.os.Handler;
import android.os.Looper;
import android.widget.ImageView;
import androidx.cardview.R$style;
import androidx.fragment.app.FragmentActivity;
import com.android.wallpaper.module.BitmapCropper;
import com.android.wallpaper.module.DefaultBitmapCropper;
import com.android.wallpaper.picker.WallpaperPreviewBitmapTransformation;
import com.android.wallpaper.util.ScreenSizeCalculator;
import com.android.wallpaper.util.WallpaperCropUtils;
/* loaded from: classes.dex */
public abstract class Asset {

    /* loaded from: classes.dex */
    public interface BitmapReceiver {
        void onBitmapDecoded(Bitmap bitmap);
    }

    /* loaded from: classes.dex */
    public interface DimensionsReceiver {
        void onDimensionsDecoded(Point point);
    }

    public abstract void decodeBitmap(int i, int i2, BitmapReceiver bitmapReceiver);

    public abstract void decodeBitmapRegion(Rect rect, int i, int i2, boolean z, BitmapReceiver bitmapReceiver);

    public abstract void decodeRawDimensions(Activity activity, DimensionsReceiver dimensionsReceiver);

    public Bitmap getLowResBitmap(Context context) {
        return null;
    }

    public void loadLowResDrawable(FragmentActivity fragmentActivity, ImageView imageView, int i, WallpaperPreviewBitmapTransformation wallpaperPreviewBitmapTransformation) {
    }

    public static void decodeBitmapCompleted(BitmapReceiver bitmapReceiver, Bitmap bitmap) {
        new Handler(Looper.getMainLooper()).post(new Asset$$ExternalSyntheticLambda1(bitmapReceiver, bitmap, 0));
    }

    public void loadDrawable(final Activity activity, final ImageView imageView, int i) {
        final boolean z;
        int i2;
        int i3;
        if (imageView.getDrawable() == null) {
            z = true;
        } else {
            z = false;
        }
        final ColorDrawable colorDrawable = new ColorDrawable(i);
        if (z) {
            imageView.setImageDrawable(colorDrawable);
        }
        if (imageView.getWidth() > 0) {
            i2 = imageView.getWidth();
        } else {
            i2 = Math.abs(imageView.getLayoutParams().width);
        }
        if (imageView.getHeight() > 0) {
            i3 = imageView.getHeight();
        } else {
            i3 = Math.abs(imageView.getLayoutParams().height);
        }
        decodeBitmap(i2, i3, new BitmapReceiver() { // from class: com.android.wallpaper.asset.Asset.1
            @Override // com.android.wallpaper.asset.Asset.BitmapReceiver
            public final void onBitmapDecoded(Bitmap bitmap) {
                if (!z) {
                    imageView.setImageBitmap(bitmap);
                    return;
                }
                Resources resources = activity.getResources();
                TransitionDrawable transitionDrawable = new TransitionDrawable(new Drawable[]{colorDrawable, new BitmapDrawable(resources, bitmap)});
                transitionDrawable.setCrossFadeEnabled(true);
                imageView.setImageDrawable(transitionDrawable);
                transitionDrawable.startTransition(resources.getInteger(17694720));
            }
        });
    }

    public void loadPreviewImage(final Activity activity, final ImageView imageView, final int i) {
        boolean z;
        if (imageView.getDrawable() == null) {
            z = true;
        } else {
            z = false;
        }
        final boolean z2 = z;
        final ColorDrawable colorDrawable = new ColorDrawable(i);
        if (z2) {
            imageView.setImageDrawable(colorDrawable);
        }
        decodeRawDimensions(activity, new DimensionsReceiver() { // from class: com.android.wallpaper.asset.Asset$$ExternalSyntheticLambda0
            @Override // com.android.wallpaper.asset.Asset.DimensionsReceiver
            public final void onDimensionsDecoded(Point point) {
                Asset asset = Asset.this;
                final Activity activity2 = activity;
                final ImageView imageView2 = imageView;
                int i2 = i;
                final boolean z3 = z2;
                final Drawable drawable = colorDrawable;
                if (point == null) {
                    asset.loadDrawable(activity2, imageView2, i2);
                    return;
                }
                asset.getClass();
                Rect calculateVisibleRect = WallpaperCropUtils.calculateVisibleRect(point, ScreenSizeCalculator.getInstance().getScreenSize(activity2.getWindowManager().getDefaultDisplay()));
                asset.adjustCropRect(activity2, calculateVisibleRect);
                BitmapCropper bitmapCropper = R$style.getInjector().getBitmapCropper();
                ((DefaultBitmapCropper) bitmapCropper).cropAndScaleBitmap(asset, 1.0f, calculateVisibleRect, WallpaperCropUtils.isRtl(activity2), new BitmapCropper.Callback() { // from class: com.android.wallpaper.asset.Asset.3
                    @Override // com.android.wallpaper.module.BitmapCropper.Callback
                    public final void onError(OutOfMemoryError outOfMemoryError) {
                    }

                    @Override // com.android.wallpaper.module.BitmapCropper.Callback
                    public final void onBitmapCropped(Bitmap bitmap) {
                        imageView2.setScaleType(ImageView.ScaleType.CENTER_CROP);
                        if (!z3) {
                            imageView2.setImageBitmap(bitmap);
                            return;
                        }
                        Resources resources = activity2.getResources();
                        TransitionDrawable transitionDrawable = new TransitionDrawable(new Drawable[]{drawable, new BitmapDrawable(resources, bitmap)});
                        transitionDrawable.setCrossFadeEnabled(true);
                        imageView2.setImageDrawable(transitionDrawable);
                        transitionDrawable.startTransition(resources.getInteger(17694720));
                    }
                });
            }
        });
    }

    public void adjustCropRect(Activity activity, Rect rect) {
        WallpaperCropUtils.adjustCropRect(activity, rect);
    }
}
