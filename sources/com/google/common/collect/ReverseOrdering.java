package com.google.common.collect;

import java.io.Serializable;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class ReverseOrdering<T> extends Ordering<T> implements Serializable {
    private static final long serialVersionUID = 0;
    public final Ordering<? super T> forwardOrder;

    @Override // com.google.common.collect.Ordering, java.util.Comparator
    public final int compare(T a, T b) {
        return this.forwardOrder.compare(b, a);
    }

    @Override // java.util.Comparator
    public final boolean equals(Object object) {
        if (object == this) {
            return true;
        }
        if (object instanceof ReverseOrdering) {
            return this.forwardOrder.equals(((ReverseOrdering) object).forwardOrder);
        }
        return false;
    }

    public final int hashCode() {
        return -this.forwardOrder.hashCode();
    }

    public final String toString() {
        String valueOf = String.valueOf(this.forwardOrder);
        StringBuilder sb = new StringBuilder(valueOf.length() + 10);
        sb.append(valueOf);
        sb.append(".reverse()");
        return sb.toString();
    }

    public ReverseOrdering(Ordering<? super T> forwardOrder) {
        forwardOrder.getClass();
        this.forwardOrder = forwardOrder;
    }

    @Override // com.google.common.collect.Ordering
    public final <S extends T> Ordering<S> reverse() {
        return (Ordering<? super T>) this.forwardOrder;
    }
}
