package kotlinx.coroutines.scheduling;

import java.util.Objects;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.DefaultExecutor;
import kotlinx.coroutines.ExecutorCoroutineDispatcher;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public class ExperimentalCoroutineDispatcher extends ExecutorCoroutineDispatcher {
    public final int corePoolSize;
    public CoroutineScheduler coroutineScheduler;
    public final long idleWorkerKeepAliveNs;
    public final int maxPoolSize;
    public final String schedulerName;

    public ExperimentalCoroutineDispatcher(int i, int i2, String str, int i3) {
        int i4 = (i3 & 1) != 0 ? TasksKt.CORE_POOL_SIZE : i;
        int i5 = (i3 & 2) != 0 ? TasksKt.MAX_POOL_SIZE : i2;
        String schedulerName = (i3 & 4) != 0 ? "DefaultDispatcher" : null;
        Intrinsics.checkParameterIsNotNull(schedulerName, "schedulerName");
        long j = TasksKt.IDLE_WORKER_KEEP_ALIVE_NS;
        this.corePoolSize = i4;
        this.maxPoolSize = i5;
        this.idleWorkerKeepAliveNs = j;
        this.schedulerName = schedulerName;
        this.coroutineScheduler = new CoroutineScheduler(i4, i5, j, schedulerName);
    }

    @Override // kotlinx.coroutines.CoroutineDispatcher
    public void dispatch(@NotNull CoroutineContext context, @NotNull Runnable runnable) {
        Intrinsics.checkParameterIsNotNull(context, "context");
        try {
            CoroutineScheduler coroutineScheduler = this.coroutineScheduler;
            AtomicLongFieldUpdater atomicLongFieldUpdater = CoroutineScheduler.parkedWorkersStack$FU;
            coroutineScheduler.dispatch(runnable, NonBlockingContext.INSTANCE, false);
        } catch (RejectedExecutionException unused) {
            DefaultExecutor defaultExecutor = DefaultExecutor.INSTANCE;
            Objects.requireNonNull(defaultExecutor);
            defaultExecutor.enqueue(runnable);
        }
    }

    public final void dispatchWithContext$kotlinx_coroutines_core(@NotNull Runnable block, @NotNull TaskContext taskContext, boolean z) {
        Intrinsics.checkParameterIsNotNull(block, "block");
        try {
            this.coroutineScheduler.dispatch(block, taskContext, z);
        } catch (RejectedExecutionException unused) {
            DefaultExecutor.INSTANCE.enqueue(this.coroutineScheduler.createTask$kotlinx_coroutines_core(block, taskContext));
        }
    }
}
