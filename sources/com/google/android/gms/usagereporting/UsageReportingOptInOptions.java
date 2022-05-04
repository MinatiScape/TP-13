package com.google.android.gms.usagereporting;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.core.R$id;
import com.google.android.gms.internal.zzbkv;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class UsageReportingOptInOptions extends zzbkv {
    public static final Parcelable.Creator<UsageReportingOptInOptions> CREATOR = new zzb();
    public int zza;

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$id.zzb(parcel, 20293);
        int i2 = this.zza;
        R$id.zzb(parcel, 2, 4);
        parcel.writeInt(i2);
        R$id.zzc(parcel, zzb);
    }

    public UsageReportingOptInOptions(int i) {
        new ArrayList();
        this.zza = i;
    }
}
