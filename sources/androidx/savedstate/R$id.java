package androidx.savedstate;

import android.util.Base64;
/* loaded from: classes.dex */
public class R$id {
    public static String zza(byte[] bArr) {
        if (bArr == null) {
            return null;
        }
        return Base64.encodeToString(bArr, 0);
    }

    public static String zzb(byte[] bArr) {
        if (bArr == null) {
            return null;
        }
        return Base64.encodeToString(bArr, 10);
    }
}
