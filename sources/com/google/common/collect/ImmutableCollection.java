package com.google.common.collect;

import com.google.common.collect.ImmutableList;
import java.io.Serializable;
import java.lang.reflect.Array;
import java.util.AbstractCollection;
import java.util.Arrays;
import java.util.Collection;
/* loaded from: classes.dex */
public abstract class ImmutableCollection<E> extends AbstractCollection<E> implements Serializable {
    public static final Object[] EMPTY_ARRAY = new Object[0];

    /* loaded from: classes.dex */
    public static abstract class ArrayBasedBuilder<E> extends Builder<E> {
        public boolean forceCopy;
        public Object[] contents = new Object[4];
        public int size = 0;

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

        public ArrayBasedBuilder() {
            CollectPreconditions.checkNonnegative(4, "initialCapacity");
        }

        public final void add(Object element) {
            element.getClass();
            getReadyToExpandTo(this.size + 1);
            Object[] objArr = this.contents;
            int i = this.size;
            this.size = i + 1;
            objArr[i] = element;
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
    public abstract boolean contains(Object object);

    public Object[] internalArray() {
        return null;
    }

    public abstract boolean isPartialView();

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    public abstract UnmodifiableIterator<E> iterator();

    @Override // java.util.AbstractCollection, java.util.Collection
    public final Object[] toArray() {
        return toArray(EMPTY_ARRAY);
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

    public int internalArrayEnd() {
        throw new UnsupportedOperationException();
    }

    public int internalArrayStart() {
        throw new UnsupportedOperationException();
    }

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
    public final <T> T[] toArray(T[] other) {
        other.getClass();
        int size = size();
        if (other.length < size) {
            Object[] internalArray = internalArray();
            if (internalArray != null) {
                return (T[]) Arrays.copyOfRange(internalArray, internalArrayStart(), internalArrayEnd(), other.getClass());
            }
            other = (T[]) ((Object[]) Array.newInstance(other.getClass().getComponentType(), size));
        } else if (other.length > size) {
            other[size] = null;
        }
        copyIntoArray(other);
        return other;
    }

    Object writeReplace() {
        return new ImmutableList.SerializedForm(toArray());
    }

    public int copyIntoArray(Object[] objArr) {
        UnmodifiableIterator<E> it = iterator();
        int i = 0;
        while (it.hasNext()) {
            objArr[i] = it.next();
            i++;
        }
        return i;
    }
}
