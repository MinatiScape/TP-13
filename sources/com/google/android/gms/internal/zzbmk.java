package com.google.android.gms.internal;

import android.content.Context;
/* compiled from: Wrappers.java */
/* loaded from: classes.dex */
public final class zzbmk {
    public static zzbmk zzb = new zzbmk();
    public zzbmj zza = null;

    public static zzbmj zza(Context context) {
        zzbmj zzbmjVar;
        zzbmk zzbmkVar = zzb;
        synchronized (zzbmkVar) {
            if (zzbmkVar.zza == null) {
                if (context.getApplicationContext() != null) {
                    context = context.getApplicationContext();
                }
                zzbmkVar.zza = new zzbmj(context);
            }
            zzbmjVar = zzbmkVar.zza;
        }
        return zzbmjVar;
    }
}
