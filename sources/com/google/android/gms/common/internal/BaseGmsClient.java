package com.google.android.gms.common.internal;

import android.accounts.Account;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.DeadObjectException;
import android.os.Handler;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Log;
import androidx.cardview.R$style$$ExternalSyntheticOutline0;
import com.adobe.xmp.impl.ParseRDF$$ExternalSyntheticOutline0;
import com.android.wallpaper.util.LaunchUtils;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.Feature;
import com.google.android.gms.common.GoogleApiAvailability;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.api.internal.zzbt;
import com.google.android.gms.common.api.internal.zzbu;
import com.google.android.gms.common.internal.GmsClientSupervisor;
import java.util.ArrayList;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes.dex */
public abstract class BaseGmsClient<T extends IInterface> {
    public ConnectionProgressReportCallbacks mConnectionProgressReportCallbacks;
    public final zzb zza;
    public zzu zzh;
    public final Context zzi;
    public final GmsClientSupervisor zzk;
    public IGmsServiceBroker zzo;
    public T zzp;
    public zze zzr;
    public final BaseConnectionCallbacks zzt;
    public final BaseOnConnectionFailedListener zzu;
    public final int zzv;
    public final String zzw;
    public final Object zzm = new Object();
    public final Object zzn = new Object();
    public final ArrayList<zzc<?>> zzq = new ArrayList<>();
    public int zzs = 1;
    public ConnectionResult zzx = null;
    public boolean zzy = false;
    public AtomicInteger mDisconnectCount = new AtomicInteger(0);

    /* loaded from: classes.dex */
    public interface BaseConnectionCallbacks {
    }

    /* loaded from: classes.dex */
    public interface BaseOnConnectionFailedListener {
    }

    /* loaded from: classes.dex */
    public interface ConnectionProgressReportCallbacks {
        void onReportServiceBinding(ConnectionResult connectionResult);
    }

    /* loaded from: classes.dex */
    public abstract class zza extends zzc<Boolean> {
        public final int zza;
        public final Bundle zzb;

        public abstract void zza(ConnectionResult connectionResult);

        public abstract boolean zza();

        @Override // com.google.android.gms.common.internal.BaseGmsClient.zzc
        public final void zzb() {
        }

        public zza(int i, Bundle bundle) {
            super();
            this.zza = i;
            this.zzb = bundle;
        }

        @Override // com.google.android.gms.common.internal.BaseGmsClient.zzc
        public final /* synthetic */ void zza(Boolean bool) {
            int i = this.zza;
            PendingIntent pendingIntent = null;
            if (i != 0) {
                if (i != 10) {
                    BaseGmsClient.this.zzb(1, null);
                    Bundle bundle = this.zzb;
                    if (bundle != null) {
                        pendingIntent = (PendingIntent) bundle.getParcelable("pendingIntent");
                    }
                    zza(new ConnectionResult(this.zza, pendingIntent));
                    return;
                }
                BaseGmsClient.this.zzb(1, null);
                throw new IllegalStateException("A fatal developer error has occurred. Check the logs for further information.");
            } else if (!zza()) {
                BaseGmsClient.this.zzb(1, null);
                zza(new ConnectionResult(8, null));
            }
        }
    }

    /* loaded from: classes.dex */
    public final class zzb extends Handler {
        public zzb(Looper looper) {
            super(looper);
        }

