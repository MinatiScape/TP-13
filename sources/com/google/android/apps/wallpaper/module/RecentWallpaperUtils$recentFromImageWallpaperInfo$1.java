package com.google.android.apps.wallpaper.module;

import androidx.recyclerview.widget.RecyclerView;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: RecentWallpaperUtils.kt */
@DebugMetadata(c = "com.google.android.apps.wallpaper.module.RecentWallpaperUtils", f = "RecentWallpaperUtils.kt", l = {278}, m = "recentFromImageWallpaperInfo")
/* loaded from: classes.dex */
public final class RecentWallpaperUtils$recentFromImageWallpaperInfo$1 extends ContinuationImpl {
    public Object L$0;
    public Object L$1;
    public Object L$2;
    public Object L$3;
    public int label;
    public /* synthetic */ Object result;

    public RecentWallpaperUtils$recentFromImageWallpaperInfo$1(Continuation<? super RecentWallpaperUtils$recentFromImageWallpaperInfo$1> continuation) {
        super(continuation);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.result = obj;
        this.label |= RecyclerView.UNDEFINED_DURATION;
        return RecentWallpaperUtils.access$recentFromImageWallpaperInfo(null, null, this);
    }
}
