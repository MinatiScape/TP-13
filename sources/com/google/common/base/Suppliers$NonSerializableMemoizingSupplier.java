package com.google.common.base;

import com.adobe.xmp.impl.XMPNode$$ExternalSyntheticOutline0;
/* loaded from: classes.dex */
class Suppliers$NonSerializableMemoizingSupplier<T> implements Supplier<T> {
    public volatile boolean initialized;
    public T value;

    @Override // com.google.common.base.Supplier
    public final T get() {
        if (!this.initialized) {
            synchronized (this) {
                if (!this.initialized) {
                    throw null;
                }
            }
        }
        return this.value;
    }

    public final String toString() {
        String valueOf = String.valueOf(this.value);
        StringBuilder sb = new StringBuilder(valueOf.length() + 25);
        sb.append("<supplier that returned ");
        sb.append(valueOf);
        sb.append(">");
        String valueOf2 = String.valueOf(sb.toString());
        return XMPNode$$ExternalSyntheticOutline0.m(valueOf2.length() + 19, "Suppliers.memoize(", valueOf2, ")");
    }
}
