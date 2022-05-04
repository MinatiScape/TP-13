package com.android.wallpaper.picker;

import android.app.WallpaperColors;
import android.os.Bundle;
import android.os.Handler;
import android.view.animation.PathInterpolator;
import androidx.lifecycle.Observer;
import com.android.customization.picker.WallpaperPreviewer;
import com.android.systemui.shared.R;
import com.android.wallpaper.model.SetWallpaperViewModel;
import com.android.wallpaper.util.PreviewUtils;
import com.android.wallpaper.widget.WallpaperColorsLoader;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class PreviewFragment$$ExternalSyntheticLambda6 implements WallpaperColorsLoader.Callback, Observer, PreviewUtils.WorkspacePreviewCallback {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ Object f$0;

    public /* synthetic */ PreviewFragment$$ExternalSyntheticLambda6(Object obj, int i) {
        this.$r8$classId = i;
        this.f$0 = obj;
    }

    @Override // androidx.lifecycle.Observer
    public final void onChanged(Object obj) {
        PreviewFragment previewFragment = (PreviewFragment) this.f$0;
        PathInterpolator pathInterpolator = PreviewFragment.ALPHA_OUT;
        previewFragment.getClass();
        int ordinal = ((SetWallpaperViewModel.SetWallpaperStatus) obj).ordinal();
        if (ordinal == 2) {
            Handler.getMain().postDelayed(new PreviewFragment$$ExternalSyntheticLambda8(previewFragment, 0), 300L);
        } else if (ordinal == 3) {
            int i = previewFragment.mSetWallpaperViewModel.mDestination;
            SetWallpaperErrorDialogFragment setWallpaperErrorDialogFragment = new SetWallpaperErrorDialogFragment();
            Bundle bundle = new Bundle();
            bundle.putInt("message", R.string.set_wallpaper_error_message);
            bundle.putInt("destination", i);
            setWallpaperErrorDialogFragment.setArguments(bundle);
            setWallpaperErrorDialogFragment.setTargetFragment(previewFragment);
            if (((BasePreviewActivity) previewFragment.requireActivity()).mIsSafeToCommitFragmentTransaction) {
                setWallpaperErrorDialogFragment.show(previewFragment.getParentFragmentManager(), "set_wallpaper_error_dialog");
            } else {
                previewFragment.mStagedSetWallpaperErrorDialogFragment = setWallpaperErrorDialogFragment;
            }
        }
    }

    @Override // com.android.wallpaper.widget.WallpaperColorsLoader.Callback
    public final void onLoaded(WallpaperColors wallpaperColors) {
        switch (this.$r8$classId) {
            case 1:
                ((WallpaperPreviewer.WallpaperColorsListener) this.f$0).onWallpaperColorsChanged();
                return;
            default:
                int i = ImageEffectPreviewFragment.$r8$clinit;
                ((ImageEffectPreviewFragment) this.f$0).onWallpaperColorsChanged(wallpaperColors);
                return;
        }
    }
}
