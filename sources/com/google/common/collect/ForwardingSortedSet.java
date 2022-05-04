package com.google.common.collect;

import java.util.Comparator;
import java.util.SortedSet;
/* loaded from: classes.dex */
public abstract class ForwardingSortedSet<E> extends ForwardingSet<E> implements SortedSet<E> {
    public abstract SortedSet<E> delegate$2();

    @Override // java.util.SortedSet
    public final Comparator<? super E> comparator() {
        return delegate$2().comparator();
    }

    @Override // java.util.SortedSet
    public final E first() {
        return delegate$2().first();
    }

    @Override // java.util.SortedSet
    public final SortedSet<E> headSet(E toElement) {
        return delegate$2().headSet(toElement);
    }

    @Override // java.util.SortedSet
    public final E last() {
        return delegate$2().last();
    }

    @Override // java.util.SortedSet
    public final SortedSet<E> subSet(E fromElement, E toElement) {
        return delegate$2().subSet(fromElement, toElement);
    }

    @Override // java.util.SortedSet
    public final SortedSet<E> tailSet(E fromElement) {
        return delegate$2().tailSet(fromElement);
    }
}
