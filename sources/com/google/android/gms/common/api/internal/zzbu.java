package com.google.android.gms.common.api.internal;
/* loaded from: classes.dex */
public final class zzbu implements Runnable {
    public final /* synthetic */ zzbt zza;

    public zzbu(zzbt zzbtVar) {
        this.zza = zzbtVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zza.zza.zzc.disconnect();
    }
}
