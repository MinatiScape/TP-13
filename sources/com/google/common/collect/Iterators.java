package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.collect.FluentIterable;
import java.util.ArrayDeque;
import java.util.Iterator;
import java.util.NoSuchElementException;
/* loaded from: classes.dex */
public final class Iterators {

    /* loaded from: classes.dex */
    public static final class ArrayItr<T> extends AbstractIndexedListIterator<T> {
        public static final ArrayItr EMPTY = new ArrayItr(new Object[0]);
        public final T[] array;
        public final int offset = 0;

        /* JADX WARN: Multi-variable type inference failed */
        public ArrayItr(Object[] objArr) {
            super(0, 0);
            this.array = objArr;
        }

        @Override // com.google.common.collect.AbstractIndexedListIterator
        public final T get(int index) {
            return this.array[this.offset + index];
        }
    }

    /* loaded from: classes.dex */
    public static class ConcatenatedIterator<T> implements Iterator<T> {
        public Iterator<? extends T> iterator = ArrayItr.EMPTY;
        public ArrayDeque metaIterators;
        public Iterator<? extends T> toRemove;
        public Iterator<? extends Iterator<? extends T>> topMetaIterator;

        @Override // java.util.Iterator
        public final boolean hasNext() {
            Iterator<? extends Iterator<? extends T>> it;
            while (true) {
                Iterator<? extends T> it2 = this.iterator;
                it2.getClass();
                if (it2.hasNext()) {
                    return true;
                }
                while (true) {
                    Iterator<? extends Iterator<? extends T>> it3 = this.topMetaIterator;
                    if (it3 != null && it3.hasNext()) {
                        it = this.topMetaIterator;
                        break;
                    }
                    ArrayDeque arrayDeque = this.metaIterators;
                    if (arrayDeque == null || arrayDeque.isEmpty()) {
                        break;
                    }
                    this.topMetaIterator = (Iterator) this.metaIterators.removeFirst();
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
                            this.metaIterators.addFirst((Iterator) concatenatedIterator.metaIterators.removeLast());
                        }
                    }
                    this.topMetaIterator = concatenatedIterator.topMetaIterator;
                }
            }
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
            this.toRemove.remove();
            this.toRemove = null;
        }

        public ConcatenatedIterator(FluentIterable.AnonymousClass3.AnonymousClass1 metaIterator) {
            this.topMetaIterator = metaIterator;
        }

        @Override // java.util.Iterator
        public final T next() {
            if (hasNext()) {
                Iterator<? extends T> it = this.iterator;
                this.toRemove = it;
                return it.next();
            }
            throw new NoSuchElementException();
        }
    }

    /* JADX WARN: Failed to restore enum class, 'enum' modifier removed */
    /* loaded from: classes.dex */
    public static final class EmptyModifiableIterator extends Enum<EmptyModifiableIterator> implements Iterator<Object> {
        public static final /* synthetic */ EmptyModifiableIterator[] $VALUES;
        public static final EmptyModifiableIterator INSTANCE;

        @Override // java.util.Iterator
        public final boolean hasNext() {
            return false;
        }

        @Override // java.util.Iterator
        public final void remove() {
            CollectPreconditions.checkRemove(false);
        }

        static {
            EmptyModifiableIterator emptyModifiableIterator = new EmptyModifiableIterator();
            INSTANCE = emptyModifiableIterator;
            $VALUES = new EmptyModifiableIterator[]{emptyModifiableIterator};
        }

        public static EmptyModifiableIterator valueOf(String name) {
            return (EmptyModifiableIterator) Enum.valueOf(EmptyModifiableIterator.class, name);
        }

        public static EmptyModifiableIterator[] values() {
            return (EmptyModifiableIterator[]) $VALUES.clone();
        }

        @Override // java.util.Iterator
        public final Object next() {
            throw new NoSuchElementException();
        }
    }

    /* loaded from: classes.dex */
    public static class PeekingImpl<E> implements PeekingIterator<E> {
        public boolean hasPeeked;
        public final Iterator<? extends E> iterator;
        public E peekedElement;

        @Override // java.util.Iterator
        public final boolean hasNext() {
            if (this.hasPeeked || this.iterator.hasNext()) {
                return true;
            }
            return false;
        }

        @Override // java.util.Iterator
        public final E next() {
            if (!this.hasPeeked) {
                return this.iterator.next();
            }
            E e = this.peekedElement;
            this.hasPeeked = false;
            this.peekedElement = null;
            return e;
        }

        @Override // java.util.Iterator
        public final void remove() {
            Preconditions.checkState(!this.hasPeeked, "Can't remove after you've peeked at next");
            this.iterator.remove();
        }

        public PeekingImpl(Iterator<? extends E> iterator) {
            iterator.getClass();
            this.iterator = iterator;
        }
    }

    public static void clear(Iterator<?> iterator) {
        iterator.getClass();
        while (iterator.hasNext()) {
            iterator.next();
            iterator.remove();
        }
    }

    public static Object getNext(Iterator it) {
        if (it.hasNext()) {
            return it.next();
        }
        return null;
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
