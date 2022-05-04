package com.google.android.gms.common;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.Signature;
import android.util.Log;
/* loaded from: classes.dex */
public class GoogleSignatureVerifier {
    public static GoogleSignatureVerifier zza;

    public GoogleSignatureVerifier(Context context) {
        context.getApplicationContext();
    }

    public static boolean zza(PackageInfo packageInfo, boolean z) {
        if (!(packageInfo == null || packageInfo.signatures == null)) {
            if ((z ? zza(packageInfo, zzi.zza) : zza(packageInfo, zzi.zza[0])) != null) {
                return true;
            }
        }
        return false;
    }

    public static zzf zza(PackageInfo packageInfo, zzf... zzfVarArr) {
        Signature[] signatureArr = packageInfo.signatures;
        if (signatureArr == null) {
            return null;
        }
        if (signatureArr.length != 1) {
            Log.w("GoogleSignatureVerifier", "Package has more than one signature.");
            return null;
        }
        zzg zzgVar = new zzg(packageInfo.signatures[0].toByteArray());
        for (int i = 0; i < zzfVarArr.length; i++) {
            if (zzfVarArr[i].equals(zzgVar)) {
                return zzfVarArr[i];
            }
        }
        return null;
    }
}
