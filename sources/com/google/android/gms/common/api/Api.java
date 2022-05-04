package com.google.android.gms.common.api;

import android.accounts.Account;
import android.content.Context;
import android.os.Looper;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.common.api.Api.ApiOptions;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.internal.BaseGmsClient;
import com.google.android.gms.common.internal.ClientSettings;
import com.google.android.gms.common.internal.IAccountAccessor;
import java.util.Set;
/* loaded from: classes.dex */
public final class Api<O extends ApiOptions> {
    public final zza<?, O> zza;
    public final ClientKey<?> zzc;
    public final String zze;

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
    public interface Client extends zzb {
        void connect(BaseGmsClient.ConnectionProgressReportCallbacks connectionProgressReportCallbacks);

        void disconnect();

        void getRemoteService(IAccountAccessor iAccountAccessor, Set<Scope> set);

        boolean isConnected();

        boolean isConnecting();

        void onUserSignOut(BaseGmsClient.SignOutCallbacks signOutCallbacks);

        boolean requiresGooglePlayServices();

        boolean requiresSignIn();

        int zza();

        String zzab();
    }

    /* loaded from: classes.dex */
    public static final class ClientKey<C extends Client> extends zzc<C> {
    }

    /* loaded from: classes.dex */
    public static abstract class zza<T extends Client, O> extends zzd<T, O> {
        public abstract T zza(Context context, Looper looper, ClientSettings clientSettings, O o, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener);
    }

    /* loaded from: classes.dex */
    public interface zzb {
    }

    /* loaded from: classes.dex */
    public static class zzc<C extends zzb> {
    }

    /* loaded from: classes.dex */
    public static abstract class zzd<T extends zzb, O> {
    }

    /* JADX WARN: Multi-variable type inference failed */
    public <C extends Client> Api(String str, zza<C, O> zzaVar, ClientKey<C> clientKey) {
        this.zze = str;
        this.zza = zzaVar;
        this.zzc = clientKey;
    }

    public final zzc<?> zzc() {
        ClientKey<?> clientKey = this.zzc;
        if (clientKey != null) {
            return clientKey;
        }
        throw new IllegalStateException("This API was constructed with null client keys. This should not be possible.");
    }
}
