package com.google.android.gms.internal;

import androidx.core.math.MathUtils;
import java.io.IOException;
import java.util.Arrays;
/* compiled from: ClientAnalytics.java */
/* loaded from: classes.dex */
public final class zzgsv extends zzgrt<zzgsv> implements Cloneable {
    public long zza = 0;
    public long zzb = 0;
    public byte[] zzf;
    public long zzg;
    public byte[] zzh;
    public zzgsw[] zzk;
    public byte[] zzl;
    public String zzn;
    public String zzo;
    public zzgst zzp;
    public String zzq;
    public zzgsu zzr;
    public String zzs;
    public int[] zzu;
    public zzgsx zzw;

    @Override // com.google.android.gms.internal.zzgrt, com.google.android.gms.internal.zzgrz
    public final Object clone() throws CloneNotSupportedException {
        try {
            zzgsv zzgsvVar = (zzgsv) super.clone();
            zzgsw[] zzgswVarArr = this.zzk;
            if (zzgswVarArr != null && zzgswVarArr.length > 0) {
                zzgsvVar.zzk = new zzgsw[zzgswVarArr.length];
                int i = 0;
                while (true) {
                    zzgsw[] zzgswVarArr2 = this.zzk;
                    if (i >= zzgswVarArr2.length) {
                        break;
                    }
                    zzgsw zzgswVar = zzgswVarArr2[i];
                    if (zzgswVar != null) {
                        zzgsvVar.zzk[i] = (zzgsw) zzgswVar.clone();
                    }
                    i++;
                }
            }
            zzgst zzgstVar = this.zzp;
            if (zzgstVar != null) {
                zzgsvVar.zzp = (zzgst) zzgstVar.clone();
            }
            zzgsu zzgsuVar = this.zzr;
            if (zzgsuVar != null) {
                zzgsvVar.zzr = (zzgsu) zzgsuVar.clone();
            }
            int[] iArr = this.zzu;
            if (iArr != null && iArr.length > 0) {
                zzgsvVar.zzu = (int[]) iArr.clone();
            }
            zzgsx zzgsxVar = this.zzw;
            if (zzgsxVar != null) {
                zzgsvVar.zzw = (zzgsx) zzgsxVar.clone();
            }
            return zzgsvVar;
        } catch (CloneNotSupportedException e) {
            throw new AssertionError(e);
        }
    }

