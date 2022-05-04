package com.google.common.base;

import com.adobe.xmp.impl.XMPNode$$ExternalSyntheticOutline0;
/* loaded from: classes.dex */
final class Present<T> extends Optional<T> {
    private static final long serialVersionUID = 0;
    private final T reference;

    @Override // com.google.common.base.Optional
    public final T or(T defaultValue) {
        throw null;
    }

    public final boolean equals(Object object) {
        if (object instanceof Present) {
            return this.reference.equals(((Present) object).reference);
        }
        return false;
    }

    public final int hashCode() {
        return this.reference.hashCode() + 1502476572;
    }

    public final String toString() {
        String valueOf = String.valueOf(this.reference);
        return XMPNode$$ExternalSyntheticOutline0.m(valueOf.length() + 13, "Optional.of(", valueOf, ")");
    }

    public Present(T reference) {
        this.reference = reference;
    }

    @Override // com.google.common.base.Optional
    public final T get() {
        return this.reference;
    }
}
