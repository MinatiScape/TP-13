package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.slice.view.R$layout;
/* loaded from: classes.dex */
public final class zzbmb extends zzbkv {
    public static final Parcelable.Creator<zzbmb> CREATOR = new zzbmd();
    public final String zza;
    public final int zzb;
    public final int zzc;

    public zzbmb(int i, String str, int i2) {
        this.zzc = i;
        this.zza = str;
        this.zzb = i2;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$layout.zzb(parcel, 20293);
        int i2 = this.zzc;
        R$layout.zzb(parcel, 1, 4);
        parcel.writeInt(i2);
        R$layout.zza(parcel, 2, this.zza, false);
        int i3 = this.zzb;
        R$layout.zzb(parcel, 3, 4);
        parcel.writeInt(i3);
        R$layout.zzc(parcel, zzb);
    }

    public zzbmb(String str, int i) {
        this.zzc = 1;
        this.zza = str;
        this.zzb = i;
    }
}
