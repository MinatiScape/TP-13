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
/* compiled from: RecentWallpaperUtils.kt */
@DebugMetadata(c = "com.google.android.apps.wallpaper.module.RecentWallpaperUtils$saveFullBitmap$2", f = "RecentWallpaperUtils.kt", l = {}, m = "invokeSuspend")
/* loaded from: classes.dex */
final class RecentWallpaperUtils$saveFullBitmap$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    public final /* synthetic */ Context $context;
    public final /* synthetic */ Bitmap $wallpaperBitmap;
    public final /* synthetic */ String $wallpaperId;
    public int label;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public RecentWallpaperUtils$saveFullBitmap$2(Context context, String str, Bitmap bitmap, Continuation<? super RecentWallpaperUtils$saveFullBitmap$2> continuation) {
        super(continuation);
        this.$context = context;
        this.$wallpaperId = str;
        this.$wallpaperBitmap = bitmap;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new RecentWallpaperUtils$saveFullBitmap$2(this.$context, this.$wallpaperId, this.$wallpaperBitmap, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        Unit unit = Unit.INSTANCE;
        ((RecentWallpaperUtils$saveFullBitmap$2) create(coroutineScope, continuation)).invokeSuspend(unit);
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
