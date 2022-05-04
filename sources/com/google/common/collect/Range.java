package com.google.common.collect;

import com.google.common.collect.Cut;
import java.lang.Comparable;
/* loaded from: classes.dex */
public final class Range<C extends Comparable> extends RangeGwtSerializationDependencies {
    public static final Range<Comparable> ALL = new Range<>(Cut.BelowAll.INSTANCE, Cut.AboveAll.INSTANCE);
    private static final long serialVersionUID = 0;
    public final Cut<C> lowerBound;
    public final Cut<C> upperBound;

    public final boolean equals(Object object) {
        if (!(object instanceof Range)) {
            return false;
        }
        Range range = (Range) object;
        if (!this.lowerBound.equals(range.lowerBound) || !this.upperBound.equals(range.upperBound)) {
            return false;
        }
        return true;
    }

    public final int hashCode() {
        return (this.lowerBound.hashCode() * 31) + this.upperBound.hashCode();
    }

    public Object readResolve() {
        Range<Comparable> range = ALL;
        if (equals(range)) {
            return range;
        }
        return this;
    }

    public final String toString() {
        Cut<C> cut = this.lowerBound;
        Cut<C> cut2 = this.upperBound;
        StringBuilder sb = new StringBuilder(16);
        cut.describeAsLowerBound(sb);
        sb.append("..");
        cut2.describeAsUpperBound(sb);
        return sb.toString();
    }

    public Range(Cut<C> lowerBound, Cut<C> upperBound) {
        String str;
        lowerBound.getClass();
        this.lowerBound = lowerBound;
        upperBound.getClass();
        this.upperBound = upperBound;
        if (lowerBound.compareTo((Cut) upperBound) > 0 || lowerBound == Cut.AboveAll.INSTANCE || upperBound == Cut.BelowAll.INSTANCE) {
            StringBuilder sb = new StringBuilder(16);
            lowerBound.describeAsLowerBound(sb);
            sb.append("..");
            upperBound.describeAsUpperBound(sb);
            String valueOf = String.valueOf(sb.toString());
            if (valueOf.length() != 0) {
                str = "Invalid range: ".concat(valueOf);
            } else {
                str = new String("Invalid range: ");
            }
            throw new IllegalArgumentException(str);
        }
    }
}
