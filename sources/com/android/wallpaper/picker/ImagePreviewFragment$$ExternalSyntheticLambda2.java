package com.android.wallpaper.picker;

import android.view.View;
import com.android.wallpaper.module.PackageStatusNotifier;
import com.android.wallpaper.picker.individual.IndividualPickerUnlockableFragment;
import com.android.wallpaper.util.FullScreenAnimation;
import com.android.wallpaper.widget.BottomActionBar;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class ImagePreviewFragment$$ExternalSyntheticLambda2 implements FullScreenAnimation.FullScreenStatusListener, PackageStatusNotifier.Listener {
    public final /* synthetic */ AppbarFragment f$0;

    public /* synthetic */ ImagePreviewFragment$$ExternalSyntheticLambda2(AppbarFragment appbarFragment) {
        this.f$0 = appbarFragment;
    }

    @Override // com.android.wallpaper.util.FullScreenAnimation.FullScreenStatusListener
    public final void onFullScreenStatusChange(boolean z) {
        ImagePreviewFragment imagePreviewFragment = (ImagePreviewFragment) this.f$0;
        imagePreviewFragment.mLockScreenPreviewer.setDateViewVisibility(!z);
        if (!z) {
            BottomActionBar bottomActionBar = ((PreviewFragment) imagePreviewFragment).mBottomActionBar;
            ((View) bottomActionBar.mActionMap.get(BottomActionBar.BottomAction.EDIT)).sendAccessibilityEvent(8);
        }
    }

    @Override // com.android.wallpaper.module.PackageStatusNotifier.Listener
    public final void onPackageChanged(String str, int i) {
        IndividualPickerUnlockableFragment individualPickerUnlockableFragment = (IndividualPickerUnlockableFragment) this.f$0;
        int i2 = IndividualPickerUnlockableFragment.$r8$clinit;
        if (i != 3 || individualPickerUnlockableFragment.mCategory.containsThirdParty(str)) {
            individualPickerUnlockableFragment.fetchWallpapers(true);
        }
    }
}
