package com.google.android.gms.internal;

import java.io.IOException;
import java.util.Arrays;
/* compiled from: ClientAnalytics.java */
/* loaded from: classes.dex */
public final class zzgst extends zzgrt<zzgst> implements Cloneable {
    public String[] zza;
    public String[] zzb;
    public int[] zzc;
    public long[] zzd;
    public long[] zze;

    public zzgst() {
        throw null;
    }

    @Override // com.google.android.gms.internal.zzgrt, com.google.android.gms.internal.zzgrz
    public final Object clone() throws CloneNotSupportedException {
        try {
            zzgst zzgstVar = (zzgst) super.clone();
            String[] strArr = this.zza;
            if (strArr != null && strArr.length > 0) {
                zzgstVar.zza = (String[]) strArr.clone();
            }
            String[] strArr2 = this.zzb;
            if (strArr2 != null && strArr2.length > 0) {
                zzgstVar.zzb = (String[]) strArr2.clone();
            }
            int[] iArr = this.zzc;
            if (iArr != null && iArr.length > 0) {
                zzgstVar.zzc = (int[]) iArr.clone();
            }
            long[] jArr = this.zzd;
            if (jArr != null && jArr.length > 0) {
                zzgstVar.zzd = (long[]) jArr.clone();
            }
            long[] jArr2 = this.zze;
            if (jArr2 != null && jArr2.length > 0) {
                zzgstVar.zze = (long[]) jArr2.clone();
            }
            return zzgstVar;
        } catch (CloneNotSupportedException e) {
            throw new AssertionError(e);
        }
    }

