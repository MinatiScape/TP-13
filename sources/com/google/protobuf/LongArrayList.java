package com.google.protobuf;

import androidx.exifinterface.media.ExifInterface$$ExternalSyntheticOutline0;
import com.google.protobuf.Internal;
import java.nio.charset.Charset;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;
/* loaded from: classes.dex */
public final class LongArrayList extends AbstractProtobufList<Long> implements RandomAccess, PrimitiveNonBoxingCollection {
    public long[] array;
    public int size;

    public LongArrayList() {
        throw null;
    }

    public final void addLong(long j) {
        addLong(this.size, j);
    }

    @Override // com.google.protobuf.AbstractProtobufList, java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof LongArrayList)) {
            return super.equals(obj);
        }
        LongArrayList longArrayList = (LongArrayList) obj;
        if (this.size != longArrayList.size) {
            return false;
        }
        long[] jArr = longArrayList.array;
        for (int i = 0; i < this.size; i++) {
            if (this.array[i] != jArr[i]) {
                return false;
            }
        }
        return true;
    }

    @Override // com.google.protobuf.AbstractProtobufList, java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int i = 1;
        for (int i2 = 0; i2 < this.size; i2++) {
            i = (i * 31) + Internal.hashLong(this.array[i2]);
        }
        return i;
    }

    @Override // com.google.protobuf.AbstractProtobufList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean remove(Object obj) {
        ensureIsMutable();
        for (int i = 0; i < this.size; i++) {
            if (obj.equals(Long.valueOf(this.array[i]))) {
                long[] jArr = this.array;
                System.arraycopy(jArr, i + 1, jArr, i, (this.size - i) - 1);
                this.size--;
                ((AbstractList) this).modCount++;
                return true;
            }
        }
        return false;
    }

    static {
        new LongArrayList(new long[0], 0).isMutable = false;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i, Object obj) {
        addLong(i, ((Long) obj).longValue());
    }

    public final void addLong(int i, long j) {
        int i2;
        ensureIsMutable();
        if (i < 0 || i > (i2 = this.size)) {
            StringBuilder m = ExifInterface$$ExternalSyntheticOutline0.m("Index:", i, ", Size:");
            m.append(this.size);
            throw new IndexOutOfBoundsException(m.toString());
        }
        long[] jArr = this.array;
        if (i2 < jArr.length) {
            System.arraycopy(jArr, i, jArr, i + 1, i2 - i);
        } else {
            long[] jArr2 = new long[((i2 * 3) / 2) + 1];
            System.arraycopy(jArr, 0, jArr2, 0, i);
            System.arraycopy(this.array, i, jArr2, i + 1, this.size - i);
            this.array = jArr2;
        }
        this.array[i] = j;
        this.size++;
        ((AbstractList) this).modCount++;
    }

    public final void ensureIndexInRange(int i) {
        if (i < 0 || i >= this.size) {
            StringBuilder m = ExifInterface$$ExternalSyntheticOutline0.m("Index:", i, ", Size:");
            m.append(this.size);
            throw new IndexOutOfBoundsException(m.toString());
        }
    }

    @Override // com.google.protobuf.Internal.ProtobufList
    public final Internal.ProtobufList mutableCopyWithCapacity(int i) {
        if (i >= this.size) {
            return new LongArrayList(Arrays.copyOf(this.array, i), this.size);
        }
        throw new IllegalArgumentException();
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i, Object obj) {
        long longValue = ((Long) obj).longValue();
        ensureIsMutable();
        ensureIndexInRange(i);
        long[] jArr = this.array;
        long j = jArr[i];
        jArr[i] = longValue;
        return Long.valueOf(j);
    }

    public LongArrayList(long[] jArr, int i) {
        this.array = jArr;
        this.size = i;
    }

    @Override // com.google.protobuf.AbstractProtobufList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection<? extends Long> collection) {
        ensureIsMutable();
        Charset charset = Internal.UTF_8;
        collection.getClass();
        if (!(collection instanceof LongArrayList)) {
            return super.addAll(collection);
        }
        LongArrayList longArrayList = (LongArrayList) collection;
        int i = longArrayList.size;
        if (i == 0) {
            return false;
        }
        int i2 = this.size;
        if (Integer.MAX_VALUE - i2 >= i) {
            int i3 = i2 + i;
            long[] jArr = this.array;
            if (i3 > jArr.length) {
                this.array = Arrays.copyOf(jArr, i3);
            }
            System.arraycopy(longArrayList.array, 0, this.array, this.size, longArrayList.size);
            this.size = i3;
            ((AbstractList) this).modCount++;
            return true;
        }
        throw new OutOfMemoryError();
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i) {
        ensureIndexInRange(i);
        return Long.valueOf(this.array[i]);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i, int i2) {
        ensureIsMutable();
        if (i2 >= i) {
            long[] jArr = this.array;
            System.arraycopy(jArr, i2, jArr, i, this.size - i2);
            this.size -= i2 - i;
            ((AbstractList) this).modCount++;
            return;
        }
        throw new IndexOutOfBoundsException("toIndex < fromIndex");
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object remove(int i) {
        int i2;
        ensureIsMutable();
        ensureIndexInRange(i);
        long[] jArr = this.array;
        long j = jArr[i];
        if (i < this.size - 1) {
            System.arraycopy(jArr, i + 1, jArr, i, (i2 - i) - 1);
        }
        this.size--;
        ((AbstractList) this).modCount++;
        return Long.valueOf(j);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.size;
    }
}
