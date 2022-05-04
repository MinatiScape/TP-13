package com.google.common.collect;

import java.util.Collection;
import java.util.Map;
import java.util.Set;
/* loaded from: classes.dex */
public abstract class ForwardingMap<K, V> extends ForwardingObject implements Map<K, V> {
    @Override // java.util.Map
    public void clear() {
        mo31delegate().clear();
    }

    @Override // java.util.Map
    public boolean containsKey(Object key) {
        return mo31delegate().containsKey(key);
    }

    @Override // java.util.Map
    public boolean containsValue(Object value) {
        return mo31delegate().containsValue(value);
    }

    @Override // com.google.common.collect.ForwardingObject
    /* renamed from: delegate */
    public abstract Map<K, V> mo31delegate();

    @Override // java.util.Map
    public Set<Map.Entry<K, V>> entrySet() {
        return mo31delegate().entrySet();
    }

    @Override // java.util.Map
    public boolean equals(Object object) {
        return object == this || mo31delegate().equals(object);
    }

    @Override // java.util.Map
    public V get(Object key) {
        return mo31delegate().get(key);
    }

    @Override // java.util.Map
    public int hashCode() {
        return mo31delegate().hashCode();
    }

    @Override // java.util.Map
    public boolean isEmpty() {
        return mo31delegate().isEmpty();
    }

    @Override // java.util.Map
    public Set<K> keySet() {
        return mo31delegate().keySet();
    }

    @Override // java.util.Map
    public V put(K key, V value) {
        return mo31delegate().put(key, value);
    }

    @Override // java.util.Map
    public void putAll(Map<? extends K, ? extends V> map) {
        mo31delegate().putAll(map);
    }

    @Override // java.util.Map
    public V remove(Object object) {
        return mo31delegate().remove(object);
    }

    @Override // java.util.Map
    public int size() {
        return mo31delegate().size();
    }

    @Override // java.util.Map
    public Collection<V> values() {
        return mo31delegate().values();
    }
}
