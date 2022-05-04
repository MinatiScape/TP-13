package com.google.android.gms.common.internal;

import android.os.IInterface;
import android.os.RemoteException;
import com.google.android.gms.common.internal.BaseGmsClient;
/* loaded from: classes.dex */
public interface IGmsServiceBroker extends IInterface {
    void getService(BaseGmsClient.zzd zzdVar, GetServiceRequest getServiceRequest) throws RemoteException;
}
