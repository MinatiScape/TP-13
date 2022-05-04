package com.android.wallpaper.picker;

import android.view.View;
import com.android.systemui.shared.rotation.RotationButtonController;
import com.android.wallpaper.model.LiveWallpaperInfo;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class PreviewFragment$$ExternalSyntheticLambda2 implements View.OnClickListener {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ Object f$0;

    public /* synthetic */ PreviewFragment$$ExternalSyntheticLambda2(Object obj, int i) {
        this.$r8$classId = i;
        this.f$0 = obj;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        switch (this.$r8$classId) {
            case 0:
                PreviewFragment previewFragment = (PreviewFragment) this.f$0;
                previewFragment.mWallpaperSetter.requestDestination(previewFragment.getActivity(), previewFragment.mFragmentManager, previewFragment, previewFragment.mWallpaper instanceof LiveWallpaperInfo);
                return;
            default:
                ((RotationButtonController) this.f$0).onRotateSuggestionClick(view);
                return;
        }
    }
}
