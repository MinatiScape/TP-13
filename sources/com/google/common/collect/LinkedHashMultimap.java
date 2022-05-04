package com.google.common.collect;

import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import com.google.common.collect.AbstractMultimap;
import com.google.common.collect.Sets;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Arrays;
import java.util.Collection;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;
/* loaded from: classes.dex */
public final class LinkedHashMultimap<K, V> extends LinkedHashMultimapGwtSerializationDependencies<K, V> {
    public static final double VALUE_SET_LOAD_FACTOR = 1.0d;
    private static final long serialVersionUID = 1;
    public transient ValueEntry<K, V> multimapHeaderEntry;
    public transient int valueSetCapacity;

    /* loaded from: classes.dex */
    public static final class ValueEntry<K, V> extends ImmutableEntry<K, V> implements ValueSetLink<K, V> {
        public ValueEntry<K, V> nextInValueBucket;
        public ValueEntry<K, V> predecessorInMultimap;
        public ValueSetLink<K, V> predecessorInValueSet;
        public final int smearedValueHash;
        public ValueEntry<K, V> successorInMultimap;
        public ValueSetLink<K, V> successorInValueSet;

        public ValueEntry(K key, V value, int smearedValueHash, ValueEntry<K, V> nextInValueBucket) {
            super(key, value);
            this.smearedValueHash = smearedValueHash;
            this.nextInValueBucket = nextInValueBucket;
        }

        @Override // com.google.common.collect.LinkedHashMultimap.ValueSetLink
        public ValueSetLink<K, V> getSuccessorInValueSet() {
            return this.successorInValueSet;
        }

        public boolean matchesValue(Object v, int smearedVHash) {
            return this.smearedValueHash == smearedVHash && Objects.equal(this.value, v);
        }

        @Override // com.google.common.collect.LinkedHashMultimap.ValueSetLink
        public void setPredecessorInValueSet(ValueSetLink<K, V> entry) {
            this.predecessorInValueSet = entry;
        }

        @Override // com.google.common.collect.LinkedHashMultimap.ValueSetLink
        public void setSuccessorInValueSet(ValueSetLink<K, V> entry) {
            this.successorInValueSet = entry;
        }
    }

    /* loaded from: classes.dex */
    public final class ValueSet extends Sets.ImprovedAbstractSet<V> implements ValueSetLink<K, V> {
        public ValueEntry<K, V>[] hashTable;
        public final K key;
        public int size = 0;
        public int modCount = 0;
        public ValueSetLink<K, V> firstEntry = this;
        public ValueSetLink<K, V> lastEntry = this;

