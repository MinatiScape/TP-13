package com.android.wallpaper.model;

import android.app.WallpaperColors;
import androidx.lifecycle.MutableLiveData;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;
/* loaded from: classes.dex */
public final class WallpaperColorsViewModel$lockWallpaperColors$2 extends Lambda implements Function0<MutableLiveData<WallpaperColors>> {
    public static final WallpaperColorsViewModel$lockWallpaperColors$2 INSTANCE = new WallpaperColorsViewModel$lockWallpaperColors$2();

    public WallpaperColorsViewModel$lockWallpaperColors$2() {
        super(0);
    }

    @Override // kotlin.jvm.functions.Function0
    public MutableLiveData<WallpaperColors> invoke() {
        return new MutableLiveData<>();
    }
}
