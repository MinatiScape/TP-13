package com.google.common.collect;

import com.bumptech.glide.Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline1;
import com.google.common.base.Function;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Objects;
/* loaded from: classes.dex */
public final class ByFunctionOrdering<F, T> extends Ordering<F> implements Serializable {
    private static final long serialVersionUID = 0;
    public final Function<F, ? extends T> function;
    public final Ordering<T> ordering;

    public ByFunctionOrdering(Function<F, ? extends T> function, Ordering<T> ordering) {
        Objects.requireNonNull(function);
        this.function = function;
        this.ordering = ordering;
    }

    @Override // com.google.common.collect.Ordering, java.util.Comparator
    public int compare(F left, F right) {
        return this.ordering.compare(this.function.apply(left), this.function.apply(right));
    }

    @Override // java.util.Comparator
    public boolean equals(Object object) {
        if (object == this) {
            return true;
        }
        if (!(object instanceof ByFunctionOrdering)) {
            return false;
        }
        ByFunctionOrdering byFunctionOrdering = (ByFunctionOrdering) object;
        return this.function.equals(byFunctionOrdering.function) && this.ordering.equals(byFunctionOrdering.ordering);
    }

    public int hashCode() {
        return Arrays.hashCode(new Object[]{this.function, this.ordering});
    }

    public String toString() {
        String valueOf = String.valueOf(this.ordering);
        String valueOf2 = String.valueOf(this.function);
        return Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline1.m(valueOf2.length() + valueOf.length() + 13, valueOf, ".onResultOf(", valueOf2, ")");
    }
}
