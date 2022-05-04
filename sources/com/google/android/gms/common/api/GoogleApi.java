package com.google.android.gms.common.api;

import android.accounts.Account;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import androidx.collection.ArraySet;
import androidx.preference.R$string;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions;
import com.google.android.gms.common.api.internal.zzbn;
import com.google.android.gms.common.api.internal.zzbp;
import com.google.android.gms.common.api.internal.zzbx;
import com.google.android.gms.common.api.internal.zzcu;
import com.google.android.gms.common.api.internal.zzd;
import com.google.android.gms.common.api.internal.zzdb;
import com.google.android.gms.common.api.internal.zzh;
import com.google.android.gms.common.api.internal.zzi;
import com.google.android.gms.common.api.internal.zzn;
import com.google.android.gms.common.internal.ClientSettings;
import java.util.Collections;
import java.util.Set;
/* loaded from: classes.dex */
public class GoogleApi<O extends Api.ApiOptions> {
    public final zzbn zza;
    public final Context zzb;
    public final Api<O> zzc;
    public final zzi<O> zze;
    public final Looper zzf;
    public final int zzg;
    public final O zzd = null;
    public final GoogleApiClient zzh = new zzbx(this);

    /* loaded from: classes.dex */
    public static class zza {
        static {
            Looper.getMainLooper();
        }
    }

    @Deprecated
    public GoogleApi(Context context, Api<O> api, O o, zzh zzhVar) {
        Looper mainLooper = Looper.getMainLooper();
        R$string.zza(context, "Null context is not permitted.");
        R$string.zza(api, "Api must not be null.");
        Context applicationContext = context.getApplicationContext();
        this.zzb = applicationContext;
        this.zzc = api;
        this.zzf = mainLooper;
        this.zze = new zzi<>(api, null);
        zzbn zza2 = zzbn.zza(applicationContext);
        this.zza = zza2;
        this.zzg = zza2.zzk.getAndIncrement();
        Handler handler = zza2.zzq;
        handler.sendMessage(handler.obtainMessage(7, this));
    }

    public final <A extends Api.zzb, T extends zzn<? extends Result, A>> T zza(int i, T t) {
        t.zzg();
        zzbn zzbnVar = this.zza;
        zzd zzdVar = new zzd(i, t);
        Handler handler = zzbnVar.zzq;
        handler.sendMessage(handler.obtainMessage(4, new zzcu(zzdVar, zzbnVar.zzl.get(), this)));
        return t;
    }

    /* JADX WARN: Type inference failed for: r8v1, types: [com.google.android.gms.common.api.Api$Client] */
    public Api.Client zza(Looper looper, zzbp<O> zzbpVar) {
        ClientSettings zza2 = zza().zza();
        Api<O> api = this.zzc;
        R$string.zza(api.zza != null, "This API was constructed with a SimpleClientBuilder. Use getSimpleClientBuilder");
        return api.zza.zza(this.zzb, looper, zza2, this.zzd, zzbpVar, zzbpVar);
    }

    public final ClientSettings.zza zza() {
        Set<Scope> set;
        GoogleSignInAccount googleSignInAccount;
        GoogleSignInAccount googleSignInAccount2;
        ClientSettings.zza zzaVar = new ClientSettings.zza();
        O o = this.zzd;
        Account account = null;
        if (!(o instanceof Api.ApiOptions.HasGoogleSignInAccountOptions) || (googleSignInAccount2 = ((Api.ApiOptions.HasGoogleSignInAccountOptions) o).getGoogleSignInAccount()) == null) {
            O o2 = this.zzd;
            if (o2 instanceof Api.ApiOptions.HasAccountOptions) {
                account = ((Api.ApiOptions.HasAccountOptions) o2).getAccount();
            }
        } else if (googleSignInAccount2.zze != null) {
            account = new Account(googleSignInAccount2.zze, "com.google");
        }
        zzaVar.zza = account;
        O o3 = this.zzd;
        if (!(o3 instanceof Api.ApiOptions.HasGoogleSignInAccountOptions) || (googleSignInAccount = ((Api.ApiOptions.HasGoogleSignInAccountOptions) o3).getGoogleSignInAccount()) == null) {
            set = Collections.emptySet();
        } else {
            set = googleSignInAccount.zzd();
        }
        if (zzaVar.zzb == null) {
            zzaVar.zzb = new ArraySet<>(0);
        }
        zzaVar.zzb.addAll(set);
        zzaVar.zze = this.zzb.getClass().getName();
        zzaVar.zzd = this.zzb.getPackageName();
        return zzaVar;
    }

    public zzdb zza(Context context, Handler handler) {
        return new zzdb(context, handler, zza().zza(), zzdb.zza);
    }
}
