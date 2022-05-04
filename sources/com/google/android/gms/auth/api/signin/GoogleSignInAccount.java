package com.google.android.gms.auth.api.signin;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import androidx.preference.R$string;
import androidx.slice.view.R$layout;
import com.android.systemui.flags.FlagManager;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.internal.zzbkv;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class GoogleSignInAccount extends zzbkv implements ReflectedParcelable {
    public static final Parcelable.Creator<GoogleSignInAccount> CREATOR = new zzb();
    public final int zzb;
    public String zzc;
    public String zzd;
    public String zze;
    public String zzf;
    public Uri zzg;
    public String zzh;
    public long zzi;
    public String zzj;
    public List<Scope> zzk;
    public String zzl;
    public String zzm;
    public Set<Scope> zzn = new HashSet();

    public GoogleSignInAccount(int i, String str, String str2, String str3, String str4, Uri uri, String str5, long j, String str6, List<Scope> list, String str7, String str8) {
        this.zzb = i;
        this.zzc = str;
        this.zzd = str2;
        this.zze = str3;
        this.zzf = str4;
        this.zzg = uri;
        this.zzh = str5;
        this.zzi = j;
        this.zzj = str6;
        this.zzk = list;
        this.zzl = str7;
        this.zzm = str8;
    }

    public static GoogleSignInAccount zza(String str) throws JSONException {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        JSONObject jSONObject = new JSONObject(str);
        String optString = jSONObject.optString("photoUrl", null);
        Uri parse = !TextUtils.isEmpty(optString) ? Uri.parse(optString) : null;
        long parseLong = Long.parseLong(jSONObject.getString("expirationTime"));
        HashSet hashSet = new HashSet();
        JSONArray jSONArray = jSONObject.getJSONArray("grantedScopes");
        int length = jSONArray.length();
        for (int i = 0; i < length; i++) {
            hashSet.add(new Scope(1, jSONArray.getString(i)));
        }
        String optString2 = jSONObject.optString(FlagManager.FIELD_ID);
        String optString3 = jSONObject.optString("tokenId", null);
        String optString4 = jSONObject.optString("email", null);
        String optString5 = jSONObject.optString("displayName", null);
        String optString6 = jSONObject.optString("givenName", null);
        String optString7 = jSONObject.optString("familyName", null);
        Long valueOf = Long.valueOf(parseLong);
        String string = jSONObject.getString("obfuscatedIdentifier");
        if (valueOf == null) {
            valueOf = Long.valueOf(System.currentTimeMillis() / 1000);
        }
        long longValue = valueOf.longValue();
        R$string.zza(string);
        GoogleSignInAccount googleSignInAccount = new GoogleSignInAccount(3, optString2, optString3, optString4, optString5, parse, null, longValue, string, new ArrayList(hashSet), optString6, optString7);
        googleSignInAccount.zzh = jSONObject.optString("serverAuthCode", null);
        return googleSignInAccount;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof GoogleSignInAccount)) {
            return false;
        }
        GoogleSignInAccount googleSignInAccount = (GoogleSignInAccount) obj;
        return googleSignInAccount.zzj.equals(this.zzj) && googleSignInAccount.zzd().equals(zzd());
    }

    public int hashCode() {
        return zzd().hashCode() + ((this.zzj.hashCode() + 527) * 31);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        int zzb = R$layout.zzb(parcel, 20293);
        int i2 = this.zzb;
        R$layout.zzb(parcel, 1, 4);
        parcel.writeInt(i2);
        R$layout.zza(parcel, 2, this.zzc, false);
        R$layout.zza(parcel, 3, this.zzd, false);
        R$layout.zza(parcel, 4, this.zze, false);
        R$layout.zza(parcel, 5, this.zzf, false);
        R$layout.zza(parcel, 6, this.zzg, i, false);
        R$layout.zza(parcel, 7, this.zzh, false);
        long j = this.zzi;
        R$layout.zzb(parcel, 8, 8);
        parcel.writeLong(j);
        R$layout.zza(parcel, 9, this.zzj, false);
        R$layout.zzc(parcel, 10, this.zzk, false);
        R$layout.zza(parcel, 11, this.zzl, false);
        R$layout.zza(parcel, 12, this.zzm, false);
        R$layout.zzc(parcel, zzb);
    }

    public final Set<Scope> zzd() {
        HashSet hashSet = new HashSet(this.zzk);
        hashSet.addAll(this.zzn);
        return hashSet;
    }
}
