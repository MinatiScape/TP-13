package com.google.android.gms.common.server.response;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.internal.zzbkw;
/* compiled from: SafeParcelResponseCreator.java */
/* loaded from: classes.dex */
public final class zzm implements Parcelable.Creator<zzl> {
    @Override // android.os.Parcelable.Creator
    public final zzl createFromParcel(Parcel parcel) {
        int zza = zzbkw.zza(parcel);
        int i = 0;
        Parcel parcel2 = null;
        FieldMappingDictionary fieldMappingDictionary = null;
        while (parcel.dataPosition() < zza) {
            int readInt = parcel.readInt();
            int i2 = 65535 & readInt;
            if (i2 == 1) {
                i = zzbkw.zzg(parcel, readInt);
            } else if (i2 == 2) {
                int zza2 = zzbkw.zza(parcel, readInt);
                int dataPosition = parcel.dataPosition();
                if (zza2 == 0) {
                    parcel2 = null;
                } else {
                    Parcel obtain = Parcel.obtain();
                    obtain.appendFrom(parcel, dataPosition, zza2);
                    parcel.setDataPosition(dataPosition + zza2);
                    parcel2 = obtain;
                }
            } else if (i2 != 3) {
                zzbkw.zzb(parcel, readInt);
            } else {
                fieldMappingDictionary = (FieldMappingDictionary) zzbkw.zza(parcel, readInt, FieldMappingDictionary.CREATOR);
            }
        }
        zzbkw.zzae(parcel, zza);
        return new zzl(i, parcel2, fieldMappingDictionary);
    }

    @Override // android.os.Parcelable.Creator
    public final /* synthetic */ zzl[] newArray(int i) {
        return new zzl[i];
    }
}
