package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableSet;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Comparator;
import java.util.NavigableSet;
import java.util.SortedSet;
/* loaded from: classes.dex */
public abstract class ImmutableSortedSet<E> extends ImmutableSortedSetFauxverideShim<E> implements NavigableSet<E>, SortedIterable<E> {
    public static final /* synthetic */ int $r8$clinit = 0;
    public final transient Comparator<? super E> comparator;
    public transient ImmutableSortedSet<E> descendingSet;

    /* loaded from: classes.dex */
    public static final class Builder<E> extends ImmutableSet.Builder<E> {
        public final Comparator<? super E> comparator;

        @Override // com.google.common.collect.ImmutableSet.Builder
        public final ImmutableSortedSet<E> build() {
            RegularImmutableSortedSet regularImmutableSortedSet;
            Object[] objArr = this.contents;
            Comparator<? super E> comparator = this.comparator;
            int i = this.size;
            if (i == 0) {
                regularImmutableSortedSet = ImmutableSortedSet.emptySet(comparator);
            } else {
                int i2 = ImmutableSortedSet.$r8$clinit;
                ObjectArrays.checkElementsNotNull(objArr, i);
                Arrays.sort(objArr, 0, i, comparator);
                int i3 = 1;
                for (int i4 = 1; i4 < i; i4++) {
                    Object obj = objArr[i4];
                    if (comparator.compare(obj, objArr[i3 - 1]) != 0) {
                        objArr[i3] = obj;
                        i3++;
                    }
                }
                Arrays.fill(objArr, i3, i, (Object) null);
                if (i3 < objArr.length / 2) {
                    objArr = Arrays.copyOf(objArr, i3);
                }
                regularImmutableSortedSet = new RegularImmutableSortedSet(ImmutableList.asImmutableList(objArr, i3), comparator);
            }
            this.size = regularImmutableSortedSet.size();
            this.forceCopy = true;
            return regularImmutableSortedSet;
        }

        public Builder(Comparator<? super E> comparator) {
            comparator.getClass();
            this.comparator = comparator;
        }

        @Override // com.google.common.collect.ImmutableSet.Builder
        public final void add$1(Object element) {
            super.add$1(element);
        }
    }

    /* loaded from: classes.dex */
    public static class SerializedForm<E> implements Serializable {
        private static final long serialVersionUID = 0;
        public final Comparator<? super E> comparator;
        public final Object[] elements;

        public Object readResolve() {
            Builder builder = new Builder(this.comparator);
            Object[] objArr = this.elements;
            if (builder.hashTable != null) {
                for (Object obj : objArr) {
                    builder.add$1(obj);
                }
            } else {
                ObjectArrays.checkElementsNotNull(objArr, objArr.length);
                builder.getReadyToExpandTo(builder.size + objArr.length);
                System.arraycopy(objArr, 0, builder.contents, builder.size, objArr.length);
                builder.size += objArr.length;
            }
            return builder.build();
        }

        public SerializedForm(Comparator<? super E> comparator, Object[] elements) {
            this.comparator = comparator;
            this.elements = elements;
        }
    }

    public abstract ImmutableSortedSet<E> createDescendingSet();

    @Override // java.util.NavigableSet
    public abstract ImmutableList.Itr descendingIterator();

    /* JADX WARN: Multi-variable type inference failed */
    @Override // java.util.NavigableSet
    public final NavigableSet headSet(Object toElement, boolean inclusive) {
        toElement.getClass();
        return headSetImpl(toElement, inclusive);
    }

    public abstract ImmutableSortedSet<E> headSetImpl(E toElement, boolean inclusive);

    /* JADX WARN: Multi-variable type inference failed */
    @Override // java.util.NavigableSet
    public final NavigableSet subSet(Object fromElement, boolean fromInclusive, Object toElement, boolean toInclusive) {
        fromElement.getClass();
        toElement.getClass();
        Preconditions.checkArgument(this.comparator.compare(fromElement, toElement) <= 0);
        return subSetImpl(fromElement, fromInclusive, toElement, toInclusive);
    }

