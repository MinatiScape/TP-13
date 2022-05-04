package com.google.android.apps.wallpaper.module;

import android.annotation.SuppressLint;
import android.app.PendingIntent;
import android.app.WallpaperManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.SystemClock;
import android.util.Log;
import androidx.cardview.R$style;
import androidx.core.R$id;
import com.android.wallpaper.module.DefaultAlarmManagerWrapper;
import com.android.wallpaper.util.DiskBasedLogger;
import com.google.android.apps.wallpaper.backdrop.BackdropAlarmReceiver;
import com.google.android.apps.wallpaper.backdrop.BackdropAlarmScheduler;
import java.util.Calendar;
import java.util.concurrent.TimeUnit;
@SuppressLint({"ServiceCast"})
/* loaded from: classes.dex */
public class GoogleAlarmInitializer extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        Context applicationContext = context.getApplicationContext();
        R$style.getInjector().getWallpaperManagerCompat(applicationContext);
        if (!((WallpaperManager) context.getSystemService("wallpaper")).isWallpaperSupported()) {
            Log.e("GoogleAlarmInitializer", "Wallpapers are not supported in this context, not attempting to schedule a wallpaper rotation alarm");
            return;
        }
        String action = intent.getAction();
        if (action.equals("android.intent.action.BOOT_COMPLETED")) {
            R$id.setAlarm(applicationContext);
        }
        if ((action.equals("android.intent.action.BOOT_COMPLETED") || action.equals("android.intent.action.MY_PACKAGE_REPLACED")) && R$style.getInjector().getPreferences(applicationContext).getWallpaperPresentationMode() == 2) {
            DiskBasedLogger.e("GoogleAlarmInitializer", "Wallpaper rotation is in effect, setting an alarm for Backdrop rotation", applicationContext);
            GoogleWallpaperPreferences preferences = R$style.getInjector().getPreferences(applicationContext);
            long lastDailyRotationTimestamp = preferences.getLastDailyRotationTimestamp();
            Calendar calendar = Calendar.getInstance();
            calendar.set(10, 0);
            calendar.set(12, 0);
            calendar.set(9, 0);
            long timeInMillis = calendar.getTimeInMillis();
            long dailyWallpaperEnabledTimestamp = preferences.getDailyWallpaperEnabledTimestamp();
            if (lastDailyRotationTimestamp >= timeInMillis || dailyWallpaperEnabledTimestamp >= timeInMillis) {
                Log.e("GoogleAlarmInitializer", "Set overnight alarm.");
                BackdropAlarmScheduler.setOvernightAlarm(applicationContext);
                return;
            }
            DiskBasedLogger.e("GoogleAlarmInitializer", "Set immediate alarm to update wallpaper since wallpaper should have been updated overnight but didn't.", applicationContext);
            DefaultAlarmManagerWrapper alarmManagerWrapper = R$style.getInjector().getAlarmManagerWrapper(applicationContext);
            PendingIntent broadcast = PendingIntent.getBroadcast(applicationContext, 0, new Intent(applicationContext, BackdropAlarmReceiver.class), 67108864);
            long convert = TimeUnit.MILLISECONDS.convert(1L, TimeUnit.HOURS);
            alarmManagerWrapper.mAlarmManager.setWindow(2, SystemClock.elapsedRealtime(), convert, broadcast);
        }
    }
}
