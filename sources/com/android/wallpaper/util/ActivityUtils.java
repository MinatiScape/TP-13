package com.android.wallpaper.util;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.Log;
import android.widget.Toast;
import com.android.systemui.shared.R;
/* loaded from: classes.dex */
public final class ActivityUtils {
    public static boolean isLaunchedFromSettingsRelated(Intent intent) {
        if (intent != null && TextUtils.equals("app_launched_settings", intent.getStringExtra("com.android.wallpaper.LAUNCH_SOURCE"))) {
            return true;
        }
        return intent != null && intent.hasExtra(":settings:fragment_args_key");
    }

    public static boolean isSUWMode(Context context) {
        return Settings.Secure.getInt(context.getContentResolver(), "user_setup_complete", 1) == 0;
    }

    public static void startActivityForResultSafely(Activity activity, Intent intent, int i) {
        try {
            activity.startActivityForResult(intent, i);
        } catch (ActivityNotFoundException unused) {
            Toast.makeText(activity, (int) R.string.app_not_found, 0).show();
        } catch (SecurityException e) {
            Toast.makeText(activity, (int) R.string.app_not_found, 0).show();
            Log.e("Wallpaper", "Wallpaper does not have the permission to launch " + intent + ". Make sure to create a MAIN intent-filter for the corresponding activity or use the exported attribute for this activity.", e);
        }
    }
}
