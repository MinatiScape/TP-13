package kotlinx.coroutines.scheduling;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.DebugStringsKt;
import org.jetbrains.annotations.NotNull;
/* compiled from: Tasks.kt */
/* loaded from: classes.dex */
public final class TaskImpl extends Task {
    @NotNull
    public final Runnable block;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public TaskImpl(@NotNull Runnable block, long j, @NotNull TaskContext taskContext) {
        super(j, taskContext);
        Intrinsics.checkNotNullParameter(block, "block");
        Intrinsics.checkNotNullParameter(taskContext, "taskContext");
        this.block = block;
    }

    @Override // java.lang.Runnable
    public final void run() {
        try {
            this.block.run();
        } finally {
            this.taskContext.afterTask();
        }
    }

    @NotNull
    public final String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Task[");
        m.append(DebugStringsKt.getClassSimpleName(this.block));
        m.append('@');
        m.append(DebugStringsKt.getHexAddress(this.block));
        m.append(", ");
        m.append(this.submissionTime);
        m.append(", ");
        m.append(this.taskContext);
        m.append(']');
        return m.toString();
    }
}
