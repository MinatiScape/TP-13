package android.support.v4.util;

import java.lang.reflect.Array;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;
/* loaded from: classes.dex */
public abstract class MapCollections<K, V> {
    public MapCollections<K, V>.EntrySet mEntrySet;
    public MapCollections<K, V>.KeySet mKeySet;
    public MapCollections<K, V>.ValuesCollection mValues;

    /* loaded from: classes.dex */
    public final class ArrayIterator<T> implements Iterator<T> {
        public boolean mCanRemove = false;
        public int mIndex;
        public final int mOffset;
        public int mSize;

        public ArrayIterator(int i) {
            this.mOffset = i;
            this.mSize = ArrayMap.this.mSize;
        }

        @Override // java.util.Iterator
        public final boolean hasNext() {
            if (this.mIndex < this.mSize) {
                return true;
            }
            return false;
        }

        @Override // java.util.Iterator
        public final void remove() {
            if (this.mCanRemove) {
                int i = this.mIndex - 1;
                this.mIndex = i;
                this.mSize--;
                this.mCanRemove = false;
                MapCollections.this.colRemoveAt(i);
                return;
            }
            throw new IllegalStateException();
        }

        @Override // java.util.Iterator
        public final T next() {
            if (hasNext()) {
                T t = (T) MapCollections.this.colGetEntry(this.mIndex, this.mOffset);
                this.mIndex++;
                this.mCanRemove = true;
                return t;
            }
            throw new NoSuchElementException();
        }
    }

    /* loaded from: classes.dex */
    public final class EntrySet implements Set<Map.Entry<K, V>> {
        @Override // java.util.Set, java.util.Collection
        public final Object[] toArray() {
            throw new UnsupportedOperationException();
        }

        public EntrySet() {
        }

        @Override // java.util.Set, java.util.Collection
        public final boolean add(Object obj) {
            Map.Entry entry = (Map.Entry) obj;
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Set, java.util.Collection
        public final boolean addAll(Collection<? extends Map.Entry<K, V>> collection) {
            int i = ArrayMap.this.mSize;
            for (Map.Entry<K, V> entry : collection) {
                MapCollections mapCollections = MapCollections.this;
                ArrayMap.this.put(entry.getKey(), entry.getValue());
            }
            if (i != ArrayMap.this.mSize) {
                return true;
            }
            return false;
        }

        @Override // java.util.Set, java.util.Collection
        public final void clear() {
            ArrayMap.this.clear();
        }

        @Override // java.util.Set, java.util.Collection
        public final boolean contains(Object obj) {
            if (!(obj instanceof Map.Entry)) {
                return false;
            }
            Map.Entry entry = (Map.Entry) obj;
            MapCollections mapCollections = MapCollections.this;
            int indexOfKey = ArrayMap.this.indexOfKey(entry.getKey());
            if (indexOfKey < 0) {
                return false;
            }
            Object colGetEntry = MapCollections.this.colGetEntry(indexOfKey, 1);
            Object value = entry.getValue();
            if (colGetEntry == value || (colGetEntry != null && colGetEntry.equals(value))) {
                return true;
            }
            return false;
        }

        @Override // java.util.Set, java.util.Collection
        public final int hashCode() {
            int i;
            int i2;
            int i3 = 0;
            for (int i4 = ArrayMap.this.mSize - 1; i4 >= 0; i4--) {
                Object colGetEntry = MapCollections.this.colGetEntry(i4, 0);
                Object colGetEntry2 = MapCollections.this.colGetEntry(i4, 1);
                if (colGetEntry == null) {
                    i = 0;
                } else {
                    i = colGetEntry.hashCode();
                }
                if (colGetEntry2 == null) {
                    i2 = 0;
                } else {
                    i2 = colGetEntry2.hashCode();
                }
                i3 += i ^ i2;
            }
            return i3;
        }

        @Override // java.util.Set, java.util.Collection
        public final boolean isEmpty() {
            if (ArrayMap.this.mSize == 0) {
                return true;
            }
            return false;
        }

        @Override // java.util.Set, java.util.Collection, java.lang.Iterable
        public final Iterator<Map.Entry<K, V>> iterator() {
            return new MapIterator();
        }

        @Override // java.util.Set, java.util.Collection
        public final boolean remove(Object obj) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Set, java.util.Collection
        public final boolean removeAll(Collection<?> collection) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Set, java.util.Collection
        public final boolean retainAll(Collection<?> collection) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Set, java.util.Collection
        public final int size() {
            return ArrayMap.this.mSize;
        }

        @Override // java.util.Set, java.util.Collection
        public final <T> T[] toArray(T[] tArr) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Set, java.util.Collection
        public final boolean containsAll(Collection<?> collection) {
            Iterator<?> it = collection.iterator();
            while (it.hasNext()) {
                if (!contains(it.next())) {
                    return false;
                }
            }
            return true;
        }

        @Override // java.util.Set, java.util.Collection
        public final boolean equals(Object obj) {
            return MapCollections.equalsSetHelper(this, obj);
        }
    }

