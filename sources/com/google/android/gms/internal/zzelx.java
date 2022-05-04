package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.slice.view.R$layout;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.zzax;
/* loaded from: classes.dex */
public final class zzelx extends zzbkv {
    public static final Parcelable.Creator<zzelx> CREATOR = new zzely();
    public final int zza;
    public final ConnectionResult zzb;
    public final zzax zzc;

    public zzelx(int i, ConnectionResult connectionResult, zzax zzaxVar) {
        this.zza = i;
        this.zzb = connectionResult;
        this.zzc = zzaxVar;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$layout.zzb(parcel, 20293);
        int i2 = this.zza;
        R$layout.zzb(parcel, 1, 4);
        parcel.writeInt(i2);
        R$layout.zza(parcel, 2, this.zzb, i, false);
        R$layout.zza(parcel, 3, this.zzc, i, false);
        R$layout.zzc(parcel, zzb);
    }

    public zzelx() {
        ConnectionResult connectionResult = new ConnectionResult(8, null);
        this.zza = 1;
        this.zzb = connectionResult;
        this.zzc = null;
    }
}
