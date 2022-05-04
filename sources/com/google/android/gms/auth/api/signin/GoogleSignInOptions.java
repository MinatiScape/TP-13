package com.google.android.gms.auth.api.signin;

import android.accounts.Account;
import android.os.Parcel;
import android.os.Parcelable;
import androidx.slice.view.R$layout;
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
    public static final Scope zza;
    public static final Scope zzd;
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
    public static final Scope zzc = new Scope(1, "openid");
    public static final Scope zze = new Scope(1, "https://www.googleapis.com/auth/games");

    static {
        Scope scope = new Scope(1, "profile");
        zza = scope;
        new Scope(1, "email");
        Scope scope2 = new Scope(1, "https://www.googleapis.com/auth/games_lite");
        zzd = scope2;
        HashSet hashSet = new HashSet();
        HashMap hashMap = new HashMap();
        hashSet.add(zzc);
        hashSet.add(scope);
        if (hashSet.contains(zze)) {
            Scope scope3 = zzd;
            if (hashSet.contains(scope3)) {
                hashSet.remove(scope3);
            }
        }
        new GoogleSignInOptions(3, new ArrayList(hashSet), null, false, false, false, null, null, hashMap);
        HashSet hashSet2 = new HashSet();
        HashMap hashMap2 = new HashMap();
        hashSet2.add(scope2);
        hashSet2.addAll(Arrays.asList(new Scope[0]));
        if (hashSet2.contains(zze)) {
            Scope scope4 = zzd;
            if (hashSet2.contains(scope4)) {
                hashSet2.remove(scope4);
            }
        }
        new GoogleSignInOptions(3, new ArrayList(hashSet2), null, false, false, false, null, null, hashMap2);
        CREATOR = new zze();
    }

    public GoogleSignInOptions(int i, ArrayList<Scope> arrayList, Account account, boolean z, boolean z2, boolean z3, String str, String str2, Map<Integer, zzo> map) {
        this.zzf = i;
        this.zzg = arrayList;
        this.zzh = account;
        this.zzi = z;
        this.zzj = z2;
        this.zzk = z3;
        this.zzl = str;
        this.zzm = str2;
        this.zzn = new ArrayList<>(map.values());
        this.zzo = map;
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0043, code lost:
        if (r1.equals(r4.zzh) != false) goto L22;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x005e, code lost:
        if (r3.zzl.equals(r4.zzl) != false) goto L29;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean equals(java.lang.Object r4) {
        /*
            r3 = this;
            r0 = 0
            if (r4 != 0) goto L4
            return r0
        L4:
            com.google.android.gms.auth.api.signin.GoogleSignInOptions r4 = (com.google.android.gms.auth.api.signin.GoogleSignInOptions) r4     // Catch: java.lang.ClassCastException -> L74
            java.util.ArrayList<com.google.android.gms.auth.api.signin.internal.zzo> r1 = r3.zzn     // Catch: java.lang.ClassCastException -> L74
            int r1 = r1.size()     // Catch: java.lang.ClassCastException -> L74
            if (r1 > 0) goto L74
            java.util.ArrayList<com.google.android.gms.auth.api.signin.internal.zzo> r1 = r4.zzn     // Catch: java.lang.ClassCastException -> L74
            int r1 = r1.size()     // Catch: java.lang.ClassCastException -> L74
            if (r1 <= 0) goto L17
            goto L74
        L17:
            java.util.ArrayList<com.google.android.gms.common.api.Scope> r1 = r3.zzg     // Catch: java.lang.ClassCastException -> L74
            int r1 = r1.size()     // Catch: java.lang.ClassCastException -> L74
            java.util.ArrayList r2 = r4.zza()     // Catch: java.lang.ClassCastException -> L74
            int r2 = r2.size()     // Catch: java.lang.ClassCastException -> L74
            if (r1 != r2) goto L74
            java.util.ArrayList<com.google.android.gms.common.api.Scope> r1 = r3.zzg     // Catch: java.lang.ClassCastException -> L74
            java.util.ArrayList r2 = r4.zza()     // Catch: java.lang.ClassCastException -> L74
            boolean r1 = r1.containsAll(r2)     // Catch: java.lang.ClassCastException -> L74
            if (r1 != 0) goto L34
            goto L74
        L34:
            android.accounts.Account r1 = r3.zzh     // Catch: java.lang.ClassCastException -> L74
            if (r1 != 0) goto L3d
            android.accounts.Account r1 = r4.zzh     // Catch: java.lang.ClassCastException -> L74
            if (r1 != 0) goto L74
            goto L45
        L3d:
            android.accounts.Account r2 = r4.zzh     // Catch: java.lang.ClassCastException -> L74
            boolean r1 = r1.equals(r2)     // Catch: java.lang.ClassCastException -> L74
            if (r1 == 0) goto L74
        L45:
            java.lang.String r1 = r3.zzl     // Catch: java.lang.ClassCastException -> L74
            boolean r1 = android.text.TextUtils.isEmpty(r1)     // Catch: java.lang.ClassCastException -> L74
            if (r1 == 0) goto L56
            java.lang.String r1 = r4.zzl     // Catch: java.lang.ClassCastException -> L74
            boolean r1 = android.text.TextUtils.isEmpty(r1)     // Catch: java.lang.ClassCastException -> L74
            if (r1 == 0) goto L74
            goto L60
        L56:
            java.lang.String r1 = r3.zzl     // Catch: java.lang.ClassCastException -> L74
            java.lang.String r2 = r4.zzl     // Catch: java.lang.ClassCastException -> L74
            boolean r1 = r1.equals(r2)     // Catch: java.lang.ClassCastException -> L74
            if (r1 == 0) goto L74
        L60:
            boolean r1 = r3.zzk     // Catch: java.lang.ClassCastException -> L74
            boolean r2 = r4.zzk     // Catch: java.lang.ClassCastException -> L74
            if (r1 != r2) goto L74
            boolean r1 = r3.zzi     // Catch: java.lang.ClassCastException -> L74
            boolean r2 = r4.zzi     // Catch: java.lang.ClassCastException -> L74
            if (r1 != r2) goto L74
            boolean r3 = r3.zzj     // Catch: java.lang.ClassCastException -> L74
            boolean r4 = r4.zzj     // Catch: java.lang.ClassCastException -> L74
            if (r3 != r4) goto L74
            r3 = 1
            return r3
        L74:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.auth.api.signin.GoogleSignInOptions.equals(java.lang.Object):boolean");
    }

    public int hashCode() {
        ArrayList arrayList = new ArrayList();
        ArrayList<Scope> arrayList2 = this.zzg;
        int size = arrayList2.size();
        int i = 0;
        int i2 = 0;
        while (i2 < size) {
            Scope scope = arrayList2.get(i2);
            i2++;
            arrayList.add(scope.zzb);
        }
        Collections.sort(arrayList);
        int hashCode = (1 * 31) + arrayList.hashCode();
        Account account = this.zzh;
        int hashCode2 = (hashCode * 31) + (account == null ? 0 : account.hashCode());
        String str = this.zzl;
        int i3 = hashCode2 * 31;
        if (str != null) {
            i = str.hashCode();
        }
        return ((((((i3 + i) * 31) + (this.zzk ? 1 : 0)) * 31) + (this.zzi ? 1 : 0)) * 31) + (this.zzj ? 1 : 0);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        int zzb = R$layout.zzb(parcel, 20293);
        int i2 = this.zzf;
        R$layout.zzb(parcel, 1, 4);
        parcel.writeInt(i2);
        R$layout.zzc(parcel, 2, zza(), false);
        R$layout.zza(parcel, 3, this.zzh, i, false);
        boolean z = this.zzi;
        R$layout.zzb(parcel, 4, 4);
        parcel.writeInt(z ? 1 : 0);
        boolean z2 = this.zzj;
        R$layout.zzb(parcel, 5, 4);
        parcel.writeInt(z2 ? 1 : 0);
        boolean z3 = this.zzk;
        R$layout.zzb(parcel, 6, 4);
        parcel.writeInt(z3 ? 1 : 0);
        R$layout.zza(parcel, 7, this.zzl, false);
        R$layout.zza(parcel, 8, this.zzm, false);
        R$layout.zzc(parcel, 9, this.zzn, false);
        R$layout.zzc(parcel, zzb);
    }

    public final ArrayList<Scope> zza() {
        return new ArrayList<>(this.zzg);
    }
}
