package com.google.android.gms.phenotype;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.core.R$id;
import com.google.android.gms.internal.zzbkv;
/* loaded from: classes.dex */
public class DogfoodsToken extends zzbkv {
    public static final Parcelable.Creator<DogfoodsToken> CREATOR = new zzd();
    public final byte[] token;

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$id.zzb(parcel, 20293);
        R$id.zza(parcel, 2, this.token);
        R$id.zzc(parcel, zzb);
    }

    public DogfoodsToken(byte[] bArr) {
        this.token = bArr;
    }
}
