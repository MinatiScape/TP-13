package com.google.android.gms.signin;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.internal.ClientSettings;
import com.google.android.gms.internal.zzelu;
/* compiled from: SignIn.java */
/* loaded from: classes.dex */
public final class zzb extends Api.zza<zzelu, SignInOptions> {
    @Override // com.google.android.gms.common.api.Api.zza
    public final /* synthetic */ Api.Client zza(Context context, Looper looper, ClientSettings clientSettings, Api.ApiOptions apiOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        SignInOptions signInOptions = (SignInOptions) apiOptions;
        return new zzelu(context, looper, clientSettings, connectionCallbacks, onConnectionFailedListener);
    }
}
