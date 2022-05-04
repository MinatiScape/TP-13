package com.google.android.apps.wallpaper.module;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import android.util.Log;
import com.android.wallpaper.module.WallpaperPersister;
import com.android.wallpaper.module.WallpaperSetter;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.BuildersKt;
import kotlinx.coroutines.CoroutineScopeKt;
import kotlinx.coroutines.Dispatchers;
import kotlinx.coroutines.SupervisorKt;
import kotlinx.coroutines.internal.ContextScope;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: DownloadableRestorer.kt */
/* loaded from: classes.dex */
public final class DownloadableRestorer extends BroadcastReceiver {
    @NotNull
    public final ContextScope scope = CoroutineScopeKt.CoroutineScope(Dispatchers.Default.plus(SupervisorKt.SupervisorJob$default()));
    @NotNull
    public final DownloadableRestorer$setWallpaperCallback$1 setWallpaperCallback = new DownloadableRestorer$setWallpaperCallback$1(this);
    @Nullable
    public WallpaperPersister wallpaperPersister;
    @Nullable
    public WallpaperSetter wallpaperSetter;

    public static /* synthetic */ void getWallpaperSetter$annotations() {
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(@Nullable Context context, @Nullable Intent intent) {
        if (intent == null || !TextUtils.equals(intent.getAction(), "com.google.android.apps.wallpaper.action.RESTORE_DOWNLOADABLE")) {
            Log.w("DownloadableRestorer", "Not intent action to be handled");
        } else if (context == null) {
            Log.w("DownloadableRestorer", "No context to set wallpaper");
        } else {
            BroadcastReceiver.PendingResult goAsync = goAsync();
            Intrinsics.checkNotNullExpressionValue(goAsync, "goAsync()");
            BuildersKt.launch$default(this.scope, null, new DownloadableRestorer$onReceive$1(intent, this, context, goAsync, null), 3);
        }
    }
}
