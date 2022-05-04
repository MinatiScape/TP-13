package com.google.android.gms.internal;

import androidx.core.math.MathUtils;
import java.io.IOException;
import java.util.Arrays;
/* compiled from: ClientAnalytics.java */
/* loaded from: classes.dex */
public final class zzgsu extends zzgrt<zzgsu> implements Cloneable {
    public byte[][] zzc;

    public zzgsu() {
        throw null;
    }

    @Override // com.google.android.gms.internal.zzgrt, com.google.android.gms.internal.zzgrz
    public final Object clone() throws CloneNotSupportedException {
        try {
            zzgsu zzgsuVar = (zzgsu) super.clone();
            byte[][] bArr = this.zzc;
            if (bArr != null && bArr.length > 0) {
                zzgsuVar.zzc = (byte[][]) bArr.clone();
            }
            return zzgsuVar;
        } catch (CloneNotSupportedException e) {
            throw new AssertionError(e);
        }
    }

    public final boolean equals(Object obj) {
        int i;
        int i2;
        boolean z;
        boolean z2;
        boolean z3;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof zzgsu)) {
            return false;
        }
        zzgsu zzgsuVar = (zzgsu) obj;
        byte[] bArr = MathUtils.zzh;
        zzgsuVar.getClass();
        if (!Arrays.equals(bArr, bArr)) {
            return false;
        }
        byte[][] bArr2 = this.zzc;
        byte[][] bArr3 = zzgsuVar.zzc;
        Object obj2 = zzgrx.zzb;
        if (bArr2 == null) {
            i = 0;
        } else {
            i = bArr2.length;
        }
        if (bArr3 == null) {
            i2 = 0;
        } else {
            i2 = bArr3.length;
        }
        int i3 = 0;
        int i4 = 0;
        while (true) {
            if (i3 >= i || bArr2[i3] != null) {
                while (i4 < i2 && bArr3[i4] == null) {
                    i4++;
                }
                if (i3 >= i) {
                    z = true;
                } else {
                    z = false;
                }
                if (i4 >= i2) {
                    z2 = true;
                } else {
                    z2 = false;
                }
                if (z && z2) {
                    z3 = true;
                    break;
                } else if (z == z2 && Arrays.equals(bArr2[i3], bArr3[i4])) {
                    i3++;
                    i4++;
                }
            } else {
                i3++;
            }
        }
        z3 = false;
        if (!z3) {
            return false;
        }
        zzgrv zzgrvVar = this.zzay;
        if (zzgrvVar != null && !zzgrvVar.zzb()) {
            return this.zzay.equals(zzgsuVar.zzay);
        }
        zzgrv zzgrvVar2 = zzgsuVar.zzay;
        return zzgrvVar2 == null || zzgrvVar2.zzb();
    }

    public final int hashCode() {
        int i;
        int i2 = 0;
        int hashCode = (((Arrays.hashCode(MathUtils.zzh) - 1208406223) * 31) + 0) * 31;
        byte[][] bArr = this.zzc;
        Object obj = zzgrx.zzb;
        if (bArr == null) {
            i = 0;
        } else {
            i = bArr.length;
        }
        int i3 = 0;
        for (int i4 = 0; i4 < i; i4++) {
            byte[] bArr2 = bArr[i4];
            if (bArr2 != null) {
                i3 = (i3 * 31) + Arrays.hashCode(bArr2);
            }
        }
        int i5 = (((hashCode + i3) * 31) + 1237) * 31;
        zzgrv zzgrvVar = this.zzay;
        if (zzgrvVar != null && !zzgrvVar.zzb()) {
            i2 = this.zzay.hashCode();
        }
        return i5 + i2;
    }

    @Override // com.google.android.gms.internal.zzgrt
    public final void writeTo(zzgrr zzgrrVar) throws IOException {
        byte[] bArr = MathUtils.zzh;
        if (!Arrays.equals(bArr, bArr)) {
            zzgrrVar.zza(1, bArr);
        }
        byte[][] bArr2 = this.zzc;
        if (bArr2 != null && bArr2.length > 0) {
            int i = 0;
            while (true) {
                byte[][] bArr3 = this.zzc;
                if (i >= bArr3.length) {
                    break;
                }
                byte[] bArr4 = bArr3[i];
                if (bArr4 != null) {
                    zzgrrVar.zza(2, bArr4);
                }
                i++;
            }
        }
        super.writeTo(zzgrrVar);
    }

    @Override // com.google.android.gms.internal.zzgrt, com.google.android.gms.internal.zzgrz
    public final int computeSerializedSize() {
        int i;
        super.computeSerializedSize();
        byte[] bArr = MathUtils.zzh;
        int i2 = 0;
        if (!Arrays.equals(bArr, bArr)) {
            i = zzgrr.zzb(1, bArr) + 0;
        } else {
            i = 0;
        }
        byte[][] bArr2 = this.zzc;
        if (bArr2 == null || bArr2.length <= 0) {
            return i;
        }
        int i3 = 0;
        int i4 = 0;
        while (true) {
            byte[][] bArr3 = this.zzc;
            if (i2 >= bArr3.length) {
                return i + i3 + (i4 * 1);
            }
            byte[] bArr4 = bArr3[i2];
            if (bArr4 != null) {
                i4++;
                i3 = zzgrr.zzd(bArr4.length) + bArr4.length + i3;
            }
            i2++;
        }
    }
}
