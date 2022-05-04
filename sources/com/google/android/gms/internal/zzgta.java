package com.google.android.gms.internal;

import androidx.core.math.MathUtils;
import java.io.IOException;
import java.util.Arrays;
/* compiled from: CountersProto.java */
/* loaded from: classes.dex */
public final class zzgta extends zzgrt<zzgta> {
    public long zza = 0;
    public zzgsz[] zzb;
    public byte[] zzc;
    public String zze;
    public String zzf;

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof zzgta)) {
            return false;
        }
        zzgta zzgtaVar = (zzgta) obj;
        if (this.zza != zzgtaVar.zza || !zzgrx.zza(this.zzb, zzgtaVar.zzb) || !Arrays.equals(this.zzc, zzgtaVar.zzc)) {
            return false;
        }
        String str = this.zze;
        if (str == null) {
            if (zzgtaVar.zze != null) {
                return false;
            }
        } else if (!str.equals(zzgtaVar.zze)) {
            return false;
        }
        String str2 = this.zzf;
        if (str2 == null) {
            if (zzgtaVar.zzf != null) {
                return false;
            }
        } else if (!str2.equals(zzgtaVar.zzf)) {
            return false;
        }
        zzgrv zzgrvVar = this.zzay;
        if (zzgrvVar != null && !zzgrvVar.zzb()) {
            return this.zzay.equals(zzgtaVar.zzay);
        }
        zzgrv zzgrvVar2 = zzgtaVar.zzay;
        return zzgrvVar2 == null || zzgrvVar2.zzb();
    }

    public final int hashCode() {
        int i;
        int i2;
        long j = this.zza;
        int hashCode = (Arrays.hashCode(this.zzc) + ((zzgrx.zza(this.zzb) + (((((-1208405882) + ((int) (j ^ (j >>> 32)))) * 31) + ((int) 0)) * 31)) * 31)) * 31;
        String str = this.zze;
        int i3 = 0;
        if (str == null) {
            i = 0;
        } else {
            i = str.hashCode();
        }
        int i4 = (hashCode + i) * 31;
        String str2 = this.zzf;
        if (str2 == null) {
            i2 = 0;
        } else {
            i2 = str2.hashCode();
        }
        int i5 = (i4 + i2) * 31;
        zzgrv zzgrvVar = this.zzay;
        if (zzgrvVar != null && !zzgrvVar.zzb()) {
            i3 = this.zzay.hashCode();
        }
        return i5 + i3;
    }

    @Override // com.google.android.gms.internal.zzgrt
    public final void writeTo(zzgrr zzgrrVar) throws IOException {
        long j = this.zza;
        if (j != 0) {
            zzgrrVar.zzb(1, j);
        }
        zzgsz[] zzgszVarArr = this.zzb;
        if (zzgszVarArr != null && zzgszVarArr.length > 0) {
            int i = 0;
            while (true) {
                zzgsz[] zzgszVarArr2 = this.zzb;
                if (i >= zzgszVarArr2.length) {
                    break;
                }
                zzgsz zzgszVar = zzgszVarArr2[i];
                if (zzgszVar != null) {
                    zzgrrVar.zza(2, zzgszVar);
                }
                i++;
            }
        }
        if (!Arrays.equals(this.zzc, MathUtils.zzh)) {
            zzgrrVar.zza(3, this.zzc);
        }
        String str = this.zze;
        if (str != null && !str.equals("")) {
            zzgrrVar.zza(5, this.zze);
        }
        String str2 = this.zzf;
        if (str2 != null && !str2.equals("")) {
            zzgrrVar.zza(6, this.zzf);
        }
        super.writeTo(zzgrrVar);
    }

    public zzgta() {
        if (zzgsz.zzc == null) {
            synchronized (zzgrx.zzb) {
                if (zzgsz.zzc == null) {
                    zzgsz.zzc = new zzgsz[0];
                }
            }
        }
        this.zzb = zzgsz.zzc;
        this.zzc = MathUtils.zzh;
        this.zze = "";
        this.zzf = "";
        this.zzay = null;
        this.zzaz = -1;
    }

    @Override // com.google.android.gms.internal.zzgrt, com.google.android.gms.internal.zzgrz
    public final int computeSerializedSize() {
        int i;
        super.computeSerializedSize();
        long j = this.zza;
        int i2 = 0;
        if (j != 0) {
            i = zzgrr.zzb(j) + zzgrr.zzb(1) + 0;
        } else {
            i = 0;
        }
        zzgsz[] zzgszVarArr = this.zzb;
        if (zzgszVarArr != null && zzgszVarArr.length > 0) {
            while (true) {
                zzgsz[] zzgszVarArr2 = this.zzb;
                if (i2 >= zzgszVarArr2.length) {
                    break;
                }
                zzgsz zzgszVar = zzgszVarArr2[i2];
                if (zzgszVar != null) {
                    i += zzgrr.zzb(2, zzgszVar);
                }
                i2++;
            }
        }
        if (!Arrays.equals(this.zzc, MathUtils.zzh)) {
            i += zzgrr.zzb(3, this.zzc);
        }
        String str = this.zze;
        if (str != null && !str.equals("")) {
            i += zzgrr.zzb(5, this.zze);
        }
        String str2 = this.zzf;
        if (str2 == null || str2.equals("")) {
            return i;
        }
        return i + zzgrr.zzb(6, this.zzf);
    }
}
