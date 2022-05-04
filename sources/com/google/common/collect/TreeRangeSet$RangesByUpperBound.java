package com.google.common.collect;

import com.google.common.collect.AbstractIterator;
import com.google.common.collect.Cut;
import com.google.common.collect.Iterators;
import com.google.common.primitives.Ints;
import java.lang.Comparable;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Map;
import java.util.NavigableMap;
/* loaded from: classes.dex */
final class TreeRangeSet$RangesByUpperBound<C extends Comparable<?>> extends AbstractNavigableMap<Cut<C>, Range<C>> {
    public final NavigableMap<Cut<C>, Range<C>> rangesByLowerBound;
    public final Range<Cut<C>> upperBoundWindow;

    @Override // java.util.NavigableMap
    public final NavigableMap subMap(Object fromKey, boolean fromInclusive, Object toKey, boolean toInclusive) {
        Cut cut;
        Cut cut2;
        BoundType boundType = BoundType.CLOSED;
        BoundType boundType2 = BoundType.OPEN;
        Cut cut3 = (Cut) fromKey;
        Cut cut4 = (Cut) toKey;
        BoundType boundType3 = fromInclusive ? boundType : boundType2;
        if (!toInclusive) {
            boundType = boundType2;
        }
        Range<Comparable> range = Range.ALL;
        if (boundType3 == boundType2) {
            cut = new Cut.AboveValue(cut3);
        } else {
            cut = new Cut.BelowValue(cut3);
        }
        if (boundType == boundType2) {
            cut2 = new Cut.BelowValue(cut4);
        } else {
            cut2 = new Cut.AboveValue(cut4);
        }
        return subMap(new Range<>(cut, cut2));
    }