        public ValueSet(K key, int expectedValues) {
            this.key = key;
            this.hashTable = new ValueEntry[Hashing.closedTableSize(expectedValues, 1.0d)];
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean add(V value) {
            int smearedHash = Hashing.smearedHash(value);
            int mask = mask() & smearedHash;
            ValueEntry<K, V> valueEntry = this.hashTable[mask];
            for (ValueEntry<K, V> valueEntry2 = valueEntry; valueEntry2 != null; valueEntry2 = valueEntry2.nextInValueBucket) {
                if (valueEntry2.matchesValue(value, smearedHash)) {
                    return false;
                }
            }
            ValueEntry<K, V> valueEntry3 = new ValueEntry<>(this.key, value, smearedHash, valueEntry);
            ValueSetLink<K, V> valueSetLink = this.lastEntry;
            valueSetLink.setSuccessorInValueSet(valueEntry3);
            valueEntry3.predecessorInValueSet = valueSetLink;
            valueEntry3.successorInValueSet = this;
            this.lastEntry = valueEntry3;
            ValueEntry<K, V> valueEntry4 = LinkedHashMultimap.this.multimapHeaderEntry;
            ValueEntry<K, V> valueEntry5 = valueEntry4.predecessorInMultimap;
            valueEntry5.successorInMultimap = valueEntry3;
            valueEntry3.predecessorInMultimap = valueEntry5;
            valueEntry3.successorInMultimap = valueEntry4;
            valueEntry4.predecessorInMultimap = valueEntry3;
            ValueEntry<K, V>[] valueEntryArr = this.hashTable;
            valueEntryArr[mask] = valueEntry3;
            int i = this.size + 1;
            this.size = i;
            this.modCount++;
            if (Hashing.needsResizing(i, valueEntryArr.length, 1.0d)) {
                int length = this.hashTable.length * 2;
                ValueEntry<K, V>[] valueEntryArr2 = new ValueEntry[length];
                this.hashTable = valueEntryArr2;
                int i2 = length - 1;
                for (ValueSetLink valueSetLink2 = (ValueSetLink<K, V>) this.firstEntry; valueSetLink2 != this; valueSetLink2 = (ValueSetLink<K, V>) valueSetLink2.getSuccessorInValueSet()) {
                    ValueEntry<K, V> valueEntry6 = (ValueEntry) valueSetLink2;
                    int i3 = valueEntry6.smearedValueHash & i2;
                    valueEntry6.nextInValueBucket = valueEntryArr2[i3];
                    valueEntryArr2[i3] = valueEntry6;
                }
            }
            return true;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public void clear() {
            Arrays.fill(this.hashTable, (Object) null);
            this.size = 0;
            for (ValueSetLink<K, V> valueSetLink = this.firstEntry; valueSetLink != this; valueSetLink = valueSetLink.getSuccessorInValueSet()) {
                ValueEntry valueEntry = (ValueEntry) valueSetLink;
                ValueEntry<K, V> valueEntry2 = valueEntry.predecessorInMultimap;
                ValueEntry<K, V> valueEntry3 = valueEntry.successorInMultimap;
                valueEntry2.successorInMultimap = valueEntry3;
                valueEntry3.predecessorInMultimap = valueEntry2;
            }
            this.firstEntry = this;
            this.lastEntry = this;
            this.modCount++;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean contains(Object o) {
            int smearedHash = Hashing.smearedHash(o);
            for (ValueEntry<K, V> valueEntry = this.hashTable[mask() & smearedHash]; valueEntry != null; valueEntry = valueEntry.nextInValueBucket) {
                if (valueEntry.matchesValue(o, smearedHash)) {
                    return true;
                }
            }
            return false;
        }

        @Override // com.google.common.collect.LinkedHashMultimap.ValueSetLink
        public ValueSetLink<K, V> getSuccessorInValueSet() {
            return this.firstEntry;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public Iterator<V> iterator() {
            return new Iterator<V>() { // from class: com.google.common.collect.LinkedHashMultimap.ValueSet.1
                public int expectedModCount;
                public ValueSetLink<K, V> nextEntry;
                public ValueEntry<K, V> toRemove;

                {
                    this.nextEntry = ValueSet.this.firstEntry;
                    this.expectedModCount = ValueSet.this.modCount;
                }

                @Override // java.util.Iterator
                public boolean hasNext() {
                    ValueSet valueSet = ValueSet.this;
                    if (valueSet.modCount == this.expectedModCount) {
                        return this.nextEntry != valueSet;
                    }
                    throw new ConcurrentModificationException();
                }

                @Override // java.util.Iterator
                public V next() {
                    if (hasNext()) {
                        ValueEntry<K, V> valueEntry = (ValueEntry) this.nextEntry;
                        V v = valueEntry.value;
                        this.toRemove = valueEntry;
                        this.nextEntry = valueEntry.successorInValueSet;
                        return v;
                    }
                    throw new NoSuchElementException();
                }

                @Override // java.util.Iterator
                public void remove() {
                    if (ValueSet.this.modCount == this.expectedModCount) {
                        Preconditions.checkState(this.toRemove != null, "no calls to next() since the last call to remove()");
                        ValueSet.this.remove(this.toRemove.value);
                        this.expectedModCount = ValueSet.this.modCount;
                        this.toRemove = null;
                        return;
                    }
                    throw new ConcurrentModificationException();
                }
            };
        }

        public final int mask() {
            return this.hashTable.length - 1;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean remove(Object o) {
            int smearedHash = Hashing.smearedHash(o);
            int mask = mask() & smearedHash;
            ValueEntry<K, V> valueEntry = null;
            for (ValueEntry<K, V> valueEntry2 = this.hashTable[mask]; valueEntry2 != null; valueEntry2 = valueEntry2.nextInValueBucket) {
                if (valueEntry2.matchesValue(o, smearedHash)) {
                    if (valueEntry == null) {
                        this.hashTable[mask] = valueEntry2.nextInValueBucket;
                    } else {
                        valueEntry.nextInValueBucket = valueEntry2.nextInValueBucket;
                    }
                    ValueSetLink<K, V> valueSetLink = valueEntry2.predecessorInValueSet;
                    ValueSetLink<K, V> valueSetLink2 = valueEntry2.successorInValueSet;
                    valueSetLink.setSuccessorInValueSet(valueSetLink2);
                    valueSetLink2.setPredecessorInValueSet(valueSetLink);
                    ValueEntry<K, V> valueEntry3 = valueEntry2.predecessorInMultimap;
                    ValueEntry<K, V> valueEntry4 = valueEntry2.successorInMultimap;
                    valueEntry3.successorInMultimap = valueEntry4;
                    valueEntry4.predecessorInMultimap = valueEntry3;
                    this.size--;
                    this.modCount++;
                    return true;
                }
                valueEntry = valueEntry2;
            }
            return false;
        }

        @Override // com.google.common.collect.LinkedHashMultimap.ValueSetLink
        public void setPredecessorInValueSet(ValueSetLink<K, V> entry) {
            this.lastEntry = entry;
        }

        @Override // com.google.common.collect.LinkedHashMultimap.ValueSetLink
        public void setSuccessorInValueSet(ValueSetLink<K, V> entry) {
            this.firstEntry = entry;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public int size() {
            return this.size;
        }
    }

    /* loaded from: classes.dex */
    public interface ValueSetLink<K, V> {
        ValueSetLink<K, V> getSuccessorInValueSet();

        void setPredecessorInValueSet(ValueSetLink<K, V> entry);

        void setSuccessorInValueSet(ValueSetLink<K, V> entry);
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void readObject(ObjectInputStream stream) throws IOException, ClassNotFoundException {
        stream.defaultReadObject();
        ValueEntry<K, V> valueEntry = new ValueEntry<>(null, null, 0, null);
        this.multimapHeaderEntry = valueEntry;
        valueEntry.successorInMultimap = valueEntry;
        valueEntry.predecessorInMultimap = valueEntry;
        this.valueSetCapacity = 2;
        int readInt = stream.readInt();
        CompactLinkedHashMap compactLinkedHashMap = new CompactLinkedHashMap(12);
        for (int i = 0; i < readInt; i++) {
            Object readObject = stream.readObject();
            compactLinkedHashMap.put(readObject, createCollection(readObject));
        }
        int readInt2 = stream.readInt();
        for (int i2 = 0; i2 < readInt2; i2++) {
            ((Collection) compactLinkedHashMap.get(stream.readObject())).add(stream.readObject());
        }
        setMap(compactLinkedHashMap);
    }

    private void writeObject(ObjectOutputStream stream) throws IOException {
        stream.defaultWriteObject();
        stream.writeInt(keySet().size());
        for (K k : keySet()) {
            stream.writeObject(k);
        }
        stream.writeInt(this.totalSize);
        AbstractMultimap.EntrySet entrySet = this.entries;
        if (entrySet == null) {
            entrySet = new AbstractMultimap.EntrySet(this);
            this.entries = entrySet;
        }
        for (Map.Entry entry : (Set) entrySet) {
            stream.writeObject(entry.getKey());
            stream.writeObject(entry.getValue());
        }
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.Multimap
    public void clear() {
        super.clear();
        ValueEntry<K, V> valueEntry = this.multimapHeaderEntry;
        valueEntry.successorInMultimap = valueEntry;
        valueEntry.predecessorInMultimap = valueEntry;
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap
    public Collection createCollection() {
        return new CompactLinkedHashSet(this.valueSetCapacity);
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.AbstractMultimap
    public Iterator<Map.Entry<K, V>> entryIterator() {
        return new Iterator<Map.Entry<K, V>>() { // from class: com.google.common.collect.LinkedHashMultimap.1
            public ValueEntry<K, V> nextEntry;
            public ValueEntry<K, V> toRemove;

            {
                this.nextEntry = LinkedHashMultimap.this.multimapHeaderEntry.successorInMultimap;
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                return this.nextEntry != LinkedHashMultimap.this.multimapHeaderEntry;
            }

            @Override // java.util.Iterator
            public Object next() {
                if (hasNext()) {
                    ValueEntry<K, V> valueEntry = this.nextEntry;
                    this.toRemove = valueEntry;
                    this.nextEntry = valueEntry.successorInMultimap;
                    return valueEntry;
                }
                throw new NoSuchElementException();
            }

            @Override // java.util.Iterator
            public void remove() {
                Preconditions.checkState(this.toRemove != null, "no calls to next() since the last call to remove()");
                LinkedHashMultimap linkedHashMultimap = LinkedHashMultimap.this;
                ValueEntry<K, V> valueEntry = this.toRemove;
                linkedHashMultimap.remove(valueEntry.key, valueEntry.value);
                this.toRemove = null;
            }
        };
    }

    @Override // com.google.common.collect.AbstractMultimap
    public Set<K> keySet() {
        Set<K> set = this.keySet;
        if (set != null) {
            return set;
        }
        Set<K> createKeySet = createKeySet();
        this.keySet = createKeySet;
        return createKeySet;
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap
    public Collection<V> createCollection(K key) {
        return new ValueSet(key, this.valueSetCapacity);
    }
}
