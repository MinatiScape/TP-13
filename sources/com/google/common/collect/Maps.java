package com.google.common.collect;

import com.google.common.collect.AbstractMapBasedMultimap;
import com.google.common.collect.Sets;
import java.util.AbstractCollection;
import java.util.AbstractMap;
import java.util.Collection;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.Objects;
import java.util.Set;
import java.util.SortedMap;
import java.util.SortedSet;
/* loaded from: classes.dex */
public final class Maps {

    /* loaded from: classes.dex */
    public static abstract class EntrySet<K, V> extends Sets.ImprovedAbstractSet<Map.Entry<K, V>> {
        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public void clear() {
            map().clear();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean contains(Object o) {
            V v;
            if (o instanceof Map.Entry) {
                Map.Entry entry = (Map.Entry) o;
                Object key = entry.getKey();
                Map<K, V> map = map();
                Objects.requireNonNull(map);
                try {
                    v = map.get(key);
                } catch (ClassCastException | NullPointerException unused) {
                    v = null;
                }
                if (com.google.common.base.Objects.equal(v, entry.getValue()) && (v != null || map().containsKey(key))) {
                    return true;
                }
            }
            return false;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean isEmpty() {
            return map().isEmpty();
        }

        public abstract Map<K, V> map();

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean remove(Object o) {
            if (contains(o)) {
                return map().keySet().remove(((Map.Entry) o).getKey());
            }
            return false;
        }

        @Override // com.google.common.collect.Sets.ImprovedAbstractSet, java.util.AbstractSet, java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean removeAll(Collection<?> c) {
            try {
                Objects.requireNonNull(c);
                return Sets.removeAllImpl(this, c);
            } catch (UnsupportedOperationException unused) {
                return Sets.removeAllImpl(this, c.iterator());
            }
        }

        @Override // com.google.common.collect.Sets.ImprovedAbstractSet, java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean retainAll(Collection<?> c) {
            try {
                Objects.requireNonNull(c);
                return super.retainAll(c);
            } catch (UnsupportedOperationException unused) {
                HashSet newHashSetWithExpectedSize = Sets.newHashSetWithExpectedSize(c.size());
                for (Object obj : c) {
                    if (this.contains(obj)) {
                        newHashSetWithExpectedSize.add(((Map.Entry) obj).getKey());
                    }
                }
                return this.map().keySet().retainAll(newHashSetWithExpectedSize);
            }
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public int size() {
            return map().size();
        }
    }

    /* loaded from: classes.dex */
    public static abstract class IteratorBasedAbstractMap<K, V> extends AbstractMap<K, V> {
        @Override // java.util.AbstractMap, java.util.Map
        public void clear() {
            Iterators.clear(entryIterator());
        }

        public abstract Iterator<Map.Entry<K, V>> entryIterator();

        @Override // java.util.AbstractMap, java.util.Map
        public Set<Map.Entry<K, V>> entrySet() {
            return new EntrySet<K, V>() { // from class: com.google.common.collect.Maps.IteratorBasedAbstractMap.1
                @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
                public Iterator<Map.Entry<K, V>> iterator() {
                    return IteratorBasedAbstractMap.this.entryIterator();
                }

                @Override // com.google.common.collect.Maps.EntrySet
                public Map<K, V> map() {
                    return IteratorBasedAbstractMap.this;
                }
            };
        }
    }

    /* loaded from: classes.dex */
    public static class KeySet<K, V> extends Sets.ImprovedAbstractSet<K> {
        public final Map<K, V> map;

