package com.google.android.gms.common.api.internal;

import android.app.NotificationManager;
import android.content.Context;
import android.os.Bundle;
import android.os.DeadObjectException;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import androidx.preference.R$string;
import androidx.viewpager2.widget.FakeDrag$$ExternalSyntheticOutline0;
import com.adobe.xmp.XMPPathFactory$$ExternalSyntheticOutline0;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GoogleApiAvailabilityLight;
import com.google.android.gms.common.GooglePlayServicesUtilLight;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions;
import com.google.android.gms.common.api.GoogleApi;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.internal.zzap;
import com.google.android.gms.common.api.internal.zzbv;
import com.google.android.gms.common.api.internal.zzdb;
import com.google.android.gms.common.internal.ClientSettings;
import com.google.android.gms.signin.SignInOptions;
import com.google.android.gms.signin.zzd;
import com.google.android.gms.tasks.TaskCompletionSource;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Map;
import java.util.Objects;
import java.util.Queue;
import java.util.Set;
/* loaded from: classes.dex */
public final class zzbp<O extends Api.ApiOptions> implements GoogleApiClient.ConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener {
    public final /* synthetic */ zzbn zza;
    public final Api.Client zzc;
    public final Api.zzb zzd;
    public final zzi<O> zze;
    public final int zzi;
    public final zzdb zzj;
    public boolean zzk;
    public final Queue<zzb> zzb = new LinkedList();
    public final Set<zzk> zzg = new HashSet();
    public final Map<zzcl<?>, zzcw> zzh = new HashMap();
    public ConnectionResult zzm = null;
    public final zzaf zzf = new zzaf();

