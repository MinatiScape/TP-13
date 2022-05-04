package com.android.wallpaper.model;

import android.app.WallpaperColors;
import android.view.SurfaceView;
import android.view.ViewGroup;
import androidx.lifecycle.Observer;
import com.android.wallpaper.picker.WorkspaceSurfaceHolderCallback;
import com.android.wallpaper.util.WallpaperSurfaceCallback;
/* loaded from: classes.dex */
public final /* synthetic */ class WallpaperSectionController$$ExternalSyntheticLambda1 implements WallpaperSurfaceCallback.SurfaceListener, Observer {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ WallpaperSectionController f$0;

    public /* synthetic */ WallpaperSectionController$$ExternalSyntheticLambda1(WallpaperSectionController wallpaperSectionController, int i) {
        this.$r8$classId = i;
        this.f$0 = wallpaperSectionController;
    }

    @Override // androidx.lifecycle.Observer
    public void onChanged(Object obj) {
        WallpaperSectionController wallpaperSectionController = this.f$0;
        Boolean bool = (Boolean) obj;
        SurfaceView surfaceView = wallpaperSectionController.mWorkspaceSurface;
        WorkspaceSurfaceHolderCallback workspaceSurfaceHolderCallback = wallpaperSectionController.mWorkspaceSurfaceCallback;
        WallpaperColors value = wallpaperSectionController.mWallpaperColorsViewModel.getHomeWallpaperColors().getValue();
        ViewGroup viewGroup = (ViewGroup) surfaceView.getParent();
        int indexOfChild = viewGroup.indexOfChild(surfaceView);
        viewGroup.removeView(surfaceView);
        if (workspaceSurfaceHolderCallback != null) {
            workspaceSurfaceHolderCallback.mLastSurface = null;
            if (workspaceSurfaceHolderCallback.mShouldUseWallpaperColors) {
                workspaceSurfaceHolderCallback.mWallpaperColors = value;
                workspaceSurfaceHolderCallback.mIsWallpaperColorsReady = true;
                workspaceSurfaceHolderCallback.maybeRenderPreview();
            }
        }
        viewGroup.addView(surfaceView, indexOfChild);
    }

    @Override // com.android.wallpaper.util.WallpaperSurfaceCallback.SurfaceListener
    public void onSurfaceCreated() {
        switch (this.$r8$classId) {
            case 0:
                WallpaperSectionController wallpaperSectionController = this.f$0;
                WallpaperInfo wallpaperInfo = wallpaperSectionController.mHomePreviewWallpaperInfo;
                if (wallpaperInfo != null) {
                    wallpaperSectionController.maybeLoadThumbnail(wallpaperInfo, wallpaperSectionController.mHomeWallpaperSurfaceCallback);
                    return;
                }
                return;
            default:
                WallpaperSectionController wallpaperSectionController2 = this.f$0;
                WallpaperInfo wallpaperInfo2 = wallpaperSectionController2.mLockPreviewWallpaperInfo;
                if (wallpaperInfo2 != null) {
                    wallpaperSectionController2.maybeLoadThumbnail(wallpaperInfo2, wallpaperSectionController2.mLockWallpaperSurfaceCallback);
                    return;
                }
                return;
        }
    }
}
