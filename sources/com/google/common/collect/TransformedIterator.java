package com.google.common.collect;

import java.util.Iterator;
import java.util.Objects;
/* loaded from: classes.dex */
public abstract class TransformedIterator<F, T> implements Iterator<T> {
    public final Iterator<? extends F> backingIterator;

    public TransformedIterator(Iterator<? extends F> backingIterator) {
        Objects.requireNonNull(backingIterator);
        this.backingIterator = backingIterator;
    }

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

    public abstract T transform(F from);
}
