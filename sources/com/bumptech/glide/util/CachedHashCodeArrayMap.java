package com.bumptech.glide.util;

import androidx.collection.ArrayMap;
/* loaded from: classes.dex */
public final class CachedHashCodeArrayMap<K, V> extends ArrayMap<K, V> {
    public int hashCode;

    @Override // androidx.collection.SimpleArrayMap, java.util.Map
    public final void clear() {
        this.hashCode = 0;
        super.clear();
    }

    @Override // androidx.collection.SimpleArrayMap, java.util.Map
    public final V put(K k, V v) {
        this.hashCode = 0;
        return (V) super.put(k, v);
    }

    @Override // androidx.collection.SimpleArrayMap
    public final void putAll(ArrayMap arrayMap) {
        this.hashCode = 0;
        super.putAll(arrayMap);
    }

    @Override // androidx.collection.SimpleArrayMap
    public final V removeAt(int i) {
        this.hashCode = 0;
        return (V) super.removeAt(i);
    }

    @Override // androidx.collection.SimpleArrayMap
    public final V setValueAt(int i, V v) {
        this.hashCode = 0;
        return (V) super.setValueAt(i, v);
    }

    @Override // androidx.collection.SimpleArrayMap, java.util.Map
    public final int hashCode() {
        if (this.hashCode == 0) {
            this.hashCode = super.hashCode();
        }
        return this.hashCode;
    }
}
