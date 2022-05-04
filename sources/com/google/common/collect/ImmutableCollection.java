package com.google.common.collect;

import com.google.common.collect.ImmutableList;
import java.io.Serializable;
import java.util.AbstractCollection;
import java.util.Arrays;
import java.util.Collection;
import java.util.Objects;
/* loaded from: classes.dex */
public abstract class ImmutableCollection<E> extends AbstractCollection<E> implements Serializable {
    public static final Object[] EMPTY_ARRAY = new Object[0];

    /* loaded from: classes.dex */
    public static abstract class ArrayBasedBuilder<E> extends Builder<E> {
        public Object[] contents;
        public boolean forceCopy;
        public int size = 0;

        public ArrayBasedBuilder(int initialCapacity) {
            CollectPreconditions.checkNonnegative(initialCapacity, "initialCapacity");
            this.contents = new Object[initialCapacity];
        }

        public ArrayBasedBuilder<E> add(E element) {
            Objects.requireNonNull(element);
            getReadyToExpandTo(this.size + 1);
            Object[] objArr = this.contents;
            int i = this.size;
            this.size = i + 1;
            objArr[i] = element;
            return this;
        }

        public final void getReadyToExpandTo(int minCapacity) {
            Object[] objArr = this.contents;
            if (objArr.length < minCapacity) {
                this.contents = Arrays.copyOf(objArr, Builder.expandedCapacity(objArr.length, minCapacity));
                this.forceCopy = false;
            } else if (this.forceCopy) {
                this.contents = (Object[]) objArr.clone();
                this.forceCopy = false;
            }
        }
    }

    /* loaded from: classes.dex */
    public static abstract class Builder<E> {
        public static int expandedCapacity(int oldCapacity, int minCapacity) {
            if (minCapacity >= 0) {
                int i = oldCapacity + (oldCapacity >> 1) + 1;
                if (i < minCapacity) {
                    i = Integer.highestOneBit(minCapacity - 1) << 1;
                }
                if (i < 0) {
                    return Integer.MAX_VALUE;
                }
                return i;
            }
            throw new AssertionError("cannot store more than MAX_VALUE elements");
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    @Deprecated
    public final boolean add(E e) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    @Deprecated
    public final boolean addAll(Collection<? extends E> newElements) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    @Deprecated
    public final void clear() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public abstract boolean contains(Object object);

    public int copyIntoArray(Object[] dst, int offset) {
        UnmodifiableIterator<E> it = iterator();
        while (it.hasNext()) {
            offset++;
            dst[offset] = it.next();
        }
        return offset;
    }

    public Object[] internalArray() {
        return null;
    }

    public int internalArrayEnd() {
        throw new UnsupportedOperationException();
    }

    public int internalArrayStart() {
        throw new UnsupportedOperationException();
    }

    public abstract boolean isPartialView();

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    public abstract UnmodifiableIterator<E> iterator();

    @Override // java.util.AbstractCollection, java.util.Collection
    @Deprecated
    public final boolean remove(Object object) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    @Deprecated
    public final boolean removeAll(Collection<?> oldElements) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    @Deprecated
    public final boolean retainAll(Collection<?> elementsToKeep) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final Object[] toArray() {
        return toArray(EMPTY_ARRAY);
    }

    Object writeReplace() {
        return new ImmutableList.SerializedForm(toArray());
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final <T> T[] toArray(T[] other) {
        Objects.requireNonNull(other);
        int size = size();
        if (other.length < size) {
            Object[] internalArray = internalArray();
            if (internalArray != null) {
                return (T[]) Arrays.copyOfRange(internalArray, internalArrayStart(), internalArrayEnd(), other.getClass());
            }
            other = (T[]) ObjectArrays.newArray(other, size);
        } else if (other.length > size) {
            other[size] = null;
        }
        copyIntoArray(other, 0);
        return other;
    }
}
