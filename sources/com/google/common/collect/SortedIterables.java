package com.google.common.collect;

import java.util.Comparator;
import java.util.SortedSet;
/* loaded from: classes.dex */
public final class SortedIterables {
    public static boolean hasSameComparator(Comparator<?> comparator, Iterable<?> elements) {
        Object obj;
        comparator.getClass();
        elements.getClass();
        if (elements instanceof SortedSet) {
            obj = ((SortedSet) elements).comparator();
            if (obj == null) {
                obj = NaturalOrdering.INSTANCE;
            }
        } else if (!(elements instanceof SortedIterable)) {
            return false;
        } else {
            obj = ((SortedIterable) elements).comparator();
        }
        return comparator.equals(obj);
    }
}
