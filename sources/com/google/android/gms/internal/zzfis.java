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
import androidx.core.content.PermissionChecker;
import java.util.HashMap;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;
/* loaded from: classes.dex */
public abstract class zzfis<T> {
    public static final Object zzb = new Object();
    @SuppressLint({"StaticFieldLeak"})
    public static Context zzc = null;
    public static boolean zzd = false;
    public static volatile Boolean zze;
    public static volatile Boolean zzf;
    public final String zza;
    public final zzfiz zzg;
    public final String zzh;
    public final T zzi;
    public volatile zzfiq zzk = null;
    public volatile SharedPreferences zzl = null;

    /* JADX WARN: Multi-variable type inference failed */
    public zzfis(zzfiz zzfizVar, String str, Object obj, zzfiw zzfiwVar) {
        String str2 = zzfizVar.zza;
        if (str2 == null && zzfizVar.zzb == null) {
            throw new IllegalArgumentException("Must pass a valid SharedPreferences file name or ContentProvider URI");
        } else if (str2 == null || zzfizVar.zzb == null) {
            this.zzg = zzfizVar;
            String valueOf = String.valueOf(zzfizVar.zzc);
            String valueOf2 = String.valueOf(str);
            this.zzh = valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf);
            String valueOf3 = String.valueOf(zzfizVar.zzd);
            String valueOf4 = String.valueOf(str);
            this.zza = valueOf4.length() != 0 ? valueOf3.concat(valueOf4) : new String(valueOf3);
            this.zzi = obj;
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

    public static boolean zzg() {
        if (zze == null) {
            Context context = zzc;
            boolean z = false;
            if (context == null) {
                return false;
            }
            if (PermissionChecker.checkPermission(context, "com.google.android.providers.gsf.permission.READ_GSERVICES", Binder.getCallingPid(), Binder.getCallingUid(), Binder.getCallingPid() == Process.myPid() ? context.getPackageName() : null) == 0) {
                z = true;
            }
            zze = Boolean.valueOf(z);
        }
        return zze.booleanValue();
    }

    public abstract T zza(SharedPreferences sharedPreferences);

    /* renamed from: zza  reason: collision with other method in class */
    public abstract T mo18zza(String str);

    @TargetApi(24)
    public final T zze() {
        boolean z;
        if (!zza("gms:phenotype:phenotype_flag:debug_bypass_phenotype")) {
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
                String str = (String) zza(new zzfit(this, this.zzk));
                if (str != null) {
                    return mo18zza(str);
                }
            } else if (zzfizVar.zza != null) {
                if (!zzc.isDeviceProtectedStorage()) {
                    if (zzf == null || !zzf.booleanValue()) {
                        zzf = Boolean.valueOf(((UserManager) zzc.getSystemService(UserManager.class)).isUserUnlocked());
                    }
                    z = zzf.booleanValue();
                } else {
                    z = true;
                }
                if (!z) {
                    return null;
                }
                if (this.zzl == null) {
                    this.zzl = zzc.getSharedPreferences(this.zzg.zza, 0);
                }
                SharedPreferences sharedPreferences = this.zzl;
                if (sharedPreferences.contains(this.zza)) {
                    return zza(sharedPreferences);
                }
            }
        } else {
            String valueOf = String.valueOf(this.zza);
            Log.w("PhenotypeFlag", valueOf.length() != 0 ? "Bypass reading Phenotype values for flag: ".concat(valueOf) : new String("Bypass reading Phenotype values for flag: "));
        }
        return null;
    }

    public final T zzf() {
        String str;
        if (this.zzg.zze || !zzg()) {
            return null;
        }
        try {
            Objects.requireNonNull(this);
            str = zzfib.zza(zzc.getContentResolver(), this.zzh);
        } catch (SecurityException unused) {
            long clearCallingIdentity = Binder.clearCallingIdentity();
            try {
                Objects.requireNonNull(this);
                str = zzfib.zza(zzc.getContentResolver(), this.zzh);
            } finally {
                Binder.restoreCallingIdentity(clearCallingIdentity);
            }
        }
        if (str != null) {
            return mo18zza(str);
        }
        return null;
    }

    public static boolean zza(final String str) {
        if (zzg()) {
            return ((Boolean) zza(new zzfiy(str) { // from class: com.google.android.gms.internal.zzfiv
                public final String zza;

                {
                    this.zza = str;
                }

                @Override // com.google.android.gms.internal.zzfiy
                public final Object zza() {
                    Object obj;
                    boolean z;
                    String str2 = this.zza;
                    ContentResolver contentResolver = zzfis.zzc.getContentResolver();
                    Uri uri = zzfib.zzc;
                    synchronized (zzfib.class) {
                        zzfib.zza(contentResolver);
                        obj = zzfib.zzk;
                    }
                    HashMap<String, Boolean> hashMap = zzfib.zzg;
                    Boolean bool = Boolean.FALSE;
                    Boolean bool2 = (Boolean) zzfib.zza(hashMap, str2, bool);
                    if (bool2 != null) {
                        z = bool2.booleanValue();
                    } else {
                        String zza = zzfib.zza(contentResolver, str2);
                        boolean z2 = false;
                        if (zza != null && !zza.equals("")) {
                            if (zzfib.zza.matcher(zza).matches()) {
                                z2 = true;
                                bool = Boolean.TRUE;
                            } else if (!zzfib.zzb.matcher(zza).matches()) {
                                Log.w("Gservices", "attempt to read gservices key " + str2 + " (value \"" + zza + "\") as boolean");
                            }
                            zzfib.zza(obj, hashMap, str2, bool);
                            z = z2;
                        }
                        bool = bool2;
                        zzfib.zza(obj, hashMap, str2, bool);
                        z = z2;
                    }
                    return Boolean.valueOf(z);
                }
            })).booleanValue();
        }
        return false;
    }
}
