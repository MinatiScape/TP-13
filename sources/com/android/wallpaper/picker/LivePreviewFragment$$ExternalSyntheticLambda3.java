package com.android.wallpaper.picker;

import android.app.WallpaperColors;
import com.android.wallpaper.util.FullScreenAnimation;
import com.android.wallpaper.widget.BottomActionBar;
import com.android.wallpaper.widget.WallpaperColorsLoader;
/* loaded from: classes.dex */
public final /* synthetic */ class LivePreviewFragment$$ExternalSyntheticLambda3 implements FullScreenAnimation.FullScreenStatusListener, WallpaperColorsLoader.Callback {
    public final /* synthetic */ LivePreviewFragment f$0;

    public /* synthetic */ LivePreviewFragment$$ExternalSyntheticLambda3(LivePreviewFragment livePreviewFragment, int i) {
        this.f$0 = livePreviewFragment;
    }

    @Override // com.android.wallpaper.util.FullScreenAnimation.FullScreenStatusListener
    public void onFullScreenStatusChange(boolean z) {
        LivePreviewFragment livePreviewFragment = this.f$0;
        livePreviewFragment.mLockScreenPreviewer.setDateViewVisibility(!z);
        if (!z) {
            BottomActionBar bottomActionBar = ((PreviewFragment) livePreviewFragment).mBottomActionBar;
            bottomActionBar.mActionMap.get(BottomActionBar.BottomAction.EDIT).sendAccessibilityEvent(8);
        }
    }

    @Override // com.android.wallpaper.widget.WallpaperColorsLoader.Callback
    public void onLoaded(WallpaperColors wallpaperColors) {
        LivePreviewFragment livePreviewFragment = this.f$0;
        int i = LivePreviewFragment.$r8$clinit;
        livePreviewFragment.onWallpaperColorsChanged(wallpaperColors, 0);
    }
}
