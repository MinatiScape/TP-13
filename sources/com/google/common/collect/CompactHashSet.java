package com.google.common.collect;

import androidx.fragment.R$id$$ExternalSyntheticOutline0;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import java.io.IOException;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.AbstractSet;
import java.util.Arrays;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.NoSuchElementException;
/* loaded from: classes.dex */
public class CompactHashSet<E> extends AbstractSet<E> implements Serializable {
    public static final int DEFAULT_SIZE = 3;
    public transient Object[] elements;
    public transient long[] entries;
    public transient int modCount;
    public transient int size;
    public transient int[] table;

    public CompactHashSet() {
        init(3);
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
                add(stream.readObject());
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
            stream.writeObject(this.elements[firstEntryIndex]);
            firstEntryIndex = getSuccessor(firstEntryIndex);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean add(E object) {
        if (needsAllocArrays()) {
            allocArrays();
        }
        long[] jArr = this.entries;
        Object[] objArr = this.elements;
        int smearedHash = Hashing.smearedHash(object);
        int hashTableMask = hashTableMask() & smearedHash;
        int i = this.size;
        int[] iArr = this.table;
        int i2 = iArr[hashTableMask];
        if (i2 == -1) {
            iArr[hashTableMask] = i;
        } else {
            while (true) {
                long j = jArr[i2];
                if (getHash(j) == smearedHash && Objects.equal(object, objArr[i2])) {
                    return false;
                }
                int i3 = (int) j;
                if (i3 == -1) {
                    jArr[i2] = swapNext(j, i);
                    break;
                }
                i2 = i3;
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
            insertEntry(i, object, smearedHash);
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
                    jArr2[i8] = (hash << 32) | (4294967295L & i10);
                }
                this.table = iArr2;
            }
            this.modCount++;
            return true;
        }
        throw new IllegalStateException("Cannot contain more than Integer.MAX_VALUE elements!");
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
        this.elements = new Object[i];
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public void clear() {
        if (!needsAllocArrays()) {
            this.modCount++;
            Arrays.fill(this.elements, 0, this.size, (Object) null);
            Arrays.fill(this.table, -1);
            Arrays.fill(this.entries, 0, this.size, -1L);
            this.size = 0;
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean contains(Object object) {
        if (needsAllocArrays()) {
            return false;
        }
        int smearedHash = Hashing.smearedHash(object);
        int i = this.table[hashTableMask() & smearedHash];
        while (i != -1) {
            long j = this.entries[i];
            if (getHash(j) == smearedHash && Objects.equal(object, this.elements[i])) {
                return true;
            }
            i = (int) j;
        }
        return false;
    }

    public int firstEntryIndex() {
        return isEmpty() ? -1 : 0;
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

    public void init(int expectedSize) {
        Preconditions.checkArgument(expectedSize >= 0, "Initial capacity must be non-negative");
        this.modCount = Math.max(1, expectedSize);
    }

    public void insertEntry(int entryIndex, E object, int hash) {
        this.entries[entryIndex] = (hash << 32) | 4294967295L;
        this.elements[entryIndex] = object;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean isEmpty() {
        return this.size == 0;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public Iterator<E> iterator() {
        return new Iterator<E>() { // from class: com.google.common.collect.CompactHashSet.1
            public int currentIndex;
            public int expectedModCount;
            public int indexToRemove = -1;

            {
                this.expectedModCount = CompactHashSet.this.modCount;
                this.currentIndex = CompactHashSet.this.firstEntryIndex();
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                return this.currentIndex >= 0;
            }

            @Override // java.util.Iterator
            public E next() {
                if (CompactHashSet.this.modCount != this.expectedModCount) {
                    throw new ConcurrentModificationException();
                } else if (hasNext()) {
                    int i = this.currentIndex;
                    this.indexToRemove = i;
                    CompactHashSet compactHashSet = CompactHashSet.this;
                    E e = (E) compactHashSet.elements[i];
                    this.currentIndex = compactHashSet.getSuccessor(i);
                    return e;
                } else {
                    throw new NoSuchElementException();
                }
            }

            @Override // java.util.Iterator
            public void remove() {
                if (CompactHashSet.this.modCount == this.expectedModCount) {
                    Preconditions.checkState(this.indexToRemove >= 0, "no calls to next() since the last call to remove()");
                    this.expectedModCount++;
                    CompactHashSet compactHashSet = CompactHashSet.this;
                    Object[] objArr = compactHashSet.elements;
                    int i = this.indexToRemove;
                    compactHashSet.remove(objArr[i], CompactHashSet.getHash(compactHashSet.entries[i]));
                    this.currentIndex = CompactHashSet.this.adjustAfterRemove(this.currentIndex, this.indexToRemove);
                    this.indexToRemove = -1;
                    return;
                }
                throw new ConcurrentModificationException();
            }
        };
    }

    public void moveLastEntry(int dstIndex) {
        int i = this.size - 1;
        if (dstIndex < i) {
            Object[] objArr = this.elements;
            objArr[dstIndex] = objArr[i];
            objArr[i] = null;
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
            this.elements[dstIndex] = null;
            this.entries[dstIndex] = -1;
        }
    }

    public boolean needsAllocArrays() {
        return this.table == null;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean remove(Object object) {
        if (needsAllocArrays()) {
            return false;
        }
        return remove(object, Hashing.smearedHash(object));
    }

    public void resizeEntries(int newCapacity) {
        this.elements = Arrays.copyOf(this.elements, newCapacity);
        long[] jArr = this.entries;
        int length = jArr.length;
        long[] copyOf = Arrays.copyOf(jArr, newCapacity);
        if (newCapacity > length) {
            Arrays.fill(copyOf, length, newCapacity, -1L);
        }
        this.entries = copyOf;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public int size() {
        return this.size;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public Object[] toArray() {
        return needsAllocArrays() ? new Object[0] : Arrays.copyOf(this.elements, this.size);
    }

    public CompactHashSet(int expectedSize) {
        init(expectedSize);
    }

    public final boolean remove(Object object, int hash) {
        int hashTableMask = hashTableMask() & hash;
        int i = this.table[hashTableMask];
        if (i == -1) {
            return false;
        }
        int i2 = -1;
        while (true) {
            if (getHash(this.entries[i]) != hash || !Objects.equal(object, this.elements[i])) {
                int i3 = (int) this.entries[i];
                if (i3 == -1) {
                    return false;
                }
                i2 = i;
                i = i3;
            } else {
                if (i2 == -1) {
                    this.table[hashTableMask] = (int) this.entries[i];
                } else {
                    long[] jArr = this.entries;
                    jArr[i2] = swapNext(jArr[i2], (int) jArr[i]);
                }
                moveLastEntry(i);
                this.size--;
                this.modCount++;
                return true;
            }
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public <T> T[] toArray(T[] a) {
        if (needsAllocArrays()) {
            if (a.length > 0) {
                a[0] = null;
            }
            return a;
        }
        Object[] objArr = this.elements;
        int i = this.size;
        Preconditions.checkPositionIndexes(0, 0 + i, objArr.length);
        if (a.length < i) {
            a = (T[]) ObjectArrays.newArray(a, i);
        } else if (a.length > i) {
            a[i] = null;
        }
        System.arraycopy(objArr, 0, a, 0, i);
        return a;
    }
}
