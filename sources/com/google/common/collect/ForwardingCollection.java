package com.google.common.collect;

import java.util.Collection;
import java.util.Iterator;
import java.util.SortedSet;
/* loaded from: classes.dex */
public abstract class ForwardingCollection<E> extends ForwardingObject implements Collection<E> {
    @Override // com.google.common.collect.ForwardingObject
    /* renamed from: delegate */
    public abstract SortedSet mo65delegate();

    @Override // java.util.Collection
    public final Object[] toArray() {
        return mo65delegate().toArray();
    }

    @Override // java.util.Collection
    public final <T> T[] toArray(T[] array) {
        return (T[]) mo65delegate().toArray(array);
    }

    @Override // java.util.Collection
    public final boolean add(E element) {
        return mo65delegate().add(element);
    }

    @Override // java.util.Collection
    public final boolean addAll(Collection<? extends E> collection) {
        return mo65delegate().addAll(collection);
    }

    @Override // java.util.Collection
    public final void clear() {
        mo65delegate().clear();
    }

    @Override // java.util.Collection
    public final boolean contains(Object object) {
        return mo65delegate().contains(object);
    }

    @Override // java.util.Collection
    public final boolean containsAll(Collection<?> collection) {
        return mo65delegate().containsAll(collection);
    }

    @Override // java.util.Collection
    public final boolean isEmpty() {
        return mo65delegate().isEmpty();
    }

    @Override // java.util.Collection, java.lang.Iterable
    public final Iterator<E> iterator() {
        return mo65delegate().iterator();
    }

    @Override // java.util.Collection
    public final boolean remove(Object object) {
        return mo65delegate().remove(object);
    }

    @Override // java.util.Collection
    public final boolean removeAll(Collection<?> collection) {
        return mo65delegate().removeAll(collection);
    }

    @Override // java.util.Collection
    public final boolean retainAll(Collection<?> collection) {
        return mo65delegate().retainAll(collection);
    }

    @Override // java.util.Collection
    public final int size() {
        return mo65delegate().size();
    }
}
