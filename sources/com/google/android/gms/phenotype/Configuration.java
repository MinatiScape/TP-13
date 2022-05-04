package com.google.android.gms.phenotype;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.v4.app.FragmentTabHost$SavedState$$ExternalSyntheticOutline0;
import androidx.appcompat.R$dimen;
import androidx.slice.view.R$layout;
import com.google.android.gms.internal.zzbkv;
import java.util.Arrays;
import java.util.Map;
import java.util.TreeMap;
/* loaded from: classes.dex */
public class Configuration extends zzbkv implements Comparable<Configuration> {
    public static final Parcelable.Creator<Configuration> CREATOR = new zzb();
    public final String[] deleteFlags;
    public final Map<String, Flag> flagMap = new TreeMap();
    public final int flagType;
    public final Flag[] flags;

    public Configuration(int i, Flag[] flagArr, String[] strArr) {
        this.flagType = i;
        this.flags = flagArr;
        for (Flag flag : flagArr) {
            this.flagMap.put(flag.name, flag);
        }
        this.deleteFlags = strArr;
        if (strArr != null) {
            Arrays.sort(strArr);
        }
    }

    @Override // java.lang.Comparable
    public int compareTo(Configuration configuration) {
        return this.flagType - configuration.flagType;
    }

    public boolean equals(Object obj) {
        if (obj instanceof Configuration) {
            Configuration configuration = (Configuration) obj;
            if (this.flagType == configuration.flagType && R$dimen.zza(this.flagMap, configuration.flagMap) && Arrays.equals(this.deleteFlags, configuration.deleteFlags)) {
                return true;
            }
        }
        return false;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("Configuration(");
        sb.append(this.flagType);
        sb.append(", ");
        sb.append("(");
        for (Flag flag : this.flagMap.values()) {
            sb.append(flag);
            sb.append(", ");
        }
        sb.append(")");
        sb.append(", ");
        sb.append("(");
        String[] strArr = this.deleteFlags;
        if (strArr != null) {
            for (String str : strArr) {
                sb.append(str);
                sb.append(", ");
            }
        } else {
            sb.append("null");
        }
        return FragmentTabHost$SavedState$$ExternalSyntheticOutline0.m(sb, ")", ")");
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        int zzb = R$layout.zzb(parcel, 20293);
        int i2 = this.flagType;
        R$layout.zzb(parcel, 2, 4);
        parcel.writeInt(i2);
        R$layout.zza(parcel, 3, this.flags, i);
        R$layout.zza(parcel, 4, this.deleteFlags, false);
        R$layout.zzc(parcel, zzb);
    }
}
