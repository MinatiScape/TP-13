package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.collect.Iterators;
import com.google.common.collect.Maps;
import com.google.photos.base.BaseImageUrlUtil;
import java.io.Serializable;
import java.util.AbstractCollection;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.RandomAccess;
import java.util.Set;
import java.util.SortedMap;
import java.util.SortedSet;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public abstract class AbstractMapBasedMultimap<K, V> extends AbstractMultimap<K, V> implements Serializable {
    private static final long serialVersionUID = 2447537837011683357L;
    public transient Map<K, Collection<V>> map;
    public transient int totalSize;

    /* loaded from: classes.dex */
    public class AsMap extends Maps.ViewCachingAbstractMap<K, Collection<V>> {
        public final transient Map<K, Collection<V>> submap;

        /* loaded from: classes.dex */
        public class AsMapEntries extends Maps.EntrySet<K, Collection<V>> {
            public AsMapEntries() {
            }

            @Override // com.google.common.collect.Maps.EntrySet, java.util.AbstractCollection, java.util.Collection, java.util.Set
            public final boolean contains(Object o) {
                Set<Map.Entry<K, Collection<V>>> entrySet = AsMap.this.submap.entrySet();
                entrySet.getClass();
                try {
                    return entrySet.contains(o);
                } catch (ClassCastException | NullPointerException unused) {
                    return false;
                }
            }

            @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
            public final Iterator<Map.Entry<K, Collection<V>>> iterator() {
                return new AsMapIterator();
            }

            @Override // com.google.common.collect.Maps.EntrySet, java.util.AbstractCollection, java.util.Collection, java.util.Set
            public final boolean remove(Object o) {
                Collection<V> collection;
                if (!contains(o)) {
                    return false;
                }
                AbstractMapBasedMultimap abstractMapBasedMultimap = AbstractMapBasedMultimap.this;
                Object key = ((Map.Entry) o).getKey();
                Map<K, Collection<V>> map = abstractMapBasedMultimap.map;
                map.getClass();
                try {
                    collection = map.remove(key);
                } catch (ClassCastException | NullPointerException unused) {
                    collection = null;
                }
                Collection<V> collection2 = collection;
                if (collection2 == null) {
                    return true;
                }
                int size = collection2.size();
                collection2.clear();
                abstractMapBasedMultimap.totalSize -= size;
                return true;
            }

            @Override // com.google.common.collect.Maps.EntrySet
            public final Map<K, Collection<V>> map() {
                return AsMap.this;
            }
        }

        /* loaded from: classes.dex */
        public class AsMapIterator implements Iterator<Map.Entry<K, Collection<V>>> {
            public Collection<V> collection;
            public final Iterator<Map.Entry<K, Collection<V>>> delegateIterator;

            public AsMapIterator() {
                this.delegateIterator = AsMap.this.submap.entrySet().iterator();
            }

            @Override // java.util.Iterator
            public final boolean hasNext() {
                return this.delegateIterator.hasNext();
            }

            @Override // java.util.Iterator
            public final Object next() {
                Map.Entry<K, Collection<V>> next = this.delegateIterator.next();
                this.collection = next.getValue();
                return AsMap.this.wrapEntry(next);
            }

            @Override // java.util.Iterator
            public final void remove() {
                boolean z;
                if (this.collection != null) {
                    z = true;
                } else {
                    z = false;
                }
                CollectPreconditions.checkRemove(z);
                this.delegateIterator.remove();
                AbstractMapBasedMultimap.this.totalSize -= this.collection.size();
                this.collection.clear();
                this.collection = null;
            }
        }

        public AsMap(Map<K, Collection<V>> submap) {
            this.submap = submap;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public final void clear() {
            Map<K, Collection<V>> map = this.submap;
            AbstractMapBasedMultimap abstractMapBasedMultimap = AbstractMapBasedMultimap.this;
            if (map == abstractMapBasedMultimap.map) {
                abstractMapBasedMultimap.clear();
            } else {
                Iterators.clear(new AsMapIterator());
            }
        }

        @Override // java.util.AbstractMap, java.util.Map
        public final boolean containsKey(Object key) {
            Map<K, Collection<V>> map = this.submap;
            map.getClass();
            try {
                return map.containsKey(key);
            } catch (ClassCastException | NullPointerException unused) {
                return false;
            }
        }

        @Override // java.util.AbstractMap, java.util.Map
        public final boolean equals(Object object) {
            if (this == object || this.submap.equals(object)) {
                return true;
            }
            return false;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public final Object get(Object key) {
            Collection<V> collection;
            Map<K, Collection<V>> map = this.submap;
            map.getClass();
            try {
                collection = map.get(key);
            } catch (ClassCastException | NullPointerException unused) {
                collection = null;
            }
            Collection<V> collection2 = collection;
            if (collection2 == null) {
                return null;
            }
            return AbstractMapBasedMultimap.this.wrapCollection(key, collection2);
        }

        @Override // java.util.AbstractMap, java.util.Map
        public final int hashCode() {
            return this.submap.hashCode();
        }

        @Override // java.util.AbstractMap, java.util.Map
        /* renamed from: keySet */
        public Set<K> mo58keySet() {
            return AbstractMapBasedMultimap.this.keySet();
        }

        @Override // java.util.AbstractMap, java.util.Map
        public final Object remove(Object key) {
            Collection<V> remove = this.submap.remove(key);
            if (remove == null) {
                return null;
            }
            Collection<V> createCollection = AbstractMapBasedMultimap.this.createCollection();
            createCollection.addAll(remove);
            AbstractMapBasedMultimap.this.totalSize -= remove.size();
            remove.clear();
            return createCollection;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public final int size() {
            return this.submap.size();
        }

        @Override // java.util.AbstractMap
        public final String toString() {
            return this.submap.toString();
        }

        public final Map.Entry<K, Collection<V>> wrapEntry(Map.Entry<K, Collection<V>> entry) {
            K key = entry.getKey();
            return new ImmutableEntry(key, AbstractMapBasedMultimap.this.wrapCollection(key, entry.getValue()));
        }
    }

    /* loaded from: classes.dex */
    public abstract class Itr<T> implements Iterator<T> {
        public final Iterator<Map.Entry<K, Collection<V>>> keyIterator;
        public K key = null;
        public Collection<V> collection = null;
        public Iterator<V> valueIterator = Iterators.EmptyModifiableIterator.INSTANCE;

        public Itr() {
            this.keyIterator = AbstractMapBasedMultimap.this.map.entrySet().iterator();
        }

        @Override // java.util.Iterator
        public final boolean hasNext() {
            if (this.keyIterator.hasNext() || this.valueIterator.hasNext()) {
                return true;
            }
            return false;
        }

        @Override // java.util.Iterator
        public final T next() {
            if (!this.valueIterator.hasNext()) {
                Map.Entry<K, Collection<V>> next = this.keyIterator.next();
                this.key = next.getKey();
                Collection<V> value = next.getValue();
                this.collection = value;
                this.valueIterator = value.iterator();
            }
            return (T) new ImmutableEntry(this.key, this.valueIterator.next());
        }

        @Override // java.util.Iterator
        public final void remove() {
            this.valueIterator.remove();
            if (this.collection.isEmpty()) {
                this.keyIterator.remove();
            }
            AbstractMapBasedMultimap abstractMapBasedMultimap = AbstractMapBasedMultimap.this;
            abstractMapBasedMultimap.totalSize--;
        }
    }

    /* loaded from: classes.dex */
    public class KeySet extends Maps.KeySet<K, Collection<V>> {
        public KeySet(final Map<K, Collection<V>> subMap) {
            super(subMap);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final boolean containsAll(Collection<?> c) {
            return this.map.keySet().containsAll(c);
        }

        @Override // java.util.AbstractSet, java.util.Collection, java.util.Set
        public final boolean equals(Object object) {
            if (this == object || this.map.keySet().equals(object)) {
                return true;
            }
            return false;
        }

        @Override // java.util.AbstractSet, java.util.Collection, java.util.Set
        public final int hashCode() {
            return this.map.keySet().hashCode();
        }

        @Override // com.google.common.collect.Maps.KeySet, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public final Iterator<K> iterator() {
            final Iterator<Map.Entry<K, V>> it = this.map.entrySet().iterator();
            return new Iterator<K>() { // from class: com.google.common.collect.AbstractMapBasedMultimap.KeySet.1
                public Map.Entry<K, Collection<V>> entry;

                @Override // java.util.Iterator
                public final boolean hasNext() {
                    return it.hasNext();
                }

                @Override // java.util.Iterator
                public final K next() {
                    Map.Entry<K, Collection<V>> entry = (Map.Entry) it.next();
                    this.entry = entry;
                    return entry.getKey();
                }

                @Override // java.util.Iterator
                public final void remove() {
                    boolean z;
                    if (this.entry != null) {
                        z = true;
                    } else {
                        z = false;
                    }
                    CollectPreconditions.checkRemove(z);
                    Collection<V> value = this.entry.getValue();
                    it.remove();
                    AbstractMapBasedMultimap.this.totalSize -= value.size();
                    value.clear();
                    this.entry = null;
                }
            };
        }

        @Override // com.google.common.collect.Maps.KeySet, java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final boolean remove(Object key) {
            int i;
            Collection collection = (Collection) this.map.remove(key);
            if (collection != null) {
                i = collection.size();
                collection.clear();
                AbstractMapBasedMultimap.this.totalSize -= i;
            } else {
                i = 0;
            }
            if (i > 0) {
                return true;
            }
            return false;
        }

        @Override // com.google.common.collect.Maps.KeySet, java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final void clear() {
            Iterators.clear(iterator());
        }
    }

    /* loaded from: classes.dex */
    public class NavigableAsMap extends AbstractMapBasedMultimap<K, V>.SortedAsMap implements NavigableMap<K, Collection<V>> {
        @Override // com.google.common.collect.AbstractMapBasedMultimap.SortedAsMap, java.util.SortedMap, java.util.NavigableMap
        public final SortedMap headMap(Object toKey) {
            return headMap(toKey, false);
        }

        @Override // com.google.common.collect.AbstractMapBasedMultimap.SortedAsMap, com.google.common.collect.AbstractMapBasedMultimap.AsMap, java.util.AbstractMap, java.util.Map
        /* renamed from: keySet */
        public final Set mo58keySet() {
            return (NavigableSet) super.mo58keySet();
        }

        @Override // com.google.common.collect.AbstractMapBasedMultimap.SortedAsMap
        public final NavigableMap<K, Collection<V>> sortedMap() {
            return (NavigableMap) ((SortedMap) this.submap);
        }

        @Override // com.google.common.collect.AbstractMapBasedMultimap.SortedAsMap, java.util.SortedMap, java.util.NavigableMap
        public final SortedMap subMap(Object fromKey, Object toKey) {
            return subMap(fromKey, true, toKey, false);
        }

        @Override // com.google.common.collect.AbstractMapBasedMultimap.SortedAsMap, java.util.SortedMap, java.util.NavigableMap
        public final SortedMap tailMap(Object fromKey) {
            return tailMap(fromKey, true);
        }

        public NavigableAsMap(NavigableMap<K, Collection<V>> submap) {
            super(submap);
        }

        @Override // com.google.common.collect.AbstractMapBasedMultimap.SortedAsMap
        public final SortedSet createKeySet() {
            return new NavigableKeySet(sortedMap());
        }

        @Override // java.util.NavigableMap
        public final NavigableMap<K, Collection<V>> descendingMap() {
            return new NavigableAsMap(sortedMap().descendingMap());
        }

        @Override // java.util.NavigableMap
        public final NavigableMap<K, Collection<V>> headMap(K toKey, boolean inclusive) {
            return new NavigableAsMap(sortedMap().headMap(toKey, inclusive));
        }

        @Override // com.google.common.collect.AbstractMapBasedMultimap.SortedAsMap, com.google.common.collect.AbstractMapBasedMultimap.AsMap, java.util.AbstractMap, java.util.Map
        /* renamed from: keySet  reason: collision with other method in class */
        public final SortedSet mo58keySet() {
            return (NavigableSet) super.mo58keySet();
        }

        @Override // java.util.NavigableMap
        public final NavigableMap<K, Collection<V>> subMap(K fromKey, boolean fromInclusive, K toKey, boolean toInclusive) {
            return new NavigableAsMap(sortedMap().subMap(fromKey, fromInclusive, toKey, toInclusive));
        }

        @Override // java.util.NavigableMap
        public final NavigableMap<K, Collection<V>> tailMap(K fromKey, boolean inclusive) {
            return new NavigableAsMap(sortedMap().tailMap(fromKey, inclusive));
        }

        @Override // java.util.NavigableMap
        public final Map.Entry<K, Collection<V>> ceilingEntry(K key) {
            Map.Entry<K, Collection<V>> ceilingEntry = sortedMap().ceilingEntry(key);
            if (ceilingEntry == null) {
                return null;
            }
            return wrapEntry(ceilingEntry);
        }

        @Override // java.util.NavigableMap
        public final K ceilingKey(K key) {
            return sortedMap().ceilingKey(key);
        }

        @Override // java.util.NavigableMap
        public final NavigableSet<K> descendingKeySet() {
            return ((NavigableAsMap) descendingMap()).navigableKeySet();
        }

        @Override // java.util.NavigableMap
        public final Map.Entry<K, Collection<V>> firstEntry() {
            Map.Entry<K, Collection<V>> firstEntry = sortedMap().firstEntry();
            if (firstEntry == null) {
                return null;
            }
            return wrapEntry(firstEntry);
        }

        @Override // java.util.NavigableMap
        public final Map.Entry<K, Collection<V>> floorEntry(K key) {
            Map.Entry<K, Collection<V>> floorEntry = sortedMap().floorEntry(key);
            if (floorEntry == null) {
                return null;
            }
            return wrapEntry(floorEntry);
        }

        @Override // java.util.NavigableMap
        public final K floorKey(K key) {
            return sortedMap().floorKey(key);
        }

        @Override // java.util.NavigableMap
        public final Map.Entry<K, Collection<V>> higherEntry(K key) {
            Map.Entry<K, Collection<V>> higherEntry = sortedMap().higherEntry(key);
            if (higherEntry == null) {
                return null;
            }
            return wrapEntry(higherEntry);
        }

        @Override // java.util.NavigableMap
        public final K higherKey(K key) {
            return sortedMap().higherKey(key);
        }

        @Override // java.util.NavigableMap
        public final Map.Entry<K, Collection<V>> lastEntry() {
            Map.Entry<K, Collection<V>> lastEntry = sortedMap().lastEntry();
            if (lastEntry == null) {
                return null;
            }
            return wrapEntry(lastEntry);
        }

        @Override // java.util.NavigableMap
        public final Map.Entry<K, Collection<V>> lowerEntry(K key) {
            Map.Entry<K, Collection<V>> lowerEntry = sortedMap().lowerEntry(key);
            if (lowerEntry == null) {
                return null;
            }
            return wrapEntry(lowerEntry);
        }

        @Override // java.util.NavigableMap
        public final K lowerKey(K key) {
            return sortedMap().lowerKey(key);
        }

        @Override // java.util.NavigableMap
        public final NavigableSet<K> navigableKeySet() {
            return (NavigableSet) super.mo58keySet();
        }

        public final Map.Entry<K, Collection<V>> pollAsMapEntry(Iterator<Map.Entry<K, Collection<V>>> entryIterator) {
            if (!entryIterator.hasNext()) {
                return null;
            }
            Map.Entry<K, Collection<V>> next = entryIterator.next();
            Collection<V> createCollection = AbstractMapBasedMultimap.this.createCollection();
            createCollection.addAll(next.getValue());
            entryIterator.remove();
            return new ImmutableEntry(next.getKey(), AbstractMapBasedMultimap.this.unmodifiableCollectionSubclass(createCollection));
        }

        @Override // java.util.NavigableMap
        public final Map.Entry<K, Collection<V>> pollFirstEntry() {
            return pollAsMapEntry(entrySet().iterator());
        }

        @Override // java.util.NavigableMap
        public final Map.Entry<K, Collection<V>> pollLastEntry() {
            return pollAsMapEntry(((Maps.ViewCachingAbstractMap) descendingMap()).entrySet().iterator());
        }
    }

    /* loaded from: classes.dex */
    public class NavigableKeySet extends AbstractMapBasedMultimap<K, V>.SortedKeySet implements NavigableSet<K> {
        @Override // com.google.common.collect.AbstractMapBasedMultimap.SortedKeySet, java.util.SortedSet, java.util.NavigableSet
        public final SortedSet headSet(Object toElement) {
            return headSet(toElement, false);
        }

        @Override // com.google.common.collect.AbstractMapBasedMultimap.SortedKeySet, java.util.SortedSet, java.util.NavigableSet
        public final SortedSet subSet(Object fromElement, Object toElement) {
            return subSet(fromElement, true, toElement, false);
        }

        @Override // com.google.common.collect.AbstractMapBasedMultimap.SortedKeySet, java.util.SortedSet, java.util.NavigableSet
        public final SortedSet tailSet(Object fromElement) {
            return tailSet(fromElement, true);
        }

        public NavigableKeySet(NavigableMap<K, Collection<V>> subMap) {
            super(subMap);
        }

        @Override // java.util.NavigableSet
        public final NavigableSet<K> descendingSet() {
            return new NavigableKeySet(sortedMap().descendingMap());
        }

        @Override // java.util.NavigableSet
        public final NavigableSet<K> headSet(K toElement, boolean inclusive) {
            return new NavigableKeySet(sortedMap().headMap(toElement, inclusive));
        }

        @Override // com.google.common.collect.AbstractMapBasedMultimap.SortedKeySet
        public final NavigableMap<K, Collection<V>> sortedMap() {
            return (NavigableMap) ((SortedMap) this.map);
        }

        @Override // java.util.NavigableSet
        public final NavigableSet<K> subSet(K fromElement, boolean fromInclusive, K toElement, boolean toInclusive) {
            return new NavigableKeySet(sortedMap().subMap(fromElement, fromInclusive, toElement, toInclusive));
        }

        @Override // java.util.NavigableSet
        public final NavigableSet<K> tailSet(K fromElement, boolean inclusive) {
            return new NavigableKeySet(sortedMap().tailMap(fromElement, inclusive));
        }

        @Override // java.util.NavigableSet
        public final K ceiling(K k) {
            return sortedMap().ceilingKey(k);
        }

        @Override // java.util.NavigableSet
        public final Iterator<K> descendingIterator() {
            return ((KeySet) descendingSet()).iterator();
        }

        @Override // java.util.NavigableSet
        public final K floor(K k) {
            return sortedMap().floorKey(k);
        }

        @Override // java.util.NavigableSet
        public final K higher(K k) {
            return sortedMap().higherKey(k);
        }

        @Override // java.util.NavigableSet
        public final K lower(K k) {
            return sortedMap().lowerKey(k);
        }

        @Override // java.util.NavigableSet
        public final K pollFirst() {
            return (K) Iterators.pollNext(iterator());
        }

        @Override // java.util.NavigableSet
        public final K pollLast() {
            return (K) Iterators.pollNext(descendingIterator());
        }
    }

    /* loaded from: classes.dex */
    public class SortedAsMap extends AbstractMapBasedMultimap<K, V>.AsMap implements SortedMap<K, Collection<V>> {
        public SortedSet<K> sortedKeySet;

        public SortedAsMap(SortedMap<K, Collection<V>> submap) {
            super(submap);
        }

        public SortedSet<K> createKeySet() {
            return new SortedKeySet(sortedMap());
        }

        public SortedMap<K, Collection<V>> headMap(K toKey) {
            return new SortedAsMap(sortedMap().headMap(toKey));
        }

        @Override // com.google.common.collect.AbstractMapBasedMultimap.AsMap, java.util.AbstractMap, java.util.Map
        /* renamed from: keySet */
        public SortedSet<K> mo58keySet() {
            SortedSet<K> sortedSet = this.sortedKeySet;
            if (sortedSet != null) {
                return sortedSet;
            }
            SortedSet<K> createKeySet = createKeySet();
            this.sortedKeySet = createKeySet;
            return createKeySet;
        }

        public SortedMap<K, Collection<V>> sortedMap() {
            return (SortedMap) this.submap;
        }

        public SortedMap<K, Collection<V>> subMap(K fromKey, K toKey) {
            return new SortedAsMap(sortedMap().subMap(fromKey, toKey));
        }

        public SortedMap<K, Collection<V>> tailMap(K fromKey) {
            return new SortedAsMap(sortedMap().tailMap(fromKey));
        }

        @Override // java.util.SortedMap
        public final Comparator<? super K> comparator() {
            return sortedMap().comparator();
        }

        @Override // java.util.SortedMap
        public final K firstKey() {
            return sortedMap().firstKey();
        }

        @Override // java.util.SortedMap
        public final K lastKey() {
            return sortedMap().lastKey();
        }
    }

    /* loaded from: classes.dex */
    public class SortedKeySet extends AbstractMapBasedMultimap<K, V>.KeySet implements SortedSet<K> {
        public SortedKeySet(SortedMap<K, Collection<V>> subMap) {
            super(subMap);
        }

        public SortedSet<K> headSet(K toElement) {
            return new SortedKeySet(sortedMap().headMap(toElement));
        }

        public SortedMap<K, Collection<V>> sortedMap() {
            return (SortedMap) this.map;
        }

        public SortedSet<K> subSet(K fromElement, K toElement) {
            return new SortedKeySet(sortedMap().subMap(fromElement, toElement));
        }

        public SortedSet<K> tailSet(K fromElement) {
            return new SortedKeySet(sortedMap().tailMap(fromElement));
        }

        @Override // java.util.SortedSet
        public final Comparator<? super K> comparator() {
            return sortedMap().comparator();
        }

        @Override // java.util.SortedSet
        public final K first() {
            return sortedMap().firstKey();
        }

        @Override // java.util.SortedSet
        public final K last() {
            return sortedMap().lastKey();
        }
    }

    /* loaded from: classes.dex */
    public class WrappedCollection extends AbstractCollection<V> {
        public final AbstractMapBasedMultimap<K, V>.WrappedCollection ancestor;
        public final Collection<V> ancestorDelegate;
        public Collection<V> delegate;
        public final K key;

        /* loaded from: classes.dex */
        public class WrappedIterator implements Iterator<V> {
            public final Iterator<V> delegateIterator;
            public final Collection<V> originalDelegate;

            public WrappedIterator() {
                Iterator<V> it;
                Collection<V> collection = WrappedCollection.this.delegate;
                this.originalDelegate = collection;
                if (collection instanceof List) {
                    it = ((List) collection).listIterator();
                } else {
                    it = collection.iterator();
                }
                this.delegateIterator = it;
            }

            @Override // java.util.Iterator
            public final void remove() {
                this.delegateIterator.remove();
                WrappedCollection wrappedCollection = WrappedCollection.this;
                AbstractMapBasedMultimap abstractMapBasedMultimap = AbstractMapBasedMultimap.this;
                abstractMapBasedMultimap.totalSize--;
                wrappedCollection.removeIfEmpty();
            }

            public final void validateIterator() {
                WrappedCollection.this.refreshIfEmpty();
                if (WrappedCollection.this.delegate != this.originalDelegate) {
                    throw new ConcurrentModificationException();
                }
            }

            @Override // java.util.Iterator
            public final boolean hasNext() {
                validateIterator();
                return this.delegateIterator.hasNext();
            }

            @Override // java.util.Iterator
            public final V next() {
                validateIterator();
                return this.delegateIterator.next();
            }

            public WrappedIterator(Iterator<V> delegateIterator) {
                this.originalDelegate = WrappedCollection.this.delegate;
                this.delegateIterator = delegateIterator;
            }
        }

        public WrappedCollection(K key, Collection<V> delegate, AbstractMapBasedMultimap<K, V>.WrappedCollection ancestor) {
            Collection<V> collection;
            this.key = key;
            this.delegate = delegate;
            this.ancestor = ancestor;
            if (ancestor == null) {
                collection = null;
            } else {
                collection = ancestor.delegate;
            }
            this.ancestorDelegate = collection;
        }

        public final void addToMap() {
            AbstractMapBasedMultimap<K, V>.WrappedCollection wrappedCollection = this.ancestor;
            if (wrappedCollection != null) {
                wrappedCollection.addToMap();
            } else {
                AbstractMapBasedMultimap.this.map.put(this.key, this.delegate);
            }
        }

        @Override // java.util.Collection
        public final boolean equals(Object object) {
            if (object == this) {
                return true;
            }
            refreshIfEmpty();
            return this.delegate.equals(object);
        }

        public final void refreshIfEmpty() {
            Collection<V> collection;
            AbstractMapBasedMultimap<K, V>.WrappedCollection wrappedCollection = this.ancestor;
            if (wrappedCollection != null) {
                wrappedCollection.refreshIfEmpty();
                if (this.ancestor.delegate != this.ancestorDelegate) {
                    throw new ConcurrentModificationException();
                }
            } else if (this.delegate.isEmpty() && (collection = AbstractMapBasedMultimap.this.map.get(this.key)) != null) {
                this.delegate = collection;
            }
        }

        public final void removeIfEmpty() {
            AbstractMapBasedMultimap<K, V>.WrappedCollection wrappedCollection = this.ancestor;
            if (wrappedCollection != null) {
                wrappedCollection.removeIfEmpty();
            } else if (this.delegate.isEmpty()) {
                AbstractMapBasedMultimap.this.map.remove(this.key);
            }
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public final boolean add(V value) {
            refreshIfEmpty();
            boolean isEmpty = this.delegate.isEmpty();
            boolean add = this.delegate.add(value);
            if (add) {
                AbstractMapBasedMultimap.this.totalSize++;
                if (isEmpty) {
                    addToMap();
                }
            }
            return add;
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public final boolean addAll(Collection<? extends V> collection) {
            if (collection.isEmpty()) {
                return false;
            }
            int size = size();
            boolean addAll = this.delegate.addAll(collection);
            if (addAll) {
                int size2 = this.delegate.size();
                AbstractMapBasedMultimap.this.totalSize += size2 - size;
                if (size == 0) {
                    addToMap();
                }
            }
            return addAll;
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public final void clear() {
            int size = size();
            if (size != 0) {
                this.delegate.clear();
                AbstractMapBasedMultimap.this.totalSize -= size;
                removeIfEmpty();
            }
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public final boolean contains(Object o) {
            refreshIfEmpty();
            return this.delegate.contains(o);
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public final boolean containsAll(Collection<?> c) {
            refreshIfEmpty();
            return this.delegate.containsAll(c);
        }

        @Override // java.util.Collection
        public final int hashCode() {
            refreshIfEmpty();
            return this.delegate.hashCode();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
        public final Iterator<V> iterator() {
            refreshIfEmpty();
            return new WrappedIterator();
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public final boolean remove(Object o) {
            refreshIfEmpty();
            boolean remove = this.delegate.remove(o);
            if (remove) {
                AbstractMapBasedMultimap abstractMapBasedMultimap = AbstractMapBasedMultimap.this;
                abstractMapBasedMultimap.totalSize--;
                removeIfEmpty();
            }
            return remove;
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public boolean removeAll(Collection<?> c) {
            if (c.isEmpty()) {
                return false;
            }
            int size = size();
            boolean removeAll = this.delegate.removeAll(c);
            if (removeAll) {
                int size2 = this.delegate.size();
                AbstractMapBasedMultimap.this.totalSize += size2 - size;
                removeIfEmpty();
            }
            return removeAll;
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public final boolean retainAll(Collection<?> c) {
            c.getClass();
            int size = size();
            boolean retainAll = this.delegate.retainAll(c);
            if (retainAll) {
                int size2 = this.delegate.size();
                AbstractMapBasedMultimap.this.totalSize += size2 - size;
                removeIfEmpty();
            }
            return retainAll;
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public final int size() {
            refreshIfEmpty();
            return this.delegate.size();
        }

        @Override // java.util.AbstractCollection
        public final String toString() {
            refreshIfEmpty();
            return this.delegate.toString();
        }
    }

    /* loaded from: classes.dex */
    public class WrappedList extends AbstractMapBasedMultimap<K, V>.WrappedCollection implements List<V> {

        /* loaded from: classes.dex */
        public class WrappedListIterator extends AbstractMapBasedMultimap<K, V>.WrappedCollection.WrappedIterator implements ListIterator<V> {
            public WrappedListIterator() {
                super();
            }

            public WrappedListIterator(int index) {
                super(((List) WrappedList.this.delegate).listIterator(index));
            }

            @Override // java.util.ListIterator
            public final void add(V value) {
                boolean isEmpty = WrappedList.this.isEmpty();
                getDelegateListIterator().add(value);
                WrappedList wrappedList = WrappedList.this;
                AbstractMapBasedMultimap.this.totalSize++;
                if (isEmpty) {
                    wrappedList.addToMap();
                }
            }

            public final ListIterator<V> getDelegateListIterator() {
                validateIterator();
                return (ListIterator) this.delegateIterator;
            }

            @Override // java.util.ListIterator
            public final boolean hasPrevious() {
                return getDelegateListIterator().hasPrevious();
            }

            @Override // java.util.ListIterator
            public final int nextIndex() {
                return getDelegateListIterator().nextIndex();
            }

            @Override // java.util.ListIterator
            public final V previous() {
                return getDelegateListIterator().previous();
            }

            @Override // java.util.ListIterator
            public final int previousIndex() {
                return getDelegateListIterator().previousIndex();
            }

            @Override // java.util.ListIterator
            public final void set(V value) {
                getDelegateListIterator().set(value);
            }
        }

        @Override // java.util.List
        public final ListIterator<V> listIterator() {
            refreshIfEmpty();
            return new WrappedListIterator();
        }

        public WrappedList(K key, List<V> delegate, AbstractMapBasedMultimap<K, V>.WrappedCollection ancestor) {
            super(key, delegate, ancestor);
        }

        @Override // java.util.List
        public final void add(int index, V element) {
            refreshIfEmpty();
            boolean isEmpty = this.delegate.isEmpty();
            ((List) this.delegate).add(index, element);
            AbstractMapBasedMultimap.this.totalSize++;
            if (isEmpty) {
                addToMap();
            }
        }

        @Override // java.util.List
        public final boolean addAll(int index, Collection<? extends V> c) {
            if (c.isEmpty()) {
                return false;
            }
            int size = size();
            boolean addAll = ((List) this.delegate).addAll(index, c);
            if (addAll) {
                int size2 = this.delegate.size();
                AbstractMapBasedMultimap.this.totalSize += size2 - size;
                if (size == 0) {
                    addToMap();
                }
            }
            return addAll;
        }

        @Override // java.util.List
        public final V get(int index) {
            refreshIfEmpty();
            return (V) ((List) this.delegate).get(index);
        }

        @Override // java.util.List
        public final int indexOf(Object o) {
            refreshIfEmpty();
            return ((List) this.delegate).indexOf(o);
        }

        @Override // java.util.List
        public final int lastIndexOf(Object o) {
            refreshIfEmpty();
            return ((List) this.delegate).lastIndexOf(o);
        }

        @Override // java.util.List
        public final ListIterator<V> listIterator(int index) {
            refreshIfEmpty();
            return new WrappedListIterator(index);
        }

        @Override // java.util.List
        public final V remove(int index) {
            refreshIfEmpty();
            V v = (V) ((List) this.delegate).remove(index);
            AbstractMapBasedMultimap abstractMapBasedMultimap = AbstractMapBasedMultimap.this;
            abstractMapBasedMultimap.totalSize--;
            removeIfEmpty();
            return v;
        }

        @Override // java.util.List
        public final V set(int index, V element) {
            refreshIfEmpty();
            return (V) ((List) this.delegate).set(index, element);
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r5v1, types: [com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection] */
        @Override // java.util.List
        public final List<V> subList(int fromIndex, int toIndex) {
            refreshIfEmpty();
            AbstractMapBasedMultimap abstractMapBasedMultimap = AbstractMapBasedMultimap.this;
            K k = this.key;
            List subList = ((List) this.delegate).subList(fromIndex, toIndex);
            AbstractMapBasedMultimap<K, V>.WrappedCollection wrappedCollection = this.ancestor;
            if (wrappedCollection != 0) {
                this = wrappedCollection;
            }
            abstractMapBasedMultimap.getClass();
            if (subList instanceof RandomAccess) {
                return new RandomAccessWrappedList(abstractMapBasedMultimap, k, subList, this);
            }
            return new WrappedList(k, subList, this);
        }
    }

    /* loaded from: classes.dex */
    public class WrappedNavigableSet extends AbstractMapBasedMultimap<K, V>.WrappedSortedSet implements NavigableSet<V> {
        @Override // com.google.common.collect.AbstractMapBasedMultimap.WrappedSortedSet
        public final NavigableSet<V> getSortedSetDelegate() {
            return (NavigableSet) ((SortedSet) this.delegate);
        }

        public WrappedNavigableSet(K key, NavigableSet<V> delegate, AbstractMapBasedMultimap<K, V>.WrappedCollection ancestor) {
            super(key, delegate, ancestor);
        }

        @Override // java.util.NavigableSet
        public final Iterator<V> descendingIterator() {
            return new WrappedCollection.WrappedIterator(getSortedSetDelegate().descendingIterator());
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r3v0, types: [com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection] */
        public final WrappedNavigableSet wrap(NavigableSet wrapped) {
            AbstractMapBasedMultimap abstractMapBasedMultimap = AbstractMapBasedMultimap.this;
            K k = this.key;
            AbstractMapBasedMultimap<K, V>.WrappedCollection wrappedCollection = this.ancestor;
            if (wrappedCollection != 0) {
                this = wrappedCollection;
            }
            return new WrappedNavigableSet(k, wrapped, this);
        }

        @Override // java.util.NavigableSet
        public final V ceiling(V v) {
            return getSortedSetDelegate().ceiling(v);
        }

        @Override // java.util.NavigableSet
        public final NavigableSet<V> descendingSet() {
            return wrap(getSortedSetDelegate().descendingSet());
        }

        @Override // java.util.NavigableSet
        public final V floor(V v) {
            return getSortedSetDelegate().floor(v);
        }

        @Override // java.util.NavigableSet
        public final NavigableSet<V> headSet(V toElement, boolean inclusive) {
            return wrap(getSortedSetDelegate().headSet(toElement, inclusive));
        }

        @Override // java.util.NavigableSet
        public final V higher(V v) {
            return getSortedSetDelegate().higher(v);
        }

        @Override // java.util.NavigableSet
        public final V lower(V v) {
            return getSortedSetDelegate().lower(v);
        }

        @Override // java.util.NavigableSet
        public final V pollFirst() {
            return (V) Iterators.pollNext(iterator());
        }

        @Override // java.util.NavigableSet
        public final V pollLast() {
            return (V) Iterators.pollNext(descendingIterator());
        }

        @Override // java.util.NavigableSet
        public final NavigableSet<V> subSet(V fromElement, boolean fromInclusive, V toElement, boolean toInclusive) {
            return wrap(getSortedSetDelegate().subSet(fromElement, fromInclusive, toElement, toInclusive));
        }

        @Override // java.util.NavigableSet
        public final NavigableSet<V> tailSet(V fromElement, boolean inclusive) {
            return wrap(getSortedSetDelegate().tailSet(fromElement, inclusive));
        }
    }

    /* loaded from: classes.dex */
    public class WrappedSet extends AbstractMapBasedMultimap<K, V>.WrappedCollection implements Set<V> {
        public WrappedSet(K key, Set<V> delegate) {
            super(key, delegate, null);
        }

        @Override // com.google.common.collect.AbstractMapBasedMultimap.WrappedCollection, java.util.AbstractCollection, java.util.Collection
        public final boolean removeAll(Collection<?> c) {
            if (c.isEmpty()) {
                return false;
            }
            int size = size();
            boolean removeAllImpl = Sets.removeAllImpl((Set) this.delegate, c);
            if (removeAllImpl) {
                int size2 = this.delegate.size();
                AbstractMapBasedMultimap.this.totalSize += size2 - size;
                removeIfEmpty();
            }
            return removeAllImpl;
        }
    }

    /* loaded from: classes.dex */
    public class WrappedSortedSet extends AbstractMapBasedMultimap<K, V>.WrappedCollection implements SortedSet<V> {
        public WrappedSortedSet(K key, SortedSet<V> delegate, AbstractMapBasedMultimap<K, V>.WrappedCollection ancestor) {
            super(key, delegate, ancestor);
        }

        public SortedSet<V> getSortedSetDelegate() {
            return (SortedSet) this.delegate;
        }

        @Override // java.util.SortedSet
        public final Comparator<? super V> comparator() {
            return getSortedSetDelegate().comparator();
        }

        @Override // java.util.SortedSet
        public final V first() {
            refreshIfEmpty();
            return getSortedSetDelegate().first();
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r3v1, types: [com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection] */
        @Override // java.util.SortedSet
        public final SortedSet<V> headSet(V toElement) {
            refreshIfEmpty();
            AbstractMapBasedMultimap abstractMapBasedMultimap = AbstractMapBasedMultimap.this;
            K k = this.key;
            SortedSet<V> headSet = getSortedSetDelegate().headSet(toElement);
            AbstractMapBasedMultimap<K, V>.WrappedCollection wrappedCollection = this.ancestor;
            if (wrappedCollection != 0) {
                this = wrappedCollection;
            }
            return new WrappedSortedSet(k, headSet, this);
        }

        @Override // java.util.SortedSet
        public final V last() {
            refreshIfEmpty();
            return getSortedSetDelegate().last();
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r6v1, types: [com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection] */
        @Override // java.util.SortedSet
        public final SortedSet<V> subSet(V fromElement, V toElement) {
            refreshIfEmpty();
            AbstractMapBasedMultimap abstractMapBasedMultimap = AbstractMapBasedMultimap.this;
            K k = this.key;
            SortedSet<V> subSet = getSortedSetDelegate().subSet(fromElement, toElement);
            AbstractMapBasedMultimap<K, V>.WrappedCollection wrappedCollection = this.ancestor;
            if (wrappedCollection != 0) {
                this = wrappedCollection;
            }
            return new WrappedSortedSet(k, subSet, this);
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r3v1, types: [com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection] */
        @Override // java.util.SortedSet
        public final SortedSet<V> tailSet(V fromElement) {
            refreshIfEmpty();
            AbstractMapBasedMultimap abstractMapBasedMultimap = AbstractMapBasedMultimap.this;
            K k = this.key;
            SortedSet<V> tailSet = getSortedSetDelegate().tailSet(fromElement);
            AbstractMapBasedMultimap<K, V>.WrappedCollection wrappedCollection = this.ancestor;
            if (wrappedCollection != 0) {
                this = wrappedCollection;
            }
            return new WrappedSortedSet(k, tailSet, this);
        }
    }

    public abstract Collection<V> createCollection();

    public abstract <E> Collection<E> unmodifiableCollectionSubclass(Collection<E> collection);

    public abstract Collection<V> wrapCollection(K key, Collection<V> collection);

    @Override // com.google.common.collect.Multimap
    public void clear() {
        for (Collection<V> collection : this.map.values()) {
            collection.clear();
        }
        this.map.clear();
        this.totalSize = 0;
    }

    public AsMap createAsMap() {
        return new AsMap(this.map);
    }

    @Override // com.google.common.collect.AbstractMultimap
    public KeySet createKeySet() {
        return new KeySet(this.map);
    }

    @Override // com.google.common.collect.AbstractMultimap
    public Iterator<Map.Entry<K, V>> entryIterator() {
        return new AbstractMapBasedMultimap<K, V>.Itr<Map.Entry<K, V>>(this) { // from class: com.google.common.collect.AbstractMapBasedMultimap.2
        };
    }

    @Override // com.google.common.collect.Multimap
    public boolean put(BaseImageUrlUtil.OptionInfo key, String value) {
        Collection<V> collection = this.map.get(key);
        if (collection == null) {
            ArrayList arrayList = (ArrayList) createCollection();
            if (arrayList.add(value)) {
                this.totalSize++;
                this.map.put(key, arrayList);
                return true;
            }
            throw new AssertionError("New Collection violated the Collection spec");
        } else if (!collection.add(value)) {
            return false;
        } else {
            this.totalSize++;
            return true;
        }
    }

    public final void setMap(Map<K, Collection<V>> map) {
        this.map = map;
        this.totalSize = 0;
        for (Collection<V> collection : map.values()) {
            Preconditions.checkArgument(!collection.isEmpty());
            this.totalSize = collection.size() + this.totalSize;
        }
    }

    public AbstractMapBasedMultimap(Map<K, Collection<V>> map) {
        Preconditions.checkArgument(((CompactHashMap) map).isEmpty());
        this.map = map;
    }

    public Collection<V> createCollection(K key) {
        return createCollection();
    }

    /* loaded from: classes.dex */
    public class RandomAccessWrappedList extends AbstractMapBasedMultimap<K, V>.WrappedList implements RandomAccess {
        public RandomAccessWrappedList(final AbstractMapBasedMultimap this$0, K key, List<V> delegate, AbstractMapBasedMultimap<K, V>.WrappedCollection ancestor) {
            super(key, delegate, ancestor);
        }
    }
}
