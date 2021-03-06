package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayList;
/* compiled from: StringToIntConverterCreator.java */
/* loaded from: classes.dex */
public final class zzbmc implements Parcelable.Creator<zzbma> {
    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ zzbma createFromParcel(Parcel parcel) {
        int zza = zzbkw.zza(parcel);
        int i = 0;
        ArrayList arrayList = null;
        while (parcel.dataPosition() < zza) {
            int readInt = parcel.readInt();
            int i2 = 65535 & readInt;
            if (i2 == 1) {
                i = zzbkw.zzg(parcel, readInt);
            } else if (i2 != 2) {
                zzbkw.zzb(parcel, readInt);
            } else {
                arrayList = zzbkw.zzc(parcel, readInt, zzbmb.CREATOR);
            }
        }
        zzbkw.zzae(parcel, zza);
        return new zzbma(i, arrayList);
    }

    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ zzbma[] newArray(int i) {
        return new zzbma[i];
    }
}
