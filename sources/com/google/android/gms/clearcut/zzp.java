package com.google.android.gms.clearcut;

import java.util.Comparator;
/* compiled from: Counters.java */
/* loaded from: classes.dex */
public final class zzp implements Comparator<byte[]> {
    @Override // java.util.Comparator
    public final /* synthetic */ int compare(byte[] bArr, byte[] bArr2) {
        byte[] bArr3 = bArr;
        byte[] bArr4 = bArr2;
        if (bArr3 == null && bArr4 == null) {
            return 0;
        }
        if (bArr3 == null) {
            return -1;
        }
        if (bArr4 == null) {
            return 1;
        }
        int min = Math.min(bArr3.length, bArr4.length);
        for (int i = 0; i < min; i++) {
            byte b = bArr3[i];
            byte b2 = bArr4[i];
            if (b != b2) {
                return b - b2;
            }
        }
        return bArr3.length - bArr4.length;
    }

    @Override // java.util.Comparator
    public final boolean equals(Object obj) {
        throw new UnsupportedOperationException("what are you doing?");
    }
}
