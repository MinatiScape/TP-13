package com.google.android.gms.internal;

import java.io.IOException;
/* compiled from: CountersProto.java */
/* loaded from: classes.dex */
public final class zzgsz extends zzgrt<zzgsz> {
    public static volatile zzgsz[] zzc;
    public long zza = 0;
    public zzgsy[] zzb;

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof zzgsz)) {
            return false;
        }
        zzgsz zzgszVar = (zzgsz) obj;
        if (this.zza != zzgszVar.zza || !zzgrx.zza(this.zzb, zzgszVar.zzb)) {
            return false;
        }
        zzgrv zzgrvVar = this.zzay;
        if (zzgrvVar != null && !zzgrvVar.zzb()) {
            return this.zzay.equals(zzgszVar.zzay);
        }
        zzgrv zzgrvVar2 = zzgszVar.zzay;
        return zzgrvVar2 == null || zzgrvVar2.zzb();
    }

    public final int hashCode() {
        long j = this.zza;
        int i = 0;
        int zza = (zzgrx.zza(this.zzb) + (((((-1208406068) + ((int) (j ^ (j >>> 32)))) * 31) + 0) * 31)) * 31;
        zzgrv zzgrvVar = this.zzay;
        if (zzgrvVar != null && !zzgrvVar.zzb()) {
            i = this.zzay.hashCode();
        }
        return zza + i;
    }

    @Override // com.google.android.gms.internal.zzgrt
    public final void writeTo(zzgrr zzgrrVar) throws IOException {
        long j = this.zza;
        if (j != 0) {
            zzgrrVar.zzc(1, 1);
            if (zzgrrVar.zza.remaining() >= 8) {
                zzgrrVar.zza.putLong(j);
            } else {
                throw new zzgrs(zzgrrVar.zza.position(), zzgrrVar.zza.limit());
            }
        }
        zzgsy[] zzgsyVarArr = this.zzb;
        if (zzgsyVarArr != null && zzgsyVarArr.length > 0) {
            int i = 0;
            while (true) {
                zzgsy[] zzgsyVarArr2 = this.zzb;
                if (i >= zzgsyVarArr2.length) {
                    break;
                }
                zzgsy zzgsyVar = zzgsyVarArr2[i];
                if (zzgsyVar != null) {
                    zzgrrVar.zza(3, zzgsyVar);
                }
                i++;
            }
        }
        super.writeTo(zzgrrVar);
    }

    public zzgsz() {
        if (zzgsy.zzc == null) {
            synchronized (zzgrx.zzb) {
                if (zzgsy.zzc == null) {
                    zzgsy.zzc = new zzgsy[0];
                }
            }
        }
        this.zzb = zzgsy.zzc;
        this.zzay = null;
        this.zzaz = -1;
    }

    @Override // com.google.android.gms.internal.zzgrt, com.google.android.gms.internal.zzgrz
    public final int computeSerializedSize() {
        int i;
        super.computeSerializedSize();
        int i2 = 0;
        if (this.zza != 0) {
            i = zzgrr.zzb(1) + 8 + 0;
        } else {
            i = 0;
        }
        zzgsy[] zzgsyVarArr = this.zzb;
        if (zzgsyVarArr != null && zzgsyVarArr.length > 0) {
            while (true) {
                zzgsy[] zzgsyVarArr2 = this.zzb;
                if (i2 >= zzgsyVarArr2.length) {
                    break;
                }
                zzgsy zzgsyVar = zzgsyVarArr2[i2];
                if (zzgsyVar != null) {
                    i += zzgrr.zzb(3, zzgsyVar);
                }
                i2++;
            }
        }
        return i;
    }
}
