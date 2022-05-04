package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.core.R$id;
import com.google.android.gms.common.internal.zzav;
/* compiled from: SignInRequest.java */
/* loaded from: classes.dex */
public final class zzelv extends zzbkv {
    public static final Parcelable.Creator<zzelv> CREATOR = new zzelw();
    public final int zza;
    public final zzav zzb;

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$id.zzb(parcel, 20293);
        int i2 = this.zza;
        R$id.zzb(parcel, 1, 4);
        parcel.writeInt(i2);
        R$id.zza(parcel, 2, this.zzb, i);
        R$id.zzc(parcel, zzb);
    }

    public zzelv(int i, zzav zzavVar) {
        this.zza = i;
        this.zzb = zzavVar;
    }
}
