package kotlinx.atomicfu;

import org.jetbrains.annotations.NotNull;
/* compiled from: AtomicFU.kt */
/* loaded from: classes.dex */
public final class AtomicFU {
    @NotNull
    public static final <T> AtomicRef<T> atomic(T t) {
        return new AtomicRef<>(t);
    }
}
