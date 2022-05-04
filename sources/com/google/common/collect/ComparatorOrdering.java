package com.google.common.collect;

import java.io.Serializable;
import java.util.Comparator;
/* loaded from: classes.dex */
final class ComparatorOrdering<T> extends Ordering<T> implements Serializable {
    private static final long serialVersionUID = 0;
    public final Comparator<T> comparator;

    @Override // com.google.common.collect.Ordering, java.util.Comparator
    public final int compare(T a, T b) {
        return this.comparator.compare(a, b);
    }

    @Override // java.util.Comparator
    public final boolean equals(Object object) {
        if (object == this) {
            return true;
        }
        if (object instanceof ComparatorOrdering) {
            return this.comparator.equals(((ComparatorOrdering) object).comparator);
        }
        return false;
    }

    public final int hashCode() {
        return this.comparator.hashCode();
    }

    public final String toString() {
        return this.comparator.toString();
    }

    public ComparatorOrdering(Comparator<T> comparator) {
        comparator.getClass();
        this.comparator = comparator;
    }
}
