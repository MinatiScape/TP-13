package com.android.wallpaper.picker;

import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.view.View;
import androidx.appcompat.R$bool;
import com.android.systemui.shared.R;
import com.android.wallpaper.model.WallpaperSectionController;
import com.android.wallpaper.util.FullScreenAnimation;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class PreviewFragment$$ExternalSyntheticLambda3 implements View.OnClickListener {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ Object f$0;

    public /* synthetic */ PreviewFragment$$ExternalSyntheticLambda3(Object obj, int i) {
        this.$r8$classId = i;
        this.f$0 = obj;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        int i;
        switch (this.$r8$classId) {
            case 0:
                PreviewFragment previewFragment = (PreviewFragment) this.f$0;
                FullScreenAnimation fullScreenAnimation = previewFragment.mFullScreenAnimation;
                boolean z = fullScreenAnimation.mWorkspaceVisibility;
                fullScreenAnimation.setWorkspaceVisibility(!z);
                Drawable drawable = ((LayerDrawable) ((RippleDrawable) view.findViewById(R.id.hide_ui_view).getBackground()).getDrawable(0)).getDrawable(0);
                if (!z) {
                    i = R$bool.getColorAttr(previewFragment.getActivity(), 17956902);
                } else {
                    i = R$bool.getColorAttr(previewFragment.getActivity(), 17956900);
                }
                drawable.setTint(i);
                return;
            default:
                ((CustomizationPickerFragment) ((WallpaperSectionController) this.f$0).mSectionNavigationController).navigateTo(new CategorySelectorFragment());
                return;
        }
    }
}
