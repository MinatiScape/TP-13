package com.google.android.gms.clearcut.internal;

import android.content.Context;
import android.net.Uri;
import com.google.android.gms.clearcut.ClearcutLogger;
import com.google.android.gms.internal.zzbmk;
import com.google.android.gms.internal.zzfis;
import com.google.android.gms.internal.zzfiz;
import java.nio.charset.Charset;
import java.util.HashMap;
/* compiled from: LogSamplerImpl.java */
/* loaded from: classes.dex */
public final class zzs implements ClearcutLogger.LogSampler {
    public static final Charset zza = Charset.forName("UTF-8");
    public static final zzfiz zzb;
    public static HashMap zzd;
    public static Boolean zze;
    public static Long zzf;
    public final Context zzc;

    static {
        String str;
        String valueOf = String.valueOf(Uri.encode("com.google.android.gms.clearcut.public"));
        if (valueOf.length() != 0) {
            str = "content://com.google.android.gms.phenotype/".concat(valueOf);
        } else {
            str = new String("content://com.google.android.gms.phenotype/");
        }
        zzb = new zzfiz(null, Uri.parse(str), "gms:playlog:service:sampling_", "LogSampling__", false, false);
        zzd = null;
        zze = null;
        zzf = null;
    }

    public static boolean zza(Context context) {
        boolean z;
        if (zze == null) {
            if (zzbmk.zza(context).zza.checkCallingOrSelfPermission("com.google.android.providers.gsf.permission.READ_GSERVICES") == 0) {
                z = true;
            } else {
                z = false;
            }
            zze = Boolean.valueOf(z);
        }
        return zze.booleanValue();
    }

    public zzs(Context context) {
        Context applicationContext;
        this.zzc = context;
        if (zzd == null) {
            zzd = new HashMap();
        }
        if (context != null && zzfis.zzc == null) {
            synchronized (zzfis.zzb) {
                if (!context.isDeviceProtectedStorage() && (applicationContext = context.getApplicationContext()) != null) {
                    context = applicationContext;
                }
                if (zzfis.zzc != context) {
                    zzfis.zze = null;
                }
                zzfis.zzc = context;
            }
        }
    }
}
