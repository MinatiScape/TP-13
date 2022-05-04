package kotlinx.coroutines;

import kotlinx.coroutines.EventLoopImplBase;
import org.jetbrains.annotations.NotNull;
/* compiled from: EventLoop.kt */
/* loaded from: classes.dex */
public abstract class EventLoopImplPlatform extends EventLoop {
    @NotNull
    public abstract Thread getThread();

    public static void reschedule(long j, @NotNull EventLoopImplBase.DelayedTask delayedTask) {
        boolean z = DebugKt.DEBUG;
        DefaultExecutor.INSTANCE.schedule(j, delayedTask);
    }
}
