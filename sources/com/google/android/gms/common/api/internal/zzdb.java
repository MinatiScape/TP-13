package com.google.android.gms.common.api.internal;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.ClientSettings;
import com.google.android.gms.common.internal.IAccountAccessor;
import com.google.android.gms.common.internal.zzax;
import com.google.android.gms.internal.zzelp;
import com.google.android.gms.internal.zzelx;
import com.google.android.gms.signin.SignInOptions;
import com.google.android.gms.signin.zza;
import com.google.android.gms.signin.zzb;
import com.google.android.gms.signin.zzd;
import java.util.Set;
/* compiled from: SignInCoordinator.java */
/* loaded from: classes.dex */
public final class zzdb extends zzelp implements GoogleApiClient.ConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener {
    private static zzb zza = zza.zza;
    private final Context zzb;
    private final Handler zzc;
    private final Api.zza<? extends zzd, SignInOptions> zzd;
    private Set<Scope> zze;
    private ClientSettings zzf;
    private zzd zzg;
    private zzde zzh;

    public final void zza(zzbv zzbvVar) {
        zzd zzdVar = this.zzg;
        if (zzdVar != null) {
            zzdVar.disconnect();
        }
        this.zzf.zzj = Integer.valueOf(System.identityHashCode(this));
        Api.zza<? extends zzd, SignInOptions> zzaVar = this.zzd;
        Context context = this.zzb;
        Looper looper = this.zzc.getLooper();
        ClientSettings clientSettings = this.zzf;
        this.zzg = (zzd) zzaVar.zza(context, looper, clientSettings, clientSettings.zzi, this, this);
        this.zzh = zzbvVar;
        Set<Scope> set = this.zze;
        if (set == null || set.isEmpty()) {
            this.zzc.post(new zzdc(this));
        } else {
            this.zzg.zzd();
        }
    }

    public zzdb(Context context, Handler handler, ClientSettings clientSettings) {
        zzb zzbVar = zza;
        this.zzb = context;
        this.zzc = handler;
        this.zzf = clientSettings;
        this.zze = clientSettings.zzb;
        this.zzd = zzbVar;
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
    public final void onConnected() {
        this.zzg.zza(this);
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener
    public final void onConnectionFailed(ConnectionResult connectionResult) {
        ((zzbv) this.zzh).zza(connectionResult);
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
    public final void onConnectionSuspended() {
        this.zzg.disconnect();
    }

    public final void zzb$3() {
        zzd zzdVar = this.zzg;
        if (zzdVar != null) {
            zzdVar.disconnect();
        }
    }

    public final void zza(zzelx zzelxVar) {
        this.zzc.post(new zzdd(this, zzelxVar));
    }

    public static void zza(zzdb zzdbVar, zzelx zzelxVar) {
        zzdbVar.getClass();
        ConnectionResult connectionResult = zzelxVar.zzb;
        boolean z = true;
        if (connectionResult.zzc == 0) {
            zzax zzaxVar = zzelxVar.zzc;
            ConnectionResult connectionResult2 = zzaxVar.zzc;
            if (connectionResult2.zzc != 0) {
                z = false;
            }
            if (!z) {
                String valueOf = String.valueOf(connectionResult2);
                StringBuilder sb = new StringBuilder(valueOf.length() + 48);
                sb.append("Sign-in succeeded with resolve account failure: ");
                sb.append(valueOf);
                Log.wtf("SignInCoordinator", sb.toString(), new Exception());
                ((zzbv) zzdbVar.zzh).zza(connectionResult2);
                zzdbVar.zzg.disconnect();
                return;
            }
            zzde zzdeVar = zzdbVar.zzh;
            IAccountAccessor zza2 = zzaxVar.zza();
            Set<Scope> set = zzdbVar.zze;
            zzbv zzbvVar = (zzbv) zzdeVar;
            zzbvVar.getClass();
            if (zza2 == null || set == null) {
                Log.wtf("GoogleApiManager", "Received null response from onSignInSuccess", new Exception());
                zzbvVar.zza(new ConnectionResult(4));
            } else {
                zzbvVar.zzd = zza2;
                zzbvVar.zze = set;
                zzbvVar.zza$1();
            }
        } else {
            ((zzbv) zzdbVar.zzh).zza(connectionResult);
        }
        zzdbVar.zzg.disconnect();
    }
}
