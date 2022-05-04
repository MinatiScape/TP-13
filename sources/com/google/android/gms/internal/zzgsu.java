package com.google.android.gms.internal;

import java.io.IOException;
import java.util.Arrays;
import java.util.Objects;
/* loaded from: classes.dex */
public final class zzgsu extends zzgrt<zzgsu> implements Cloneable {
    public byte[][] zzc = zzgsc.zzg;

    public zzgsu() {
        this.zzay = null;
        this.zzaz = -1;
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

    @Override // com.google.android.gms.internal.zzgrt, com.google.android.gms.internal.zzgrz
    public final int computeSerializedSize() {
        super.computeSerializedSize();
        byte[] bArr = zzgsc.zzh;
        int i = 0;
        int zzb = !Arrays.equals(bArr, bArr) ? zzgrr.zzb(1, bArr) + 0 : 0;
        byte[][] bArr2 = this.zzc;
        if (bArr2 == null || bArr2.length <= 0) {
            return zzb;
        }
        int i2 = 0;
        int i3 = 0;
        while (true) {
            byte[][] bArr3 = this.zzc;
            if (i >= bArr3.length) {
                return zzb + i2 + (i3 * 1);
            }
            byte[] bArr4 = bArr3[i];
            if (bArr4 != null) {
                i3++;
                i2 += zzgrr.zzd(bArr4.length) + bArr4.length;
            }
            i++;
        }
    }

    public final boolean equals(Object obj) {
        boolean z;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof zzgsu)) {
            return false;
        }
        zzgsu zzgsuVar = (zzgsu) obj;
        byte[] bArr = zzgsc.zzh;
        Objects.requireNonNull(zzgsuVar);
        if (!Arrays.equals(bArr, bArr)) {
            return false;
        }
        byte[][] bArr2 = this.zzc;
        byte[][] bArr3 = zzgsuVar.zzc;
        Object obj2 = zzgrx.zzb;
        int length = bArr2 == null ? 0 : bArr2.length;
        int length2 = bArr3 == null ? 0 : bArr3.length;
        int i = 0;
        int i2 = 0;
        while (true) {
            if (i >= length || bArr2[i] != null) {
                while (i2 < length2 && bArr3[i2] == null) {
                    i2++;
                }
                boolean z2 = i >= length;
                boolean z3 = i2 >= length2;
                if (z2 && z3) {
                    z = true;
                    break;
                } else if (z2 == z3 && Arrays.equals(bArr2[i], bArr3[i2])) {
                    i++;
                    i2++;
                }
            } else {
                i++;
            }
        }
        z = false;
        if (!z) {
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
        int i = 0;
        int hashCode = (((Arrays.hashCode(zzgsc.zzh) - 1208406223) * 31) + 0) * 31;
        byte[][] bArr = this.zzc;
        Object obj = zzgrx.zzb;
        int length = bArr == null ? 0 : bArr.length;
        int i2 = 0;
        for (int i3 = 0; i3 < length; i3++) {
            byte[] bArr2 = bArr[i3];
            if (bArr2 != null) {
                i2 = (i2 * 31) + Arrays.hashCode(bArr2);
            }
        }
        int i4 = (((hashCode + i2) * 31) + 1237) * 31;
        zzgrv zzgrvVar = this.zzay;
        if (zzgrvVar != null && !zzgrvVar.zzb()) {
            i = this.zzay.hashCode();
        }
        return i4 + i;
    }

    @Override // com.google.android.gms.internal.zzgrt, com.google.android.gms.internal.zzgrz
    public final void writeTo(zzgrr zzgrrVar) throws IOException {
        byte[] bArr = zzgsc.zzh;
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
}
