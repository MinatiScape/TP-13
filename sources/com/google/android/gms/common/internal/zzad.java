package com.google.android.gms.common.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.common.internal.BaseGmsClient;
/* compiled from: IGmsServiceBroker.java */
/* loaded from: classes.dex */
public final class zzad implements IGmsServiceBroker {
    public final IBinder zza;

    public zzad(IBinder iBinder) {
        this.zza = iBinder;
    }

    @Override // com.google.android.gms.common.internal.IGmsServiceBroker
    public final void getService(BaseGmsClient.zzd zzdVar, GetServiceRequest getServiceRequest) throws RemoteException {
        Parcel obtain = Parcel.obtain();
        Parcel obtain2 = Parcel.obtain();
        try {
            obtain.writeInterfaceToken("com.google.android.gms.common.internal.IGmsServiceBroker");
            obtain.writeStrongBinder(zzdVar);
            obtain.writeInt(1);
            getServiceRequest.writeToParcel(obtain, 0);
            this.zza.transact(46, obtain, obtain2, 0);
            obtain2.readException();
        } finally {
            obtain2.recycle();
            obtain.recycle();
        }
    }

    @Override // android.os.IInterface
    public final IBinder asBinder() {
        return this.zza;
    }
}
