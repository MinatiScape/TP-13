package com.google.common.collect;

import androidx.fragment.R$id$$ExternalSyntheticOutline0;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import java.io.IOException;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.AbstractCollection;
import java.util.AbstractMap;
import java.util.AbstractSet;
import java.util.Arrays;
import java.util.Collection;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;
/* loaded from: classes.dex */
public class CompactHashMap<K, V> extends AbstractMap<K, V> implements Serializable {
    public static final /* synthetic */ int $r8$clinit = 0;
    public transient long[] entries;
    public transient Set<Map.Entry<K, V>> entrySetView;
    public transient Set<K> keySetView;
    public transient Object[] keys;
    public transient int modCount;
    public transient int size;
    public transient int[] table;
    public transient Object[] values;
    public transient Collection<V> valuesView;

    /* loaded from: classes.dex */
    public class EntrySetView extends AbstractSet<Map.Entry<K, V>> {
        public EntrySetView() {
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public void clear() {
            CompactHashMap.this.clear();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean contains(Object o) {
            if (!(o instanceof Map.Entry)) {
                return false;
            }
            Map.Entry entry = (Map.Entry) o;
            int indexOf = CompactHashMap.this.indexOf(entry.getKey());
            return indexOf != -1 && Objects.equal(CompactHashMap.this.values[indexOf], entry.getValue());
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public Iterator<Map.Entry<K, V>> iterator() {
            final CompactHashMap compactHashMap = CompactHashMap.this;
            java.util.Objects.requireNonNull(compactHashMap);
            return new CompactHashMap<?, ?>.Itr<Map.Entry<?, ?>>() { // from class: com.google.common.collect.CompactHashMap.2
                @Override // com.google.common.collect.CompactHashMap.Itr
                public Map.Entry<?, ?> getOutput(int entry) {
                    return new MapEntry(entry);
                }
            };
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean remove(Object o) {
            if (!(o instanceof Map.Entry)) {
                return false;
            }
            Map.Entry entry = (Map.Entry) o;
            int indexOf = CompactHashMap.this.indexOf(entry.getKey());
            if (indexOf == -1 || !Objects.equal(CompactHashMap.this.values[indexOf], entry.getValue())) {
                return false;
            }
            CompactHashMap.access$000(CompactHashMap.this, indexOf);
            return true;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public int size() {
            return CompactHashMap.this.size;
        }
    }

    /* loaded from: classes.dex */
    public abstract class Itr<T> implements Iterator<T> {
        public int currentIndex;
        public int expectedModCount;
        public int indexToRemove = -1;

        public Itr(AnonymousClass1 r2) {
            this.expectedModCount = CompactHashMap.this.modCount;
            this.currentIndex = CompactHashMap.this.firstEntryIndex();
        }

        public abstract T getOutput(int entry);

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this.currentIndex >= 0;
        }

        @Override // java.util.Iterator
        public T next() {
            if (CompactHashMap.this.modCount != this.expectedModCount) {
                throw new ConcurrentModificationException();
            } else if (hasNext()) {
                int i = this.currentIndex;
                this.indexToRemove = i;
                T output = getOutput(i);
                this.currentIndex = CompactHashMap.this.getSuccessor(this.currentIndex);
                return output;
            } else {
                throw new NoSuchElementException();
            }
        }

        @Override // java.util.Iterator
        public void remove() {
            if (CompactHashMap.this.modCount == this.expectedModCount) {
                Preconditions.checkState(this.indexToRemove >= 0, "no calls to next() since the last call to remove()");
                this.expectedModCount++;
                CompactHashMap.access$000(CompactHashMap.this, this.indexToRemove);
                this.currentIndex = CompactHashMap.this.adjustAfterRemove(this.currentIndex, this.indexToRemove);
                this.indexToRemove = -1;
                return;
            }
            throw new ConcurrentModificationException();
        }
    }

    /* loaded from: classes.dex */
    public class KeySetView extends AbstractSet<K> {
        public KeySetView() {
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public void clear() {
            CompactHashMap.this.clear();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean contains(Object o) {
            return CompactHashMap.this.containsKey(o);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public Iterator<K> iterator() {
            final CompactHashMap compactHashMap = CompactHashMap.this;
            java.util.Objects.requireNonNull(compactHashMap);
            return new CompactHashMap<?, ?>.Itr<?>() { // from class: com.google.common.collect.CompactHashMap.1
                @Override // com.google.common.collect.CompactHashMap.Itr
                public Object getOutput(int entry) {
                    return CompactHashMap.this.keys[entry];
                }
            };
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean remove(Object o) {
            int indexOf = CompactHashMap.this.indexOf(o);
            if (indexOf == -1) {
                return false;
            }
            CompactHashMap.access$000(CompactHashMap.this, indexOf);
            return true;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public int size() {
            return CompactHashMap.this.size;
        }
    }

    /* loaded from: classes.dex */
    public final class MapEntry extends AbstractMapEntry<K, V> {
        public final K key;
        public int lastKnownIndex;

        public MapEntry(int index) {
            this.key = (K) CompactHashMap.this.keys[index];
            this.lastKnownIndex = index;
        }

        @Override // com.google.common.collect.AbstractMapEntry, java.util.Map.Entry
        public K getKey() {
            return this.key;
        }

        @Override // com.google.common.collect.AbstractMapEntry, java.util.Map.Entry
        public V getValue() {
            updateLastKnownIndex();
            int i = this.lastKnownIndex;
            if (i == -1) {
                return null;
            }
            return (V) CompactHashMap.this.values[i];
        }

        @Override // java.util.Map.Entry
        public V setValue(V value) {
            updateLastKnownIndex();
            int i = this.lastKnownIndex;
            if (i == -1) {
                CompactHashMap.this.put(this.key, value);
                return null;
            }
            Object[] objArr = CompactHashMap.this.values;
            V v = (V) objArr[i];
            objArr[i] = value;
            return v;
        }

        public final void updateLastKnownIndex() {
            int i = this.lastKnownIndex;
            if (i != -1) {
                CompactHashMap compactHashMap = CompactHashMap.this;
                if (i < compactHashMap.size && Objects.equal(this.key, compactHashMap.keys[i])) {
                    return;
                }
            }
            CompactHashMap compactHashMap2 = CompactHashMap.this;
            K k = this.key;
            int i2 = CompactHashMap.$r8$clinit;
            this.lastKnownIndex = compactHashMap2.indexOf(k);
        }
    }

    /* loaded from: classes.dex */
    public class ValuesView extends AbstractCollection<V> {
        public ValuesView() {
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public void clear() {
            CompactHashMap.this.clear();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
        public Iterator<V> iterator() {
            final CompactHashMap compactHashMap = CompactHashMap.this;
            java.util.Objects.requireNonNull(compactHashMap);
            return new CompactHashMap<?, ?>.Itr<?>() { // from class: com.google.common.collect.CompactHashMap.3
                @Override // com.google.common.collect.CompactHashMap.Itr
                public Object getOutput(int entry) {
                    return CompactHashMap.this.values[entry];
                }
            };
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public int size() {
            return CompactHashMap.this.size;
        }
    }

    public CompactHashMap() {
        init(3);
    }

    public static Object access$000(CompactHashMap compactHashMap, int i) {
        return compactHashMap.remove(compactHashMap.keys[i], getHash(compactHashMap.entries[i]));
    }

    public static int getHash(long entry) {
        return (int) (entry >>> 32);
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void readObject(ObjectInputStream stream) throws IOException, ClassNotFoundException {
        stream.defaultReadObject();
        int readInt = stream.readInt();
        if (readInt >= 0) {
            init(readInt);
            for (int i = 0; i < readInt; i++) {
                put(stream.readObject(), stream.readObject());
            }
            return;
        }
        throw new InvalidObjectException(R$id$$ExternalSyntheticOutline0.m(25, "Invalid size: ", readInt));
    }

    public static long swapNext(long entry, int newNext) {
        return (entry & (-4294967296L)) | (newNext & 4294967295L);
    }

    private void writeObject(ObjectOutputStream stream) throws IOException {
        stream.defaultWriteObject();
        stream.writeInt(this.size);
        int firstEntryIndex = firstEntryIndex();
        while (firstEntryIndex >= 0) {
            stream.writeObject(this.keys[firstEntryIndex]);
            stream.writeObject(this.values[firstEntryIndex]);
            firstEntryIndex = getSuccessor(firstEntryIndex);
        }
    }

    public void accessEntry(int index) {
    }

    public int adjustAfterRemove(int indexBeforeRemove, int indexRemoved) {
        return indexBeforeRemove - 1;
    }

    public void allocArrays() {
        Preconditions.checkState(needsAllocArrays(), "Arrays already allocated");
        int i = this.modCount;
        int[] iArr = new int[Hashing.closedTableSize(i, 1.0d)];
        Arrays.fill(iArr, -1);
        this.table = iArr;
        long[] jArr = new long[i];
        Arrays.fill(jArr, -1L);
        this.entries = jArr;
        this.keys = new Object[i];
        this.values = new Object[i];
    }

    @Override // java.util.AbstractMap, java.util.Map
    public void clear() {
        if (!needsAllocArrays()) {
            this.modCount++;
            Arrays.fill(this.keys, 0, this.size, (Object) null);
            Arrays.fill(this.values, 0, this.size, (Object) null);
            Arrays.fill(this.table, -1);
            Arrays.fill(this.entries, 0, this.size, -1L);
            this.size = 0;
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public boolean containsKey(Object key) {
        return indexOf(key) != -1;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public boolean containsValue(Object value) {
        for (int i = 0; i < this.size; i++) {
            if (Objects.equal(value, this.values[i])) {
                return true;
            }
        }
        return false;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public Set<Map.Entry<K, V>> entrySet() {
        Set<Map.Entry<K, V>> set = this.entrySetView;
        if (set != null) {
            return set;
        }
        EntrySetView entrySetView = new EntrySetView();
        this.entrySetView = entrySetView;
        return entrySetView;
    }

    public int firstEntryIndex() {
        return isEmpty() ? -1 : 0;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public V get(Object key) {
        int indexOf = indexOf(key);
        accessEntry(indexOf);
        if (indexOf == -1) {
            return null;
        }
        return (V) this.values[indexOf];
    }

    public int getSuccessor(int entryIndex) {
        int i = entryIndex + 1;
        if (i < this.size) {
            return i;
        }
        return -1;
    }

    public final int hashTableMask() {
        return this.table.length - 1;
    }

    public final int indexOf(Object key) {
        if (needsAllocArrays()) {
            return -1;
        }
        int smearedHash = Hashing.smearedHash(key);
        int i = this.table[hashTableMask() & smearedHash];
        while (i != -1) {
            long j = this.entries[i];
            if (getHash(j) == smearedHash && Objects.equal(key, this.keys[i])) {
                return i;
            }
            i = (int) j;
        }
        return -1;
    }

    public void init(int expectedSize) {
        Preconditions.checkArgument(expectedSize >= 0, "Expected size must be non-negative");
        this.modCount = Math.max(1, expectedSize);
    }

    public void insertEntry(int entryIndex, K key, V value, int hash) {
        this.entries[entryIndex] = (hash << 32) | 4294967295L;
        this.keys[entryIndex] = key;
        this.values[entryIndex] = value;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public boolean isEmpty() {
        return this.size == 0;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public Set<K> keySet() {
        Set<K> set = this.keySetView;
        if (set != null) {
            return set;
        }
        KeySetView keySetView = new KeySetView();
        this.keySetView = keySetView;
        return keySetView;
    }

    public void moveLastEntry(int dstIndex) {
        int i = this.size - 1;
        if (dstIndex < i) {
            Object[] objArr = this.keys;
            objArr[dstIndex] = objArr[i];
            Object[] objArr2 = this.values;
            objArr2[dstIndex] = objArr2[i];
            objArr[i] = null;
            objArr2[i] = null;
            long[] jArr = this.entries;
            long j = jArr[i];
            jArr[dstIndex] = j;
            jArr[i] = -1;
            int hash = getHash(j) & hashTableMask();
            int[] iArr = this.table;
            int i2 = iArr[hash];
            if (i2 == i) {
                iArr[hash] = dstIndex;
                return;
            }
            while (true) {
                long[] jArr2 = this.entries;
                long j2 = jArr2[i2];
                int i3 = (int) j2;
                if (i3 == i) {
                    jArr2[i2] = swapNext(j2, dstIndex);
                    return;
                }
                i2 = i3;
            }
        } else {
            this.keys[dstIndex] = null;
            this.values[dstIndex] = null;
            this.entries[dstIndex] = -1;
        }
    }

    public boolean needsAllocArrays() {
        return this.table == null;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public V put(K key, V value) {
        if (needsAllocArrays()) {
            allocArrays();
        }
        long[] jArr = this.entries;
        Object[] objArr = this.keys;
        Object[] objArr2 = this.values;
        int smearedHash = Hashing.smearedHash(key);
        int hashTableMask = hashTableMask() & smearedHash;
        int i = this.size;
        int[] iArr = this.table;
        int i2 = iArr[hashTableMask];
        if (i2 == -1) {
            iArr[hashTableMask] = i;
        } else {
            while (true) {
                long j = jArr[i2];
                if (getHash(j) != smearedHash || !Objects.equal(key, objArr[i2])) {
                    int i3 = (int) j;
                    if (i3 == -1) {
                        jArr[i2] = swapNext(j, i);
                        break;
                    }
                    i2 = i3;
                } else {
                    V v = (V) objArr2[i2];
                    objArr2[i2] = value;
                    accessEntry(i2);
                    return v;
                }
            }
        }
        int i4 = Integer.MAX_VALUE;
        if (i != Integer.MAX_VALUE) {
            int i5 = i + 1;
            int length = this.entries.length;
            if (i5 > length) {
                int max = Math.max(1, length >>> 1) + length;
                if (max >= 0) {
                    i4 = max;
                }
                if (i4 != length) {
                    resizeEntries(i4);
                }
            }
            insertEntry(i, key, value, smearedHash);
            this.size = i5;
            int length2 = this.table.length;
            if (Hashing.needsResizing(i, length2, 1.0d)) {
                int i6 = length2 * 2;
                int[] iArr2 = new int[i6];
                Arrays.fill(iArr2, -1);
                long[] jArr2 = this.entries;
                int i7 = i6 - 1;
                for (int i8 = 0; i8 < this.size; i8++) {
                    int hash = getHash(jArr2[i8]);
                    int i9 = hash & i7;
                    int i10 = iArr2[i9];
                    iArr2[i9] = i8;
                    jArr2[i8] = (hash << 32) | (i10 & 4294967295L);
                }
                this.table = iArr2;
            }
            this.modCount++;
            return null;
        }
        throw new IllegalStateException("Cannot contain more than Integer.MAX_VALUE elements!");
    }

    @Override // java.util.AbstractMap, java.util.Map
    public V remove(Object key) {
        if (needsAllocArrays()) {
            return null;
        }
        return remove(key, Hashing.smearedHash(key));
    }

    public void resizeEntries(int newCapacity) {
        this.keys = Arrays.copyOf(this.keys, newCapacity);
        this.values = Arrays.copyOf(this.values, newCapacity);
        long[] jArr = this.entries;
        int length = jArr.length;
        long[] copyOf = Arrays.copyOf(jArr, newCapacity);
        if (newCapacity > length) {
            Arrays.fill(copyOf, length, newCapacity, -1L);
        }
        this.entries = copyOf;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public int size() {
        return this.size;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public Collection<V> values() {
        Collection<V> collection = this.valuesView;
        if (collection != null) {
            return collection;
        }
        ValuesView valuesView = new ValuesView();
        this.valuesView = valuesView;
        return valuesView;
    }

    public CompactHashMap(int expectedSize) {
        init(expectedSize);
    }

    public final V remove(Object key, int hash) {
        int hashTableMask = hashTableMask() & hash;
        int i = this.table[hashTableMask];
        if (i == -1) {
            return null;
        }
        int i2 = -1;
        while (true) {
            if (getHash(this.entries[i]) != hash || !Objects.equal(key, this.keys[i])) {
                int i3 = (int) this.entries[i];
                if (i3 == -1) {
                    return null;
                }
                i2 = i;
                i = i3;
            } else {
                V v = (V) this.values[i];
                if (i2 == -1) {
                    this.table[hashTableMask] = (int) this.entries[i];
                } else {
                    long[] jArr = this.entries;
                    jArr[i2] = swapNext(jArr[i2], (int) jArr[i]);
                }
                moveLastEntry(i);
                this.size--;
                this.modCount++;
                return v;
            }
        }
    }
}
