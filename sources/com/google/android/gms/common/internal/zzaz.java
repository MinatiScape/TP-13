package com.google.android.gms.common.internal;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.slice.view.R$layout;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.internal.zzbkv;
/* loaded from: classes.dex */
public final class zzaz extends zzbkv {
    public static final Parcelable.Creator<zzaz> CREATOR = new zzba();
    public final int zza;
    public final int zzb;
    public final int zzc;
    @Deprecated
    public final Scope[] zzd;

    public zzaz(int i, int i2, int i3, Scope[] scopeArr) {
        this.zza = i;
        this.zzb = i2;
        this.zzc = i3;
        this.zzd = scopeArr;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$layout.zzb(parcel, 20293);
        int i2 = this.zza;
        R$layout.zzb(parcel, 1, 4);
        parcel.writeInt(i2);
        int i3 = this.zzb;
        R$layout.zzb(parcel, 2, 4);
        parcel.writeInt(i3);
        int i4 = this.zzc;
        R$layout.zzb(parcel, 3, 4);
        parcel.writeInt(i4);
        R$layout.zza(parcel, 4, this.zzd, i);
        R$layout.zzc(parcel, zzb);
    }
}
