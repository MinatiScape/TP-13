package com.google.android.gms.common.api;

import android.app.PendingIntent;
import android.os.Parcel;
import android.os.Parcelable;
import androidx.core.R$id;
import androidx.slice.view.R$layout;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.zzam;
import com.google.android.gms.internal.zzbkv;
import java.util.Arrays;
/* loaded from: classes.dex */
public final class Status extends zzbkv implements Result, ReflectedParcelable {
    public final int zzh;
    public final int zzi;
    public final String zzj;
    public final PendingIntent zzk;
    public static final Status zza = new Status(0);
    public static final Status zzb = new Status(14);
    public static final Status zzc = new Status(8);
    public static final Status zzd = new Status(15);
    public static final Status zze = new Status(16);
    public static final Parcelable.Creator<Status> CREATOR = new zzf();

    static {
        new Status(17);
        new Status(18);
    }

    public Status(int i, int i2, String str, PendingIntent pendingIntent) {
        this.zzh = i;
        this.zzi = i2;
        this.zzj = str;
        this.zzk = pendingIntent;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof Status)) {
            return false;
        }
        Status status = (Status) obj;
        return this.zzh == status.zzh && this.zzi == status.zzi && R$id.zza(this.zzj, status.zzj) && R$id.zza(this.zzk, status.zzk);
    }

    @Override // com.google.android.gms.common.api.Result
    public final Status getStatus() {
        return this;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(this.zzh), Integer.valueOf(this.zzi), this.zzj, this.zzk});
    }

    public final boolean isSuccess() {
        return this.zzi <= 0;
    }

    public final String toString() {
        zzam zza2 = R$id.zza(this);
        String str = this.zzj;
        if (str == null) {
            str = androidx.fragment.R$id.getStatusCodeString(this.zzi);
        }
        zza2.zza("statusCode", str);
        zza2.zza("resolution", this.zzk);
        return zza2.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb2 = R$layout.zzb(parcel, 20293);
        int i2 = this.zzi;
        R$layout.zzb(parcel, 1, 4);
        parcel.writeInt(i2);
        R$layout.zza(parcel, 2, this.zzj, false);
        R$layout.zza(parcel, 3, this.zzk, i, false);
        int i3 = this.zzh;
        R$layout.zzb(parcel, 1000, 4);
        parcel.writeInt(i3);
        R$layout.zzc(parcel, zzb2);
    }

    public Status(int i) {
        this(1, i, null, null);
    }

    public Status(int i, String str) {
        this(1, i, str, null);
    }
}
