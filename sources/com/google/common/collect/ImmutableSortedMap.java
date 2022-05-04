package com.google.common.collect;

import com.bumptech.glide.Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline1;
import com.google.common.base.Strings;
import com.google.common.collect.ImmutableCollection;
import com.google.common.collect.ImmutableMap;
import java.util.AbstractMap;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Map;
import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.Objects;
import java.util.Set;
import java.util.SortedMap;
/* loaded from: classes.dex */
public final class ImmutableSortedMap<K, V> extends ImmutableSortedMapFauxverideShim<K, V> implements NavigableMap<K, V> {
    public static final ImmutableSortedMap<Comparable, Object> NATURAL_EMPTY_MAP;
    private static final long serialVersionUID = 0;
    public transient ImmutableSortedMap<K, V> descendingMap;
    public final transient RegularImmutableSortedSet<K> keySet;
    public final transient ImmutableList<V> valueList;

    /* loaded from: classes.dex */
    public static class Builder<K, V> extends ImmutableMap.Builder<K, V> {
        public final Comparator<? super K> comparator;
        public transient Object[] keys = new Object[4];
        public transient Object[] values = new Object[4];

        public Builder(Comparator<? super K> comparator) {
            super(4);
            Objects.requireNonNull(comparator);
            this.comparator = comparator;
        }

        @Override // com.google.common.collect.ImmutableMap.Builder
        public ImmutableMap build() {
            int i = this.size;
            if (i == 0) {
                return ImmutableSortedMap.emptyMap(this.comparator);
            }
            if (i != 1) {
                Object[] copyOf = Arrays.copyOf(this.keys, i);
                Arrays.sort(copyOf, this.comparator);
                int i2 = this.size;
                Object[] objArr = new Object[i2];
                for (int i3 = 0; i3 < this.size; i3++) {
                    if (i3 > 0) {
                        int i4 = i3 - 1;
                        if (this.comparator.compare(copyOf[i4], copyOf[i3]) == 0) {
                            String valueOf = String.valueOf(copyOf[i4]);
                            String valueOf2 = String.valueOf(copyOf[i3]);
                            throw new IllegalArgumentException(Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline1.m(valueOf2.length() + valueOf.length() + 57, "keys required to be distinct but compared as equal: ", valueOf, " and ", valueOf2));
                        }
                    }
                    objArr[Arrays.binarySearch(copyOf, this.keys[i3], this.comparator)] = this.values[i3];
                }
                return new ImmutableSortedMap(new RegularImmutableSortedSet(ImmutableList.asImmutableList(copyOf), this.comparator), ImmutableList.asImmutableList(objArr, i2));
            }
            Comparator<? super K> comparator = this.comparator;
            Object obj = this.keys[0];
            Object obj2 = this.values[0];
            ImmutableList of = ImmutableList.of(obj);
            Objects.requireNonNull(comparator);
            return new ImmutableSortedMap(new RegularImmutableSortedSet(of, comparator), ImmutableList.of(obj2));
        }

        @Override // com.google.common.collect.ImmutableMap.Builder
        public ImmutableMap.Builder put(Map.Entry entry) {
            put(entry.getKey(), entry.getValue());
            return this;
        }

        @Override // com.google.common.collect.ImmutableMap.Builder
        public ImmutableMap.Builder putAll(Iterable entries) {
            super.putAll(entries);
            return this;
        }

        @Override // com.google.common.collect.ImmutableMap.Builder
        public ImmutableMap.Builder put(Object key, Object value) {
            int i = this.size + 1;
            Object[] objArr = this.keys;
            if (i > objArr.length) {
                int expandedCapacity = ImmutableCollection.Builder.expandedCapacity(objArr.length, i);
                this.keys = Arrays.copyOf(this.keys, expandedCapacity);
                this.values = Arrays.copyOf(this.values, expandedCapacity);
            }
            CollectPreconditions.checkEntryNotNull(key, value);
            Object[] objArr2 = this.keys;
            int i2 = this.size;
            objArr2[i2] = key;
            this.values[i2] = value;
            this.size = i2 + 1;
            return this;
        }
    }

    /* loaded from: classes.dex */
    public static class SerializedForm extends ImmutableMap.SerializedForm {
        private static final long serialVersionUID = 0;
        private final Comparator<Object> comparator;

