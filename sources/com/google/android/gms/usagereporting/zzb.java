package com.google.android.gms.usagereporting;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.internal.zzbkw;
/* compiled from: UsageReportingOptInOptionsCreator.java */
/* loaded from: classes.dex */
public final class zzb implements Parcelable.Creator<UsageReportingOptInOptions> {
    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ UsageReportingOptInOptions createFromParcel(Parcel parcel) {
        int zza = zzbkw.zza(parcel);
        int i = 0;
        while (parcel.dataPosition() < zza) {
            int readInt = parcel.readInt();
            if ((65535 & readInt) != 2) {
                zzbkw.zzb(parcel, readInt);
            } else {
                i = zzbkw.zzg(parcel, readInt);
            }
        }
        zzbkw.zzae(parcel, zza);
        return new UsageReportingOptInOptions(i);
    }

    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ UsageReportingOptInOptions[] newArray(int i) {
        return new UsageReportingOptInOptions[i];
    }
}
