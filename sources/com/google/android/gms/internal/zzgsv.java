package com.google.android.gms.internal;

import com.android.systemui.shared.R;
import java.io.IOException;
import java.util.Arrays;
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

    public zzgsv() {
        if (zzgsw.zza == null) {
            synchronized (zzgrx.zzb) {
                if (zzgsw.zza == null) {
                    zzgsw.zza = new zzgsw[0];
                }
            }
        }
        this.zzk = zzgsw.zza;
        byte[] bArr = zzgsc.zzh;
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
        this.zzu = zzgsc.zza;
        this.zzw = null;
        this.zzay = null;
        this.zzaz = -1;
    }

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
                    if (zzgswVarArr2[i] != null) {
                        zzgsvVar.zzk[i] = (zzgsw) zzgswVarArr2[i].clone();
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

    @Override // com.google.android.gms.internal.zzgrt, com.google.android.gms.internal.zzgrz
    public final int computeSerializedSize() {
        int[] iArr;
        super.computeSerializedSize();
        long j = this.zza;
        int i = 0;
        int zzf = j != 0 ? zzgrr.zzf(1, j) + 0 : 0;
        zzgsw[] zzgswVarArr = this.zzk;
        if (zzgswVarArr != null && zzgswVarArr.length > 0) {
            int i2 = 0;
            while (true) {
                zzgsw[] zzgswVarArr2 = this.zzk;
                if (i2 >= zzgswVarArr2.length) {
                    break;
                }
                zzgsw zzgswVar = zzgswVarArr2[i2];
                if (zzgswVar != null) {
                    zzf += zzgrr.zzb(3, zzgswVar);
                }
                i2++;
            }
        }
        byte[] bArr = this.zzl;
        byte[] bArr2 = zzgsc.zzh;
        if (!Arrays.equals(bArr, bArr2)) {
            zzf += zzgrr.zzb(4, this.zzl);
        }
        if (!Arrays.equals(this.zzf, bArr2)) {
            zzf += zzgrr.zzb(6, this.zzf);
        }
        zzgst zzgstVar = this.zzp;
        if (zzgstVar != null) {
            zzf += zzgrr.zzb(7, zzgstVar);
        }
        String str = this.zzn;
        if (str != null && !str.equals("")) {
            zzf += zzgrr.zzb(8, this.zzn);
        }
        String str2 = this.zzo;
        if (str2 != null && !str2.equals("")) {
            zzf += zzgrr.zzb(13, this.zzo);
        }
        String str3 = this.zzq;
        if (str3 != null && !str3.equals("")) {
            zzf += zzgrr.zzb(14, this.zzq);
        }
        long j2 = this.zzg;
        if (j2 != 180000) {
            zzf += zzgrr.zzb((j2 >> 63) ^ (j2 << 1)) + zzgrr.zzb(15);
        }
        zzgsu zzgsuVar = this.zzr;
        if (zzgsuVar != null) {
            zzf += zzgrr.zzb(16, zzgsuVar);
        }
        long j3 = this.zzb;
        if (j3 != 0) {
            zzf += zzgrr.zzf(17, j3);
        }
        if (!Arrays.equals(this.zzh, bArr2)) {
            zzf += zzgrr.zzb(18, this.zzh);
        }
        int[] iArr2 = this.zzu;
        if (iArr2 != null && iArr2.length > 0) {
            int i3 = 0;
            while (true) {
                iArr = this.zzu;
                if (i >= iArr.length) {
                    break;
                }
                i3 += zzgrr.zza(iArr[i]);
                i++;
            }
            zzf = zzf + i3 + (iArr.length * 2);
        }
        zzgsx zzgsxVar = this.zzw;
        if (zzgsxVar != null) {
            zzf += zzgrr.zzb(23, zzgsxVar);
        }
        String str4 = this.zzs;
        return (str4 == null || str4.equals("")) ? zzf : zzf + zzgrr.zzb(24, this.zzs);
    }

    public final boolean equals(Object obj) {
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
        if (!zzgrx.zza(this.zzu, zzgsvVar.zzu)) {
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
        long j = this.zza;
        long j2 = this.zzb;
        int i = (int) 0;
        int i2 = 0;
        int hashCode = (Arrays.hashCode(this.zzf) + ((((Arrays.hashCode(this.zzl) + ((((((((((((((((((int) (j ^ (j >>> 32))) - 1208406192) * 31) + ((int) (j2 ^ (j2 >>> 32)))) * 31) + i) * 31) + 0) * 31) + 0) * 31) + 0) * 31) + 1237) * 31) + zzgrx.zza(this.zzk)) * 31)) * 31) + 0) * 31)) * 31;
        String str = this.zzn;
        int hashCode2 = (hashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.zzo;
        int hashCode3 = hashCode2 + (str2 == null ? 0 : str2.hashCode());
        zzgst zzgstVar = this.zzp;
        int hashCode4 = ((hashCode3 * 31) + (zzgstVar == null ? 0 : zzgstVar.hashCode())) * 31;
        String str3 = this.zzq;
        int hashCode5 = str3 == null ? 0 : str3.hashCode();
        long j3 = this.zzg;
        zzgsu zzgsuVar = this.zzr;
        int hashCode6 = (Arrays.hashCode(this.zzh) + ((((((hashCode4 + hashCode5) * 31) + ((int) (j3 ^ (j3 >>> 32)))) * 31) + (zzgsuVar == null ? 0 : zzgsuVar.hashCode())) * 31)) * 31;
        String str4 = this.zzs;
        int hashCode7 = (((hashCode6 + (str4 == null ? 0 : str4.hashCode())) * 31) + 0) * 31;
        int[] iArr = this.zzu;
        int hashCode8 = (iArr == null || iArr.length == 0) ? 0 : Arrays.hashCode(iArr);
        zzgsx zzgsxVar = this.zzw;
        int hashCode9 = (((((((hashCode7 + hashCode8) * 31) + i) * 31) + (zzgsxVar == null ? 0 : zzgsxVar.hashCode())) * 31) + 1237) * 31;
        zzgrv zzgrvVar = this.zzay;
        if (zzgrvVar != null && !zzgrvVar.zzb()) {
            i2 = this.zzay.hashCode();
        }
        return hashCode9 + i2;
    }

    @Override // com.google.android.gms.internal.zzgrt, com.google.android.gms.internal.zzgrz
    public final void writeTo(zzgrr zzgrrVar) throws IOException {
        long j = this.zza;
        if (j != 0) {
            zzgrrVar.zzb(1, j);
        }
        zzgsw[] zzgswVarArr = this.zzk;
        int i = 0;
        if (zzgswVarArr != null && zzgswVarArr.length > 0) {
            int i2 = 0;
            while (true) {
                zzgsw[] zzgswVarArr2 = this.zzk;
                if (i2 >= zzgswVarArr2.length) {
                    break;
                }
                zzgsw zzgswVar = zzgswVarArr2[i2];
                if (zzgswVar != null) {
                    zzgrrVar.zza(3, zzgswVar);
                }
                i2++;
            }
        }
        byte[] bArr = this.zzl;
        byte[] bArr2 = zzgsc.zzh;
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
            zzgrrVar.zzc(R.styleable.AppCompatTheme_windowFixedHeightMajor);
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
            while (true) {
                int[] iArr2 = this.zzu;
                if (i >= iArr2.length) {
                    break;
                }
                zzgrrVar.zza(20, iArr2[i]);
                i++;
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
}
