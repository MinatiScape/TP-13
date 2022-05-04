package com.google.android.gms.common.internal;

import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable;
import androidx.slice.view.R$layout;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.internal.zzbkv;
/* loaded from: classes.dex */
public final class zzax extends zzbkv {
    public static final Parcelable.Creator<zzax> CREATOR = new zzay();
    public final int zza;
    public IBinder zzb;
    public ConnectionResult zzc;
    public boolean zzd;
    public boolean zze;

    public zzax(int i, IBinder iBinder, ConnectionResult connectionResult, boolean z, boolean z2) {
        this.zza = i;
        this.zzb = iBinder;
        this.zzc = connectionResult;
        this.zzd = z;
        this.zze = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zzax)) {
            return false;
        }
        zzax zzaxVar = (zzax) obj;
        return this.zzc.equals(zzaxVar.zzc) && zza().equals(zzaxVar.zza());
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$layout.zzb(parcel, 20293);
        int i2 = this.zza;
        R$layout.zzb(parcel, 1, 4);
        parcel.writeInt(i2);
        R$layout.zza(parcel, 2, this.zzb);
        R$layout.zza(parcel, 3, this.zzc, i, false);
        boolean z = this.zzd;
        R$layout.zzb(parcel, 4, 4);
        parcel.writeInt(z ? 1 : 0);
        boolean z2 = this.zze;
        R$layout.zzb(parcel, 5, 4);
        parcel.writeInt(z2 ? 1 : 0);
        R$layout.zzc(parcel, zzb);
    }

    public final IAccountAccessor zza() {
        IBinder iBinder = this.zzb;
        if (iBinder == null) {
            return null;
        }
        IInterface queryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.common.internal.IAccountAccessor");
        if (queryLocalInterface instanceof IAccountAccessor) {
            return (IAccountAccessor) queryLocalInterface;
        }
        return new zzw(iBinder);
    }
}
