package com.google.android.gms.common.api.internal;

import android.os.RemoteException;
import com.google.android.gms.tasks.TaskCompletionSource;
/* compiled from: ApiCallRunner.java */
/* loaded from: classes.dex */
public final class zzg extends zzc<Boolean> {
    public final zzcl<?> zzb;

    @Override // com.google.android.gms.common.api.internal.zzb
    public final /* bridge */ /* synthetic */ void zza(zzaf zzafVar, boolean z) {
    }

    @Override // com.google.android.gms.common.api.internal.zzc
    public final void zzb(zzbp<?> zzbpVar) throws RemoteException {
        if (((zzcw) zzbpVar.zzh.remove(this.zzb)) == null) {
            this.zza.trySetResult(Boolean.FALSE);
            return;
        }
        throw null;
    }

    public zzg(zzcl<?> zzclVar, TaskCompletionSource<Boolean> taskCompletionSource) {
        super(taskCompletionSource);
        this.zzb = zzclVar;
    }
}
