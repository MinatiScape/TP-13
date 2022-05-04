package com.google.android.apps.wallpaper.backdrop;

import android.app.job.JobInfo;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.util.Log;
import androidx.cardview.R$style;
import androidx.transition.PathMotion;
import com.android.wallpaper.util.DiskBasedLogger;
import java.util.Calendar;
/* loaded from: classes.dex */
public class BackdropAlarmReceiver extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        boolean z;
        boolean z2;
        Context applicationContext = context.getApplicationContext();
        DiskBasedLogger.e("BackdropAlarmReceiver", "Backdrop alarm received", applicationContext);
        if (1 == R$style.getInjector().getPreferences(applicationContext).getWallpaperPresentationMode()) {
            DiskBasedLogger.e("BackdropAlarmReceiver", "Wallpaper presentation mode has reverted to STATIC, returning early and not setting any future jobs or alarms", applicationContext);
            return;
        }
        int i = BackdropPreferences.getInstance(applicationContext).mSharedPrefs.getInt("required_network_state", 1);
        if (PathMotion.sInstance == null) {
            PathMotion.sInstance = new JobSchedulerBackdropTaskScheduler(applicationContext);
        }
        JobSchedulerBackdropTaskScheduler jobSchedulerBackdropTaskScheduler = PathMotion.sInstance;
        jobSchedulerBackdropTaskScheduler.getClass();
        JobInfo build = new JobInfo.Builder(1, new ComponentName(jobSchedulerBackdropTaskScheduler.mAppContext, BackdropRotationJobService.class)).setPeriodic(JobSchedulerBackdropTaskScheduler.ONE_DAY_IN_MILLIS, JobSchedulerBackdropTaskScheduler.ONE_HOUR_IN_MILLIS).setPersisted(true).setRequiredNetworkType(JobSchedulerBackdropTaskScheduler.mapNetworkPreferenceToRequiredNetworkType(i)).build();
        if (jobSchedulerBackdropTaskScheduler.mJobScheduler.schedule(build) == 0) {
            Log.e("JSTaskScheduler", "Unable to schedule JobScheduler periodic job: " + build);
        }
        jobSchedulerBackdropTaskScheduler.scheduleOneOffTask(i, 3);
        BackdropAlarmScheduler.setOvernightAlarm(applicationContext);
        boolean z3 = false;
        if (i != 1) {
            z = true;
        } else {
            z = false;
        }
        ConnectivityManager connectivityManager = (ConnectivityManager) applicationContext.getSystemService("connectivity");
        if (connectivityManager == null) {
            z2 = true;
        } else {
            z2 = connectivityManager.isActiveNetworkMetered();
        }
        if (z || !z2) {
            z3 = true;
        }
        if (!z3) {
            DiskBasedLogger.e("BackdropAlarmReceiver", "Network conditions not met, persisting this information to SharedPreferences.", applicationContext);
            R$style.getInjector().getPreferences(applicationContext).setDailyWallpaperRotationStatus(1, Calendar.getInstance().getTimeInMillis());
        }
    }
}
