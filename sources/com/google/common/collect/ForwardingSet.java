package com.google.common.collect;

import java.util.Set;
import java.util.SortedSet;
/* loaded from: classes.dex */
public abstract class ForwardingSet<E> extends ForwardingCollection<E> implements Set<E> {
    public abstract SortedSet delegate$1();

    @Override // java.util.Collection, java.util.Set
    public final boolean equals(Object object) {
        if (object == this || delegate$1().equals(object)) {
            return true;
        }
        return false;
    }

    @Override // java.util.Collection, java.util.Set
    public final int hashCode() {
        return delegate$1().hashCode();
    }
}