    /* loaded from: classes.dex */
    public final class KeySet implements Set<K> {
        @Override // java.util.Set, java.util.Collection
        public final Object[] toArray() {
            MapCollections mapCollections = MapCollections.this;
            mapCollections.getClass();
            int i = ArrayMap.this.mSize;
            Object[] objArr = new Object[i];
            for (int i2 = 0; i2 < i; i2++) {
                objArr[i2] = mapCollections.colGetEntry(i2, 0);
            }
            return objArr;
        }

        public KeySet() {
        }

        @Override // java.util.Set, java.util.Collection
        public final boolean add(K k) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Set, java.util.Collection
        public final boolean addAll(Collection<? extends K> collection) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Set, java.util.Collection
        public final void clear() {
            ArrayMap.this.clear();
        }

        @Override // java.util.Set, java.util.Collection
        public final boolean contains(Object obj) {
            if (ArrayMap.this.indexOfKey(obj) >= 0) {
                return true;
            }
            return false;
        }

        @Override // java.util.Set, java.util.Collection
        public final boolean containsAll(Collection<?> collection) {
            ArrayMap arrayMap = ArrayMap.this;
            Iterator<?> it = collection.iterator();
            while (it.hasNext()) {
                if (!arrayMap.containsKey(it.next())) {
                    return false;
                }
            }
            return true;
        }

        @Override // java.util.Set, java.util.Collection
        public final int hashCode() {
            int i;
            int i2 = 0;
            for (int i3 = ArrayMap.this.mSize - 1; i3 >= 0; i3--) {
                Object colGetEntry = MapCollections.this.colGetEntry(i3, 0);
                if (colGetEntry == null) {
                    i = 0;
                } else {
                    i = colGetEntry.hashCode();
                }
                i2 += i;
            }
            return i2;
        }

        @Override // java.util.Set, java.util.Collection
        public final boolean isEmpty() {
            if (ArrayMap.this.mSize == 0) {
                return true;
            }
            return false;
        }

        @Override // java.util.Set, java.util.Collection, java.lang.Iterable
        public final Iterator<K> iterator() {
            return new ArrayIterator(0);
        }

        @Override // java.util.Set, java.util.Collection
        public final boolean remove(Object obj) {
            int indexOfKey = ArrayMap.this.indexOfKey(obj);
            if (indexOfKey < 0) {
                return false;
            }
            MapCollections.this.colRemoveAt(indexOfKey);
            return true;
        }

        @Override // java.util.Set, java.util.Collection
        public final boolean removeAll(Collection<?> collection) {
            ArrayMap arrayMap = ArrayMap.this;
            int size = arrayMap.size();
            Iterator<?> it = collection.iterator();
            while (it.hasNext()) {
                arrayMap.remove(it.next());
            }
            if (size != arrayMap.size()) {
                return true;
            }
            return false;
        }

        @Override // java.util.Set, java.util.Collection
        public final boolean retainAll(Collection<?> collection) {
            ArrayMap arrayMap = ArrayMap.this;
            int size = arrayMap.size();
            Iterator<K> it = arrayMap.keySet().iterator();
            while (it.hasNext()) {
                if (!collection.contains(it.next())) {
                    it.remove();
                }
            }
            if (size != arrayMap.size()) {
                return true;
            }
            return false;
        }

