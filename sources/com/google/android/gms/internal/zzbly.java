package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.core.R$id;
/* compiled from: ConverterWrapper.java */
/* loaded from: classes.dex */
public final class zzbly extends zzbkv {
    public static final Parcelable.Creator<zzbly> CREATOR = new zzblz();
    public final int zza;
    public final zzbma zzb;

    public zzbly(int i, zzbma zzbmaVar) {
        this.zza = i;
        this.zzb = zzbmaVar;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$id.zzb(parcel, 20293);
        int i2 = this.zza;
        R$id.zzb(parcel, 1, 4);
        parcel.writeInt(i2);
        R$id.zza(parcel, 2, this.zzb, i);
        R$id.zzc(parcel, zzb);
    }

    public zzbly(zzbma zzbmaVar) {
        this.zza = 1;
        this.zzb = zzbmaVar;
    }
}
