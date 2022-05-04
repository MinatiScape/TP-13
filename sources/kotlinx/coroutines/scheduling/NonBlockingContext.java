package kotlinx.coroutines.scheduling;

import org.jetbrains.annotations.NotNull;
/* compiled from: Tasks.kt */
/* loaded from: classes.dex */
public final class NonBlockingContext implements TaskContext {
    @NotNull
    public static final NonBlockingContext INSTANCE = new NonBlockingContext();

    @Override // kotlinx.coroutines.scheduling.TaskContext
    public final void afterTask() {
    }

    @Override // kotlinx.coroutines.scheduling.TaskContext
    public final int getTaskMode() {
        return 0;
    }
}
