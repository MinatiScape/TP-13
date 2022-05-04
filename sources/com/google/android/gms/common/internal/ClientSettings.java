package com.google.android.gms.common.internal;

import android.accounts.Account;
import androidx.collection.ArraySet;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.signin.SignInOptions;
import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
/* loaded from: classes.dex */
public final class ClientSettings {
    public final Account zza;
    public final Set<Scope> zzb;
    public final Set<Scope> zzc;
    public final Map<Api<?>, OptionalApiSettings> zzd;
    public final String zzg;
    public final String zzh;
    public final SignInOptions zzi;
    public Integer zzj;

    /* loaded from: classes.dex */
    public static final class OptionalApiSettings {
    }

    /* loaded from: classes.dex */
    public static final class zza {
        public Account zza;
        public ArraySet<Scope> zzb;
        public String zzd;
        public String zze;
    }

    public ClientSettings(Account account, ArraySet arraySet, String str, String str2) {
        Set<Scope> set;
        SignInOptions signInOptions = SignInOptions.DEFAULT;
        this.zza = account;
        if (arraySet == null) {
            set = Collections.EMPTY_SET;
        } else {
            set = Collections.unmodifiableSet(arraySet);
        }
        this.zzb = set;
        Map<Api<?>, OptionalApiSettings> map = Collections.EMPTY_MAP;
        this.zzd = map;
        this.zzg = str;
        this.zzh = str2;
        this.zzi = signInOptions;
        HashSet hashSet = new HashSet(set);
        for (OptionalApiSettings optionalApiSettings : map.values()) {
            optionalApiSettings.getClass();
            hashSet.addAll(null);
        }
        this.zzc = Collections.unmodifiableSet(hashSet);
    }
}
