package kotlinx.coroutines.internal;

import android.support.media.ExifInterface$$ExternalSyntheticOutline0;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.IntrinsicsKt__IntrinsicsKt;
import kotlin.coroutines.jvm.internal.CoroutineStackFrame;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.AbstractCoroutine;
import kotlinx.coroutines.CompletedExceptionally;
import kotlinx.coroutines.DispatchedContinuation;
import kotlinx.coroutines.DispatchedKt;
import kotlinx.coroutines.EventLoop;
import kotlinx.coroutines.Job;
import kotlinx.coroutines.ThreadLocalEventLoop;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* loaded from: classes.dex */
public class ScopeCoroutine<T> extends AbstractCoroutine<T> implements CoroutineStackFrame {
    @NotNull
    public final Continuation<T> uCont;

    /* JADX WARN: Multi-variable type inference failed */
    public ScopeCoroutine(@NotNull CoroutineContext coroutineContext, @NotNull Continuation<? super T> continuation) {
        super(coroutineContext, true);
        this.uCont = continuation;
    }

    /* JADX WARN: Finally extract failed */
    @Override // kotlinx.coroutines.JobSupport
    public void afterCompletionInternal(@Nullable Object obj, int i) {
        Object updateThreadContext;
        if (obj instanceof CompletedExceptionally) {
            Throwable exception = ((CompletedExceptionally) obj).cause;
            if (i != 4) {
                exception = StackTraceRecoveryKt.recoverStackTrace(exception, this.uCont);
            }
            Continuation<T> resumeUninterceptedWithExceptionMode = this.uCont;
            Intrinsics.checkParameterIsNotNull(resumeUninterceptedWithExceptionMode, "$this$resumeUninterceptedWithExceptionMode");
            Intrinsics.checkParameterIsNotNull(exception, "exception");
            if (i == 0) {
                IntrinsicsKt__IntrinsicsKt.intercepted(resumeUninterceptedWithExceptionMode).resumeWith(ResultKt.createFailure(exception));
            } else if (i == 1) {
                Continuation resumeCancellableWithException = IntrinsicsKt__IntrinsicsKt.intercepted(resumeUninterceptedWithExceptionMode);
                Symbol symbol = DispatchedKt.UNDEFINED;
                Intrinsics.checkParameterIsNotNull(resumeCancellableWithException, "$this$resumeCancellableWithException");
                Intrinsics.checkParameterIsNotNull(exception, "exception");
                if (resumeCancellableWithException instanceof DispatchedContinuation) {
                    DispatchedContinuation dispatchedContinuation = (DispatchedContinuation) resumeCancellableWithException;
                    CoroutineContext context = dispatchedContinuation.continuation.getContext();
                    boolean z = false;
                    CompletedExceptionally completedExceptionally = new CompletedExceptionally(exception, false, 2);
                    if (dispatchedContinuation.dispatcher.isDispatchNeeded(context)) {
                        dispatchedContinuation._state = new CompletedExceptionally(exception, false, 2);
                        dispatchedContinuation.resumeMode = 1;
                        dispatchedContinuation.dispatcher.dispatch(context, dispatchedContinuation);
                        return;
                    }
                    ThreadLocalEventLoop threadLocalEventLoop = ThreadLocalEventLoop.INSTANCE;
                    EventLoop eventLoop$kotlinx_coroutines_core = ThreadLocalEventLoop.getEventLoop$kotlinx_coroutines_core();
                    if (eventLoop$kotlinx_coroutines_core.isUnconfinedLoopActive()) {
                        dispatchedContinuation._state = completedExceptionally;
                        dispatchedContinuation.resumeMode = 1;
                        eventLoop$kotlinx_coroutines_core.dispatchUnconfined(dispatchedContinuation);
                        return;
                    }
                    eventLoop$kotlinx_coroutines_core.incrementUseCount(true);
                    try {
                        Job job = (Job) dispatchedContinuation.getContext().get(Job.Key);
                        if (job != null && !job.isActive()) {
                            dispatchedContinuation.resumeWith(ResultKt.createFailure(job.getCancellationException()));
                            z = true;
                        }
                        if (!z) {
                            CoroutineContext context2 = dispatchedContinuation.getContext();
                            Object updateThreadContext2 = ThreadContextKt.updateThreadContext(context2, dispatchedContinuation.countOrElement);
                            Continuation<T> continuation = dispatchedContinuation.continuation;
                            continuation.resumeWith(ResultKt.createFailure(StackTraceRecoveryKt.recoverStackTrace(exception, continuation)));
                            ThreadContextKt.restoreThreadContext(context2, updateThreadContext2);
                        }
                        do {
                        } while (eventLoop$kotlinx_coroutines_core.processUnconfinedEvent());
                    } finally {
                        try {
                            return;
                        } finally {
                        }
                    }
                    return;
                }
                resumeCancellableWithException.resumeWith(ResultKt.createFailure(StackTraceRecoveryKt.recoverStackTrace(exception, resumeCancellableWithException)));
            } else if (i == 2) {
                resumeUninterceptedWithExceptionMode.resumeWith(ResultKt.createFailure(exception));
            } else if (i == 3) {
                updateThreadContext = ThreadContextKt.updateThreadContext(resumeUninterceptedWithExceptionMode.getContext(), null);
                try {
                    resumeUninterceptedWithExceptionMode.resumeWith(ResultKt.createFailure(exception));
                } catch (Throwable th) {
                    throw th;
                }
            } else if (i != 4) {
                throw new IllegalStateException(ExifInterface$$ExternalSyntheticOutline0.m("Invalid mode ", i).toString());
            }
        } else {
            Continuation<T> resumeUninterceptedMode = this.uCont;
            Intrinsics.checkParameterIsNotNull(resumeUninterceptedMode, "$this$resumeUninterceptedMode");
            if (i == 0) {
                IntrinsicsKt__IntrinsicsKt.intercepted(resumeUninterceptedMode).resumeWith(obj);
            } else if (i == 1) {
                DispatchedKt.resumeCancellable(IntrinsicsKt__IntrinsicsKt.intercepted(resumeUninterceptedMode), obj);
            } else if (i == 2) {
                resumeUninterceptedMode.resumeWith(obj);
            } else if (i == 3) {
                CoroutineContext context3 = resumeUninterceptedMode.getContext();
                updateThreadContext = ThreadContextKt.updateThreadContext(context3, null);
                try {
                    resumeUninterceptedMode.resumeWith(obj);
                } finally {
                    ThreadContextKt.restoreThreadContext(context3, updateThreadContext);
                }
            } else if (i != 4) {
                throw new IllegalStateException(ExifInterface$$ExternalSyntheticOutline0.m("Invalid mode ", i).toString());
            }
        }
    }

    @Override // kotlin.coroutines.jvm.internal.CoroutineStackFrame
    @Nullable
    public final CoroutineStackFrame getCallerFrame() {
        return (CoroutineStackFrame) this.uCont;
    }

    @Override // kotlinx.coroutines.AbstractCoroutine
    public int getDefaultResumeMode$kotlinx_coroutines_core() {
        return 2;
    }

    @Override // kotlin.coroutines.jvm.internal.CoroutineStackFrame
    @Nullable
    public final StackTraceElement getStackTraceElement() {
        return null;
    }

    @Override // kotlinx.coroutines.JobSupport
    public final boolean isScopedCoroutine() {
        return true;
    }
}
