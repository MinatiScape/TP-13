package com.google.common.collect;

import com.adobe.xmp.XMPPathFactory$$ExternalSyntheticOutline0;
import java.util.NoSuchElementException;
import java.util.Objects;
/* loaded from: classes.dex */
public final class SingletonImmutableSet<E> extends ImmutableSet<E> {
    public transient int cachedHashCode;
    public final transient E element;

    public SingletonImmutableSet(E element) {
        Objects.requireNonNull(element);
        this.element = element;
    }

    @Override // com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection
    public boolean contains(Object target) {
        return this.element.equals(target);
    }

    @Override // com.google.common.collect.ImmutableCollection
    public int copyIntoArray(Object[] dst, int offset) {
        dst[offset] = this.element;
        return offset + 1;
    }

    @Override // com.google.common.collect.ImmutableSet
    public ImmutableList<E> createAsList() {
        return ImmutableList.of((Object) this.element);
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
    public boolean isHashCodeFast() {
        return this.cachedHashCode != 0;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public int size() {
        return 1;
    }

    @Override // java.util.AbstractCollection
    public String toString() {
        String obj = this.element.toString();
        StringBuilder sb = new StringBuilder(XMPPathFactory$$ExternalSyntheticOutline0.m(obj, 2));
        sb.append('[');
        sb.append(obj);
        sb.append(']');
        return sb.toString();
    }

    @Override // com.google.common.collect.ImmutableSet, com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    public UnmodifiableIterator<E> iterator() {
        final E e = this.element;
        return (UnmodifiableIterator<E>) new UnmodifiableIterator<?>() { // from class: com.google.common.collect.Iterators.9
            public boolean done;

            @Override // java.util.Iterator
            public boolean hasNext() {
                return !this.done;
            }

            @Override // java.util.Iterator
            public Object next() {
                if (!this.done) {
                    this.done = true;
                    return e;
                }
                throw new NoSuchElementException();
            }
        };
    }

    public SingletonImmutableSet(E element, int hashCode) {
        this.element = element;
        this.cachedHashCode = hashCode;
    }
}
