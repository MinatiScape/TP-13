package com.google.android.gms.common.api.internal;

import com.google.android.gms.common.ConnectionResult;
import java.util.Collections;
/* compiled from: GoogleApiManager.java */
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
        boolean z;
        if (this.zza.zzc == 0) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            zzbv zzbvVar = this.zzb;
            zzbvVar.zzf = true;
            if (zzbvVar.zzb.requiresSignIn()) {
                this.zzb.zza$1();
            } else {
                this.zzb.zzb.getRemoteService(null, Collections.emptySet());
            }
        } else {
            zzbv zzbvVar2 = this.zzb;
            ((zzbp) zzbvVar2.zza.zzm.get(zzbvVar2.zzc)).onConnectionFailed(this.zza);
        }
    }
}
