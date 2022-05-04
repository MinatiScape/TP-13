package com.google.common.collect;

import java.util.Collection;
import java.util.Map;
import java.util.Set;
/* loaded from: classes.dex */
public abstract class ForwardingMap<K, V> extends ForwardingObject implements Map<K, V> {
    @Override // com.google.common.collect.ForwardingObject
    /* renamed from: delegate */
    public abstract Map<K, V> mo65delegate();

    @Override // java.util.Map
    public final boolean equals(Object object) {
        if (object == this || mo65delegate().equals(object)) {
            return true;
        }
        return false;
    }

    @Override // java.util.Map
    public final void clear() {
        mo65delegate().clear();
    }

    @Override // java.util.Map
    public final boolean containsKey(Object key) {
        return mo65delegate().containsKey(key);
    }

    @Override // java.util.Map
    public final boolean containsValue(Object value) {
        return mo65delegate().containsValue(value);
    }

    @Override // java.util.Map
    public Set<Map.Entry<K, V>> entrySet() {
        return mo65delegate().entrySet();
    }

    @Override // java.util.Map
    public final V get(Object key) {
        return mo65delegate().get(key);
    }

    @Override // java.util.Map
    public final int hashCode() {
        return mo65delegate().hashCode();
    }

    @Override // java.util.Map
    public final boolean isEmpty() {
        return mo65delegate().isEmpty();
    }

    @Override // java.util.Map
    public Set<K> keySet() {
        return mo65delegate().keySet();
    }

    @Override // java.util.Map
    public final V put(K key, V value) {
        return mo65delegate().put(key, value);
    }

    @Override // java.util.Map
    public final void putAll(Map<? extends K, ? extends V> map) {
        mo65delegate().putAll(map);
    }

    @Override // java.util.Map
    public final V remove(Object object) {
        return mo65delegate().remove(object);
    }

    @Override // java.util.Map
    public final int size() {
        return mo65delegate().size();
    }

    @Override // java.util.Map
    public Collection<V> values() {
        return mo65delegate().values();
    }
}
