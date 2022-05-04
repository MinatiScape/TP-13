package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.AbstractMap;
import java.util.Map;
/* loaded from: classes.dex */
final class RegularImmutableMap<K, V> extends ImmutableMap<K, V> {
    public static final ImmutableMap<Object, Object> EMPTY = new RegularImmutableMap(null, new Object[0], 0);
    private static final long serialVersionUID = 0;
    public final transient Object[] alternatingKeysAndValues;
    public final transient Object hashTable;
    public final transient int size;

    /* loaded from: classes.dex */
    public static class EntrySet<K, V> extends ImmutableSet<Map.Entry<K, V>> {
        public final transient Object[] alternatingKeysAndValues;
        public final transient int keyOffset = 0;
        public final transient ImmutableMap<K, V> map;
        public final transient int size;

        @Override // com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection
        public final boolean contains(Object object) {
            if (!(object instanceof Map.Entry)) {
                return false;
            }
            Map.Entry entry = (Map.Entry) object;
            Object key = entry.getKey();
            Object value = entry.getValue();
            if (value == null || !value.equals(this.map.get(key))) {
                return false;
            }
            return true;
        }

        @Override // com.google.common.collect.ImmutableSet
        public final ImmutableList<Map.Entry<K, V>> createAsList() {
            return new ImmutableList<Map.Entry<K, V>>() { // from class: com.google.common.collect.RegularImmutableMap.EntrySet.1
                @Override // com.google.common.collect.ImmutableCollection
                public final boolean isPartialView() {
                    return true;
                }

                @Override // java.util.List
                public final Object get(int index) {
                    Preconditions.checkElementIndex(index, EntrySet.this.size);
                    EntrySet entrySet = EntrySet.this;
                    Object[] objArr = entrySet.alternatingKeysAndValues;
                    int i = index * 2;
                    int i2 = entrySet.keyOffset;
                    return new AbstractMap.SimpleImmutableEntry(objArr[i + i2], objArr[i + (i2 ^ 1)]);
                }

                @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
                public final int size() {
                    return EntrySet.this.size;
                }
            };
        }

        @Override // com.google.common.collect.ImmutableSet, com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
        /* renamed from: iterator */
        public final UnmodifiableIterator<Map.Entry<K, V>> mo59iterator() {
            return asList().listIterator(0);
        }

        public EntrySet(ImmutableMap immutableMap, Object[] objArr, int i) {
            this.map = immutableMap;
            this.alternatingKeysAndValues = objArr;
            this.size = i;
        }

        @Override // com.google.common.collect.ImmutableCollection
        public final int copyIntoArray(Object[] objArr) {
            return asList().copyIntoArray(objArr);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final int size() {
            return this.size;
        }
    }

    /* loaded from: classes.dex */
    public static final class KeySet<K> extends ImmutableSet<K> {
        public final transient ImmutableList<K> list;
        public final transient ImmutableMap<K, ?> map;

        @Override // com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection
        public final boolean contains(Object object) {
            if (this.map.get(object) != null) {
                return true;
            }
            return false;
        }

        @Override // com.google.common.collect.ImmutableCollection
        public final int copyIntoArray(Object[] objArr) {
            return this.list.copyIntoArray(objArr);
        }

        @Override // com.google.common.collect.ImmutableSet, com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
        /* renamed from: iterator */
        public final UnmodifiableIterator<K> mo59iterator() {
            return this.list.listIterator(0);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public final int size() {
            return this.map.size();
        }

        public KeySet(ImmutableMap<K, ?> map, ImmutableList<K> list) {
            this.map = map;
            this.list = list;
        }

        @Override // com.google.common.collect.ImmutableSet
        public final ImmutableList<K> asList() {
            return this.list;
        }
    }

    /* loaded from: classes.dex */
    public static final class KeysOrValuesAsList extends ImmutableList<Object> {
        public final transient Object[] alternatingKeysAndValues;
        public final transient int offset;
        public final transient int size;

        @Override // com.google.common.collect.ImmutableCollection
        public final boolean isPartialView() {
            return true;
        }

        @Override // java.util.List
        public final Object get(int index) {
            Preconditions.checkElementIndex(index, this.size);
            return this.alternatingKeysAndValues[(index * 2) + this.offset];
        }

