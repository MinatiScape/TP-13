package com.google.android.gms.auth.api.signin.internal;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import androidx.core.R$id;
import com.google.android.gms.internal.zzbkv;
/* compiled from: GoogleSignInOptionsExtensionParcelable.java */
/* loaded from: classes.dex */
public final class zzo extends zzbkv {
    public static final Parcelable.Creator<zzo> CREATOR = new zzn();
    public final int zza;
    public int zzb;
    public Bundle zzc;

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$id.zzb(parcel, 20293);
        int i2 = this.zza;
        R$id.zzb(parcel, 1, 4);
        parcel.writeInt(i2);
        int i3 = this.zzb;
        R$id.zzb(parcel, 2, 4);
        parcel.writeInt(i3);
        R$id.zza(parcel, 3, this.zzc);
        R$id.zzc(parcel, zzb);
    }

    public zzo(int i, int i2, Bundle bundle) {
        this.zza = i;
        this.zzb = i2;
        this.zzc = bundle;
    }
}
