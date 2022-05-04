package com.google.common.collect;

import com.google.common.collect.AbstractMapBasedMultimap;
import java.util.Collection;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
/* loaded from: classes.dex */
abstract class AbstractSetMultimap<K, V> extends AbstractMapBasedMultimap<K, V> implements SetMultimap<K, V> {
    private static final long serialVersionUID = 7431625294878419160L;

    @Override // com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public final Map<K, Collection<V>> asMap() {
        Map<K, Collection<V>> map = this.asMap;
        if (map != null) {
            return map;
        }
        AbstractMapBasedMultimap.AsMap createAsMap = createAsMap();
        this.asMap = createAsMap;
        return createAsMap;
    }

    @Override // com.google.common.collect.SetMultimap
    public final Set<V> get(K key) {
        Collection<V> collection = this.map.get(key);
        if (collection == null) {
            collection = createCollection(key);
        }
        return (Set) wrapCollection(key, collection);
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap
    public <E> Collection<E> unmodifiableCollectionSubclass(Collection<E> collection) {
        return Collections.unmodifiableSet((Set) collection);
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap
    public Collection<V> wrapCollection(K key, Collection<V> collection) {
        return new AbstractMapBasedMultimap.WrappedSet(key, (Set) collection);
    }

    @Override // com.google.common.collect.AbstractMultimap
    public final boolean equals(Object object) {
        return super.equals(object);
    }

    public AbstractSetMultimap(Map<K, Collection<V>> map) {
        super(map);
    }
}
