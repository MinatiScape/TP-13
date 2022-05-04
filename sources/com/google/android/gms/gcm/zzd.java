package com.google.android.gms.gcm;

import android.os.Parcel;
import android.os.Parcelable;
/* loaded from: classes.dex */
public final class zzd implements Parcelable.Creator<OneoffTask> {
    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ OneoffTask createFromParcel(Parcel parcel) {
        return new OneoffTask(parcel, null);
    }

    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ OneoffTask[] newArray(int i) {
        return new OneoffTask[i];
    }
}
