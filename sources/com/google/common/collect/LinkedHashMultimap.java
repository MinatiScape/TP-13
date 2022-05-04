package com.google.common.collect;

import com.google.common.base.Objects;
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
    public final class ValueSet extends Sets.ImprovedAbstractSet<V> implements ValueSetLink<K, V> {
        public ValueEntry<K, V>[] hashTable;
        public final K key;
        public int size = 0;
        public int modCount = 0;
        public ValueSetLink<K, V> firstEntry = this;
        public ValueSetLink<K, V> lastEntry = this;

        public ValueSet(K key, int expectedValues) {
            this.key = key;
            this.hashTable = new ValueEntry[Hashing.closedTableSize(expectedValues)];
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final void clear() {
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

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public final Iterator<V> iterator() {
            return new Iterator<V>() { // from class: com.google.common.collect.LinkedHashMultimap.ValueSet.1
                public int expectedModCount;
                public ValueSetLink<K, V> nextEntry;
                public ValueEntry<K, V> toRemove;

                {
                    this.nextEntry = ValueSet.this.firstEntry;
                    this.expectedModCount = ValueSet.this.modCount;
                }

                @Override // java.util.Iterator
                public final boolean hasNext() {
                    ValueSet valueSet = ValueSet.this;
                    if (valueSet.modCount != this.expectedModCount) {
                        throw new ConcurrentModificationException();
                    } else if (this.nextEntry != valueSet) {
                        return true;
                    } else {
                        return false;
                    }
                }

                @Override // java.util.Iterator
                public final void remove() {
                    boolean z;
                    if (ValueSet.this.modCount == this.expectedModCount) {
                        if (this.toRemove != null) {
                            z = true;
                        } else {
                            z = false;
                        }
                        CollectPreconditions.checkRemove(z);
                        ValueSet.this.remove(this.toRemove.value);
                        this.expectedModCount = ValueSet.this.modCount;
                        this.toRemove = null;
                        return;
                    }
                    throw new ConcurrentModificationException();
                }

                @Override // java.util.Iterator
                public final V next() {
                    if (hasNext()) {
                        ValueEntry<K, V> valueEntry = (ValueEntry) this.nextEntry;
                        V v = valueEntry.value;
                        this.toRemove = valueEntry;
                        this.nextEntry = valueEntry.successorInValueSet;
                        return v;
                    }
                    throw new NoSuchElementException();
                }
            };
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final boolean add(V value) {
            ValueEntry<K, V>[] valueEntryArr;
            int smearedHash = Hashing.smearedHash(value);
            int length = (valueEntryArr.length - 1) & smearedHash;
            ValueEntry<K, V> valueEntry = this.hashTable[length];
            ValueEntry<K, V> valueEntry2 = valueEntry;
            while (true) {
                boolean z = false;
                boolean z2 = true;
                if (valueEntry2 != null) {
                    if (valueEntry2.smearedValueHash != smearedHash || !Objects.equal(valueEntry2.value, value)) {
                        z2 = false;
                    }
                    if (z2) {
                        return false;
                    }
                    valueEntry2 = valueEntry2.nextInValueBucket;
                } else {
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
                    ValueEntry<K, V>[] valueEntryArr2 = this.hashTable;
                    valueEntryArr2[length] = valueEntry3;
                    int i = this.size + 1;
                    this.size = i;
                    this.modCount++;
                    int length2 = valueEntryArr2.length;
                    if (i > length2 * 1.0d && length2 < 1073741824) {
                        z = true;
                    }
                    if (z) {
                        int length3 = valueEntryArr2.length * 2;
                        ValueEntry<K, V>[] valueEntryArr3 = new ValueEntry[length3];
                        this.hashTable = valueEntryArr3;
                        int i2 = length3 - 1;
                        for (ValueSetLink valueSetLink2 = (ValueSetLink<K, V>) this.firstEntry; valueSetLink2 != this; valueSetLink2 = (ValueSetLink<K, V>) valueSetLink2.getSuccessorInValueSet()) {
                            ValueEntry<K, V> valueEntry6 = (ValueEntry) valueSetLink2;
                            int i3 = valueEntry6.smearedValueHash & i2;
                            valueEntry6.nextInValueBucket = valueEntryArr3[i3];
                            valueEntryArr3[i3] = valueEntry6;
                        }
                    }
                    return true;
                }
            }
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final boolean contains(Object o) {
            ValueEntry<K, V>[] valueEntryArr;
            int smearedHash = Hashing.smearedHash(o);
            ValueEntry<K, V> valueEntry = this.hashTable[(valueEntryArr.length - 1) & smearedHash];
            while (true) {
                boolean z = false;
                if (valueEntry == null) {
                    return false;
                }
                if (valueEntry.smearedValueHash == smearedHash && Objects.equal(valueEntry.value, o)) {
                    z = true;
                }
                if (z) {
                    return true;
                }
                valueEntry = valueEntry.nextInValueBucket;
            }
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final boolean remove(Object o) {
            ValueEntry<K, V>[] valueEntryArr;
            int smearedHash = Hashing.smearedHash(o);
            int length = (valueEntryArr.length - 1) & smearedHash;
            ValueEntry<K, V> valueEntry = this.hashTable[length];
            ValueEntry<K, V> valueEntry2 = null;
            while (true) {
                boolean z = false;
                if (valueEntry == null) {
                    return false;
                }
                if (valueEntry.smearedValueHash == smearedHash && Objects.equal(valueEntry.value, o)) {
                    z = true;
                }
                if (z) {
                    if (valueEntry2 == null) {
                        this.hashTable[length] = valueEntry.nextInValueBucket;
                    } else {
                        valueEntry2.nextInValueBucket = valueEntry.nextInValueBucket;
                    }
                    ValueSetLink<K, V> valueSetLink = valueEntry.predecessorInValueSet;
                    ValueSetLink<K, V> valueSetLink2 = valueEntry.successorInValueSet;
                    valueSetLink.setSuccessorInValueSet(valueSetLink2);
                    valueSetLink2.setPredecessorInValueSet(valueSetLink);
                    ValueEntry<K, V> valueEntry3 = valueEntry.predecessorInMultimap;
                    ValueEntry<K, V> valueEntry4 = valueEntry.successorInMultimap;
                    valueEntry3.successorInMultimap = valueEntry4;
                    valueEntry4.predecessorInMultimap = valueEntry3;
                    this.size--;
                    this.modCount++;
                    return true;
                }
                valueEntry2 = valueEntry;
                valueEntry = valueEntry.nextInValueBucket;
            }
        }

        @Override // com.google.common.collect.LinkedHashMultimap.ValueSetLink
        public final void setPredecessorInValueSet(ValueSetLink<K, V> entry) {
            this.lastEntry = entry;
        }

        @Override // com.google.common.collect.LinkedHashMultimap.ValueSetLink
        public final void setSuccessorInValueSet(ValueSetLink<K, V> entry) {
            this.firstEntry = entry;
        }

        @Override // com.google.common.collect.LinkedHashMultimap.ValueSetLink
        public final ValueSetLink<K, V> getSuccessorInValueSet() {
            return this.firstEntry;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final int size() {
            return this.size;
        }
    }

    /* loaded from: classes.dex */
    public interface ValueSetLink<K, V> {
        ValueSetLink<K, V> getSuccessorInValueSet();

        void setPredecessorInValueSet(ValueSetLink<K, V> entry);

        void setSuccessorInValueSet(ValueSetLink<K, V> entry);
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap
    public final Collection createCollection() {
        return new CompactLinkedHashSet(this.valueSetCapacity);
    }

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
        public final void setPredecessorInValueSet(ValueSetLink<K, V> entry) {
            this.predecessorInValueSet = entry;
        }

        @Override // com.google.common.collect.LinkedHashMultimap.ValueSetLink
        public final void setSuccessorInValueSet(ValueSetLink<K, V> entry) {
            this.successorInValueSet = entry;
        }

        @Override // com.google.common.collect.LinkedHashMultimap.ValueSetLink
        public final ValueSetLink<K, V> getSuccessorInValueSet() {
            return this.successorInValueSet;
        }
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.AbstractMultimap
    public final Iterator<Map.Entry<K, V>> entryIterator() {
        return new Iterator<Map.Entry<K, V>>() { // from class: com.google.common.collect.LinkedHashMultimap.1
            public ValueEntry<K, V> nextEntry;
            public ValueEntry<K, V> toRemove;

            {
                this.nextEntry = LinkedHashMultimap.this.multimapHeaderEntry.successorInMultimap;
            }

            @Override // java.util.Iterator
            public final boolean hasNext() {
                if (this.nextEntry != LinkedHashMultimap.this.multimapHeaderEntry) {
                    return true;
                }
                return false;
            }

            @Override // java.util.Iterator
            public final void remove() {
                boolean z;
                if (this.toRemove != null) {
                    z = true;
                } else {
                    z = false;
                }
                CollectPreconditions.checkRemove(z);
                LinkedHashMultimap linkedHashMultimap = LinkedHashMultimap.this;
                ValueEntry<K, V> valueEntry = this.toRemove;
                K k = valueEntry.key;
                V v = valueEntry.value;
                Collection<V> collection = linkedHashMultimap.asMap().get(k);
                if (collection != null) {
                    collection.remove(v);
                }
                this.toRemove = null;
            }

            @Override // java.util.Iterator
            public final Object next() {
                if (hasNext()) {
                    ValueEntry<K, V> valueEntry = this.nextEntry;
                    this.toRemove = valueEntry;
                    this.nextEntry = valueEntry.successorInMultimap;
                    return valueEntry;
                }
                throw new NoSuchElementException();
            }
        };
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
        stream.writeInt(super.keySet().size());
        for (K k : super.keySet()) {
            stream.writeObject(k);
        }
        stream.writeInt(this.totalSize);
        AbstractMultimap.Entries entries = this.entries;
        if (entries == null) {
            entries = new AbstractMultimap.EntrySet(this);
            this.entries = entries;
        }
        for (Map.Entry entry : (Set) entries) {
            stream.writeObject(entry.getKey());
            stream.writeObject(entry.getValue());
        }
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.Multimap
    public final void clear() {
        super.clear();
        ValueEntry<K, V> valueEntry = this.multimapHeaderEntry;
        valueEntry.successorInMultimap = valueEntry;
        valueEntry.predecessorInMultimap = valueEntry;
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap
    public final Collection<V> createCollection(K key) {
        return new ValueSet(key, this.valueSetCapacity);
    }

    @Override // com.google.common.collect.AbstractMultimap
    public final Set<K> keySet() {
        return super.keySet();
    }
}
