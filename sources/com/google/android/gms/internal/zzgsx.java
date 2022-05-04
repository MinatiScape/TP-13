package com.google.android.gms.internal;

import java.io.IOException;
/* compiled from: ClientAnalytics.java */
/* loaded from: classes.dex */
public final class zzgsx extends zzgrt<zzgsx> implements Cloneable {
    public zzgsx() {
        throw null;
    }

    @Override // com.google.android.gms.internal.zzgrt, com.google.android.gms.internal.zzgrz
    public final Object clone() throws CloneNotSupportedException {
        try {
            return (zzgsx) super.clone();
        } catch (CloneNotSupportedException e) {
            throw new AssertionError(e);
        }
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof zzgsx)) {
            return false;
        }
        zzgsx zzgsxVar = (zzgsx) obj;
        zzgsxVar.getClass();
        zzgrv zzgrvVar = this.zzay;
        if (zzgrvVar != null && !zzgrvVar.zzb()) {
            return this.zzay.equals(zzgsxVar.zzay);
        }
        zzgrv zzgrvVar2 = zzgsxVar.zzay;
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
        return (-1637121971) + i;
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
