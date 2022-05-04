package kotlinx.coroutines;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: EventLoop.common.kt */
/* loaded from: classes.dex */
public final class ThreadLocalEventLoop {
    @NotNull
    public static final ThreadLocal<EventLoop> ref = new ThreadLocal<>();

    @NotNull
    public static EventLoop getEventLoop$external__kotlinx_coroutines__android_common__kotlinx_coroutines() {
        ThreadLocal<EventLoop> threadLocal = ref;
        EventLoop eventLoop = threadLocal.get();
        if (eventLoop != null) {
            return eventLoop;
        }
        Thread currentThread = Thread.currentThread();
        Intrinsics.checkNotNullExpressionValue(currentThread, "currentThread()");
        BlockingEventLoop blockingEventLoop = new BlockingEventLoop(currentThread);
        threadLocal.set(blockingEventLoop);
        return blockingEventLoop;
    }
}
