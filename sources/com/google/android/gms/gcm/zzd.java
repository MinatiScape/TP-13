package com.google.android.gms.gcm;

import android.os.Parcel;
import android.os.Parcelable;
/* compiled from: OneoffTask.java */
/* loaded from: classes.dex */
public final class zzd implements Parcelable.Creator<OneoffTask> {
    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ OneoffTask createFromParcel(Parcel parcel) {
        return new OneoffTask(parcel);
    }

    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ OneoffTask[] newArray(int i) {
        return new OneoffTask[i];
    }
}
