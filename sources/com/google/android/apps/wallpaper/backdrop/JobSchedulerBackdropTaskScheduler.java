package com.google.android.apps.wallpaper.backdrop;

import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.ComponentName;
import android.content.Context;
import android.util.Log;
import androidx.transition.PathMotion;
import java.util.concurrent.TimeUnit;
/* loaded from: classes.dex */
public final class JobSchedulerBackdropTaskScheduler extends PathMotion {
    public static final long ONE_DAY_IN_MILLIS;
    public static final long ONE_HOUR_IN_MILLIS;
    public Context mAppContext;
    public JobScheduler mJobScheduler;

    public static int mapNetworkPreferenceToRequiredNetworkType(int i) {
        if (i == 0) {
            return 1;
        }
        if (i == 1) {
            return 2;
        }
        Log.e("JSTaskScheduler", "Unsupported network preference value: " + i);
        return 1;
    }

    static {
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        ONE_DAY_IN_MILLIS = timeUnit.convert(1L, TimeUnit.DAYS);
        ONE_HOUR_IN_MILLIS = timeUnit.convert(1L, TimeUnit.HOURS);
    }

    public final void scheduleOneOffTask(int i, int i2) {
        JobInfo.Builder builder = new JobInfo.Builder(0, new ComponentName(this.mAppContext, BackdropRotationJobService.class));
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        TimeUnit timeUnit2 = TimeUnit.MINUTES;
        JobInfo build = builder.setMinimumLatency(timeUnit.convert(i2, timeUnit2)).setOverrideDeadline(timeUnit.convert(i2 + 1, timeUnit2)).setPersisted(true).setRequiredNetworkType(mapNetworkPreferenceToRequiredNetworkType(i)).build();
        if (this.mJobScheduler.schedule(build) == 0) {
            Log.e("JSTaskScheduler", "Unable to schedule JobScheduler one-off job: " + build);
        }
    }

    public JobSchedulerBackdropTaskScheduler(Context context) {
        this.mAppContext = context;
        this.mJobScheduler = (JobScheduler) context.getSystemService("jobscheduler");
    }
}
