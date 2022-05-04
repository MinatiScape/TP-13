package com.google.android.gms.common.api.internal;

import android.util.Log;
import com.bumptech.glide.Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.IAccountAccessor;
import com.google.android.gms.common.internal.zzax;
import com.google.android.gms.internal.zzelx;
import java.util.Objects;
import java.util.Set;
/* loaded from: classes.dex */
public final class zzdd implements Runnable {
    public final /* synthetic */ zzelx zza;
    public final /* synthetic */ zzdb zzb;

    public zzdd(zzdb zzdbVar, zzelx zzelxVar) {
        this.zzb = zzdbVar;
        this.zza = zzelxVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzdb zzdbVar = this.zzb;
        zzelx zzelxVar = this.zza;
        Objects.requireNonNull(zzdbVar);
        ConnectionResult connectionResult = zzelxVar.zzb;
        if (connectionResult.isSuccess()) {
            zzax zzaxVar = zzelxVar.zzc;
            ConnectionResult connectionResult2 = zzaxVar.zzc;
            if (!connectionResult2.isSuccess()) {
                String valueOf = String.valueOf(connectionResult2);
                Log.wtf("SignInCoordinator", Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0.m(valueOf.length() + 48, "Sign-in succeeded with resolve account failure: ", valueOf), new Exception());
                ((zzbv) zzdbVar.zzh).zza(connectionResult2);
                zzdbVar.zzg.disconnect();
                return;
            }
            zzde zzdeVar = zzdbVar.zzh;
            IAccountAccessor zza = zzaxVar.zza();
            Set<Scope> set = zzdbVar.zze;
            zzbv zzbvVar = (zzbv) zzdeVar;
            Objects.requireNonNull(zzbvVar);
            if (zza == null || set == null) {
                Log.wtf("GoogleApiManager", "Received null response from onSignInSuccess", new Exception());
                zzbvVar.zza(new ConnectionResult(4));
            } else {
                zzbvVar.zzd = zza;
                zzbvVar.zze = set;
                if (zzbvVar.zzf) {
                    zzbvVar.zzb.getRemoteService(zza, set);
                }
            }
        } else {
            ((zzbv) zzdbVar.zzh).zza(connectionResult);
        }
        zzdbVar.zzg.disconnect();
    }
}
