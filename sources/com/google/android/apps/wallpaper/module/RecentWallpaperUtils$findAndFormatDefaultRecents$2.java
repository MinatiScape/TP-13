package com.google.android.apps.wallpaper.module;

import android.content.Context;
import com.android.systemui.shared.system.SysUiStatsLog;
import com.android.wallpaper.model.WallpaperInfo;
import java.util.List;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONArray;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: RecentWallpaperUtils.kt */
@DebugMetadata(c = "com.google.android.apps.wallpaper.module.RecentWallpaperUtils$findAndFormatDefaultRecents$2", f = "RecentWallpaperUtils.kt", l = {250, 252, 257, 258, SysUiStatsLog.RANKING_SELECTED, 261}, m = "invokeSuspend")
/* loaded from: classes.dex */
public final class RecentWallpaperUtils$findAndFormatDefaultRecents$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super JSONArray>, Object> {
    public final /* synthetic */ Context $context;
    public final /* synthetic */ List<WallpaperInfo> $wallpapers;
    public Object L$0;
    public Object L$1;
    public Object L$2;
    public Object L$3;
    public Object L$4;
    public int label;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public RecentWallpaperUtils$findAndFormatDefaultRecents$2(List<? extends WallpaperInfo> list, Context context, Continuation<? super RecentWallpaperUtils$findAndFormatDefaultRecents$2> continuation) {
        super(continuation);
        this.$wallpapers = list;
        this.$context = context;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new RecentWallpaperUtils$findAndFormatDefaultRecents$2(this.$wallpapers, this.$context, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super JSONArray> continuation) {
        return ((RecentWallpaperUtils$findAndFormatDefaultRecents$2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x00ae  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00f1  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x017f  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0183 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0184  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x01b0 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:54:0x01b1  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x01c0  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x01f8 A[LOOP:1: B:64:0x01f2->B:66:0x01f8, LOOP_END] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:34:0x0120 -> B:12:0x00a8). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:54:0x01b1 -> B:55:0x01b8). Please submit an issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @org.jetbrains.annotations.Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(@org.jetbrains.annotations.NotNull java.lang.Object r20) {
        /*
            Method dump skipped, instructions count: 534
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.apps.wallpaper.module.RecentWallpaperUtils$findAndFormatDefaultRecents$2.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
