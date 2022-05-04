package kotlinx.coroutines;

import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.CoroutineStackFrame;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.internal.StackTraceRecoveryKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: CompletionState.kt */
/* loaded from: classes.dex */
public final class CompletionStateKt {
    @NotNull
    public static final <T> Object recoverResult(@Nullable Object obj, @NotNull Continuation<? super T> uCont) {
        Intrinsics.checkNotNullParameter(uCont, "uCont");
        if (!(obj instanceof CompletedExceptionally)) {
            return obj;
        }
        Throwable th = ((CompletedExceptionally) obj).cause;
        if (DebugKt.RECOVER_STACK_TRACES && (uCont instanceof CoroutineStackFrame)) {
            th = StackTraceRecoveryKt.access$recoverFromStackFrame(th, (CoroutineStackFrame) uCont);
        }
        return ResultKt.createFailure(th);
    }
}
