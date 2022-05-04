package com.google.android.gms.common.api.internal;

import androidx.core.R$id;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions;
import java.util.Arrays;
/* compiled from: ApiKey.java */
/* loaded from: classes.dex */
public final class zzi<O extends Api.ApiOptions> {
    public final int zzb;
    public final Api<O> zzc;
    public final O zzd = null;

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof zzi)) {
            return false;
        }
        zzi zziVar = (zzi) obj;
        zziVar.getClass();
        return R$id.zza(this.zzc, zziVar.zzc) && R$id.zza(this.zzd, zziVar.zzd);
    }

    public zzi(Api api) {
        this.zzc = api;
        this.zzb = Arrays.hashCode(new Object[]{api, null});
    }

    public final int hashCode() {
        return this.zzb;
    }
}
