package com.google.android.gms.signin;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.internal.ClientSettings;
import com.google.android.gms.internal.zzelu;
/* loaded from: classes.dex */
public final class zzb extends Api.zza<zzelu, SignInOptions> {
    @Override // com.google.android.gms.common.api.Api.zza
    public final /* synthetic */ zzelu zza(Context context, Looper looper, ClientSettings clientSettings, SignInOptions signInOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        return new zzelu(context, looper, clientSettings, connectionCallbacks, onConnectionFailedListener);
    }
}
