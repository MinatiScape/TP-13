package com.google.android.apps.wallpaper.module;

import android.content.Context;
import android.graphics.Bitmap;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
@DebugMetadata(c = "com.google.android.apps.wallpaper.module.RecentWallpaperUtils$saveFullBitmap$2", f = "RecentWallpaperUtils.kt", l = {}, m = "invokeSuspend")
/* loaded from: classes.dex */
public final class RecentWallpaperUtils$saveFullBitmap$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    public final /* synthetic */ Context $context;
    public final /* synthetic */ Bitmap $wallpaperBitmap;
    public final /* synthetic */ String $wallpaperId;
    public int label;
    private /* synthetic */ CoroutineScope p$;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public RecentWallpaperUtils$saveFullBitmap$2(Context context, String str, Bitmap bitmap, Continuation<? super RecentWallpaperUtils$saveFullBitmap$2> continuation) {
        super(2, continuation);
        this.$context = context;
        this.$wallpaperId = str;
        this.$wallpaperBitmap = bitmap;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        RecentWallpaperUtils$saveFullBitmap$2 recentWallpaperUtils$saveFullBitmap$2 = new RecentWallpaperUtils$saveFullBitmap$2(this.$context, this.$wallpaperId, this.$wallpaperBitmap, continuation);
        recentWallpaperUtils$saveFullBitmap$2.p$ = (CoroutineScope) obj;
        return recentWallpaperUtils$saveFullBitmap$2;
    }

    @Override // kotlin.jvm.functions.Function2
    public Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        RecentWallpaperUtils$saveFullBitmap$2 recentWallpaperUtils$saveFullBitmap$2 = new RecentWallpaperUtils$saveFullBitmap$2(this.$context, this.$wallpaperId, this.$wallpaperBitmap, continuation);
        recentWallpaperUtils$saveFullBitmap$2.p$ = coroutineScope;
        Unit unit = Unit.INSTANCE;
        recentWallpaperUtils$saveFullBitmap$2.invokeSuspend(unit);
        return unit;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        if (this.label == 0) {
            ResultKt.throwOnFailure(obj);
            RecentWallpaperUtils.access$storeBitmap(this.$context, RecentWallpaperUtils.getWallpaperFullBitmapFileName(this.$wallpaperId), this.$wallpaperBitmap);
            return Unit.INSTANCE;
        }
        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
    }
}