        @Override // android.os.Handler
        public final void handleMessage(Message message) {
            TListener tlistener;
            boolean z = false;
            PendingIntent pendingIntent = null;
            if (BaseGmsClient.this.mDisconnectCount.get() != message.arg1) {
                int i = message.what;
                if (i == 2 || i == 1 || i == 7) {
                    z = true;
                }
                if (z) {
                    zzc zzcVar = (zzc) message.obj;
                    zzcVar.zzb();
                    synchronized (zzcVar) {
                        zzcVar.zza = null;
                    }
                    synchronized (BaseGmsClient.this.zzq) {
                        BaseGmsClient.this.zzq.remove(zzcVar);
                    }
                    return;
                }
                return;
            }
            int i2 = message.what;
            if ((i2 == 1 || i2 == 7 || i2 == 4 || i2 == 5) && !BaseGmsClient.this.isConnecting()) {
                zzc zzcVar2 = (zzc) message.obj;
                zzcVar2.zzb();
                synchronized (zzcVar2) {
                    zzcVar2.zza = null;
                }
                synchronized (BaseGmsClient.this.zzq) {
                    BaseGmsClient.this.zzq.remove(zzcVar2);
                }
                return;
            }
            int i3 = message.what;
            if (i3 == 4) {
                BaseGmsClient.this.zzx = new ConnectionResult(message.arg2);
                BaseGmsClient baseGmsClient = BaseGmsClient.this;
                if (!baseGmsClient.zzy && !TextUtils.isEmpty(baseGmsClient.getServiceDescriptor()) && !TextUtils.isEmpty(null)) {
                    try {
                        Class.forName(baseGmsClient.getServiceDescriptor());
                        z = true;
                    } catch (ClassNotFoundException unused) {
                    }
                }
                if (z) {
                    BaseGmsClient baseGmsClient2 = BaseGmsClient.this;
                    if (!baseGmsClient2.zzy) {
                        baseGmsClient2.zzb(3, null);
                        return;
                    }
                }
                ConnectionResult connectionResult = BaseGmsClient.this.zzx;
                if (connectionResult == null) {
                    connectionResult = new ConnectionResult(8);
                }
                BaseGmsClient.this.mConnectionProgressReportCallbacks.onReportServiceBinding(connectionResult);
                BaseGmsClient.this.getClass();
                System.currentTimeMillis();
            } else if (i3 == 5) {
                ConnectionResult connectionResult2 = BaseGmsClient.this.zzx;
                if (connectionResult2 == null) {
                    connectionResult2 = new ConnectionResult(8);
                }
                BaseGmsClient.this.mConnectionProgressReportCallbacks.onReportServiceBinding(connectionResult2);
                BaseGmsClient.this.getClass();
                System.currentTimeMillis();
            } else if (i3 == 3) {
                Object obj = message.obj;
                if (obj instanceof PendingIntent) {
                    pendingIntent = (PendingIntent) obj;
                }
                BaseGmsClient.this.mConnectionProgressReportCallbacks.onReportServiceBinding(new ConnectionResult(message.arg2, pendingIntent));
                BaseGmsClient.this.getClass();
                System.currentTimeMillis();
            } else if (i3 == 6) {
                BaseGmsClient.this.zzb(5, null);
                BaseConnectionCallbacks baseConnectionCallbacks = BaseGmsClient.this.zzt;
                if (baseConnectionCallbacks != null) {
                    ((zzm) baseConnectionCallbacks).zza.onConnectionSuspended();
                }
                BaseGmsClient.this.getClass();
                System.currentTimeMillis();
                BaseGmsClient.zza(BaseGmsClient.this, 5, 1, null);
            } else if (i3 != 2 || BaseGmsClient.this.isConnected()) {
                int i4 = message.what;
                if (i4 == 2 || i4 == 1 || i4 == 7) {
                    z = true;
                }
                if (z) {
                    zzc zzcVar3 = (zzc) message.obj;
                    synchronized (zzcVar3) {
                        tlistener = zzcVar3.zza;
                        if (zzcVar3.zzb) {
                            String valueOf = String.valueOf(zzcVar3);
                            StringBuilder sb = new StringBuilder(valueOf.length() + 47);
                            sb.append("Callback proxy ");
                            sb.append(valueOf);
                            sb.append(" being reused. This is not safe.");
                            Log.w("GmsClient", sb.toString());
                        }
                    }
                    if (tlistener != 0) {
                        try {
                            zzcVar3.zza(tlistener);
                        } catch (RuntimeException e) {
                            zzcVar3.zzb();
                            throw e;
                        }
                    } else {
                        zzcVar3.zzb();
                    }
                    synchronized (zzcVar3) {
                        zzcVar3.zzb = true;
                    }
                    synchronized (zzcVar3) {
                        zzcVar3.zza = null;
                    }
                    synchronized (BaseGmsClient.this.zzq) {
                        BaseGmsClient.this.zzq.remove(zzcVar3);
                    }
                    return;
                }
                Log.wtf("GmsClient", R$style$$ExternalSyntheticOutline0.m(45, "Don't know how to handle message: ", i4), new Exception());
            } else {
                zzc zzcVar4 = (zzc) message.obj;
                zzcVar4.zzb();
                synchronized (zzcVar4) {
                    zzcVar4.zza = null;
                }
                synchronized (BaseGmsClient.this.zzq) {
                    BaseGmsClient.this.zzq.remove(zzcVar4);
                }
            }
        }
    }

