package com.google.android.gms.common.api.internal;

import android.os.RemoteException;
import com.google.android.gms.tasks.TaskCompletionSource;
/* loaded from: classes.dex */
public final class zzg extends zzc<Boolean> {
    public final zzcl<?> zzb;

    public zzg(zzcl<?> zzclVar, TaskCompletionSource<Boolean> taskCompletionSource) {
        super(4, taskCompletionSource);
        this.zzb = zzclVar;
    }

    @Override // com.google.android.gms.common.api.internal.zzb
    public final /* bridge */ /* synthetic */ void zza(zzaf zzafVar, boolean z) {
    }

    @Override // com.google.android.gms.common.api.internal.zzc
    public final void zzb(zzbp<?> zzbpVar) throws RemoteException {
        if (zzbpVar.zzh.remove(this.zzb) == null) {
            this.zza.trySetResult(Boolean.FALSE);
            return;
        }
        throw null;
    }
}
