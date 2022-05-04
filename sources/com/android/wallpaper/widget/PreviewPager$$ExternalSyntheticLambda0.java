package com.android.wallpaper.widget;

import android.view.View;
import androidx.viewpager.widget.ViewPager;
import com.android.wallpaper.picker.SetWallpaperDialogFragment;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class PreviewPager$$ExternalSyntheticLambda0 implements View.OnClickListener {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ Object f$0;

    public /* synthetic */ PreviewPager$$ExternalSyntheticLambda0(Object obj, int i) {
        this.$r8$classId = i;
        this.f$0 = obj;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        switch (this.$r8$classId) {
            case 0:
                ViewPager viewPager = ((PreviewPager) this.f$0).mViewPager;
                int i = viewPager.mCurItem;
                viewPager.setScrollingCacheEnabled(false);
                return;
            default:
                SetWallpaperDialogFragment setWallpaperDialogFragment = (SetWallpaperDialogFragment) this.f$0;
                int i2 = SetWallpaperDialogFragment.$r8$clinit;
                setWallpaperDialogFragment.mWithItemSelected = true;
                setWallpaperDialogFragment.mListener.onSet(1);
                setWallpaperDialogFragment.dismissInternal(false, false);
                return;
        }
    }
}
