package com.google.android.gms.gcm;

import android.annotation.TargetApi;
import android.app.AppOpsManager;
import android.app.Service;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import android.os.Message;
import android.os.Messenger;
import android.os.Parcelable;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Log;
import androidx.appcompat.view.SupportMenuInflater$$ExternalSyntheticOutline0;
import androidx.viewpager2.widget.FakeDrag;
import com.android.wallpaper.model.WallpaperMetadata;
import com.android.wallpaper.module.DefaultWallpaperRefresher;
import com.android.wallpaper.module.InjectorProvider;
import com.android.wallpaper.module.WallpaperRefresher;
import com.android.wallpaper.util.DiskBasedLogger;
import com.google.android.apps.wallpaper.backdrop.BackdropRotationTask;
import com.google.android.apps.wallpaper.backdrop.BackdropWallpaperRotator;
import com.google.android.apps.wallpaper.backdrop.DefaultGcmNetworkManagerWrapper;
import com.google.android.gms.gcm.INetworkTaskCallback;
import com.google.android.gms.internal.zzbmj;
import com.google.android.gms.internal.zzbmk;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.FutureTask;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
/* loaded from: classes.dex */
public abstract class GcmTaskService extends Service {
    public final Object zza = new Object();
    public int zzb;
    public ExecutorService zzc;
    public Messenger zzd;
    public ComponentName zze;
    public FakeDrag zzf;

    @TargetApi(21)
    /* loaded from: classes.dex */
    public class zza extends Handler {
        public zza(Looper looper) {
            super(looper);
        }

        @Override // android.os.Handler
        public final void handleMessage(Message message) {
            boolean z;
            Messenger messenger;
            GcmTaskService gcmTaskService = GcmTaskService.this;
            int i = message.sendingUid;
            zzbmj zza = zzbmk.zza(gcmTaskService);
            Objects.requireNonNull(zza);
            try {
                ((AppOpsManager) zza.zza.getSystemService("appops")).checkPackage(i, "com.google.android.gms");
                z = true;
            } catch (SecurityException unused) {
                z = false;
            }
            if (!z) {
                Log.e("GcmTaskService", "unable to verify presence of Google Play Services");
                return;
            }
            int i2 = message.what;
            if (i2 == 1) {
                Bundle data = message.getData();
                if (!data.isEmpty() && (messenger = message.replyTo) != null) {
                    String string = data.getString("tag");
                    ArrayList parcelableArrayList = data.getParcelableArrayList("triggered_uris");
                    if (!GcmTaskService.this.zza(string)) {
                        Bundle bundle = data.getBundle("extras");
                        GcmTaskService gcmTaskService2 = GcmTaskService.this;
                        zzb zzbVar = new zzb(string, messenger, bundle, parcelableArrayList);
                        Objects.requireNonNull(gcmTaskService2);
                        try {
                            gcmTaskService2.zzc.execute(zzbVar);
                        } catch (RejectedExecutionException e) {
                            Log.e("GcmTaskService", "Executor is shutdown. onDestroy was called but main looper had an unprocessed start task message. The task will be retried with backoff delay.", e);
                            zzbVar.zza(1);
                        }
                    }
                }
            } else if (i2 != 2) {
                if (i2 != 4) {
                    String valueOf = String.valueOf(message);
                    StringBuilder sb = new StringBuilder(valueOf.length() + 31);
                    sb.append("Unrecognized message received: ");
                    sb.append(valueOf);
                    Log.e("GcmTaskService", sb.toString());
                    return;
                }
                Objects.requireNonNull(GcmTaskService.this);
            } else if (Log.isLoggable("GcmTaskService", 3)) {
                String valueOf2 = String.valueOf(message);
                StringBuilder sb2 = new StringBuilder(valueOf2.length() + 45);
                sb2.append("ignoring unimplemented stop message for now: ");
                sb2.append(valueOf2);
                Log.d("GcmTaskService", sb2.toString());
            }
        }
    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        if (intent == null || !"com.google.android.gms.gcm.ACTION_TASK_READY".equals(intent.getAction())) {
            return null;
        }
        return this.zzd.getBinder();
    }

    @Override // android.app.Service
    public void onCreate() {
        super.onCreate();
        this.zzf = FakeDrag.getInstance(this);
        this.zzc = Executors.newFixedThreadPool(2, new com.google.android.gms.gcm.zzb());
        this.zzd = new Messenger(new zza(Looper.getMainLooper()));
        this.zze = new ComponentName(this, getClass());
    }

