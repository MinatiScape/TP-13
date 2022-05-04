package com.google.android.gms.common.server.response;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.server.response.FastJsonResponse;
import com.google.android.gms.internal.zzbkw;
import com.google.android.gms.internal.zzbly;
/* loaded from: classes.dex */
public final class FieldCreator implements Parcelable.Creator<FastJsonResponse.Field> {
    @Override // android.os.Parcelable.Creator
    public final FastJsonResponse.Field createFromParcel(Parcel parcel) {
        int zza = zzbkw.zza(parcel);
        String str = null;
        String str2 = null;
        zzbly zzblyVar = null;
        int i = 0;
        int i2 = 0;
        boolean z = false;
        int i3 = 0;
        boolean z2 = false;
        int i4 = 0;
        while (parcel.dataPosition() < zza) {
            int readInt = parcel.readInt();
            switch (65535 & readInt) {
                case 1:
                    i = zzbkw.zzg(parcel, readInt);
                    break;
                case 2:
                    i2 = zzbkw.zzg(parcel, readInt);
                    break;
                case 3:
                    z = zzbkw.zzc(parcel, readInt);
                    break;
                case 4:
                    i3 = zzbkw.zzg(parcel, readInt);
                    break;
                case 5:
                    z2 = zzbkw.zzc(parcel, readInt);
                    break;
                case 6:
                    str = zzbkw.zzq(parcel, readInt);
                    break;
                case 7:
                    i4 = zzbkw.zzg(parcel, readInt);
                    break;
                case 8:
                    str2 = zzbkw.zzq(parcel, readInt);
                    break;
                case 9:
                    zzblyVar = (zzbly) zzbkw.zza(parcel, readInt, zzbly.CREATOR);
                    break;
                default:
                    zzbkw.zzb(parcel, readInt);
                    break;
            }
        }
        zzbkw.zzae(parcel, zza);
        return new FastJsonResponse.Field(i, i2, z, i3, z2, str, i4, str2, zzblyVar);
    }

    @Override // android.os.Parcelable.Creator
    public final FastJsonResponse.Field[] newArray(int i) {
        return new FastJsonResponse.Field[i];
    }
}
