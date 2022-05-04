package com.google.android.gms.common.api.internal;

import com.google.android.gms.common.ConnectionResult;
/* compiled from: SignInCoordinator.java */
/* loaded from: classes.dex */
public final class zzdc implements Runnable {
    public final /* synthetic */ zzdb zza;

    public zzdc(zzdb zzdbVar) {
        this.zza = zzdbVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzde zzdeVar;
        zzdeVar = this.zza.zzh;
        ((zzbv) zzdeVar).zza(new ConnectionResult(4));
    }
}
