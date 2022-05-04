package com.google.common.collect;

import java.io.Serializable;
/* loaded from: classes.dex */
final class ReverseNaturalOrdering extends Ordering<Comparable> implements Serializable {
    public static final ReverseNaturalOrdering INSTANCE = new ReverseNaturalOrdering();
    private static final long serialVersionUID = 0;

    public final String toString() {
        return "Ordering.natural().reverse()";
    }

    @Override // com.google.common.collect.Ordering, java.util.Comparator
    public final int compare(Object left, Object right) {
        Comparable comparable = (Comparable) left;
        Comparable comparable2 = (Comparable) right;
        comparable.getClass();
        if (comparable == comparable2) {
            return 0;
        }
        return comparable2.compareTo(comparable);
    }

    private ReverseNaturalOrdering() {
    }

    private Object readResolve() {
        return INSTANCE;
    }

    @Override // com.google.common.collect.Ordering
    public final <S extends Comparable> Ordering<S> reverse() {
        return NaturalOrdering.INSTANCE;
    }
}
