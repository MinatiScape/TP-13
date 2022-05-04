package com.google.android.gms.common;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.Signature;
import android.util.Log;
/* loaded from: classes.dex */
public final class GoogleSignatureVerifier {
    public static GoogleSignatureVerifier zza;

    public static boolean zza(PackageInfo packageInfo) {
        return (packageInfo == null || packageInfo.signatures == null || zza(packageInfo, zzi.zza) == null) ? false : true;
    }

    public GoogleSignatureVerifier(Context context) {
        context.getApplicationContext();
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
