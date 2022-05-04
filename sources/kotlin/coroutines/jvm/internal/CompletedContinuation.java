package kotlin.coroutines.jvm.internal;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import org.jetbrains.annotations.NotNull;
/* compiled from: ContinuationImpl.kt */
/* loaded from: classes.dex */
public final class CompletedContinuation implements Continuation<Object> {
    @NotNull
    public static final CompletedContinuation INSTANCE = new CompletedContinuation();

    @NotNull
    public final String toString() {
        return "This continuation is already complete";
    }

    @Override // kotlin.coroutines.Continuation
    @NotNull
    public final CoroutineContext getContext() {
        throw new IllegalStateException("This continuation is already complete".toString());
    }

    @Override // kotlin.coroutines.Continuation
    public final void resumeWith(@NotNull Object obj) {
        throw new IllegalStateException("This continuation is already complete".toString());
    }
}
