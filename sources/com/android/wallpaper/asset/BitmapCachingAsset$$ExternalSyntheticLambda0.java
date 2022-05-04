package com.android.wallpaper.asset;

import android.graphics.Bitmap;
import android.graphics.Point;
import android.graphics.PointF;
import android.graphics.Rect;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.picker.ImagePreviewFragment;
import com.android.wallpaper.util.DiskBasedLogger$$ExternalSyntheticLambda1;
import com.android.wallpaper.util.WallpaperCropUtils;
import com.davemorrissey.labs.subscaleview.ImageSource;
import com.davemorrissey.labs.subscaleview.SubsamplingScaleImageView;
import java.util.concurrent.Executor;
/* loaded from: classes.dex */
public final /* synthetic */ class BitmapCachingAsset$$ExternalSyntheticLambda0 implements Asset.BitmapReceiver {
    public final /* synthetic */ int $r8$classId = 0;
    public final /* synthetic */ Object f$0;

    public /* synthetic */ BitmapCachingAsset$$ExternalSyntheticLambda0(Asset.BitmapReceiver bitmapReceiver) {
        this.f$0 = bitmapReceiver;
    }

    public /* synthetic */ BitmapCachingAsset$$ExternalSyntheticLambda0(ImagePreviewFragment imagePreviewFragment) {
        this.f$0 = imagePreviewFragment;
    }

    @Override // com.android.wallpaper.asset.Asset.BitmapReceiver
    public final void onBitmapDecoded(Bitmap bitmap) {
        switch (this.$r8$classId) {
            case 0:
                ((Asset.BitmapReceiver) this.f$0).onBitmapDecoded(bitmap);
                return;
            default:
                ImagePreviewFragment imagePreviewFragment = (ImagePreviewFragment) this.f$0;
                Executor executor = ImagePreviewFragment.sExecutor;
                if (imagePreviewFragment.getActivity() != null) {
                    if (bitmap == null) {
                        imagePreviewFragment.showLoadWallpaperErrorDialog();
                        return;
                    }
                    imagePreviewFragment.mWallpaperSurface.setBackgroundColor(0);
                    SubsamplingScaleImageView subsamplingScaleImageView = imagePreviewFragment.mFullResImageView;
                    if (subsamplingScaleImageView != null) {
                        subsamplingScaleImageView.setImage(new ImageSource(bitmap, false));
                        imagePreviewFragment.mFullResImageView.setAlpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                        boolean z = imagePreviewFragment.mWallpaperAsset instanceof CurrentWallpaperAssetVN;
                        Point point = new Point(imagePreviewFragment.mWallpaperSurface.getMeasuredWidth(), imagePreviewFragment.mWallpaperSurface.getMeasuredHeight());
                        Rect calculateVisibleRect = WallpaperCropUtils.calculateVisibleRect(imagePreviewFragment.mRawWallpaperSize, point);
                        if (z) {
                            if (WallpaperCropUtils.isRtl(imagePreviewFragment.requireContext())) {
                                calculateVisibleRect.offsetTo(imagePreviewFragment.mRawWallpaperSize.x - calculateVisibleRect.width(), calculateVisibleRect.top);
                            } else {
                                calculateVisibleRect.offsetTo(0, calculateVisibleRect.top);
                            }
                        }
                        PointF pointF = new PointF(calculateVisibleRect.centerX(), calculateVisibleRect.centerY());
                        float calculateMinZoom = WallpaperCropUtils.calculateMinZoom(new Point(calculateVisibleRect.width(), calculateVisibleRect.height()), point);
                        imagePreviewFragment.mFullResImageView.maxScale = Math.max(8.0f, calculateMinZoom);
                        SubsamplingScaleImageView subsamplingScaleImageView2 = imagePreviewFragment.mFullResImageView;
                        subsamplingScaleImageView2.minScale = calculateMinZoom;
                        subsamplingScaleImageView2.anim = null;
                        subsamplingScaleImageView2.pendingScale = Float.valueOf(calculateMinZoom);
                        subsamplingScaleImageView2.sPendingCenter = pointF;
                        subsamplingScaleImageView2.sRequestedCenter = pointF;
                        subsamplingScaleImageView2.invalidate();
                        SubsamplingScaleImageView subsamplingScaleImageView3 = imagePreviewFragment.mFullResImageView;
                        subsamplingScaleImageView3.onStateChangedListener = new ImagePreviewFragment.AnonymousClass3();
                        subsamplingScaleImageView3.post(new DiskBasedLogger$$ExternalSyntheticLambda1(imagePreviewFragment));
                        return;
                    }
                    return;
                }
                return;
        }
    }
}
