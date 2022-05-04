package kotlinx.coroutines;

import java.util.concurrent.CancellationException;
import kotlin.Result;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.jvm.internal.CoroutineStackFrame;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.internal.StackTraceRecoveryKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: CancellableContinuationImpl.kt */
/* loaded from: classes.dex */
public final class CancellableContinuationImpl<T> extends DispatchedTask<T> implements Continuation, CoroutineStackFrame {
    @Nullable
    public NonDisposableHandle parentHandle;

    @Override // kotlin.coroutines.jvm.internal.CoroutineStackFrame
    @Nullable
    public final CoroutineStackFrame getCallerFrame() {
        return null;
    }

    @Override // kotlin.coroutines.Continuation
    @NotNull
    public final CoroutineContext getContext() {
        return null;
    }

    @Override // kotlinx.coroutines.DispatchedTask
    @NotNull
    public final Continuation<T> getDelegate$external__kotlinx_coroutines__android_common__kotlinx_coroutines() {
        return null;
    }

    @Override // kotlin.coroutines.jvm.internal.CoroutineStackFrame
    @Nullable
    public final StackTraceElement getStackTraceElement() {
        return null;
    }

    @NotNull
    public final String toString() {
        DebugStringsKt.toDebugString(null);
        throw null;
    }

    @Override // kotlinx.coroutines.DispatchedTask
    public final void cancelCompletedResult$external__kotlinx_coroutines__android_common__kotlinx_coroutines(@Nullable Object obj, @NotNull CancellationException cause) {
        Intrinsics.checkNotNullParameter(cause, "cause");
        throw null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // kotlinx.coroutines.DispatchedTask
    public final <T> T getSuccessfulResult$external__kotlinx_coroutines__android_common__kotlinx_coroutines(@Nullable Object obj) {
        if (obj instanceof CompletedContinuation) {
            return (T) ((CompletedContinuation) obj).result;
        }
        return obj;
    }

    @Override // kotlinx.coroutines.DispatchedTask
    @Nullable
    public final Throwable getExceptionalResult$external__kotlinx_coroutines__android_common__kotlinx_coroutines(@Nullable Object obj) {
        Throwable exceptionalResult$external__kotlinx_coroutines__android_common__kotlinx_coroutines = super.getExceptionalResult$external__kotlinx_coroutines__android_common__kotlinx_coroutines(obj);
        if (exceptionalResult$external__kotlinx_coroutines__android_common__kotlinx_coroutines == null) {
            return null;
        }
        boolean z = DebugKt.RECOVER_STACK_TRACES;
        return exceptionalResult$external__kotlinx_coroutines__android_common__kotlinx_coroutines;
    }

    @Override // kotlin.coroutines.Continuation
    public final void resumeWith(@NotNull Object obj) {
        Throwable th = Result.m80exceptionOrNullimpl(obj);
        if (th != null) {
            if (DebugKt.RECOVER_STACK_TRACES) {
                StackTraceRecoveryKt.access$recoverFromStackFrame(th, this);
            }
        }
        throw null;
    }

    @Override // kotlinx.coroutines.DispatchedTask
    @Nullable
    public final Object takeState$external__kotlinx_coroutines__android_common__kotlinx_coroutines() {
        throw null;
    }
}
