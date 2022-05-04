package com.android.wallpaper.picker;

import android.app.WallpaperColors;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import android.view.SurfaceView;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import com.android.customization.model.color.ColorCustomizationManager;
import com.android.customization.model.color.ColorUtils;
import com.android.customization.model.theme.OverlayManagerCompat;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
/* loaded from: classes.dex */
public interface WallpaperColorThemePreview {
    default boolean shouldApplyWallpaperColors() {
        FragmentActivity activity = ((Fragment) this).getActivity();
        if (activity == null || activity.isFinishing()) {
            Log.w("WallpaperColorThemePreview", "shouldApplyWallpaperColors: activity is null or finishing");
            return false;
        } else if (!ColorUtils.isMonetEnabled(activity)) {
            Log.w("WallpaperColorThemePreview", "Monet is not enabled");
            return false;
        } else {
            ColorCustomizationManager colorCustomizationManager = ColorCustomizationManager.getInstance(activity, new OverlayManagerCompat(activity));
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Current color source: ");
            m.append(colorCustomizationManager.getCurrentColorSource());
            Log.i("WallpaperColorThemePreview", m.toString());
            return !"preset".equals(colorCustomizationManager.getCurrentColorSource());
        }
    }

    default void updateWorkspacePreview(SurfaceView surfaceView, WorkspaceSurfaceHolderCallback workspaceSurfaceHolderCallback, WallpaperColors wallpaperColors) {
        if (shouldApplyWallpaperColors()) {
            int visibility = surfaceView.getVisibility();
            surfaceView.setVisibility(8);
            if (workspaceSurfaceHolderCallback != null) {
                workspaceSurfaceHolderCallback.cleanUp();
                if (workspaceSurfaceHolderCallback.mShouldUseWallpaperColors) {
                    workspaceSurfaceHolderCallback.mWallpaperColors = wallpaperColors;
                    workspaceSurfaceHolderCallback.mIsWallpaperColorsReady = true;
                    workspaceSurfaceHolderCallback.maybeRenderPreview();
                }
                surfaceView.setUseAlpha();
                surfaceView.setAlpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                workspaceSurfaceHolderCallback.mListener = new WallpaperColorThemePreview$$ExternalSyntheticLambda0(surfaceView);
            }
            surfaceView.setVisibility(visibility);
        }
    }
}
