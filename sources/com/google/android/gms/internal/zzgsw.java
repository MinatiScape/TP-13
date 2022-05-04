package com.google.android.gms.internal;

import java.io.IOException;
import java.util.Objects;
/* loaded from: classes.dex */
public final class zzgsw extends zzgrt<zzgsw> implements Cloneable {
    public static volatile zzgsw[] zza;

    public zzgsw() {
        this.zzay = null;
        this.zzaz = -1;
    }

    @Override // com.google.android.gms.internal.zzgrt, com.google.android.gms.internal.zzgrz
    public final Object clone() throws CloneNotSupportedException {
        try {
            return (zzgsw) super.clone();
        } catch (CloneNotSupportedException e) {
            throw new AssertionError(e);
        }
    }

    @Override // com.google.android.gms.internal.zzgrt, com.google.android.gms.internal.zzgrz
    public final int computeSerializedSize() {
        super.computeSerializedSize();
        return 0;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof zzgsw)) {
            return false;
        }
        zzgsw zzgswVar = (zzgsw) obj;
        Objects.requireNonNull(zzgswVar);
        Objects.requireNonNull(zzgswVar);
        zzgrv zzgrvVar = this.zzay;
        if (zzgrvVar != null && !zzgrvVar.zzb()) {
            return this.zzay.equals(zzgswVar.zzay);
        }
        zzgrv zzgrvVar2 = zzgswVar.zzay;
        return zzgrvVar2 == null || zzgrvVar2.zzb();
    }

    public final int hashCode() {
        zzgrv zzgrvVar = this.zzay;
        return (-1637150801) + ((zzgrvVar == null || zzgrvVar.zzb()) ? 0 : this.zzay.hashCode());
    }

    @Override // com.google.android.gms.internal.zzgrt, com.google.android.gms.internal.zzgrz
    public final void writeTo(zzgrr zzgrrVar) throws IOException {
        super.writeTo(zzgrrVar);
    }
}
