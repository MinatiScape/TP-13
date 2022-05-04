package com.google.android.gms.signin;

import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.internal.zzelu;
/* loaded from: classes.dex */
public final class zza {
    public static final Api.zza<zzelu, SignInOptions> zza;
    public static final Api<SignInOptions> zzb;

    static {
        Api.ClientKey clientKey = new Api.ClientKey();
        zzb zzbVar = new zzb();
        zza = zzbVar;
        new Scope(1, "profile");
        new Scope(1, "email");
        zzb = new Api<>("SignIn.API", zzbVar, clientKey);
    }
}
