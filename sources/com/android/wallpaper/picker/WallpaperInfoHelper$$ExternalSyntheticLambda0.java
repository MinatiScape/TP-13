package com.android.wallpaper.picker;

import com.android.wallpaper.model.CurrentWallpaperInfoVN;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.model.WallpaperMetadata;
import com.android.wallpaper.module.CurrentWallpaperInfoFactory;
import com.android.wallpaper.module.DefaultCurrentWallpaperInfoFactory;
import com.android.wallpaper.module.ExploreIntentChecker;
import com.android.wallpaper.module.WallpaperRefresher;
import com.google.android.apps.wallpaper.model.GoogleLiveWallpaperInfo;
import com.google.android.apps.wallpaper.model.MicropaperWallpaperInfo;
import wireless.android.learning.acmi.micropaper.frontend.MicropaperFrontend;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class WallpaperInfoHelper$$ExternalSyntheticLambda0 implements WallpaperRefresher.RefreshListener, ExploreIntentChecker.IntentReceiver {
    public final /* synthetic */ Object f$0;
    public final /* synthetic */ Object f$1;

    public /* synthetic */ WallpaperInfoHelper$$ExternalSyntheticLambda0(Object obj, Object obj2) {
        this.f$0 = obj;
        this.f$1 = obj2;
    }

    @Override // com.android.wallpaper.module.WallpaperRefresher.RefreshListener
    public final void onRefreshed(WallpaperMetadata wallpaperMetadata, WallpaperMetadata wallpaperMetadata2, int i) {
        WallpaperInfo wallpaperInfo;
        WallpaperInfo wallpaperInfo2;
        DefaultCurrentWallpaperInfoFactory defaultCurrentWallpaperInfoFactory = (DefaultCurrentWallpaperInfoFactory) this.f$0;
        CurrentWallpaperInfoFactory.WallpaperInfoCallback wallpaperInfoCallback = (CurrentWallpaperInfoFactory.WallpaperInfoCallback) this.f$1;
        defaultCurrentWallpaperInfoFactory.getClass();
        android.app.WallpaperInfo wallpaperInfo3 = wallpaperMetadata.mWallpaperComponent;
        if (wallpaperInfo3 == null) {
            wallpaperInfo = new CurrentWallpaperInfoVN(wallpaperMetadata.mAttributions, wallpaperMetadata.mActionUrl, wallpaperMetadata.mActionLabelRes, wallpaperMetadata.mActionIconRes, wallpaperMetadata.mCollectionId, 1);
        } else {
            defaultCurrentWallpaperInfoFactory.mLiveWallpaperInfoFactory.getClass();
            if (wallpaperInfo3.getComponent().equals(MicropaperFrontend.MICROPAPER_SERVICE)) {
                wallpaperInfo2 = new MicropaperWallpaperInfo(wallpaperInfo3);
            } else {
                wallpaperInfo2 = new GoogleLiveWallpaperInfo(wallpaperInfo3);
            }
            wallpaperInfo = wallpaperInfo2;
        }
        CurrentWallpaperInfoVN currentWallpaperInfoVN = null;
        if (wallpaperMetadata2 != null) {
            currentWallpaperInfoVN = new CurrentWallpaperInfoVN(wallpaperMetadata2.mAttributions, wallpaperMetadata2.mActionUrl, wallpaperMetadata2.mActionLabelRes, wallpaperMetadata2.mActionIconRes, wallpaperMetadata2.mCollectionId, 2);
        }
        defaultCurrentWallpaperInfoFactory.mHomeWallpaper = wallpaperInfo;
        defaultCurrentWallpaperInfoFactory.mLockWallpaper = currentWallpaperInfoVN;
        defaultCurrentWallpaperInfoFactory.mPresentationMode = i;
        wallpaperInfoCallback.onWallpaperInfoCreated(wallpaperInfo, currentWallpaperInfoVN);
    }
}
