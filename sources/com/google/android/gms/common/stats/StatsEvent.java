package com.google.android.gms.common.stats;

import com.adobe.xmp.impl.ParseRDF$$ExternalSyntheticOutline0;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.internal.zzbkv;
/* loaded from: classes.dex */
public abstract class StatsEvent extends zzbkv implements ReflectedParcelable {
    public abstract long zza();

    public abstract int zzb();

    public abstract long zzc();

    public abstract String zzd();

    public final String toString() {
        long zza = zza();
        int zzb = zzb();
        long zzc = zzc();
        String zzd = zzd();
        StringBuilder sb = new StringBuilder(ParseRDF$$ExternalSyntheticOutline0.m(zzd, 53));
        sb.append(zza);
        sb.append("\t");
        sb.append(zzb);
        sb.append("\t");
        sb.append(zzc);
        sb.append(zzd);
        return sb.toString();
    }
}
