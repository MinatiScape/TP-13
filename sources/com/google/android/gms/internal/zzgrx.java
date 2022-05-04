package com.google.android.gms.internal;

import java.nio.charset.Charset;
/* compiled from: InternalNano.java */
/* loaded from: classes.dex */
public final class zzgrx {
    public static final Object zzb = new Object();

    public static boolean zza(Object[] objArr, Object[] objArr2) {
        int i;
        int length = objArr == null ? 0 : objArr.length;
        if (objArr2 == null) {
            i = 0;
        } else {
            i = objArr2.length;
        }
        int i2 = 0;
        int i3 = 0;
        while (true) {
            if (i2 >= length || objArr[i2] != null) {
                while (i3 < i && objArr2[i3] == null) {
                    i3++;
                }
                boolean z = i2 >= length;
                boolean z2 = i3 >= i;
                if (z && z2) {
                    return true;
                }
                if (z != z2 || !objArr[i2].equals(objArr2[i3])) {
                    return false;
                }
                i2++;
                i3++;
            } else {
                i2++;
            }
        }
    }

    static {
        Charset.forName("UTF-8");
        Charset.forName("ISO-8859-1");
    }

    public static int zza(Object[] objArr) {
        int length = objArr == null ? 0 : objArr.length;
        int i = 0;
        for (int i2 = 0; i2 < length; i2++) {
            Object obj = objArr[i2];
            if (obj != null) {
                i = obj.hashCode() + (i * 31);
            }
        }
        return i;
    }
}
