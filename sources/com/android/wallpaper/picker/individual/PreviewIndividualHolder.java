package com.android.wallpaper.picker.individual;

import android.app.Activity;
import android.util.Log;
import android.view.View;
import androidx.cardview.R$style;
import androidx.fragment.app.FragmentActivity;
import com.android.wallpaper.model.LiveWallpaperInfo;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.module.DefaultWallpaperPersister;
import com.android.wallpaper.module.WallpaperPersister;
import com.android.wallpaper.picker.PreviewActivity;
/* loaded from: classes.dex */
public final class PreviewIndividualHolder extends IndividualHolder implements View.OnClickListener {
    public PreviewActivity.PreviewActivityIntentFactory mPreviewIntentFactory = new PreviewActivity.PreviewActivityIntentFactory();
    public WallpaperPersister mWallpaperPersister;

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        int i;
        if (this.mActivity.isFinishing()) {
            Log.w("PreviewIndividualHolder", "onClick received on VH on finishing Activity");
            return;
        }
        R$style.getInjector().getUserEventLogger(this.mActivity).logIndividualWallpaperSelected(this.mWallpaper.getCollectionId(this.mActivity));
        WallpaperInfo wallpaperInfo = this.mWallpaper;
        ((DefaultWallpaperPersister) this.mWallpaperPersister).mWallpaperInfoInPreview = wallpaperInfo;
        Activity activity = this.mActivity;
        PreviewActivity.PreviewActivityIntentFactory previewActivityIntentFactory = this.mPreviewIntentFactory;
        if (wallpaperInfo instanceof LiveWallpaperInfo) {
            i = 4;
        } else {
            i = 1;
        }
        wallpaperInfo.showPreview(activity, previewActivityIntentFactory, i);
    }

    public PreviewIndividualHolder(FragmentActivity fragmentActivity, int i, View view) {
        super(fragmentActivity, i, view);
        this.mTileLayout.setOnClickListener(this);
        this.mWallpaperPersister = R$style.getInjector().getWallpaperPersister(fragmentActivity);
    }
}
