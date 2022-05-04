package com.google.common.collect;

import java.io.Serializable;
import java.util.Comparator;
import java.util.Objects;
/* loaded from: classes.dex */
public final class ComparatorOrdering<T> extends Ordering<T> implements Serializable {
    private static final long serialVersionUID = 0;
    public final Comparator<T> comparator;

    public ComparatorOrdering(Comparator<T> comparator) {
        Objects.requireNonNull(comparator);
        this.comparator = comparator;
    }

    @Override // com.google.common.collect.Ordering, java.util.Comparator
    public int compare(T a, T b) {
        return this.comparator.compare(a, b);
    }

    @Override // java.util.Comparator
    public boolean equals(Object object) {
        if (object == this) {
            return true;
        }
        if (object instanceof ComparatorOrdering) {
            return this.comparator.equals(((ComparatorOrdering) object).comparator);
        }
        return false;
    }

    public int hashCode() {
        return this.comparator.hashCode();
    }

    public String toString() {
        return this.comparator.toString();
    }
}