        @Override // java.util.Set, java.util.Collection
        public final int size() {
            return ArrayMap.this.mSize;
        }

        @Override // java.util.Set, java.util.Collection
        public final boolean equals(Object obj) {
            return MapCollections.equalsSetHelper(this, obj);
        }

        @Override // java.util.Set, java.util.Collection
        public final <T> T[] toArray(T[] tArr) {
            return (T[]) MapCollections.this.toArrayHelper(tArr, 0);
        }
    }

    /* loaded from: classes.dex */
    public final class MapIterator implements Iterator<Map.Entry<K, V>>, Map.Entry<K, V> {
        public int mEnd;
        public boolean mEntryValid = false;
        public int mIndex = -1;

        public MapIterator() {
            this.mEnd = ArrayMap.this.mSize - 1;
        }

        @Override // java.util.Map.Entry
        public final boolean equals(Object obj) {
            boolean z;
            boolean z2;
            if (!this.mEntryValid) {
                throw new IllegalStateException("This container does not support retaining Map.Entry objects");
            } else if (!(obj instanceof Map.Entry)) {
                return false;
            } else {
                Map.Entry entry = (Map.Entry) obj;
                Object key = entry.getKey();
                Object colGetEntry = MapCollections.this.colGetEntry(this.mIndex, 0);
                if (key == colGetEntry || (key != null && key.equals(colGetEntry))) {
                    z = true;
                } else {
                    z = false;
                }
                if (!z) {
                    return false;
                }
                Object value = entry.getValue();
                Object colGetEntry2 = MapCollections.this.colGetEntry(this.mIndex, 1);
                if (value == colGetEntry2 || (value != null && value.equals(colGetEntry2))) {
                    z2 = true;
                } else {
                    z2 = false;
                }
                if (z2) {
                    return true;
                }
                return false;
            }
        }

        @Override // java.util.Map.Entry
        public final K getKey() {
            if (this.mEntryValid) {
                return (K) MapCollections.this.colGetEntry(this.mIndex, 0);
            }
            throw new IllegalStateException("This container does not support retaining Map.Entry objects");
        }

        @Override // java.util.Map.Entry
        public final V getValue() {
            if (this.mEntryValid) {
                return (V) MapCollections.this.colGetEntry(this.mIndex, 1);
            }
            throw new IllegalStateException("This container does not support retaining Map.Entry objects");
        }

        @Override // java.util.Iterator
        public final boolean hasNext() {
            if (this.mIndex < this.mEnd) {
                return true;
            }
            return false;
        }

        @Override // java.util.Map.Entry
        public final int hashCode() {
            int i;
            if (this.mEntryValid) {
                int i2 = 0;
                Object colGetEntry = MapCollections.this.colGetEntry(this.mIndex, 0);
                Object colGetEntry2 = MapCollections.this.colGetEntry(this.mIndex, 1);
                if (colGetEntry == null) {
                    i = 0;
                } else {
                    i = colGetEntry.hashCode();
                }
                if (colGetEntry2 != null) {
                    i2 = colGetEntry2.hashCode();
                }
                return i ^ i2;
            }
            throw new IllegalStateException("This container does not support retaining Map.Entry objects");
        }

        @Override // java.util.Iterator
        public final void remove() {
            if (this.mEntryValid) {
                MapCollections.this.colRemoveAt(this.mIndex);
                this.mIndex--;
                this.mEnd--;
                this.mEntryValid = false;
                return;
            }
            throw new IllegalStateException();
        }

        @Override // java.util.Map.Entry
        public final V setValue(V v) {
            if (this.mEntryValid) {
                MapCollections mapCollections = MapCollections.this;
                int i = (this.mIndex << 1) + 1;
                Object[] objArr = ArrayMap.this.mArray;
                V v2 = (V) objArr[i];
                objArr[i] = v;
                return v2;
            }
            throw new IllegalStateException("This container does not support retaining Map.Entry objects");
        }

        public final String toString() {
            return getKey() + "=" + getValue();
        }

