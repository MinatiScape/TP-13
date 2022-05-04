package com.google.android.apps.wallpaper.module;

import android.content.Context;
import android.provider.Settings;
import android.util.Log;
import com.android.customization.model.theme.ThemeManager;
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
import org.json.JSONArray;
import org.json.JSONObject;
/* compiled from: ThemeSanitizerReceiver.kt */
@DebugMetadata(c = "com.google.android.apps.wallpaper.module.ThemeSanitizerReceiver$sanitizeThemes$2", f = "ThemeSanitizerReceiver.kt", l = {}, m = "invokeSuspend")
/* loaded from: classes.dex */
final class ThemeSanitizerReceiver$sanitizeThemes$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    public final /* synthetic */ Context $context;
    public int label;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ThemeSanitizerReceiver$sanitizeThemes$2(Context context, Continuation<? super ThemeSanitizerReceiver$sanitizeThemes$2> continuation) {
        super(continuation);
        this.$context = context;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new ThemeSanitizerReceiver$sanitizeThemes$2(this.$context, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((ThemeSanitizerReceiver$sanitizeThemes$2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        if (this.label == 0) {
            ResultKt.throwOnFailure(obj);
            JSONObject jSONObject = new JSONObject(Settings.Secure.getString(this.$context.getContentResolver(), "theme_customization_overlay_packages"));
            JSONArray names = jSONObject.names();
            if (names == null) {
                return Unit.INSTANCE;
            }
            if (jSONObject.has("android.theme.customization.system_palette")) {
                int length = names.length();
                int i = 0;
                boolean z = false;
                while (i < length) {
                    int i2 = i + 1;
                    String string = names.getString(i);
                    if (!Intrinsics.areEqual("android.theme.customization.accent_color", string) && ThemeManager.THEME_CATEGORIES.contains(string)) {
                        jSONObject.remove(string);
                        z = true;
                    }
                    i = i2;
                }
                if (!z) {
                    return Unit.INSTANCE;
                }
                Settings.Secure.putString(this.$context.getContentResolver(), "theme_customization_overlay_packages", jSONObject.toString());
            } else {
                Settings.Secure.putString(this.$context.getContentResolver(), "theme_customization_overlay_packages", null);
            }
            Log.i("ThemeSanitizerReceiver", "Theme setting sanitized");
            return Unit.INSTANCE;
        }
        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
    }
}
