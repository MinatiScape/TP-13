package com.android.wallpaper.module;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import androidx.lifecycle.MethodCallsLogger;
import java.util.Calendar;
import java.util.concurrent.TimeUnit;
/* loaded from: classes.dex */
public class DailyLoggingAlarmScheduler {
    public static void setAlarm(Context context) {
        long j;
        Injector injector = InjectorProvider.getInjector();
        MethodCallsLogger alarmManagerWrapper = injector.getAlarmManagerWrapper(context);
        long lastDailyLogTimestamp = injector.getPreferences(context).getLastDailyLogTimestamp();
        Calendar calendar = Calendar.getInstance();
        long currentTimeMillis = System.currentTimeMillis();
        calendar.setTimeInMillis(currentTimeMillis);
        calendar.add(6, -1);
        if (lastDailyLogTimestamp == -1 || lastDailyLogTimestamp < calendar.getTimeInMillis()) {
            Calendar calendar2 = Calendar.getInstance();
            calendar2.setTimeInMillis(currentTimeMillis);
            calendar2.add(12, 1);
            j = calendar2.getTimeInMillis();
        } else {
            Calendar calendar3 = Calendar.getInstance();
            calendar3.setTimeInMillis(lastDailyLogTimestamp);
            calendar3.add(6, 1);
            j = calendar3.getTimeInMillis();
        }
        ((AlarmManager) alarmManagerWrapper.mCalledMethods).cancel(PendingIntent.getBroadcast(context, 0, new Intent(context, DailyLoggingAlarmReceiver.class), 67108864));
        PendingIntent broadcast = PendingIntent.getBroadcast(context, 0, new Intent(context, DailyLoggingAlarmReceiver.class), 67108864);
        long convert = TimeUnit.MILLISECONDS.convert(24L, TimeUnit.HOURS);
        ((AlarmManager) alarmManagerWrapper.mCalledMethods).setInexactRepeating(1, j, convert, broadcast);
    }
}
