package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.ArrayDeque;
import java.util.Collection;
import java.util.Deque;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Objects;
/* loaded from: classes.dex */
public final class Iterators {

    /* loaded from: classes.dex */
    public static final class ArrayItr<T> extends AbstractIndexedListIterator<T> {
        public static final AbstractIndexedListIterator<Object> EMPTY = new ArrayItr(new Object[0], 0, 0, 0);
        public final T[] array;
        public final int offset;

        public ArrayItr(T[] array, int offset, int length, int index) {
            super(length, index);
            this.array = array;
            this.offset = offset;
        }

        @Override // com.google.common.collect.AbstractIndexedListIterator
        public T get(int index) {
            return this.array[this.offset + index];
        }
    }

    /* loaded from: classes.dex */
    public static class ConcatenatedIterator<T> implements Iterator<T> {
        public Iterator<? extends T> iterator = ArrayItr.EMPTY;
        public Deque<Iterator<? extends Iterator<? extends T>>> metaIterators;
        public Iterator<? extends T> toRemove;
        public Iterator<? extends Iterator<? extends T>> topMetaIterator;

        public ConcatenatedIterator(Iterator<? extends Iterator<? extends T>> metaIterator) {
            Objects.requireNonNull(metaIterator);
            this.topMetaIterator = metaIterator;
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            Iterator<? extends Iterator<? extends T>> it;
            while (true) {
                Iterator<? extends T> it2 = this.iterator;
                Objects.requireNonNull(it2);
                if (it2.hasNext()) {
                    return true;
                }
                while (true) {
                    Iterator<? extends Iterator<? extends T>> it3 = this.topMetaIterator;
                    if (it3 != null && it3.hasNext()) {
                        it = this.topMetaIterator;
                        break;
                    }
                    Deque<Iterator<? extends Iterator<? extends T>>> deque = this.metaIterators;
                    if (deque == null || deque.isEmpty()) {
                        break;
                    }
                    this.topMetaIterator = this.metaIterators.removeFirst();
                }
                it = null;
                this.topMetaIterator = it;
                if (it == null) {
                    return false;
                }
                Iterator<? extends T> next = it.next();
                this.iterator = next;
                if (next instanceof ConcatenatedIterator) {
                    ConcatenatedIterator concatenatedIterator = (ConcatenatedIterator) next;
                    this.iterator = concatenatedIterator.iterator;
                    if (this.metaIterators == null) {
                        this.metaIterators = new ArrayDeque();
                    }
                    this.metaIterators.addFirst(this.topMetaIterator);
                    if (concatenatedIterator.metaIterators != null) {
                        while (!concatenatedIterator.metaIterators.isEmpty()) {
                            this.metaIterators.addFirst(concatenatedIterator.metaIterators.removeLast());
                        }
                    }
                    this.topMetaIterator = concatenatedIterator.topMetaIterator;
                }
            }
        }

        @Override // java.util.Iterator
        public T next() {
            if (hasNext()) {
                Iterator<? extends T> it = this.iterator;
                this.toRemove = it;
                return it.next();
            }
            throw new NoSuchElementException();
        }

        @Override // java.util.Iterator
        public void remove() {
            Preconditions.checkState(this.toRemove != null, "no calls to next() since the last call to remove()");
            this.toRemove.remove();
            this.toRemove = null;
        }
    }

    /* loaded from: classes.dex */
    public enum EmptyModifiableIterator implements Iterator<Object> {
        INSTANCE;

        @Override // java.util.Iterator
        public boolean hasNext() {
            return false;
        }

        @Override // java.util.Iterator
        public Object next() {
            throw new NoSuchElementException();
        }

        @Override // java.util.Iterator
        public void remove() {
            Preconditions.checkState(false, "no calls to next() since the last call to remove()");
        }
    }

    /* loaded from: classes.dex */
    public static class PeekingImpl<E> implements PeekingIterator<E> {
        public boolean hasPeeked;
        public final Iterator<? extends E> iterator;
        public E peekedElement;

        public PeekingImpl(Iterator<? extends E> iterator) {
            Objects.requireNonNull(iterator);
            this.iterator = iterator;
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this.hasPeeked || this.iterator.hasNext();
        }

        @Override // java.util.Iterator
        public E next() {
            if (!this.hasPeeked) {
                return this.iterator.next();
            }
            E e = this.peekedElement;
            this.hasPeeked = false;
            this.peekedElement = null;
            return e;
        }

        @Override // java.util.Iterator
        public void remove() {
            Preconditions.checkState(!this.hasPeeked, "Can't remove after you've peeked at next");
            this.iterator.remove();
        }
    }

    public static <T> boolean addAll(Collection<T> addTo, Iterator<? extends T> iterator) {
        Objects.requireNonNull(iterator);
        boolean z = false;
        while (iterator.hasNext()) {
            z |= addTo.add(iterator.next());
        }
        return z;
    }

    public static void clear(Iterator<?> iterator) {
        while (iterator.hasNext()) {
            iterator.next();
            iterator.remove();
        }
    }

    public static <T> T getNext(Iterator<? extends T> iterator, T defaultValue) {
        return iterator.hasNext() ? iterator.next() : defaultValue;
    }

    public static <T> T pollNext(Iterator<T> iterator) {
        if (!iterator.hasNext()) {
            return null;
        }
        T next = iterator.next();
        iterator.remove();
        return next;
    }
}
