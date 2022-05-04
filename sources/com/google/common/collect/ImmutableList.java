package com.google.common.collect;

import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableCollection;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.RandomAccess;
/* loaded from: classes.dex */
public abstract class ImmutableList<E> extends ImmutableCollection<E> implements List<E>, RandomAccess {
    public static final Itr EMPTY_ITR = new Itr(RegularImmutableList.EMPTY, 0);

    /* loaded from: classes.dex */
    public static final class Builder<E> extends ImmutableCollection.ArrayBasedBuilder<E> {
    }

    /* loaded from: classes.dex */
    public static class Itr<E> extends AbstractIndexedListIterator<E> {
        public final ImmutableList<E> list;

        @Override // com.google.common.collect.AbstractIndexedListIterator
        public final E get(int index) {
            return this.list.get(index);
        }

        public Itr(ImmutableList<E> list, int index) {
            super(list.size(), index);
            this.list = list;
        }
    }

    /* loaded from: classes.dex */
    public static class ReverseImmutableList<E> extends ImmutableList<E> {
        public final transient ImmutableList<E> forwardList;

        @Override // com.google.common.collect.ImmutableList, com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection
        public final boolean contains(Object object) {
            return this.forwardList.contains(object);
        }

        @Override // com.google.common.collect.ImmutableList, java.util.List
        public final int indexOf(Object object) {
            int lastIndexOf = this.forwardList.lastIndexOf(object);
            if (lastIndexOf >= 0) {
                return (size() - 1) - lastIndexOf;
            }
            return -1;
        }

        @Override // com.google.common.collect.ImmutableCollection
        public final boolean isPartialView() {
            return this.forwardList.isPartialView();
        }

        @Override // com.google.common.collect.ImmutableList, java.util.List
        public final int lastIndexOf(Object object) {
            int indexOf = this.forwardList.indexOf(object);
            if (indexOf >= 0) {
                return (size() - 1) - indexOf;
            }
            return -1;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public final int size() {
            return this.forwardList.size();
        }

        @Override // com.google.common.collect.ImmutableList, java.util.List
        public final ImmutableList<E> subList(int fromIndex, int toIndex) {
            Preconditions.checkPositionIndexes(fromIndex, toIndex, size());
            return this.forwardList.subList(size() - toIndex, size() - fromIndex).reverse();
        }

        public ReverseImmutableList(ImmutableList<E> backingList) {
            this.forwardList = backingList;
        }

        @Override // java.util.List
        public final E get(int index) {
            Preconditions.checkElementIndex(index, size());
            return this.forwardList.get((size() - 1) - index);
        }

        @Override // com.google.common.collect.ImmutableList
        public final ImmutableList<E> reverse() {
            return this.forwardList;
        }
    }

    /* loaded from: classes.dex */
    public static class SerializedForm implements Serializable {
        private static final long serialVersionUID = 0;
        public final Object[] elements;

        public Object readResolve() {
            return ImmutableList.copyOf(this.elements);
        }

        public SerializedForm(Object[] elements) {
            this.elements = elements;
        }
    }

    /* loaded from: classes.dex */
    public class SubList extends ImmutableList<E> {
        public final transient int length;
        public final transient int offset;

        @Override // com.google.common.collect.ImmutableCollection
        public final boolean isPartialView() {
            return true;
        }

        public SubList(int offset, int length) {
            this.offset = offset;
            this.length = length;
        }

        @Override // java.util.List
        public final E get(int index) {
            Preconditions.checkElementIndex(index, this.length);
            return ImmutableList.this.get(index + this.offset);
        }

        @Override // com.google.common.collect.ImmutableCollection
        public final Object[] internalArray() {
            return ImmutableList.this.internalArray();
        }

        @Override // com.google.common.collect.ImmutableCollection
        public final int internalArrayEnd() {
            return ImmutableList.this.internalArrayStart() + this.offset + this.length;
        }

        @Override // com.google.common.collect.ImmutableCollection
        public final int internalArrayStart() {
            return ImmutableList.this.internalArrayStart() + this.offset;
        }

        @Override // com.google.common.collect.ImmutableList, java.util.List
        public final ImmutableList<E> subList(int fromIndex, int toIndex) {
            Preconditions.checkPositionIndexes(fromIndex, toIndex, this.length);
            ImmutableList immutableList = ImmutableList.this;
            int i = this.offset;
            return immutableList.subList(fromIndex + i, toIndex + i);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public final int size() {
            return this.length;
        }
    }

