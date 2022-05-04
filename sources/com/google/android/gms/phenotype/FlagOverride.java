package com.google.android.gms.phenotype;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.appcompat.R$dimen;
import androidx.slice.view.R$layout;
import com.google.android.gms.internal.zzbkv;
/* loaded from: classes.dex */
public class FlagOverride extends zzbkv {
    public static final Parcelable.Creator<FlagOverride> CREATOR = new zzl();
    public final boolean committed;
    public final String configurationName;
    public final Flag flag;
    public final String userName;

    public FlagOverride(String str, String str2, Flag flag, boolean z) {
        this.configurationName = str;
        this.userName = str2;
        this.flag = flag;
        this.committed = z;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof FlagOverride)) {
            return false;
        }
        FlagOverride flagOverride = (FlagOverride) obj;
        return R$dimen.zza(this.configurationName, flagOverride.configurationName) && R$dimen.zza(this.userName, flagOverride.userName) && R$dimen.zza(this.flag, flagOverride.flag) && this.committed == flagOverride.committed;
    }

    public String toString() {
        return toString(new StringBuilder());
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        int zzb = R$layout.zzb(parcel, 20293);
        R$layout.zza(parcel, 2, this.configurationName, false);
        R$layout.zza(parcel, 3, this.userName, false);
        R$layout.zza(parcel, 4, this.flag, i, false);
        boolean z = this.committed;
        R$layout.zzb(parcel, 5, 4);
        parcel.writeInt(z ? 1 : 0);
        R$layout.zzc(parcel, zzb);
    }

    public String toString(StringBuilder sb) {
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
