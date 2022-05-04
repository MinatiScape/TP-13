package com.android.wallpaper.asset;

import android.app.Activity;
import android.app.WallpaperColors;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Point;
import android.graphics.Rect;
import android.widget.ImageView;
import androidx.appcompat.R$bool;
import com.android.customization.picker.WallpaperPreviewer;
import com.android.customization.picker.WallpaperPreviewer$$ExternalSyntheticLambda0;
import com.android.systemui.shared.plugins.PluginActionManager;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.model.LiveWallpaperInfo;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.picker.PreviewFragment$$ExternalSyntheticLambda6;
import com.android.wallpaper.util.WallpaperConnection;
import com.android.wallpaper.widget.WallpaperColorsLoader;
import java.util.Objects;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class Asset$$ExternalSyntheticLambda1 implements Runnable {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ Object f$0;
    public final /* synthetic */ Object f$1;

    public /* synthetic */ Asset$$ExternalSyntheticLambda1(Object obj, Object obj2, int i) {
        this.$r8$classId = i;
        this.f$0 = obj;
        this.f$1 = obj2;
    }

    @Override // java.lang.Runnable
    public final void run() {
        ImageView imageView;
        switch (this.$r8$classId) {
            case 0:
                ((Asset.BitmapReceiver) this.f$0).onBitmapDecoded((Bitmap) this.f$1);
                return;
            case 1:
                final WallpaperPreviewer wallpaperPreviewer = (WallpaperPreviewer) this.f$0;
                ImageView imageView2 = (ImageView) this.f$1;
                Activity activity = wallpaperPreviewer.mActivity;
                if (activity != null && !activity.isDestroyed()) {
                    WallpaperInfo wallpaperInfo = wallpaperPreviewer.mWallpaper;
                    boolean z = !(wallpaperInfo instanceof LiveWallpaperInfo);
                    Asset thumbAsset = wallpaperInfo.getThumbAsset(wallpaperPreviewer.mActivity.getApplicationContext());
                    Activity activity2 = wallpaperPreviewer.mActivity;
                    if (z) {
                        imageView = imageView2;
                    } else {
                        imageView = wallpaperPreviewer.mHomePreview;
                    }
                    thumbAsset.loadPreviewImage(activity2, imageView, R$bool.getColorAttr(activity2, 16844080));
                    WallpaperInfo wallpaperInfo2 = wallpaperPreviewer.mWallpaper;
                    if (wallpaperInfo2 instanceof LiveWallpaperInfo) {
                        Asset thumbAsset2 = wallpaperInfo2.getThumbAsset(wallpaperPreviewer.mActivity.getApplicationContext());
                        Activity activity3 = wallpaperPreviewer.mActivity;
                        thumbAsset2.loadPreviewImage(activity3, imageView2, R$bool.getColorAttr(activity3, 16844080));
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
                                    public final void onWallpaperColorsChanged(WallpaperColors wallpaperColors, int i) {
                                        WallpaperColorsListener wallpaperColorsListener = WallpaperPreviewer.this.mWallpaperColorsListener;
                                        if (wallpaperColorsListener != null) {
                                            wallpaperColorsListener.onWallpaperColorsChanged();
                                        }
                                    }
                                }, wallpaperPreviewer.mWallpaperSurface);
                                wallpaperPreviewer.mWallpaperConnection = wallpaperConnection2;
                                wallpaperConnection2.setVisibility(true);
                                wallpaperPreviewer.mHomePreview.post(new Runnable() { // from class: com.android.customization.picker.WallpaperPreviewer$$ExternalSyntheticLambda1
                                    @Override // java.lang.Runnable
                                    public final void run() {
                                        WallpaperPreviewer wallpaperPreviewer2 = WallpaperPreviewer.this;
                                        WallpaperConnection wallpaperConnection3 = wallpaperPreviewer2.mWallpaperConnection;
                                        if (wallpaperConnection3 != null && !wallpaperConnection3.connect()) {
                                            wallpaperPreviewer2.mWallpaperConnection = null;
                                        }
                                    }
                                });
                                return;
                            } else if (wallpaperPreviewer.mWallpaperColorsListener != null) {
                                Activity activity5 = wallpaperPreviewer.mActivity;
                                Asset thumbAsset3 = wallpaperPreviewer.mWallpaper.getThumbAsset(activity5);
                                WallpaperPreviewer.WallpaperColorsListener wallpaperColorsListener = wallpaperPreviewer.mWallpaperColorsListener;
                                Objects.requireNonNull(wallpaperColorsListener);
                                WallpaperColorsLoader.getWallpaperColors(activity5, thumbAsset3, new WallpaperPreviewer$$ExternalSyntheticLambda0(wallpaperColorsListener));
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
                            WallpaperPreviewer.WallpaperColorsListener wallpaperColorsListener2 = wallpaperPreviewer.mWallpaperColorsListener;
                            Objects.requireNonNull(wallpaperColorsListener2);
                            WallpaperColorsLoader.getWallpaperColors(activity6, thumbAsset4, new PreviewFragment$$ExternalSyntheticLambda6(wallpaperColorsListener2, 1));
                            return;
                        }
                        return;
                    }
                } else {
                    return;
                }
            case 2:
                PluginActionManager.m19$r8$lambda$tRQyi7k9OR4crA50YERIw8utIE((PluginActionManager) this.f$0, (String) this.f$1);
                return;
            default:
                BitmapFactory.Options options = (BitmapFactory.Options) this.f$1;
                ((Asset.DimensionsReceiver) this.f$0).onDimensionsDecoded(new Point(options.outWidth, options.outHeight));
                return;
        }
    }
}
