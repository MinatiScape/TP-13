package com.google.android.apps.wallpaper.backdrop;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.SystemClock;
import androidx.cardview.R$style;
import com.android.wallpaper.module.DefaultAlarmManagerWrapper;
import com.android.wallpaper.util.DiskBasedLogger;
import java.util.Calendar;
import java.util.Date;
/* loaded from: classes.dex */
public final class BackdropAlarmScheduler {
    public static void setOvernightAlarm(Context context) {
        DefaultAlarmManagerWrapper alarmManagerWrapper = R$style.getInjector().getAlarmManagerWrapper(context);
        PendingIntent broadcast = PendingIntent.getBroadcast(context, 0, new Intent(context, BackdropAlarmReceiver.class), 67108864);
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
        long time2 = time + ((long) (((calendar2.getTime().getTime() - date.getTime()) - time) * Math.random()));
        Date date2 = new Date();
        Calendar calendar3 = Calendar.getInstance();
        calendar3.setTime(date2);
        calendar3.add(5, 1);
        calendar3.set(9, 0);
        calendar3.set(10, 5);
        calendar3.set(12, 0);
        DiskBasedLogger.e("BackdropAlarmScheduler", "Setting a new alarm to run " + time2 + "ms from now", context);
        long elapsedRealtime = SystemClock.elapsedRealtime() + time2;
        alarmManagerWrapper.mAlarmManager.setWindow(2, elapsedRealtime, (calendar3.getTime().getTime() - date2.getTime()) - time2, broadcast);
    }

    public static void snoozeAlarm(Context context) {
        DefaultAlarmManagerWrapper alarmManagerWrapper = R$style.getInjector().getAlarmManagerWrapper(context);
        alarmManagerWrapper.mAlarmManager.cancel(PendingIntent.getBroadcast(context, 0, new Intent(context, BackdropAlarmReceiver.class), 67108864));
        setOvernightAlarm(context);
    }
}
