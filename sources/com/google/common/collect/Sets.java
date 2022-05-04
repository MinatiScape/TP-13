package com.google.common.collect;

import java.io.Serializable;
import java.util.AbstractSet;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.NavigableSet;
import java.util.Objects;
import java.util.Set;
import java.util.SortedSet;
/* loaded from: classes.dex */
public final class Sets {

    /* loaded from: classes.dex */
    public static abstract class ImprovedAbstractSet<E> extends AbstractSet<E> {
        @Override // java.util.AbstractSet, java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean removeAll(Collection<?> c) {
            return Sets.removeAllImpl(this, c);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean retainAll(Collection<?> c) {
            Objects.requireNonNull(c);
            return super.retainAll(c);
        }
    }

    /* loaded from: classes.dex */
    public static final class UnmodifiableNavigableSet<E> extends ForwardingSortedSet<E> implements NavigableSet<E>, Serializable {
        private static final long serialVersionUID = 0;
        private final NavigableSet<E> delegate;
        public transient UnmodifiableNavigableSet<E> descendingSet;
        private final SortedSet<E> unmodifiableDelegate;

        public UnmodifiableNavigableSet(NavigableSet<E> delegate) {
            Objects.requireNonNull(delegate);
            this.delegate = delegate;
            this.unmodifiableDelegate = Collections.unmodifiableSortedSet(delegate);
        }

        @Override // java.util.NavigableSet
        public E ceiling(E e) {
            return this.delegate.ceiling(e);
        }

        @Override // com.google.common.collect.ForwardingSortedSet, com.google.common.collect.ForwardingSet, com.google.common.collect.ForwardingCollection, com.google.common.collect.ForwardingObject
        /* renamed from: delegate */
        public Object mo31delegate() {
            return this.unmodifiableDelegate;
        }

