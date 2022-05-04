package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.core.R$id;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.zzax;
/* compiled from: SignInResponse.java */
/* loaded from: classes.dex */
public final class zzelx extends zzbkv {
    public static final Parcelable.Creator<zzelx> CREATOR = new zzely();
    public final int zza;
    public final ConnectionResult zzb;
    public final zzax zzc;

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$id.zzb(parcel, 20293);
        int i2 = this.zza;
        R$id.zzb(parcel, 1, 4);
        parcel.writeInt(i2);
        R$id.zza(parcel, 2, this.zzb, i);
        R$id.zza(parcel, 3, this.zzc, i);
        R$id.zzc(parcel, zzb);
    }

    public zzelx(int i, ConnectionResult connectionResult, zzax zzaxVar) {
        this.zza = i;
        this.zzb = connectionResult;
        this.zzc = zzaxVar;
    }
}
