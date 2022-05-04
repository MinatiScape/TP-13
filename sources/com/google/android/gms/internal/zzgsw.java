package com.google.android.gms.internal;

import java.io.IOException;
/* compiled from: ClientAnalytics.java */
/* loaded from: classes.dex */
public final class zzgsw extends zzgrt<zzgsw> implements Cloneable {
    public static volatile zzgsw[] zza;

    public zzgsw() {
        throw null;
    }

    @Override // com.google.android.gms.internal.zzgrt, com.google.android.gms.internal.zzgrz
    public final Object clone() throws CloneNotSupportedException {
        try {
            return (zzgsw) super.clone();
        } catch (CloneNotSupportedException e) {
            throw new AssertionError(e);
        }
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof zzgsw)) {
            return false;
        }
        zzgsw zzgswVar = (zzgsw) obj;
        zzgswVar.getClass();
        zzgswVar.getClass();
        zzgrv zzgrvVar = this.zzay;
        if (zzgrvVar != null && !zzgrvVar.zzb()) {
            return this.zzay.equals(zzgswVar.zzay);
        }
        zzgrv zzgrvVar2 = zzgswVar.zzay;
        return zzgrvVar2 == null || zzgrvVar2.zzb();
    }

    public final int hashCode() {
        int i;
        zzgrv zzgrvVar = this.zzay;
        if (zzgrvVar == null || zzgrvVar.zzb()) {
            i = 0;
        } else {
            i = this.zzay.hashCode();
        }
        return (-1637150801) + i;
    }

    @Override // com.google.android.gms.internal.zzgrt, com.google.android.gms.internal.zzgrz
    public final int computeSerializedSize() {
        super.computeSerializedSize();
        return 0;
    }

    @Override // com.google.android.gms.internal.zzgrt
    public final void writeTo(zzgrr zzgrrVar) throws IOException {
        super.writeTo(zzgrrVar);
    }
}
