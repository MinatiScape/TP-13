package com.google.android.gms.phenotype;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.slice.view.R$layout;
import com.google.android.gms.internal.zzbkv;
/* loaded from: classes.dex */
public class DogfoodsToken extends zzbkv {
    public static final Parcelable.Creator<DogfoodsToken> CREATOR = new zzd();
    public final byte[] token;

    public DogfoodsToken(byte[] bArr) {
        this.token = bArr;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        int zzb = R$layout.zzb(parcel, 20293);
        R$layout.zza(parcel, 2, this.token, false);
        R$layout.zzc(parcel, zzb);
    }
}
