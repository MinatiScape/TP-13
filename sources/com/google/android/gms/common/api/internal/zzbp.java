package com.google.android.gms.common.api.internal;

import android.content.Context;
import android.os.DeadObjectException;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import com.adobe.xmp.impl.ParseRDF$$ExternalSyntheticOutline0;
import com.adobe.xmp.impl.XMPNode$$ExternalSyntheticOutline0;
import com.android.wallpaper.util.LaunchUtils;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GoogleApiAvailabilityLight;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions;
import com.google.android.gms.common.api.GoogleApi;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.ClientSettings;
import com.google.android.gms.common.internal.zzv;
import com.google.android.gms.tasks.TaskCompletionSource;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
/* compiled from: GoogleApiManager.java */
/* loaded from: classes.dex */
public final class zzbp<O extends Api.ApiOptions> implements GoogleApiClient.ConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener {
    public final /* synthetic */ zzbn zza;
    public final Api.Client zzc;
    public final Api.Client zzd;
    public final zzi<O> zze;
    public final zzaf zzf;
    public final int zzi;
    public final zzdb zzj;
    public boolean zzk;
    public final LinkedList zzb = new LinkedList();
    public final HashSet zzg = new HashSet();
    public final HashMap zzh = new HashMap();
    public ConnectionResult zzm = null;

    public final void zza(zzb zzbVar) {
        LaunchUtils.zza(this.zza.zzq);
        if (this.zzc.isConnected()) {
            zzbVar.zza(this.zzf, this.zzc.requiresSignIn());
            try {
                zzbVar.zza((zzbp<?>) this);
            } catch (DeadObjectException unused) {
                onConnectionSuspended();
                this.zzc.disconnect();
            }
            zzq();
            return;
        }
        this.zzb.add(zzbVar);
        ConnectionResult connectionResult = this.zzm;
        if (connectionResult != null) {
            if ((connectionResult.zzc == 0 || connectionResult.zzd == null) ? false : true) {
                onConnectionFailed(connectionResult);
                return;
            }
        }
        zzi();
    }

