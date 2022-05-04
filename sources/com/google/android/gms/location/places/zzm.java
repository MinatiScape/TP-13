package com.google.android.gms.location.places;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.internal.zzbkw;
/* compiled from: PlaceReportCreator.java */
/* loaded from: classes.dex */
public final class zzm implements Parcelable.Creator<PlaceReport> {
    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ PlaceReport createFromParcel(Parcel parcel) {
        int zza = zzbkw.zza(parcel);
        String str = null;
        String str2 = null;
        int i = 0;
        String str3 = null;
        while (parcel.dataPosition() < zza) {
            int readInt = parcel.readInt();
            int i2 = 65535 & readInt;
            if (i2 == 1) {
                i = zzbkw.zzg(parcel, readInt);
            } else if (i2 == 2) {
                str = zzbkw.zzq(parcel, readInt);
            } else if (i2 == 3) {
                str3 = zzbkw.zzq(parcel, readInt);
            } else if (i2 != 4) {
                zzbkw.zzb(parcel, readInt);
            } else {
                str2 = zzbkw.zzq(parcel, readInt);
            }
        }
        zzbkw.zzae(parcel, zza);
        return new PlaceReport(i, str, str3, str2);
    }

    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ PlaceReport[] newArray(int i) {
        return new PlaceReport[i];
    }
}
