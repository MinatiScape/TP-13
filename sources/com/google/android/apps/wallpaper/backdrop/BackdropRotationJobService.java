package com.google.android.apps.wallpaper.backdrop;

import android.app.job.JobParameters;
import android.app.job.JobService;
import android.content.Context;
import android.util.Log;
import androidx.cardview.R$style;
import com.android.wallpaper.model.WallpaperMetadata;
import com.android.wallpaper.module.DefaultWallpaperRefresher;
import com.android.wallpaper.module.WallpaperRefresher;
import com.google.android.apps.wallpaper.backdrop.BackdropWallpaperRotator;
import java.util.Calendar;
/* loaded from: classes.dex */
public class BackdropRotationJobService extends JobService {
    public static final /* synthetic */ int $r8$clinit = 0;

    @Override // android.app.job.JobService
    public final boolean onStopJob(JobParameters jobParameters) {
        return false;
    }

    @Override // android.app.job.JobService
    public final boolean onStartJob(final JobParameters jobParameters) {
        final Context applicationContext = getApplicationContext();
        WallpaperRefresher wallpaperRefresher = R$style.getInjector().getWallpaperRefresher(applicationContext);
        WallpaperRefresher.RefreshListener refreshListener = new WallpaperRefresher.RefreshListener() { // from class: com.google.android.apps.wallpaper.backdrop.BackdropRotationJobService.1
            @Override // com.android.wallpaper.module.WallpaperRefresher.RefreshListener
            public final void onRefreshed(WallpaperMetadata wallpaperMetadata, WallpaperMetadata wallpaperMetadata2, int i) {
                if (i == 1) {
                    Log.e("BackdropRotationJob", "Wallpaper presentation mode is static, cutting task short.");
                    BackdropRotationJobService.this.jobFinished(jobParameters, false);
                    return;
                }
                final BackdropRotationJobService backdropRotationJobService = BackdropRotationJobService.this;
                final Context context = applicationContext;
                final JobParameters jobParameters2 = jobParameters;
                int i2 = BackdropRotationJobService.$r8$clinit;
                backdropRotationJobService.getClass();
                final BackdropPreferences backdropPreferences = BackdropPreferences.getInstance(context);
                BackdropWallpaperRotator.updateWallpaper(context, backdropPreferences.mSharedPrefs.getString("collection_id", null), backdropPreferences.mSharedPrefs.getString("collection_name", null), backdropPreferences.mSharedPrefs.getString("resume_token", null), new BackdropWallpaperRotator.RotationListener() { // from class: com.google.android.apps.wallpaper.backdrop.BackdropRotationJobService.2
                    @Override // com.google.android.apps.wallpaper.backdrop.BackdropWallpaperRotator.RotationListener
                    public final void onError() {
                        Log.e("BackdropRotationJob", "Updating the Backdrop wallpaper failed, rescheduling for later.");
                        R$style.getInjector().getPreferences(context).setDailyWallpaperRotationStatus(5, Calendar.getInstance().getTimeInMillis());
                        BackdropRotationJobService.this.jobFinished(jobParameters2, true);
                    }

                    @Override // com.google.android.apps.wallpaper.backdrop.BackdropWallpaperRotator.RotationListener
                    public final void onSuccess(String str) {
                        if (jobParameters2.getJobId() == 1) {
                            Log.e("BackdropRotationJob", "Snoozing the Backdrop alarm since this is a periodic task.");
                            BackdropAlarmScheduler.snoozeAlarm(context);
                        }
                        Calendar calendar = Calendar.getInstance();
                        R$style.getInjector().getPreferences(context).addDailyRotation(calendar.getTimeInMillis());
                        R$style.getInjector().getUserEventLogger(context).logDailyWallpaperRotationHour(calendar.get(11));
                        backdropPreferences.mSharedPrefs.edit().putString("resume_token", str).apply();
                        R$style.getInjector().getPreferences(context).setDailyWallpaperRotationStatus(4, Calendar.getInstance().getTimeInMillis());
                        BackdropRotationJobService.this.jobFinished(jobParameters2, false);
                    }
                });
            }
        };
        DefaultWallpaperRefresher defaultWallpaperRefresher = (DefaultWallpaperRefresher) wallpaperRefresher;
        defaultWallpaperRefresher.getClass();
        new DefaultWallpaperRefresher.GetWallpaperMetadataAsyncTask(refreshListener).execute(new Void[0]);
        return true;
    }
}
