package com.google.common.collect;

import com.google.common.collect.AbstractMapBasedMultimap;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.RandomAccess;
/* loaded from: classes.dex */
public abstract class AbstractListMultimap<K, V> extends AbstractMapBasedMultimap<K, V> {
    private static final long serialVersionUID = 6588350623831699109L;

    public AbstractListMultimap(Map<K, Collection<V>> map) {
        super(map);
    }

    @Override // com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public Map<K, Collection<V>> asMap() {
        Map<K, Collection<V>> map = this.asMap;
        if (map != null) {
            return map;
        }
        Map<K, Collection<V>> createAsMap = createAsMap();
        this.asMap = createAsMap;
        return createAsMap;
    }

    @Override // com.google.common.collect.AbstractMultimap
    public boolean equals(Object object) {
        return super.equals(object);
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap
    public boolean put(K key, V value) {
        return super.put(key, value);
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap
    public <E> Collection<E> unmodifiableCollectionSubclass(Collection<E> collection) {
        return Collections.unmodifiableList((List) collection);
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap
    public Collection<V> wrapCollection(K key, Collection<V> collection) {
        List list = (List) collection;
        if (list instanceof RandomAccess) {
            return new AbstractMapBasedMultimap.RandomAccessWrappedList(this, key, list, null);
        }
        return new AbstractMapBasedMultimap.WrappedList(key, list, null);
    }

    public List<V> get(K key) {
        Collection<V> collection = this.map.get(key);
        if (collection == null) {
            collection = createCollection();
        }
        return (List) wrapCollection(key, collection);
    }
}
