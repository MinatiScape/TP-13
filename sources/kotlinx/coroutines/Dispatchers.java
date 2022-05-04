package kotlinx.coroutines;

import kotlinx.coroutines.scheduling.DefaultScheduler;
import kotlinx.coroutines.scheduling.LimitingDispatcher;
import org.jetbrains.annotations.NotNull;
/* compiled from: Dispatchers.kt */
/* loaded from: classes.dex */
public final class Dispatchers {
    @NotNull
    public static final ExecutorCoroutineDispatcher Default;
    @NotNull
    public static final LimitingDispatcher IO;

    static {
        ExecutorCoroutineDispatcher executorCoroutineDispatcher;
        if (CoroutineContextKt.useCoroutinesScheduler) {
            executorCoroutineDispatcher = DefaultScheduler.INSTANCE;
        } else {
            executorCoroutineDispatcher = CommonPool.INSTANCE;
        }
        Default = executorCoroutineDispatcher;
        int i = Unconfined.$r8$clinit;
        DefaultScheduler.INSTANCE.getClass();
        IO = DefaultScheduler.IO;
    }
}
