package com.google.common.collect;

import java.lang.reflect.Array;
import java.util.Arrays;
/* loaded from: classes.dex */
class CompactLinkedHashSet<E> extends CompactHashSet<E> {
    public transient int firstEntry;
    public transient int lastEntry;
    public transient int[] predecessor;
    public transient int[] successor;

    public CompactLinkedHashSet() {
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

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.google.common.collect.CompactHashSet, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final <T> T[] toArray(T[] a) {
        int size = size();
        if (a.length < size) {
            a = (T[]) ((Object[]) Array.newInstance(a.getClass().getComponentType(), size));
        }
        int i = 0;
        for (E e : this) {
            i++;
            a[i] = e;
        }
        if (a.length > size) {
            a[size] = null;
        }
        return a;
    }

    public CompactLinkedHashSet(int expectedSize) {
        super(expectedSize);
    }

    @Override // com.google.common.collect.CompactHashSet
    public final int getSuccessor(int entry) {
        return this.successor[entry];
    }

    @Override // com.google.common.collect.CompactHashSet
    public final int adjustAfterRemove(int indexBeforeRemove, int indexRemoved) {
        if (indexBeforeRemove >= size()) {
            return indexRemoved;
        }
        return indexBeforeRemove;
    }

    @Override // com.google.common.collect.CompactHashSet
    public final void allocArrays() {
        super.allocArrays();
        int length = this.elements.length;
        int[] iArr = new int[length];
        this.predecessor = iArr;
        this.successor = new int[length];
        Arrays.fill(iArr, -1);
        Arrays.fill(this.successor, -1);
    }

    @Override // com.google.common.collect.CompactHashSet, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final void clear() {
        if (!needsAllocArrays()) {
            this.firstEntry = -2;
            this.lastEntry = -2;
            Arrays.fill(this.predecessor, 0, size(), -1);
            Arrays.fill(this.successor, 0, size(), -1);
            super.clear();
        }
    }

    @Override // com.google.common.collect.CompactHashSet
    public final void init(int expectedSize) {
        super.init(expectedSize);
        this.firstEntry = -2;
        this.lastEntry = -2;
    }

    @Override // com.google.common.collect.CompactHashSet
    public final void insertEntry(int entryIndex, E object, int hash) {
        super.insertEntry(entryIndex, object, hash);
        setSucceeds(this.lastEntry, entryIndex);
        setSucceeds(entryIndex, -2);
    }

    @Override // com.google.common.collect.CompactHashSet
    public final void moveLastEntry(int dstIndex) {
        int size = size() - 1;
        super.moveLastEntry(dstIndex);
        setSucceeds(this.predecessor[dstIndex], this.successor[dstIndex]);
        if (dstIndex < size) {
            setSucceeds(this.predecessor[size], dstIndex);
            setSucceeds(dstIndex, this.successor[size]);
        }
        this.predecessor[size] = -1;
        this.successor[size] = -1;
    }

    @Override // com.google.common.collect.CompactHashSet
    public final void resizeEntries(int newCapacity) {
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

    @Override // com.google.common.collect.CompactHashSet, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final Object[] toArray() {
        Object[] objArr = new Object[size()];
        int i = 0;
        for (E e : this) {
            i++;
            objArr[i] = e;
        }
        return objArr;
    }

    @Override // com.google.common.collect.CompactHashSet
    public final int firstEntryIndex() {
        return this.firstEntry;
    }
}
