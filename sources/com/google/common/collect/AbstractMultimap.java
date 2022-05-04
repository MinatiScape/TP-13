package com.google.common.collect;

import com.google.common.collect.AbstractMapBasedMultimap;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
/* loaded from: classes.dex */
public abstract class AbstractMultimap<K, V> implements Multimap<K, V> {
    public transient Map<K, Collection<V>> asMap;
    public transient Entries entries;
    public transient Set<K> keySet;

    /* loaded from: classes.dex */
    public class Entries extends Multimaps$Entries<K, V> {
        public Entries() {
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
        public final Iterator<Map.Entry<K, V>> iterator() {
            return AbstractMultimap.this.entryIterator();
        }
    }

    @Override // com.google.common.collect.Multimap
    public abstract Map<K, Collection<V>> asMap();

    public abstract AbstractMapBasedMultimap.KeySet createKeySet();

    public abstract Iterator<Map.Entry<K, V>> entryIterator();

    /* loaded from: classes.dex */
    public class EntrySet extends AbstractMultimap<K, V>.Entries implements Set<Map.Entry<K, V>> {
        @Override // java.util.Collection, java.util.Set
        public final boolean equals(Object obj) {
            return Sets.equalsImpl(this, obj);
        }

        @Override // java.util.Collection, java.util.Set
        public final int hashCode() {
            return Sets.hashCodeImpl(this);
        }

        public EntrySet(final AbstractMultimap this$0) {
            super();
        }
    }

    public boolean equals(Object object) {
        if (object == this) {
            return true;
        }
        if (object instanceof Multimap) {
            return asMap().equals(((Multimap) object).asMap());
        }
        return false;
    }

    public Set<K> keySet() {
        Set<K> set = this.keySet;
        if (set != null) {
            return set;
        }
        AbstractMapBasedMultimap.KeySet createKeySet = createKeySet();
        this.keySet = createKeySet;
        return createKeySet;
    }

    public final int hashCode() {
        return asMap().hashCode();
    }

    public final String toString() {
        return asMap().toString();
    }
}
