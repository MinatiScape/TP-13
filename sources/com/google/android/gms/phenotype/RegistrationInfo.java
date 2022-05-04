package com.google.android.gms.phenotype;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.slice.view.R$layout;
import com.google.android.gms.internal.zzbkv;
/* loaded from: classes.dex */
public class RegistrationInfo extends zzbkv {
    public static final Parcelable.Creator<RegistrationInfo> CREATOR = new zzaw();
    public final String androidPackage;
    public final String configPackage;
    public final String[] logSourceNames;
    public final byte[] params;
    public final int version;
    public final boolean weak;
    public final int[] weakExperimentIds;

    public RegistrationInfo(String str, int i, String[] strArr, byte[] bArr, boolean z, int[] iArr, String str2) {
        this.configPackage = str;
        this.version = i;
        this.logSourceNames = strArr;
        this.params = bArr;
        this.weak = z;
        this.weakExperimentIds = iArr;
        this.androidPackage = str2;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        int zzb = R$layout.zzb(parcel, 20293);
        R$layout.zza(parcel, 1, this.configPackage, false);
        int i2 = this.version;
        R$layout.zzb(parcel, 2, 4);
        parcel.writeInt(i2);
        R$layout.zza(parcel, 3, this.logSourceNames, false);
        R$layout.zza(parcel, 4, this.params, false);
        boolean z = this.weak;
        R$layout.zzb(parcel, 5, 4);
        parcel.writeInt(z ? 1 : 0);
        R$layout.zza(parcel, 6, this.weakExperimentIds, false);
        R$layout.zza(parcel, 7, this.androidPackage, false);
        R$layout.zzc(parcel, zzb);
    }
}
