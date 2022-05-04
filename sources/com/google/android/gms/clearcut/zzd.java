package com.google.android.gms.clearcut;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.clearcut.internal.zzi;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.internal.ClientSettings;
/* compiled from: ClearcutLogger.java */
/* loaded from: classes.dex */
public final class zzd extends Api.zza<zzi, Object> {
    @Override // com.google.android.gms.common.api.Api.zza
    public final /* synthetic */ Api.Client zza(Context context, Looper looper, ClientSettings clientSettings, Api.ApiOptions apiOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        return new zzi(context, looper, clientSettings, connectionCallbacks, onConnectionFailedListener);
    }
}
