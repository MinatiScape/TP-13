package com.google.common.collect;

import java.util.Iterator;
/* loaded from: classes.dex */
public abstract class TransformedIterator<F, T> implements Iterator<T> {
    public final Iterator<? extends F> backingIterator;

    public abstract T transform(F from);

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.backingIterator.hasNext();
    }

    @Override // java.util.Iterator
    public final T next() {
        return transform(this.backingIterator.next());
    }

    @Override // java.util.Iterator
    public final void remove() {
        this.backingIterator.remove();
    }

    public TransformedIterator(Iterator<? extends F> backingIterator) {
        backingIterator.getClass();
        this.backingIterator = backingIterator;
    }
}
