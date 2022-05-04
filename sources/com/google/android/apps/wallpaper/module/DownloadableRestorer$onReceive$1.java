package com.google.android.apps.wallpaper.module;

import android.app.WallpaperColors;
import android.app.WallpaperInfo;
import android.app.WallpaperManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import androidx.cardview.R$style;
import com.android.wallpaper.model.LiveWallpaperInfo;
import com.android.wallpaper.module.Injector;
import com.android.wallpaper.module.WallpaperSetter;
import java.io.IOException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.CoroutineScope;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: DownloadableRestorer.kt */
@DebugMetadata(c = "com.google.android.apps.wallpaper.module.DownloadableRestorer$onReceive$1", f = "DownloadableRestorer.kt", l = {}, m = "invokeSuspend")
/* loaded from: classes.dex */
public final class DownloadableRestorer$onReceive$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    public final /* synthetic */ Context $context;
    public final /* synthetic */ Intent $intent;
    public final /* synthetic */ BroadcastReceiver.PendingResult $pendingResult;
    public int label;
    public final /* synthetic */ DownloadableRestorer this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public DownloadableRestorer$onReceive$1(Intent intent, DownloadableRestorer downloadableRestorer, Context context, BroadcastReceiver.PendingResult pendingResult, Continuation<? super DownloadableRestorer$onReceive$1> continuation) {
        super(continuation);
        this.$intent = intent;
        this.this$0 = downloadableRestorer;
        this.$context = context;
        this.$pendingResult = pendingResult;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new DownloadableRestorer$onReceive$1(this.$intent, this.this$0, this.$context, this.$pendingResult, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((DownloadableRestorer$onReceive$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        if (this.label == 0) {
            ResultKt.throwOnFailure(obj);
            Injector injector = R$style.getInjector();
            Object extra = this.$intent.getExtra("android.live_wallpaper.info");
            if (extra != null) {
                int intExtra = this.$intent.getIntExtra("android.live_wallpaper.restore_target", 0);
                LiveWallpaperInfo liveWallpaperInfo = new LiveWallpaperInfo((WallpaperInfo) extra);
                this.this$0.wallpaperSetter = new WallpaperSetter(injector.getWallpaperPersister(this.$context), injector.getPreferences(this.$context), injector.getUserEventLogger(this.$context), false);
                this.this$0.wallpaperPersister = injector.getWallpaperPersister(this.$context);
                WallpaperSetter wallpaperSetter = this.this$0.wallpaperSetter;
                Intrinsics.checkNotNull(wallpaperSetter);
                Context context = this.$context;
                DownloadableRestorer$setWallpaperCallback$1 downloadableRestorer$setWallpaperCallback$1 = this.this$0.setWallpaperCallback;
                try {
                } catch (IOException | RuntimeException e) {
                    if (downloadableRestorer$setWallpaperCallback$1 != null) {
                        downloadableRestorer$setWallpaperCallback$1.onError(e);
                    }
                }
                if (intExtra != 1) {
                    WallpaperManager wallpaperManager = WallpaperManager.getInstance(context);
                    wallpaperManager.setWallpaperComponent(liveWallpaperInfo.mInfo.getComponent());
                    if (intExtra == 2) {
                        wallpaperManager.clear(2);
                    }
                    wallpaperSetter.mPreferences.storeLatestHomeWallpaper(liveWallpaperInfo.getWallpaperId(), liveWallpaperInfo, WallpaperColors.fromBitmap(liveWallpaperInfo.getThumbAsset(context).getLowResBitmap(context)));
                    if (downloadableRestorer$setWallpaperCallback$1 != null) {
                        downloadableRestorer$setWallpaperCallback$1.onSuccess(liveWallpaperInfo);
                    }
                    this.$pendingResult.finish();
                    return Unit.INSTANCE;
                }
                throw new IllegalArgumentException("Live wallpaper cannot be applied on lock screen only");
            } else {
                throw new NullPointerException("null cannot be cast to non-null type android.app.WallpaperInfo");
            }
        } else {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }
}
