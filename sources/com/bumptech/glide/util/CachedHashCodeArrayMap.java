package com.bumptech.glide.util;

import androidx.collection.ArrayMap;
import androidx.collection.SimpleArrayMap;
/* loaded from: classes.dex */
public final class CachedHashCodeArrayMap<K, V> extends ArrayMap<K, V> {
    public int hashCode;

    @Override // androidx.collection.SimpleArrayMap, java.util.Map
    public void clear() {
        this.hashCode = 0;
        super.clear();
    }

    @Override // androidx.collection.SimpleArrayMap, java.util.Map
    public int hashCode() {
        if (this.hashCode == 0) {
            this.hashCode = super.hashCode();
        }
        return this.hashCode;
    }

    @Override // androidx.collection.SimpleArrayMap, java.util.Map
    public V put(K key, V value) {
        this.hashCode = 0;
        return (V) super.put(key, value);
    }

    @Override // androidx.collection.SimpleArrayMap
    public void putAll(SimpleArrayMap<? extends K, ? extends V> simpleArrayMap) {
        this.hashCode = 0;
        super.putAll(simpleArrayMap);
    }

    @Override // androidx.collection.SimpleArrayMap
    public V removeAt(int index) {
        this.hashCode = 0;
        return (V) super.removeAt(index);
    }

    @Override // androidx.collection.SimpleArrayMap
    public V setValueAt(int index, V value) {
        this.hashCode = 0;
        int i = (index << 1) + 1;
        Object[] objArr = this.mArray;
        V v = (V) objArr[i];
        objArr[i] = value;
        return v;
    }
}
