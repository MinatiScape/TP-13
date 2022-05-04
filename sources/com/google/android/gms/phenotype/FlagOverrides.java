package com.google.android.gms.phenotype;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.core.R$id;
import com.google.android.gms.internal.zzbkv;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public class FlagOverrides extends zzbkv {
    public static final Parcelable.Creator<FlagOverrides> CREATOR = new zzm();
    public final List<FlagOverride> overrides;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof FlagOverrides)) {
            return false;
        }
        return this.overrides.equals(((FlagOverrides) obj).overrides);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("FlagOverrides(");
        boolean z = true;
        for (FlagOverride flagOverride : this.overrides) {
            if (!z) {
                sb.append(", ");
            }
            z = false;
            flagOverride.toString(sb);
        }
        sb.append(")");
        return sb.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$id.zzb(parcel, 20293);
        R$id.zzc(parcel, 2, this.overrides);
        R$id.zzc(parcel, zzb);
    }

    public FlagOverrides(ArrayList arrayList) {
        this.overrides = arrayList;
    }
}
