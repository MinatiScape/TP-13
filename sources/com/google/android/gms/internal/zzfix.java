package com.google.android.gms.internal;

import android.content.SharedPreferences;
import android.util.Log;
/* compiled from: PhenotypeFlag.java */
/* loaded from: classes.dex */
public final class zzfix extends zzfis<String> {
    @Override // com.google.android.gms.internal.zzfis
    public final String zza(SharedPreferences sharedPreferences) {
        try {
            return sharedPreferences.getString(this.zza, null);
        } catch (ClassCastException e) {
            String valueOf = String.valueOf(this.zza);
            Log.e("PhenotypeFlag", valueOf.length() != 0 ? "Invalid string value in SharedPreferences for ".concat(valueOf) : new String("Invalid string value in SharedPreferences for "), e);
            return null;
        }
    }

    @Override // com.google.android.gms.internal.zzfis
    public final /* synthetic */ String zza(String str) {
        return str;
    }

    public zzfix(zzfiz zzfizVar, String str) {
        super(zzfizVar, str);
    }
}
