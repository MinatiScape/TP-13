package com.google.android.gms.auth.api.signin;

import android.accounts.Account;
import android.os.Parcel;
import android.os.Parcelable;
import androidx.core.R$id;
import com.google.android.gms.auth.api.signin.internal.zzo;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.internal.zzbkv;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
/* loaded from: classes.dex */
public class GoogleSignInOptions extends zzbkv implements Api.ApiOptions, ReflectedParcelable {
    public static final Parcelable.Creator<GoogleSignInOptions> CREATOR;
    public static final Scope zzc;
    public static final Scope zzd;
    public static final Scope zze;
    public final int zzf;
    public final ArrayList<Scope> zzg;
    public Account zzh;
    public boolean zzi;
    public final boolean zzj;
    public final boolean zzk;
    public String zzl;
    public String zzm;
    public ArrayList<zzo> zzn;
    public Map<Integer, zzo> zzo;

    public GoogleSignInOptions() {
        throw null;
    }

    public GoogleSignInOptions(int i, ArrayList arrayList, Account account, boolean z, boolean z2, boolean z3, String str, String str2, HashMap hashMap) {
        this.zzf = i;
        this.zzg = arrayList;
        this.zzh = account;
        this.zzi = z;
        this.zzj = z2;
        this.zzk = z3;
        this.zzl = str;
        this.zzm = str2;
        this.zzn = new ArrayList<>(hashMap.values());
        this.zzo = hashMap;
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0049, code lost:
        if (r1.equals(r5.zzh) != false) goto L22;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0064, code lost:
        if (r4.zzl.equals(r5.zzl) != false) goto L29;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r5) {
        /*
            r4 = this;
            r0 = 0
            if (r5 != 0) goto L4
            return r0
        L4:
            com.google.android.gms.auth.api.signin.GoogleSignInOptions r5 = (com.google.android.gms.auth.api.signin.GoogleSignInOptions) r5     // Catch: java.lang.ClassCastException -> L7a
            java.util.ArrayList<com.google.android.gms.auth.api.signin.internal.zzo> r1 = r4.zzn     // Catch: java.lang.ClassCastException -> L7a
            int r1 = r1.size()     // Catch: java.lang.ClassCastException -> L7a
            if (r1 > 0) goto L7a
            java.util.ArrayList<com.google.android.gms.auth.api.signin.internal.zzo> r1 = r5.zzn     // Catch: java.lang.ClassCastException -> L7a
            int r1 = r1.size()     // Catch: java.lang.ClassCastException -> L7a
            if (r1 <= 0) goto L17
            goto L7a
        L17:
            java.util.ArrayList<com.google.android.gms.common.api.Scope> r1 = r4.zzg     // Catch: java.lang.ClassCastException -> L7a
            int r1 = r1.size()     // Catch: java.lang.ClassCastException -> L7a
            java.util.ArrayList r2 = new java.util.ArrayList     // Catch: java.lang.ClassCastException -> L7a
            java.util.ArrayList<com.google.android.gms.common.api.Scope> r3 = r5.zzg     // Catch: java.lang.ClassCastException -> L7a
            r2.<init>(r3)     // Catch: java.lang.ClassCastException -> L7a
            int r2 = r2.size()     // Catch: java.lang.ClassCastException -> L7a
            if (r1 != r2) goto L7a
            java.util.ArrayList<com.google.android.gms.common.api.Scope> r1 = r4.zzg     // Catch: java.lang.ClassCastException -> L7a
            java.util.ArrayList r2 = new java.util.ArrayList     // Catch: java.lang.ClassCastException -> L7a
            java.util.ArrayList<com.google.android.gms.common.api.Scope> r3 = r5.zzg     // Catch: java.lang.ClassCastException -> L7a
            r2.<init>(r3)     // Catch: java.lang.ClassCastException -> L7a
            boolean r1 = r1.containsAll(r2)     // Catch: java.lang.ClassCastException -> L7a
            if (r1 != 0) goto L3a
            goto L7a
        L3a:
            android.accounts.Account r1 = r4.zzh     // Catch: java.lang.ClassCastException -> L7a
            if (r1 != 0) goto L43
            android.accounts.Account r1 = r5.zzh     // Catch: java.lang.ClassCastException -> L7a
            if (r1 != 0) goto L7a
            goto L4b
        L43:
            android.accounts.Account r2 = r5.zzh     // Catch: java.lang.ClassCastException -> L7a
            boolean r1 = r1.equals(r2)     // Catch: java.lang.ClassCastException -> L7a
            if (r1 == 0) goto L7a
        L4b:
            java.lang.String r1 = r4.zzl     // Catch: java.lang.ClassCastException -> L7a
            boolean r1 = android.text.TextUtils.isEmpty(r1)     // Catch: java.lang.ClassCastException -> L7a
            if (r1 == 0) goto L5c
            java.lang.String r1 = r5.zzl     // Catch: java.lang.ClassCastException -> L7a
            boolean r1 = android.text.TextUtils.isEmpty(r1)     // Catch: java.lang.ClassCastException -> L7a
            if (r1 == 0) goto L7a
            goto L66
        L5c:
            java.lang.String r1 = r4.zzl     // Catch: java.lang.ClassCastException -> L7a
            java.lang.String r2 = r5.zzl     // Catch: java.lang.ClassCastException -> L7a
            boolean r1 = r1.equals(r2)     // Catch: java.lang.ClassCastException -> L7a
            if (r1 == 0) goto L7a
        L66:
            boolean r1 = r4.zzk     // Catch: java.lang.ClassCastException -> L7a
            boolean r2 = r5.zzk     // Catch: java.lang.ClassCastException -> L7a
            if (r1 != r2) goto L7a
            boolean r1 = r4.zzi     // Catch: java.lang.ClassCastException -> L7a
            boolean r2 = r5.zzi     // Catch: java.lang.ClassCastException -> L7a
            if (r1 != r2) goto L7a
            boolean r4 = r4.zzj     // Catch: java.lang.ClassCastException -> L7a
            boolean r5 = r5.zzj     // Catch: java.lang.ClassCastException -> L7a
            if (r4 != r5) goto L7a
            r4 = 1
            return r4
        L7a:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.auth.api.signin.GoogleSignInOptions.equals(java.lang.Object):boolean");
    }

    static {
        Scope scope = new Scope(1, "profile");
        new Scope(1, "email");
        Scope scope2 = new Scope(1, "openid");
        zzc = scope2;
        Scope scope3 = new Scope(1, "https://www.googleapis.com/auth/games_lite");
        zzd = scope3;
        Scope scope4 = new Scope(1, "https://www.googleapis.com/auth/games");
        zze = scope4;
        HashSet hashSet = new HashSet();
        HashMap hashMap = new HashMap();
        hashSet.add(scope2);
        hashSet.add(scope);
        if (hashSet.contains(scope4) && hashSet.contains(scope3)) {
            hashSet.remove(scope3);
        }
        new GoogleSignInOptions(3, new ArrayList(hashSet), null, false, false, false, null, null, hashMap);
        HashSet hashSet2 = new HashSet();
        HashMap hashMap2 = new HashMap();
        hashSet2.add(scope3);
        hashSet2.addAll(Arrays.asList(new Scope[0]));
        if (hashSet2.contains(scope4) && hashSet2.contains(scope3)) {
            hashSet2.remove(scope3);
        }
        new GoogleSignInOptions(3, new ArrayList(hashSet2), null, false, false, false, null, null, hashMap2);
        CREATOR = new zze();
    }

    public final int hashCode() {
        int i;
        ArrayList arrayList = new ArrayList();
        ArrayList<Scope> arrayList2 = this.zzg;
        int size = arrayList2.size();
        int i2 = 0;
        int i3 = 0;
        while (i3 < size) {
            Scope scope = arrayList2.get(i3);
            i3++;
            arrayList.add(scope.zzb);
        }
        Collections.sort(arrayList);
        Account account = this.zzh;
        int hashCode = (arrayList.hashCode() + (1 * 31)) * 31;
        if (account == null) {
            i = 0;
        } else {
            i = account.hashCode();
        }
        int i4 = hashCode + i;
        String str = this.zzl;
        int i5 = i4 * 31;
        if (str != null) {
            i2 = str.hashCode();
        }
        return ((((((i5 + i2) * 31) + (this.zzk ? 1 : 0)) * 31) + (this.zzi ? 1 : 0)) * 31) + (this.zzj ? 1 : 0);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int zzb = R$id.zzb(parcel, 20293);
        int i2 = this.zzf;
        R$id.zzb(parcel, 1, 4);
        parcel.writeInt(i2);
        R$id.zzc(parcel, 2, new ArrayList(this.zzg));
        R$id.zza(parcel, 3, this.zzh, i);
        boolean z = this.zzi;
        R$id.zzb(parcel, 4, 4);
        parcel.writeInt(z ? 1 : 0);
        boolean z2 = this.zzj;
        R$id.zzb(parcel, 5, 4);
        parcel.writeInt(z2 ? 1 : 0);
        boolean z3 = this.zzk;
        R$id.zzb(parcel, 6, 4);
        parcel.writeInt(z3 ? 1 : 0);
        R$id.zza(parcel, 7, this.zzl);
        R$id.zza(parcel, 8, this.zzm);
        R$id.zzc(parcel, 9, this.zzn);
        R$id.zzc(parcel, zzb);
    }
}
