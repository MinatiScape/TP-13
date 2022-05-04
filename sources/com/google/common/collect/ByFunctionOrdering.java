package com.google.common.collect;

import com.google.common.base.Function;
import com.google.common.util.concurrent.FuturesGetChecked;
import java.io.Serializable;
import java.util.Arrays;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class ByFunctionOrdering<F, T> extends Ordering<F> implements Serializable {
    private static final long serialVersionUID = 0;
    public final Function<F, ? extends T> function;
    public final Ordering<T> ordering;

    @Override // java.util.Comparator
    public final boolean equals(Object object) {
        if (object == this) {
            return true;
        }
        if (!(object instanceof ByFunctionOrdering)) {
            return false;
        }
        ByFunctionOrdering byFunctionOrdering = (ByFunctionOrdering) object;
        return this.function.equals(byFunctionOrdering.function) && this.ordering.equals(byFunctionOrdering.ordering);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.function, this.ordering});
    }

    @Override // com.google.common.collect.Ordering, java.util.Comparator
    public final int compare(F left, F right) {
        return this.ordering.compare(this.function.apply(left), this.function.apply(right));
    }

    public final String toString() {
        String valueOf = String.valueOf(this.ordering);
        String valueOf2 = String.valueOf(this.function);
        StringBuilder sb = new StringBuilder(valueOf2.length() + valueOf.length() + 13);
        sb.append(valueOf);
        sb.append(".onResultOf(");
        sb.append(valueOf2);
        sb.append(")");
        return sb.toString();
    }

    public ByFunctionOrdering(FuturesGetChecked.AnonymousClass1 function, Ordering ordering) {
        this.function = function;
        ordering.getClass();
        this.ordering = ordering;
    }
}
