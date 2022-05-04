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
import kotlinx.coroutines.CoroutineScope;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
@DebugMetadata(c = "com.google.android.apps.wallpaper.module.DefaultGoogleWallpaperPreferences$storeLastWallpaper$1", f = "DefaultGoogleWallpaperPreferences.kt", l = {SysUiStatsLog.ASSIST_GESTURE_STAGE_REPORTED, SysUiStatsLog.ASSIST_GESTURE_PROGRESS_REPORTED}, m = "invokeSuspend")
/* loaded from: classes.dex */
public final class DefaultGoogleWallpaperPreferences$storeLastWallpaper$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    public final /* synthetic */ Bitmap $croppedWallpaperBitmap;
    public final /* synthetic */ WallpaperInfo $wallpaper;
    public final /* synthetic */ String $wallpaperId;
    public int label;
    private /* synthetic */ CoroutineScope p$;
    public final /* synthetic */ DefaultGoogleWallpaperPreferences this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public DefaultGoogleWallpaperPreferences$storeLastWallpaper$1(DefaultGoogleWallpaperPreferences defaultGoogleWallpaperPreferences, String str, WallpaperInfo wallpaperInfo, Bitmap bitmap, Continuation<? super DefaultGoogleWallpaperPreferences$storeLastWallpaper$1> continuation) {
        super(2, continuation);
        this.this$0 = defaultGoogleWallpaperPreferences;
        this.$wallpaperId = str;
        this.$wallpaper = wallpaperInfo;
        this.$croppedWallpaperBitmap = bitmap;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        DefaultGoogleWallpaperPreferences$storeLastWallpaper$1 defaultGoogleWallpaperPreferences$storeLastWallpaper$1 = new DefaultGoogleWallpaperPreferences$storeLastWallpaper$1(this.this$0, this.$wallpaperId, this.$wallpaper, this.$croppedWallpaperBitmap, continuation);
        defaultGoogleWallpaperPreferences$storeLastWallpaper$1.p$ = (CoroutineScope) obj;
        return defaultGoogleWallpaperPreferences$storeLastWallpaper$1;
    }

    @Override // kotlin.jvm.functions.Function2
    public Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((DefaultGoogleWallpaperPreferences$storeLastWallpaper$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.COROUTINE_SUSPENDED;
        int i = this.label;
        if (i == 0) {
            ResultKt.throwOnFailure(obj);
            Context mContext = this.this$0.mContext;
            Intrinsics.checkNotNullExpressionValue(mContext, "mContext");
            String str = this.$wallpaperId;
            WallpaperInfo wallpaperInfo = this.$wallpaper;
            Bitmap bitmap = this.$croppedWallpaperBitmap;
            this.label = 1;
            if (RecentWallpaperUtils.saveThumbnail(mContext, str, wallpaperInfo, bitmap, this) == coroutineSingletons) {
                return coroutineSingletons;
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
            if (RecentWallpaperUtils.saveFullBitmap(mContext2, str2, bitmap2, this) == coroutineSingletons) {
                return coroutineSingletons;
            }
        }
        return Unit.INSTANCE;
    }
}
