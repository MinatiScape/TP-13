package com.google.android.gms.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.RemoteException;
/* compiled from: ISignInService.java */
/* loaded from: classes.dex */
public final class zzelt extends zzez implements zzels {
    public zzelt(IBinder iBinder) {
        super(iBinder, "com.google.android.gms.signin.internal.ISignInService");
    }

    @Override // com.google.android.gms.internal.zzels
    public final void zza(zzelv zzelvVar, zzelq zzelqVar) throws RemoteException {
        Parcel a_ = a_();
        int i = zzfb.$r8$clinit;
        a_.writeInt(1);
        zzelvVar.writeToParcel(a_, 0);
        if (zzelqVar == null) {
            a_.writeStrongBinder(null);
        } else {
            a_.writeStrongBinder((zzfa) zzelqVar);
        }
        zzb(12, a_);
    }
}
