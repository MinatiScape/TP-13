package com.google.android.gms.common.api.internal;

import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.IAccountAccessor;
import java.util.Collections;
/* loaded from: classes.dex */
public final class zzbw implements Runnable {
    public final /* synthetic */ ConnectionResult zza;
    public final /* synthetic */ zzbv zzb;

    public zzbw(zzbv zzbvVar, ConnectionResult connectionResult) {
        this.zzb = zzbvVar;
        this.zza = connectionResult;
    }

    @Override // java.lang.Runnable
    public final void run() {
        IAccountAccessor iAccountAccessor;
        if (this.zza.isSuccess()) {
            zzbv zzbvVar = this.zzb;
            zzbvVar.zzf = true;
            if (zzbvVar.zzb.requiresSignIn()) {
                zzbv zzbvVar2 = this.zzb;
                if (zzbvVar2.zzf && (iAccountAccessor = zzbvVar2.zzd) != null) {
                    zzbvVar2.zzb.getRemoteService(iAccountAccessor, zzbvVar2.zze);
                    return;
                }
                return;
            }
            this.zzb.zzb.getRemoteService(null, Collections.emptySet());
            return;
        }
        zzbv zzbvVar3 = this.zzb;
        zzbvVar3.zza.zzm.get(zzbvVar3.zzc).onConnectionFailed(this.zza);
    }
}
