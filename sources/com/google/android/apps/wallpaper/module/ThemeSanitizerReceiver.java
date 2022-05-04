package com.google.android.apps.wallpaper.module;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import androidx.cardview.R$style;
import com.android.customization.model.color.ColorUtils;
import com.android.wallpaper.module.GoogleWallpapersInjector;
import com.android.wallpaper.module.Injector;
import com.android.wallpaper.util.DiskBasedLogger;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.BuildersKt;
import kotlinx.coroutines.CoroutineScopeKt;
import kotlinx.coroutines.Dispatchers;
import kotlinx.coroutines.SupervisorKt;
import kotlinx.coroutines.internal.ContextScope;
import org.jetbrains.annotations.NotNull;
/* compiled from: ThemeSanitizerReceiver.kt */
/* loaded from: classes.dex */
public final class ThemeSanitizerReceiver extends BroadcastReceiver {
    public static final /* synthetic */ int $r8$clinit = 0;
    @NotNull
    public final ContextScope scope = CoroutineScopeKt.CoroutineScope(Dispatchers.Default.plus(SupervisorKt.SupervisorJob$default()));

    @Override // android.content.BroadcastReceiver
    public final void onReceive(@NotNull Context context, @NotNull Intent intent) {
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(intent, "intent");
        if (intent.getAction() == null || (!Intrinsics.areEqual(intent.getAction(), "android.intent.action.MY_PACKAGE_REPLACED") && !Intrinsics.areEqual(intent.getAction(), "android.intent.action.BOOT_COMPLETED"))) {
            DiskBasedLogger.e("ThemeSanitizerReceiver", "Unexpected action or Android version!", context);
            throw new IllegalStateException("Unexpected broadcast action or unsupported Android version");
        } else if (!ColorUtils.isMonetEnabled(context)) {
            Log.i("ThemeSanitizerReceiver", "Skipping theme sanitizer");
        } else {
            Injector injector = R$style.getInjector();
            if (injector != null) {
                GoogleWallpaperPreferences googlePreferences = ((GoogleWallpapersInjector) injector).getGooglePreferences(context);
                if (googlePreferences.isThemesSanitized()) {
                    Log.d("ThemeSanitizerReceiver", "Already sanitized, skipping theme sanitizer");
                    return;
                }
                BuildersKt.launch$default(this.scope, null, new ThemeSanitizerReceiver$onReceive$1(this, context, googlePreferences, goAsync(), null), 3);
                return;
            }
            throw new NullPointerException("null cannot be cast to non-null type com.android.wallpaper.module.GoogleWallpapersInjector");
        }
    }
}
