package com.google.common.collect;

import java.io.Serializable;
import java.util.Map;
import java.util.Objects;
/* loaded from: classes.dex */
public abstract class ImmutableMapEntrySet<K, V> extends ImmutableSet<Map.Entry<K, V>> {

    /* loaded from: classes.dex */
    public static class EntrySetSerializedForm<K, V> implements Serializable {
        private static final long serialVersionUID = 0;
        public final ImmutableMap<K, V> map;

        public EntrySetSerializedForm(ImmutableMap<K, V> map) {
            this.map = map;
        }

        public Object readResolve() {
            return this.map.entrySet();
        }
    }

    @Override // com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection
    public boolean contains(Object object) {
        if (!(object instanceof Map.Entry)) {
            return false;
        }
        Map.Entry entry = (Map.Entry) object;
        V v = map().get(entry.getKey());
        return v != null && v.equals(entry.getValue());
    }

    @Override // com.google.common.collect.ImmutableSet, java.util.Collection, java.util.Set
    public int hashCode() {
        return map().hashCode();
    }

    @Override // com.google.common.collect.ImmutableSet
    public boolean isHashCodeFast() {
        Objects.requireNonNull(map());
        return false;
    }

    public abstract ImmutableMap<K, V> map();

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public int size() {
        return map().size();
    }

    @Override // com.google.common.collect.ImmutableSet, com.google.common.collect.ImmutableCollection
    public Object writeReplace() {
        return new EntrySetSerializedForm(map());
    }
}
