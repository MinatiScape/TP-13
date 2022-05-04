package kotlinx.coroutines.scheduling;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: Tasks.kt */
/* loaded from: classes.dex */
public abstract class Task implements Runnable {
    public long submissionTime;
    @NotNull
    public TaskContext taskContext;

    public Task(long j, @NotNull TaskContext taskContext) {
        Intrinsics.checkNotNullParameter(taskContext, "taskContext");
        this.submissionTime = j;
        this.taskContext = taskContext;
    }

    public Task() {
        this(0L, NonBlockingContext.INSTANCE);
    }
}