    public final boolean equals(Object obj) {
        boolean z;
        boolean z2;
        boolean z3;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof zzgst)) {
            return false;
        }
        zzgst zzgstVar = (zzgst) obj;
        if (!zzgrx.zza(this.zza, zzgstVar.zza) || !zzgrx.zza(this.zzb, zzgstVar.zzb)) {
            return false;
        }
        int[] iArr = this.zzc;
        int[] iArr2 = zzgstVar.zzc;
        if (iArr != null && iArr.length != 0) {
            z = Arrays.equals(iArr, iArr2);
        } else if (iArr2 == null || iArr2.length == 0) {
            z = true;
        } else {
            z = false;
        }
        if (!z) {
            return false;
        }
        long[] jArr = this.zzd;
        long[] jArr2 = zzgstVar.zzd;
        if (jArr != null && jArr.length != 0) {
            z2 = Arrays.equals(jArr, jArr2);
        } else if (jArr2 == null || jArr2.length == 0) {
            z2 = true;
        } else {
            z2 = false;
        }
        if (!z2) {
            return false;
        }
        long[] jArr3 = this.zze;
        long[] jArr4 = zzgstVar.zze;
        if (jArr3 != null && jArr3.length != 0) {
            z3 = Arrays.equals(jArr3, jArr4);
        } else if (jArr4 == null || jArr4.length == 0) {
            z3 = true;
        } else {
            z3 = false;
        }
        if (!z3) {
            return false;
        }
        zzgrv zzgrvVar = this.zzay;
        if (zzgrvVar != null && !zzgrvVar.zzb()) {
            return this.zzay.equals(zzgstVar.zzay);
        }
        zzgrv zzgrvVar2 = zzgstVar.zzay;
        return zzgrvVar2 == null || zzgrvVar2.zzb();
    }

    public final int hashCode() {
        int i;
        int i2;
        int i3;
        int zza = (((zzgrx.zza(this.zza) - 1208406254) * 31) + zzgrx.zza(this.zzb)) * 31;
        int[] iArr = this.zzc;
        int i4 = 0;
        if (iArr == null || iArr.length == 0) {
            i = 0;
        } else {
            i = Arrays.hashCode(iArr);
        }
        int i5 = (i + zza) * 31;
        long[] jArr = this.zzd;
        if (jArr == null || jArr.length == 0) {
            i2 = 0;
        } else {
            i2 = Arrays.hashCode(jArr);
        }
        int i6 = (i2 + i5) * 31;
        long[] jArr2 = this.zze;
        if (jArr2 == null || jArr2.length == 0) {
            i3 = 0;
        } else {
            i3 = Arrays.hashCode(jArr2);
        }
        int i7 = (i3 + i6) * 31;
        zzgrv zzgrvVar = this.zzay;
        if (zzgrvVar != null && !zzgrvVar.zzb()) {
            i4 = this.zzay.hashCode();
        }
        return i7 + i4;
    }

    @Override // com.google.android.gms.internal.zzgrt
    public final void writeTo(zzgrr zzgrrVar) throws IOException {
        String[] strArr = this.zza;
        int i = 0;
        if (strArr != null && strArr.length > 0) {
            int i2 = 0;
            while (true) {
                String[] strArr2 = this.zza;
                if (i2 >= strArr2.length) {
                    break;
                }
                String str = strArr2[i2];
                if (str != null) {
                    zzgrrVar.zza(1, str);
                }
                i2++;
            }
        }
        String[] strArr3 = this.zzb;
        if (strArr3 != null && strArr3.length > 0) {
            int i3 = 0;
            while (true) {
                String[] strArr4 = this.zzb;
                if (i3 >= strArr4.length) {
                    break;
                }
                String str2 = strArr4[i3];
                if (str2 != null) {
                    zzgrrVar.zza(2, str2);
                }
                i3++;
            }
        }
        int[] iArr = this.zzc;
        if (iArr != null && iArr.length > 0) {
            int i4 = 0;
            while (true) {
                int[] iArr2 = this.zzc;
                if (i4 >= iArr2.length) {
                    break;
                }
                int i5 = iArr2[i4];
                zzgrrVar.zzc(3, 0);
                if (i5 >= 0) {
                    zzgrrVar.zzc(i5);
                } else {
                    zzgrrVar.zza(i5);
                }
                i4++;
            }
        }
        long[] jArr = this.zzd;
        if (jArr != null && jArr.length > 0) {
            int i6 = 0;
            while (true) {
                long[] jArr2 = this.zzd;
                if (i6 >= jArr2.length) {
                    break;
                }
                zzgrrVar.zzb(4, jArr2[i6]);
                i6++;
            }
        }
        long[] jArr3 = this.zze;
        if (jArr3 != null && jArr3.length > 0) {
            while (true) {
                long[] jArr4 = this.zze;
                if (i >= jArr4.length) {
                    break;
                }
                zzgrrVar.zzb(5, jArr4[i]);
                i++;
            }
        }
        super.writeTo(zzgrrVar);
    }

    @Override // com.google.android.gms.internal.zzgrt, com.google.android.gms.internal.zzgrz
    public final int computeSerializedSize() {
        int i;
        long[] jArr;
        int[] iArr;
        int i2;
        super.computeSerializedSize();
        String[] strArr = this.zza;
        int i3 = 0;
        if (strArr == null || strArr.length <= 0) {
            i = 0;
        } else {
            int i4 = 0;
            int i5 = 0;
            int i6 = 0;
            while (true) {
                String[] strArr2 = this.zza;
                if (i4 >= strArr2.length) {
                    break;
                }
                String str = strArr2[i4];
                if (str != null) {
                    i6++;
                    int zza = zzgrr.zza(str);
                    i5 += zzgrr.zzd(zza) + zza;
                }
                i4++;
            }
            i = (i6 * 1) + i5 + 0;
        }
        String[] strArr3 = this.zzb;
        if (strArr3 != null && strArr3.length > 0) {
            int i7 = 0;
            int i8 = 0;
            int i9 = 0;
            while (true) {
                String[] strArr4 = this.zzb;
                if (i7 >= strArr4.length) {
                    break;
                }
                String str2 = strArr4[i7];
                if (str2 != null) {
                    i9++;
                    int zza2 = zzgrr.zza(str2);
                    i8 += zzgrr.zzd(zza2) + zza2;
                }
                i7++;
            }
            i = i + i8 + (i9 * 1);
        }
        int[] iArr2 = this.zzc;
        if (iArr2 != null && iArr2.length > 0) {
            int i10 = 0;
            int i11 = 0;
            while (true) {
                iArr = this.zzc;
                if (i10 >= iArr.length) {
                    break;
                }
                int i12 = iArr[i10];
                if (i12 >= 0) {
                    i2 = zzgrr.zzd(i12);
                } else {
                    i2 = 10;
                }
                i11 += i2;
                i10++;
            }
            i = i + i11 + (iArr.length * 1);
        }
        long[] jArr2 = this.zzd;
        if (jArr2 != null && jArr2.length > 0) {
            int i13 = 0;
            int i14 = 0;
            while (true) {
                jArr = this.zzd;
                if (i13 >= jArr.length) {
                    break;
                }
                i14 += zzgrr.zzb(jArr[i13]);
                i13++;
            }
            i = i + i14 + (jArr.length * 1);
        }
        long[] jArr3 = this.zze;
        if (jArr3 == null || jArr3.length <= 0) {
            return i;
        }
        int i15 = 0;
        while (true) {
            long[] jArr4 = this.zze;
            if (i3 >= jArr4.length) {
                return i + i15 + (jArr4.length * 1);
            }
            i15 += zzgrr.zzb(jArr4[i3]);
            i3++;
        }
    }
}
