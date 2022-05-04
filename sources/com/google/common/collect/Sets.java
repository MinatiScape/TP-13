package com.google.common.collect;

import java.io.Serializable;
import java.util.AbstractSet;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.NavigableSet;
import java.util.Set;
import java.util.SortedSet;
/* loaded from: classes.dex */
public final class Sets {

    /* loaded from: classes.dex */
    public static final class UnmodifiableNavigableSet<E> extends ForwardingSortedSet<E> implements NavigableSet<E>, Serializable {
        private static final long serialVersionUID = 0;
        private final NavigableSet<E> delegate;
        public transient UnmodifiableNavigableSet<E> descendingSet;
        private final SortedSet<E> unmodifiableDelegate;

        @Override // com.google.common.collect.ForwardingCollection, com.google.common.collect.ForwardingObject
        /* renamed from: delegate */
        public final Object mo65delegate() {
            return this.unmodifiableDelegate;
        }

        @Override // java.util.NavigableSet
        public final E ceiling(E e) {
            return this.delegate.ceiling(e);
        }

        @Override // com.google.common.collect.ForwardingCollection, com.google.common.collect.ForwardingObject
        /* renamed from: delegate  reason: collision with other method in class */
        public final SortedSet mo65delegate() {
            return this.unmodifiableDelegate;
        }

        @Override // java.util.NavigableSet
        public final Iterator<E> descendingIterator() {
            final Iterator<E> descendingIterator = this.delegate.descendingIterator();
            descendingIterator.getClass();
            if (descendingIterator instanceof UnmodifiableIterator) {
                return (UnmodifiableIterator) descendingIterator;
            }
            return new UnmodifiableIterator<Object>() { // from class: com.google.common.collect.Iterators.1
                @Override // java.util.Iterator
                public final boolean hasNext() {
                    return descendingIterator.hasNext();
                }

                @Override // java.util.Iterator
                public final Object next() {
                    return descendingIterator.next();
                }
            };
        }

        @Override // java.util.NavigableSet
        public final NavigableSet<E> descendingSet() {
            UnmodifiableNavigableSet<E> unmodifiableNavigableSet = this.descendingSet;
            if (unmodifiableNavigableSet != null) {
                return unmodifiableNavigableSet;
            }
            UnmodifiableNavigableSet<E> unmodifiableNavigableSet2 = new UnmodifiableNavigableSet<>(this.delegate.descendingSet());
            this.descendingSet = unmodifiableNavigableSet2;
            unmodifiableNavigableSet2.descendingSet = this;
            return unmodifiableNavigableSet2;
        }

        @Override // java.util.NavigableSet
        public final E floor(E e) {
            return this.delegate.floor(e);
        }

        @Override // java.util.NavigableSet
        public final NavigableSet<E> headSet(E toElement, boolean inclusive) {
            return Sets.unmodifiableNavigableSet(this.delegate.headSet(toElement, inclusive));
        }

        @Override // java.util.NavigableSet
        public final E higher(E e) {
            return this.delegate.higher(e);
        }

        @Override // java.util.NavigableSet
        public final E lower(E e) {
            return this.delegate.lower(e);
        }

        @Override // java.util.NavigableSet
        public final E pollFirst() {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.NavigableSet
        public final E pollLast() {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.NavigableSet
        public final NavigableSet<E> subSet(E fromElement, boolean fromInclusive, E toElement, boolean toInclusive) {
            return Sets.unmodifiableNavigableSet(this.delegate.subSet(fromElement, fromInclusive, toElement, toInclusive));
        }

        @Override // java.util.NavigableSet
        public final NavigableSet<E> tailSet(E fromElement, boolean inclusive) {
            return Sets.unmodifiableNavigableSet(this.delegate.tailSet(fromElement, inclusive));
        }

        public UnmodifiableNavigableSet(NavigableSet<E> delegate) {
            delegate.getClass();
            this.delegate = delegate;
            this.unmodifiableDelegate = Collections.unmodifiableSortedSet(delegate);
        }

        @Override // com.google.common.collect.ForwardingSet
        public final SortedSet delegate$1() {
            return this.unmodifiableDelegate;
        }

        @Override // com.google.common.collect.ForwardingSortedSet
        public final SortedSet<E> delegate$2() {
            return this.unmodifiableDelegate;
        }
    }

    public static boolean equalsImpl(Set<?> s, Object object) {
        if (s == object) {
            return true;
        }
        if (object instanceof Set) {
            Set set = (Set) object;
            try {
                if (s.size() == set.size()) {
                    if (s.containsAll(set)) {
                        return true;
                    }
                }
                return false;
            } catch (ClassCastException | NullPointerException unused) {
            }
        }
        return false;
    }

    /* loaded from: classes.dex */
    public static abstract class ImprovedAbstractSet<E> extends AbstractSet<E> {
        @Override // java.util.AbstractSet, java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean removeAll(Collection<?> c) {
            return Sets.removeAllImpl(this, c);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean retainAll(Collection<?> c) {
            c.getClass();
            return super.retainAll(c);
        }
    }

    public static <E> HashSet<E> newHashSetWithExpectedSize(int expectedSize) {
        int i;
        if (expectedSize < 3) {
            CollectPreconditions.checkNonnegative(expectedSize, "expectedSize");
            i = expectedSize + 1;
        } else if (expectedSize < 1073741824) {
            i = (int) ((expectedSize / 0.75f) + 1.0f);
        } else {
            i = Integer.MAX_VALUE;
        }
        return new HashSet<>(i);
    }

    public static <E> NavigableSet<E> unmodifiableNavigableSet(NavigableSet<E> set) {
        if ((set instanceof ImmutableCollection) || (set instanceof UnmodifiableNavigableSet)) {
            return set;
        }
        return new UnmodifiableNavigableSet(set);
    }

    public static int hashCodeImpl(Set<?> s) {
        int i;
        int i2 = 0;
        for (Object obj : s) {
            if (obj != null) {
                i = obj.hashCode();
            } else {
                i = 0;
            }
            i2 = ~(~(i2 + i));
        }
        return i2;
    }

    public static boolean removeAllImpl(Set<?> set, Collection<?> collection) {
        collection.getClass();
        if (collection instanceof Multiset) {
            collection = ((Multiset) collection).elementSet();
        }
        boolean z = false;
        if (!(collection instanceof Set) || collection.size() <= set.size()) {
            Iterator<?> it = collection.iterator();
            while (it.hasNext()) {
                z |= set.remove(it.next());
            }
            return z;
        }
        Iterator<?> it2 = set.iterator();
        while (it2.hasNext()) {
            if (collection.contains(it2.next())) {
                it2.remove();
                z = true;
            }
        }
        return z;
    }
}
