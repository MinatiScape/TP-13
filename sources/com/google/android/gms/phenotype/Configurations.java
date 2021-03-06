package com.google.android.gms.phenotype;

import android.os.Parcel;
import android.os.Parcelable;
import android.util.Base64;
import androidx.appcompat.R$layout;
import androidx.core.R$id;
import com.google.android.gms.internal.zzbkv;
import java.util.Arrays;
import java.util.TreeMap;
/* loaded from: classes.dex */
public class Configurations extends zzbkv {
    public static final Parcelable.Creator<Configurations> CREATOR = new zzc();
    public final TreeMap configurationMap = new TreeMap();
    public final long configurationVersion;
    public final Configuration[] configurations;
    public final byte[] experimentToken;
    public final boolean isDelta;
    public final String serverToken;
    public final String snapshotToken;

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.snapshotToken, this.serverToken, this.configurationMap, Boolean.valueOf(this.isDelta), this.experimentToken, Long.valueOf(this.configurationVersion)});
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof Configurations)) {
            return false;
        }
        Configurations configurations = (Configurations) obj;
        if (!R$layout.zza(this.snapshotToken, configurations.snapshotToken) || !R$layout.zza(this.serverToken, configurations.serverToken) || !this.configurationMap.equals(configurations.configurationMap) || this.isDelta != configurations.isDelta || !Arrays.equals(this.experimentToken, configurations.experimentToken) || this.configurationVersion != configurations.configurationVersion) {
            return false;
        }
        return true;
    }

    public final String toString() {
        String str;
        StringBuilder sb = new StringBuilder("Configurations('");
        sb.append(this.snapshotToken);
        sb.append('\'');
        sb.append(", ");
        sb.append('\'');
        sb.append(this.serverToken);
        sb.append('\'');
        sb.append(", ");
        sb.append('(');
        for (Configuration configuration : this.configurationMap.values()) {
            sb.append(configuration);
            sb.append(", ");
        }
        sb.append(')');
        sb.append(", ");
        sb.append(this.isDelta);
        sb.append(", ");
        byte[] bArr = this.experimentToken;
        if (bArr == null) {
            str = "null";
        } else {
            str = Base64.encodeToString(bArr, 3);
        }
        sb.append(str);
        sb.append(", ");
        sb.append(this.configurationVersion);
        sb.append(')');
        return sb.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$id.zzb(parcel, 20293);
        R$id.zza(parcel, 2, this.snapshotToken);
        R$id.zza(parcel, 3, this.serverToken);
        R$id.zza(parcel, 4, this.configurations, i);
        boolean z = this.isDelta;
        R$id.zzb(parcel, 5, 4);
        parcel.writeInt(z ? 1 : 0);
        R$id.zza(parcel, 6, this.experimentToken);
        long j = this.configurationVersion;
        R$id.zzb(parcel, 7, 8);
        parcel.writeLong(j);
        R$id.zzc(parcel, zzb);
    }

    public Configurations(String str, String str2, Configuration[] configurationArr, boolean z, byte[] bArr, long j) {
        this.snapshotToken = str;
        this.serverToken = str2;
        this.configurations = configurationArr;
        this.isDelta = z;
        this.experimentToken = bArr;
        this.configurationVersion = j;
        for (Configuration configuration : configurationArr) {
            this.configurationMap.put(Integer.valueOf(configuration.flagType), configuration);
        }
    }
}
