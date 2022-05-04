package com.google.common.collect;

import com.google.common.collect.AbstractMapBasedMultimap;
import com.google.photos.base.BaseImageUrlUtil;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.RandomAccess;
/* loaded from: classes.dex */
abstract class AbstractListMultimap<K, V> extends AbstractMapBasedMultimap<K, V> implements ListMultimap<K, V> {
    private static final long serialVersionUID = 6588350623831699109L;

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

    @Override // com.google.common.collect.ListMultimap
    public final List<V> get(K key) {
        Collection<V> collection = this.map.get(key);
        if (collection == null) {
            collection = createCollection(key);
        }
        return (List) wrapCollection(key, collection);
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap
    public final <E> Collection<E> unmodifiableCollectionSubclass(Collection<E> collection) {
        return Collections.unmodifiableList((List) collection);
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap
    public final Collection<V> wrapCollection(K key, Collection<V> collection) {
        List list = (List) collection;
        if (list instanceof RandomAccess) {
            return new AbstractMapBasedMultimap.RandomAccessWrappedList(this, key, list, null);
        }
        return new AbstractMapBasedMultimap.WrappedList(key, list, null);
    }

    @Override // com.google.common.collect.AbstractMultimap
    public final boolean equals(Object object) {
        return super.equals(object);
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.Multimap
    public final boolean put(BaseImageUrlUtil.OptionInfo key, String value) {
        return super.put(key, value);
    }

    public AbstractListMultimap(Map<K, Collection<V>> map) {
        super(map);
    }
}
