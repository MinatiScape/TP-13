package com.google.android.gms.common.api;

import android.accounts.Account;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import androidx.collection.ArraySet;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions;
import com.google.android.gms.common.api.internal.zzbn;
import com.google.android.gms.common.api.internal.zzbx;
import com.google.android.gms.common.api.internal.zzi;
import com.google.android.gms.common.internal.ClientSettings;
import java.util.Collection;
import java.util.Collections;
import kotlin.jvm.internal.Intrinsics;
/* loaded from: classes.dex */
public class GoogleApi<O extends Api.ApiOptions> {
    public final zzbn zza;
    public final Context zzb;
    public final Api<O> zzc;
    public final O zzd;
    public final zzi<O> zze;
    public final Looper zzf;
    public final int zzg;
    public final zzbx zzh;

    public GoogleApi() {
        throw null;
    }

    @Deprecated
    public GoogleApi(Context context, Api api, Intrinsics intrinsics) {
        Looper mainLooper = Looper.getMainLooper();
        if (context == null) {
            throw new NullPointerException("Null context is not permitted.");
        } else if (api != null) {
            Context applicationContext = context.getApplicationContext();
            this.zzb = applicationContext;
            this.zzc = api;
            this.zzd = null;
            this.zzf = mainLooper;
            this.zze = new zzi<>(api);
            this.zzh = new zzbx(this);
            zzbn zza2 = zzbn.zza(applicationContext);
            this.zza = zza2;
            this.zzg = zza2.zzk.getAndIncrement();
            Handler handler = zza2.zzq;
            handler.sendMessage(handler.obtainMessage(7, this));
        } else {
            throw new NullPointerException("Api must not be null.");
        }
    }

    public final ClientSettings.zza zza() {
        Account account;
        Collection<? extends Scope> collection;
        GoogleSignInAccount googleSignInAccount;
        GoogleSignInAccount googleSignInAccount2;
        ClientSettings.zza zzaVar = new ClientSettings.zza();
        O o = this.zzd;
        if (!(o instanceof Api.ApiOptions.HasGoogleSignInAccountOptions) || (googleSignInAccount2 = ((Api.ApiOptions.HasGoogleSignInAccountOptions) o).getGoogleSignInAccount()) == null) {
            O o2 = this.zzd;
            if (o2 instanceof Api.ApiOptions.HasAccountOptions) {
                account = ((Api.ApiOptions.HasAccountOptions) o2).getAccount();
            }
            account = null;
        } else {
            if (googleSignInAccount2.zze != null) {
                account = new Account(googleSignInAccount2.zze, "com.google");
            }
            account = null;
        }
        zzaVar.zza = account;
        O o3 = this.zzd;
        if (!(o3 instanceof Api.ApiOptions.HasGoogleSignInAccountOptions) || (googleSignInAccount = ((Api.ApiOptions.HasGoogleSignInAccountOptions) o3).getGoogleSignInAccount()) == null) {
            collection = Collections.emptySet();
        } else {
            collection = googleSignInAccount.zzd();
        }
        if (zzaVar.zzb == null) {
            zzaVar.zzb = new ArraySet<>(0);
        }
        zzaVar.zzb.addAll(collection);
        zzaVar.zze = this.zzb.getClass().getName();
        zzaVar.zzd = this.zzb.getPackageName();
        return zzaVar;
    }

    /* loaded from: classes.dex */
    public static class zza {
        static {
            Looper.getMainLooper();
        }
    }
}
