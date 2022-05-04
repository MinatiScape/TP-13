package com.google.android.gms.clearcut.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.clearcut.LogEventParcelable;
import com.google.android.gms.internal.zzez;
import com.google.android.gms.internal.zzfb;
/* compiled from: IClearcutLoggerService.java */
/* loaded from: classes.dex */
public final class zzr extends zzez implements zzq {
    public zzr(IBinder iBinder) {
        super(iBinder, "com.google.android.gms.clearcut.internal.IClearcutLoggerService");
    }

    @Override // com.google.android.gms.clearcut.internal.zzq
    public final void zza(zzh zzhVar, LogEventParcelable logEventParcelable) throws RemoteException {
        Parcel a_ = a_();
        int i = zzfb.$r8$clinit;
        a_.writeStrongBinder(zzhVar);
        if (logEventParcelable == null) {
            a_.writeInt(0);
        } else {
            a_.writeInt(1);
            logEventParcelable.writeToParcel(a_, 0);
        }
        zzc(a_);
    }
}