        public KeySet(Map<K, V> map) {
            Objects.requireNonNull(map);
            this.map = map;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public void clear() {
            map().clear();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean contains(Object o) {
            return map().containsKey(o);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean isEmpty() {
            return map().isEmpty();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public Iterator<K> iterator() {
            return new TransformedIterator<Map.Entry<?, ?>, ?>(map().entrySet().iterator()) { // from class: com.google.common.collect.Maps.1
                @Override // com.google.common.collect.TransformedIterator
                public Object transform(Map.Entry<?, ?> entry) {
                    return entry.getKey();
                }
            };
        }

        public Map<K, V> map() {
            return this.map;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean remove(Object o) {
            if (!map().containsKey(o)) {
                return false;
            }
            map().remove(o);
            return true;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public int size() {
            return map().size();
        }
    }

    /* loaded from: classes.dex */
    public static class SortedKeySet<K, V> extends KeySet<K, V> implements SortedSet<K> {
        public SortedKeySet(SortedMap<K, V> map) {
            super(map);
        }

        @Override // java.util.SortedSet
        public Comparator<? super K> comparator() {
            return ((NavigableMap) ((NavigableKeySet) this).map).comparator();
        }

        @Override // java.util.SortedSet
        public K first() {
            return (K) ((NavigableMap) ((NavigableKeySet) this).map).firstKey();
        }

        @Override // java.util.SortedSet
        public K last() {
            return (K) ((NavigableMap) ((NavigableKeySet) this).map).lastKey();
        }
    }

    /* loaded from: classes.dex */
    public static class Values<K, V> extends AbstractCollection<V> {
        public final Map<K, V> map;

        public Values(Map<K, V> map) {
            this.map = map;
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public void clear() {
            this.map.clear();
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public boolean contains(Object o) {
            return this.map.containsValue(o);
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public boolean isEmpty() {
            return this.map.isEmpty();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
        public Iterator<V> iterator() {
            return new TransformedIterator<Map.Entry<?, ?>, ?>(this.map.entrySet().iterator()) { // from class: com.google.common.collect.Maps.2
                @Override // com.google.common.collect.TransformedIterator
                public Object transform(Map.Entry<?, ?> entry) {
                    return entry.getValue();
                }
            };
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public boolean remove(Object o) {
            try {
                return super.remove(o);
            } catch (UnsupportedOperationException unused) {
                for (Map.Entry<K, V> entry : this.map.entrySet()) {
                    if (com.google.common.base.Objects.equal(o, entry.getValue())) {
                        this.map.remove(entry.getKey());
                        return true;
                    }
                }
                return false;
            }
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public boolean removeAll(Collection<?> c) {
            try {
                Objects.requireNonNull(c);
                return super.removeAll(c);
            } catch (UnsupportedOperationException unused) {
                HashSet hashSet = new HashSet();
                for (Map.Entry<K, V> entry : this.map.entrySet()) {
                    if (c.contains(entry.getValue())) {
                        hashSet.add(entry.getKey());
                    }
                }
                return this.map.keySet().removeAll(hashSet);
            }
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public boolean retainAll(Collection<?> c) {
            try {
                Objects.requireNonNull(c);
                return super.retainAll(c);
            } catch (UnsupportedOperationException unused) {
                HashSet hashSet = new HashSet();
                for (Map.Entry<K, V> entry : this.map.entrySet()) {
                    if (c.contains(entry.getValue())) {
                        hashSet.add(entry.getKey());
                    }
                }
                return this.map.keySet().retainAll(hashSet);
            }
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public int size() {
            return this.map.size();
        }
    }

    /* loaded from: classes.dex */
    public static abstract class ViewCachingAbstractMap<K, V> extends AbstractMap<K, V> {
        public transient Set<Map.Entry<K, V>> entrySet;
        public transient Collection<V> values;

        @Override // java.util.AbstractMap, java.util.Map
        public Set<Map.Entry<K, V>> entrySet() {
            Set<Map.Entry<K, V>> set = this.entrySet;
            if (set != null) {
                return set;
            }
            AbstractMapBasedMultimap.AsMap.AsMapEntries asMapEntries = new AbstractMapBasedMultimap.AsMap.AsMapEntries();
            this.entrySet = asMapEntries;
            return asMapEntries;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public Collection<V> values() {
            Collection<V> collection = this.values;
            if (collection != null) {
                return collection;
            }
            Values values = new Values(this);
            this.values = values;
            return values;
        }
    }

    public static <K> K keyOrNull(Map.Entry<K, ?> entry) {
        if (entry == null) {
            return null;
        }
        return entry.getKey();
    }

    public static String toStringImpl(Map<?, ?> map) {
        int size = map.size();
        CollectPreconditions.checkNonnegative(size, "size");
        StringBuilder sb = new StringBuilder((int) Math.min(size * 8, 1073741824L));
        sb.append('{');
        boolean z = true;
        for (Map.Entry<?, ?> entry : map.entrySet()) {
            if (!z) {
                sb.append(", ");
            }
            z = false;
            sb.append(entry.getKey());
            sb.append('=');
            sb.append(entry.getValue());
        }
        sb.append('}');
        return sb.toString();
    }

    /* loaded from: classes.dex */
    public static abstract class DescendingMap<K, V> extends ForwardingMap<K, V> implements NavigableMap<K, V> {
        public transient Comparator<? super K> comparator;
        public transient Set<Map.Entry<K, V>> entrySet;
        public transient NavigableSet<K> navigableKeySet;

        @Override // java.util.NavigableMap
        public Map.Entry<K, V> ceilingEntry(K key) {
            return AbstractNavigableMap.this.floorEntry(key);
        }

        @Override // java.util.NavigableMap
        public K ceilingKey(K key) {
            return AbstractNavigableMap.this.floorKey(key);
        }

        @Override // java.util.SortedMap
        public Comparator<? super K> comparator() {
            Comparator<? super K> comparator = this.comparator;
            if (comparator != null) {
                return comparator;
            }
            Comparator<? super K> comparator2 = AbstractNavigableMap.this.comparator();
            if (comparator2 == null) {
                comparator2 = NaturalOrdering.INSTANCE;
            }
            Ordering reverse = Ordering.from(comparator2).reverse();
            this.comparator = reverse;
            return reverse;
        }

        @Override // com.google.common.collect.ForwardingMap, com.google.common.collect.ForwardingObject
        /* renamed from: delegate */
        public Object mo31delegate() {
            return AbstractNavigableMap.this;
        }

        @Override // java.util.NavigableMap
        public NavigableSet<K> descendingKeySet() {
            return AbstractNavigableMap.this.navigableKeySet();
        }

        @Override // java.util.NavigableMap
        public NavigableMap<K, V> descendingMap() {
            return AbstractNavigableMap.this;
        }

        @Override // com.google.common.collect.ForwardingMap, java.util.Map
        public Set<Map.Entry<K, V>> entrySet() {
            Set<Map.Entry<K, V>> set = this.entrySet;
            if (set != null) {
                return set;
            }
            EntrySet<?, ?> entrySet = new EntrySet<?, ?>() { // from class: com.google.common.collect.Maps.DescendingMap.1EntrySetImpl
                @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
                public Iterator<Map.Entry<?, ?>> iterator() {
                    return AbstractNavigableMap.this.descendingEntryIterator();
                }

                @Override // com.google.common.collect.Maps.EntrySet
                public Map<?, ?> map() {
                    return DescendingMap.this;
                }
            };
            this.entrySet = entrySet;
            return entrySet;
        }

        @Override // java.util.NavigableMap
        public Map.Entry<K, V> firstEntry() {
            return AbstractNavigableMap.this.lastEntry();
        }

        @Override // java.util.SortedMap
        public K firstKey() {
            return AbstractNavigableMap.this.lastKey();
        }

        @Override // java.util.NavigableMap
        public Map.Entry<K, V> floorEntry(K key) {
            return AbstractNavigableMap.this.ceilingEntry(key);
        }

        @Override // java.util.NavigableMap
        public K floorKey(K key) {
            return AbstractNavigableMap.this.ceilingKey(key);
        }

        @Override // java.util.NavigableMap
        public NavigableMap<K, V> headMap(K toKey, boolean inclusive) {
            return AbstractNavigableMap.this.tailMap(toKey, inclusive).descendingMap();
        }

        @Override // java.util.NavigableMap
        public Map.Entry<K, V> higherEntry(K key) {
            return AbstractNavigableMap.this.lowerEntry(key);
        }

        @Override // java.util.NavigableMap
        public K higherKey(K key) {
            return AbstractNavigableMap.this.lowerKey(key);
        }

        @Override // com.google.common.collect.ForwardingMap, java.util.Map
        public Set<K> keySet() {
            return navigableKeySet();
        }

        @Override // java.util.NavigableMap
        public Map.Entry<K, V> lastEntry() {
            return AbstractNavigableMap.this.firstEntry();
        }

        @Override // java.util.SortedMap
        public K lastKey() {
            return AbstractNavigableMap.this.firstKey();
        }

        @Override // java.util.NavigableMap
        public Map.Entry<K, V> lowerEntry(K key) {
            return AbstractNavigableMap.this.higherEntry(key);
        }

        @Override // java.util.NavigableMap
        public K lowerKey(K key) {
            return AbstractNavigableMap.this.higherKey(key);
        }

        @Override // java.util.NavigableMap
        public NavigableSet<K> navigableKeySet() {
            NavigableSet<K> navigableSet = this.navigableKeySet;
            if (navigableSet != null) {
                return navigableSet;
            }
            NavigableKeySet navigableKeySet = new NavigableKeySet(this);
            this.navigableKeySet = navigableKeySet;
            return navigableKeySet;
        }

        @Override // java.util.NavigableMap
        public Map.Entry<K, V> pollFirstEntry() {
            return AbstractNavigableMap.this.pollLastEntry();
        }

        @Override // java.util.NavigableMap
        public Map.Entry<K, V> pollLastEntry() {
            return AbstractNavigableMap.this.pollFirstEntry();
        }

        @Override // java.util.NavigableMap
        public NavigableMap<K, V> subMap(K fromKey, boolean fromInclusive, K toKey, boolean toInclusive) {
            return AbstractNavigableMap.this.subMap(toKey, toInclusive, fromKey, fromInclusive).descendingMap();
        }

        @Override // java.util.NavigableMap
        public NavigableMap<K, V> tailMap(K fromKey, boolean inclusive) {
            return AbstractNavigableMap.this.headMap(fromKey, inclusive).descendingMap();
        }

        @Override // com.google.common.collect.ForwardingObject
        public String toString() {
            return Maps.toStringImpl(this);
        }

        @Override // com.google.common.collect.ForwardingMap, java.util.Map
        public Collection<V> values() {
            return new Values(this);
        }

        @Override // com.google.common.collect.ForwardingMap, com.google.common.collect.ForwardingObject
        /* renamed from: delegate  reason: collision with other method in class */
        public final Map<K, V> mo31delegate() {
            return AbstractNavigableMap.this;
        }

        @Override // java.util.NavigableMap, java.util.SortedMap
        public SortedMap<K, V> headMap(K toKey) {
            return headMap(toKey, false);
        }

        @Override // java.util.NavigableMap, java.util.SortedMap
        public SortedMap<K, V> subMap(K fromKey, K toKey) {
            return subMap(fromKey, true, toKey, false);
        }

        @Override // java.util.NavigableMap, java.util.SortedMap
        public SortedMap<K, V> tailMap(K fromKey) {
            return tailMap(fromKey, true);
        }
    }

    /* loaded from: classes.dex */
    public static class NavigableKeySet<K, V> extends SortedKeySet<K, V> implements NavigableSet<K> {
        public NavigableKeySet(NavigableMap<K, V> map) {
            super(map);
        }

        @Override // java.util.NavigableSet
        public K ceiling(K e) {
            return (K) ((NavigableMap) this.map).ceilingKey(e);
        }

        @Override // java.util.NavigableSet
        public Iterator<K> descendingIterator() {
            return descendingSet().iterator();
        }

        @Override // java.util.NavigableSet
        public NavigableSet<K> descendingSet() {
            return ((NavigableMap) this.map).descendingKeySet();
        }

        @Override // java.util.NavigableSet
        public K floor(K e) {
            return (K) ((NavigableMap) this.map).floorKey(e);
        }

        @Override // java.util.NavigableSet
        public NavigableSet<K> headSet(K toElement, boolean inclusive) {
            return ((NavigableMap) this.map).headMap(toElement, inclusive).navigableKeySet();
        }

        @Override // java.util.NavigableSet
        public K higher(K e) {
            return (K) ((NavigableMap) this.map).higherKey(e);
        }

        @Override // java.util.NavigableSet
        public K lower(K e) {
            return (K) ((NavigableMap) this.map).lowerKey(e);
        }

        @Override // com.google.common.collect.Maps.KeySet
        public Map map() {
            return (NavigableMap) this.map;
        }

        @Override // java.util.NavigableSet
        public K pollFirst() {
            return (K) Maps.keyOrNull(((NavigableMap) this.map).pollFirstEntry());
        }

        @Override // java.util.NavigableSet
        public K pollLast() {
            return (K) Maps.keyOrNull(((NavigableMap) this.map).pollLastEntry());
        }

        @Override // java.util.NavigableSet
        public NavigableSet<K> subSet(K fromElement, boolean fromInclusive, K toElement, boolean toInclusive) {
            return ((NavigableMap) this.map).subMap(fromElement, fromInclusive, toElement, toInclusive).navigableKeySet();
        }

        @Override // java.util.NavigableSet
        public NavigableSet<K> tailSet(K fromElement, boolean inclusive) {
            return ((NavigableMap) this.map).tailMap(fromElement, inclusive).navigableKeySet();
        }

        @Override // java.util.SortedSet, java.util.NavigableSet
        public SortedSet<K> headSet(K toElement) {
            return ((NavigableMap) this.map).headMap(toElement, false).navigableKeySet();
        }

        @Override // java.util.SortedSet, java.util.NavigableSet
        public SortedSet<K> subSet(K fromElement, K toElement) {
            return ((NavigableMap) this.map).subMap(fromElement, true, toElement, false).navigableKeySet();
        }

        @Override // java.util.SortedSet, java.util.NavigableSet
        public SortedSet<K> tailSet(K fromElement) {
            return ((NavigableMap) this.map).tailMap(fromElement, true).navigableKeySet();
        }
    }
}
