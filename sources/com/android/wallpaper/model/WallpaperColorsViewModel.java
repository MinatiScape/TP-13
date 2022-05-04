package com.android.wallpaper.model;

import androidx.lifecycle.ViewModel;
import kotlin.Lazy;
import kotlin.ResultKt;
import org.jetbrains.annotations.NotNull;
/* compiled from: WallpaperColorsViewModel.kt */
/* loaded from: classes.dex */
public final class WallpaperColorsViewModel extends ViewModel {
    @NotNull
    public final Lazy homeWallpaperColors$delegate = ResultKt.lazy(WallpaperColorsViewModel$homeWallpaperColors$2.INSTANCE);
    @NotNull
    public final Lazy lockWallpaperColors$delegate = ResultKt.lazy(WallpaperColorsViewModel$lockWallpaperColors$2.INSTANCE);
}