        public KeysOrValuesAsList(Object[] alternatingKeysAndValues, int offset, int size) {
            this.alternatingKeysAndValues = alternatingKeysAndValues;
            this.offset = offset;
            this.size = size;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public final int size() {
            return this.size;
        }
    }

    @Override // com.google.common.collect.ImmutableMap
    public final boolean isPartialView() {
        return false;
    }

    public static IllegalArgumentException duplicateKeyException(Object key, Object value, Object[] alternatingKeysAndValues, int previousKeyIndex) {
        String valueOf = String.valueOf(key);
        String valueOf2 = String.valueOf(value);
        String valueOf3 = String.valueOf(alternatingKeysAndValues[previousKeyIndex]);
        String valueOf4 = String.valueOf(alternatingKeysAndValues[previousKeyIndex ^ 1]);
        StringBuilder sb = new StringBuilder(valueOf4.length() + valueOf3.length() + valueOf2.length() + valueOf.length() + 39);
        sb.append("Multiple entries with same key: ");
        sb.append(valueOf);
        sb.append("=");
        sb.append(valueOf2);
        sb.append(" and ");
        sb.append(valueOf3);
        sb.append("=");
        sb.append(valueOf4);
        return new IllegalArgumentException(sb.toString());
    }

    @Override // com.google.common.collect.ImmutableMap
    public final ImmutableSet<Map.Entry<K, V>> createEntrySet() {
        return new EntrySet(this, this.alternatingKeysAndValues, this.size);
    }

    @Override // com.google.common.collect.ImmutableMap
    public final ImmutableSet<K> createKeySet() {
        return new KeySet(this, new KeysOrValuesAsList(this.alternatingKeysAndValues, 0, this.size));
    }

    @Override // com.google.common.collect.ImmutableMap
    public final ImmutableCollection<V> createValues() {
        return new KeysOrValuesAsList(this.alternatingKeysAndValues, 1, this.size);
    }

    @Override // com.google.common.collect.ImmutableMap, java.util.Map
    public final V get(Object key) {
        Object obj = this.hashTable;
        Object[] objArr = this.alternatingKeysAndValues;
        int i = this.size;
        if (key == null) {
            return null;
        }
        if (i == 1) {
            if (objArr[0].equals(key)) {
                return (V) objArr[1];
            }
            return null;
        } else if (obj == null) {
            return null;
        } else {
            if (obj instanceof byte[]) {
                byte[] bArr = (byte[]) obj;
                int length = bArr.length - 1;
                int smear = Hashing.smear(key.hashCode());
                while (true) {
                    int i2 = smear & length;
                    int i3 = bArr[i2] & 255;
                    if (i3 == 255) {
                        return null;
                    }
                    if (objArr[i3].equals(key)) {
                        return (V) objArr[i3 ^ 1];
                    }
                    smear = i2 + 1;
                }
            } else if (obj instanceof short[]) {
                short[] sArr = (short[]) obj;
                int length2 = sArr.length - 1;
                int smear2 = Hashing.smear(key.hashCode());
                while (true) {
                    int i4 = smear2 & length2;
                    int i5 = sArr[i4] & 65535;
                    if (i5 == 65535) {
                        return null;
                    }
                    if (objArr[i5].equals(key)) {
                        return (V) objArr[i5 ^ 1];
                    }
                    smear2 = i4 + 1;
                }
            } else {
                int[] iArr = (int[]) obj;
                int length3 = iArr.length - 1;
                int smear3 = Hashing.smear(key.hashCode());
                while (true) {
                    int i6 = smear3 & length3;
                    int i7 = iArr[i6];
                    if (i7 == -1) {
                        return null;
                    }
                    if (objArr[i7].equals(key)) {
                        return (V) objArr[i7 ^ 1];
                    }
                    smear3 = i6 + 1;
                }
            }
        }
    }

    public RegularImmutableMap(Object hashTable, Object[] alternatingKeysAndValues, int size) {
        this.hashTable = hashTable;
        this.alternatingKeysAndValues = alternatingKeysAndValues;
        this.size = size;
    }

    @Override // java.util.Map
    public final int size() {
        return this.size;
    }
}
