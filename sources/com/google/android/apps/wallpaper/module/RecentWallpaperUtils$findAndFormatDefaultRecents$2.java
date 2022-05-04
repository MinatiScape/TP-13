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
    private /* synthetic */ CoroutineScope p$;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public RecentWallpaperUtils$findAndFormatDefaultRecents$2(List<? extends WallpaperInfo> list, Context context, Continuation<? super RecentWallpaperUtils$findAndFormatDefaultRecents$2> continuation) {
        super(2, continuation);
        this.$wallpapers = list;
        this.$context = context;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        RecentWallpaperUtils$findAndFormatDefaultRecents$2 recentWallpaperUtils$findAndFormatDefaultRecents$2 = new RecentWallpaperUtils$findAndFormatDefaultRecents$2(this.$wallpapers, this.$context, continuation);
        recentWallpaperUtils$findAndFormatDefaultRecents$2.p$ = (CoroutineScope) obj;
        return recentWallpaperUtils$findAndFormatDefaultRecents$2;
    }

    @Override // kotlin.jvm.functions.Function2
    public Object invoke(CoroutineScope coroutineScope, Continuation<? super JSONArray> continuation) {
        RecentWallpaperUtils$findAndFormatDefaultRecents$2 recentWallpaperUtils$findAndFormatDefaultRecents$2 = new RecentWallpaperUtils$findAndFormatDefaultRecents$2(this.$wallpapers, this.$context, continuation);
        recentWallpaperUtils$findAndFormatDefaultRecents$2.p$ = coroutineScope;
        return recentWallpaperUtils$findAndFormatDefaultRecents$2.invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x00aa  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00eb  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0153 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0154  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0181 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0182  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x018f  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0193  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x01c8 A[LOOP:1: B:62:0x01c2->B:64:0x01c8, LOOP_END] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:28:0x00e7 -> B:54:0x0190). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:50:0x0182 -> B:51:0x018b). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:59:0x01af -> B:60:0x01b2). Please submit an issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @org.jetbrains.annotations.Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(@org.jetbrains.annotations.NotNull java.lang.Object r12) {
        /*
            Method dump skipped, instructions count: 486
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.apps.wallpaper.module.RecentWallpaperUtils$findAndFormatDefaultRecents$2.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
