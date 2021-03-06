package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
/* compiled from: ConverterWrapperCreator.java */
/* loaded from: classes.dex */
public final class zzblz implements Parcelable.Creator<zzbly> {
    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ zzbly createFromParcel(Parcel parcel) {
        int zza = zzbkw.zza(parcel);
        int i = 0;
        zzbma zzbmaVar = null;
        while (parcel.dataPosition() < zza) {
            int readInt = parcel.readInt();
            int i2 = 65535 & readInt;
            if (i2 == 1) {
                i = zzbkw.zzg(parcel, readInt);
            } else if (i2 != 2) {
                zzbkw.zzb(parcel, readInt);
            } else {
                zzbmaVar = (zzbma) zzbkw.zza(parcel, readInt, zzbma.CREATOR);
            }
        }
        zzbkw.zzae(parcel, zza);
        return new zzbly(i, zzbmaVar);
    }

    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ zzbly[] newArray(int i) {
        return new zzbly[i];
    }
}
