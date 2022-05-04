package com.google.common.collect;

import com.adobe.xmp.impl.XMPNode$$ExternalSyntheticOutline0;
import java.io.Serializable;
import java.lang.Comparable;
/* loaded from: classes.dex */
abstract class Cut<C extends Comparable> implements Comparable<Cut<C>>, Serializable {
    private static final long serialVersionUID = 0;
    public final C endpoint;

    /* loaded from: classes.dex */
    public static final class AboveAll extends Cut<Comparable<?>> {
        public static final AboveAll INSTANCE = new AboveAll();
        private static final long serialVersionUID = 0;

        private AboveAll() {
            super(null);
        }

        @Override // com.google.common.collect.Cut
        public final int compareTo(Cut<Comparable<?>> o) {
            return o == this ? 0 : 1;
        }

        @Override // com.google.common.collect.Cut
        public final boolean isLessThan(Comparable<?> value) {
            return false;
        }

        public final String toString() {
            return "+∞";
        }

        @Override // com.google.common.collect.Cut, java.lang.Comparable
        public final int compareTo(Object o) {
            if (((Cut) o) == this) {
                return 0;
            }
            return 1;
        }

        @Override // com.google.common.collect.Cut
        public final void describeAsLowerBound(StringBuilder sb) {
            throw new AssertionError();
        }

        @Override // com.google.common.collect.Cut
        public final void describeAsUpperBound(StringBuilder sb) {
            sb.append("+∞)");
        }

        @Override // com.google.common.collect.Cut
        public final Comparable<?> endpoint() {
            throw new IllegalStateException("range unbounded on this side");
        }

        @Override // com.google.common.collect.Cut
        public final int hashCode() {
            return System.identityHashCode(this);
        }

        private Object readResolve() {
            return INSTANCE;
        }
    }

    /* loaded from: classes.dex */
    public static final class AboveValue<C extends Comparable> extends Cut<C> {
        private static final long serialVersionUID = 0;

        @Override // com.google.common.collect.Cut
        public final void describeAsLowerBound(StringBuilder sb) {
            sb.append('(');
            sb.append(this.endpoint);
        }

        @Override // com.google.common.collect.Cut
        public final void describeAsUpperBound(StringBuilder sb) {
            sb.append(this.endpoint);
            sb.append(']');
        }

        @Override // com.google.common.collect.Cut
        public final int hashCode() {
            return ~this.endpoint.hashCode();
        }

        @Override // com.google.common.collect.Cut
        public final boolean isLessThan(C value) {
            C c = this.endpoint;
            Range<Comparable> range = Range.ALL;
            if (c.compareTo(value) < 0) {
                return true;
            }
            return false;
        }

        public final String toString() {
            String valueOf = String.valueOf(this.endpoint);
            return XMPNode$$ExternalSyntheticOutline0.m(valueOf.length() + 2, "/", valueOf, "\\");
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AboveValue(C endpoint) {
            super(endpoint);
            endpoint.getClass();
        }
    }

    /* loaded from: classes.dex */
    public static final class BelowAll extends Cut<Comparable<?>> {
        public static final BelowAll INSTANCE = new BelowAll();
        private static final long serialVersionUID = 0;

        private BelowAll() {
            super(null);
        }

        @Override // com.google.common.collect.Cut
        public final int compareTo(Cut<Comparable<?>> o) {
            return o == this ? 0 : -1;
        }

        @Override // com.google.common.collect.Cut
        public final boolean isLessThan(Comparable<?> value) {
            return true;
        }

        public final String toString() {
            return "-∞";
        }

        @Override // com.google.common.collect.Cut, java.lang.Comparable
        public final int compareTo(Object o) {
            if (((Cut) o) == this) {
                return 0;
            }
            return -1;
        }

        @Override // com.google.common.collect.Cut
        public final void describeAsLowerBound(StringBuilder sb) {
            sb.append("(-∞");
        }

        @Override // com.google.common.collect.Cut
        public final void describeAsUpperBound(StringBuilder sb) {
            throw new AssertionError();
        }

        @Override // com.google.common.collect.Cut
        public final Comparable<?> endpoint() {
            throw new IllegalStateException("range unbounded on this side");
        }

        @Override // com.google.common.collect.Cut
        public final int hashCode() {
            return System.identityHashCode(this);
        }

        private Object readResolve() {
            return INSTANCE;
        }
    }

    /* loaded from: classes.dex */
    public static final class BelowValue<C extends Comparable> extends Cut<C> {
        private static final long serialVersionUID = 0;

        @Override // com.google.common.collect.Cut
        public final void describeAsLowerBound(StringBuilder sb) {
            sb.append('[');
            sb.append(this.endpoint);
        }

        @Override // com.google.common.collect.Cut
        public final void describeAsUpperBound(StringBuilder sb) {
            sb.append(this.endpoint);
            sb.append(')');
        }

        @Override // com.google.common.collect.Cut
        public final int hashCode() {
            return this.endpoint.hashCode();
        }

        @Override // com.google.common.collect.Cut
        public final boolean isLessThan(C value) {
            C c = this.endpoint;
            Range<Comparable> range = Range.ALL;
            if (c.compareTo(value) <= 0) {
                return true;
            }
            return false;
        }

        public final String toString() {
            String valueOf = String.valueOf(this.endpoint);
            return XMPNode$$ExternalSyntheticOutline0.m(valueOf.length() + 2, "\\", valueOf, "/");
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BelowValue(C endpoint) {
            super(endpoint);
            endpoint.getClass();
        }
    }

    @Override // java.lang.Comparable
    public /* bridge */ /* synthetic */ int compareTo(Object that) {
        return compareTo((Cut) ((Cut) that));
    }

    public abstract void describeAsLowerBound(StringBuilder sb);

    public abstract void describeAsUpperBound(StringBuilder sb);

    public abstract int hashCode();

    public abstract boolean isLessThan(C value);

    public int compareTo(Cut<C> that) {
        if (that == BelowAll.INSTANCE) {
            return 1;
        }
        if (that == AboveAll.INSTANCE) {
            return -1;
        }
        C c = this.endpoint;
        C c2 = that.endpoint;
        Range<Comparable> range = Range.ALL;
        int compareTo = c.compareTo(c2);
        if (compareTo != 0) {
            return compareTo;
        }
        boolean z = this instanceof AboveValue;
        if (z == (that instanceof AboveValue)) {
            return 0;
        }
        return z ? 1 : -1;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof Cut)) {
            return false;
        }
        try {
            if (compareTo((Cut) ((Cut) obj)) == 0) {
                return true;
            }
            return false;
        } catch (ClassCastException unused) {
            return false;
        }
    }

    public Cut(C endpoint) {
        this.endpoint = endpoint;
    }

    public C endpoint() {
        return this.endpoint;
    }
}
