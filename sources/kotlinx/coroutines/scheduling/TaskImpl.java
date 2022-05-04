package kotlinx.coroutines.scheduling;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import kotlinx.coroutines.TimeSourceKt;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public final class TaskImpl extends Task {
    @NotNull
    public final Runnable block;

    public TaskImpl(@NotNull Runnable runnable, long j, @NotNull TaskContext taskContext) {
        super(j, taskContext);
        this.block = runnable;
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            this.block.run();
        } finally {
            this.taskContext.afterTask();
        }
    }

    @NotNull
    public String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Task[");
        m.append(TimeSourceKt.getClassSimpleName(this.block));
        m.append('@');
        m.append(TimeSourceKt.getHexAddress(this.block));
        m.append(", ");
        m.append(this.submissionTime);
        m.append(", ");
        m.append(this.taskContext);
        m.append(']');
        return m.toString();
    }
}
