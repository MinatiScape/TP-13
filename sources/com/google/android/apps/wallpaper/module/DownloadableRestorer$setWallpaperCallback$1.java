package com.google.android.apps.wallpaper.module;

import android.util.Log;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.module.DefaultWallpaperPersister;
import com.android.wallpaper.module.WallpaperPersister;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: DownloadableRestorer.kt */
/* loaded from: classes.dex */
public final class DownloadableRestorer$setWallpaperCallback$1 implements WallpaperPersister.SetWallpaperCallback {
    public final /* synthetic */ DownloadableRestorer this$0;

    public DownloadableRestorer$setWallpaperCallback$1(DownloadableRestorer downloadableRestorer) {
        this.this$0 = downloadableRestorer;
    }

    @Override // com.android.wallpaper.module.WallpaperPersister.SetWallpaperCallback
    public final void onError(@Nullable Throwable th) {
        Log.e("DownloadableRestorer", "Can't restore the wallpaper.");
    }

    @Override // com.android.wallpaper.module.WallpaperPersister.SetWallpaperCallback
    public final void onSuccess(@NotNull WallpaperInfo wallpaperInfo) {
        Intrinsics.checkNotNullParameter(wallpaperInfo, "wallpaperInfo");
        WallpaperPersister wallpaperPersister = this.this$0.wallpaperPersister;
        Intrinsics.checkNotNull(wallpaperPersister);
        ((DefaultWallpaperPersister) wallpaperPersister).onLiveWallpaperSet();
    }
}
