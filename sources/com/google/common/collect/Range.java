package com.google.common.collect;

import com.google.common.collect.Cut;
import java.lang.Comparable;
import java.util.Objects;
/* loaded from: classes.dex */
public final class Range<C extends Comparable> extends RangeGwtSerializationDependencies {
    public static final Range<Comparable> ALL = new Range<>(Cut.BelowAll.INSTANCE, Cut.AboveAll.INSTANCE);
    private static final long serialVersionUID = 0;
    public final Cut<C> lowerBound;
    public final Cut<C> upperBound;

    public Range(Cut<C> lowerBound, Cut<C> upperBound) {
        Objects.requireNonNull(lowerBound);
        this.lowerBound = lowerBound;
        Objects.requireNonNull(upperBound);
        this.upperBound = upperBound;
        if (lowerBound.compareTo((Cut) upperBound) > 0 || lowerBound == Cut.AboveAll.INSTANCE || upperBound == Cut.BelowAll.INSTANCE) {
            StringBuilder sb = new StringBuilder(16);
            lowerBound.describeAsLowerBound(sb);
            sb.append("..");
            upperBound.describeAsUpperBound(sb);
            String valueOf = String.valueOf(sb.toString());
            throw new IllegalArgumentException(valueOf.length() != 0 ? "Invalid range: ".concat(valueOf) : new String("Invalid range: "));
        }
    }

    public boolean equals(Object object) {
        if (!(object instanceof Range)) {
            return false;
        }
        Range range = (Range) object;
        return this.lowerBound.equals(range.lowerBound) && this.upperBound.equals(range.upperBound);
    }

    public int hashCode() {
        return this.upperBound.hashCode() + (this.lowerBound.hashCode() * 31);
    }

    public Object readResolve() {
        Range<Comparable> range = ALL;
        return equals(range) ? range : this;
    }

    public String toString() {
        Cut<C> cut = this.lowerBound;
        Cut<C> cut2 = this.upperBound;
        StringBuilder sb = new StringBuilder(16);
        cut.describeAsLowerBound(sb);
        sb.append("..");
        cut2.describeAsUpperBound(sb);
        return sb.toString();
    }
}
