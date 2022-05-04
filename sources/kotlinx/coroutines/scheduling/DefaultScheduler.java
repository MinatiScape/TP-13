package kotlinx.coroutines.scheduling;

import kotlinx.coroutines.internal.SystemPropsKt;
import kotlinx.coroutines.internal.SystemPropsKt__SystemPropsKt;
import org.jetbrains.annotations.NotNull;
/* compiled from: Dispatcher.kt */
/* loaded from: classes.dex */
public final class DefaultScheduler extends ExperimentalCoroutineDispatcher {
    @NotNull
    public static final DefaultScheduler INSTANCE;
    @NotNull
    public static final LimitingDispatcher IO;

    @Override // kotlinx.coroutines.CoroutineDispatcher
    @NotNull
    public final String toString() {
        return "Dispatchers.Default";
    }

    static {
        DefaultScheduler defaultScheduler = new DefaultScheduler();
        INSTANCE = defaultScheduler;
        int i = SystemPropsKt__SystemPropsKt.AVAILABLE_PROCESSORS;
        if (64 >= i) {
            i = 64;
        }
        IO = new LimitingDispatcher(defaultScheduler, SystemPropsKt.systemProp$default("kotlinx.coroutines.io.parallelism", i, 0, 0, 12));
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        throw new UnsupportedOperationException("Dispatchers.Default cannot be closed");
    }
}
