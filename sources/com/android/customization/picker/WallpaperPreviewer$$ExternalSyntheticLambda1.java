package com.android.customization.picker;

import android.app.Activity;
import android.app.WallpaperColors;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.ColorSpace;
import android.graphics.Rect;
import android.os.Handler;
import android.widget.ImageView;
import androidx.transition.R$id;
import com.android.customization.picker.WallpaperPreviewer;
import com.android.systemui.shared.plugins.PluginActionManager;
import com.android.systemui.shared.plugins.PluginInstance;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.model.LiveWallpaperInfo;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.picker.ImagePreviewFragment;
import com.android.wallpaper.picker.ImagePreviewFragment$4$$ExternalSyntheticLambda0;
import com.android.wallpaper.util.DiskBasedLogger$$ExternalSyntheticLambda1;
import com.android.wallpaper.util.WallpaperConnection;
import com.android.wallpaper.widget.WallpaperColorsLoader;
import java.io.ByteArrayOutputStream;
import java.util.Objects;
/* loaded from: classes.dex */
public final /* synthetic */ class WallpaperPreviewer$$ExternalSyntheticLambda1 implements Runnable {
    public final /* synthetic */ int $r8$classId = 0;
    public final /* synthetic */ Object f$0;
    public final /* synthetic */ Object f$1;

    public /* synthetic */ WallpaperPreviewer$$ExternalSyntheticLambda1(WallpaperPreviewer wallpaperPreviewer, ImageView imageView) {
        this.f$0 = wallpaperPreviewer;
        this.f$1 = imageView;
    }

    public /* synthetic */ WallpaperPreviewer$$ExternalSyntheticLambda1(PluginActionManager pluginActionManager, PluginInstance pluginInstance) {
        this.f$0 = pluginActionManager;
        this.f$1 = pluginInstance;
    }

    public /* synthetic */ WallpaperPreviewer$$ExternalSyntheticLambda1(PluginActionManager pluginActionManager, String str) {
        this.f$0 = pluginActionManager;
        this.f$1 = str;
    }

    public /* synthetic */ WallpaperPreviewer$$ExternalSyntheticLambda1(ImagePreviewFragment.AnonymousClass4 r2, Bitmap bitmap) {
        this.f$0 = r2;
        this.f$1 = bitmap;
    }

    @Override // java.lang.Runnable
    public final void run() {
        boolean z = false;
        switch (this.$r8$classId) {
            case 0:
                final WallpaperPreviewer wallpaperPreviewer = (WallpaperPreviewer) this.f$0;
                ImageView imageView = (ImageView) this.f$1;
                Activity activity = wallpaperPreviewer.mActivity;
                if (activity != null && !activity.isDestroyed()) {
                    WallpaperInfo wallpaperInfo = wallpaperPreviewer.mWallpaper;
                    boolean z2 = !(wallpaperInfo instanceof LiveWallpaperInfo);
                    Asset thumbAsset = wallpaperInfo.getThumbAsset(wallpaperPreviewer.mActivity.getApplicationContext());
                    Activity activity2 = wallpaperPreviewer.mActivity;
                    thumbAsset.loadPreviewImage(activity2, z2 ? imageView : wallpaperPreviewer.mHomePreview, R$id.getColorAttr(activity2, 16844080));
                    WallpaperInfo wallpaperInfo2 = wallpaperPreviewer.mWallpaper;
                    if (wallpaperInfo2 instanceof LiveWallpaperInfo) {
                        Asset thumbAsset2 = wallpaperInfo2.getThumbAsset(wallpaperPreviewer.mActivity.getApplicationContext());
                        Activity activity3 = wallpaperPreviewer.mActivity;
                        thumbAsset2.loadPreviewImage(activity3, imageView, R$id.getColorAttr(activity3, 16844080));
                        WallpaperInfo wallpaperInfo3 = wallpaperPreviewer.mWallpaper;
                        Activity activity4 = wallpaperPreviewer.mActivity;
                        if (activity4 != null && !activity4.isFinishing()) {
                            WallpaperConnection wallpaperConnection = wallpaperPreviewer.mWallpaperConnection;
                            if (wallpaperConnection != null) {
                                wallpaperConnection.disconnect();
                            }
                            if (WallpaperConnection.isPreviewAvailable()) {
                                wallpaperPreviewer.mHomePreview.getLocationOnScreen(wallpaperPreviewer.mLivePreviewLocation);
                                wallpaperPreviewer.mPreviewGlobalRect.set(0, 0, wallpaperPreviewer.mHomePreview.getMeasuredWidth(), wallpaperPreviewer.mHomePreview.getMeasuredHeight());
                                wallpaperPreviewer.mPreviewLocalRect.set(wallpaperPreviewer.mPreviewGlobalRect);
                                Rect rect = wallpaperPreviewer.mPreviewGlobalRect;
                                int[] iArr = wallpaperPreviewer.mLivePreviewLocation;
                                rect.offset(iArr[0], iArr[1]);
                                android.app.WallpaperInfo wallpaperComponent = wallpaperInfo3.getWallpaperComponent();
                                WallpaperConnection wallpaperConnection2 = new WallpaperConnection(new Intent("android.service.wallpaper.WallpaperService").setClassName(wallpaperComponent.getPackageName(), wallpaperComponent.getServiceName()), wallpaperPreviewer.mActivity, new WallpaperConnection.WallpaperConnectionListener() { // from class: com.android.customization.picker.WallpaperPreviewer.2
                                    @Override // com.android.wallpaper.util.WallpaperConnection.WallpaperConnectionListener
                                    public void onWallpaperColorsChanged(WallpaperColors wallpaperColors, int i) {
                                        WallpaperColorsListener wallpaperColorsListener = wallpaperPreviewer.mWallpaperColorsListener;
                                        if (wallpaperColorsListener != null) {
                                            wallpaperColorsListener.onWallpaperColorsChanged(wallpaperColors);
                                        }
                                    }
                                }, wallpaperPreviewer.mWallpaperSurface);
                                wallpaperPreviewer.mWallpaperConnection = wallpaperConnection2;
                                wallpaperConnection2.mIsVisible = true;
                                wallpaperConnection2.setEngineVisibility(true);
                                wallpaperPreviewer.mHomePreview.post(new DiskBasedLogger$$ExternalSyntheticLambda1(wallpaperPreviewer));
                                return;
                            } else if (wallpaperPreviewer.mWallpaperColorsListener != null) {
                                Activity activity5 = wallpaperPreviewer.mActivity;
                                Asset thumbAsset3 = wallpaperPreviewer.mWallpaper.getThumbAsset(activity5);
                                final WallpaperPreviewer.WallpaperColorsListener wallpaperColorsListener = wallpaperPreviewer.mWallpaperColorsListener;
                                Objects.requireNonNull(wallpaperColorsListener);
                                WallpaperColorsLoader.getWallpaperColors(activity5, thumbAsset3, new WallpaperColorsLoader.Callback() { // from class: com.android.customization.picker.WallpaperPreviewer$$ExternalSyntheticLambda0
                                    @Override // com.android.wallpaper.widget.WallpaperColorsLoader.Callback
                                    public final void onLoaded(WallpaperColors wallpaperColors) {
                                        switch (r2) {
                                            case 0:
                                            default:
                                                wallpaperColorsListener.onWallpaperColorsChanged(wallpaperColors);
                                                return;
                                        }
                                    }
                                });
                                return;
                            } else {
                                return;
                            }
                        } else {
                            return;
                        }
                    } else {
                        WallpaperConnection wallpaperConnection3 = wallpaperPreviewer.mWallpaperConnection;
                        if (wallpaperConnection3 != null) {
                            wallpaperConnection3.disconnect();
                            wallpaperPreviewer.mWallpaperConnection = null;
                        }
                        if (wallpaperPreviewer.mWallpaperColorsListener != null) {
                            Activity activity6 = wallpaperPreviewer.mActivity;
                            Asset thumbAsset4 = wallpaperPreviewer.mWallpaper.getThumbAsset(activity6);
                            final WallpaperPreviewer.WallpaperColorsListener wallpaperColorsListener2 = wallpaperPreviewer.mWallpaperColorsListener;
                            Objects.requireNonNull(wallpaperColorsListener2);
                            WallpaperColorsLoader.getWallpaperColors(activity6, thumbAsset4, new WallpaperColorsLoader.Callback() { // from class: com.android.customization.picker.WallpaperPreviewer$$ExternalSyntheticLambda0
                                @Override // com.android.wallpaper.widget.WallpaperColorsLoader.Callback
                                public final void onLoaded(WallpaperColors wallpaperColors) {
                                    switch (r2) {
                                        case 0:
                                        default:
                                            wallpaperColorsListener2.onWallpaperColorsChanged(wallpaperColors);
                                            return;
                                    }
                                }
                            });
                            return;
                        }
                        return;
                    }
                } else {
                    return;
                }
            case 1:
                ((PluginActionManager) this.f$0).lambda$queryAll$3((PluginInstance) this.f$1);
                return;
            case 2:
                ((PluginActionManager) this.f$0).lambda$onPackageRemoved$1((String) this.f$1);
                return;
            default:
                ImagePreviewFragment.AnonymousClass4 r0 = (ImagePreviewFragment.AnonymousClass4) this.f$0;
                Bitmap bitmap = (Bitmap) this.f$1;
                Objects.requireNonNull(r0);
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                if (bitmap.compress(Bitmap.CompressFormat.PNG, 100, byteArrayOutputStream)) {
                    byte[] byteArray = byteArrayOutputStream.toByteArray();
                    new BitmapFactory.Options().inPreferredColorSpace = ColorSpace.get(ColorSpace.Named.SRGB);
                    bitmap = BitmapFactory.decodeByteArray(byteArray, 0, byteArray.length);
                }
                if (bitmap.getConfig() == Bitmap.Config.HARDWARE) {
                    bitmap = bitmap.copy(Bitmap.Config.ARGB_8888, false);
                    z = true;
                }
                WallpaperColors fromBitmap = WallpaperColors.fromBitmap(bitmap);
                if (z) {
                    bitmap.recycle();
                }
                if (ImagePreviewFragment.this.mRecalculateColorCounter.decrementAndGet() == 0) {
                    Handler.getMain().post(new ImagePreviewFragment$4$$ExternalSyntheticLambda0(r0, fromBitmap));
                    return;
                }
                return;
        }
    }
}
