package com.google.android.gms.location.places;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.core.R$id;
import androidx.slice.view.R$layout;
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

    public PlaceReport(int i, String str, String str2, String str3) {
        this.zza = i;
        this.zzb = str;
        this.zzc = str2;
        this.zzd = str3;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof PlaceReport)) {
            return false;
        }
        PlaceReport placeReport = (PlaceReport) obj;
        return R$id.zza(this.zzb, placeReport.zzb) && R$id.zza(this.zzc, placeReport.zzc) && R$id.zza(this.zzd, placeReport.zzd);
    }

    public int hashCode() {
        return Arrays.hashCode(new Object[]{this.zzb, this.zzc, this.zzd});
    }

    public String toString() {
        zzam zza = R$id.zza(this);
        zza.zza("placeId", this.zzb);
        zza.zza("tag", this.zzc);
        if (!"unknown".equals(this.zzd)) {
            zza.zza("source", this.zzd);
        }
        return zza.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        int zzb = R$layout.zzb(parcel, 20293);
        int i2 = this.zza;
        R$layout.zzb(parcel, 1, 4);
        parcel.writeInt(i2);
        R$layout.zza(parcel, 2, this.zzb, false);
        R$layout.zza(parcel, 3, this.zzc, false);
        R$layout.zza(parcel, 4, this.zzd, false);
        R$layout.zzc(parcel, zzb);
    }
}
