package com.google.common.base;

import java.io.Serializable;
/* loaded from: classes.dex */
public abstract class Equivalence<T> {
    public abstract boolean doEquivalent(T a, T b);

    public abstract int doHash(T t);

    /* loaded from: classes.dex */
    public static final class Equals extends Equivalence<Object> implements Serializable {
        public static final Equals INSTANCE = new Equals();
        private static final long serialVersionUID = 1;

        @Override // com.google.common.base.Equivalence
        public final boolean doEquivalent(Object a, Object b) {
            return a.equals(b);
        }

        @Override // com.google.common.base.Equivalence
        public final int doHash(Object o) {
            return o.hashCode();
        }

        private Object readResolve() {
            return INSTANCE;
        }
    }

    /* loaded from: classes.dex */
    public static final class Identity extends Equivalence<Object> implements Serializable {
        public static final Identity INSTANCE = new Identity();
        private static final long serialVersionUID = 1;

        @Override // com.google.common.base.Equivalence
        public final boolean doEquivalent(Object a, Object b) {
            return false;
        }

        @Override // com.google.common.base.Equivalence
        public final int doHash(Object o) {
            return System.identityHashCode(o);
        }

        private Object readResolve() {
            return INSTANCE;
        }
    }

    public final boolean equivalent(T a, T b) {
        if (a == b) {
            return true;
        }
        if (a == null || b == null) {
            return false;
        }
        return doEquivalent(a, b);
    }

    public static Equivalence<Object> equals() {
        return Equals.INSTANCE;
    }

    public static Equivalence<Object> identity() {
        return Identity.INSTANCE;
    }
}
