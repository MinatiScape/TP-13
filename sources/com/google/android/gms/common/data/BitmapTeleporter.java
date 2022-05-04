package com.google.android.gms.common.data;

import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable;
import androidx.core.R$id;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.internal.zzbkv;
/* loaded from: classes.dex */
public class BitmapTeleporter extends zzbkv implements ReflectedParcelable {
    public static final Parcelable.Creator<BitmapTeleporter> CREATOR = new zza();
    public final int zza;
    public ParcelFileDescriptor zzb;
    public final int zzc;

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        this.zzb.getClass();
        int zzb = R$id.zzb(parcel, 20293);
        int i2 = this.zza;
        R$id.zzb(parcel, 1, 4);
        parcel.writeInt(i2);
        R$id.zza(parcel, 2, this.zzb, i | 1);
        int i3 = this.zzc;
        R$id.zzb(parcel, 3, 4);
        parcel.writeInt(i3);
        R$id.zzc(parcel, zzb);
        this.zzb = null;
    }

    public BitmapTeleporter(int i, ParcelFileDescriptor parcelFileDescriptor, int i2) {
        this.zza = i;
        this.zzb = parcelFileDescriptor;
        this.zzc = i2;
    }
}
