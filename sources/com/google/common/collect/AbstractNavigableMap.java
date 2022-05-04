package com.google.common.collect;

import com.google.common.collect.Maps;
import com.google.common.collect.TreeRangeSet$RangesByUpperBound;
import java.util.Map;
import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.SortedMap;
/* loaded from: classes.dex */
public abstract class AbstractNavigableMap<K, V> extends Maps.IteratorBasedAbstractMap<K, V> implements NavigableMap<K, V> {

    /* loaded from: classes.dex */
    public final class DescendingMap extends Maps.DescendingMap<K, V> {
        public DescendingMap() {
        }
    }

    @Override // java.util.NavigableMap
    public final Map.Entry<K, V> ceilingEntry(K key) {
        return tailMap(key, true).firstEntry();
    }

    public abstract TreeRangeSet$RangesByUpperBound.AnonymousClass2 descendingEntryIterator();

    @Override // java.util.NavigableMap
    public final Map.Entry<K, V> floorEntry(K key) {
        return headMap(key, true).lastEntry();
    }

    @Override // java.util.NavigableMap, java.util.SortedMap
    public final SortedMap<K, V> headMap(K toKey) {
        return headMap(toKey, false);
    }

    @Override // java.util.NavigableMap
    public final Map.Entry<K, V> higherEntry(K key) {
        return tailMap(key, false).firstEntry();
    }

    @Override // java.util.NavigableMap
    public final Map.Entry<K, V> lowerEntry(K key) {
        return headMap(key, false).lastEntry();
    }

    @Override // java.util.NavigableMap, java.util.SortedMap
    public final SortedMap<K, V> subMap(K fromKey, K toKey) {
        return subMap(fromKey, true, toKey, false);
    }

    @Override // java.util.NavigableMap, java.util.SortedMap
    public final SortedMap<K, V> tailMap(K fromKey) {
        return tailMap(fromKey, true);
    }

    @Override // java.util.NavigableMap
    public final NavigableMap<K, V> descendingMap() {
        return new DescendingMap();
    }

    @Override // java.util.NavigableMap
    public final NavigableSet<K> navigableKeySet() {
        return new Maps.NavigableKeySet(this);
    }

    @Override // java.util.NavigableMap
    public final K ceilingKey(K key) {
        return (K) Maps.keyOrNull(ceilingEntry(key));
    }

    @Override // java.util.NavigableMap
    public final NavigableSet<K> descendingKeySet() {
        return descendingMap().navigableKeySet();
    }

    @Override // java.util.NavigableMap
    public final Map.Entry<K, V> firstEntry() {
        return (Map.Entry) Iterators.getNext(entryIterator());
    }

    @Override // java.util.SortedMap
    public final K firstKey() {
        Map.Entry<K, V> firstEntry = firstEntry();
        if (firstEntry != null) {
            return firstEntry.getKey();
        }
        throw new NoSuchElementException();
    }

    @Override // java.util.NavigableMap
    public final K floorKey(K key) {
        return (K) Maps.keyOrNull(floorEntry(key));
    }

    @Override // java.util.NavigableMap
    public final K higherKey(K key) {
        return (K) Maps.keyOrNull(higherEntry(key));
    }

    @Override // java.util.AbstractMap, java.util.Map, java.util.SortedMap
    public final Set<K> keySet() {
        return navigableKeySet();
    }

    @Override // java.util.NavigableMap
    public final Map.Entry<K, V> lastEntry() {
        return (Map.Entry) Iterators.getNext(descendingEntryIterator());
    }

    @Override // java.util.SortedMap
    public final K lastKey() {
        Map.Entry<K, V> lastEntry = lastEntry();
        if (lastEntry != null) {
            return lastEntry.getKey();
        }
        throw new NoSuchElementException();
    }

    @Override // java.util.NavigableMap
    public final K lowerKey(K key) {
        return (K) Maps.keyOrNull(lowerEntry(key));
    }

    @Override // java.util.NavigableMap
    public final Map.Entry<K, V> pollFirstEntry() {
        return (Map.Entry) Iterators.pollNext(entryIterator());
    }

    @Override // java.util.NavigableMap
    public final Map.Entry<K, V> pollLastEntry() {
        return (Map.Entry) Iterators.pollNext(descendingEntryIterator());
    }
}
