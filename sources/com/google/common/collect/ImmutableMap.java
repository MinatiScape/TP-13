package com.google.common.collect;

import com.google.common.collect.ImmutableCollection;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Collection;
import java.util.Map;
/* loaded from: classes.dex */
public abstract class ImmutableMap<K, V> implements Map<K, V>, Serializable {
    public transient ImmutableSet<Map.Entry<K, V>> entrySet;
    public transient ImmutableSet<K> keySet;
    public transient ImmutableCollection<V> values;

    /* loaded from: classes.dex */
    public static class Builder<K, V> {
        public Object[] alternatingKeysAndValues;
        public int size = 0;

        public Builder<K, V> put(K key, V value) {
            int i = (this.size + 1) * 2;
            Object[] objArr = this.alternatingKeysAndValues;
            if (i > objArr.length) {
                this.alternatingKeysAndValues = Arrays.copyOf(objArr, ImmutableCollection.Builder.expandedCapacity(objArr.length, i));
            }
            CollectPreconditions.checkEntryNotNull(key, value);
            Object[] objArr2 = this.alternatingKeysAndValues;
            int i2 = this.size;
            int i3 = i2 * 2;
            objArr2[i3] = key;
            objArr2[i3 + 1] = value;
            this.size = i2 + 1;
            return this;
        }

        /* JADX WARN: Code restructure failed: missing block: B:18:0x0061, code lost:
            r3[r8] = (byte) r5;
            r4 = r4 + 1;
         */
        /* JADX WARN: Code restructure failed: missing block: B:32:0x00a4, code lost:
            r3[r8] = (short) r5;
            r4 = r4 + 1;
         */
        /* JADX WARN: Code restructure failed: missing block: B:43:0x00db, code lost:
            r3[r9] = r6;
            r4 = r4 + 1;
         */
        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r10v0, types: [int] */
        /* JADX WARN: Type inference failed for: r3v3, types: [int[]] */
        /* JADX WARN: Type inference failed for: r3v5 */
        /* JADX WARN: Type inference failed for: r9v7 */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public com.google.common.collect.ImmutableMap<K, V> build() {
            /*
                Method dump skipped, instructions count: 247
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.common.collect.ImmutableMap.Builder.build():com.google.common.collect.ImmutableMap");
        }

        public Builder<K, V> putAll(Iterable<? extends Map.Entry<? extends K, ? extends V>> entries) {
            if (entries instanceof Collection) {
                int size = (((Collection) entries).size() + this.size) * 2;
                Object[] objArr = this.alternatingKeysAndValues;
                if (size > objArr.length) {
                    this.alternatingKeysAndValues = Arrays.copyOf(objArr, ImmutableCollection.Builder.expandedCapacity(objArr.length, size));
                }
            }
            for (Map.Entry<? extends K, ? extends V> entry : entries) {
                put(entry);
            }
            return this;
        }

        public Builder(int initialCapacity) {
            this.alternatingKeysAndValues = new Object[initialCapacity * 2];
        }

        /* JADX WARN: Multi-variable type inference failed */
        public void put(Map.Entry entry) {
            put(entry.getKey(), entry.getValue());
        }
    }

    /* loaded from: classes.dex */
    public static class SerializedForm implements Serializable {
        private static final long serialVersionUID = 0;
        private final Object[] keys;
        private final Object[] values;

        /* JADX WARN: Multi-variable type inference failed */
        public final ImmutableMap createMap(Builder builder) {
            int i = 0;
            while (true) {
                Object[] objArr = this.keys;
                if (i >= objArr.length) {
                    return builder.build();
                }
                builder.put(objArr[i], this.values[i]);
                i++;
            }
        }

        public Object readResolve() {
            return createMap(new Builder(this.keys.length));
        }

        public SerializedForm(ImmutableMap<?, ?> map) {
            this.keys = new Object[map.size()];
            this.values = new Object[map.size()];
            UnmodifiableIterator<Map.Entry<?, ?>> it = map.entrySet().iterator();
            int i = 0;
            while (it.hasNext()) {
                Map.Entry<?, ?> next = it.next();
                this.keys[i] = next.getKey();
                this.values[i] = next.getValue();
                i++;
            }
        }
    }

    public abstract ImmutableSet<Map.Entry<K, V>> createEntrySet();

    public abstract ImmutableSet<K> createKeySet();

    public abstract ImmutableCollection<V> createValues();

    @Override // java.util.Map
    public abstract V get(Object key);

    public abstract boolean isPartialView();

    @Override // java.util.Map
    @Deprecated
    public final void clear() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public ImmutableSet<Map.Entry<K, V>> entrySet() {
        ImmutableSet<Map.Entry<K, V>> immutableSet = this.entrySet;
        if (immutableSet != null) {
            return immutableSet;
        }
        ImmutableSet<Map.Entry<K, V>> createEntrySet = createEntrySet();
        this.entrySet = createEntrySet;
        return createEntrySet;
    }

    @Override // java.util.Map
    public final boolean equals(Object object) {
        if (this == object) {
            return true;
        }
        if (object instanceof Map) {
            return entrySet().equals(((Map) object).entrySet());
        }
        return false;
    }

    @Override // java.util.Map
    public ImmutableSet<K> keySet() {
        ImmutableSet<K> immutableSet = this.keySet;
        if (immutableSet != null) {
            return immutableSet;
        }
        ImmutableSet<K> createKeySet = createKeySet();
        this.keySet = createKeySet;
        return createKeySet;
    }

    @Override // java.util.Map
    @Deprecated
    public final V put(K k, V v) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    @Deprecated
    public final void putAll(Map<? extends K, ? extends V> map) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    @Deprecated
    public final V remove(Object o) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public ImmutableCollection<V> values() {
        ImmutableCollection<V> immutableCollection = this.values;
        if (immutableCollection != null) {
            return immutableCollection;
        }
        ImmutableCollection<V> createValues = createValues();
        this.values = createValues;
        return createValues;
    }

    Object writeReplace() {
        return new SerializedForm(this);
    }

    @Override // java.util.Map
    public final boolean containsKey(Object key) {
        if (get(key) != null) {
            return true;
        }
        return false;
    }

    @Override // java.util.Map
    public final boolean containsValue(Object value) {
        return values().contains(value);
    }

    @Override // java.util.Map
    public final V getOrDefault(Object key, V defaultValue) {
        V v = get(key);
        if (v != null) {
            return v;
        }
        return defaultValue;
    }

    @Override // java.util.Map
    public final int hashCode() {
        return Sets.hashCodeImpl(entrySet());
    }

    @Override // java.util.Map
    public final boolean isEmpty() {
        if (size() == 0) {
            return true;
        }
        return false;
    }

    public final String toString() {
        return Maps.toStringImpl(this);
    }
}
