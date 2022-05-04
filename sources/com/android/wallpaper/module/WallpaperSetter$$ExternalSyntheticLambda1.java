package com.android.wallpaper.module;

import android.app.Activity;
import android.view.ViewGroup;
import com.android.wallpaper.model.CustomizationSectionController;
import com.android.wallpaper.picker.CustomizationPickerFragment;
import com.android.wallpaper.util.PreviewUtils$$ExternalSyntheticLambda1;
import com.android.wallpaper.widget.BottomActionBar;
import java.lang.Thread;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;
import java.util.function.Consumer;
/* loaded from: classes.dex */
public final /* synthetic */ class WallpaperSetter$$ExternalSyntheticLambda1 implements Consumer {
    public final /* synthetic */ int $r8$classId = 0;
    public final /* synthetic */ Object f$0;
    public final /* synthetic */ Object f$1;

    public /* synthetic */ WallpaperSetter$$ExternalSyntheticLambda1(WallpaperSetter wallpaperSetter, Activity activity) {
        this.f$0 = wallpaperSetter;
        this.f$1 = activity;
    }

    public /* synthetic */ WallpaperSetter$$ExternalSyntheticLambda1(CustomizationPickerFragment customizationPickerFragment, ViewGroup viewGroup) {
        this.f$0 = customizationPickerFragment;
        this.f$1 = viewGroup;
    }

    public /* synthetic */ WallpaperSetter$$ExternalSyntheticLambda1(BottomActionBar bottomActionBar, Set set) {
        this.f$0 = bottomActionBar;
        this.f$1 = set;
    }

    public /* synthetic */ WallpaperSetter$$ExternalSyntheticLambda1(Thread thread, Throwable th) {
        this.f$0 = thread;
        this.f$1 = th;
    }

    @Override // java.util.function.Consumer
    public final void accept(Object obj) {
        switch (this.$r8$classId) {
            case 0:
                WallpaperSetter wallpaperSetter = (WallpaperSetter) this.f$0;
                Activity activity = (Activity) this.f$1;
                Integer num = (Integer) obj;
                Objects.requireNonNull(wallpaperSetter);
                if (activity.getRequestedOrientation() != num.intValue()) {
                    activity.setRequestedOrientation(num.intValue());
                }
                wallpaperSetter.mCurrentScreenOrientation = Optional.empty();
                return;
            case 1:
                ((Thread.UncaughtExceptionHandler) obj).uncaughtException((Thread) this.f$0, (Throwable) this.f$1);
                return;
            case 2:
                CustomizationPickerFragment customizationPickerFragment = (CustomizationPickerFragment) this.f$0;
                customizationPickerFragment.mNestedScrollView.post(new PreviewUtils$$ExternalSyntheticLambda1(customizationPickerFragment, (ViewGroup) this.f$1, (CustomizationSectionController) obj));
                return;
            default:
                BottomActionBar bottomActionBar = (BottomActionBar) this.f$0;
                BottomActionBar.BottomAction bottomAction = (BottomActionBar.BottomAction) obj;
                int i = BottomActionBar.$r8$clinit;
                Objects.requireNonNull(bottomActionBar);
                if (((Set) this.f$1).contains(bottomAction)) {
                    bottomActionBar.showActions(bottomAction);
                    return;
                } else {
                    bottomActionBar.hideActions(bottomAction);
                    return;
                }
        }
    }
}