    @Override // android.app.Service
    public void onDestroy() {
        super.onDestroy();
        List<Runnable> shutdownNow = this.zzc.shutdownNow();
        if (!shutdownNow.isEmpty()) {
            int size = shutdownNow.size();
            StringBuilder sb = new StringBuilder(79);
            sb.append("Shutting down, but not all tasks are finished executing. Remaining: ");
            sb.append(size);
            Log.e("GcmTaskService", sb.toString());
        }
    }

    @Override // android.app.Service
    public int onStartCommand(Intent intent, int i, int i2) {
        if (intent == null) {
            return 2;
        }
        try {
            intent.setExtrasClassLoader(PendingCallback.class.getClassLoader());
            String action = intent.getAction();
            if ("com.google.android.gms.gcm.ACTION_TASK_READY".equals(action)) {
                String stringExtra = intent.getStringExtra("tag");
                Parcelable parcelableExtra = intent.getParcelableExtra("callback");
                Bundle bundleExtra = intent.getBundleExtra("extras");
                ArrayList parcelableArrayListExtra = intent.getParcelableArrayListExtra("triggered_uris");
                if (!(parcelableExtra instanceof PendingCallback)) {
                    String packageName = getPackageName();
                    StringBuilder sb = new StringBuilder(String.valueOf(packageName).length() + 47 + String.valueOf(stringExtra).length());
                    sb.append(packageName);
                    sb.append(" ");
                    sb.append(stringExtra);
                    sb.append(": Could not process request, invalid callback.");
                    Log.e("GcmTaskService", sb.toString());
                    return 2;
                } else if (zza(stringExtra)) {
                    return 2;
                } else {
                    zzb zzbVar = new zzb(stringExtra, ((PendingCallback) parcelableExtra).zza, bundleExtra, parcelableArrayListExtra);
                    try {
                        this.zzc.execute(zzbVar);
                    } catch (RejectedExecutionException e) {
                        Log.e("GcmTaskService", "Executor is shutdown. onDestroy was called but main looper had an unprocessed start task message. The task will be retried with backoff delay.", e);
                        zzbVar.zza(1);
                    }
                }
            } else if (!"com.google.android.gms.gcm.SERVICE_ACTION_INITIALIZE".equals(action)) {
                StringBuilder sb2 = new StringBuilder(String.valueOf(action).length() + 37);
                sb2.append("Unknown action received ");
                sb2.append(action);
                sb2.append(", terminating");
                Log.e("GcmTaskService", sb2.toString());
            }
            return 2;
        } finally {
            zza(i2);
        }
    }

    public final boolean zza(String str) {
        boolean z;
        synchronized (this.zza) {
            z = !this.zzf.zza(str, this.zze.getClassName());
            if (z) {
                String packageName = getPackageName();
                StringBuilder sb = new StringBuilder(String.valueOf(packageName).length() + 44 + String.valueOf(str).length());
                sb.append(packageName);
                sb.append(" ");
                sb.append(str);
                sb.append(": Task already running, won't start another");
                Log.w("GcmTaskService", sb.toString());
            }
        }
        return z;
    }

    public final void zza(int i) {
        synchronized (this.zza) {
            this.zzb = i;
            if (!this.zzf.zzb(this.zze.getClassName())) {
                stopSelf(this.zzb);
            }
        }
    }

    /* loaded from: classes.dex */
    public class zzb implements Runnable {
        public final String zza;
        public final List<Uri> zzc;
        public final INetworkTaskCallback zzd;
        public final Messenger zze;

        public zzb(String str, IBinder iBinder, Bundle bundle, List<Uri> list) {
            INetworkTaskCallback iNetworkTaskCallback;
            this.zza = str;
            int i = INetworkTaskCallback.Stub.$r8$clinit;
            if (iBinder == null) {
                iNetworkTaskCallback = null;
            } else {
                IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.gcm.INetworkTaskCallback");
                if (queryLocalInterface instanceof INetworkTaskCallback) {
                    iNetworkTaskCallback = (INetworkTaskCallback) queryLocalInterface;
                } else {
                    iNetworkTaskCallback = new INetworkTaskCallback.Stub.Proxy(iBinder);
                }
            }
            this.zzd = iNetworkTaskCallback;
            this.zzc = list;
            this.zze = null;
        }

