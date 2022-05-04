package com.google.common.base;

import com.adobe.xmp.impl.XMPNode$$ExternalSyntheticOutline0;
import java.io.Serializable;
/* loaded from: classes.dex */
class Suppliers$MemoizingSupplier<T> implements Supplier<T>, Serializable {
    private static final long serialVersionUID = 0;
    public final Supplier<T> delegate;
    public volatile transient boolean initialized;
    public transient T value;

    @Override // com.google.common.base.Supplier
    public final T get() {
        if (!this.initialized) {
            synchronized (this) {
                if (!this.initialized) {
                    T t = this.delegate.get();
                    this.value = t;
                    this.initialized = true;
                    return t;
                }
            }
        }
        return this.value;
    }

    public final String toString() {
        Object obj;
        if (this.initialized) {
            String valueOf = String.valueOf(this.value);
            obj = XMPNode$$ExternalSyntheticOutline0.m(valueOf.length() + 25, "<supplier that returned ", valueOf, ">");
        } else {
            obj = this.delegate;
        }
        String valueOf2 = String.valueOf(obj);
        return XMPNode$$ExternalSyntheticOutline0.m(valueOf2.length() + 19, "Suppliers.memoize(", valueOf2, ")");
    }
}
