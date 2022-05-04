package com.google.common.collect;

import java.util.Arrays;
/* loaded from: classes.dex */
class CompactLinkedHashMap<K, V> extends CompactHashMap<K, V> {
    private final boolean accessOrder;
    public transient int firstEntry;
    public transient int lastEntry;
    public transient long[] links;

    public CompactLinkedHashMap() {
        this(3);
    }

    public CompactLinkedHashMap(int expectedSize) {
        super(expectedSize);
        this.accessOrder = false;
    }

    @Override // com.google.common.collect.CompactHashMap
    public final void accessEntry(int index) {
        if (this.accessOrder) {
            long j = this.links[index];
            setSucceeds((int) (j >>> 32), (int) j);
            setSucceeds(this.lastEntry, index);
            setSucceeds(index, -2);
            this.modCount++;
        }
    }

    @Override // com.google.common.collect.CompactHashMap
    public final int getSuccessor(int entry) {
        return (int) this.links[entry];
    }

    @Override // com.google.common.collect.CompactHashMap
    public final int adjustAfterRemove(int indexBeforeRemove, int indexRemoved) {
        if (indexBeforeRemove >= size()) {
            return indexRemoved;
        }
        return indexBeforeRemove;
    }

    @Override // com.google.common.collect.CompactHashMap
    public final void allocArrays() {
        super.allocArrays();
        long[] jArr = new long[this.keys.length];
        this.links = jArr;
        Arrays.fill(jArr, -1L);
    }

    @Override // com.google.common.collect.CompactHashMap, java.util.AbstractMap, java.util.Map
    public final void clear() {
        if (!needsAllocArrays()) {
            this.firstEntry = -2;
            this.lastEntry = -2;
            Arrays.fill(this.links, 0, size(), -1L);
            super.clear();
        }
    }

    @Override // com.google.common.collect.CompactHashMap
    public final void init(int expectedSize) {
        super.init(expectedSize);
        this.firstEntry = -2;
        this.lastEntry = -2;
    }

    @Override // com.google.common.collect.CompactHashMap
    public final void insertEntry(int entryIndex, K key, V value, int hash) {
        super.insertEntry(entryIndex, key, value, hash);
        setSucceeds(this.lastEntry, entryIndex);
        setSucceeds(entryIndex, -2);
    }

    @Override // com.google.common.collect.CompactHashMap
    public final void moveLastEntry(int dstIndex) {
        int size = size() - 1;
        super.moveLastEntry(dstIndex);
        long j = this.links[dstIndex];
        setSucceeds((int) (j >>> 32), (int) j);
        if (dstIndex < size) {
            setSucceeds((int) (this.links[size] >>> 32), dstIndex);
            setSucceeds(dstIndex, (int) this.links[size]);
        }
        this.links[size] = -1;
    }

    @Override // com.google.common.collect.CompactHashMap
    public final void resizeEntries(int newCapacity) {
        super.resizeEntries(newCapacity);
        long[] jArr = this.links;
        int length = jArr.length;
        long[] copyOf = Arrays.copyOf(jArr, newCapacity);
        this.links = copyOf;
        if (length < newCapacity) {
            Arrays.fill(copyOf, length, newCapacity, -1L);
        }
    }

    public final void setSucceeds(int pred, int succ) {
        if (pred == -2) {
            this.firstEntry = succ;
        } else {
            long[] jArr = this.links;
            jArr[pred] = (jArr[pred] & (-4294967296L)) | (succ & 4294967295L);
        }
        if (succ == -2) {
            this.lastEntry = pred;
            return;
        }
        long[] jArr2 = this.links;
        jArr2[succ] = (4294967295L & jArr2[succ]) | (pred << 32);
    }

    @Override // com.google.common.collect.CompactHashMap
    public final int firstEntryIndex() {
        return this.firstEntry;
    }
}
