package com.google.android.gms.gcm.nts;

import android.os.Parcel;
import android.os.Parcelable;
/* loaded from: classes.dex */
public final class zza implements Parcelable.Creator<PendingCallback> {
    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ PendingCallback createFromParcel(Parcel parcel) {
        return new PendingCallback(parcel);
    }

    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ PendingCallback[] newArray(int i) {
        return new PendingCallback[i];
    }
}