    /* loaded from: classes.dex */
    public abstract class zzc<TListener> {
        public TListener zza = (TListener) Boolean.TRUE;
        public boolean zzb = false;

        public abstract void zza(TListener tlistener);

        public abstract void zzb();

        public zzc() {
        }
    }

    /* loaded from: classes.dex */
    public static final class zzd extends IGmsCallbacks$zza {
        private BaseGmsClient zza;
        private final int zzb;

        public final void onPostInitComplete(int i, IBinder iBinder, Bundle bundle) {
            LaunchUtils.zza(this.zza, "onPostInitComplete can be called only once per call to getRemoteService");
            BaseGmsClient baseGmsClient = this.zza;
            int i2 = this.zzb;
            zzb zzbVar = baseGmsClient.zza;
            zzbVar.sendMessage(zzbVar.obtainMessage(1, i2, -1, new zzg(i, iBinder, bundle)));
            this.zza = null;
        }

        public zzd(BaseGmsClient baseGmsClient, int i) {
            this.zza = baseGmsClient;
            this.zzb = i;
        }
    }

    /* loaded from: classes.dex */
    public final class zze implements ServiceConnection {
        public final int zza;

        @Override // android.content.ServiceConnection
        public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            IGmsServiceBroker iGmsServiceBroker;
            int i;
            boolean z = false;
            if (iBinder == null) {
                BaseGmsClient baseGmsClient = BaseGmsClient.this;
                synchronized (baseGmsClient.zzm) {
                    if (baseGmsClient.zzs == 3) {
                        z = true;
                    }
                }
                if (z) {
                    i = 5;
                    baseGmsClient.zzy = true;
                } else {
                    i = 4;
                }
                zzb zzbVar = baseGmsClient.zza;
                zzbVar.sendMessage(zzbVar.obtainMessage(i, baseGmsClient.mDisconnectCount.get(), 16));
                return;
            }
            synchronized (BaseGmsClient.this.zzn) {
                BaseGmsClient baseGmsClient2 = BaseGmsClient.this;
                IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.common.internal.IGmsServiceBroker");
                if (queryLocalInterface == null || !(queryLocalInterface instanceof IGmsServiceBroker)) {
                    iGmsServiceBroker = new zzad(iBinder);
                } else {
                    iGmsServiceBroker = (IGmsServiceBroker) queryLocalInterface;
                }
                baseGmsClient2.zzo = iGmsServiceBroker;
            }
            BaseGmsClient baseGmsClient3 = BaseGmsClient.this;
            int i2 = this.zza;
            zzb zzbVar2 = baseGmsClient3.zza;
            zzbVar2.sendMessage(zzbVar2.obtainMessage(7, i2, -1, new zzh(0)));
        }

        public zze(int i) {
            this.zza = i;
        }

