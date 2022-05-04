package kotlinx.coroutines.scheduling;

import java.util.concurrent.atomic.AtomicReferenceArray;
import kotlinx.atomicfu.AtomicInt;
import kotlinx.atomicfu.AtomicRef;
import kotlinx.coroutines.DebugKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: WorkQueue.kt */
/* loaded from: classes.dex */
public final class WorkQueue {
    @NotNull
    public final AtomicReferenceArray<Task> buffer = new AtomicReferenceArray<>(128);
    @NotNull
    public final AtomicRef<Task> lastScheduledTask = new AtomicRef<>(null);
    @NotNull
    public final AtomicInt producerIndex = new AtomicInt();
    @NotNull
    public final AtomicInt consumerIndex = new AtomicInt();
    @NotNull
    public final AtomicInt blockingTasksInBuffer = new AtomicInt();

    @Nullable
    public final Task add(@NotNull Task task, boolean z) {
        if (z) {
            return addLast(task);
        }
        Task andSet = this.lastScheduledTask.getAndSet(task);
        if (andSet == null) {
            return null;
        }
        return addLast(andSet);
    }

    public final Task addLast(Task task) {
        boolean z = true;
        if (task.taskContext.getTaskMode() != 1) {
            z = false;
        }
        if (z) {
            this.blockingTasksInBuffer.incrementAndGet();
        }
        if (getBufferSize$external__kotlinx_coroutines__android_common__kotlinx_coroutines() == 127) {
            return task;
        }
        int i = this.producerIndex.value & 127;
        while (this.buffer.get(i) != null) {
            Thread.yield();
        }
        this.buffer.lazySet(i, task);
        this.producerIndex.incrementAndGet();
        return null;
    }

    public final int getBufferSize$external__kotlinx_coroutines__android_common__kotlinx_coroutines() {
        return this.producerIndex.value - this.consumerIndex.value;
    }

    public final Task pollBuffer() {
        Task andSet;
        while (true) {
            int i = this.consumerIndex.value;
            if (i - this.producerIndex.value == 0) {
                return null;
            }
            int i2 = i & 127;
            if (this.consumerIndex.compareAndSet(i, i + 1) && (andSet = this.buffer.getAndSet(i2, null)) != null) {
                boolean z = true;
                if (andSet.taskContext.getTaskMode() != 1) {
                    z = false;
                }
                if (z) {
                    this.blockingTasksInBuffer.decrementAndGet();
                    boolean z2 = DebugKt.DEBUG;
                }
                return andSet;
            }
        }
    }

    public final long tryStealLastScheduled(WorkQueue workQueue, boolean z) {
        Task task;
        do {
            task = workQueue.lastScheduledTask.value;
            if (task == null) {
                return -2L;
            }
            if (z) {
                boolean z2 = true;
                if (task.taskContext.getTaskMode() != 1) {
                    z2 = false;
                }
                if (!z2) {
                    return -2L;
                }
            }
            TasksKt.schedulerTimeSource.getClass();
            long nanoTime = System.nanoTime() - task.submissionTime;
            long j = TasksKt.WORK_STEALING_TIME_RESOLUTION_NS;
            if (nanoTime < j) {
                return j - nanoTime;
            }
        } while (!workQueue.lastScheduledTask.compareAndSet(task, null));
        add(task, false);
        return -1L;
    }
}
