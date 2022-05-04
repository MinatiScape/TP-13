package com.google.common.collect;

import java.util.Collection;
import java.util.Iterator;
/* loaded from: classes.dex */
public abstract class ForwardingCollection<E> extends ForwardingObject implements Collection<E> {
    @Override // java.util.Collection
    public boolean add(E element) {
        return mo31delegate().add(element);
    }

    @Override // java.util.Collection
    public boolean addAll(Collection<? extends E> collection) {
        return mo31delegate().addAll(collection);
    }

    @Override // java.util.Collection
    public void clear() {
        mo31delegate().clear();
    }

    @Override // java.util.Collection
    public boolean contains(Object object) {
        return mo31delegate().contains(object);
    }

    @Override // java.util.Collection
    public boolean containsAll(Collection<?> collection) {
        return mo31delegate().containsAll(collection);
    }

    @Override // com.google.common.collect.ForwardingObject
    /* renamed from: delegate */
    public abstract Collection<E> mo31delegate();

    @Override // java.util.Collection
    public boolean isEmpty() {
        return mo31delegate().isEmpty();
    }

    @Override // java.util.Collection, java.lang.Iterable
    public Iterator<E> iterator() {
        return mo31delegate().iterator();
    }

    @Override // java.util.Collection
    public boolean remove(Object object) {
        return mo31delegate().remove(object);
    }

    @Override // java.util.Collection
    public boolean removeAll(Collection<?> collection) {
        return mo31delegate().removeAll(collection);
    }

    @Override // java.util.Collection
    public boolean retainAll(Collection<?> collection) {
        return mo31delegate().retainAll(collection);
    }

    @Override // java.util.Collection
    public int size() {
        return mo31delegate().size();
    }

    @Override // java.util.Collection
    public Object[] toArray() {
        return mo31delegate().toArray();
    }

    @Override // java.util.Collection
    public <T> T[] toArray(T[] array) {
        return (T[]) mo31delegate().toArray(array);
    }
}
