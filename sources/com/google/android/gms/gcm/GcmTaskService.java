package com.google.android.gms.gcm;

import android.annotation.TargetApi;
import android.app.AppOpsManager;
import android.app.Service;
import android.content.ComponentName;
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
import android.util.Log;
import com.google.android.gms.gcm.INetworkTaskCallback;
import com.google.android.gms.internal.zzbmj;
import com.google.android.gms.internal.zzbmk;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.RejectedExecutionException;
/* loaded from: classes.dex */
public abstract class GcmTaskService extends Service {
    public final Object zza = new Object();
    public int zzb;
    public ExecutorService zzc;
    public Messenger zzd;
    public ComponentName zze;
    public GcmNetworkManager zzf;

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
            zza.getClass();
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
                        gcmTaskService2.getClass();
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
                GcmTaskService.this.getClass();
            } else if (Log.isLoggable("GcmTaskService", 3)) {
                String valueOf2 = String.valueOf(message);
                StringBuilder sb2 = new StringBuilder(valueOf2.length() + 45);
                sb2.append("ignoring unimplemented stop message for now: ");
                sb2.append(valueOf2);
                Log.d("GcmTaskService", sb2.toString());
            }
        }
    }

    /* loaded from: classes.dex */
    public class zzb implements Runnable {
        public final String zza;
        public final Bundle zzb;
        public final List<Uri> zzc;
        public final INetworkTaskCallback zzd;
        public final Messenger zze;

        public zzb(String str, IBinder iBinder, Bundle bundle, ArrayList arrayList) {
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
            this.zzb = bundle;
            this.zzc = arrayList;
            this.zze = null;
        }

        @Override // java.lang.Runnable
        public final void run() {
            zza(GcmTaskService.this.onRunTask(new TaskParams(this.zza, this.zzc)));
        }

        public final void zza(int i) {
            String str;
            GcmTaskService gcmTaskService;
            boolean z;
            synchronized (GcmTaskService.this.zza) {
                boolean z2 = true;
                try {
                    gcmTaskService = GcmTaskService.this;
                } catch (RemoteException unused) {
                    String valueOf = String.valueOf(this.zza);
                    if (valueOf.length() != 0) {
                        str = "Error reporting result of operation to scheduler for ".concat(valueOf);
                    } else {
                        str = new String("Error reporting result of operation to scheduler for ");
                    }
                    Log.e("GcmTaskService", str);
                    GcmTaskService gcmTaskService2 = GcmTaskService.this;
                    gcmTaskService2.zzf.zzb(this.zza, gcmTaskService2.zze.getClassName());
                    if (this.zze == null) {
                        z2 = false;
                    }
                    if (!z2) {
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
                    if (this.zze == null) {
                        z2 = false;
                    }
                    if (!z2) {
                        GcmTaskService gcmTaskService6 = GcmTaskService.this;
                        if (!gcmTaskService6.zzf.zzb(gcmTaskService6.zze.getClassName())) {
                            GcmTaskService gcmTaskService7 = GcmTaskService.this;
                            gcmTaskService7.stopSelf(gcmTaskService7.zzb);
                        }
                    }
                    return;
                }
                Messenger messenger = this.zze;
                if (messenger != null) {
                    z = true;
                } else {
                    z = false;
                }
                if (z) {
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
                if (this.zze == null) {
                    z2 = false;
                }
                if (!z2) {
                    GcmTaskService gcmTaskService9 = GcmTaskService.this;
                    if (!gcmTaskService9.zzf.zzb(gcmTaskService9.zze.getClassName())) {
                        GcmTaskService gcmTaskService10 = GcmTaskService.this;
                        gcmTaskService10.stopSelf(gcmTaskService10.zzb);
                    }
                }
            }
        }

        public zzb(String str, Messenger messenger, Bundle bundle, ArrayList arrayList) {
            this.zza = str;
            this.zze = messenger;
            this.zzb = bundle;
            this.zzc = arrayList;
            this.zzd = null;
        }
    }

    public abstract int onRunTask(TaskParams taskParams);

    @Override // android.app.Service
    public final int onStartCommand(Intent intent, int i, int i2) {
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

    @Override // android.app.Service
    public final IBinder onBind(Intent intent) {
        if (intent == null || !"com.google.android.gms.gcm.ACTION_TASK_READY".equals(intent.getAction())) {
            return null;
        }
        return this.zzd.getBinder();
    }

    @Override // android.app.Service
    public final void onCreate() {
        GcmNetworkManager gcmNetworkManager;
        super.onCreate();
        synchronized (GcmNetworkManager.class) {
            if (GcmNetworkManager.zza == null) {
                GcmNetworkManager.zza = new GcmNetworkManager(getApplicationContext());
            }
            gcmNetworkManager = GcmNetworkManager.zza;
        }
        this.zzf = gcmNetworkManager;
        this.zzc = Executors.newFixedThreadPool(2, new com.google.android.gms.gcm.zzb());
        this.zzd = new Messenger(new zza(Looper.getMainLooper()));
        this.zze = new ComponentName(this, getClass());
    }

    @Override // android.app.Service
    public final void onDestroy() {
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

    public final void zza(int i) {
        synchronized (this.zza) {
            this.zzb = i;
            if (!this.zzf.zzb(this.zze.getClassName())) {
                stopSelf(this.zzb);
            }
        }
    }
}
