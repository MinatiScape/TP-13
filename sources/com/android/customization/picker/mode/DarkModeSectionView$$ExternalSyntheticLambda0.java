package com.android.customization.picker.mode;

import android.content.Context;
import android.view.View;
import com.android.wallpaper.picker.PreviewFragment;
import com.android.wallpaper.picker.SectionView;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class DarkModeSectionView$$ExternalSyntheticLambda0 implements View.OnClickListener {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ Object f$0;

    public /* synthetic */ DarkModeSectionView$$ExternalSyntheticLambda0(Object obj, int i) {
        this.$r8$classId = i;
        this.f$0 = obj;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        switch (this.$r8$classId) {
            case 0:
                DarkModeSectionView darkModeSectionView = (DarkModeSectionView) this.f$0;
                boolean z = !darkModeSectionView.mIsDarkModeActivated;
                darkModeSectionView.mIsDarkModeActivated = z;
                SectionView.SectionViewListener sectionViewListener = darkModeSectionView.mSectionViewListener;
                if (sectionViewListener != null) {
                    sectionViewListener.onViewActivated(darkModeSectionView.getContext(), z);
                    return;
                }
                return;
            default:
                PreviewFragment.WallpaperInfoContent wallpaperInfoContent = (PreviewFragment.WallpaperInfoContent) this.f$0;
                Context context = wallpaperInfoContent.this$0.getContext();
                if (context != null) {
                    PreviewFragment previewFragment = wallpaperInfoContent.this$0;
                    previewFragment.mUserEventLogger.logActionClicked(previewFragment.mWallpaper.getCollectionId(context), wallpaperInfoContent.this$0.mWallpaper.getActionLabelRes());
                    wallpaperInfoContent.this$0.startActivity(wallpaperInfoContent.mExploreIntent, null);
                    return;
                }
                return;
        }
    }
}
