package com.google.android.gms.gcm;

import android.os.Parcel;
import android.os.Parcelable;
import com.adobe.xmp.impl.ParseRDF$$ExternalSyntheticOutline0;
/* loaded from: classes.dex */
public class PeriodicTask extends Task {
    public static final Parcelable.Creator<PeriodicTask> CREATOR = new zzf();
    public long mFlexInSeconds;
    public long mIntervalInSeconds;

    public PeriodicTask(Parcel parcel) {
        super(parcel);
        this.mIntervalInSeconds = -1L;
        this.mFlexInSeconds = -1L;
        this.mIntervalInSeconds = parcel.readLong();
        this.mFlexInSeconds = Math.min(parcel.readLong(), this.mIntervalInSeconds);
    }

    public final String toString() {
        String obj = super.toString();
        long j = this.mIntervalInSeconds;
        long j2 = this.mFlexInSeconds;
        StringBuilder sb = new StringBuilder(ParseRDF$$ExternalSyntheticOutline0.m(obj, 54));
        sb.append(obj);
        sb.append(" period=");
        sb.append(j);
        sb.append(" flex=");
        sb.append(j2);
        return sb.toString();
    }

    @Override // com.google.android.gms.gcm.Task, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeLong(this.mIntervalInSeconds);
        parcel.writeLong(this.mFlexInSeconds);
    }
}
