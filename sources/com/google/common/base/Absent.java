package com.google.common.base;
/* loaded from: classes.dex */
public final class Absent<T> extends Optional<T> {
    public static final Absent<Object> INSTANCE = new Absent<>();
    private static final long serialVersionUID = 0;

    private Object readResolve() {
        return INSTANCE;
    }

    public boolean equals(Object object) {
        return object == this;
    }

    @Override // com.google.common.base.Optional
    public T get() {
        throw new IllegalStateException("Optional.get() cannot be called on an absent value");
    }

    public int hashCode() {
        return 2040732332;
    }

    @Override // com.google.common.base.Optional
    public T or(T defaultValue) {
        return defaultValue;
    }

    public String toString() {
        return "Optional.absent()";
    }
}