    public zzbp(zzbn zzbnVar, GoogleApi<O> googleApi) {
        boolean z;
        this.zza = zzbnVar;
        Looper looper = zzbnVar.zzq.getLooper();
        ClientSettings.zza zza = googleApi.zza();
        ClientSettings clientSettings = new ClientSettings(zza.zza, zza.zzb, zza.zzd, zza.zze);
        Api<O> api = googleApi.zzc;
        if (api.zza != null) {
            z = true;
        } else {
            z = false;
        }
        LaunchUtils.zza(z, "This API was constructed with a SimpleClientBuilder. Use getSimpleClientBuilder");
        Api.Client zza2 = api.zza.zza(googleApi.zzb, looper, clientSettings, googleApi.zzd, this, this);
        this.zzc = zza2;
        this.zzd = zza2;
        this.zze = googleApi.zze;
        this.zzf = new zzaf();
        this.zzi = googleApi.zzg;
        if (zza2.requiresSignIn()) {
            Context context = zzbnVar.zzh;
            Handler handler = zzbnVar.zzq;
            ClientSettings.zza zza3 = googleApi.zza();
            this.zzj = new zzdb(context, handler, new ClientSettings(zza3.zza, zza3.zzb, zza3.zzd, zza3.zze));
            return;
        }
        this.zzj = null;
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener
    public final void onConnectionFailed(ConnectionResult connectionResult) {
        LaunchUtils.zza(this.zza.zzq);
        zzdb zzdbVar = this.zzj;
        if (zzdbVar != null) {
            zzdbVar.zzb$3();
        }
        LaunchUtils.zza(this.zza.zzq);
        this.zzm = null;
        this.zza.zzj.zza.clear();
        zzb(connectionResult);
        if (connectionResult.zzc == 4) {
            zza(zzbn.zzb);
        } else if (this.zzb.isEmpty()) {
            this.zzm = connectionResult;
        } else {
            synchronized (zzbn.zzf) {
                this.zza.getClass();
            }
            if (!this.zza.zza(connectionResult, this.zzi)) {
                if (connectionResult.zzc == 18) {
                    this.zzk = true;
                }
                if (this.zzk) {
                    Handler handler = this.zza.zzq;
                    Message obtain = Message.obtain(handler, 9, this.zze);
                    this.zza.getClass();
                    handler.sendMessageDelayed(obtain, 5000L);
                    return;
                }
                String str = this.zze.zzc.zze;
                zza(new Status(17, XMPNode$$ExternalSyntheticOutline0.m(ParseRDF$$ExternalSyntheticOutline0.m(str, 38), "API: ", str, " is not available on this device.")));
            }
        }
    }

    public final void zza$5() {
        LaunchUtils.zza(this.zza.zzq);
        Status status = zzbn.zza;
        zza(status);
        zzaf zzafVar = this.zzf;
        zzafVar.getClass();
        zzafVar.zza(false, status);
        for (zzcl zzclVar : (zzcl[]) this.zzh.keySet().toArray(new zzcl[this.zzh.size()])) {
            zza(new zzg(zzclVar, new TaskCompletionSource()));
        }
        zzb(new ConnectionResult(4));
        if (this.zzc.isConnected()) {
            this.zzc.onUserSignOut(new zzbt(this));
        }
    }

    public final void zzb(ConnectionResult connectionResult) {
        Iterator it = this.zzg.iterator();
        if (it.hasNext()) {
            zzk zzkVar = (zzk) it.next();
            if (connectionResult == ConnectionResult.zza) {
                this.zzc.zzab();
            }
            zzkVar.getClass();
            throw null;
        }
        this.zzg.clear();
    }

    public final void zzi() {
        LaunchUtils.zza(this.zza.zzq);
        if (!this.zzc.isConnected() && !this.zzc.isConnecting()) {
            zzbn zzbnVar = this.zza;
            zzv zzvVar = zzbnVar.zzj;
            Context context = zzbnVar.zzh;
            Api.Client client = this.zzc;
            zzvVar.getClass();
            LaunchUtils.zza(context);
            LaunchUtils.zza(client);
            client.requiresGooglePlayServices();
            int i = 0;
            client.zza();
            int i2 = zzvVar.zza.get(12529000, -1);
            if (i2 == -1) {
                int i3 = 0;
                while (true) {
                    if (i3 >= zzvVar.zza.size()) {
                        i = i2;
                        break;
                    }
                    int keyAt = zzvVar.zza.keyAt(i3);
                    if (keyAt > 12529000 && zzvVar.zza.get(keyAt) == 0) {
                        break;
                    }
                    i3++;
                }
                if (i == -1) {
                    zzvVar.zzb.getClass();
                    i2 = GoogleApiAvailabilityLight.isGooglePlayServicesAvailable(context, 12529000);
                } else {
                    i2 = i;
                }
                zzvVar.zza.put(12529000, i2);
            }
            if (i2 != 0) {
                onConnectionFailed(new ConnectionResult(i2, null));
                return;
            }
            zzbn zzbnVar2 = this.zza;
            Api.Client client2 = this.zzc;
            zzbv zzbvVar = new zzbv(zzbnVar2, client2, this.zze);
            if (client2.requiresSignIn()) {
                this.zzj.zza(zzbvVar);
            }
            this.zzc.connect(zzbvVar);
        }
    }

    public final void zzn() {
        LaunchUtils.zza(this.zza.zzq);
        this.zzm = null;
        zzb(ConnectionResult.zza);
        zzp();
        for (zzcw zzcwVar : this.zzh.values()) {
            try {
                zzcwVar.getClass();
                new TaskCompletionSource();
                throw null;
            } catch (DeadObjectException unused) {
                onConnectionSuspended();
                this.zzc.disconnect();
            } catch (RemoteException unused2) {
            }
        }
        while (this.zzc.isConnected() && !this.zzb.isEmpty()) {
            zzb zzbVar = (zzb) this.zzb.remove();
            zzbVar.zza(this.zzf, this.zzc.requiresSignIn());
            try {
                zzbVar.zza((zzbp<?>) this);
            } catch (DeadObjectException unused3) {
                onConnectionSuspended();
                this.zzc.disconnect();
            }
        }
        zzq();
    }

    public final void zzo() {
        LaunchUtils.zza(this.zza.zzq);
        this.zzm = null;
        this.zzk = true;
        zzaf zzafVar = this.zzf;
        zzafVar.getClass();
        zzafVar.zza(true, zzdr.zza);
        Handler handler = this.zza.zzq;
        Message obtain = Message.obtain(handler, 9, this.zze);
        this.zza.getClass();
        handler.sendMessageDelayed(obtain, 5000L);
        Handler handler2 = this.zza.zzq;
        Message obtain2 = Message.obtain(handler2, 11, this.zze);
        this.zza.getClass();
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

    @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
    public final void onConnected() {
        if (Looper.myLooper() == this.zza.zzq.getLooper()) {
            zzn();
        } else {
            this.zza.zzq.post(new zzbq(this));
        }
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
    public final void onConnectionSuspended() {
        if (Looper.myLooper() == this.zza.zzq.getLooper()) {
            zzo();
        } else {
            this.zza.zzq.post(new zzbr(this));
        }
    }

    public final void zza(Status status) {
        LaunchUtils.zza(this.zza.zzq);
        for (zzb zzbVar : this.zzb) {
            zzbVar.zza(status);
        }
        this.zzb.clear();
    }
}
