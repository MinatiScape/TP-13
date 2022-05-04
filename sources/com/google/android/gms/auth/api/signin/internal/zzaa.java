package com.google.android.gms.auth.api.signin.internal;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;
import com.adobe.xmp.impl.ParseRDF$$ExternalSyntheticOutline0;
import com.android.wallpaper.util.LaunchUtils;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import java.util.concurrent.locks.ReentrantLock;
import org.json.JSONException;
/* compiled from: Storage.java */
/* loaded from: classes.dex */
public final class zzaa {
    public static final ReentrantLock zza = new ReentrantLock();
    public static zzaa zzb;
    public final ReentrantLock zzc = new ReentrantLock();
    public final SharedPreferences zzd;

    public static zzaa zza(Context context) {
        LaunchUtils.zza(context);
        ReentrantLock reentrantLock = zza;
        reentrantLock.lock();
        try {
            if (zzb == null) {
                zzb = new zzaa(context.getApplicationContext());
            }
            zzaa zzaaVar = zzb;
            reentrantLock.unlock();
            return zzaaVar;
        } catch (Throwable th) {
            zza.unlock();
            throw th;
        }
    }

    public zzaa(Context context) {
        this.zzd = context.getSharedPreferences("com.google.android.gms.signin", 0);
    }

    public final GoogleSignInAccount zza() {
        String zza2 = zza("defaultGoogleSignInAccount");
        if (!TextUtils.isEmpty(zza2)) {
            StringBuilder sb = new StringBuilder(ParseRDF$$ExternalSyntheticOutline0.m(zza2, 20));
            sb.append("googleSignInAccount");
            sb.append(":");
            sb.append(zza2);
            String zza3 = zza(sb.toString());
            if (zza3 != null) {
                try {
                    return GoogleSignInAccount.zza(zza3);
                } catch (JSONException unused) {
                }
            }
        }
        return null;
    }

    public final String zza(String str) {
        this.zzc.lock();
        try {
            return this.zzd.getString(str, null);
        } finally {
            this.zzc.unlock();
        }
    }
}
