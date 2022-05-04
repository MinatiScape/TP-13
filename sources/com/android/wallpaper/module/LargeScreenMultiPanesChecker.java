package com.android.wallpaper.module;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import com.android.systemui.shared.system.QuickStepContract;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: LargeScreenMultiPanesChecker.kt */
/* loaded from: classes.dex */
public final class LargeScreenMultiPanesChecker {
    @NotNull
    public final Intent getMultiPanesIntent(@NotNull Intent intent) {
        Intrinsics.checkNotNullParameter(intent, "intent");
        Intent intent2 = new Intent("android.settings.SETTINGS_EMBED_DEEP_LINK_ACTIVITY");
        intent2.putExtra("android.provider.extra.SETTINGS_EMBEDDED_DEEP_LINK_HIGHLIGHT_MENU_KEY", "top_level_wallpaper");
        intent2.putExtra("android.provider.extra.SETTINGS_EMBEDDED_DEEP_LINK_INTENT_URI", intent.toUri(1));
        return intent2;
    }

    public final boolean isMultiPanesEnabled(@NotNull Context context) {
        ActivityInfo activityInfo;
        Intrinsics.checkNotNullParameter(context, "context");
        PackageManager packageManager = context.getPackageManager();
        Intent intent = new Intent("android.intent.action.SET_WALLPAPER").setPackage(context.getPackageName());
        Intrinsics.checkNotNullExpressionValue(intent, "Intent(ACTION_SET_WALLPA…kage(context.packageName)");
        ResolveInfo resolveActivity = packageManager.resolveActivity(getMultiPanesIntent(intent), QuickStepContract.SYSUI_STATE_ONE_HANDED_ACTIVE);
        Boolean bool = null;
        if (!(resolveActivity == null || (activityInfo = resolveActivity.activityInfo) == null)) {
            bool = Boolean.valueOf(activityInfo.enabled);
        }
        if (bool != null) {
            return true;
        }
        return false;
    }
}