        public SerializedForm(ImmutableSortedMap<?, ?> sortedMap) {
            super(sortedMap);
            this.comparator = sortedMap.keySet.comparator;
        }

        @Override // com.google.common.collect.ImmutableMap.SerializedForm
        public Object readResolve() {
            return createMap(new Builder(this.comparator));
        }
    }

    static {
        RegularImmutableSortedSet emptySet = ImmutableSortedSet.emptySet(NaturalOrdering.INSTANCE);
        AbstractIndexedListIterator<Object> abstractIndexedListIterator = ImmutableList.EMPTY_ITR;
        NATURAL_EMPTY_MAP = new ImmutableSortedMap<>(emptySet, RegularImmutableList.EMPTY);
    }

    public ImmutableSortedMap(RegularImmutableSortedSet<K> keySet, ImmutableList<V> valueList) {
        this.keySet = keySet;
        this.valueList = valueList;
        this.descendingMap = null;
    }

    public static <K, V> ImmutableSortedMap<K, V> emptyMap(Comparator<? super K> comparator) {
        if (NaturalOrdering.INSTANCE.equals(comparator)) {
            return (ImmutableSortedMap<K, V>) NATURAL_EMPTY_MAP;
        }
        return new ImmutableSortedMap<>(ImmutableSortedSet.emptySet(comparator), RegularImmutableList.EMPTY);
    }

    @Override // java.util.NavigableMap
    public Map.Entry<K, V> ceilingEntry(K key) {
        return tailMap((ImmutableSortedMap<K, V>) key, true).firstEntry();
    }

    @Override // java.util.NavigableMap
    public K ceilingKey(K key) {
        return (K) Maps.keyOrNull(tailMap((ImmutableSortedMap<K, V>) key, true).firstEntry());
    }

    @Override // java.util.SortedMap
    public Comparator<? super K> comparator() {
        return this.keySet.comparator;
    }

    @Override // com.google.common.collect.ImmutableMap
    public ImmutableSet<Map.Entry<K, V>> createEntrySet() {
        if (!isEmpty()) {
            return new ImmutableMapEntrySet<K, V>() { // from class: com.google.common.collect.ImmutableSortedMap.1EntrySet
                @Override // com.google.common.collect.ImmutableSet
                public ImmutableList<Map.Entry<K, V>> createAsList() {
                    return new ImmutableList<Map.Entry<K, V>>() { // from class: com.google.common.collect.ImmutableSortedMap.1EntrySet.1
                        @Override // java.util.List
                        public Object get(int index) {
                            return new AbstractMap.SimpleImmutableEntry(ImmutableSortedMap.this.keySet.elements.get(index), ImmutableSortedMap.this.valueList.get(index));
                        }

                        @Override // com.google.common.collect.ImmutableCollection
                        public boolean isPartialView() {
                            return true;
                        }

                        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
                        public int size() {
                            return ImmutableSortedMap.this.size();
                        }
                    };
                }

                @Override // com.google.common.collect.ImmutableMapEntrySet, com.google.common.collect.ImmutableSet, com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
                public UnmodifiableIterator<Map.Entry<K, V>> iterator() {
                    return asList().iterator();
                }

                @Override // com.google.common.collect.ImmutableMapEntrySet
                public ImmutableMap<K, V> map() {
                    return ImmutableSortedMap.this;
                }
            };
        }
        int i = ImmutableSet.$r8$clinit;
        return RegularImmutableSet.EMPTY;
    }

    @Override // com.google.common.collect.ImmutableMap
    public ImmutableSet<K> createKeySet() {
        throw new AssertionError("should never be called");
    }

    @Override // com.google.common.collect.ImmutableMap
    public ImmutableCollection<V> createValues() {
        throw new AssertionError("should never be called");
    }

    @Override // java.util.NavigableMap
    public NavigableSet descendingKeySet() {
        return this.keySet.descendingSet();
    }

    @Override // java.util.NavigableMap
    public NavigableMap descendingMap() {
        ImmutableSortedMap<K, V> immutableSortedMap = this.descendingMap;
        if (immutableSortedMap == null) {
            if (isEmpty()) {
                return emptyMap(Ordering.from(this.keySet.comparator).reverse());
            }
            immutableSortedMap = new ImmutableSortedMap<>((RegularImmutableSortedSet) this.keySet.descendingSet(), this.valueList.reverse(), this);
        }
        return immutableSortedMap;
    }

