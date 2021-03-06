package com.google.android.gms.internal;

import java.util.ArrayList;
/* compiled from: FieldArray.java */
/* loaded from: classes.dex */
public final class zzgrv implements Cloneable {
    public int[] zzc;
    public zzgrw[] zzd;
    public int zze;

    public zzgrv() {
        throw null;
    }

    public final boolean equals(Object obj) {
        boolean z;
        boolean z2;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof zzgrv)) {
            return false;
        }
        zzgrv zzgrvVar = (zzgrv) obj;
        int i = this.zze;
        if (i != zzgrvVar.zze) {
            return false;
        }
        int[] iArr = this.zzc;
        int[] iArr2 = zzgrvVar.zzc;
        int i2 = 0;
        while (true) {
            if (i2 >= i) {
                z = true;
                break;
            } else if (iArr[i2] != iArr2[i2]) {
                z = false;
                break;
            } else {
                i2++;
            }
        }
        if (z) {
            zzgrw[] zzgrwVarArr = this.zzd;
            zzgrw[] zzgrwVarArr2 = zzgrvVar.zzd;
            int i3 = this.zze;
            int i4 = 0;
            while (true) {
                if (i4 >= i3) {
                    z2 = true;
                    break;
                } else if (!zzgrwVarArr[i4].equals(zzgrwVarArr2[i4])) {
                    z2 = false;
                    break;
                } else {
                    i4++;
                }
            }
            if (z2) {
                return true;
            }
        }
        return false;
    }

    static {
        new ArrayList();
    }

    public final Object clone() throws CloneNotSupportedException {
        int i = this.zze;
        zzgrv zzgrvVar = new zzgrv(i);
        System.arraycopy(this.zzc, 0, zzgrvVar.zzc, 0, i);
        for (int i2 = 0; i2 < i; i2++) {
            zzgrw zzgrwVar = this.zzd[i2];
            if (zzgrwVar != null) {
                zzgrvVar.zzd[i2] = zzgrwVar.zzc();
            }
        }
        zzgrvVar.zze = i;
        return zzgrvVar;
    }

    public final int hashCode() {
        int i = 17;
        for (int i2 = 0; i2 < this.zze; i2++) {
            i = (((i * 31) + this.zzc[i2]) * 31) + this.zzd[i2].hashCode();
        }
        return i;
    }

    public final boolean zzb() {
        if (this.zze == 0) {
            return true;
        }
        return false;
    }

    public zzgrv(int i) {
        int i2 = i << 2;
        int i3 = 4;
        while (true) {
            if (i3 >= 32) {
                break;
            }
            int i4 = (1 << i3) - 12;
            if (i2 <= i4) {
                i2 = i4;
                break;
            }
            i3++;
        }
        int i5 = i2 / 4;
        this.zzc = new int[i5];
        this.zzd = new zzgrw[i5];
        this.zze = 0;
    }
}
