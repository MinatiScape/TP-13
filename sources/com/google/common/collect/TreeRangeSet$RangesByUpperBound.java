package com.google.common.collect;

import androidx.constraintlayout.solver.SolverVariable$Type$r8$EnumUnboxingUtility;
import com.google.common.collect.Cut;
import com.google.common.collect.Iterators;
import com.google.common.primitives.Ints;
import java.lang.Comparable;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Map;
import java.util.NavigableMap;
import java.util.Objects;
/* loaded from: classes.dex */
public final class TreeRangeSet$RangesByUpperBound<C extends Comparable<?>> extends AbstractNavigableMap<Cut<C>, Range<C>> {
    public final NavigableMap<Cut<C>, Range<C>> rangesByLowerBound;
    public final Range<Cut<C>> upperBoundWindow;

    public TreeRangeSet$RangesByUpperBound(NavigableMap<Cut<C>, Range<C>> rangesByLowerBound, Range<Cut<C>> upperBoundWindow) {
        this.rangesByLowerBound = rangesByLowerBound;
        this.upperBoundWindow = upperBoundWindow;
    }

    @Override // java.util.SortedMap
    public Comparator<? super Cut<C>> comparator() {
        return NaturalOrdering.INSTANCE;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public boolean containsKey(Object key) {
        return get(key) != null;
    }

    /* JADX WARN: Type inference failed for: r3v3, types: [E, java.lang.Object] */
    @Override // com.google.common.collect.AbstractNavigableMap
    public Iterator<Map.Entry<Cut<C>, Range<C>>> descendingEntryIterator() {
        Collection<Range<C>> collection;
        final Iterators.PeekingImpl peekingImpl;
        Cut<Cut<C>> cut = this.upperBoundWindow.upperBound;
        if (cut != Cut.AboveAll.INSTANCE) {
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
        return new AbstractIterator<Map.Entry<Cut<C>, Range<C>>>() { // from class: com.google.common.collect.TreeRangeSet$RangesByUpperBound.2
            @Override // com.google.common.collect.AbstractIterator
            public Object computeNext() {
                if (!((Iterators.PeekingImpl) peekingImpl).hasNext()) {
                    endOfData();
                    return null;
                }
                Range range = (Range) ((Iterators.PeekingImpl) peekingImpl).next();
                if (TreeRangeSet$RangesByUpperBound.this.upperBoundWindow.lowerBound.isLessThan(range.upperBound)) {
                    return new ImmutableEntry(range.upperBound, range);
                }
                endOfData();
                return null;
            }
        };
    }

    @Override // com.google.common.collect.Maps.IteratorBasedAbstractMap
    public Iterator<Map.Entry<Cut<C>, Range<C>>> entryIterator() {
        final Iterator<Range<C>> it;
        Cut<Cut<C>> cut = this.upperBoundWindow.lowerBound;
        if (!(cut != Cut.BelowAll.INSTANCE)) {
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
        return new AbstractIterator<Map.Entry<Cut<C>, Range<C>>>() { // from class: com.google.common.collect.TreeRangeSet$RangesByUpperBound.1
            @Override // com.google.common.collect.AbstractIterator
            public Object computeNext() {
                if (!it.hasNext()) {
                    endOfData();
                    return null;
                }
                Range range = (Range) it.next();
                if (!TreeRangeSet$RangesByUpperBound.this.upperBoundWindow.upperBound.isLessThan(range.upperBound)) {
                    return new ImmutableEntry(range.upperBound, range);
                }
                endOfData();
                return null;
            }
        };
    }

    @Override // java.util.NavigableMap
    public NavigableMap headMap(Object toKey, boolean inclusive) {
        Range<Cut<C>> range;
        Cut cut = (Cut) toKey;
        int com$google$common$collect$BoundType$s$forBoolean = SolverVariable$Type$r8$EnumUnboxingUtility.com$google$common$collect$BoundType$s$forBoolean(inclusive);
        Range<Comparable> range2 = Range.ALL;
        int $enumboxing$ordinal = SolverVariable$Type$r8$EnumUnboxingUtility.$enumboxing$ordinal(com$google$common$collect$BoundType$s$forBoolean);
        if ($enumboxing$ordinal == 0) {
            range = new Range<>(Cut.BelowAll.INSTANCE, new Cut.BelowValue(cut));
        } else if ($enumboxing$ordinal == 1) {
            range = new Range<>(Cut.BelowAll.INSTANCE, new Cut.AboveValue(cut));
        } else {
            throw new AssertionError();
        }
        return subMap(range);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public boolean isEmpty() {
        if (this.upperBoundWindow.equals(Range.ALL)) {
            return this.rangesByLowerBound.isEmpty();
        }
        return !((AbstractIterator) entryIterator()).hasNext();
    }

    @Override // java.util.AbstractMap, java.util.Map
    public int size() {
        if (this.upperBoundWindow.equals(Range.ALL)) {
            return this.rangesByLowerBound.size();
        }
        Iterator<Map.Entry<Cut<C>, Range<C>>> entryIterator = entryIterator();
        long j = 0;
        while (true) {
            AbstractIterator abstractIterator = (AbstractIterator) entryIterator;
            if (!abstractIterator.hasNext()) {
                return Ints.saturatedCast(j);
            }
            abstractIterator.next();
            j++;
        }
    }

    @Override // java.util.NavigableMap
    public NavigableMap subMap(Object fromKey, boolean fromInclusive, Object toKey, boolean toInclusive) {
        Cut cut;
        Cut cut2;
        Cut cut3 = (Cut) fromKey;
        Cut cut4 = (Cut) toKey;
        int com$google$common$collect$BoundType$s$forBoolean = SolverVariable$Type$r8$EnumUnboxingUtility.com$google$common$collect$BoundType$s$forBoolean(fromInclusive);
        int com$google$common$collect$BoundType$s$forBoolean2 = SolverVariable$Type$r8$EnumUnboxingUtility.com$google$common$collect$BoundType$s$forBoolean(toInclusive);
        Range<Comparable> range = Range.ALL;
        if (com$google$common$collect$BoundType$s$forBoolean == 1) {
            cut = new Cut.AboveValue(cut3);
        } else {
            cut = new Cut.BelowValue(cut3);
        }
        if (com$google$common$collect$BoundType$s$forBoolean2 == 1) {
            cut2 = new Cut.BelowValue(cut4);
        } else {
            cut2 = new Cut.AboveValue(cut4);
        }
        return subMap(new Range<>(cut, cut2));
    }

    @Override // java.util.NavigableMap
    public NavigableMap tailMap(Object fromKey, boolean inclusive) {
        Range<Cut<C>> range;
        Cut cut = (Cut) fromKey;
        int com$google$common$collect$BoundType$s$forBoolean = SolverVariable$Type$r8$EnumUnboxingUtility.com$google$common$collect$BoundType$s$forBoolean(inclusive);
        Range<Comparable> range2 = Range.ALL;
        int $enumboxing$ordinal = SolverVariable$Type$r8$EnumUnboxingUtility.$enumboxing$ordinal(com$google$common$collect$BoundType$s$forBoolean);
        if ($enumboxing$ordinal == 0) {
            range = new Range<>(new Cut.AboveValue(cut), Cut.AboveAll.INSTANCE);
        } else if ($enumboxing$ordinal == 1) {
            range = new Range<>(new Cut.BelowValue(cut), Cut.AboveAll.INSTANCE);
        } else {
            throw new AssertionError();
        }
        return subMap(range);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public Range<C> get(Object key) {
        Map.Entry<Cut<C>, Range<C>> lowerEntry;
        if (key instanceof Cut) {
            try {
                Cut<C> cut = (Cut) key;
                Range<Cut<C>> range = this.upperBoundWindow;
                Objects.requireNonNull(range);
                Objects.requireNonNull(cut);
                if ((range.lowerBound.isLessThan(cut) && !range.upperBound.isLessThan(cut)) && (lowerEntry = this.rangesByLowerBound.lowerEntry(cut)) != null && lowerEntry.getValue().upperBound.equals(cut)) {
                    return lowerEntry.getValue();
                }
            } catch (ClassCastException unused) {
            }
        }
        return null;
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
}
