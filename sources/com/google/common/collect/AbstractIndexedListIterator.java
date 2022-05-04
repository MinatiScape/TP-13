package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.ListIterator;
import java.util.NoSuchElementException;
/* loaded from: classes.dex */
public abstract class AbstractIndexedListIterator<E> extends UnmodifiableIterator<Object> implements ListIterator<Object> {
    public int position;
    public final int size;

    @Override // java.util.ListIterator
    public final /* bridge */ /* synthetic */ void add(Object obj) {
        add$com$google$common$collect$UnmodifiableListIterator(obj);
        throw null;
    }

    public abstract E get(int index);

    @Override // java.util.ListIterator
    public final /* bridge */ /* synthetic */ void set(Object obj) {
        set$com$google$common$collect$UnmodifiableListIterator(obj);
        throw null;
    }

    @Deprecated
    public final void add$com$google$common$collect$UnmodifiableListIterator(Object e) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Iterator, java.util.ListIterator
    public final boolean hasNext() {
        if (this.position < this.size) {
            return true;
        }
        return false;
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        if (this.position > 0) {
            return true;
        }
        return false;
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        return this.position - 1;
    }

    @Deprecated
    public final void set$com$google$common$collect$UnmodifiableListIterator(Object e) {
        throw new UnsupportedOperationException();
    }

    public AbstractIndexedListIterator(int size, int position) {
        Preconditions.checkPositionIndex(position, size);
        this.size = size;
        this.position = position;
    }

    @Override // java.util.Iterator, java.util.ListIterator
    public final E next() {
        if (hasNext()) {
            int i = this.position;
            this.position = i + 1;
            return get(i);
        }
        throw new NoSuchElementException();
    }

    @Override // java.util.ListIterator
    public final E previous() {
        if (hasPrevious()) {
            int i = this.position - 1;
            this.position = i;
            return get(i);
        }
        throw new NoSuchElementException();
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        return this.position;
    }
}