    public zzbp(zzbn zzbnVar, GoogleApi<O> googleApi) {
        this.zza = zzbnVar;
        Api.Client zza = googleApi.zza(zzbnVar.zzq.getLooper(), this);
        this.zzc = zza;
        this.zzd = zza;
        this.zze = googleApi.zze;
        this.zzi = googleApi.zzg;
        if (zza.requiresSignIn()) {
            this.zzj = googleApi.zza(zzbnVar.zzh, zzbnVar.zzq);
        } else {
            this.zzj = null;
        }
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
    public final void onConnected(Bundle bundle) {
        if (Looper.myLooper() == this.zza.zzq.getLooper()) {
            zzn();
        } else {
            this.zza.zzq.post(new zzbq(this, 0));
        }
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener
    public final void onConnectionFailed(ConnectionResult connectionResult) {
        zzd zzdVar;
        R$string.zza(this.zza.zzq);
        zzdb zzdbVar = this.zzj;
        if (!(zzdbVar == null || (zzdVar = zzdbVar.zzg) == null)) {
            zzdVar.disconnect();
        }
        zzd();
        this.zza.zzj.zza.clear();
        zzb(connectionResult);
        if (connectionResult.zzc == 4) {
            zza(zzbn.zzb);
        } else if (this.zzb.isEmpty()) {
            this.zzm = connectionResult;
        } else {
            synchronized (zzbn.zzf) {
                Objects.requireNonNull(this.zza);
            }
            if (!this.zza.zza(connectionResult, this.zzi)) {
                if (connectionResult.zzc == 18) {
                    this.zzk = true;
                }
                if (this.zzk) {
                    Handler handler = this.zza.zzq;
                    Message obtain = Message.obtain(handler, 9, this.zze);
                    Objects.requireNonNull(this.zza);
                    handler.sendMessageDelayed(obtain, 5000L);
                    return;
                }
                String str = this.zze.zzc.zze;
                zza(new Status(17, FakeDrag$$ExternalSyntheticOutline0.m(XMPPathFactory$$ExternalSyntheticOutline0.m(str, 38), "API: ", str, " is not available on this device.")));
            }
        }
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
    public final void onConnectionSuspended(int i) {
        if (Looper.myLooper() == this.zza.zzq.getLooper()) {
            zzo();
        } else {
            this.zza.zzq.post(new zzbq(this, 1));
        }
    }

    public final void zza(zzb zzbVar) {
        R$string.zza(this.zza.zzq);
        if (this.zzc.isConnected()) {
            zzb(zzbVar);
            zzq();
            return;
        }
        this.zzb.add(zzbVar);
        ConnectionResult connectionResult = this.zzm;
        if (connectionResult == null || !connectionResult.hasResolution()) {
            zzi();
        } else {
            onConnectionFailed(this.zzm);
        }
    }

    public final void zzb(zzb zzbVar) {
        zzbVar.zza(this.zzf, zzk());
        try {
            zzbVar.zza((zzbp<?>) this);
        } catch (DeadObjectException unused) {
            onConnectionSuspended(1);
            this.zzc.disconnect();
        }
    }

    public final void zzd() {
        R$string.zza(this.zza.zzq);
        this.zzm = null;
    }

    public final void zzi() {
        R$string.zza(this.zza.zzq);
        if (!this.zzc.isConnected() && !this.zzc.isConnecting()) {
            zzbn zzbnVar = this.zza;
            int zza = zzbnVar.zzj.zza(zzbnVar.zzh, this.zzc);
            if (zza != 0) {
                onConnectionFailed(new ConnectionResult(zza, null));
                return;
            }
            zzbn zzbnVar2 = this.zza;
            Api.Client client = this.zzc;
            zzbv zzbvVar = new zzbv(zzbnVar2, client, this.zze);
            if (client.requiresSignIn()) {
                final zzdb zzdbVar = this.zzj;
                zzd zzdVar = zzdbVar.zzg;
                if (zzdVar != null) {
                    zzdVar.disconnect();
                }
                zzdbVar.zzf.zzj = Integer.valueOf(System.identityHashCode(zzdbVar));
                Api.zza<? extends zzd, SignInOptions> zzaVar = zzdbVar.zzd;
                Context context = zzdbVar.zzb;
                Looper looper = zzdbVar.zzc.getLooper();
                ClientSettings clientSettings = zzdbVar.zzf;
                zzdbVar.zzg = zzaVar.zza(context, looper, clientSettings, clientSettings.zzi, zzdbVar, zzdbVar);
                zzdbVar.zzh = zzbvVar;
                Set<Scope> set = zzdbVar.zze;
                if (set == null || set.isEmpty()) {
                    zzdbVar.zzc.post(new Runnable(zzdbVar) { // from class: com.google.android.gms.clearcut.zzo
                        public final /* synthetic */ int $r8$classId = 2;
                        public final Object zza;

                        {
                            this.zza = zzdbVar;
                        }

                        @Override // java.lang.Runnable
                        public final void run() {
                            switch (this.$r8$classId) {
                                case 1:
                                    Context context2 = ((zzap) this.zza).zzc;
                                    int i = GoogleApiAvailabilityLight.GOOGLE_PLAY_SERVICES_VERSION_CODE;
                                    if (!GooglePlayServicesUtilLight.zza.getAndSet(true)) {
                                        try {
                                            NotificationManager notificationManager = (NotificationManager) context2.getSystemService("notification");
                                            if (notificationManager != null) {
                                                notificationManager.cancel(10436);
                                            } else {
                                                return;
                                            }
                                        } catch (SecurityException unused) {
                                            return;
                                        }
                                    }
                                    return;
                                default:
                                    ((zzbv) ((zzdb) this.zza).zzh).zza(new ConnectionResult(4));
                                    return;
                            }
                        }
                    });
                } else {
                    zzdbVar.zzg.zzd();
                }
            }
            this.zzc.connect(zzbvVar);
        }
    }

    public final boolean zzk() {
        return this.zzc.requiresSignIn();
    }

    public final void zzn() {
        zzd();
        zzb(ConnectionResult.zza);
        zzp();
        for (zzcw zzcwVar : this.zzh.values()) {
            try {
                Objects.requireNonNull(zzcwVar);
                new TaskCompletionSource();
                throw null;
            } catch (DeadObjectException unused) {
                onConnectionSuspended(1);
                this.zzc.disconnect();
            } catch (RemoteException unused2) {
            }
        }
        while (this.zzc.isConnected() && !this.zzb.isEmpty()) {
            zzb(this.zzb.remove());
        }
        zzq();
    }

    public final void zzo() {
        zzd();
        this.zzk = true;
        zzaf zzafVar = this.zzf;
        Objects.requireNonNull(zzafVar);
        zzafVar.zza(true, zzdr.zza);
        Handler handler = this.zza.zzq;
        Message obtain = Message.obtain(handler, 9, this.zze);
        Objects.requireNonNull(this.zza);
        handler.sendMessageDelayed(obtain, 5000L);
        Handler handler2 = this.zza.zzq;
        Message obtain2 = Message.obtain(handler2, 11, this.zze);
        Objects.requireNonNull(this.zza);
        handler2.sendMessageDelayed(obtain2, 120000L);
        this.zza.zzj.zza.clear();
    }

    public final void zzp() {
        if (this.zzk) {
            this.zza.zzq.removeMessages(11, this.zze);
            this.zza.zzq.removeMessages(9, this.zze);
            this.zzk = false;
        }
    }

    public final void zzq() {
        this.zza.zzq.removeMessages(12, this.zze);
        Handler handler = this.zza.zzq;
        handler.sendMessageDelayed(handler.obtainMessage(12, this.zze), this.zza.zze);
    }

    public final void zzb(ConnectionResult connectionResult) {
        for (zzk zzkVar : this.zzg) {
            String str = null;
            if (connectionResult == ConnectionResult.zza) {
                str = this.zzc.zzab();
            }
            zzkVar.zza(this.zze, connectionResult, str);
        }
        this.zzg.clear();
    }

    public final void zza() {
        R$string.zza(this.zza.zzq);
        Status status = zzbn.zza;
        zza(status);
        zzaf zzafVar = this.zzf;
        Objects.requireNonNull(zzafVar);
        zzafVar.zza(false, status);
        for (zzcl zzclVar : (zzcl[]) this.zzh.keySet().toArray(new zzcl[this.zzh.size()])) {
            zza(new zzg(zzclVar, new TaskCompletionSource()));
        }
        zzb(new ConnectionResult(4));
        if (this.zzc.isConnected()) {
            this.zzc.onUserSignOut(new zzbt(this));
        }
    }

    public final void zza(Status status) {
        R$string.zza(this.zza.zzq);
        for (zzb zzbVar : this.zzb) {
            zzbVar.zza(status);
        }
        this.zzb.clear();
    }
}
