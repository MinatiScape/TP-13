package com.google.android.apps.wallpaper.backdrop;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.SystemClock;
import androidx.lifecycle.MethodCallsLogger;
import com.android.wallpaper.module.InjectorProvider;
import com.android.wallpaper.util.DiskBasedLogger;
import java.util.Calendar;
import java.util.Date;
/* loaded from: classes.dex */
public class BackdropAlarmScheduler {
    public static PendingIntent createBackdropAlarmReceiverPendingIntent(Context context) {
        return PendingIntent.getBroadcast(context, 0, new Intent(context, BackdropAlarmReceiver.class), 67108864);
    }

    public static void setOvernightAlarm(Context context) {
        MethodCallsLogger alarmManagerWrapper = InjectorProvider.getInjector().getAlarmManagerWrapper(context);
        PendingIntent createBackdropAlarmReceiverPendingIntent = createBackdropAlarmReceiverPendingIntent(context);
        Date date = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(5, 1);
        calendar.set(9, 0);
        calendar.set(10, 2);
        calendar.set(12, 0);
        long time = calendar.getTime().getTime() - date.getTime();
        Calendar calendar2 = Calendar.getInstance();
        calendar2.setTime(date);
        calendar2.add(5, 1);
        calendar2.set(9, 0);
        calendar2.set(10, 3);
        calendar2.set(12, 30);
        long random = time + ((long) (Math.random() * ((calendar2.getTime().getTime() - date.getTime()) - time)));
        Date date2 = new Date();
        Calendar calendar3 = Calendar.getInstance();
        calendar3.setTime(date2);
        calendar3.add(5, 1);
        calendar3.set(9, 0);
        calendar3.set(10, 5);
        calendar3.set(12, 0);
        DiskBasedLogger.e("BackdropAlarmScheduler", "Setting a new alarm to run " + random + "ms from now", context);
        long elapsedRealtime = SystemClock.elapsedRealtime() + random;
        ((AlarmManager) alarmManagerWrapper.mCalledMethods).setWindow(2, elapsedRealtime, (calendar3.getTime().getTime() - date2.getTime()) - random, createBackdropAlarmReceiverPendingIntent);
    }

    public static void snoozeAlarm(Context context) {
        MethodCallsLogger alarmManagerWrapper = InjectorProvider.getInjector().getAlarmManagerWrapper(context);
        ((AlarmManager) alarmManagerWrapper.mCalledMethods).cancel(createBackdropAlarmReceiverPendingIntent(context));
        setOvernightAlarm(context);
    }
}
