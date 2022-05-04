package com.google.android.apps.wallpaper.module;

import android.content.Context;
import android.graphics.Bitmap;
import com.android.systemui.shared.system.SysUiStatsLog;
import com.android.wallpaper.model.WallpaperInfo;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.BuildersKt;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.Dispatchers;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: DefaultGoogleWallpaperPreferences.kt */
@DebugMetadata(c = "com.google.android.apps.wallpaper.module.DefaultGoogleWallpaperPreferences$storeLastWallpaper$1", f = "DefaultGoogleWallpaperPreferences.kt", l = {SysUiStatsLog.ASSIST_GESTURE_STAGE_REPORTED, SysUiStatsLog.ASSIST_GESTURE_PROGRESS_REPORTED}, m = "invokeSuspend")
/* loaded from: classes.dex */
public final class DefaultGoogleWallpaperPreferences$storeLastWallpaper$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    public final /* synthetic */ Bitmap $croppedWallpaperBitmap;
    public final /* synthetic */ WallpaperInfo $wallpaper;
    public final /* synthetic */ String $wallpaperId;
    public int label;
    public final /* synthetic */ DefaultGoogleWallpaperPreferences this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public DefaultGoogleWallpaperPreferences$storeLastWallpaper$1(DefaultGoogleWallpaperPreferences defaultGoogleWallpaperPreferences, String str, WallpaperInfo wallpaperInfo, Bitmap bitmap, Continuation<? super DefaultGoogleWallpaperPreferences$storeLastWallpaper$1> continuation) {
        super(continuation);
        this.this$0 = defaultGoogleWallpaperPreferences;
        this.$wallpaperId = str;
        this.$wallpaper = wallpaperInfo;
        this.$croppedWallpaperBitmap = bitmap;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new DefaultGoogleWallpaperPreferences$storeLastWallpaper$1(this.this$0, this.$wallpaperId, this.$wallpaper, this.$croppedWallpaperBitmap, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((DefaultGoogleWallpaperPreferences$storeLastWallpaper$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        Object obj2 = CoroutineSingletons.COROUTINE_SUSPENDED;
        int i = this.label;
        if (i == 0) {
            ResultKt.throwOnFailure(obj);
            Context mContext = this.this$0.mContext;
            Intrinsics.checkNotNullExpressionValue(mContext, "mContext");
            String str = this.$wallpaperId;
            WallpaperInfo wallpaperInfo = this.$wallpaper;
            Bitmap bitmap = this.$croppedWallpaperBitmap;
            this.label = 1;
            Object withContext = BuildersKt.withContext(Dispatchers.IO, new RecentWallpaperUtils$saveThumbnail$2(mContext, bitmap, str, wallpaperInfo, null), this);
            if (withContext != obj2) {
                withContext = Unit.INSTANCE;
            }
            if (withContext == obj2) {
                return obj2;
            }
        } else if (i == 1) {
            ResultKt.throwOnFailure(obj);
        } else if (i == 2) {
            ResultKt.throwOnFailure(obj);
            return Unit.INSTANCE;
        } else {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        this.this$0.notifyRecentsChange();
        Bitmap bitmap2 = this.$croppedWallpaperBitmap;
        if (bitmap2 != null) {
            DefaultGoogleWallpaperPreferences defaultGoogleWallpaperPreferences = this.this$0;
            String str2 = this.$wallpaperId;
            Context mContext2 = defaultGoogleWallpaperPreferences.mContext;
            Intrinsics.checkNotNullExpressionValue(mContext2, "mContext");
            this.label = 2;
            Object withContext2 = BuildersKt.withContext(Dispatchers.IO, new RecentWallpaperUtils$saveFullBitmap$2(mContext2, str2, bitmap2, null), this);
            if (withContext2 != obj2) {
                withContext2 = Unit.INSTANCE;
            }
            if (withContext2 == obj2) {
                return obj2;
            }
        }
        return Unit.INSTANCE;
    }
}
