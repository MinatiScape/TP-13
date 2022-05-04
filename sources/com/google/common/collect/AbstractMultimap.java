package com.google.common.collect;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
/* loaded from: classes.dex */
public abstract class AbstractMultimap<K, V> implements Multimap<K, V> {
    public transient Map<K, Collection<V>> asMap;
    public transient Collection<Map.Entry<K, V>> entries;
    public transient Set<K> keySet;

    /* loaded from: classes.dex */
    public class Entries extends Multimaps$Entries<K, V> {
        public Entries() {
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
        public Iterator<Map.Entry<K, V>> iterator() {
            return AbstractMultimap.this.entryIterator();
        }
    }

    /* loaded from: classes.dex */
    public class EntrySet extends AbstractMultimap<K, V>.Entries implements Set<Map.Entry<K, V>> {
        public EntrySet(final AbstractMultimap this$0) {
            super();
        }

        @Override // java.util.Collection, java.util.Set
        public boolean equals(Object obj) {
            return Sets.equalsImpl(this, obj);
        }

        @Override // java.util.Collection, java.util.Set
        public int hashCode() {
            return Sets.hashCodeImpl(this);
        }
    }

    @Override // com.google.common.collect.Multimap
    public abstract Map<K, Collection<V>> asMap();

    public abstract Set<K> createKeySet();

    public abstract Iterator<Map.Entry<K, V>> entryIterator();

    public boolean equals(Object object) {
        if (object == this) {
            return true;
        }
        if (object instanceof Multimap) {
            return asMap().equals(((Multimap) object).asMap());
        }
        return false;
    }

    public int hashCode() {
        return asMap().hashCode();
    }

    public Set<K> keySet() {
        Set<K> set = this.keySet;
        if (set != null) {
            return set;
        }
        Set<K> createKeySet = createKeySet();
        this.keySet = createKeySet;
        return createKeySet;
    }

    public boolean remove(Object key, Object value) {
        Collection<V> collection = asMap().get(key);
        return collection != null && collection.remove(value);
    }

    public String toString() {
        return asMap().toString();
    }
}
