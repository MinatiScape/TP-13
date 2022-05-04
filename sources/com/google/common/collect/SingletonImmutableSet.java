package com.google.common.collect;

import com.adobe.xmp.impl.ParseRDF$$ExternalSyntheticOutline0;
import com.google.common.collect.ImmutableList;
import java.util.NoSuchElementException;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class SingletonImmutableSet<E> extends ImmutableSet<E> {
    public transient int cachedHashCode;
    public final transient E element;

    public SingletonImmutableSet(E element) {
        element.getClass();
        this.element = element;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return 1;
    }

    @Override // com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection
    public final boolean contains(Object target) {
        return this.element.equals(target);
    }

    @Override // com.google.common.collect.ImmutableCollection
    public final int copyIntoArray(Object[] objArr) {
        objArr[0] = this.element;
        return 1;
    }

    @Override // com.google.common.collect.ImmutableSet
    public final ImmutableList<E> createAsList() {
        E e = this.element;
        ImmutableList.Itr itr = ImmutableList.EMPTY_ITR;
        Object[] objArr = {e};
        ObjectArrays.checkElementsNotNull(objArr, 1);
        return ImmutableList.asImmutableList(objArr, 1);
    }

    @Override // com.google.common.collect.ImmutableSet, java.util.Collection, java.util.Set
    public final int hashCode() {
        int i = this.cachedHashCode;
        if (i != 0) {
            return i;
        }
        int hashCode = this.element.hashCode();
        this.cachedHashCode = hashCode;
        return hashCode;
    }

    @Override // com.google.common.collect.ImmutableSet
    public final boolean isHashCodeFast() {
        if (this.cachedHashCode != 0) {
            return true;
        }
        return false;
    }

    @Override // com.google.common.collect.ImmutableSet, com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    /* renamed from: iterator */
    public final UnmodifiableIterator<E> mo59iterator() {
        final E e = this.element;
        return (UnmodifiableIterator<E>) new UnmodifiableIterator<Object>() { // from class: com.google.common.collect.Iterators.9
            public boolean done;

            @Override // java.util.Iterator
            public final boolean hasNext() {
                return !this.done;
            }

            @Override // java.util.Iterator
            public final Object next() {
                if (!this.done) {
                    this.done = true;
                    return e;
                }
                throw new NoSuchElementException();
            }
        };
    }

    @Override // java.util.AbstractCollection
    public final String toString() {
        String obj = this.element.toString();
        StringBuilder sb = new StringBuilder(ParseRDF$$ExternalSyntheticOutline0.m(obj, 2));
        sb.append('[');
        sb.append(obj);
        sb.append(']');
        return sb.toString();
    }

    public SingletonImmutableSet(E element, int hashCode) {
        this.element = element;
        this.cachedHashCode = hashCode;
    }
}