        @Override // android.content.ServiceConnection
        public final void onServiceDisconnected(ComponentName componentName) {
            BaseGmsClient baseGmsClient;
            synchronized (BaseGmsClient.this.zzn) {
                baseGmsClient = BaseGmsClient.this;
                baseGmsClient.zzo = null;
            }
            zzb zzbVar = baseGmsClient.zza;
            zzbVar.sendMessage(zzbVar.obtainMessage(6, this.zza, 1));
        }
    }

    /* loaded from: classes.dex */
    public class zzf implements ConnectionProgressReportCallbacks {
        public zzf() {
        }

        @Override // com.google.android.gms.common.internal.BaseGmsClient.ConnectionProgressReportCallbacks
        public final void onReportServiceBinding(ConnectionResult connectionResult) {
            boolean z;
            if (connectionResult.zzc == 0) {
                z = true;
            } else {
                z = false;
            }
            if (z) {
                BaseGmsClient baseGmsClient = BaseGmsClient.this;
                baseGmsClient.getRemoteService(null, ((zzl) baseGmsClient).zzd);
                return;
            }
            BaseOnConnectionFailedListener baseOnConnectionFailedListener = BaseGmsClient.this.zzu;
            if (baseOnConnectionFailedListener != null) {
                ((zzn) baseOnConnectionFailedListener).zza.onConnectionFailed(connectionResult);
            }
        }
    }

    /* loaded from: classes.dex */
    public final class zzg extends zza {
        public final IBinder zza;

        @Override // com.google.android.gms.common.internal.BaseGmsClient.zza
        public final void zza(ConnectionResult connectionResult) {
            BaseOnConnectionFailedListener baseOnConnectionFailedListener = BaseGmsClient.this.zzu;
            if (baseOnConnectionFailedListener != null) {
                ((zzn) baseOnConnectionFailedListener).zza.onConnectionFailed(connectionResult);
            }
            BaseGmsClient.this.getClass();
            System.currentTimeMillis();
        }

        public zzg(int i, IBinder iBinder, Bundle bundle) {
            super(i, bundle);
            this.zza = iBinder;
        }

        @Override // com.google.android.gms.common.internal.BaseGmsClient.zza
        public final boolean zza() {
            try {
                String interfaceDescriptor = this.zza.getInterfaceDescriptor();
                if (!BaseGmsClient.this.getServiceDescriptor().equals(interfaceDescriptor)) {
                    String serviceDescriptor = BaseGmsClient.this.getServiceDescriptor();
                    StringBuilder sb = new StringBuilder(ParseRDF$$ExternalSyntheticOutline0.m(interfaceDescriptor, ParseRDF$$ExternalSyntheticOutline0.m(serviceDescriptor, 34)));
                    sb.append("service descriptor mismatch: ");
                    sb.append(serviceDescriptor);
                    sb.append(" vs. ");
                    sb.append(interfaceDescriptor);
                    Log.e("GmsClient", sb.toString());
                    return false;
                }
                IInterface zza = BaseGmsClient.this.zza(this.zza);
                if (zza == null || (!BaseGmsClient.zza(BaseGmsClient.this, 2, 4, zza) && !BaseGmsClient.zza(BaseGmsClient.this, 3, 4, zza))) {
                    return false;
                }
                BaseGmsClient baseGmsClient = BaseGmsClient.this;
                baseGmsClient.zzx = null;
                BaseConnectionCallbacks baseConnectionCallbacks = baseGmsClient.zzt;
                if (baseConnectionCallbacks == null) {
                    return true;
                }
                ((zzm) baseConnectionCallbacks).zza.onConnected();
                return true;
            } catch (RemoteException unused) {
                Log.w("GmsClient", "service probably died");
                return false;
            }
        }
    }

    /* loaded from: classes.dex */
    public final class zzh extends zza {
        @Override // com.google.android.gms.common.internal.BaseGmsClient.zza
        public final void zza(ConnectionResult connectionResult) {
            BaseGmsClient.this.mConnectionProgressReportCallbacks.onReportServiceBinding(connectionResult);
            BaseGmsClient.this.getClass();
            System.currentTimeMillis();
        }

        public zzh(int i) {
            super(i, null);
        }

        @Override // com.google.android.gms.common.internal.BaseGmsClient.zza
        public final boolean zza() {
            BaseGmsClient.this.mConnectionProgressReportCallbacks.onReportServiceBinding(ConnectionResult.zza);
            return true;
        }
    }

    public abstract String getServiceDescriptor();

    public abstract String getStartServiceAction();

    public final void requiresGooglePlayServices() {
    }

    public boolean requiresSignIn() {
        return false;
    }

    public abstract T zza(IBinder iBinder);

    public final void zzb(int i, T t) {
        zzu zzuVar;
        boolean z = false;
        if ((i == 4) == (t != null)) {
            z = true;
        }
        if (z) {
            synchronized (this.zzm) {
                this.zzs = i;
                this.zzp = t;
                if (i != 1) {
                    if (i == 2 || i == 3) {
                        if (!(this.zzr == null || (zzuVar = this.zzh) == null)) {
                            String str = zzuVar.zza;
                            StringBuilder sb = new StringBuilder(String.valueOf(str).length() + 70 + "com.google.android.gms".length());
                            sb.append("Calling connect() while still connected, missing disconnect() for ");
                            sb.append(str);
                            sb.append(" on ");
                            sb.append("com.google.android.gms");
                            Log.e("GmsClient", sb.toString());
                            GmsClientSupervisor gmsClientSupervisor = this.zzk;
                            String str2 = this.zzh.zza;
                            zze zzeVar = this.zzr;
                            if (this.zzw == null) {
                                this.zzi.getClass();
                            }
                            gmsClientSupervisor.getClass();
                            gmsClientSupervisor.unbindService(new GmsClientSupervisor.ConnectionStatusConfig(str2, "com.google.android.gms", 129), zzeVar);
                            this.mDisconnectCount.incrementAndGet();
                        }
                        this.zzr = new zze(this.mDisconnectCount.get());
                        String startServiceAction = getStartServiceAction();
                        this.zzh = new zzu(startServiceAction);
                        GmsClientSupervisor gmsClientSupervisor2 = this.zzk;
                        zze zzeVar2 = this.zzr;
                        String str3 = this.zzw;
                        if (str3 == null) {
                            str3 = this.zzi.getClass().getName();
                        }
                        gmsClientSupervisor2.getClass();
                        if (!gmsClientSupervisor2.bindService(new GmsClientSupervisor.ConnectionStatusConfig(startServiceAction, "com.google.android.gms", 129), zzeVar2, str3)) {
                            String str4 = this.zzh.zza;
                            StringBuilder sb2 = new StringBuilder(String.valueOf(str4).length() + 34 + "com.google.android.gms".length());
                            sb2.append("unable to connect to service: ");
                            sb2.append(str4);
                            sb2.append(" on ");
                            sb2.append("com.google.android.gms");
                            Log.e("GmsClient", sb2.toString());
                            int i2 = this.mDisconnectCount.get();
                            zzb zzbVar = this.zza;
                            zzbVar.sendMessage(zzbVar.obtainMessage(7, i2, -1, new zzh(16)));
                        }
                    } else if (i == 4) {
                        System.currentTimeMillis();
                    }
                } else if (this.zzr != null) {
                    GmsClientSupervisor gmsClientSupervisor3 = this.zzk;
                    String startServiceAction2 = getStartServiceAction();
                    zze zzeVar3 = this.zzr;
                    if (this.zzw == null) {
                        this.zzi.getClass();
                    }
                    gmsClientSupervisor3.getClass();
                    gmsClientSupervisor3.unbindService(new GmsClientSupervisor.ConnectionStatusConfig(startServiceAction2, "com.google.android.gms", 129), zzeVar3);
                    this.zzr = null;
                }
            }
            return;
        }
        throw new IllegalArgumentException();
    }

    public BaseGmsClient(Context context, Looper looper, zzq zzqVar, int i, zzm zzmVar, zzn zznVar, String str) {
        Object obj = GoogleApiAvailability.zza;
        if (context != null) {
            this.zzi = context;
            if (looper == null) {
                throw new NullPointerException("Looper must not be null");
            } else if (zzqVar != null) {
                this.zzk = zzqVar;
                this.zza = new zzb(looper);
                this.zzv = i;
                this.zzt = zzmVar;
                this.zzu = zznVar;
                this.zzw = str;
            } else {
                throw new NullPointerException("Supervisor must not be null");
            }
        } else {
            throw new NullPointerException("Context must not be null");
        }
    }

    public static boolean zza(BaseGmsClient baseGmsClient, int i, int i2, IInterface iInterface) {
        boolean z;
        synchronized (baseGmsClient.zzm) {
            if (baseGmsClient.zzs != i) {
                z = false;
            } else {
                baseGmsClient.zzb(i2, iInterface);
                z = true;
            }
        }
        return z;
    }

    public final void connect(ConnectionProgressReportCallbacks connectionProgressReportCallbacks) {
        this.mConnectionProgressReportCallbacks = connectionProgressReportCallbacks;
        zzb(2, null);
    }

    public final void disconnect() {
        this.mDisconnectCount.incrementAndGet();
        synchronized (this.zzq) {
            try {
                int size = this.zzq.size();
                for (int i = 0; i < size; i++) {
                    zzc<?> zzcVar = this.zzq.get(i);
                    synchronized (zzcVar) {
                        zzcVar.zza = null;
                    }
                }
                this.zzq.clear();
            } catch (Throwable th) {
                throw th;
            }
        }
        synchronized (this.zzn) {
            this.zzo = null;
        }
        zzb(1, null);
    }

    public final boolean isConnected() {
        boolean z;
        synchronized (this.zzm) {
            if (this.zzs == 4) {
                z = true;
            } else {
                z = false;
            }
        }
        return z;
    }

    public final boolean isConnecting() {
        boolean z;
        synchronized (this.zzm) {
            int i = this.zzs;
            if (!(i == 2 || i == 3)) {
                z = false;
            }
            z = true;
        }
        return z;
    }

    public final void onUserSignOut(zzbt zzbtVar) {
        zzbtVar.zza.zza.zzq.post(new zzbu(zzbtVar));
    }

    public final T zzag() throws DeadObjectException {
        boolean z;
        T t;
        synchronized (this.zzm) {
            if (this.zzs == 5) {
                throw new DeadObjectException();
            } else if (isConnected()) {
                if (this.zzp != null) {
                    z = true;
                } else {
                    z = false;
                }
                LaunchUtils.zza(z, "Client is connected but service is null");
                t = this.zzp;
            } else {
                throw new IllegalStateException("Not connected. Call connect() and wait for onConnected() to be called.");
            }
        }
        return t;
    }

    public final void getRemoteService(IAccountAccessor iAccountAccessor, Set<Scope> set) {
        Bundle zzb2 = zzb();
        GetServiceRequest getServiceRequest = new GetServiceRequest(this.zzv);
        getServiceRequest.zzd = this.zzi.getPackageName();
        getServiceRequest.zzg = zzb2;
        if (set != null) {
            getServiceRequest.zzf = (Scope[]) set.toArray(new Scope[set.size()]);
        }
        if (requiresSignIn()) {
            Account account = ((zzl) this).zze;
            if (account == null) {
                account = new Account("<<default account>>", "com.google");
            }
            getServiceRequest.zzh = account;
            if (iAccountAccessor != null) {
                getServiceRequest.zze = iAccountAccessor.asBinder();
            }
        }
        getServiceRequest.zzi = new Feature[0];
        try {
            try {
                synchronized (this.zzn) {
                    IGmsServiceBroker iGmsServiceBroker = this.zzo;
                    if (iGmsServiceBroker != null) {
                        iGmsServiceBroker.getService(new zzd(this, this.mDisconnectCount.get()), getServiceRequest);
                    } else {
                        Log.w("GmsClient", "mServiceBroker is null, client disconnected");
                    }
                }
            } catch (RemoteException | RuntimeException e) {
                Log.w("GmsClient", "IGmsServiceBroker.getService failed", e);
                int i = this.mDisconnectCount.get();
                zzb zzbVar = this.zza;
                zzbVar.sendMessage(zzbVar.obtainMessage(1, i, -1, new zzg(8, null, null)));
            }
        } catch (DeadObjectException e2) {
            Log.w("GmsClient", "IGmsServiceBroker.getService failed", e2);
            zzb zzbVar2 = this.zza;
            zzbVar2.sendMessage(zzbVar2.obtainMessage(6, this.mDisconnectCount.get(), 1));
        } catch (SecurityException e3) {
            throw e3;
        }
    }

    public final void zzab() {
        if (!isConnected() || this.zzh == null) {
            throw new RuntimeException("Failed to connect when checking package");
        }
    }

    public Bundle zzb() {
        return new Bundle();
    }
}
