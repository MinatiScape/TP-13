package dagger.internal;
/* loaded from: classes.dex */
public final class InstanceFactory<T> implements Factory<T> {
    public final T instance;

    public static InstanceFactory create(Object obj) {
        if (obj != null) {
            return new InstanceFactory(obj);
        }
        throw new NullPointerException("instance cannot be null");
    }

    public InstanceFactory(T t) {
        this.instance = t;
    }

    @Override // javax.inject.Provider
    public final T get() {
        return this.instance;
    }
}