        @Override // java.util.NavigableSet
        public Iterator<E> descendingIterator() {
            final Iterator<E> descendingIterator = this.delegate.descendingIterator();
            Objects.requireNonNull(descendingIterator);
            if (descendingIterator instanceof UnmodifiableIterator) {
                return (UnmodifiableIterator) descendingIterator;
            }
            return new UnmodifiableIterator<?>
            /*  JADX ERROR: Method code generation error
                jadx.core.utils.exceptions.CodegenException: Error generate insn: 0x0016: RETURN  
                  (wrap: com.google.common.collect.UnmodifiableIterator<?> : 0x0012: CONSTRUCTOR  (r0v1 com.google.common.collect.UnmodifiableIterator<?> A[REMOVE]) = (r1v2 'descendingIterator' java.util.Iterator<E> A[DONT_INLINE]) call: com.google.common.collect.Iterators.1.<init>(java.util.Iterator):void type: CONSTRUCTOR)
                 in method: com.google.common.collect.Sets.UnmodifiableNavigableSet.descendingIterator():java.util.Iterator<E>, file: classes.dex
                	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:280)
                	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:243)
                	at jadx.core.codegen.RegionGen.makeSimpleBlock(RegionGen.java:90)
                	at jadx.core.dex.nodes.IBlock.generate(IBlock.java:15)
                	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                	at jadx.core.dex.regions.Region.generate(Region.java:35)
                	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                	at jadx.core.dex.regions.Region.generate(Region.java:35)
                	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                	at jadx.core.dex.regions.Region.generate(Region.java:35)
                	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:62)
                	at jadx.core.codegen.MethodGen.addRegionInsns(MethodGen.java:286)
                	at jadx.core.codegen.MethodGen.addInstructions(MethodGen.java:265)
                	at jadx.core.codegen.ClassGen.addMethodCode(ClassGen.java:369)
                	at jadx.core.codegen.ClassGen.addMethod(ClassGen.java:304)
                	at jadx.core.codegen.ClassGen.lambda$addInnerClsAndMethods$2(ClassGen.java:270)
                	at java.base/java.util.stream.ForEachOps$ForEachOp$OfRef.accept(ForEachOps.java:183)
                	at java.base/java.util.ArrayList.forEach(ArrayList.java:1541)
                	at java.base/java.util.stream.SortedOps$RefSortingSink.end(SortedOps.java:395)
                	at java.base/java.util.stream.Sink$ChainedReference.end(Sink.java:258)
                Caused by: jadx.core.utils.exceptions.JadxRuntimeException: Method arg registers not loaded: com.google.common.collect.Iterators.1.<init>(java.util.Iterator):void, class status: GENERATED_AND_UNLOADED
                	at jadx.core.dex.nodes.MethodNode.getArgRegs(MethodNode.java:247)
                	at jadx.core.codegen.InsnGen.inlineAnonymousConstructor(InsnGen.java:762)
                	at jadx.core.codegen.InsnGen.makeConstructor(InsnGen.java:690)
                	at jadx.core.codegen.InsnGen.makeInsnBody(InsnGen.java:388)
                	at jadx.core.codegen.InsnGen.addWrappedArg(InsnGen.java:142)
                	at jadx.core.codegen.InsnGen.addArg(InsnGen.java:118)
                	at jadx.core.codegen.InsnGen.addArg(InsnGen.java:105)
                	at jadx.core.codegen.InsnGen.makeInsnBody(InsnGen.java:338)
                	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:273)
                	... 19 more
                */
            /*
                this = this;
                java.util.NavigableSet<E> r1 = r1.delegate
                java.util.Iterator r1 = r1.descendingIterator()
                java.util.Objects.requireNonNull(r1)
                boolean r0 = r1 instanceof com.google.common.collect.UnmodifiableIterator
                if (r0 == 0) goto L10
                com.google.common.collect.UnmodifiableIterator r1 = (com.google.common.collect.UnmodifiableIterator) r1
                goto L16
            L10:
                com.google.common.collect.Iterators$1 r0 = new com.google.common.collect.Iterators$1
                r0.<init>()
                r1 = r0
            L16:
                return r1
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.common.collect.Sets.UnmodifiableNavigableSet.descendingIterator():java.util.Iterator");
        }

        @Override // java.util.NavigableSet
        public NavigableSet<E> descendingSet() {
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
        public E floor(E e) {
            return this.delegate.floor(e);
        }

        @Override // java.util.NavigableSet
        public NavigableSet<E> headSet(E toElement, boolean inclusive) {
            return Sets.unmodifiableNavigableSet(this.delegate.headSet(toElement, inclusive));
        }

        @Override // java.util.NavigableSet
        public E higher(E e) {
            return this.delegate.higher(e);
        }

        @Override // java.util.NavigableSet
        public E lower(E e) {
            return this.delegate.lower(e);
        }

        @Override // java.util.NavigableSet
        public E pollFirst() {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.NavigableSet
        public E pollLast() {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.NavigableSet
        public NavigableSet<E> subSet(E fromElement, boolean fromInclusive, E toElement, boolean toInclusive) {
            return Sets.unmodifiableNavigableSet(this.delegate.subSet(fromElement, fromInclusive, toElement, toInclusive));
        }

        @Override // java.util.NavigableSet
        public NavigableSet<E> tailSet(E fromElement, boolean inclusive) {
            return Sets.unmodifiableNavigableSet(this.delegate.tailSet(fromElement, inclusive));
        }

        @Override // com.google.common.collect.ForwardingSortedSet, com.google.common.collect.ForwardingSet, com.google.common.collect.ForwardingCollection, com.google.common.collect.ForwardingObject
        /* renamed from: delegate  reason: collision with other method in class */
        public Collection mo31delegate() {
            return this.unmodifiableDelegate;
        }

        @Override // com.google.common.collect.ForwardingSortedSet, com.google.common.collect.ForwardingSet, com.google.common.collect.ForwardingCollection, com.google.common.collect.ForwardingObject
        /* renamed from: delegate */
        public Set mo31delegate() {
            return this.unmodifiableDelegate;
        }

        @Override // com.google.common.collect.ForwardingSortedSet, com.google.common.collect.ForwardingSet, com.google.common.collect.ForwardingCollection, com.google.common.collect.ForwardingObject
        /* renamed from: delegate  reason: collision with other method in class */
        public SortedSet<E> mo31delegate() {
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

    public static int hashCodeImpl(Set<?> s) {
        Iterator<?> it = s.iterator();
        int i = 0;
        while (it.hasNext()) {
            Object next = it.next();
            i = ~(~(i + (next != null ? next.hashCode() : 0)));
        }
        return i;
    }

    public static <E> HashSet<E> newHashSetWithExpectedSize(int expectedSize) {
        int i;
        if (expectedSize < 3) {
            CollectPreconditions.checkNonnegative(expectedSize, "expectedSize");
            i = expectedSize + 1;
        } else {
            i = expectedSize < 1073741824 ? (int) ((expectedSize / 0.75f) + 1.0f) : Integer.MAX_VALUE;
        }
        return new HashSet<>(i);
    }

    public static boolean removeAllImpl(Set<?> set, Collection<?> collection) {
        Objects.requireNonNull(collection);
        if (collection instanceof Multiset) {
            collection = ((Multiset) collection).elementSet();
        }
        if (!(collection instanceof Set) || collection.size() <= set.size()) {
            return removeAllImpl(set, collection.iterator());
        }
        Iterator<?> it = set.iterator();
        boolean z = false;
        while (it.hasNext()) {
            if (collection.contains(it.next())) {
                it.remove();
                z = true;
            }
        }
        return z;
    }

    public static <E> NavigableSet<E> unmodifiableNavigableSet(NavigableSet<E> set) {
        return ((set instanceof ImmutableCollection) || (set instanceof UnmodifiableNavigableSet)) ? set : new UnmodifiableNavigableSet(set);
    }

    public static boolean removeAllImpl(Set<?> set, Iterator<?> iterator) {
        boolean z = false;
        while (iterator.hasNext()) {
            z |= set.remove(iterator.next());
        }
        return z;
    }
}
