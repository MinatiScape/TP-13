package com.google.android.gms.common.api.internal;

import androidx.core.R$id;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions;
import java.util.Arrays;
/* loaded from: classes.dex */
public final class zzi<O extends Api.ApiOptions> {
    public final boolean zza = false;
    public final int zzb;
    public final Api<O> zzc;
    public final O zzd;

    public zzi(Api<O> api, O o) {
        this.zzc = api;
        this.zzd = o;
        this.zzb = Arrays.hashCode(new Object[]{api, o});
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof zzi)) {
            return false;
        }
        zzi zziVar = (zzi) obj;
        return !this.zza && !zziVar.zza && R$id.zza(this.zzc, zziVar.zzc) && R$id.zza(this.zzd, zziVar.zzd);
    }

    public final int hashCode() {
        return this.zzb;
    }
}
