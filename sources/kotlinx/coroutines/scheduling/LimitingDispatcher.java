package kotlinx.coroutines.scheduling;

import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.atomicfu.AtomicInt;
import kotlinx.coroutines.DefaultExecutor;
import kotlinx.coroutines.ExecutorCoroutineDispatcher;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: Dispatcher.kt */
/* loaded from: classes.dex */
public final class LimitingDispatcher extends ExecutorCoroutineDispatcher implements TaskContext, Executor {
    @NotNull
    public final ExperimentalCoroutineDispatcher dispatcher;
    public final int parallelism;
    @Nullable
    public final String name = "Dispatchers.IO";
    public final int taskMode = 1;
    @NotNull
    public final ConcurrentLinkedQueue<Runnable> queue = new ConcurrentLinkedQueue<>();
    @NotNull
    public final AtomicInt inFlightTasks = new AtomicInt();

    @Override // kotlinx.coroutines.CoroutineDispatcher
    public final void dispatch(@NotNull CoroutineContext context, @NotNull Runnable block) {
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(block, "block");
        dispatch(block, false);
    }

    @Override // kotlinx.coroutines.scheduling.TaskContext
    public final void afterTask() {
        Runnable poll = this.queue.poll();
        if (poll != null) {
            ExperimentalCoroutineDispatcher experimentalCoroutineDispatcher = this.dispatcher;
            experimentalCoroutineDispatcher.getClass();
            try {
                experimentalCoroutineDispatcher.coroutineScheduler.dispatch(poll, this, true);
            } catch (RejectedExecutionException unused) {
                DefaultExecutor defaultExecutor = DefaultExecutor.INSTANCE;
                experimentalCoroutineDispatcher.coroutineScheduler.getClass();
                defaultExecutor.enqueue(CoroutineScheduler.createTask(poll, this));
            }
        } else {
            this.inFlightTasks.decrementAndGet();
            Runnable poll2 = this.queue.poll();
            if (poll2 != null) {
                dispatch(poll2, true);
            }
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        throw new IllegalStateException("Close cannot be invoked on LimitingBlockingDispatcher".toString());
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0029  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void dispatch(java.lang.Runnable r3, boolean r4) {
        /*
            r2 = this;
        L0:
            kotlinx.atomicfu.AtomicInt r0 = r2.inFlightTasks
            int r0 = r0.incrementAndGet()
            int r1 = r2.parallelism
            if (r0 > r1) goto L29
            kotlinx.coroutines.scheduling.ExperimentalCoroutineDispatcher r0 = r2.dispatcher
            r0.getClass()
            java.lang.String r1 = "block"
            kotlin.jvm.internal.Intrinsics.checkNotNullParameter(r3, r1)
            kotlinx.coroutines.scheduling.CoroutineScheduler r1 = r0.coroutineScheduler     // Catch: java.util.concurrent.RejectedExecutionException -> L1a
            r1.dispatch(r3, r2, r4)     // Catch: java.util.concurrent.RejectedExecutionException -> L1a
            goto L28
        L1a:
            kotlinx.coroutines.DefaultExecutor r4 = kotlinx.coroutines.DefaultExecutor.INSTANCE
            kotlinx.coroutines.scheduling.CoroutineScheduler r0 = r0.coroutineScheduler
            r0.getClass()
            kotlinx.coroutines.scheduling.Task r2 = kotlinx.coroutines.scheduling.CoroutineScheduler.createTask(r3, r2)
            r4.enqueue(r2)
        L28:
            return
        L29:
            java.util.concurrent.ConcurrentLinkedQueue<java.lang.Runnable> r0 = r2.queue
            r0.add(r3)
            kotlinx.atomicfu.AtomicInt r3 = r2.inFlightTasks
            int r3 = r3.decrementAndGet()
            int r0 = r2.parallelism
            if (r3 < r0) goto L39
            return
        L39:
            java.util.concurrent.ConcurrentLinkedQueue<java.lang.Runnable> r3 = r2.queue
            java.lang.Object r3 = r3.poll()
            java.lang.Runnable r3 = (java.lang.Runnable) r3
            if (r3 != 0) goto L0
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.scheduling.LimitingDispatcher.dispatch(java.lang.Runnable, boolean):void");
    }

    @Override // java.util.concurrent.Executor
    public final void execute(@NotNull Runnable command) {
        Intrinsics.checkNotNullParameter(command, "command");
        dispatch(command, false);
    }

    @Override // kotlinx.coroutines.CoroutineDispatcher
    @NotNull
    public final String toString() {
        String str = this.name;
        if (str != null) {
            return str;
        }
        return super.toString() + "[dispatcher = " + this.dispatcher + ']';
    }

    public LimitingDispatcher(@NotNull DefaultScheduler defaultScheduler, int i) {
        this.dispatcher = defaultScheduler;
        this.parallelism = i;
    }

    @Override // kotlinx.coroutines.scheduling.TaskContext
    public final int getTaskMode() {
        return this.taskMode;
    }
}
