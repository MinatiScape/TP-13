package com.google.android.gms.common.api.internal;

import android.os.DeadObjectException;
import android.os.RemoteException;
import com.adobe.xmp.impl.ParseRDF$$ExternalSyntheticOutline0;
import com.adobe.xmp.impl.XMPNode$$ExternalSyntheticOutline0;
import com.google.android.gms.clearcut.internal.zzg;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.internal.zzn;
/* compiled from: ApiCallRunner.java */
/* loaded from: classes.dex */
public final class zzd<A extends zzn<? extends Result, Object>> extends zzb {
    public final A zza;

    @Override // com.google.android.gms.common.api.internal.zzb
    public final void zza(zzbp<?> zzbpVar) throws DeadObjectException {
        try {
            A a = this.zza;
            Api.Client client = zzbpVar.zzc;
            a.getClass();
            try {
                a.zza(client);
            } catch (DeadObjectException e) {
                a.zzc(new Status(1, 8, e.getLocalizedMessage(), null));
                throw e;
            } catch (RemoteException e2) {
                a.zzc(new Status(1, 8, e2.getLocalizedMessage(), null));
            }
        } catch (RuntimeException e3) {
            String simpleName = e3.getClass().getSimpleName();
            String localizedMessage = e3.getLocalizedMessage();
            this.zza.zzc(new Status(10, XMPNode$$ExternalSyntheticOutline0.m(ParseRDF$$ExternalSyntheticOutline0.m(localizedMessage, simpleName.length() + 2), simpleName, ": ", localizedMessage)));
        }
    }

    public zzd(zzg zzgVar) {
        this.zza = zzgVar;
    }

    @Override // com.google.android.gms.common.api.internal.zzb
    public final void zza(Status status) {
        this.zza.zzc(status);
    }

    @Override // com.google.android.gms.common.api.internal.zzb
    public final void zza(zzaf zzafVar, boolean z) {
        A a = this.zza;
        zzafVar.zza.put(a, Boolean.valueOf(z));
        zzag zzagVar = new zzag(zzafVar, a);
        a.getClass();
        synchronized (a.zza) {
            if (a.zze()) {
                zzagVar.zza();
            } else {
                a.zzf.add(zzagVar);
            }
        }
    }
}
