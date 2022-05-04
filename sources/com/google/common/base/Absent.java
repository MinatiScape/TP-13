package com.google.common.base;
/* loaded from: classes.dex */
final class Absent<T> extends Optional<T> {
    public static final Absent<Object> INSTANCE = new Absent<>();
    private static final long serialVersionUID = 0;

    public final boolean equals(Object object) {
        return object == this;
    }

    public final int hashCode() {
        return 2040732332;
    }

    public final String toString() {
        return "Optional.absent()";
    }

    @Override // com.google.common.base.Optional
    public final T get() {
        throw new IllegalStateException("Optional.get() cannot be called on an absent value");
    }

    @Override // com.google.common.base.Optional
    public final T or(T defaultValue) {
        if (defaultValue != null) {
            return defaultValue;
        }
        throw new NullPointerException("use Optional.orNull() instead of Optional.or(null)");
    }

    private Absent() {
    }

    private Object readResolve() {
        return INSTANCE;
    }
}
