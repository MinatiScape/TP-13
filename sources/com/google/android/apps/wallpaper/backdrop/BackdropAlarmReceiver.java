package com.google.android.apps.wallpaper.backdrop;

import android.app.job.JobInfo;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.util.Log;
import com.android.wallpaper.module.InjectorProvider;
import com.android.wallpaper.util.DiskBasedLogger;
import java.util.Calendar;
import java.util.Objects;
/* loaded from: classes.dex */
public class BackdropAlarmReceiver extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        Context applicationContext = context.getApplicationContext();
        DiskBasedLogger.e("BackdropAlarmReceiver", "Backdrop alarm received", applicationContext);
        if (1 == InjectorProvider.getInjector().getPreferences(applicationContext).getWallpaperPresentationMode()) {
            DiskBasedLogger.e("BackdropAlarmReceiver", "Wallpaper presentation mode has reverted to STATIC, returning early and not setting any future jobs or alarms", applicationContext);
            return;
        }
        int i = BackdropPreferences.getInstance(applicationContext).mSharedPrefs.getInt("required_network_state", 1);
        BackdropTaskScheduler backdropTaskScheduler = BackdropTaskScheduler.getInstance(applicationContext);
        JobSchedulerBackdropTaskScheduler jobSchedulerBackdropTaskScheduler = (JobSchedulerBackdropTaskScheduler) backdropTaskScheduler;
        Objects.requireNonNull(jobSchedulerBackdropTaskScheduler);
        JobInfo build = new JobInfo.Builder(1, new ComponentName(jobSchedulerBackdropTaskScheduler.mAppContext, BackdropRotationJobService.class)).setPeriodic(JobSchedulerBackdropTaskScheduler.ONE_DAY_IN_MILLIS, JobSchedulerBackdropTaskScheduler.ONE_HOUR_IN_MILLIS).setPersisted(true).setRequiredNetworkType(JobSchedulerBackdropTaskScheduler.mapNetworkPreferenceToRequiredNetworkType(i)).build();
        if (jobSchedulerBackdropTaskScheduler.mJobScheduler.schedule(build) == 0) {
            Log.e("JSTaskScheduler", "Unable to schedule JobScheduler periodic job: " + build);
        }
        backdropTaskScheduler.scheduleOneOffTask(i, 3);
        BackdropAlarmScheduler.setOvernightAlarm(applicationContext);
        boolean z = false;
        boolean z2 = i != 1;
        ConnectivityManager connectivityManager = (ConnectivityManager) applicationContext.getSystemService("connectivity");
        boolean isActiveNetworkMetered = connectivityManager == null ? true : connectivityManager.isActiveNetworkMetered();
        if (z2 || !isActiveNetworkMetered) {
            z = true;
        }
        if (!z) {
            DiskBasedLogger.e("BackdropAlarmReceiver", "Network conditions not met, persisting this information to SharedPreferences.", applicationContext);
            InjectorProvider.getInjector().getPreferences(applicationContext).setDailyWallpaperRotationStatus(1, Calendar.getInstance().getTimeInMillis());
        }
    }
}
