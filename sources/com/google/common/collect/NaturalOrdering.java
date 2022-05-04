package com.google.common.collect;

import java.io.Serializable;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class NaturalOrdering extends Ordering<Comparable> implements Serializable {
    public static final NaturalOrdering INSTANCE = new NaturalOrdering();
    private static final long serialVersionUID = 0;

    public final String toString() {
        return "Ordering.natural()";
    }

    @Override // com.google.common.collect.Ordering, java.util.Comparator
    public final int compare(Object left, Object right) {
        Comparable comparable = (Comparable) left;
        Comparable comparable2 = (Comparable) right;
        comparable.getClass();
        comparable2.getClass();
        return comparable.compareTo(comparable2);
    }

    private NaturalOrdering() {
    }

    private Object readResolve() {
        return INSTANCE;
    }

    @Override // com.google.common.collect.Ordering
    public final <S extends Comparable> Ordering<S> reverse() {
        return ReverseNaturalOrdering.INSTANCE;
    }
}
