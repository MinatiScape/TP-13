package com.android.customization.model.color;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.os.SystemProperties;
import android.util.Log;
import com.android.systemui.flags.FlagManager;
import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: ColorUtils.kt */
/* loaded from: classes.dex */
public final class ColorUtils {
    public static int sFlagId;
    @Nullable
    public static Resources sSysuiRes;

    @NotNull
    public static final String toColorString(int i) {
        String format = String.format("%06X", Arrays.copyOf(new Object[]{Integer.valueOf(i & 16777215)}, 1));
        Intrinsics.checkNotNullExpressionValue(format, "format(format, *args)");
        return format;
    }

    public static final boolean isMonetEnabled(@NotNull Context context) {
        Intrinsics.checkNotNullParameter(context, "context");
        int i = 0;
        boolean z = SystemProperties.getBoolean("persist.systemui.flag_monet", false);
        if (z) {
            return z;
        }
        if (sSysuiRes == null) {
            try {
                PackageManager packageManager = context.getPackageManager();
                ApplicationInfo applicationInfo = packageManager.getApplicationInfo(FlagManager.RECEIVING_PACKAGE, 1048704);
                if (applicationInfo != null) {
                    sSysuiRes = packageManager.getResourcesForApplication(applicationInfo);
                }
            } catch (PackageManager.NameNotFoundException e) {
                Log.w("ColorUtils", "Couldn't read color flag, skipping section", e);
            }
        }
        if (sFlagId == 0) {
            Resources resources = sSysuiRes;
            if (resources != null) {
                Intrinsics.checkNotNull(resources);
                i = resources.getIdentifier("flag_monet", "bool", FlagManager.RECEIVING_PACKAGE);
            }
            sFlagId = i;
        }
        if (sFlagId <= 0) {
            return z;
        }
        Resources resources2 = sSysuiRes;
        Intrinsics.checkNotNull(resources2);
        return resources2.getBoolean(sFlagId);
    }
}
