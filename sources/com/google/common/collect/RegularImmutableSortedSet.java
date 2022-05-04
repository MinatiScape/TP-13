package com.google.common.collect;

import com.google.common.collect.ImmutableList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Set;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class RegularImmutableSortedSet<E> extends ImmutableSortedSet<E> {
    public static final RegularImmutableSortedSet<Comparable> NATURAL_EMPTY_SET = new RegularImmutableSortedSet<>(RegularImmutableList.EMPTY, NaturalOrdering.INSTANCE);
    public final transient ImmutableList<E> elements;

    @Override // com.google.common.collect.ImmutableSortedSet, java.util.NavigableSet
    public final E ceiling(E element) {
        int tailIndex = tailIndex(element, true);
        if (tailIndex == size()) {
            return null;
        }
        return this.elements.get(tailIndex);
    }

    @Override // com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection
    public final boolean contains(Object o) {
        if (o == null) {
            return false;
        }
        try {
            return Collections.binarySearch(this.elements, o, this.comparator) >= 0;
        } catch (ClassCastException unused) {
            return false;
        }
    }

    @Override // com.google.common.collect.ImmutableSet, java.util.Collection, java.util.Set
    public final boolean equals(Object object) {
        Object next;
        E next2;
        if (object == this) {
            return true;
        }
        if (!(object instanceof Set)) {
            return false;
        }
        Set set = (Set) object;
        if (size() != set.size()) {
            return false;
        }
        if (isEmpty()) {
            return true;
        }
        if (!SortedIterables.hasSameComparator(this.comparator, set)) {
            return containsAll(set);
        }
        Iterator<E> it = set.iterator();
        try {
            UnmodifiableIterator<E> it2 = mo59iterator();
            do {
                AbstractIndexedListIterator abstractIndexedListIterator = (AbstractIndexedListIterator) it2;
                if (abstractIndexedListIterator.hasNext()) {
                    next = abstractIndexedListIterator.next();
                    next2 = it.next();
                    if (next2 == null) {
                        break;
                    }
                } else {
                    return true;
                }
            } while (this.comparator.compare(next, next2) == 0);
            return false;
        } catch (ClassCastException | NoSuchElementException unused) {
            return false;
        }
    }

    @Override // com.google.common.collect.ImmutableSortedSet, java.util.NavigableSet
    public final E floor(E element) {
        int headIndex = headIndex(element, true) - 1;
        if (headIndex == -1) {
            return null;
        }
        return this.elements.get(headIndex);
    }

    @Override // com.google.common.collect.ImmutableSortedSet, java.util.NavigableSet
    public final E higher(E element) {
        int tailIndex = tailIndex(element, false);
        if (tailIndex == size()) {
            return null;
        }
        return this.elements.get(tailIndex);
    }

    @Override // com.google.common.collect.ImmutableSortedSet, java.util.NavigableSet
    public final E lower(E element) {
        int headIndex = headIndex(element, false) - 1;
        if (headIndex == -1) {
            return null;
        }
        return this.elements.get(headIndex);
    }

    static {
        ImmutableList.Itr itr = ImmutableList.EMPTY_ITR;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean containsAll(Collection<?> targets) {
        if (targets instanceof Multiset) {
            targets = ((Multiset) targets).elementSet();
        }
        if (!SortedIterables.hasSameComparator(this.comparator, targets) || targets.size() <= 1) {
            return super.containsAll(targets);
        }
        UnmodifiableIterator<E> it = mo59iterator();
        Iterator<?> it2 = targets.iterator();
        AbstractIndexedListIterator abstractIndexedListIterator = (AbstractIndexedListIterator) it;
        if (!abstractIndexedListIterator.hasNext()) {
            return false;
        }
        Object next = it2.next();
        Object next2 = abstractIndexedListIterator.next();
        while (true) {
            try {
                int compare = this.comparator.compare(next2, next);
                if (compare < 0) {
                    if (!abstractIndexedListIterator.hasNext()) {
                        return false;
                    }
                    next2 = abstractIndexedListIterator.next();
                } else if (compare == 0) {
                    if (!it2.hasNext()) {
                        return true;
                    }
                    next = it2.next();
                } else if (compare > 0) {
                    break;
                }
            } catch (ClassCastException | NullPointerException unused) {
            }
        }
        return false;
    }

    @Override // com.google.common.collect.ImmutableCollection
    public final int copyIntoArray(Object[] objArr) {
        return this.elements.copyIntoArray(objArr);
    }

    @Override // com.google.common.collect.ImmutableSortedSet
    public final ImmutableSortedSet<E> createDescendingSet() {
        Comparator reverseOrder = Collections.reverseOrder(this.comparator);
        if (isEmpty()) {
            return ImmutableSortedSet.emptySet(reverseOrder);
        }
        return new RegularImmutableSortedSet(this.elements.reverse(), reverseOrder);
    }

    @Override // com.google.common.collect.ImmutableSortedSet, java.util.NavigableSet
    public final ImmutableList.Itr descendingIterator() {
        return this.elements.reverse().listIterator(0);
    }

    public final RegularImmutableSortedSet<E> getSubSet(int newFromIndex, int newToIndex) {
        if (newFromIndex == 0 && newToIndex == size()) {
            return this;
        }
        if (newFromIndex < newToIndex) {
            return new RegularImmutableSortedSet<>(this.elements.subList(newFromIndex, newToIndex), this.comparator);
        }
        return ImmutableSortedSet.emptySet(this.comparator);
    }

    public final int headIndex(E toElement, boolean inclusive) {
        ImmutableList<E> immutableList = this.elements;
        toElement.getClass();
        int binarySearch = Collections.binarySearch(immutableList, toElement, this.comparator);
        if (binarySearch < 0) {
            return ~binarySearch;
        }
        if (inclusive) {
            return binarySearch + 1;
        }
        return binarySearch;
    }

    @Override // com.google.common.collect.ImmutableCollection
    public final Object[] internalArray() {
        return this.elements.internalArray();
    }

    @Override // com.google.common.collect.ImmutableCollection
    public final int internalArrayEnd() {
        return this.elements.internalArrayEnd();
    }

    @Override // com.google.common.collect.ImmutableCollection
    public final int internalArrayStart() {
        return this.elements.internalArrayStart();
    }

    @Override // com.google.common.collect.ImmutableCollection
    public final boolean isPartialView() {
        return this.elements.isPartialView();
    }

    @Override // com.google.common.collect.ImmutableSortedSetFauxverideShim, com.google.common.collect.ImmutableSet, com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    /* renamed from: iterator */
    public final UnmodifiableIterator<E> mo59iterator() {
        return this.elements.listIterator(0);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.elements.size();
    }

    public final int tailIndex(E fromElement, boolean inclusive) {
        ImmutableList<E> immutableList = this.elements;
        fromElement.getClass();
        int binarySearch = Collections.binarySearch(immutableList, fromElement, this.comparator);
        if (binarySearch < 0) {
            return ~binarySearch;
        }
        if (inclusive) {
            return binarySearch;
        }
        return binarySearch + 1;
    }

    public RegularImmutableSortedSet(ImmutableList<E> elements, Comparator<? super E> comparator) {
        super(comparator);
        this.elements = elements;
    }

    @Override // com.google.common.collect.ImmutableSortedSet, java.util.SortedSet
    public final E first() {
        if (!isEmpty()) {
            return this.elements.get(0);
        }
        throw new NoSuchElementException();
    }

    @Override // com.google.common.collect.ImmutableSortedSet
    public final ImmutableSortedSet<E> headSetImpl(E toElement, boolean inclusive) {
        return getSubSet(0, headIndex(toElement, inclusive));
    }

    @Override // com.google.common.collect.ImmutableSortedSet, java.util.SortedSet
    public final E last() {
        if (!isEmpty()) {
            return this.elements.get(size() - 1);
        }
        throw new NoSuchElementException();
    }

    @Override // com.google.common.collect.ImmutableSortedSet
    public final ImmutableSortedSet<E> subSetImpl(E fromElement, boolean fromInclusive, E toElement, boolean toInclusive) {
        RegularImmutableSortedSet regularImmutableSortedSet = (RegularImmutableSortedSet) tailSetImpl(fromElement, fromInclusive);
        return regularImmutableSortedSet.getSubSet(0, regularImmutableSortedSet.headIndex(toElement, toInclusive));
    }

    @Override // com.google.common.collect.ImmutableSortedSet
    public final ImmutableSortedSet<E> tailSetImpl(E fromElement, boolean inclusive) {
        return getSubSet(tailIndex(fromElement, inclusive), size());
    }

    @Override // com.google.common.collect.ImmutableSet
    public final ImmutableList<E> asList() {
        return this.elements;
    }
}
