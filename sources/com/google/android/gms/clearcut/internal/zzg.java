package com.google.android.gms.clearcut.internal;

import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.clearcut.ClearcutLogger;
import com.google.android.gms.clearcut.Counters;
import com.google.android.gms.clearcut.LogEventParcelable;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.internal.zzbx;
import com.google.android.gms.common.api.internal.zzn;
import com.google.android.gms.internal.zzgrz;
import com.google.android.gms.internal.zzgsv;
/* compiled from: ClearcutLoggerApiImpl.java */
/* loaded from: classes.dex */
public final class zzg extends zzn<Status, zzi> {
    public final LogEventParcelable zza;

    @Override // com.google.android.gms.common.api.internal.BasePendingResult
    public final /* synthetic */ Status zza(Status status) {
        return status;
    }

    @Override // com.google.android.gms.common.api.internal.zzn
    public final void zza(Api.Client client) throws RemoteException {
        zzi zziVar = (zzi) client;
        zzh zzhVar = new zzh(this);
        try {
            LogEventParcelable logEventParcelable = this.zza;
            ClearcutLogger.MessageProducer messageProducer = logEventParcelable.extensionProducer;
            if (messageProducer != null) {
                zzgsv zzgsvVar = logEventParcelable.logEvent;
                if (zzgsvVar.zzf.length == 0) {
                    zzgsvVar.zzf = zzgrz.toByteArray(((Counters.zzb) messageProducer).zza());
                }
            }
            ClearcutLogger.MessageProducer messageProducer2 = logEventParcelable.clientVisualElementsProducer;
            if (messageProducer2 != null) {
                zzgsv zzgsvVar2 = logEventParcelable.logEvent;
                if (zzgsvVar2.zzh.length == 0) {
                    zzgsvVar2.zzh = zzgrz.toByteArray(((Counters.zzb) messageProducer2).zza());
                }
            }
            logEventParcelable.logEventBytes = zzgrz.toByteArray(logEventParcelable.logEvent);
            ((zzq) zziVar.zzag()).zza(zzhVar, this.zza);
        } catch (RuntimeException e) {
            Log.e("ClearcutLoggerApiImpl", "derived ClearcutLogger.MessageProducer ", e);
            zzc(new Status(10, "MessageProducer"));
        }
    }

    public zzg(LogEventParcelable logEventParcelable, zzbx zzbxVar) {
        super(ClearcutLogger.API, zzbxVar);
        this.zza = logEventParcelable;
    }
}