    /* JADX WARN: Type inference failed for: r1v4, types: [com.google.common.collect.TreeRangeSet$RangesByUpperBound$2] */
    /* JADX WARN: Type inference failed for: r3v3, types: [E, java.lang.Object] */
    @Override // com.google.common.collect.AbstractNavigableMap
    public final AnonymousClass2 descendingEntryIterator() {
        boolean z;
        Collection<Range<C>> collection;
        final Iterators.PeekingImpl peekingImpl;
        Cut<Cut<C>> cut = this.upperBoundWindow.upperBound;
        if (cut != Cut.AboveAll.INSTANCE) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            collection = this.rangesByLowerBound.headMap(cut.endpoint(), false).descendingMap().values();
        } else {
            collection = this.rangesByLowerBound.descendingMap().values();
        }
        Iterator<Range<C>> it = collection.iterator();
        if (it instanceof Iterators.PeekingImpl) {
            peekingImpl = (Iterators.PeekingImpl) it;
        } else {
            peekingImpl = new Iterators.PeekingImpl(it);
        }
        if (peekingImpl.hasNext()) {
            Cut<Cut<C>> cut2 = this.upperBoundWindow.upperBound;
            if (!peekingImpl.hasPeeked) {
                peekingImpl.peekedElement = peekingImpl.iterator.next();
                peekingImpl.hasPeeked = true;
            }
            if (cut2.isLessThan(((Range) peekingImpl.peekedElement).upperBound)) {
                peekingImpl.next();
            }
        }
        return new AbstractIterator<Map.Entry<Cut<Comparable<?>>, Range<Comparable<?>>>>() { // from class: com.google.common.collect.TreeRangeSet$RangesByUpperBound.2
            @Override // com.google.common.collect.AbstractIterator
            public final Map.Entry<Cut<Comparable<?>>, Range<Comparable<?>>> computeNext() {
                AbstractIterator.State state = AbstractIterator.State.DONE;
                if (!((Iterators.PeekingImpl) peekingImpl).hasNext()) {
                    this.state = state;
                } else {
                    Range range = (Range) ((Iterators.PeekingImpl) peekingImpl).next();
                    if (TreeRangeSet$RangesByUpperBound.this.upperBoundWindow.lowerBound.isLessThan(range.upperBound)) {
                        return new ImmutableEntry(range.upperBound, range);
                    }
                    this.state = state;
                }
                return null;
            }
        };
    }

    /* JADX WARN: Type inference failed for: r1v2, types: [com.google.common.collect.TreeRangeSet$RangesByUpperBound$1] */
    @Override // com.google.common.collect.Maps.IteratorBasedAbstractMap
    public final AnonymousClass1 entryIterator() {
        boolean z;
        final Iterator<Range<C>> it;
        Cut<Cut<C>> cut = this.upperBoundWindow.lowerBound;
        if (cut != Cut.BelowAll.INSTANCE) {
            z = true;
        } else {
            z = false;
        }
        if (!z) {
            it = this.rangesByLowerBound.values().iterator();
        } else {
            Map.Entry<Cut<C>, Range<C>> lowerEntry = this.rangesByLowerBound.lowerEntry(cut.endpoint());
            if (lowerEntry == null) {
                it = this.rangesByLowerBound.values().iterator();
            } else if (this.upperBoundWindow.lowerBound.isLessThan(lowerEntry.getValue().upperBound)) {
                it = this.rangesByLowerBound.tailMap(lowerEntry.getKey(), true).values().iterator();
            } else {
                it = this.rangesByLowerBound.tailMap(this.upperBoundWindow.lowerBound.endpoint(), true).values().iterator();
            }
        }
        return new AbstractIterator<Map.Entry<Cut<Comparable<?>>, Range<Comparable<?>>>>() { // from class: com.google.common.collect.TreeRangeSet$RangesByUpperBound.1
            @Override // com.google.common.collect.AbstractIterator
            public final Map.Entry<Cut<Comparable<?>>, Range<Comparable<?>>> computeNext() {
                AbstractIterator.State state = AbstractIterator.State.DONE;
                if (!it.hasNext()) {
                    this.state = state;
                } else {
                    Range range = (Range) it.next();
                    if (!TreeRangeSet$RangesByUpperBound.this.upperBoundWindow.upperBound.isLessThan(range.upperBound)) {
                        return new ImmutableEntry(range.upperBound, range);
                    }
                    this.state = state;
                }
                return null;
            }
        };
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Range<C> get(Object key) {
        Map.Entry<Cut<C>, Range<C>> lowerEntry;
        if (key instanceof Cut) {
            try {
                Cut<C> cut = (Cut) key;
                Range<Cut<C>> range = this.upperBoundWindow;
                range.getClass();
                cut.getClass();
                if ((range.lowerBound.isLessThan(cut) && !range.upperBound.isLessThan(cut)) && (lowerEntry = this.rangesByLowerBound.lowerEntry(cut)) != null && lowerEntry.getValue().upperBound.equals(cut)) {
                    return lowerEntry.getValue();
                }
            } catch (ClassCastException unused) {
            }
        }
        return null;
    }

    @Override // java.util.NavigableMap
    public final NavigableMap headMap(Object toKey, boolean inclusive) {
        BoundType boundType;
        Range<Cut<C>> range;
        Cut cut = (Cut) toKey;
        if (inclusive) {
            boundType = BoundType.CLOSED;
        } else {
            boundType = BoundType.OPEN;
        }
        Range<Comparable> range2 = Range.ALL;
        int ordinal = boundType.ordinal();
        if (ordinal == 0) {
            range = new Range<>(Cut.BelowAll.INSTANCE, new Cut.BelowValue(cut));
        } else if (ordinal == 1) {
            range = new Range<>(Cut.BelowAll.INSTANCE, new Cut.AboveValue(cut));
        } else {
            throw new AssertionError();
        }
        return subMap(range);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean isEmpty() {
        if (this.upperBoundWindow.equals(Range.ALL)) {
            return this.rangesByLowerBound.isEmpty();
        }
        if (!entryIterator().hasNext()) {
            return true;
        }
        return false;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int size() {
        if (this.upperBoundWindow.equals(Range.ALL)) {
            return this.rangesByLowerBound.size();
        }
        AnonymousClass1 entryIterator = entryIterator();
        long j = 0;
        while (entryIterator.hasNext()) {
            entryIterator.next();
            j++;
        }
        return Ints.saturatedCast(j);
    }

    @Override // java.util.NavigableMap
    public final NavigableMap tailMap(Object fromKey, boolean inclusive) {
        BoundType boundType;
        Range<Cut<C>> range;
        Cut cut = (Cut) fromKey;
        if (inclusive) {
            boundType = BoundType.CLOSED;
        } else {
            boundType = BoundType.OPEN;
        }
        Range<Comparable> range2 = Range.ALL;
        int ordinal = boundType.ordinal();
        if (ordinal == 0) {
            range = new Range<>(new Cut.AboveValue(cut), Cut.AboveAll.INSTANCE);
        } else if (ordinal == 1) {
            range = new Range<>(new Cut.BelowValue(cut), Cut.AboveAll.INSTANCE);
        } else {
            throw new AssertionError();
        }
        return subMap(range);
    }

    public TreeRangeSet$RangesByUpperBound(NavigableMap<Cut<C>, Range<C>> rangesByLowerBound, Range<Cut<C>> upperBoundWindow) {
        this.rangesByLowerBound = rangesByLowerBound;
        this.upperBoundWindow = upperBoundWindow;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsKey(Object key) {
        if (get(key) != null) {
            return true;
        }
        return false;
    }

    public final NavigableMap<Cut<C>, Range<C>> subMap(Range<Cut<C>> window) {
        Range<Cut<C>> range = this.upperBoundWindow;
        if (!(window.lowerBound.compareTo(range.upperBound) <= 0 && range.lowerBound.compareTo(window.upperBound) <= 0)) {
            return ImmutableSortedMap.NATURAL_EMPTY_MAP;
        }
        NavigableMap<Cut<C>, Range<C>> navigableMap = this.rangesByLowerBound;
        Range<Cut<C>> range2 = this.upperBoundWindow;
        int compareTo = window.lowerBound.compareTo(range2.lowerBound);
        int compareTo2 = window.upperBound.compareTo(range2.upperBound);
        if (compareTo < 0 || compareTo2 > 0) {
            if (compareTo > 0 || compareTo2 < 0) {
                window = new Range<>(compareTo >= 0 ? window.lowerBound : range2.lowerBound, compareTo2 <= 0 ? window.upperBound : range2.upperBound);
            } else {
                window = range2;
            }
        }
        return new TreeRangeSet$RangesByUpperBound(navigableMap, window);
    }

    @Override // java.util.SortedMap
    public final Comparator<? super Cut<C>> comparator() {
        return NaturalOrdering.INSTANCE;
    }
}
