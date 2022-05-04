package com.google.android.gms.common.api.internal;

import com.google.android.gms.internal.zzelx;
/* compiled from: SignInCoordinator.java */
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
        zzdb.zza(this.zzb, this.zza);
    }
}