        @Override // java.lang.Runnable
        public final void run() {
            final DefaultGcmNetworkManagerWrapper defaultGcmNetworkManagerWrapper;
            final String str = this.zza;
            final BackdropRotationTask backdropRotationTask = (BackdropRotationTask) GcmTaskService.this;
            final Context applicationContext = backdropRotationTask.getApplicationContext();
            DiskBasedLogger.e("BackdropRotationTask", "Task run with tag: " + str, applicationContext);
            synchronized (DefaultGcmNetworkManagerWrapper.sInstanceLock) {
                if (DefaultGcmNetworkManagerWrapper.sInstance == null) {
                    DefaultGcmNetworkManagerWrapper.sInstance = new DefaultGcmNetworkManagerWrapper(applicationContext.getApplicationContext());
                }
                defaultGcmNetworkManagerWrapper = DefaultGcmNetworkManagerWrapper.sInstance;
            }
            final BackdropRotationTask.TaskResultCallable taskResultCallable = new BackdropRotationTask.TaskResultCallable(null);
            final FutureTask futureTask = new FutureTask(taskResultCallable);
            ((DefaultWallpaperRefresher) InjectorProvider.getInjector().getWallpaperRefresher(applicationContext)).refresh(new WallpaperRefresher.RefreshListener(backdropRotationTask, applicationContext, defaultGcmNetworkManagerWrapper, str, taskResultCallable, futureTask) { // from class: com.google.android.apps.wallpaper.backdrop.BackdropRotationTask.2
                public final /* synthetic */ Context val$appContext;
                public final /* synthetic */ DefaultGcmNetworkManagerWrapper val$gcmNetworkManagerWrapper;
                public final /* synthetic */ String val$tag;
                public final /* synthetic */ TaskResultCallable val$taskResultCallable;
                public final /* synthetic */ FutureTask val$taskResultFuture;

                {
                    this.val$appContext = applicationContext;
                    this.val$gcmNetworkManagerWrapper = defaultGcmNetworkManagerWrapper;
                    this.val$tag = str;
                    this.val$taskResultCallable = taskResultCallable;
                    this.val$taskResultFuture = futureTask;
                }

                @Override // com.android.wallpaper.module.WallpaperRefresher.RefreshListener
                public void onRefreshed(WallpaperMetadata wallpaperMetadata, WallpaperMetadata wallpaperMetadata2, int i) {
                    if (i == 1) {
                        DiskBasedLogger.e("BackdropRotationTask", "Wallpaper presentation mode is static, cutting task short.", this.val$appContext);
                        DefaultGcmNetworkManagerWrapper defaultGcmNetworkManagerWrapper2 = this.val$gcmNetworkManagerWrapper;
                        String str2 = this.val$tag;
                        FakeDrag fakeDrag = FakeDrag.getInstance(defaultGcmNetworkManagerWrapper2.mAppContext);
                        Objects.requireNonNull(fakeDrag);
                        ComponentName componentName = new ComponentName((Context) fakeDrag.mViewPager, BackdropRotationTask.class);
                        if (TextUtils.isEmpty(str2)) {
                            throw new IllegalArgumentException("Must provide a valid tag.");
                        } else if (100 >= str2.length()) {
                            fakeDrag.zzc(componentName.getClassName());
                            Intent zza = fakeDrag.zza();
                            if (zza != null) {
                                zza.putExtra("scheduler_action", "CANCEL_TASK");
                                zza.putExtra("tag", str2);
                                zza.putExtra("component", componentName);
                                ((Context) fakeDrag.mViewPager).sendBroadcast(zza);
                            }
                            this.val$taskResultCallable.taskResult = 2;
                            this.val$taskResultFuture.run();
                        } else {
                            throw new IllegalArgumentException("Tag is larger than max permissible tag length (100)");
                        }
                    } else {
                        final Context context = this.val$appContext;
                        final String str3 = this.val$tag;
                        final TaskResultCallable taskResultCallable2 = this.val$taskResultCallable;
                        final FutureTask futureTask2 = this.val$taskResultFuture;
                        int i2 = BackdropRotationTask.$r8$clinit;
                        final BackdropPreferences backdropPreferences = BackdropPreferences.getInstance(context);
                        BackdropWallpaperRotator.updateWallpaper(context, backdropPreferences.getCollectionId(), backdropPreferences.getCollectionName(), backdropPreferences.getResumeToken(), new BackdropWallpaperRotator.RotationListener() { // from class: com.google.android.apps.wallpaper.backdrop.BackdropRotationTask.1
                            @Override // com.google.android.apps.wallpaper.backdrop.BackdropWallpaperRotator.RotationListener
                            public void onError() {
                                DiskBasedLogger.e("BackdropRotationTask", "Fetching and setting the next wallpaper failed.", context);
                                InjectorProvider.getInjector().getPreferences(context).setDailyWallpaperRotationStatus(5, Calendar.getInstance().getTimeInMillis());
                                taskResultCallable2.taskResult = 1;
                                futureTask2.run();
                            }

                            @Override // com.google.android.apps.wallpaper.backdrop.BackdropWallpaperRotator.RotationListener
                            public void onSuccess(String str4) {
                                DiskBasedLogger.e("BackdropRotationTask", SupportMenuInflater$$ExternalSyntheticOutline0.m("Fetching and setting the next wallpaper succeeded with resumeToken: ", str4), context);
                                if (str3.equals("backdrop_rotation_task_periodic")) {
                                    DiskBasedLogger.e("BackdropRotationTask", "Snoozing the Backdrop alarm since this is a periodic task.", context);
                                    BackdropAlarmScheduler.snoozeAlarm(context);
                                }
                                Calendar calendar = Calendar.getInstance();
                                InjectorProvider.getInjector().getPreferences(context).addDailyRotation(calendar.getTimeInMillis());
                                InjectorProvider.getInjector().getUserEventLogger(context).logDailyWallpaperRotationHour(calendar.get(11));
                                InjectorProvider.getInjector().getPreferences(context).setDailyWallpaperRotationStatus(3, Calendar.getInstance().getTimeInMillis());
                                backdropPreferences.setResumeToken(str4);
                                taskResultCallable2.taskResult = 0;
                                futureTask2.run();
                            }
                        });
                    }
                }
            });
            int i = 1;
            try {
                i = ((Integer) futureTask.get(2L, TimeUnit.MINUTES)).intValue();
            } catch (InterruptedException e) {
                DiskBasedLogger.e("BackdropRotationTask", "Interrupted while updating wallpaper: " + e, applicationContext);
            } catch (ExecutionException e2) {
                DiskBasedLogger.e("BackdropRotationTask", "Execution error while updating wallpaper: " + e2, applicationContext);
            } catch (TimeoutException e3) {
                DiskBasedLogger.e("BackdropRotationTask", "Timed out updating wallpaper with max timeout of 2 minutes: " + e3, applicationContext);
            }
            zza(i);
        }

