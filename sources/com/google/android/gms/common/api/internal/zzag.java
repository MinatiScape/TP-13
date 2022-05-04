package com.google.android.gms.common.api.internal;

import com.google.android.gms.common.api.PendingResult;
/* compiled from: ConnectionlessInProgressCalls.java */
/* loaded from: classes.dex */
public final class zzag implements PendingResult.zza {
    public final /* synthetic */ BasePendingResult zza;
    public final /* synthetic */ zzaf zzb;

    public zzag(zzaf zzafVar, zzn zznVar) {
        this.zzb = zzafVar;
        this.zza = zznVar;
    }

    @Override // com.google.android.gms.common.api.PendingResult.zza
    public final void zza() {
        this.zzb.zza.remove(this.zza);
    }
}
