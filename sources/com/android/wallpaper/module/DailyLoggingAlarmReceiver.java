package com.android.wallpaper.module;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Handler;
import android.os.PowerManager;
import android.util.Log;
import androidx.cardview.R$style;
import com.android.wallpaper.model.WallpaperMetadata;
import com.android.wallpaper.module.DefaultWallpaperRefresher;
import com.android.wallpaper.module.WallpaperRefresher;
import com.android.wallpaper.util.DiskBasedLogger;
import com.android.wallpaper.util.DiskBasedLogger$$ExternalSyntheticLambda0;
import com.google.android.apps.wallpaper.module.CompositeUserEventLogger;
import com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences;
import java.text.SimpleDateFormat;
import java.util.Calendar;
/* loaded from: classes.dex */
public class DailyLoggingAlarmReceiver extends BroadcastReceiver {
    public static final /* synthetic */ int $r8$clinit = 0;

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        final Context applicationContext = context.getApplicationContext();
        Injector injector = R$style.getInjector();
        CompositeUserEventLogger userEventLogger = injector.getUserEventLogger(applicationContext);
        GoogleWallpaperPreferences preferences = injector.getPreferences(applicationContext);
        userEventLogger.logNumDailyWallpaperRotationsInLastWeek();
        userEventLogger.logNumDailyWallpaperRotationsPreviousDay();
        userEventLogger.logWallpaperPresentationMode();
        userEventLogger.logSnapshot();
        preferences.setLastDailyLogTimestamp(System.currentTimeMillis());
        final PowerManager.WakeLock newWakeLock = ((PowerManager) applicationContext.getSystemService("power")).newWakeLock(1, "DailyLoggingAlarm");
        newWakeLock.acquire(10000L);
        final Injector injector2 = R$style.getInjector();
        WallpaperRefresher wallpaperRefresher = injector2.getWallpaperRefresher(applicationContext);
        WallpaperRefresher.RefreshListener refreshListener = new WallpaperRefresher.RefreshListener() { // from class: com.android.wallpaper.module.DailyLoggingAlarmReceiver.1
            @Override // com.android.wallpaper.module.WallpaperRefresher.RefreshListener
            public final void onRefreshed(WallpaperMetadata wallpaperMetadata, WallpaperMetadata wallpaperMetadata2, int i) {
                if (i == 2) {
                    GoogleWallpaperPreferences preferences2 = injector2.getPreferences(applicationContext);
                    long dailyWallpaperEnabledTimestamp = preferences2.getDailyWallpaperEnabledTimestamp();
                    if (dailyWallpaperEnabledTimestamp < 0) {
                        Log.e("DailyLoggingAlarm", "There's no valid daily wallpaper enabled timestamp");
                        PowerManager.WakeLock wakeLock = newWakeLock;
                        int i2 = DailyLoggingAlarmReceiver.$r8$clinit;
                        if (wakeLock.isHeld()) {
                            wakeLock.release();
                            return;
                        }
                        return;
                    }
                    Calendar calendar = Calendar.getInstance();
                    calendar.add(5, -1);
                    calendar.set(11, 0);
                    calendar.set(12, 0);
                    if (dailyWallpaperEnabledTimestamp > calendar.getTimeInMillis()) {
                        PowerManager.WakeLock wakeLock2 = newWakeLock;
                        int i3 = DailyLoggingAlarmReceiver.$r8$clinit;
                        if (wakeLock2.isHeld()) {
                            wakeLock2.release();
                            return;
                        }
                        return;
                    }
                    try {
                        long dailyWallpaperLastRotationStatusTimestamp = preferences2.getDailyWallpaperLastRotationStatusTimestamp();
                        CompositeUserEventLogger userEventLogger2 = injector2.getUserEventLogger(applicationContext);
                        if (dailyWallpaperLastRotationStatusTimestamp > calendar.getTimeInMillis()) {
                            int dailyWallpaperLastRotationStatus = preferences2.getDailyWallpaperLastRotationStatus();
                            userEventLogger2.logDailyWallpaperRotationStatus(dailyWallpaperLastRotationStatus);
                            if (5 == dailyWallpaperLastRotationStatus) {
                                preferences2.incrementNumDaysDailyRotationFailed();
                                userEventLogger2.logNumDaysDailyRotationFailed(preferences2.getNumDaysDailyRotationFailed());
                            } else {
                                preferences2.resetNumDaysDailyRotationFailed();
                            }
                            preferences2.resetNumDaysDailyRotationNotAttempted();
                        } else {
                            userEventLogger2.logDailyWallpaperRotationStatus(0);
                            preferences2.incrementNumDaysDailyRotationNotAttempted();
                            userEventLogger2.logNumDaysDailyRotationNotAttempted(preferences2.getNumDaysDailyRotationNotAttempted());
                            preferences2.resetNumDaysDailyRotationFailed();
                        }
                        PowerManager.WakeLock wakeLock3 = newWakeLock;
                        int i4 = DailyLoggingAlarmReceiver.$r8$clinit;
                        if (wakeLock3.isHeld()) {
                            wakeLock3.release();
                        }
                    } finally {
                        PowerManager.WakeLock wakeLock4 = newWakeLock;
                        int i5 = DailyLoggingAlarmReceiver.$r8$clinit;
                        if (wakeLock4.isHeld()) {
                            wakeLock4.release();
                        }
                    }
                }
            }
        };
        DefaultWallpaperRefresher defaultWallpaperRefresher = (DefaultWallpaperRefresher) wallpaperRefresher;
        defaultWallpaperRefresher.getClass();
        new DefaultWallpaperRefresher.GetWallpaperMetadataAsyncTask(refreshListener).execute(new Void[0]);
        SimpleDateFormat simpleDateFormat = DiskBasedLogger.DATE_FORMAT;
        String str = Build.TYPE;
        if (str.equals("eng") || str.equals("userdebug")) {
            Handler loggerThreadHandler = DiskBasedLogger.getLoggerThreadHandler();
            if (loggerThreadHandler == null) {
                Log.e("DiskBasedLogger", "Something went wrong creating the logger thread handler, quitting this logging operation");
            } else {
                loggerThreadHandler.post(new DiskBasedLogger$$ExternalSyntheticLambda0(applicationContext, 0));
            }
        }
    }
}