        @Override // java.util.Iterator
        public final Object next() {
            if (hasNext()) {
                this.mIndex++;
                this.mEntryValid = true;
                return this;
            }
            throw new NoSuchElementException();
        }
    }

    /* loaded from: classes.dex */
    public final class ValuesCollection implements Collection<V> {
        @Override // java.util.Collection
        public final Object[] toArray() {
            MapCollections mapCollections = MapCollections.this;
            mapCollections.getClass();
            int i = ArrayMap.this.mSize;
            Object[] objArr = new Object[i];
            for (int i2 = 0; i2 < i; i2++) {
                objArr[i2] = mapCollections.colGetEntry(i2, 1);
            }
            return objArr;
        }

        public ValuesCollection() {
        }

        @Override // java.util.Collection
        public final boolean add(V v) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Collection
        public final boolean addAll(Collection<? extends V> collection) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Collection
        public final void clear() {
            ArrayMap.this.clear();
        }

        @Override // java.util.Collection
        public final boolean contains(Object obj) {
            if (ArrayMap.this.indexOfValue(obj) >= 0) {
                return true;
            }
            return false;
        }

        @Override // java.util.Collection
        public final boolean isEmpty() {
            if (ArrayMap.this.mSize == 0) {
                return true;
            }
            return false;
        }

        @Override // java.util.Collection, java.lang.Iterable
        public final Iterator<V> iterator() {
            return new ArrayIterator(1);
        }

        @Override // java.util.Collection
        public final boolean remove(Object obj) {
            int indexOfValue = ArrayMap.this.indexOfValue(obj);
            if (indexOfValue < 0) {
                return false;
            }
            MapCollections.this.colRemoveAt(indexOfValue);
            return true;
        }

        @Override // java.util.Collection
        public final boolean removeAll(Collection<?> collection) {
            int i = ArrayMap.this.mSize;
            int i2 = 0;
            boolean z = false;
            while (i2 < i) {
                if (collection.contains(MapCollections.this.colGetEntry(i2, 1))) {
                    MapCollections.this.colRemoveAt(i2);
                    i2--;
                    i--;
                    z = true;
                }
                i2++;
            }
            return z;
        }

        @Override // java.util.Collection
        public final boolean retainAll(Collection<?> collection) {
            int i = ArrayMap.this.mSize;
            int i2 = 0;
            boolean z = false;
            while (i2 < i) {
                if (!collection.contains(MapCollections.this.colGetEntry(i2, 1))) {
                    MapCollections.this.colRemoveAt(i2);
                    i2--;
                    i--;
                    z = true;
                }
                i2++;
            }
            return z;
        }

        @Override // java.util.Collection
        public final int size() {
            return ArrayMap.this.mSize;
        }

        @Override // java.util.Collection
        public final boolean containsAll(Collection<?> collection) {
            Iterator<?> it = collection.iterator();
            while (it.hasNext()) {
                if (!contains(it.next())) {
                    return false;
                }
            }
            return true;
        }

        @Override // java.util.Collection
        public final <T> T[] toArray(T[] tArr) {
            return (T[]) MapCollections.this.toArrayHelper(tArr, 1);
        }
    }

    public static <T> boolean equalsSetHelper(Set<T> set, Object obj) {
        if (set == obj) {
            return true;
        }
        if (obj instanceof Set) {
            Set set2 = (Set) obj;
            try {
                if (set.size() == set2.size()) {
                    if (set.containsAll(set2)) {
                        return true;
                    }
                }
                return false;
            } catch (ClassCastException | NullPointerException unused) {
            }
        }
        return false;
    }

    public abstract Object colGetEntry(int i, int i2);

    public abstract void colRemoveAt(int i);

    /* JADX WARN: Multi-variable type inference failed */
    public final <T> T[] toArrayHelper(T[] tArr, int i) {
        int i2 = ArrayMap.this.mSize;
        if (tArr.length < i2) {
            tArr = (T[]) ((Object[]) Array.newInstance(tArr.getClass().getComponentType(), i2));
        }
        for (int i3 = 0; i3 < i2; i3++) {
            tArr[i3] = colGetEntry(i3, i);
        }
        if (tArr.length > i2) {
            tArr[i2] = null;
        }
        return tArr;
    }
}