    public final boolean equals(Object obj) {
        boolean z;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof zzgsv)) {
            return false;
        }
        zzgsv zzgsvVar = (zzgsv) obj;
        if (this.zza != zzgsvVar.zza || this.zzb != zzgsvVar.zzb || !zzgrx.zza(this.zzk, zzgsvVar.zzk) || !Arrays.equals(this.zzl, zzgsvVar.zzl) || !Arrays.equals(this.zzf, zzgsvVar.zzf)) {
            return false;
        }
        String str = this.zzn;
        if (str == null) {
            if (zzgsvVar.zzn != null) {
                return false;
            }
        } else if (!str.equals(zzgsvVar.zzn)) {
            return false;
        }
        String str2 = this.zzo;
        if (str2 == null) {
            if (zzgsvVar.zzo != null) {
                return false;
            }
        } else if (!str2.equals(zzgsvVar.zzo)) {
            return false;
        }
        zzgst zzgstVar = this.zzp;
        if (zzgstVar == null) {
            if (zzgsvVar.zzp != null) {
                return false;
            }
        } else if (!zzgstVar.equals(zzgsvVar.zzp)) {
            return false;
        }
        String str3 = this.zzq;
        if (str3 == null) {
            if (zzgsvVar.zzq != null) {
                return false;
            }
        } else if (!str3.equals(zzgsvVar.zzq)) {
            return false;
        }
        if (this.zzg != zzgsvVar.zzg) {
            return false;
        }
        zzgsu zzgsuVar = this.zzr;
        if (zzgsuVar == null) {
            if (zzgsvVar.zzr != null) {
                return false;
            }
        } else if (!zzgsuVar.equals(zzgsvVar.zzr)) {
            return false;
        }
        if (!Arrays.equals(this.zzh, zzgsvVar.zzh)) {
            return false;
        }
        String str4 = this.zzs;
        if (str4 == null) {
            if (zzgsvVar.zzs != null) {
                return false;
            }
        } else if (!str4.equals(zzgsvVar.zzs)) {
            return false;
        }
        int[] iArr = this.zzu;
        int[] iArr2 = zzgsvVar.zzu;
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
        zzgsx zzgsxVar = this.zzw;
        if (zzgsxVar == null) {
            if (zzgsvVar.zzw != null) {
                return false;
            }
        } else if (!zzgsxVar.equals(zzgsvVar.zzw)) {
            return false;
        }
        zzgrv zzgrvVar = this.zzay;
        if (zzgrvVar != null && !zzgrvVar.zzb()) {
            return this.zzay.equals(zzgsvVar.zzay);
        }
        zzgrv zzgrvVar2 = zzgsvVar.zzay;
        return zzgrvVar2 == null || zzgrvVar2.zzb();
    }

    public final int hashCode() {
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        long j = this.zza;
        long j2 = this.zzb;
        int i9 = (int) 0;
        int i10 = 0;
        int hashCode = (Arrays.hashCode(this.zzf) + ((((Arrays.hashCode(this.zzl) + ((((((((((((((((((int) (j ^ (j >>> 32))) - 1208406192) * 31) + ((int) (j2 ^ (j2 >>> 32)))) * 31) + i9) * 31) + 0) * 31) + 0) * 31) + 0) * 31) + 1237) * 31) + zzgrx.zza(this.zzk)) * 31)) * 31) + 0) * 31)) * 31;
        String str = this.zzn;
        if (str == null) {
            i = 0;
        } else {
            i = str.hashCode();
        }
        int i11 = (hashCode + i) * 31;
        String str2 = this.zzo;
        if (str2 == null) {
            i2 = 0;
        } else {
            i2 = str2.hashCode();
        }
        int i12 = i11 + i2;
        zzgst zzgstVar = this.zzp;
        int i13 = i12 * 31;
        if (zzgstVar == null) {
            i3 = 0;
        } else {
            i3 = zzgstVar.hashCode();
        }
        int i14 = (i13 + i3) * 31;
        String str3 = this.zzq;
        if (str3 == null) {
            i4 = 0;
        } else {
            i4 = str3.hashCode();
        }
        long j3 = this.zzg;
        zzgsu zzgsuVar = this.zzr;
        int i15 = (((i14 + i4) * 31) + ((int) (j3 ^ (j3 >>> 32)))) * 31;
        if (zzgsuVar == null) {
            i5 = 0;
        } else {
            i5 = zzgsuVar.hashCode();
        }
        int hashCode2 = (Arrays.hashCode(this.zzh) + ((i15 + i5) * 31)) * 31;
        String str4 = this.zzs;
        if (str4 == null) {
            i6 = 0;
        } else {
            i6 = str4.hashCode();
        }
        int i16 = (((hashCode2 + i6) * 31) + 0) * 31;
        int[] iArr = this.zzu;
        if (iArr == null || iArr.length == 0) {
            i7 = 0;
        } else {
            i7 = Arrays.hashCode(iArr);
        }
        int i17 = ((i7 + i16) * 31) + i9;
        zzgsx zzgsxVar = this.zzw;
        int i18 = i17 * 31;
        if (zzgsxVar == null) {
            i8 = 0;
        } else {
            i8 = zzgsxVar.hashCode();
        }
        int i19 = (((i18 + i8) * 31) + 1237) * 31;
        zzgrv zzgrvVar = this.zzay;
        if (zzgrvVar != null && !zzgrvVar.zzb()) {
            i10 = this.zzay.hashCode();
        }
        return i19 + i10;
    }

    @Override // com.google.android.gms.internal.zzgrt
    public final void writeTo(zzgrr zzgrrVar) throws IOException {
        long j = this.zza;
        if (j != 0) {
            zzgrrVar.zzb(1, j);
        }
        zzgsw[] zzgswVarArr = this.zzk;
        if (zzgswVarArr != null && zzgswVarArr.length > 0) {
            int i = 0;
            while (true) {
                zzgsw[] zzgswVarArr2 = this.zzk;
                if (i >= zzgswVarArr2.length) {
                    break;
                }
                zzgsw zzgswVar = zzgswVarArr2[i];
                if (zzgswVar != null) {
                    zzgrrVar.zza(3, zzgswVar);
                }
                i++;
            }
        }
        byte[] bArr = this.zzl;
        byte[] bArr2 = MathUtils.zzh;
        if (!Arrays.equals(bArr, bArr2)) {
            zzgrrVar.zza(4, this.zzl);
        }
        if (!Arrays.equals(this.zzf, bArr2)) {
            zzgrrVar.zza(6, this.zzf);
        }
        zzgst zzgstVar = this.zzp;
        if (zzgstVar != null) {
            zzgrrVar.zza(7, zzgstVar);
        }
        String str = this.zzn;
        if (str != null && !str.equals("")) {
            zzgrrVar.zza(8, this.zzn);
        }
        String str2 = this.zzo;
        if (str2 != null && !str2.equals("")) {
            zzgrrVar.zza(13, this.zzo);
        }
        String str3 = this.zzq;
        if (str3 != null && !str3.equals("")) {
            zzgrrVar.zza(14, this.zzq);
        }
        long j2 = this.zzg;
        if (j2 != 180000) {
            zzgrrVar.zzc(15, 0);
            zzgrrVar.zza((j2 >> 63) ^ (j2 << 1));
        }
        zzgsu zzgsuVar = this.zzr;
        if (zzgsuVar != null) {
            zzgrrVar.zza(16, zzgsuVar);
        }
        long j3 = this.zzb;
        if (j3 != 0) {
            zzgrrVar.zzb(17, j3);
        }
        if (!Arrays.equals(this.zzh, bArr2)) {
            zzgrrVar.zza(18, this.zzh);
        }
        int[] iArr = this.zzu;
        if (iArr != null && iArr.length > 0) {
            int i2 = 0;
            while (true) {
                int[] iArr2 = this.zzu;
                if (i2 >= iArr2.length) {
                    break;
                }
                int i3 = iArr2[i2];
                zzgrrVar.zzc(20, 0);
                if (i3 >= 0) {
                    zzgrrVar.zzc(i3);
                } else {
                    zzgrrVar.zza(i3);
                }
                i2++;
            }
        }
        zzgsx zzgsxVar = this.zzw;
        if (zzgsxVar != null) {
            zzgrrVar.zza(23, zzgsxVar);
        }
        String str4 = this.zzs;
        if (str4 != null && !str4.equals("")) {
            zzgrrVar.zza(24, this.zzs);
        }
        super.writeTo(zzgrrVar);
    }

    public zzgsv() {
        if (zzgsw.zza == null) {
            synchronized (zzgrx.zzb) {
                if (zzgsw.zza == null) {
                    zzgsw.zza = new zzgsw[0];
                }
            }
        }
        this.zzk = zzgsw.zza;
        byte[] bArr = MathUtils.zzh;
        this.zzl = bArr;
        this.zzf = bArr;
        this.zzn = "";
        this.zzo = "";
        this.zzp = null;
        this.zzq = "";
        this.zzg = 180000L;
        this.zzr = null;
        this.zzh = bArr;
        this.zzs = "";
        this.zzu = MathUtils.zza;
        this.zzw = null;
        this.zzay = null;
        this.zzaz = -1;
    }

    @Override // com.google.android.gms.internal.zzgrt, com.google.android.gms.internal.zzgrz
    public final int computeSerializedSize() {
        int i;
        int[] iArr;
        int i2;
        super.computeSerializedSize();
        long j = this.zza;
        int i3 = 0;
        if (j != 0) {
            i = zzgrr.zzb(j) + zzgrr.zzb(1) + 0;
        } else {
            i = 0;
        }
        zzgsw[] zzgswVarArr = this.zzk;
        if (zzgswVarArr != null && zzgswVarArr.length > 0) {
            int i4 = 0;
            while (true) {
                zzgsw[] zzgswVarArr2 = this.zzk;
                if (i4 >= zzgswVarArr2.length) {
                    break;
                }
                zzgsw zzgswVar = zzgswVarArr2[i4];
                if (zzgswVar != null) {
                    i += zzgrr.zzb(3, zzgswVar);
                }
                i4++;
            }
        }
        byte[] bArr = this.zzl;
        byte[] bArr2 = MathUtils.zzh;
        if (!Arrays.equals(bArr, bArr2)) {
            i += zzgrr.zzb(4, this.zzl);
        }
        if (!Arrays.equals(this.zzf, bArr2)) {
            i += zzgrr.zzb(6, this.zzf);
        }
        zzgst zzgstVar = this.zzp;
        if (zzgstVar != null) {
            i += zzgrr.zzb(7, zzgstVar);
        }
        String str = this.zzn;
        if (str != null && !str.equals("")) {
            i += zzgrr.zzb(8, this.zzn);
        }
        String str2 = this.zzo;
        if (str2 != null && !str2.equals("")) {
            i += zzgrr.zzb(13, this.zzo);
        }
        String str3 = this.zzq;
        if (str3 != null && !str3.equals("")) {
            i += zzgrr.zzb(14, this.zzq);
        }
        long j2 = this.zzg;
        if (j2 != 180000) {
            i += zzgrr.zzb((j2 >> 63) ^ (j2 << 1)) + zzgrr.zzb(15);
        }
        zzgsu zzgsuVar = this.zzr;
        if (zzgsuVar != null) {
            i += zzgrr.zzb(16, zzgsuVar);
        }
        long j3 = this.zzb;
        if (j3 != 0) {
            i += zzgrr.zzb(j3) + zzgrr.zzb(17);
        }
        if (!Arrays.equals(this.zzh, bArr2)) {
            i += zzgrr.zzb(18, this.zzh);
        }
        int[] iArr2 = this.zzu;
        if (iArr2 != null && iArr2.length > 0) {
            int i5 = 0;
            while (true) {
                iArr = this.zzu;
                if (i3 >= iArr.length) {
                    break;
                }
                int i6 = iArr[i3];
                if (i6 >= 0) {
                    i2 = zzgrr.zzd(i6);
                } else {
                    i2 = 10;
                }
                i5 += i2;
                i3++;
            }
            i = i + i5 + (iArr.length * 2);
        }
        zzgsx zzgsxVar = this.zzw;
        if (zzgsxVar != null) {
            i += zzgrr.zzb(23, zzgsxVar);
        }
        String str4 = this.zzs;
        if (str4 == null || str4.equals("")) {
            return i;
        }
        return i + zzgrr.zzb(24, this.zzs);
    }
}
