package com.google.common.collect;

import com.adobe.xmp.impl.XMPNode$$ExternalSyntheticOutline0;
import com.google.common.base.Objects;
import java.util.Map;
/* loaded from: classes.dex */
public abstract class AbstractMapEntry<K, V> implements Map.Entry<K, V> {
    @Override // java.util.Map.Entry
    public abstract K getKey();

    @Override // java.util.Map.Entry
    public abstract V getValue();

    @Override // java.util.Map.Entry
    public boolean equals(Object object) {
        if (!(object instanceof Map.Entry)) {
            return false;
        }
        Map.Entry entry = (Map.Entry) object;
        if (!Objects.equal(getKey(), entry.getKey()) || !Objects.equal(getValue(), entry.getValue())) {
            return false;
        }
        return true;
    }

    @Override // java.util.Map.Entry
    public V setValue(V value) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map.Entry
    public int hashCode() {
        int i;
        K key = getKey();
        V value = getValue();
        int i2 = 0;
        if (key == null) {
            i = 0;
        } else {
            i = key.hashCode();
        }
        if (value != null) {
            i2 = value.hashCode();
        }
        return i ^ i2;
    }

    public final String toString() {
        String valueOf = String.valueOf(getKey());
        String valueOf2 = String.valueOf(getValue());
        return XMPNode$$ExternalSyntheticOutline0.m(valueOf2.length() + valueOf.length() + 1, valueOf, "=", valueOf2);
    }
}
