package com.google.android.gms.internal;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.content.ContentResolver;
import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Binder;
import android.os.Process;
import android.os.UserManager;
import android.util.Log;
import androidx.slice.view.R$attr;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
/* compiled from: PhenotypeFlag.java */
/* loaded from: classes.dex */
public abstract class zzfis<T> {
    public static final Object zzb = new Object();
    @SuppressLint({"StaticFieldLeak"})
    public static Context zzc;
    public static volatile Boolean zze;
    public static volatile Boolean zzf;
    public final String zza;
    public final zzfiz zzg;
    public final String zzh;
    public final T zzi;
    public volatile zzfiq zzk;
    public volatile SharedPreferences zzl;

    public zzfis() {
        throw null;
    }

    public zzfis(zzfiz zzfizVar, String str) {
        this.zzk = null;
        this.zzl = null;
        String str2 = zzfizVar.zza;
        if (str2 == null && zzfizVar.zzb == null) {
            throw new IllegalArgumentException("Must pass a valid SharedPreferences file name or ContentProvider URI");
        } else if (str2 == null || zzfizVar.zzb == null) {
            this.zzg = zzfizVar;
            String valueOf = String.valueOf(zzfizVar.zzc);
            this.zzh = str.length() != 0 ? valueOf.concat(str) : new String(valueOf);
            String valueOf2 = String.valueOf(zzfizVar.zzd);
            this.zza = str.length() != 0 ? valueOf2.concat(str) : new String(valueOf2);
            this.zzi = null;
        } else {
            throw new IllegalArgumentException("Must pass one of SharedPreferences file name or ContentProvider URI");
        }
    }

    public static <V> V zza(zzfiy<V> zzfiyVar) {
        try {
            return zzfiyVar.zza();
        } catch (SecurityException unused) {
            long clearCallingIdentity = Binder.clearCallingIdentity();
            try {
                return zzfiyVar.zza();
            } finally {
                Binder.restoreCallingIdentity(clearCallingIdentity);
            }
        }
    }

    public abstract String zza(SharedPreferences sharedPreferences);

    public abstract String zza(String str);

    public static boolean zzg() {
        String str;
        if (zze == null) {
            Context context = zzc;
            boolean z = false;
            if (context == null) {
                return false;
            }
            if (Binder.getCallingPid() == Process.myPid()) {
                str = context.getPackageName();
            } else {
                str = null;
            }
            if (R$attr.checkPermission(context, "com.google.android.providers.gsf.permission.READ_GSERVICES", Binder.getCallingPid(), Binder.getCallingUid(), str) == 0) {
                z = true;
            }
            zze = Boolean.valueOf(z);
        }
        return zze.booleanValue();
    }

    /* JADX WARN: Finally extract failed */
    public final T zzf() {
        String str;
        if (this.zzg.zze || !zzg()) {
            return null;
        }
        try {
            str = zzfib.zza(zzc.getContentResolver(), this.zzh);
        } catch (SecurityException unused) {
            long clearCallingIdentity = Binder.clearCallingIdentity();
            try {
                String zza = zzfib.zza(zzc.getContentResolver(), this.zzh);
                Binder.restoreCallingIdentity(clearCallingIdentity);
                str = zza;
            } catch (Throwable th) {
                Binder.restoreCallingIdentity(clearCallingIdentity);
                throw th;
            }
        }
        if (str != null) {
            return (T) zza(str);
        }
        return null;
    }

    @TargetApi(24)
    public final T zze() {
        boolean z;
        String str;
        boolean z2;
        if (zzg()) {
            z = ((Boolean) zza(new zzfiv("gms:phenotype:phenotype_flag:debug_bypass_phenotype"))).booleanValue();
        } else {
            z = false;
        }
        if (!z) {
            zzfiz zzfizVar = this.zzg;
            if (zzfizVar.zzb != null) {
                if (this.zzk == null) {
                    ContentResolver contentResolver = zzc.getContentResolver();
                    Uri uri = this.zzg.zzb;
                    ConcurrentHashMap<Uri, zzfiq> concurrentHashMap = zzfiq.zza;
                    zzfiq zzfiqVar = concurrentHashMap.get(uri);
                    if (zzfiqVar == null) {
                        zzfiqVar = new zzfiq(contentResolver, uri);
                        zzfiq putIfAbsent = concurrentHashMap.putIfAbsent(uri, zzfiqVar);
                        if (putIfAbsent == null) {
                            contentResolver.registerContentObserver(uri, false, zzfiqVar.zzd);
                        } else {
                            zzfiqVar = putIfAbsent;
                        }
                    }
                    this.zzk = zzfiqVar;
                }
                final zzfiq zzfiqVar2 = this.zzk;
                String str2 = (String) zza(new zzfiy(this, zzfiqVar2) { // from class: com.google.android.gms.internal.zzfit
                    public final zzfis zza;
                    public final zzfiq zzb;

                    {
                        this.zza = this;
                        this.zzb = zzfiqVar2;
                    }

                    @Override // com.google.android.gms.internal.zzfiy
                    public final Object zza() {
                        boolean z3;
                        Map map;
                        zzfis zzfisVar = this.zza;
                        zzfiq zzfiqVar3 = this.zzb;
                        zzfiqVar3.getClass();
                        if (zzfis.zzg()) {
                            z3 = ((Boolean) zzfis.zza(new zzfiv("gms:phenotype:phenotype_flag:debug_disable_caching"))).booleanValue();
                        } else {
                            z3 = false;
                        }
                        if (z3) {
                            map = zzfiqVar3.zzc();
                        } else {
                            map = zzfiqVar3.zzf;
                        }
                        if (map == null) {
                            synchronized (zzfiqVar3.zze) {
                                Map map2 = zzfiqVar3.zzf;
                                map = map2;
                                if (map2 == null) {
                                    HashMap zzc2 = zzfiqVar3.zzc();
                                    zzfiqVar3.zzf = zzc2;
                                    map = zzc2;
                                }
                            }
                        }
                        if (map == null) {
                            map = Collections.emptyMap();
                        }
                        return (String) map.get(zzfisVar.zza);
                    }
                });
                if (str2 != null) {
                    return (T) zza(str2);
                }
            } else if (zzfizVar.zza != null) {
                if (!zzc.isDeviceProtectedStorage()) {
                    if (zzf == null || !zzf.booleanValue()) {
                        zzf = Boolean.valueOf(((UserManager) zzc.getSystemService(UserManager.class)).isUserUnlocked());
                    }
                    z2 = zzf.booleanValue();
                } else {
                    z2 = true;
                }
                if (!z2) {
                    return null;
                }
                if (this.zzl == null) {
                    this.zzl = zzc.getSharedPreferences(this.zzg.zza, 0);
                }
                SharedPreferences sharedPreferences = this.zzl;
                if (sharedPreferences.contains(this.zza)) {
                    return (T) zza(sharedPreferences);
                }
            }
        } else {
            String valueOf = String.valueOf(this.zza);
            if (valueOf.length() != 0) {
                str = "Bypass reading Phenotype values for flag: ".concat(valueOf);
            } else {
                str = new String("Bypass reading Phenotype values for flag: ");
            }
            Log.w("PhenotypeFlag", str);
        }
        return null;
    }
}
