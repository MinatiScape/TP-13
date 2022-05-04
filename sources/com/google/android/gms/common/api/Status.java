package com.google.android.gms.common.api;

import android.app.PendingIntent;
import android.os.Parcel;
import android.os.Parcelable;
import androidx.cardview.R$style$$ExternalSyntheticOutline0;
import androidx.core.R$id;
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
    public static final Status zza = new Status(0, null);
    public static final Status zzd = new Status(15, null);
    public static final Status zze = new Status(16, null);
    public static final Parcelable.Creator<Status> CREATOR = new zzf();

    public Status() {
        throw null;
    }

    public Status(int i, int i2, String str, PendingIntent pendingIntent) {
        this.zzh = i;
        this.zzi = i2;
        this.zzj = str;
        this.zzk = pendingIntent;
    }

    @Override // com.google.android.gms.common.api.Result
    public final Status getStatus() {
        return this;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(this.zzh), Integer.valueOf(this.zzi), this.zzj, this.zzk});
    }

    static {
        new Status(14, null);
        new Status(8, null);
        new Status(17, null);
        new Status(18, null);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof Status)) {
            return false;
        }
        Status status = (Status) obj;
        if (this.zzh != status.zzh || this.zzi != status.zzi || !R$id.zza(this.zzj, status.zzj) || !R$id.zza(this.zzk, status.zzk)) {
            return false;
        }
        return true;
    }

    public final String toString() {
        zzam zzamVar = new zzam(this, 0);
        String str = this.zzj;
        if (str == null) {
            int i = this.zzi;
            switch (i) {
                case -1:
                    str = "SUCCESS_CACHE";
                    break;
                case 0:
                    str = "SUCCESS";
                    break;
                case 1:
                case 9:
                case 11:
                case 12:
                default:
                    str = R$style$$ExternalSyntheticOutline0.m(32, "unknown status code: ", i);
                    break;
                case 2:
                    str = "SERVICE_VERSION_UPDATE_REQUIRED";
                    break;
                case 3:
                    str = "SERVICE_DISABLED";
                    break;
                case 4:
                    str = "SIGN_IN_REQUIRED";
                    break;
                case 5:
                    str = "INVALID_ACCOUNT";
                    break;
                case 6:
                    str = "RESOLUTION_REQUIRED";
                    break;
                case 7:
                    str = "NETWORK_ERROR";
                    break;
                case 8:
                    str = "INTERNAL_ERROR";
                    break;
                case 10:
                    str = "DEVELOPER_ERROR";
                    break;
                case 13:
                    str = "ERROR";
                    break;
                case 14:
                    str = "INTERRUPTED";
                    break;
                case 15:
                    str = "TIMEOUT";
                    break;
                case 16:
                    str = "CANCELED";
                    break;
                case 17:
                    str = "API_NOT_CONNECTED";
                    break;
                case 18:
                    str = "DEAD_CLIENT";
                    break;
            }
        }
        zzamVar.zza("statusCode", str);
        zzamVar.zza("resolution", this.zzk);
        return zzamVar.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$id.zzb(parcel, 20293);
        int i2 = this.zzi;
        R$id.zzb(parcel, 1, 4);
        parcel.writeInt(i2);
        R$id.zza(parcel, 2, this.zzj);
        R$id.zza(parcel, 3, this.zzk, i);
        int i3 = this.zzh;
        R$id.zzb(parcel, 1000, 4);
        parcel.writeInt(i3);
        R$id.zzc(parcel, zzb);
    }

    public Status(int i, String str) {
        this(1, i, str, null);
    }
}
