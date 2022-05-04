package com.google.android.apps.wallpaper.backdrop;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.pm.ServiceInfo;
import android.text.TextUtils;
import android.util.Log;
import androidx.appcompat.view.SupportMenuInflater$$ExternalSyntheticOutline0;
import androidx.cardview.R$style;
import com.adobe.xmp.impl.XMPNode$$ExternalSyntheticOutline0;
import com.android.systemui.shared.R;
import com.android.wallpaper.model.WallpaperMetadata;
import com.android.wallpaper.module.DefaultWallpaperRefresher;
import com.android.wallpaper.module.WallpaperRefresher;
import com.android.wallpaper.util.DiskBasedLogger;
import com.android.wallpaper.util.LaunchUtils;
import com.google.android.apps.wallpaper.backdrop.BackdropWallpaperRotator;
import com.google.android.gms.gcm.GcmNetworkManager;
import com.google.android.gms.gcm.GcmTaskService;
import com.google.android.gms.gcm.TaskParams;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
/* loaded from: classes.dex */
public class BackdropRotationTask extends GcmTaskService {
    public static final /* synthetic */ int $r8$clinit = 0;

    /* loaded from: classes.dex */
    public static class TaskResultCallable implements Callable<Integer> {
        public int taskResult;

        @Override // java.util.concurrent.Callable
        public final Integer call() throws Exception {
            return Integer.valueOf(this.taskResult);
        }
    }

