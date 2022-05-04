package com.google.android.gms.common.api.internal;

import android.os.DeadObjectException;
import android.os.RemoteException;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.tasks.TaskCompletionSource;
/* compiled from: ApiCallRunner.java */
/* loaded from: classes.dex */
public abstract class zzc<T> extends zzb {
    public final TaskCompletionSource<T> zza;

    @Override // com.google.android.gms.common.api.internal.zzb
    public final void zza(Status status) {
        this.zza.trySetException(new ApiException(status));
    }

    public abstract void zzb(zzbp<?> zzbpVar) throws RemoteException;

    public final void zza(RuntimeException runtimeException) {
        this.zza.trySetException(runtimeException);
    }

    public zzc(TaskCompletionSource taskCompletionSource) {
        this.zza = taskCompletionSource;
    }

    @Override // com.google.android.gms.common.api.internal.zzb
    public final void zza(zzbp<?> zzbpVar) throws DeadObjectException {
        try {
            zzb(zzbpVar);
        } catch (DeadObjectException e) {
            zza(zzb.zza(e));
            throw e;
        } catch (RemoteException e2) {
            zza(zzb.zza(e2));
        } catch (RuntimeException e3) {
            zza(e3);
        }
    }
}