    @Override // com.google.common.collect.ImmutableMap, java.util.Map
    /* renamed from: entrySet */
    public ImmutableSet<Map.Entry<K, V>> mo22entrySet() {
        return super.entrySet();
    }

    @Override // java.util.NavigableMap
    public Map.Entry<K, V> firstEntry() {
        if (isEmpty()) {
            return null;
        }
        return super.entrySet().asList().get(0);
    }

    @Override // java.util.SortedMap
    public K firstKey() {
        return this.keySet.first();
    }

    @Override // java.util.NavigableMap
    public Map.Entry<K, V> floorEntry(K key) {
        return headMap((ImmutableSortedMap<K, V>) key, true).lastEntry();
    }

    @Override // java.util.NavigableMap
    public K floorKey(K key) {
        return (K) Maps.keyOrNull(headMap((ImmutableSortedMap<K, V>) key, true).lastEntry());
    }

    /* JADX WARN: Code restructure failed: missing block: B:5:0x0011, code lost:
        if (r4 >= 0) goto L7;
     */
    @Override // com.google.common.collect.ImmutableMap, java.util.Map
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public V get(java.lang.Object r4) {
        /*
            r3 = this;
            com.google.common.collect.RegularImmutableSortedSet<K> r0 = r3.keySet
            java.util.Objects.requireNonNull(r0)
            r1 = -1
            if (r4 != 0) goto L9
            goto L14
        L9:
            com.google.common.collect.ImmutableList<E> r2 = r0.elements     // Catch: java.lang.ClassCastException -> L14
            java.util.Comparator<? super E> r0 = r0.comparator     // Catch: java.lang.ClassCastException -> L14
            int r4 = java.util.Collections.binarySearch(r2, r4, r0)     // Catch: java.lang.ClassCastException -> L14
            if (r4 < 0) goto L14
            goto L15
        L14:
            r4 = r1
        L15:
            if (r4 != r1) goto L19
            r3 = 0
            goto L1f
        L19:
            com.google.common.collect.ImmutableList<V> r3 = r3.valueList
            java.lang.Object r3 = r3.get(r4)
        L1f:
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.common.collect.ImmutableSortedMap.get(java.lang.Object):java.lang.Object");
    }

    public final ImmutableSortedMap<K, V> getSubMap(int fromIndex, int toIndex) {
        if (fromIndex == 0 && toIndex == size()) {
            return this;
        }
        if (fromIndex == toIndex) {
            return emptyMap(this.keySet.comparator);
        }
        return new ImmutableSortedMap<>(this.keySet.getSubSet(fromIndex, toIndex), this.valueList.subList(fromIndex, toIndex));
    }

    @Override // java.util.NavigableMap
    public Map.Entry<K, V> higherEntry(K key) {
        return tailMap((ImmutableSortedMap<K, V>) key, false).firstEntry();
    }

    @Override // java.util.NavigableMap
    public K higherKey(K key) {
        return (K) Maps.keyOrNull(tailMap((ImmutableSortedMap<K, V>) key, false).firstEntry());
    }

    @Override // com.google.common.collect.ImmutableMap
    public boolean isPartialView() {
        return this.keySet.isPartialView() || this.valueList.isPartialView();
    }

    @Override // com.google.common.collect.ImmutableMap, java.util.Map
    /* renamed from: keySet */
    public ImmutableSet mo23keySet() {
        return this.keySet;
    }

    @Override // java.util.NavigableMap
    public Map.Entry<K, V> lastEntry() {
        if (isEmpty()) {
            return null;
        }
        return super.entrySet().asList().get(size() - 1);
    }

    @Override // java.util.SortedMap
    public K lastKey() {
        return this.keySet.last();
    }

    @Override // java.util.NavigableMap
    public Map.Entry<K, V> lowerEntry(K key) {
        return headMap((ImmutableSortedMap<K, V>) key, false).lastEntry();
    }

    @Override // java.util.NavigableMap
    public K lowerKey(K key) {
        return (K) Maps.keyOrNull(headMap((ImmutableSortedMap<K, V>) key, false).lastEntry());
    }

    @Override // java.util.NavigableMap
    public NavigableSet navigableKeySet() {
        return this.keySet;
    }

    @Override // java.util.NavigableMap
    @Deprecated
    public final Map.Entry<K, V> pollFirstEntry() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.NavigableMap
    @Deprecated
    public final Map.Entry<K, V> pollLastEntry() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public int size() {
        return this.valueList.size();
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // java.util.NavigableMap, java.util.SortedMap
    public SortedMap tailMap(Object fromKey) {
        return tailMap((ImmutableSortedMap<K, V>) fromKey, true);
    }

    @Override // com.google.common.collect.ImmutableMap, java.util.Map
    /* renamed from: values */
    public ImmutableCollection<V> mo25values() {
        return this.valueList;
    }

    @Override // com.google.common.collect.ImmutableMap
    public Object writeReplace() {
        return new SerializedForm(this);
    }

    @Override // com.google.common.collect.ImmutableMap, java.util.Map
    /* renamed from: entrySet  reason: collision with other method in class */
    public Set mo22entrySet() {
        return super.entrySet();
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // java.util.NavigableMap, java.util.SortedMap
    public SortedMap headMap(Object toKey) {
        return headMap((ImmutableSortedMap<K, V>) toKey, false);
    }

    @Override // com.google.common.collect.ImmutableMap, java.util.Map
    /* renamed from: keySet  reason: collision with other method in class */
    public Set mo23keySet() {
        return this.keySet;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // java.util.NavigableMap, java.util.SortedMap
    public SortedMap subMap(Object fromKey, Object toKey) {
        return subMap((boolean) fromKey, true, (boolean) toKey, false);
    }

    @Override // java.util.NavigableMap
    public ImmutableSortedMap<K, V> tailMap(K fromKey, boolean inclusive) {
        RegularImmutableSortedSet<K> regularImmutableSortedSet = this.keySet;
        Objects.requireNonNull(fromKey);
        return getSubMap(regularImmutableSortedSet.tailIndex(fromKey, inclusive), size());
    }

    @Override // com.google.common.collect.ImmutableMap, java.util.Map
    /* renamed from: values  reason: collision with other method in class */
    public Collection mo25values() {
        return this.valueList;
    }

    @Override // java.util.NavigableMap
    public ImmutableSortedMap<K, V> headMap(K toKey, boolean inclusive) {
        RegularImmutableSortedSet<K> regularImmutableSortedSet = this.keySet;
        Objects.requireNonNull(toKey);
        int binarySearch = Collections.binarySearch(regularImmutableSortedSet.elements, toKey, regularImmutableSortedSet.comparator);
        if (binarySearch < 0) {
            binarySearch = ~binarySearch;
        } else if (inclusive) {
            binarySearch++;
        }
        return getSubMap(0, binarySearch);
    }

    @Override // java.util.NavigableMap
    public ImmutableSortedMap<K, V> subMap(K fromKey, boolean fromInclusive, K toKey, boolean toInclusive) {
        Objects.requireNonNull(fromKey);
        Objects.requireNonNull(toKey);
        if (this.keySet.comparator.compare(fromKey, toKey) <= 0) {
            ImmutableSortedMap<K, V> headMap = headMap((ImmutableSortedMap<K, V>) toKey, toInclusive);
            return headMap.getSubMap(headMap.keySet.tailIndex(fromKey, fromInclusive), headMap.size());
        }
        throw new IllegalArgumentException(Strings.lenientFormat("expected fromKey <= toKey but %s > %s", fromKey, toKey));
    }

    public ImmutableSortedMap(RegularImmutableSortedSet<K> keySet, ImmutableList<V> valueList, ImmutableSortedMap<K, V> descendingMap) {
        this.keySet = keySet;
        this.valueList = valueList;
        this.descendingMap = descendingMap;
    }

    @Override // java.util.NavigableMap
    /* renamed from: tailMap  reason: collision with other method in class */
    public NavigableMap mo24tailMap(Object fromKey, boolean inclusive) {
        RegularImmutableSortedSet<K> regularImmutableSortedSet = this.keySet;
        Objects.requireNonNull(fromKey);
        return getSubMap(regularImmutableSortedSet.tailIndex(fromKey, inclusive), size());
    }
}
