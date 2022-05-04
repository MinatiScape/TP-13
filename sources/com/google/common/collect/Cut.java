package com.google.common.collect;

import androidx.viewpager2.widget.FakeDrag$$ExternalSyntheticOutline0;
import java.io.Serializable;
import java.lang.Comparable;
import java.util.Objects;
/* loaded from: classes.dex */
public abstract class Cut<C extends Comparable> implements Comparable<Cut<C>>, Serializable {
    private static final long serialVersionUID = 0;
    public final C endpoint;

    /* loaded from: classes.dex */
    public static final class AboveAll extends Cut<Comparable<?>> {
        public static final AboveAll INSTANCE = new AboveAll();
        private static final long serialVersionUID = 0;

        public AboveAll() {
            super(null);
        }

        private Object readResolve() {
            return INSTANCE;
        }

        @Override // com.google.common.collect.Cut
        public int compareTo(Cut<Comparable<?>> o) {
            return o == this ? 0 : 1;
        }

        @Override // com.google.common.collect.Cut
        public void describeAsLowerBound(StringBuilder sb) {
            throw new AssertionError();
        }

        @Override // com.google.common.collect.Cut
        public void describeAsUpperBound(StringBuilder sb) {
            sb.append("+∞)");
        }

        @Override // com.google.common.collect.Cut
        public Comparable<?> endpoint() {
            throw new IllegalStateException("range unbounded on this side");
        }

        @Override // com.google.common.collect.Cut
        public int hashCode() {
            return System.identityHashCode(this);
        }

        @Override // com.google.common.collect.Cut
        public boolean isLessThan(Comparable<?> value) {
            return false;
        }

        public String toString() {
            return "+∞";
        }
    }

    /* loaded from: classes.dex */
    public static final class AboveValue<C extends Comparable> extends Cut<C> {
        private static final long serialVersionUID = 0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AboveValue(C endpoint) {
            super(endpoint);
            Objects.requireNonNull(endpoint);
        }

        @Override // com.google.common.collect.Cut
        public void describeAsLowerBound(StringBuilder sb) {
            sb.append('(');
            sb.append(this.endpoint);
        }

        @Override // com.google.common.collect.Cut
        public void describeAsUpperBound(StringBuilder sb) {
            sb.append(this.endpoint);
            sb.append(']');
        }

        @Override // com.google.common.collect.Cut
        public int hashCode() {
            return ~this.endpoint.hashCode();
        }

        @Override // com.google.common.collect.Cut
        public boolean isLessThan(C value) {
            C c = this.endpoint;
            Range<Comparable> range = Range.ALL;
            return c.compareTo(value) < 0;
        }

        public String toString() {
            String valueOf = String.valueOf(this.endpoint);
            return FakeDrag$$ExternalSyntheticOutline0.m(valueOf.length() + 2, "/", valueOf, "\\");
        }
    }

    /* loaded from: classes.dex */
    public static final class BelowAll extends Cut<Comparable<?>> {
        public static final BelowAll INSTANCE = new BelowAll();
        private static final long serialVersionUID = 0;

        public BelowAll() {
            super(null);
        }

        private Object readResolve() {
            return INSTANCE;
        }

        @Override // com.google.common.collect.Cut
        public int compareTo(Cut<Comparable<?>> o) {
            return o == this ? 0 : -1;
        }

        @Override // com.google.common.collect.Cut
        public void describeAsLowerBound(StringBuilder sb) {
            sb.append("(-∞");
        }

        @Override // com.google.common.collect.Cut
        public void describeAsUpperBound(StringBuilder sb) {
            throw new AssertionError();
        }

        @Override // com.google.common.collect.Cut
        public Comparable<?> endpoint() {
            throw new IllegalStateException("range unbounded on this side");
        }

        @Override // com.google.common.collect.Cut
        public int hashCode() {
            return System.identityHashCode(this);
        }

        @Override // com.google.common.collect.Cut
        public boolean isLessThan(Comparable<?> value) {
            return true;
        }

        public String toString() {
            return "-∞";
        }
    }

    /* loaded from: classes.dex */
    public static final class BelowValue<C extends Comparable> extends Cut<C> {
        private static final long serialVersionUID = 0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BelowValue(C endpoint) {
            super(endpoint);
            Objects.requireNonNull(endpoint);
        }

        @Override // com.google.common.collect.Cut
        public void describeAsLowerBound(StringBuilder sb) {
            sb.append('[');
            sb.append(this.endpoint);
        }

        @Override // com.google.common.collect.Cut
        public void describeAsUpperBound(StringBuilder sb) {
            sb.append(this.endpoint);
            sb.append(')');
        }

        @Override // com.google.common.collect.Cut
        public int hashCode() {
            return this.endpoint.hashCode();
        }

        @Override // com.google.common.collect.Cut
        public boolean isLessThan(C value) {
            C c = this.endpoint;
            Range<Comparable> range = Range.ALL;
            return c.compareTo(value) <= 0;
        }

        public String toString() {
            String valueOf = String.valueOf(this.endpoint);
            return FakeDrag$$ExternalSyntheticOutline0.m(valueOf.length() + 2, "\\", valueOf, "/");
        }
    }

    public Cut(C endpoint) {
        this.endpoint = endpoint;
    }

    @Override // java.lang.Comparable
    public /* bridge */ /* synthetic */ int compareTo(Object that) {
        return compareTo((Cut) ((Cut) that));
    }

    public abstract void describeAsLowerBound(StringBuilder sb);

    public abstract void describeAsUpperBound(StringBuilder sb);

    public C endpoint() {
        return this.endpoint;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof Cut)) {
            return false;
        }
        try {
            return compareTo((Cut) ((Cut) obj)) == 0;
        } catch (ClassCastException unused) {
            return false;
        }
    }

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
}
