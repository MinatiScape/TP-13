package com.google.android.gms.common.internal;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.core.R$id;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.internal.zzbkv;
/* compiled from: SignInButtonConfig.java */
/* loaded from: classes.dex */
public final class zzaz extends zzbkv {
    public static final Parcelable.Creator<zzaz> CREATOR = new zzba();
    public final int zza;
    public final int zzb;
    public final int zzc;
    @Deprecated
    public final Scope[] zzd;

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$id.zzb(parcel, 20293);
        int i2 = this.zza;
        R$id.zzb(parcel, 1, 4);
        parcel.writeInt(i2);
        int i3 = this.zzb;
        R$id.zzb(parcel, 2, 4);
        parcel.writeInt(i3);
        int i4 = this.zzc;
        R$id.zzb(parcel, 3, 4);
        parcel.writeInt(i4);
        R$id.zza(parcel, 4, this.zzd, i);
        R$id.zzc(parcel, zzb);
    }

    public zzaz(int i, int i2, int i3, Scope[] scopeArr) {
        this.zza = i;
        this.zzb = i2;
        this.zzc = i3;
        this.zzd = scopeArr;
    }
}
