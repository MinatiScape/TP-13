package com.android.wallpaper.module;

import android.app.Activity;
import java.util.Optional;
import java.util.function.Consumer;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class WallpaperSetter$$ExternalSyntheticLambda1 implements Consumer {
    public final /* synthetic */ WallpaperSetter f$0;
    public final /* synthetic */ Activity f$1;

    public /* synthetic */ WallpaperSetter$$ExternalSyntheticLambda1(WallpaperSetter wallpaperSetter, Activity activity) {
        this.f$0 = wallpaperSetter;
        this.f$1 = activity;
    }

    @Override // java.util.function.Consumer
    public final void accept(Object obj) {
        WallpaperSetter wallpaperSetter = this.f$0;
        Activity activity = this.f$1;
        Integer num = (Integer) obj;
        wallpaperSetter.getClass();
        if (activity.getRequestedOrientation() != num.intValue()) {
            activity.setRequestedOrientation(num.intValue());
        }
        wallpaperSetter.mCurrentScreenOrientation = Optional.empty();
    }
}
