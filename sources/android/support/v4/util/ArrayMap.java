package android.support.v4.util;

import android.support.v4.util.MapCollections;
import java.util.Collection;
import java.util.ConcurrentModificationException;
import java.util.Map;
import java.util.Set;
/* loaded from: classes.dex */
public final class ArrayMap<K, V> extends SimpleArrayMap<K, V> implements Map<K, V> {
    public AnonymousClass1 mCollections;

    /* renamed from: android.support.v4.util.ArrayMap$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public final class AnonymousClass1 extends MapCollections<Object, Object> {
        public AnonymousClass1() {
        }

        @Override // android.support.v4.util.MapCollections
        public final Object colGetEntry(int i, int i2) {
            return ArrayMap.this.mArray[(i << 1) + i2];
        }

        @Override // android.support.v4.util.MapCollections
        public final void colRemoveAt(int i) {
            ArrayMap.this.removeAt(i);
        }
    }

    @Override // java.util.Map
    public final Set<Map.Entry<K, V>> entrySet() {
        if (this.mCollections == null) {
            this.mCollections = new AnonymousClass1();
        }
        AnonymousClass1 r1 = this.mCollections;
        if (r1.mEntrySet == null) {
            r1.mEntrySet = new MapCollections.EntrySet();
        }
        return r1.mEntrySet;
    }

    @Override // java.util.Map
    public final Set<K> keySet() {
        if (this.mCollections == null) {
            this.mCollections = new AnonymousClass1();
        }
        AnonymousClass1 r1 = this.mCollections;
        if (r1.mKeySet == null) {
            r1.mKeySet = new MapCollections.KeySet();
        }
        return r1.mKeySet;
    }

    @Override // java.util.Map
    public final void putAll(Map<? extends K, ? extends V> map) {
        int size = map.size() + this.mSize;
        int i = this.mSize;
        int[] iArr = this.mHashes;
        if (iArr.length < size) {
            Object[] objArr = this.mArray;
            allocArrays(size);
            if (this.mSize > 0) {
                System.arraycopy(iArr, 0, this.mHashes, 0, i);
                System.arraycopy(objArr, 0, this.mArray, 0, i << 1);
            }
            SimpleArrayMap.freeArrays(iArr, objArr, i);
        }
        if (this.mSize == i) {
            for (Map.Entry<? extends K, ? extends V> entry : map.entrySet()) {
                put(entry.getKey(), entry.getValue());
            }
            return;
        }
        throw new ConcurrentModificationException();
    }

    @Override // java.util.Map
    public final Collection<V> values() {
        if (this.mCollections == null) {
            this.mCollections = new AnonymousClass1();
        }
        AnonymousClass1 r1 = this.mCollections;
        if (r1.mValues == null) {
            r1.mValues = new MapCollections.ValuesCollection();
        }
        return r1.mValues;
    }
}
