package kotlinx.coroutines.scheduling;

import java.util.concurrent.RejectedExecutionException;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.DefaultExecutor;
import kotlinx.coroutines.ExecutorCoroutineDispatcher;
import kotlinx.coroutines.internal.Symbol;
import org.jetbrains.annotations.NotNull;
/* compiled from: Dispatcher.kt */
/* loaded from: classes.dex */
public class ExperimentalCoroutineDispatcher extends ExecutorCoroutineDispatcher {
    @NotNull
    public CoroutineScheduler coroutineScheduler = new CoroutineScheduler(TasksKt.CORE_POOL_SIZE, TasksKt.MAX_POOL_SIZE, TasksKt.IDLE_WORKER_KEEP_ALIVE_NS, "DefaultDispatcher");

    @Override // kotlinx.coroutines.CoroutineDispatcher
    public final void dispatch(@NotNull CoroutineContext context, @NotNull Runnable block) {
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(block, "block");
        try {
            CoroutineScheduler coroutineScheduler = this.coroutineScheduler;
            Symbol symbol = CoroutineScheduler.NOT_IN_STACK;
            coroutineScheduler.dispatch(block, NonBlockingContext.INSTANCE, false);
        } catch (RejectedExecutionException unused) {
            DefaultExecutor.INSTANCE.dispatch(context, block);
        }
    }
}
