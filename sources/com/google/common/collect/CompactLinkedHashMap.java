package com.google.common.collect;

import java.util.Arrays;
/* loaded from: classes.dex */
public class CompactLinkedHashMap<K, V> extends CompactHashMap<K, V> {
    private final boolean accessOrder = false;
    public transient int firstEntry;
    public transient int lastEntry;
    public transient long[] links;

    public CompactLinkedHashMap() {
        super(3);
    }

    @Override // com.google.common.collect.CompactHashMap
    public void accessEntry(int index) {
        if (this.accessOrder) {
            long[] jArr = this.links;
            setSucceeds((int) (jArr[index] >>> 32), (int) jArr[index]);
            setSucceeds(this.lastEntry, index);
            setSucceeds(index, -2);
            this.modCount++;
        }
    }

    @Override // com.google.common.collect.CompactHashMap
    public int adjustAfterRemove(int indexBeforeRemove, int indexRemoved) {
        return indexBeforeRemove >= this.size ? indexRemoved : indexBeforeRemove;
    }

    @Override // com.google.common.collect.CompactHashMap
    public void allocArrays() {
        super.allocArrays();
        long[] jArr = new long[this.keys.length];
        this.links = jArr;
        Arrays.fill(jArr, -1L);
    }

    @Override // com.google.common.collect.CompactHashMap, java.util.AbstractMap, java.util.Map
    public void clear() {
        if (!needsAllocArrays()) {
            this.firstEntry = -2;
            this.lastEntry = -2;
            Arrays.fill(this.links, 0, this.size, -1L);
            super.clear();
        }
    }

    @Override // com.google.common.collect.CompactHashMap
    public int firstEntryIndex() {
        return this.firstEntry;
    }

    public final int getPredecessor(int entry) {
        return (int) (this.links[entry] >>> 32);
    }

    @Override // com.google.common.collect.CompactHashMap
    public int getSuccessor(int entry) {
        return (int) this.links[entry];
    }

    @Override // com.google.common.collect.CompactHashMap
    public void init(int expectedSize) {
        super.init(expectedSize);
        this.firstEntry = -2;
        this.lastEntry = -2;
    }

    @Override // com.google.common.collect.CompactHashMap
    public void insertEntry(int entryIndex, K key, V value, int hash) {
        super.insertEntry(entryIndex, key, value, hash);
        setSucceeds(this.lastEntry, entryIndex);
        setSucceeds(entryIndex, -2);
    }

    @Override // com.google.common.collect.CompactHashMap
    public void moveLastEntry(int dstIndex) {
        int i = this.size - 1;
        super.moveLastEntry(dstIndex);
        long[] jArr = this.links;
        setSucceeds((int) (jArr[dstIndex] >>> 32), (int) jArr[dstIndex]);
        if (dstIndex < i) {
            setSucceeds(getPredecessor(i), dstIndex);
            setSucceeds(dstIndex, getSuccessor(i));
        }
        this.links[i] = -1;
    }

    @Override // com.google.common.collect.CompactHashMap
    public void resizeEntries(int newCapacity) {
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

    public CompactLinkedHashMap(int expectedSize) {
        super(expectedSize);
    }
}
