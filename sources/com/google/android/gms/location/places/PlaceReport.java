package com.google.android.gms.location.places;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.core.R$id;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.zzam;
import com.google.android.gms.internal.zzbkv;
import java.util.Arrays;
/* loaded from: classes.dex */
public class PlaceReport extends zzbkv implements ReflectedParcelable {
    public static final Parcelable.Creator<PlaceReport> CREATOR = new zzm();
    public final int zza;
    public final String zzb;
    public final String zzc;
    public final String zzd;

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.zzb, this.zzc, this.zzd});
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof PlaceReport)) {
            return false;
        }
        PlaceReport placeReport = (PlaceReport) obj;
        if (!R$id.zza(this.zzb, placeReport.zzb) || !R$id.zza(this.zzc, placeReport.zzc) || !R$id.zza(this.zzd, placeReport.zzd)) {
            return false;
        }
        return true;
    }

    public final String toString() {
        zzam zzamVar = new zzam(this, 0);
        zzamVar.zza("placeId", this.zzb);
        zzamVar.zza("tag", this.zzc);
        if (!"unknown".equals(this.zzd)) {
            zzamVar.zza("source", this.zzd);
        }
        return zzamVar.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$id.zzb(parcel, 20293);
        int i2 = this.zza;
        R$id.zzb(parcel, 1, 4);
        parcel.writeInt(i2);
        R$id.zza(parcel, 2, this.zzb);
        R$id.zza(parcel, 3, this.zzc);
        R$id.zza(parcel, 4, this.zzd);
        R$id.zzc(parcel, zzb);
    }

    public PlaceReport(int i, String str, String str2, String str3) {
        this.zza = i;
        this.zzb = str;
        this.zzc = str2;
        this.zzd = str3;
    }
}
