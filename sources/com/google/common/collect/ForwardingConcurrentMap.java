package com.google.common.collect;

import com.google.common.collect.MapMakerInternalMap;
import java.util.concurrent.ConcurrentMap;
/* loaded from: classes.dex */
public abstract class ForwardingConcurrentMap<K, V> extends ForwardingMap<K, V> implements ConcurrentMap<K, V> {
    @Override // java.util.Map, java.util.concurrent.ConcurrentMap
    public final V replace(K key, V value) {
        return ((MapMakerInternalMap.AbstractSerializationProxy) this).delegate.replace(key, value);
    }

    @Override // java.util.Map, java.util.concurrent.ConcurrentMap
    public final V putIfAbsent(K key, V value) {
        return ((MapMakerInternalMap.AbstractSerializationProxy) this).delegate.putIfAbsent(key, value);
    }

    @Override // java.util.Map, java.util.concurrent.ConcurrentMap
    public final boolean remove(Object key, Object value) {
        return ((MapMakerInternalMap.AbstractSerializationProxy) this).delegate.remove(key, value);
    }

    @Override // java.util.Map, java.util.concurrent.ConcurrentMap
    public final boolean replace(K key, V oldValue, V newValue) {
        return ((MapMakerInternalMap.AbstractSerializationProxy) this).delegate.replace(key, oldValue, newValue);
    }
}
