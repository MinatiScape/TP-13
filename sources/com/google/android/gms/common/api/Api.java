package com.google.android.gms.common.api;

import android.accounts.Account;
import android.content.Context;
import android.os.Looper;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.common.api.Api.ApiOptions;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.internal.zzbt;
import com.google.android.gms.common.internal.BaseGmsClient;
import com.google.android.gms.common.internal.ClientSettings;
import com.google.android.gms.common.internal.IAccountAccessor;
import java.util.Set;
/* loaded from: classes.dex */
public final class Api<O extends ApiOptions> {
    public final zza<?, O> zza;
    public final ClientKey<?> zzc;
    public final String zze = "ClearcutLogger.API";

    /* loaded from: classes.dex */
    public interface ApiOptions {

        /* loaded from: classes.dex */
        public interface HasAccountOptions extends ApiOptions {
            Account getAccount();
        }

        /* loaded from: classes.dex */
        public interface HasGoogleSignInAccountOptions extends ApiOptions {
            GoogleSignInAccount getGoogleSignInAccount();
        }
    }

    /* loaded from: classes.dex */
    public interface Client {
        void connect(BaseGmsClient.ConnectionProgressReportCallbacks connectionProgressReportCallbacks);

        void disconnect();

        void getRemoteService(IAccountAccessor iAccountAccessor, Set<Scope> set);

        boolean isConnected();

        boolean isConnecting();

        void onUserSignOut(zzbt zzbtVar);

        void requiresGooglePlayServices();

        boolean requiresSignIn();

        void zza();

        void zzab();
    }

    /* loaded from: classes.dex */
    public static final class ClientKey<C extends Client> extends zzc<C> {
    }

    /* loaded from: classes.dex */
    public static abstract class zza<T extends Client, O> extends zzd<T, O> {
        public abstract Client zza(Context context, Looper looper, ClientSettings clientSettings, ApiOptions apiOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener);
    }

    /* loaded from: classes.dex */
    public static class zzc<C> {
    }

    /* loaded from: classes.dex */
    public static abstract class zzd<T, O> {
    }

    public Api(com.google.android.gms.clearcut.zzd zzdVar, ClientKey clientKey) {
        this.zza = zzdVar;
        this.zzc = clientKey;
    }
}