        public final void zza(int i) {
            GcmTaskService gcmTaskService;
            synchronized (GcmTaskService.this.zza) {
                try {
                    gcmTaskService = GcmTaskService.this;
                } catch (RemoteException unused) {
                    String valueOf = String.valueOf(this.zza);
                    Log.e("GcmTaskService", valueOf.length() != 0 ? "Error reporting result of operation to scheduler for ".concat(valueOf) : new String("Error reporting result of operation to scheduler for "));
                    GcmTaskService gcmTaskService2 = GcmTaskService.this;
                    gcmTaskService2.zzf.zzb(this.zza, gcmTaskService2.zze.getClassName());
                    if (!zza()) {
                        GcmTaskService gcmTaskService3 = GcmTaskService.this;
                        if (!gcmTaskService3.zzf.zzb(gcmTaskService3.zze.getClassName())) {
                            GcmTaskService gcmTaskService4 = GcmTaskService.this;
                            gcmTaskService4.stopSelf(gcmTaskService4.zzb);
                        }
                    }
                }
                if (gcmTaskService.zzf.zzc(this.zza, gcmTaskService.zze.getClassName())) {
                    GcmTaskService gcmTaskService5 = GcmTaskService.this;
                    gcmTaskService5.zzf.zzb(this.zza, gcmTaskService5.zze.getClassName());
                    if (!zza()) {
                        GcmTaskService gcmTaskService6 = GcmTaskService.this;
                        if (!gcmTaskService6.zzf.zzb(gcmTaskService6.zze.getClassName())) {
                            GcmTaskService gcmTaskService7 = GcmTaskService.this;
                            gcmTaskService7.stopSelf(gcmTaskService7.zzb);
                        }
                    }
                    return;
                }
                if (zza()) {
                    Messenger messenger = this.zze;
                    Message obtain = Message.obtain();
                    obtain.what = 3;
                    obtain.arg1 = i;
                    Bundle bundle = new Bundle();
                    bundle.putParcelable("component", GcmTaskService.this.zze);
                    bundle.putString("tag", this.zza);
                    obtain.setData(bundle);
                    messenger.send(obtain);
                } else {
                    this.zzd.taskFinished(i);
                }
                GcmTaskService gcmTaskService8 = GcmTaskService.this;
                gcmTaskService8.zzf.zzb(this.zza, gcmTaskService8.zze.getClassName());
                if (!zza()) {
                    GcmTaskService gcmTaskService9 = GcmTaskService.this;
                    if (!gcmTaskService9.zzf.zzb(gcmTaskService9.zze.getClassName())) {
                        GcmTaskService gcmTaskService10 = GcmTaskService.this;
                        gcmTaskService10.stopSelf(gcmTaskService10.zzb);
                    }
                }
            }
        }

        public zzb(String str, Messenger messenger, Bundle bundle, List<Uri> list) {
            this.zza = str;
            this.zze = messenger;
            this.zzc = list;
            this.zzd = null;
        }

        public final boolean zza() {
            return this.zze != null;
        }
    }
}
