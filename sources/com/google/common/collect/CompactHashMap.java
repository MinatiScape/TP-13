package com.google.common.collect;

import androidx.cardview.R$style$$ExternalSyntheticOutline0;
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
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class CompactHashMap<K, V> extends AbstractMap<K, V> implements Serializable {
    public static final /* synthetic */ int $r8$clinit = 0;
    public transient long[] entries;
    public transient EntrySetView entrySetView;
    public transient KeySetView keySetView;
    public transient Object[] keys;
    public transient int modCount;
    public transient int size;
    public transient int[] table;
    public transient Object[] values;
    public transient ValuesView valuesView;

    /* loaded from: classes.dex */
    public class EntrySetView extends AbstractSet<Map.Entry<K, V>> {
        public EntrySetView() {
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final void clear() {
            CompactHashMap.this.clear();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final boolean contains(Object o) {
            if (!(o instanceof Map.Entry)) {
                return false;
            }
            Map.Entry entry = (Map.Entry) o;
            CompactHashMap compactHashMap = CompactHashMap.this;
            Object key = entry.getKey();
            int i = CompactHashMap.$r8$clinit;
            int indexOf = compactHashMap.indexOf(key);
            if (indexOf == -1 || !Objects.equal(CompactHashMap.this.values[indexOf], entry.getValue())) {
                return false;
            }
            return true;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public final Iterator<Map.Entry<K, V>> iterator() {
            final CompactHashMap compactHashMap = CompactHashMap.this;
            compactHashMap.getClass();
            return new CompactHashMap<Object, Object>.Itr<Map.Entry<Object, Object>>() { // from class: com.google.common.collect.CompactHashMap.2
                @Override // com.google.common.collect.CompactHashMap.Itr
                public final Map.Entry<Object, Object> getOutput(int entry) {
                    return new MapEntry(entry);
                }
            };
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final boolean remove(Object o) {
            if (!(o instanceof Map.Entry)) {
                return false;
            }
            Map.Entry entry = (Map.Entry) o;
            CompactHashMap compactHashMap = CompactHashMap.this;
            Object key = entry.getKey();
            int i = CompactHashMap.$r8$clinit;
            int indexOf = compactHashMap.indexOf(key);
            if (indexOf == -1 || !Objects.equal(CompactHashMap.this.values[indexOf], entry.getValue())) {
                return false;
            }
            CompactHashMap.access$000(CompactHashMap.this, indexOf);
            return true;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final int size() {
            return CompactHashMap.this.size;
        }
    }

    /* loaded from: classes.dex */
    public abstract class Itr<T> implements Iterator<T> {
        public int currentIndex;
        public int expectedModCount;
        public int indexToRemove = -1;

        public abstract T getOutput(int entry);

        public Itr() {
            this.expectedModCount = CompactHashMap.this.modCount;
            this.currentIndex = CompactHashMap.this.firstEntryIndex();
        }

        @Override // java.util.Iterator
        public final boolean hasNext() {
            if (this.currentIndex >= 0) {
                return true;
            }
            return false;
        }

        @Override // java.util.Iterator
        public final T next() {
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
        public final void remove() {
            boolean z;
            if (CompactHashMap.this.modCount == this.expectedModCount) {
                if (this.indexToRemove >= 0) {
                    z = true;
                } else {
                    z = false;
                }
                CollectPreconditions.checkRemove(z);
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
        public final void clear() {
            CompactHashMap.this.clear();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final boolean contains(Object o) {
            return CompactHashMap.this.containsKey(o);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public final Iterator<K> iterator() {
            final CompactHashMap compactHashMap = CompactHashMap.this;
            compactHashMap.getClass();
            return new CompactHashMap<Object, Object>.Itr<Object>() { // from class: com.google.common.collect.CompactHashMap.1
                @Override // com.google.common.collect.CompactHashMap.Itr
                public final Object getOutput(int entry) {
                    return CompactHashMap.this.keys[entry];
                }
            };
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final boolean remove(Object o) {
            CompactHashMap compactHashMap = CompactHashMap.this;
            int i = CompactHashMap.$r8$clinit;
            int indexOf = compactHashMap.indexOf(o);
            if (indexOf == -1) {
                return false;
            }
            CompactHashMap.access$000(CompactHashMap.this, indexOf);
            return true;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final int size() {
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

        public final void updateLastKnownIndex() {
            int i = this.lastKnownIndex;
            if (i == -1 || i >= CompactHashMap.this.size() || !Objects.equal(this.key, CompactHashMap.this.keys[this.lastKnownIndex])) {
                CompactHashMap compactHashMap = CompactHashMap.this;
                K k = this.key;
                int i2 = CompactHashMap.$r8$clinit;
                this.lastKnownIndex = compactHashMap.indexOf(k);
            }
        }

        @Override // com.google.common.collect.AbstractMapEntry, java.util.Map.Entry
        public final V getValue() {
            updateLastKnownIndex();
            int i = this.lastKnownIndex;
            if (i == -1) {
                return null;
            }
            return (V) CompactHashMap.this.values[i];
        }

        @Override // com.google.common.collect.AbstractMapEntry, java.util.Map.Entry
        public final V setValue(V value) {
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

        @Override // com.google.common.collect.AbstractMapEntry, java.util.Map.Entry
        public final K getKey() {
            return this.key;
        }
    }

    /* loaded from: classes.dex */
    public class ValuesView extends AbstractCollection<V> {
        public ValuesView() {
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public final void clear() {
            CompactHashMap.this.clear();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
        public final Iterator<V> iterator() {
            final CompactHashMap compactHashMap = CompactHashMap.this;
            compactHashMap.getClass();
            return new CompactHashMap<Object, Object>.Itr<Object>() { // from class: com.google.common.collect.CompactHashMap.3
                @Override // com.google.common.collect.CompactHashMap.Itr
                public final Object getOutput(int entry) {
                    return CompactHashMap.this.values[entry];
                }
            };
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public final int size() {
            return CompactHashMap.this.size;
        }
    }

    public CompactHashMap() {
        init(3);
    }

    public void accessEntry(int index) {
    }

    public int adjustAfterRemove(int indexBeforeRemove, int indexRemoved) {
        return indexBeforeRemove - 1;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsValue(Object value) {
        for (int i = 0; i < this.size; i++) {
            if (Objects.equal(value, this.values[i])) {
                return true;
            }
        }
        return false;
    }

    public void init(int expectedSize) {
        boolean z;
        if (expectedSize >= 0) {
            z = true;
        } else {
            z = false;
        }
        Preconditions.checkArgument(z, "Expected size must be non-negative");
        this.modCount = Math.max(1, expectedSize);
    }

    public final V remove(Object key, int hash) {
        int[] iArr;
        int length = (iArr.length - 1) & hash;
        int i = this.table[length];
        if (i == -1) {
            return null;
        }
        int i2 = -1;
        while (true) {
            if (((int) (this.entries[i] >>> 32)) != hash || !Objects.equal(key, this.keys[i])) {
                int i3 = (int) this.entries[i];
                if (i3 == -1) {
                    return null;
                }
                i2 = i;
                i = i3;
            } else {
                V v = (V) this.values[i];
                if (i2 == -1) {
                    this.table[length] = (int) this.entries[i];
                } else {
                    long[] jArr = this.entries;
                    jArr[i2] = (jArr[i2] & (-4294967296L)) | (((int) jArr[i]) & 4294967295L);
                }
                moveLastEntry(i);
                this.size--;
                this.modCount++;
                return v;
            }
        }
    }

    public static void access$000(CompactHashMap compactHashMap, int i) {
        compactHashMap.remove(compactHashMap.keys[i], (int) (compactHashMap.entries[i] >>> 32));
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set<Map.Entry<K, V>> entrySet() {
        EntrySetView entrySetView = this.entrySetView;
        if (entrySetView != null) {
            return entrySetView;
        }
        EntrySetView entrySetView2 = new EntrySetView();
        this.entrySetView = entrySetView2;
        return entrySetView2;
    }

    public int getSuccessor(int entryIndex) {
        int i = entryIndex + 1;
        if (i < this.size) {
            return i;
        }
        return -1;
    }

    public void insertEntry(int entryIndex, K key, V value, int hash) {
        this.entries[entryIndex] = (hash << 32) | 4294967295L;
        this.keys[entryIndex] = key;
        this.values[entryIndex] = value;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean isEmpty() {
        if (this.size == 0) {
            return true;
        }
        return false;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set<K> keySet() {
        KeySetView keySetView = this.keySetView;
        if (keySetView != null) {
            return keySetView;
        }
        KeySetView keySetView2 = new KeySetView();
        this.keySetView = keySetView2;
        return keySetView2;
    }

    public final boolean needsAllocArrays() {
        if (this.table == null) {
            return true;
        }
        return false;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final V put(K key, V value) {
        boolean z;
        if (needsAllocArrays()) {
            allocArrays();
        }
        long[] jArr = this.entries;
        Object[] objArr = this.keys;
        Object[] objArr2 = this.values;
        int smearedHash = Hashing.smearedHash(key);
        int[] iArr = this.table;
        int length = (iArr.length - 1) & smearedHash;
        int i = this.size;
        int i2 = iArr[length];
        if (i2 == -1) {
            iArr[length] = i;
        } else {
            while (true) {
                long j = jArr[i2];
                if (((int) (j >>> 32)) != smearedHash || !Objects.equal(key, objArr[i2])) {
                    int i3 = (int) j;
                    if (i3 == -1) {
                        jArr[i2] = ((-4294967296L) & j) | (i & 4294967295L);
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
            int length2 = this.entries.length;
            if (i5 > length2) {
                int max = Math.max(1, length2 >>> 1) + length2;
                if (max >= 0) {
                    i4 = max;
                }
                if (i4 != length2) {
                    resizeEntries(i4);
                }
            }
            insertEntry(i, key, value, smearedHash);
            this.size = i5;
            int length3 = this.table.length;
            if (i <= length3 * 1.0d || length3 >= 1073741824) {
                z = false;
            } else {
                z = true;
            }
            if (z) {
                int i6 = length3 * 2;
                int[] iArr2 = new int[i6];
                Arrays.fill(iArr2, -1);
                long[] jArr2 = this.entries;
                int i7 = i6 - 1;
                for (int i8 = 0; i8 < this.size; i8++) {
                    int i9 = (int) (jArr2[i8] >>> 32);
                    int i10 = i9 & i7;
                    int i11 = iArr2[i10];
                    iArr2[i10] = i8;
                    jArr2[i8] = (i9 << 32) | (i11 & 4294967295L);
                }
                this.table = iArr2;
            }
            this.modCount++;
            return null;
        }
        throw new IllegalStateException("Cannot contain more than Integer.MAX_VALUE elements!");
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
    public final Collection<V> values() {
        ValuesView valuesView = this.valuesView;
        if (valuesView != null) {
            return valuesView;
        }
        ValuesView valuesView2 = new ValuesView();
        this.valuesView = valuesView2;
        return valuesView2;
    }

    public CompactHashMap(int expectedSize) {
        init(expectedSize);
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
        throw new InvalidObjectException(R$style$$ExternalSyntheticOutline0.m(25, "Invalid size: ", readInt));
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

    public void allocArrays() {
        Preconditions.checkState(needsAllocArrays(), "Arrays already allocated");
        int i = this.modCount;
        int[] iArr = new int[Hashing.closedTableSize(i)];
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
    public final boolean containsKey(Object key) {
        if (indexOf(key) != -1) {
            return true;
        }
        return false;
    }

    public int firstEntryIndex() {
        if (isEmpty()) {
            return -1;
        }
        return 0;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final V get(Object key) {
        int indexOf = indexOf(key);
        accessEntry(indexOf);
        if (indexOf == -1) {
            return null;
        }
        return (V) this.values[indexOf];
    }

    public final int indexOf(Object key) {
        if (needsAllocArrays()) {
            return -1;
        }
        int smearedHash = Hashing.smearedHash(key);
        int[] iArr = this.table;
        int i = iArr[(iArr.length - 1) & smearedHash];
        while (i != -1) {
            long j = this.entries[i];
            if (((int) (j >>> 32)) == smearedHash && Objects.equal(key, this.keys[i])) {
                return i;
            }
            i = (int) j;
        }
        return -1;
    }

    public void moveLastEntry(int dstIndex) {
        int size = size() - 1;
        if (dstIndex < size) {
            Object[] objArr = this.keys;
            objArr[dstIndex] = objArr[size];
            Object[] objArr2 = this.values;
            objArr2[dstIndex] = objArr2[size];
            objArr[size] = null;
            objArr2[size] = null;
            long[] jArr = this.entries;
            long j = jArr[size];
            jArr[dstIndex] = j;
            jArr[size] = -1;
            int[] iArr = this.table;
            int length = ((int) (j >>> 32)) & (iArr.length - 1);
            int i = iArr[length];
            if (i == size) {
                iArr[length] = dstIndex;
                return;
            }
            while (true) {
                long[] jArr2 = this.entries;
                long j2 = jArr2[i];
                int i2 = (int) j2;
                if (i2 == size) {
                    jArr2[i] = (dstIndex & 4294967295L) | (j2 & (-4294967296L));
                    return;
                }
                i = i2;
            }
        } else {
            this.keys[dstIndex] = null;
            this.values[dstIndex] = null;
            this.entries[dstIndex] = -1;
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final V remove(Object key) {
        if (needsAllocArrays()) {
            return null;
        }
        return remove(key, Hashing.smearedHash(key));
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int size() {
        return this.size;
    }
}
