package com.google.android.gms.gcm;

import android.os.Parcel;
import android.os.Parcelable;
import com.adobe.xmp.impl.ParseRDF$$ExternalSyntheticOutline0;
/* loaded from: classes.dex */
public class OneoffTask extends Task {
    public static final Parcelable.Creator<OneoffTask> CREATOR = new zzd();
    public final long zza;
    public final long zzb;

    public OneoffTask(Parcel parcel) {
        super(parcel);
        this.zza = parcel.readLong();
        this.zzb = parcel.readLong();
    }

    public final String toString() {
        String obj = super.toString();
        long j = this.zza;
        long j2 = this.zzb;
        StringBuilder sb = new StringBuilder(ParseRDF$$ExternalSyntheticOutline0.m(obj, 64));
        sb.append(obj);
        sb.append(" windowStart=");
        sb.append(j);
        sb.append(" windowEnd=");
        sb.append(j2);
        return sb.toString();
    }

    @Override // com.google.android.gms.gcm.Task, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeLong(this.zza);
        parcel.writeLong(this.zzb);
    }
}
