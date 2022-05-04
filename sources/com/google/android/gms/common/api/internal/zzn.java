package com.google.android.gms.common.api.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
/* compiled from: BaseImplementation.java */
/* loaded from: classes.dex */
public abstract class zzn<R extends Result, A> extends BasePendingResult<R> {
    public abstract void zza(Api.Client client) throws RemoteException;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zzn(Api api, zzbx zzbxVar) {
        super(zzbxVar);
        if (zzbxVar != null) {
            if (api == null) {
                throw new NullPointerException("Api must not be null");
            } else if (api.zzc == null) {
                throw new IllegalStateException("This API was constructed with null client keys. This should not be possible.");
            }
        } else {
            throw new NullPointerException("GoogleApiClient must not be null");
        }
    }

    public final void zzc(Status status) {
        boolean z;
        if (status.zzi <= 0) {
            z = true;
        } else {
            z = false;
        }
        if (!z) {
            zza((zzn<R, A>) status);
            return;
        }
        throw new IllegalArgumentException("Failed result must not be success");
    }
}
