package com.android.wallpaper.picker;

import com.android.systemui.shared.rotation.FloatingRotationButton;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class ImagePreviewFragment$$ExternalSyntheticLambda3 implements Runnable {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ Object f$0;

    public /* synthetic */ ImagePreviewFragment$$ExternalSyntheticLambda3(Object obj, int i) {
        this.$r8$classId = i;
        this.f$0 = obj;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.$r8$classId) {
            case 0:
                ImagePreviewFragment imagePreviewFragment = (ImagePreviewFragment) this.f$0;
                imagePreviewFragment.onWallpaperColorsChanged(imagePreviewFragment.mWallpaperPreferences.getWallpaperColors(imagePreviewFragment.mWallpaper.getStoredWallpaperId(imagePreviewFragment.getContext())));
                return;
            default:
                ((FloatingRotationButton) this.f$0).lambda$show$0();
                return;
        }
    }
}