    public abstract ImmutableSortedSet<E> subSetImpl(E fromElement, boolean fromInclusive, E toElement, boolean toInclusive);

    /* JADX WARN: Multi-variable type inference failed */
    @Override // java.util.NavigableSet
    public final NavigableSet tailSet(Object fromElement, boolean inclusive) {
        fromElement.getClass();
        return tailSetImpl(fromElement, inclusive);
    }

    public abstract ImmutableSortedSet<E> tailSetImpl(E fromElement, boolean inclusive);

    public static <E> RegularImmutableSortedSet<E> emptySet(Comparator<? super E> comparator) {
        if (NaturalOrdering.INSTANCE.equals(comparator)) {
            return (RegularImmutableSortedSet<E>) RegularImmutableSortedSet.NATURAL_EMPTY_SET;
        }
        return new RegularImmutableSortedSet<>(RegularImmutableList.EMPTY, comparator);
    }

    private void readObject(ObjectInputStream unused) throws InvalidObjectException {
        throw new InvalidObjectException("Use SerializedForm");
    }

    @Override // java.util.NavigableSet
    public final NavigableSet descendingSet() {
        ImmutableSortedSet<E> immutableSortedSet = this.descendingSet;
        if (immutableSortedSet != null) {
            return immutableSortedSet;
        }
        ImmutableSortedSet<E> createDescendingSet = createDescendingSet();
        this.descendingSet = createDescendingSet;
        createDescendingSet.descendingSet = this;
        return createDescendingSet;
    }

    @Override // java.util.NavigableSet
    @Deprecated
    public final E pollFirst() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.NavigableSet
    @Deprecated
    public final E pollLast() {
        throw new UnsupportedOperationException();
    }

    @Override // com.google.common.collect.ImmutableSet, com.google.common.collect.ImmutableCollection
    public Object writeReplace() {
        return new SerializedForm(this.comparator, toArray());
    }

    public ImmutableSortedSet(Comparator<? super E> comparator) {
        this.comparator = comparator;
    }

    @Override // java.util.NavigableSet
    public E ceiling(E e) {
        e.getClass();
        return (E) Iterators.getNext(tailSetImpl(e, true).iterator());
    }

    @Override // java.util.SortedSet
    public E first() {
        return iterator().next();
    }

    @Override // java.util.NavigableSet
    public E floor(E e) {
        e.getClass();
        return (E) Iterators.getNext(headSetImpl(e, true).descendingIterator());
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // java.util.NavigableSet, java.util.SortedSet
    public final SortedSet headSet(Object toElement) {
        toElement.getClass();
        return headSetImpl(toElement, false);
    }

    @Override // java.util.NavigableSet
    public E higher(E e) {
        e.getClass();
        return (E) Iterators.getNext(tailSetImpl(e, false).iterator());
    }

    @Override // java.util.SortedSet
    public E last() {
        return descendingIterator().next();
    }

    @Override // java.util.NavigableSet
    public E lower(E e) {
        e.getClass();
        return (E) Iterators.getNext(headSetImpl(e, false).descendingIterator());
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // java.util.NavigableSet, java.util.SortedSet
    public final SortedSet tailSet(Object fromElement) {
        fromElement.getClass();
        return tailSetImpl(fromElement, true);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // java.util.NavigableSet, java.util.SortedSet
    public final SortedSet subSet(Object fromElement, Object toElement) {
        fromElement.getClass();
        toElement.getClass();
        Preconditions.checkArgument(this.comparator.compare(fromElement, toElement) <= 0);
        return subSetImpl(fromElement, true, toElement, false);
    }

    @Override // java.util.SortedSet, com.google.common.collect.SortedIterable
    public final Comparator<? super E> comparator() {
        return this.comparator;
    }
}
