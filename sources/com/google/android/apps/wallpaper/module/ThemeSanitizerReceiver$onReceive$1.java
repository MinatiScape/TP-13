package com.google.android.apps.wallpaper.module;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.util.Log;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.BuildersKt;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.Dispatchers;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: ThemeSanitizerReceiver.kt */
@DebugMetadata(c = "com.google.android.apps.wallpaper.module.ThemeSanitizerReceiver$onReceive$1", f = "ThemeSanitizerReceiver.kt", l = {78}, m = "invokeSuspend")
/* loaded from: classes.dex */
public final class ThemeSanitizerReceiver$onReceive$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    public final /* synthetic */ Context $context;
    public final /* synthetic */ GoogleWallpaperPreferences $prefs;
    public final /* synthetic */ BroadcastReceiver.PendingResult $result;
    public int label;
    public final /* synthetic */ ThemeSanitizerReceiver this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ThemeSanitizerReceiver$onReceive$1(ThemeSanitizerReceiver themeSanitizerReceiver, Context context, GoogleWallpaperPreferences googleWallpaperPreferences, BroadcastReceiver.PendingResult pendingResult, Continuation<? super ThemeSanitizerReceiver$onReceive$1> continuation) {
        super(continuation);
        this.this$0 = themeSanitizerReceiver;
        this.$context = context;
        this.$prefs = googleWallpaperPreferences;
        this.$result = pendingResult;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new ThemeSanitizerReceiver$onReceive$1(this.this$0, this.$context, this.$prefs, this.$result, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((ThemeSanitizerReceiver$onReceive$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        Object obj2 = CoroutineSingletons.COROUTINE_SUSPENDED;
        int i = this.label;
        try {
            if (i == 0) {
                ResultKt.throwOnFailure(obj);
                ThemeSanitizerReceiver themeSanitizerReceiver = this.this$0;
                Context context = this.$context;
                this.label = 1;
                int i2 = ThemeSanitizerReceiver.$r8$clinit;
                themeSanitizerReceiver.getClass();
                Object withContext = BuildersKt.withContext(Dispatchers.IO, new ThemeSanitizerReceiver$sanitizeThemes$2(context, null), this);
                if (withContext != obj2) {
                    withContext = Unit.INSTANCE;
                }
                if (withContext == obj2) {
                    return obj2;
                }
            } else if (i == 1) {
                ResultKt.throwOnFailure(obj);
            } else {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            this.$prefs.setThemesSanitized();
        } catch (Throwable th) {
            Log.e("ThemeSanitizerReceiver", "Error cleaning up themes setting", th);
        }
        this.$result.finish();
        return Unit.INSTANCE;
    }
}
