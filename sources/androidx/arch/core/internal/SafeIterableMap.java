package androidx.arch.core.internal;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import java.util.Iterator;
import java.util.Map;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public class SafeIterableMap<K, V> implements Iterable<Map.Entry<K, V>> {
    public Entry<K, V> mEnd;
    public WeakHashMap<SupportRemove<K, V>, Boolean> mIterators = new WeakHashMap<>();
    public int mSize = 0;
    public Entry<K, V> mStart;

    /* loaded from: classes.dex */
    public static class Entry<K, V> implements Map.Entry<K, V> {
        public final K mKey;
        public Entry<K, V> mNext;
        public Entry<K, V> mPrevious;
        public final V mValue;

        @Override // java.util.Map.Entry
        public final boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof Entry)) {
                return false;
            }
            Entry entry = (Entry) obj;
            return this.mKey.equals(entry.mKey) && this.mValue.equals(entry.mValue);
        }

        @Override // java.util.Map.Entry
        public final int hashCode() {
            return this.mValue.hashCode() ^ this.mKey.hashCode();
        }

        @Override // java.util.Map.Entry
        public final V setValue(V v) {
            throw new UnsupportedOperationException("An entry modification is not supported");
        }

        public final String toString() {
            return this.mKey + "=" + this.mValue;
        }

        public Entry(K k, V v) {
            this.mKey = k;
            this.mValue = v;
        }

        @Override // java.util.Map.Entry
        public final K getKey() {
            return this.mKey;
        }

        @Override // java.util.Map.Entry
        public final V getValue() {
            return this.mValue;
        }
    }

    /* loaded from: classes.dex */
    public class IteratorWithAdditions extends SupportRemove<K, V> implements Iterator<Map.Entry<K, V>> {
        public boolean mBeforeStart = true;
        public Entry<K, V> mCurrent;

        public IteratorWithAdditions() {
        }

        @Override // java.util.Iterator
        public final boolean hasNext() {
            if (!this.mBeforeStart) {
                Entry<K, V> entry = this.mCurrent;
                if (entry == null || entry.mNext == null) {
                    return false;
                }
                return true;
            } else if (SafeIterableMap.this.mStart != null) {
                return true;
            } else {
                return false;
            }
        }

        @Override // java.util.Iterator
        public final Object next() {
            Entry<K, V> entry;
            if (this.mBeforeStart) {
                this.mBeforeStart = false;
                this.mCurrent = SafeIterableMap.this.mStart;
            } else {
                Entry<K, V> entry2 = this.mCurrent;
                if (entry2 != null) {
                    entry = entry2.mNext;
                } else {
                    entry = null;
                }
                this.mCurrent = entry;
            }
            return this.mCurrent;
        }

        @Override // androidx.arch.core.internal.SafeIterableMap.SupportRemove
        public final void supportRemove(Entry<K, V> entry) {
            boolean z;
            Entry<K, V> entry2 = this.mCurrent;
            if (entry == entry2) {
                Entry<K, V> entry3 = entry2.mPrevious;
                this.mCurrent = entry3;
                if (entry3 == null) {
                    z = true;
                } else {
                    z = false;
                }
                this.mBeforeStart = z;
            }
        }
    }

    /* loaded from: classes.dex */
    public static abstract class ListIterator<K, V> extends SupportRemove<K, V> implements Iterator<Map.Entry<K, V>> {
        public Entry<K, V> mExpectedEnd;
        public Entry<K, V> mNext;

        public abstract Entry<K, V> backward(Entry<K, V> entry);

        public abstract Entry<K, V> forward(Entry<K, V> entry);

        @Override // java.util.Iterator
        public final boolean hasNext() {
            if (this.mNext != null) {
                return true;
            }
            return false;
        }

        @Override // java.util.Iterator
        public final Object next() {
            Entry<K, V> entry;
            Entry<K, V> entry2 = this.mNext;
            Entry<K, V> entry3 = this.mExpectedEnd;
            if (entry2 == entry3 || entry3 == null) {
                entry = null;
            } else {
                entry = forward(entry2);
            }
            this.mNext = entry;
            return entry2;
        }

        @Override // androidx.arch.core.internal.SafeIterableMap.SupportRemove
        public final void supportRemove(Entry<K, V> entry) {
            Entry<K, V> entry2 = null;
            if (this.mExpectedEnd == entry && entry == this.mNext) {
                this.mNext = null;
                this.mExpectedEnd = null;
            }
            Entry<K, V> entry3 = this.mExpectedEnd;
            if (entry3 == entry) {
                this.mExpectedEnd = backward(entry3);
            }
            Entry<K, V> entry4 = this.mNext;
            if (entry4 == entry) {
                Entry<K, V> entry5 = this.mExpectedEnd;
                if (!(entry4 == entry5 || entry5 == null)) {
                    entry2 = forward(entry4);
                }
                this.mNext = entry2;
            }
        }

        public ListIterator(Entry<K, V> entry, Entry<K, V> entry2) {
            this.mExpectedEnd = entry2;
            this.mNext = entry;
        }
    }

    /* loaded from: classes.dex */
    public static abstract class SupportRemove<K, V> {
        public abstract void supportRemove(Entry<K, V> entry);
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x0048, code lost:
        if (r1.hasNext() != false) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0050, code lost:
        if (((androidx.arch.core.internal.SafeIterableMap.ListIterator) r6).hasNext() != false) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0054, code lost:
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:?, code lost:
        return true;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r6) {
        /*
            r5 = this;
            r0 = 1
            if (r6 != r5) goto L4
            return r0
        L4:
            boolean r1 = r6 instanceof androidx.arch.core.internal.SafeIterableMap
            r2 = 0
            if (r1 != 0) goto La
            return r2
        La:
            androidx.arch.core.internal.SafeIterableMap r6 = (androidx.arch.core.internal.SafeIterableMap) r6
            int r1 = r5.mSize
            int r3 = r6.mSize
            if (r1 == r3) goto L13
            return r2
        L13:
            java.util.Iterator r5 = r5.iterator()
            java.util.Iterator r6 = r6.iterator()
        L1b:
            r1 = r5
            androidx.arch.core.internal.SafeIterableMap$ListIterator r1 = (androidx.arch.core.internal.SafeIterableMap.ListIterator) r1
            boolean r3 = r1.hasNext()
            if (r3 == 0) goto L44
            r3 = r6
            androidx.arch.core.internal.SafeIterableMap$ListIterator r3 = (androidx.arch.core.internal.SafeIterableMap.ListIterator) r3
            boolean r4 = r3.hasNext()
            if (r4 == 0) goto L44
            java.lang.Object r1 = r1.next()
            java.util.Map$Entry r1 = (java.util.Map.Entry) r1
            java.lang.Object r3 = r3.next()
            if (r1 != 0) goto L3b
            if (r3 != 0) goto L43
        L3b:
            if (r1 == 0) goto L1b
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L1b
        L43:
            return r2
        L44:
            boolean r5 = r1.hasNext()
            if (r5 != 0) goto L53
            androidx.arch.core.internal.SafeIterableMap$ListIterator r6 = (androidx.arch.core.internal.SafeIterableMap.ListIterator) r6
            boolean r5 = r6.hasNext()
            if (r5 != 0) goto L53
            goto L54
        L53:
            r0 = r2
        L54:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.arch.core.internal.SafeIterableMap.equals(java.lang.Object):boolean");
    }

    public Entry<K, V> get(K k) {
        Entry<K, V> entry = this.mStart;
        while (entry != null && !entry.mKey.equals(k)) {
            entry = entry.mNext;
        }
        return entry;
    }

    @Override // java.lang.Iterable
    public final Iterator<Map.Entry<K, V>> iterator() {
        AscendingIterator ascendingIterator = new AscendingIterator(this.mStart, this.mEnd);
        this.mIterators.put(ascendingIterator, Boolean.FALSE);
        return ascendingIterator;
    }

    public final String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("[");
        Iterator<Map.Entry<K, V>> it = iterator();
        while (true) {
            ListIterator listIterator = (ListIterator) it;
            if (listIterator.hasNext()) {
                m.append(((Map.Entry) listIterator.next()).toString());
                if (listIterator.hasNext()) {
                    m.append(", ");
                }
            } else {
                m.append("]");
                return m.toString();
            }
        }
    }

    public final int hashCode() {
        Iterator<Map.Entry<K, V>> it = iterator();
        int i = 0;
        while (true) {
            ListIterator listIterator = (ListIterator) it;
            if (!listIterator.hasNext()) {
                return i;
            }
            i += ((Map.Entry) listIterator.next()).hashCode();
        }
    }

    public V remove(K k) {
        Entry<K, V> entry = get(k);
        if (entry == null) {
            return null;
        }
        this.mSize--;
        if (!this.mIterators.isEmpty()) {
            for (SupportRemove<K, V> supportRemove : this.mIterators.keySet()) {
                supportRemove.supportRemove(entry);
            }
        }
        Entry<K, V> entry2 = entry.mPrevious;
        if (entry2 != null) {
            entry2.mNext = entry.mNext;
        } else {
            this.mStart = entry.mNext;
        }
        Entry<K, V> entry3 = entry.mNext;
        if (entry3 != null) {
            entry3.mPrevious = entry2;
        } else {
            this.mEnd = entry2;
        }
        entry.mNext = null;
        entry.mPrevious = null;
        return entry.mValue;
    }

    /* loaded from: classes.dex */
    public static class AscendingIterator<K, V> extends ListIterator<K, V> {
        public AscendingIterator(Entry<K, V> entry, Entry<K, V> entry2) {
            super(entry, entry2);
        }

        @Override // androidx.arch.core.internal.SafeIterableMap.ListIterator
        public final Entry<K, V> backward(Entry<K, V> entry) {
            return entry.mPrevious;
        }

        @Override // androidx.arch.core.internal.SafeIterableMap.ListIterator
        public final Entry<K, V> forward(Entry<K, V> entry) {
            return entry.mNext;
        }
    }

    /* loaded from: classes.dex */
    public static class DescendingIterator<K, V> extends ListIterator<K, V> {
        public DescendingIterator(Entry<K, V> entry, Entry<K, V> entry2) {
            super(entry, entry2);
        }

        @Override // androidx.arch.core.internal.SafeIterableMap.ListIterator
        public final Entry<K, V> backward(Entry<K, V> entry) {
            return entry.mNext;
        }

        @Override // androidx.arch.core.internal.SafeIterableMap.ListIterator
        public final Entry<K, V> forward(Entry<K, V> entry) {
            return entry.mPrevious;
        }
    }
}
