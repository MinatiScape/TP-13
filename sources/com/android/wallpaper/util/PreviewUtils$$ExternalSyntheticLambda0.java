package com.android.wallpaper.util;

import android.os.Bundle;
import android.os.Message;
import android.view.SurfaceControl;
import android.view.SurfaceControlViewHost;
import android.view.SurfaceView;
import com.android.customization.model.themedicon.ThemedIconSectionController$$ExternalSyntheticLambda0;
import com.android.customization.model.themedicon.ThemedIconSwitchProvider;
import com.android.systemui.shared.navigationbar.RegionSamplingHelper;
import com.android.wallpaper.picker.CustomizationPickerFragment;
import com.android.wallpaper.picker.PreviewFragment;
import com.android.wallpaper.picker.WallpaperColorThemePreview;
import com.android.wallpaper.picker.WorkspaceSurfaceHolderCallback;
import com.android.wallpaper.util.PreviewUtils;
import com.android.wallpaper.widget.PreviewPager$$ExternalSyntheticLambda1;
import com.android.wallpaper.widget.WallpaperInfoView;
/* loaded from: classes.dex */
public final /* synthetic */ class PreviewUtils$$ExternalSyntheticLambda0 implements Runnable {
    public final /* synthetic */ int $r8$classId = 1;
    public final /* synthetic */ Object f$0;
    public final /* synthetic */ Object f$1;

    public /* synthetic */ PreviewUtils$$ExternalSyntheticLambda0(ThemedIconSwitchProvider themedIconSwitchProvider, ThemedIconSwitchProvider.FetchThemedIconEnabledCallback fetchThemedIconEnabledCallback) {
        this.f$0 = themedIconSwitchProvider;
        this.f$1 = fetchThemedIconEnabledCallback;
    }

    public /* synthetic */ PreviewUtils$$ExternalSyntheticLambda0(RegionSamplingHelper regionSamplingHelper, SurfaceControl surfaceControl) {
        this.f$0 = regionSamplingHelper;
        this.f$1 = surfaceControl;
    }

    public /* synthetic */ PreviewUtils$$ExternalSyntheticLambda0(CustomizationPickerFragment customizationPickerFragment, Bundle bundle) {
        this.f$0 = customizationPickerFragment;
        this.f$1 = bundle;
    }

    public /* synthetic */ PreviewUtils$$ExternalSyntheticLambda0(PreviewFragment.WallpaperInfoContent wallpaperInfoContent, WallpaperInfoView wallpaperInfoView) {
        this.f$0 = wallpaperInfoContent;
        this.f$1 = wallpaperInfoView;
    }

    public /* synthetic */ PreviewUtils$$ExternalSyntheticLambda0(PreviewUtils.WorkspacePreviewCallback workspacePreviewCallback, Bundle bundle) {
        this.f$0 = workspacePreviewCallback;
        this.f$1 = bundle;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.$r8$classId) {
            case 0:
                Bundle bundle = (Bundle) this.f$1;
                WorkspaceSurfaceHolderCallback workspaceSurfaceHolderCallback = (WorkspaceSurfaceHolderCallback) ((PreviewPager$$ExternalSyntheticLambda1) ((PreviewUtils.WorkspacePreviewCallback) this.f$0)).f$0;
                workspaceSurfaceHolderCallback.mRequestPending.set(false);
                if (bundle != null && workspaceSurfaceHolderCallback.mLastSurface != null) {
                    workspaceSurfaceHolderCallback.mWorkspaceSurface.setChildSurfacePackage((SurfaceControlViewHost.SurfacePackage) bundle.getParcelable("surface_package"));
                    workspaceSurfaceHolderCallback.mCallback = (Message) bundle.getParcelable("callback");
                    if (workspaceSurfaceHolderCallback.mNeedsToCleanUp) {
                        workspaceSurfaceHolderCallback.cleanUp();
                        return;
                    }
                    WorkspaceSurfaceHolderCallback.WorkspaceRenderListener workspaceRenderListener = workspaceSurfaceHolderCallback.mListener;
                    if (workspaceRenderListener != null) {
                        WallpaperColorThemePreview.lambda$updateWorkspacePreview$0((SurfaceView) ((PreviewPager$$ExternalSyntheticLambda1) workspaceRenderListener).f$0);
                        return;
                    }
                    return;
                }
                return;
            case 1:
                ((ThemedIconSectionController$$ExternalSyntheticLambda0) ((ThemedIconSwitchProvider.FetchThemedIconEnabledCallback) this.f$1)).f$0.mThemedIconSectionView.mSwitchView.setChecked(((ThemedIconSwitchProvider) this.f$0).mCustomizationPreferences.getThemedIconEnabled());
                return;
            case 2:
                ((RegionSamplingHelper) this.f$0).lambda$updateSamplingListener$0((SurfaceControl) this.f$1);
                return;
            case 3:
                ((CustomizationPickerFragment) this.f$0).mNestedScrollView.setScrollY(((Bundle) this.f$1).getInt("SCROLL_POSITION_Y"));
                return;
            default:
                ((PreviewFragment.WallpaperInfoContent) this.f$0).populateWallpaperInfo((WallpaperInfoView) this.f$1);
                return;
        }
    }
}
