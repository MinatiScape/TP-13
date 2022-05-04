package com.google.android.gms.gcm;

import android.os.Parcel;
import android.os.Parcelable;
/* compiled from: PeriodicTask.java */
/* loaded from: classes.dex */
public final class zzf implements Parcelable.Creator<PeriodicTask> {
    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ PeriodicTask createFromParcel(Parcel parcel) {
        return new PeriodicTask(parcel);
    }

    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ PeriodicTask[] newArray(int i) {
        return new PeriodicTask[i];
    }
}
