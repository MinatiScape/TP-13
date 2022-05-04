package com.google.common.collect;

import com.google.common.base.Optional;
/* loaded from: classes.dex */
public abstract class FluentIterable<E> implements Iterable<E> {
    public final Optional<Iterable<E>> iterableDelegate = Optional.absent();

    public final String toString() {
        this.iterableDelegate.or(this);
        StringBuilder sb = new StringBuilder();
        sb.append('[');
        boolean z = true;
        for (E e : this) {
            if (!z) {
                sb.append(", ");
            }
            z = false;
            sb.append(e);
        }
        sb.append(']');
        return sb.toString();
    }
}