    public static <E> ImmutableList<E> copyOf(E[] elements) {
        if (elements.length == 0) {
            return (ImmutableList<E>) RegularImmutableList.EMPTY;
        }
        Object[] objArr = (Object[]) elements.clone();
        ObjectArrays.checkElementsNotNull(objArr, objArr.length);
        return asImmutableList(objArr, objArr.length);
    }

    @Override // java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof List) {
            List list = (List) obj;
            int size = size();
            if (size == list.size()) {
                if (list instanceof RandomAccess) {
                    for (int i = 0; i < size; i++) {
                        if (Objects.equal(get(i), list.get(i))) {
                        }
                    }
                    return true;
                }
                Iterator<E> it = list.iterator();
                for (E e : this) {
                    if (it.hasNext()) {
                        if (!Objects.equal(e, it.next())) {
                        }
                    }
                }
                return !it.hasNext();
            }
        }
        return false;
    }

    @Override // java.util.List
    public int indexOf(Object object) {
        if (object == null) {
            return -1;
        }
        int size = size();
        for (int i = 0; i < size; i++) {
            if (object.equals(get(i))) {
                return i;
            }
        }
        return -1;
    }

    @Override // com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    /* renamed from: iterator */
    public final UnmodifiableIterator<E> mo59iterator() {
        return listIterator(0);
    }

    @Override // java.util.List
    public int lastIndexOf(Object object) {
        if (object == null) {
            return -1;
        }
        for (int size = size() - 1; size >= 0; size--) {
            if (object.equals(get(size))) {
                return size;
            }
        }
        return -1;
    }

    public static <E> ImmutableList<E> asImmutableList(Object[] elements, int length) {
        if (length == 0) {
            return (ImmutableList<E>) RegularImmutableList.EMPTY;
        }
        return new RegularImmutableList(elements, length);
    }

    private void readObject(ObjectInputStream stream) throws InvalidObjectException {
        throw new InvalidObjectException("Use SerializedForm");
    }

    @Override // java.util.List
    @Deprecated
    public final void add(int index, E element) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List
    @Deprecated
    public final boolean addAll(int index, Collection<? extends E> newElements) {
        throw new UnsupportedOperationException();
    }

    @Override // com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    /* renamed from: iterator  reason: collision with other method in class */
    public final Iterator mo59iterator() {
        return listIterator(0);
    }

    @Override // java.util.List
    public final ListIterator listIterator() {
        return listIterator(0);
    }

    @Override // java.util.List
    @Deprecated
    public final E remove(int index) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List
    @Deprecated
    public final E set(int index, E element) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List
    public ImmutableList<E> subList(int fromIndex, int toIndex) {
        Preconditions.checkPositionIndexes(fromIndex, toIndex, size());
        int i = toIndex - fromIndex;
        if (i == size()) {
            return this;
        }
        if (i == 0) {
            return (ImmutableList<E>) RegularImmutableList.EMPTY;
        }
        return new SubList(fromIndex, i);
    }

    @Override // com.google.common.collect.ImmutableCollection
    public Object writeReplace() {
        return new SerializedForm(toArray());
    }

    @Override // com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection
    public boolean contains(Object object) {
        if (indexOf(object) >= 0) {
            return true;
        }
        return false;
    }

    @Override // com.google.common.collect.ImmutableCollection
    public int copyIntoArray(Object[] objArr) {
        int size = size();
        for (int i = 0; i < size; i++) {
            objArr[0 + i] = get(i);
        }
        return 0 + size;
    }

    @Override // java.util.Collection, java.util.List
    public final int hashCode() {
        int size = size();
        int i = 1;
        for (int i2 = 0; i2 < size; i2++) {
            i = ~(~(get(i2).hashCode() + (i * 31)));
        }
        return i;
    }

    @Override // java.util.List
    public final Itr listIterator(int index) {
        Preconditions.checkPositionIndex(index, size());
        if (isEmpty()) {
            return EMPTY_ITR;
        }
        return new Itr(this, index);
    }

    public ImmutableList<E> reverse() {
        if (size() <= 1) {
            return this;
        }
        return new ReverseImmutableList(this);
    }

    public static <E> ImmutableList<E> of() {
        return (ImmutableList<E>) RegularImmutableList.EMPTY;
    }
}
