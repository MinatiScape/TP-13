package com.google.android.gms.internal;

import java.io.IOException;
/* compiled from: CountersProto.java */
/* loaded from: classes.dex */
public final class zzgsy extends zzgrt<zzgsy> {
    public static volatile zzgsy[] zzc;
    public long zza = 0;
    public long zzb = 0;

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof zzgsy)) {
            return false;
        }
        zzgsy zzgsyVar = (zzgsy) obj;
        if (this.zza != zzgsyVar.zza || this.zzb != zzgsyVar.zzb) {
            return false;
        }
        zzgrv zzgrvVar = this.zzay;
        if (zzgrvVar != null && !zzgrvVar.zzb()) {
            return this.zzay.equals(zzgsyVar.zzay);
        }
        zzgrv zzgrvVar2 = zzgsyVar.zzay;
        return zzgrvVar2 == null || zzgrvVar2.zzb();
    }

    public final int hashCode() {
        int i;
        long j = this.zza;
        long j2 = this.zzb;
        int i2 = ((((-1208406099) + ((int) (j ^ (j >>> 32)))) * 31) + ((int) (j2 ^ (j2 >>> 32)))) * 31;
        zzgrv zzgrvVar = this.zzay;
        if (zzgrvVar == null || zzgrvVar.zzb()) {
            i = 0;
        } else {
            i = this.zzay.hashCode();
        }
        return i2 + i;
    }

    @Override // com.google.android.gms.internal.zzgrt
    public final void writeTo(zzgrr zzgrrVar) throws IOException {
        long j = this.zza;
        if (j != 0) {
            zzgrrVar.zzb(1, j);
        }
        long j2 = this.zzb;
        if (j2 != 0) {
            zzgrrVar.zzb(2, j2);
        }
        super.writeTo(zzgrrVar);
    }

    public zzgsy() {
        this.zzay = null;
        this.zzaz = -1;
    }

    @Override // com.google.android.gms.internal.zzgrt, com.google.android.gms.internal.zzgrz
    public final int computeSerializedSize() {
        super.computeSerializedSize();
        long j = this.zza;
        int i = 0;
        if (j != 0) {
            i = 0 + zzgrr.zzb(j) + zzgrr.zzb(1);
        }
        long j2 = this.zzb;
        if (j2 == 0) {
            return i;
        }
        return i + zzgrr.zzb(j2) + zzgrr.zzb(2);
    }
}
