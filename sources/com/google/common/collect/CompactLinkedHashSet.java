package com.google.common.collect;

import java.util.Arrays;
/* loaded from: classes.dex */
public class CompactLinkedHashSet<E> extends CompactHashSet<E> {
    public transient int firstEntry;
    public transient int lastEntry;
    public transient int[] predecessor;
    public transient int[] successor;

    public CompactLinkedHashSet() {
    }

    @Override // com.google.common.collect.CompactHashSet
    public int adjustAfterRemove(int indexBeforeRemove, int indexRemoved) {
        return indexBeforeRemove >= this.size ? indexRemoved : indexBeforeRemove;
    }

    @Override // com.google.common.collect.CompactHashSet
    public void allocArrays() {
        super.allocArrays();
        int length = this.elements.length;
        int[] iArr = new int[length];
        this.predecessor = iArr;
        this.successor = new int[length];
        Arrays.fill(iArr, -1);
        Arrays.fill(this.successor, -1);
    }

    @Override // com.google.common.collect.CompactHashSet, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public void clear() {
        if (!needsAllocArrays()) {
            this.firstEntry = -2;
            this.lastEntry = -2;
            Arrays.fill(this.predecessor, 0, this.size, -1);
            Arrays.fill(this.successor, 0, this.size, -1);
            super.clear();
        }
    }

    @Override // com.google.common.collect.CompactHashSet
    public int firstEntryIndex() {
        return this.firstEntry;
    }

    @Override // com.google.common.collect.CompactHashSet
    public int getSuccessor(int entry) {
        return this.successor[entry];
    }

    @Override // com.google.common.collect.CompactHashSet
    public void init(int expectedSize) {
        super.init(expectedSize);
        this.firstEntry = -2;
        this.lastEntry = -2;
    }

    @Override // com.google.common.collect.CompactHashSet
    public void insertEntry(int entryIndex, E object, int hash) {
        this.entries[entryIndex] = (hash << 32) | 4294967295L;
        this.elements[entryIndex] = object;
        setSucceeds(this.lastEntry, entryIndex);
        setSucceeds(entryIndex, -2);
    }

    @Override // com.google.common.collect.CompactHashSet
    public void moveLastEntry(int dstIndex) {
        int i = this.size - 1;
        super.moveLastEntry(dstIndex);
        setSucceeds(this.predecessor[dstIndex], this.successor[dstIndex]);
        if (dstIndex < i) {
            setSucceeds(this.predecessor[i], dstIndex);
            setSucceeds(dstIndex, this.successor[i]);
        }
        this.predecessor[i] = -1;
        this.successor[i] = -1;
    }

    @Override // com.google.common.collect.CompactHashSet
    public void resizeEntries(int newCapacity) {
        super.resizeEntries(newCapacity);
        int[] iArr = this.predecessor;
        int length = iArr.length;
        this.predecessor = Arrays.copyOf(iArr, newCapacity);
        this.successor = Arrays.copyOf(this.successor, newCapacity);
        if (length < newCapacity) {
            Arrays.fill(this.predecessor, length, newCapacity, -1);
            Arrays.fill(this.successor, length, newCapacity, -1);
        }
    }

    public final void setSucceeds(int pred, int succ) {
        if (pred == -2) {
            this.firstEntry = succ;
        } else {
            this.successor[pred] = succ;
        }
        if (succ == -2) {
            this.lastEntry = pred;
        } else {
            this.predecessor[succ] = pred;
        }
    }

    @Override // com.google.common.collect.CompactHashSet, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public <T> T[] toArray(T[] a) {
        int size = size();
        if (a.length < size) {
            a = (T[]) ObjectArrays.newArray(a, size);
        }
        ObjectArrays.fillArray(this, a);
        if (a.length > size) {
            a[size] = null;
        }
        return a;
    }

    public CompactLinkedHashSet(int expectedSize) {
        super(expectedSize);
    }

    @Override // com.google.common.collect.CompactHashSet, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public Object[] toArray() {
        Object[] objArr = new Object[size()];
        ObjectArrays.fillArray(this, objArr);
        return objArr;
    }
}
