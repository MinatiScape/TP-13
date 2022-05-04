package com.android.wallpaper.picker;

import android.content.Intent;
import com.android.wallpaper.model.CurrentWallpaperInfoVN;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.model.WallpaperMetadata;
import com.android.wallpaper.module.CurrentWallpaperInfoFactory;
import com.android.wallpaper.module.DefaultCurrentWallpaperInfoFactory;
import com.android.wallpaper.module.ExploreIntentChecker;
import com.android.wallpaper.module.WallpaperRefresher;
import com.android.wallpaper.picker.PreviewFragment;
import java.util.Objects;
/* loaded from: classes.dex */
public final /* synthetic */ class WallpaperInfoHelper$$ExternalSyntheticLambda0 implements ExploreIntentChecker.IntentReceiver, WallpaperRefresher.RefreshListener {
    public final /* synthetic */ Object f$0;
    public final /* synthetic */ Object f$1;

    public /* synthetic */ WallpaperInfoHelper$$ExternalSyntheticLambda0(DefaultCurrentWallpaperInfoFactory defaultCurrentWallpaperInfoFactory, CurrentWallpaperInfoFactory.WallpaperInfoCallback wallpaperInfoCallback) {
        this.f$0 = defaultCurrentWallpaperInfoFactory;
        this.f$1 = wallpaperInfoCallback;
    }

    public /* synthetic */ WallpaperInfoHelper$$ExternalSyntheticLambda0(WallpaperInfoHelper$ExploreIntentReceiver wallpaperInfoHelper$ExploreIntentReceiver, CharSequence charSequence) {
        this.f$0 = wallpaperInfoHelper$ExploreIntentReceiver;
        this.f$1 = charSequence;
    }

    @Override // com.android.wallpaper.module.ExploreIntentChecker.IntentReceiver
    public void onIntentReceived(Intent intent) {
        PreviewFragment$WallpaperInfoContent$$ExternalSyntheticLambda0 previewFragment$WallpaperInfoContent$$ExternalSyntheticLambda0 = (PreviewFragment$WallpaperInfoContent$$ExternalSyntheticLambda0) ((WallpaperInfoHelper$ExploreIntentReceiver) this.f$0);
        PreviewFragment.WallpaperInfoContent wallpaperInfoContent = (PreviewFragment.WallpaperInfoContent) previewFragment$WallpaperInfoContent$$ExternalSyntheticLambda0.f$0;
        Runnable runnable = (Runnable) previewFragment$WallpaperInfoContent$$ExternalSyntheticLambda0.f$1;
        wallpaperInfoContent.mActionLabel = (CharSequence) this.f$1;
        wallpaperInfoContent.mExploreIntent = intent;
        if (runnable != null) {
            runnable.run();
        }
    }

    @Override // com.android.wallpaper.module.WallpaperRefresher.RefreshListener
    public void onRefreshed(WallpaperMetadata wallpaperMetadata, WallpaperMetadata wallpaperMetadata2, int i) {
        WallpaperInfo wallpaperInfo;
        DefaultCurrentWallpaperInfoFactory defaultCurrentWallpaperInfoFactory = (DefaultCurrentWallpaperInfoFactory) this.f$0;
        CurrentWallpaperInfoFactory.WallpaperInfoCallback wallpaperInfoCallback = (CurrentWallpaperInfoFactory.WallpaperInfoCallback) this.f$1;
        Objects.requireNonNull(defaultCurrentWallpaperInfoFactory);
        android.app.WallpaperInfo wallpaperInfo2 = wallpaperMetadata.mWallpaperComponent;
        if (wallpaperInfo2 == null) {
            wallpaperInfo = new CurrentWallpaperInfoVN(wallpaperMetadata.mAttributions, wallpaperMetadata.mActionUrl, wallpaperMetadata.mActionLabelRes, wallpaperMetadata.mActionIconRes, wallpaperMetadata.mCollectionId, 1);
        } else {
            wallpaperInfo = defaultCurrentWallpaperInfoFactory.mLiveWallpaperInfoFactory.getLiveWallpaperInfo(wallpaperInfo2);
        }
        CurrentWallpaperInfoVN currentWallpaperInfoVN = null;
        if (wallpaperMetadata2 != null) {
            currentWallpaperInfoVN = new CurrentWallpaperInfoVN(wallpaperMetadata2.mAttributions, wallpaperMetadata2.mActionUrl, wallpaperMetadata2.mActionLabelRes, wallpaperMetadata2.mActionIconRes, wallpaperMetadata2.mCollectionId, 2);
        }
        defaultCurrentWallpaperInfoFactory.mHomeWallpaper = wallpaperInfo;
        defaultCurrentWallpaperInfoFactory.mLockWallpaper = currentWallpaperInfoVN;
        defaultCurrentWallpaperInfoFactory.mPresentationMode = i;
        wallpaperInfoCallback.onWallpaperInfoCreated(wallpaperInfo, currentWallpaperInfoVN, i);
    }
}
