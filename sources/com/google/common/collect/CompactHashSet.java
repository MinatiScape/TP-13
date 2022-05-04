package com.google.common.collect;

import androidx.cardview.R$style$$ExternalSyntheticOutline0;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import java.io.IOException;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.lang.reflect.Array;
import java.util.AbstractSet;
import java.util.Arrays;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.NoSuchElementException;
/* loaded from: classes.dex */
class CompactHashSet<E> extends AbstractSet<E> implements Serializable {
    public static final int DEFAULT_SIZE = 3;
    public transient Object[] elements;
    public transient long[] entries;
    public transient int modCount;
    public transient int size;
    public transient int[] table;

    public CompactHashSet() {
        init(3);
    }

    public int adjustAfterRemove(int indexBeforeRemove, int indexRemoved) {
        return indexBeforeRemove - 1;
    }

    public void init(int expectedSize) {
        boolean z;
        if (expectedSize >= 0) {
            z = true;
        } else {
            z = false;
        }
        Preconditions.checkArgument(z, "Initial capacity must be non-negative");
        this.modCount = Math.max(1, expectedSize);
    }

    public final boolean remove(Object object, int hash) {
        int[] iArr;
        int length = (iArr.length - 1) & hash;
        int i = this.table[length];
        if (i == -1) {
            return false;
        }
        int i2 = -1;
        while (true) {
            if (((int) (this.entries[i] >>> 32)) != hash || !Objects.equal(object, this.elements[i])) {
                int i3 = (int) this.entries[i];
                if (i3 == -1) {
                    return false;
                }
                i2 = i;
                i = i3;
            } else {
                if (i2 == -1) {
                    this.table[length] = (int) this.entries[i];
                } else {
                    long[] jArr = this.entries;
                    jArr[i2] = (jArr[i2] & (-4294967296L)) | (((int) jArr[i]) & 4294967295L);
                }
                moveLastEntry(i);
                this.size--;
                this.modCount++;
                return true;
            }
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public Object[] toArray() {
        return needsAllocArrays() ? new Object[0] : Arrays.copyOf(this.elements, this.size);
    }

    public int getSuccessor(int entryIndex) {
        int i = entryIndex + 1;
        if (i < this.size) {
            return i;
        }
        return -1;
    }

    public void insertEntry(int entryIndex, E object, int hash) {
        this.entries[entryIndex] = (hash << 32) | 4294967295L;
        this.elements[entryIndex] = object;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean isEmpty() {
        if (this.size == 0) {
            return true;
        }
        return false;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator<E> iterator() {
        return new Iterator<E>() { // from class: com.google.common.collect.CompactHashSet.1
            public int currentIndex;
            public int expectedModCount;
            public int indexToRemove = -1;

            {
                this.expectedModCount = CompactHashSet.this.modCount;
                this.currentIndex = CompactHashSet.this.firstEntryIndex();
            }

            @Override // java.util.Iterator
            public final boolean hasNext() {
                if (this.currentIndex >= 0) {
                    return true;
                }
                return false;
            }

            @Override // java.util.Iterator
            public final E next() {
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
            public final void remove() {
                boolean z;
                if (CompactHashSet.this.modCount == this.expectedModCount) {
                    if (this.indexToRemove >= 0) {
                        z = true;
                    } else {
                        z = false;
                    }
                    CollectPreconditions.checkRemove(z);
                    this.expectedModCount++;
                    CompactHashSet compactHashSet = CompactHashSet.this;
                    Object[] objArr = compactHashSet.elements;
                    int i = this.indexToRemove;
                    compactHashSet.remove(objArr[i], (int) (compactHashSet.entries[i] >>> 32));
                    this.currentIndex = CompactHashSet.this.adjustAfterRemove(this.currentIndex, this.indexToRemove);
                    this.indexToRemove = -1;
                    return;
                }
                throw new ConcurrentModificationException();
            }
        };
    }

    public final boolean needsAllocArrays() {
        if (this.table == null) {
            return true;
        }
        return false;
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

    public CompactHashSet(int expectedSize) {
        init(expectedSize);
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
        throw new InvalidObjectException(R$style$$ExternalSyntheticOutline0.m(25, "Invalid size: ", readInt));
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
    public final boolean add(E object) {
        boolean z;
        if (needsAllocArrays()) {
            allocArrays();
        }
        long[] jArr = this.entries;
        Object[] objArr = this.elements;
        int smearedHash = Hashing.smearedHash(object);
        int[] iArr = this.table;
        int length = (iArr.length - 1) & smearedHash;
        int i = this.size;
        int i2 = iArr[length];
        if (i2 == -1) {
            iArr[length] = i;
        } else {
            while (true) {
                long j = jArr[i2];
                if (((int) (j >>> 32)) == smearedHash && Objects.equal(object, objArr[i2])) {
                    return false;
                }
                int i3 = (int) j;
                if (i3 == -1) {
                    jArr[i2] = (j & (-4294967296L)) | (i & 4294967295L);
                    break;
                }
                i2 = i3;
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
            insertEntry(i, object, smearedHash);
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
            return true;
        }
        throw new IllegalStateException("Cannot contain more than Integer.MAX_VALUE elements!");
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
    public final boolean contains(Object object) {
        if (needsAllocArrays()) {
            return false;
        }
        int smearedHash = Hashing.smearedHash(object);
        int[] iArr = this.table;
        int i = iArr[(iArr.length - 1) & smearedHash];
        while (i != -1) {
            long j = this.entries[i];
            if (((int) (j >>> 32)) == smearedHash && Objects.equal(object, this.elements[i])) {
                return true;
            }
            i = (int) j;
        }
        return false;
    }

    public int firstEntryIndex() {
        if (isEmpty()) {
            return -1;
        }
        return 0;
    }

    public void moveLastEntry(int dstIndex) {
        int size = size() - 1;
        if (dstIndex < size) {
            Object[] objArr = this.elements;
            objArr[dstIndex] = objArr[size];
            objArr[size] = null;
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
            this.elements[dstIndex] = null;
            this.entries[dstIndex] = -1;
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
        Preconditions.checkPositionIndexes(0, i + 0, objArr.length);
        if (a.length < i) {
            a = (T[]) ((Object[]) Array.newInstance(a.getClass().getComponentType(), i));
        } else if (a.length > i) {
            a[i] = null;
        }
        System.arraycopy(objArr, 0, a, 0, i);
        return a;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean remove(Object object) {
        if (needsAllocArrays()) {
            return false;
        }
        return remove(object, Hashing.smearedHash(object));
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.size;
    }
}
