package com.google.android.gms.phenotype;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.appcompat.R$layout;
import androidx.core.R$id;
import com.google.android.gms.internal.zzbkv;
/* loaded from: classes.dex */
public class FlagOverride extends zzbkv {
    public static final Parcelable.Creator<FlagOverride> CREATOR = new zzl();
    public final boolean committed;
    public final String configurationName;
    public final Flag flag;
    public final String userName;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof FlagOverride)) {
            return false;
        }
        FlagOverride flagOverride = (FlagOverride) obj;
        return R$layout.zza(this.configurationName, flagOverride.configurationName) && R$layout.zza(this.userName, flagOverride.userName) && R$layout.zza(this.flag, flagOverride.flag) && this.committed == flagOverride.committed;
    }

    public final String toString() {
        return toString(new StringBuilder());
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$id.zzb(parcel, 20293);
        R$id.zza(parcel, 2, this.configurationName);
        R$id.zza(parcel, 3, this.userName);
        R$id.zza(parcel, 4, this.flag, i);
        boolean z = this.committed;
        R$id.zzb(parcel, 5, 4);
        parcel.writeInt(z ? 1 : 0);
        R$id.zzc(parcel, zzb);
    }

    public FlagOverride(String str, String str2, Flag flag, boolean z) {
        this.configurationName = str;
        this.userName = str2;
        this.flag = flag;
        this.committed = z;
    }

    public final String toString(StringBuilder sb) {
        sb.append("FlagOverride(");
        sb.append(this.configurationName);
        sb.append(", ");
        sb.append(this.userName);
        sb.append(", ");
        this.flag.toString(sb);
        sb.append(", ");
        sb.append(this.committed);
        sb.append(")");
        return sb.toString();
    }
}
