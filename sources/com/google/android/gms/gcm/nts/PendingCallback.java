package com.google.android.gms.gcm.nts;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.ReflectedParcelable;
@Deprecated
/* loaded from: classes.dex */
public class PendingCallback implements ReflectedParcelable {
    public static final Parcelable.Creator<PendingCallback> CREATOR = new zza();
    public final IBinder zza;

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeStrongBinder(this.zza);
    }

    public PendingCallback(Parcel parcel) {
        this.zza = parcel.readStrongBinder();
    }
}
