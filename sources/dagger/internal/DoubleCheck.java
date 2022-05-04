package dagger.internal;

import javax.inject.Provider;
/* loaded from: classes.dex */
public final class DoubleCheck<T> implements Provider<T> {
    public static final Object UNINITIALIZED = new Object();
    public volatile Object instance = UNINITIALIZED;
    public volatile Provider<T> provider;

    public static void reentrantCheck(Object obj, Object obj2) {
        boolean z;
        if (obj != UNINITIALIZED) {
            z = true;
        } else {
            z = false;
        }
        if (z && obj != obj2) {
            throw new IllegalStateException("Scoped provider was invoked recursively returning different results: " + obj + " & " + obj2 + ". This is likely due to a circular dependency.");
        }
    }

    @Override // javax.inject.Provider
    public final T get() {
        T t = (T) this.instance;
        Object obj = UNINITIALIZED;
        if (t == obj) {
            synchronized (this) {
                t = this.instance;
                if (t == obj) {
                    t = this.provider.get();
                    reentrantCheck(this.instance, t);
                    this.instance = t;
                    this.provider = null;
                }
            }
        }
        return t;
    }

    public DoubleCheck(Factory factory) {
        this.provider = factory;
    }
}
