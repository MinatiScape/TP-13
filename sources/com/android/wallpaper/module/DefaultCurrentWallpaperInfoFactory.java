package com.android.wallpaper.module;

import android.content.Context;
import androidx.cardview.R$style;
import com.android.wallpaper.model.CurrentWallpaperInfoVN;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.module.CurrentWallpaperInfoFactory;
import com.android.wallpaper.module.DefaultWallpaperRefresher;
import com.android.wallpaper.picker.WallpaperInfoHelper$$ExternalSyntheticLambda0;
import kotlin.jvm.internal.Intrinsics;
/* loaded from: classes.dex */
public final class DefaultCurrentWallpaperInfoFactory implements CurrentWallpaperInfoFactory {
    public WallpaperInfo mHomeWallpaper;
    public final Intrinsics mLiveWallpaperInfoFactory;
    public CurrentWallpaperInfoVN mLockWallpaper;
    public int mPresentationMode;
    public final WallpaperRefresher mWallpaperRefresher;

    public final synchronized void createCurrentWallpaperInfos(CurrentWallpaperInfoFactory.WallpaperInfoCallback wallpaperInfoCallback, boolean z) {
        if (!z) {
            try {
                WallpaperInfo wallpaperInfo = this.mHomeWallpaper;
                if (!(wallpaperInfo == null || this.mPresentationMode == 2)) {
                    wallpaperInfoCallback.onWallpaperInfoCreated(wallpaperInfo, this.mLockWallpaper);
                    return;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        if (z) {
            this.mHomeWallpaper = null;
            this.mLockWallpaper = null;
        }
        WallpaperRefresher wallpaperRefresher = this.mWallpaperRefresher;
        WallpaperInfoHelper$$ExternalSyntheticLambda0 wallpaperInfoHelper$$ExternalSyntheticLambda0 = new WallpaperInfoHelper$$ExternalSyntheticLambda0(this, wallpaperInfoCallback);
        DefaultWallpaperRefresher defaultWallpaperRefresher = (DefaultWallpaperRefresher) wallpaperRefresher;
        defaultWallpaperRefresher.getClass();
        new DefaultWallpaperRefresher.GetWallpaperMetadataAsyncTask(wallpaperInfoHelper$$ExternalSyntheticLambda0).execute(new Void[0]);
    }

    public DefaultCurrentWallpaperInfoFactory(Context context) {
        Context applicationContext = context.getApplicationContext();
        Injector injector = R$style.getInjector();
        this.mWallpaperRefresher = injector.getWallpaperRefresher(applicationContext);
        this.mLiveWallpaperInfoFactory = injector.getLiveWallpaperInfoFactory();
    }
}
