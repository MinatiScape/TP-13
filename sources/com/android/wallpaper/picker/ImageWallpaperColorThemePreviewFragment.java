package com.android.wallpaper.picker;

import android.app.WallpaperColors;
import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.SurfaceView;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.RemoteViews;
import com.android.customization.model.color.WallpaperColorResources;
import com.android.systemui.shared.R;
import com.android.wallpaper.widget.LockScreenPreviewer;
import com.google.android.material.resources.MaterialAttributes;
import com.google.android.material.tabs.TabLayout;
/* loaded from: classes.dex */
public class ImageWallpaperColorThemePreviewFragment extends ImagePreviewFragment implements WallpaperColorThemePreview {
    public static final /* synthetic */ int $r8$clinit = 0;
    public boolean mIgnoreInitialColorChange;
    public WallpaperColors mWallpaperColors;

    @Override // com.android.wallpaper.picker.PreviewFragment
    public final WorkspaceSurfaceHolderCallback createWorkspaceSurfaceCallback(SurfaceView surfaceView) {
        return new WorkspaceSurfaceHolderCallback(surfaceView, getContext(), shouldApplyWallpaperColors());
    }

    @Override // com.android.wallpaper.picker.ImagePreviewFragment
    public final void onWallpaperColorsChanged(WallpaperColors wallpaperColors) {
        if (this.mIgnoreInitialColorChange || wallpaperColors == null) {
            updateWorkspacePreview(this.mWorkspaceSurface, this.mWorkspaceSurfaceCallback, null);
        } else if (!wallpaperColors.equals(this.mWallpaperColors) && shouldApplyWallpaperColors()) {
            this.mWallpaperColors = wallpaperColors;
            Context context = getContext();
            RemoteViews.ColorResources.create(context, new WallpaperColorResources(wallpaperColors).mColorOverlay).apply(context);
            int resolveOrThrow = MaterialAttributes.resolveOrThrow(context, 16843827, "android.R.attr.colorPrimary is not set in the current theme");
            Window window = getActivity().getWindow();
            window.setStatusBarColor(resolveOrThrow);
            window.setNavigationBarColor(resolveOrThrow);
            this.mView.setBackgroundColor(MaterialAttributes.resolveOrThrow(context, 16843827, "android.R.attr.colorPrimary is not set in the current theme"));
            LayoutInflater from = LayoutInflater.from(context);
            ViewGroup viewGroup = (ViewGroup) this.mView.findViewById(R.id.section_header_container);
            viewGroup.removeAllViews();
            setUpToolbar(from.inflate(R.layout.section_header, viewGroup), true);
            this.mFullScreenAnimation.ensureToolbarIsCorrectlyLocated();
            this.mFullScreenAnimation.ensureToolbarIsCorrectlyColored();
            updatePreviewHeader(this.mView);
            ViewGroup viewGroup2 = (ViewGroup) this.mView.findViewById(R.id.fullscreen_buttons_container);
            viewGroup2.removeAllViews();
            setFullScreenActions(from.inflate(R.layout.fullscreen_buttons, viewGroup2));
            ((PreviewFragment) this).mBottomActionBar.setColor(from.getContext());
            updateWorkspacePreview(this.mWorkspaceSurface, this.mWorkspaceSurfaceCallback, wallpaperColors);
            int visibility = this.mLockPreviewContainer.getVisibility();
            ViewGroup viewGroup3 = (ViewGroup) this.mView.findViewById(R.id.separated_tabs_container);
            viewGroup3.removeAllViews();
            setUpTabs((TabLayout) from.inflate(R.layout.separated_tabs, viewGroup3).findViewById(R.id.separated_tabs));
            this.mLockPreviewContainer.setVisibility(visibility);
            this.mLockScreenPreviewer.release();
            this.mLockPreviewContainer.removeAllViews();
            LockScreenPreviewer lockScreenPreviewer = new LockScreenPreviewer(this.mLifecycleRegistry, context, this.mLockPreviewContainer);
            this.mLockScreenPreviewer = lockScreenPreviewer;
            lockScreenPreviewer.setDateViewVisibility(!this.mFullScreenAnimation.mIsFullScreen);
        }
        this.mIgnoreInitialColorChange = false;
        super.onWallpaperColorsChanged(wallpaperColors);
    }

    @Override // com.android.wallpaper.picker.ImagePreviewFragment, com.android.wallpaper.picker.PreviewFragment, androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Bundle bundle2 = this.mArguments;
        if (bundle2 != null && bundle2.getInt("preview_mode") == 0) {
            this.mIgnoreInitialColorChange = true;
        }
    }
}
