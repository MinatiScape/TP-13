package kotlin;

import java.io.Serializable;
import org.jetbrains.annotations.NotNull;
/* compiled from: Lazy.kt */
/* loaded from: classes.dex */
public final class InitializedLazyImpl<T> implements Lazy<T>, Serializable {
    private final T value;

    @Override // kotlin.Lazy
    public final T getValue() {
        throw null;
    }

    @NotNull
    public final String toString() {
        return String.valueOf(this.value);
    }

    public InitializedLazyImpl(T t) {
        this.value = t;
    }
}
