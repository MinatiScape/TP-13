package com.google.common.collect;

import java.util.Comparator;
import java.util.SortedSet;
/* loaded from: classes.dex */
public abstract class ForwardingSortedSet<E> extends ForwardingSet<E> implements SortedSet<E> {
    @Override // java.util.SortedSet
    public Comparator<? super E> comparator() {
        return mo31delegate().comparator();
    }

    @Override // com.google.common.collect.ForwardingSet, com.google.common.collect.ForwardingCollection, com.google.common.collect.ForwardingObject
    /* renamed from: delegate */
    public abstract SortedSet<E> mo31delegate();

    @Override // java.util.SortedSet
    public E first() {
        return mo31delegate().first();
    }

    @Override // java.util.SortedSet
    public SortedSet<E> headSet(E toElement) {
        return mo31delegate().headSet(toElement);
    }

    @Override // java.util.SortedSet
    public E last() {
        return mo31delegate().last();
    }

    @Override // java.util.SortedSet
    public SortedSet<E> subSet(E fromElement, E toElement) {
        return mo31delegate().subSet(fromElement, toElement);
    }

    @Override // java.util.SortedSet
    public SortedSet<E> tailSet(E fromElement) {
        return mo31delegate().tailSet(fromElement);
    }
}
