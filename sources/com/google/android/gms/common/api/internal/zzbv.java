package com.google.android.gms.common.api.internal;

import androidx.preference.R$string;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.BaseGmsClient;
import com.google.android.gms.common.internal.IAccountAccessor;
import java.util.Set;
/* loaded from: classes.dex */
public final class zzbv implements zzde, BaseGmsClient.ConnectionProgressReportCallbacks {
    public final /* synthetic */ zzbn zza;
    public final Api.Client zzb;
    public final zzi<?> zzc;
    public IAccountAccessor zzd = null;
    public Set<Scope> zze = null;
    public boolean zzf = false;

    public zzbv(zzbn zzbnVar, Api.Client client, zzi<?> zziVar) {
        this.zza = zzbnVar;
        this.zzb = client;
        this.zzc = zziVar;
    }

    @Override // com.google.android.gms.common.internal.BaseGmsClient.ConnectionProgressReportCallbacks
    public final void onReportServiceBinding(ConnectionResult connectionResult) {
        this.zza.zzq.post(new zzbw(this, connectionResult));
    }

    public final void zza(ConnectionResult connectionResult) {
        zzbp<?> zzbpVar = this.zza.zzm.get(this.zzc);
        R$string.zza(zzbpVar.zza.zzq);
        zzbpVar.zzc.disconnect();
        zzbpVar.onConnectionFailed(connectionResult);
    }
}