    @Override // com.google.android.gms.gcm.GcmTaskService
    public final int onRunTask(TaskParams taskParams) {
        final DefaultGcmNetworkManagerWrapper defaultGcmNetworkManagerWrapper;
        final Context applicationContext = getApplicationContext();
        final String str = taskParams.zza;
        DiskBasedLogger.e("BackdropRotationTask", "Task run with tag: " + str, applicationContext);
        synchronized (DefaultGcmNetworkManagerWrapper.sInstanceLock) {
            if (DefaultGcmNetworkManagerWrapper.sInstance == null) {
                DefaultGcmNetworkManagerWrapper.sInstance = new DefaultGcmNetworkManagerWrapper(applicationContext.getApplicationContext());
            }
            defaultGcmNetworkManagerWrapper = DefaultGcmNetworkManagerWrapper.sInstance;
        }
        final TaskResultCallable taskResultCallable = new TaskResultCallable();
        final FutureTask futureTask = new FutureTask(taskResultCallable);
        WallpaperRefresher wallpaperRefresher = R$style.getInjector().getWallpaperRefresher(applicationContext);
        WallpaperRefresher.RefreshListener refreshListener = new WallpaperRefresher.RefreshListener() { // from class: com.google.android.apps.wallpaper.backdrop.BackdropRotationTask.2
            @Override // com.android.wallpaper.module.WallpaperRefresher.RefreshListener
            public final void onRefreshed(WallpaperMetadata wallpaperMetadata, WallpaperMetadata wallpaperMetadata2, int i) {
                GcmNetworkManager gcmNetworkManager;
                List<ResolveInfo> list;
                boolean z = true;
                if (i == 1) {
                    DiskBasedLogger.e("BackdropRotationTask", "Wallpaper presentation mode is static, cutting task short.", applicationContext);
                    DefaultGcmNetworkManagerWrapper defaultGcmNetworkManagerWrapper2 = defaultGcmNetworkManagerWrapper;
                    String str2 = str;
                    Context context = defaultGcmNetworkManagerWrapper2.mAppContext;
                    synchronized (GcmNetworkManager.class) {
                        if (GcmNetworkManager.zza == null) {
                            GcmNetworkManager.zza = new GcmNetworkManager(context.getApplicationContext());
                        }
                        gcmNetworkManager = GcmNetworkManager.zza;
                    }
                    gcmNetworkManager.getClass();
                    ComponentName componentName = new ComponentName(gcmNetworkManager.zzb, BackdropRotationTask.class);
                    if (TextUtils.isEmpty(str2)) {
                        throw new IllegalArgumentException("Must provide a valid tag.");
                    } else if (100 >= str2.length()) {
                        String className = componentName.getClassName();
                        LaunchUtils.zza(className, "GcmTaskService must not be null.");
                        PackageManager packageManager = gcmNetworkManager.zzb.getPackageManager();
                        if (packageManager == null) {
                            list = Collections.emptyList();
                        } else {
                            list = packageManager.queryIntentServices(new Intent("com.google.android.gms.gcm.ACTION_TASK_READY").setClassName(gcmNetworkManager.zzb, className), 0);
                        }
                        if (list != null) {
                            z = list.isEmpty();
                        }
                        if (z) {
                            Log.e("GcmNetworkManager", className.concat(" is not available. This may cause the task to be lost."));
                        } else {
                            for (ResolveInfo resolveInfo : list) {
                                ServiceInfo serviceInfo = resolveInfo.serviceInfo;
                                if (serviceInfo == null || !serviceInfo.enabled) {
                                }
                            }
                            throw new IllegalArgumentException(XMPNode$$ExternalSyntheticOutline0.m(className.length() + R.styleable.AppCompatTheme_windowActionBarOverlay, "The GcmTaskService class you provided ", className, " does not seem to support receiving com.google.android.gms.gcm.ACTION_TASK_READY"));
                        }
                        Intent zza = gcmNetworkManager.zza();
                        if (zza != null) {
                            zza.putExtra("scheduler_action", "CANCEL_TASK");
                            zza.putExtra("tag", str2);
                            zza.putExtra("component", componentName);
                            gcmNetworkManager.zzb.sendBroadcast(zza);
                        }
                        taskResultCallable.taskResult = 2;
                        futureTask.run();
                    } else {
                        throw new IllegalArgumentException("Tag is larger than max permissible tag length (100)");
                    }
                } else {
                    final Context context2 = applicationContext;
                    final String str3 = str;
                    final TaskResultCallable taskResultCallable2 = taskResultCallable;
                    final FutureTask futureTask2 = futureTask;
                    int i2 = BackdropRotationTask.$r8$clinit;
                    final BackdropPreferences backdropPreferences = BackdropPreferences.getInstance(context2);
                    BackdropWallpaperRotator.updateWallpaper(context2, backdropPreferences.mSharedPrefs.getString("collection_id", null), backdropPreferences.mSharedPrefs.getString("collection_name", null), backdropPreferences.mSharedPrefs.getString("resume_token", null), new BackdropWallpaperRotator.RotationListener() { // from class: com.google.android.apps.wallpaper.backdrop.BackdropRotationTask.1
                        @Override // com.google.android.apps.wallpaper.backdrop.BackdropWallpaperRotator.RotationListener
                        public final void onError() {
                            DiskBasedLogger.e("BackdropRotationTask", "Fetching and setting the next wallpaper failed.", context2);
                            R$style.getInjector().getPreferences(context2).setDailyWallpaperRotationStatus(5, Calendar.getInstance().getTimeInMillis());
                            taskResultCallable2.taskResult = 1;
                            futureTask2.run();
                        }

                        @Override // com.google.android.apps.wallpaper.backdrop.BackdropWallpaperRotator.RotationListener
                        public final void onSuccess(String str4) {
                            DiskBasedLogger.e("BackdropRotationTask", SupportMenuInflater$$ExternalSyntheticOutline0.m("Fetching and setting the next wallpaper succeeded with resumeToken: ", str4), context2);
                            if (str3.equals("backdrop_rotation_task_periodic")) {
                                DiskBasedLogger.e("BackdropRotationTask", "Snoozing the Backdrop alarm since this is a periodic task.", context2);
                                BackdropAlarmScheduler.snoozeAlarm(context2);
                            }
                            Calendar calendar = Calendar.getInstance();
                            R$style.getInjector().getPreferences(context2).addDailyRotation(calendar.getTimeInMillis());
                            R$style.getInjector().getUserEventLogger(context2).logDailyWallpaperRotationHour(calendar.get(11));
                            R$style.getInjector().getPreferences(context2).setDailyWallpaperRotationStatus(3, Calendar.getInstance().getTimeInMillis());
                            backdropPreferences.mSharedPrefs.edit().putString("resume_token", str4).apply();
                            taskResultCallable2.taskResult = 0;
                            futureTask2.run();
                        }
                    });
                }
            }
        };
        DefaultWallpaperRefresher defaultWallpaperRefresher = (DefaultWallpaperRefresher) wallpaperRefresher;
        defaultWallpaperRefresher.getClass();
        new DefaultWallpaperRefresher.GetWallpaperMetadataAsyncTask(refreshListener).execute(new Void[0]);
        try {
            return ((Integer) futureTask.get(2L, TimeUnit.MINUTES)).intValue();
        } catch (InterruptedException e) {
            DiskBasedLogger.e("BackdropRotationTask", "Interrupted while updating wallpaper: " + e, applicationContext);
            return 1;
        } catch (ExecutionException e2) {
            DiskBasedLogger.e("BackdropRotationTask", "Execution error while updating wallpaper: " + e2, applicationContext);
            return 1;
        } catch (TimeoutException e3) {
            DiskBasedLogger.e("BackdropRotationTask", "Timed out updating wallpaper with max timeout of 2 minutes: " + e3, applicationContext);
            return 1;
        }
    }
}
