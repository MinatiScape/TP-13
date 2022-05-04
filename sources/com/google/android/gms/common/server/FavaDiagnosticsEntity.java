package com.google.android.gms.common.server;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.slice.view.R$layout;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.internal.zzbkv;
/* loaded from: classes.dex */
public class FavaDiagnosticsEntity extends zzbkv implements ReflectedParcelable {
    public static final Parcelable.Creator<FavaDiagnosticsEntity> CREATOR = new zza();
    public final int zza;
    public final String zzb;
    public final int zzc;

    public FavaDiagnosticsEntity(int i, String str, int i2) {
        this.zza = i;
        this.zzb = str;
        this.zzc = i2;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        int zzb = R$layout.zzb(parcel, 20293);
        int i2 = this.zza;
        R$layout.zzb(parcel, 1, 4);
        parcel.writeInt(i2);
        R$layout.zza(parcel, 2, this.zzb, false);
        int i3 = this.zzc;
        R$layout.zzb(parcel, 3, 4);
        parcel.writeInt(i3);
        R$layout.zzc(parcel, zzb);
    }
}
