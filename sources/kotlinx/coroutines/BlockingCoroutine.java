package kotlinx.coroutines;

import java.util.concurrent.locks.LockSupport;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: Builders.kt */
/* loaded from: classes.dex */
public final class BlockingCoroutine<T> extends AbstractCoroutine<T> {
    @NotNull
    public final Thread blockedThread;
    @Nullable
    public final EventLoop eventLoop;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public BlockingCoroutine(@NotNull CoroutineContext parentContext, @NotNull Thread thread, @Nullable EventLoop eventLoop) {
        super(parentContext, true);
        Intrinsics.checkNotNullParameter(parentContext, "parentContext");
        this.blockedThread = thread;
        this.eventLoop = eventLoop;
    }

    @Override // kotlinx.coroutines.JobSupport
    public final void afterCompletion(@Nullable Object obj) {
        if (!Intrinsics.areEqual(Thread.currentThread(), this.blockedThread)) {
            LockSupport.unpark(this.blockedThread);
        }
    }
}
