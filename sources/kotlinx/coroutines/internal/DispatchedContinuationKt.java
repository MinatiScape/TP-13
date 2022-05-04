package kotlinx.coroutines.internal;

import java.util.concurrent.CancellationException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.CompletedExceptionally;
import kotlinx.coroutines.CompletedWithCancellation;
import kotlinx.coroutines.CoroutineContextKt;
import kotlinx.coroutines.DebugKt;
import kotlinx.coroutines.EventLoop;
import kotlinx.coroutines.Job;
import kotlinx.coroutines.ThreadLocalEventLoop;
import kotlinx.coroutines.UndispatchedCoroutine;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: DispatchedContinuation.kt */
/* loaded from: classes.dex */
public final class DispatchedContinuationKt {
    @NotNull
    public static final Symbol UNDEFINED = new Symbol("UNDEFINED");
    @NotNull
    public static final Symbol REUSABLE_CLAIMED = new Symbol("REUSABLE_CLAIMED");

    public static final <T> void resumeCancellableWith(@NotNull Continuation<? super T> continuation, @NotNull Object obj, @Nullable Function1<? super Throwable, Unit> function1) {
        Object obj2;
        boolean z;
        UndispatchedCoroutine<?> undispatchedCoroutine;
        Intrinsics.checkNotNullParameter(continuation, "<this>");
        if (continuation instanceof DispatchedContinuation) {
            DispatchedContinuation dispatchedContinuation = (DispatchedContinuation) continuation;
            Throwable th = Result.m80exceptionOrNullimpl(obj);
            if (th != null) {
                obj2 = new CompletedExceptionally(th);
            } else if (function1 != null) {
                obj2 = new CompletedWithCancellation(obj, function1);
            } else {
                obj2 = obj;
            }
            if (dispatchedContinuation.dispatcher.isDispatchNeeded(dispatchedContinuation.getContext())) {
                dispatchedContinuation._state = obj2;
                dispatchedContinuation.resumeMode = 1;
                dispatchedContinuation.dispatcher.dispatch(dispatchedContinuation.getContext(), dispatchedContinuation);
                return;
            }
            boolean z2 = DebugKt.DEBUG;
            EventLoop eventLoop$external__kotlinx_coroutines__android_common__kotlinx_coroutines = ThreadLocalEventLoop.getEventLoop$external__kotlinx_coroutines__android_common__kotlinx_coroutines();
            boolean z3 = false;
            if (eventLoop$external__kotlinx_coroutines__android_common__kotlinx_coroutines.useCount >= 4294967296L) {
                z = true;
            } else {
                z = false;
            }
            if (z) {
                dispatchedContinuation._state = obj2;
                dispatchedContinuation.resumeMode = 1;
                eventLoop$external__kotlinx_coroutines__android_common__kotlinx_coroutines.dispatchUnconfined(dispatchedContinuation);
                return;
            }
            eventLoop$external__kotlinx_coroutines__android_common__kotlinx_coroutines.incrementUseCount(true);
            try {
                Job job = (Job) dispatchedContinuation.getContext().get(Job.Key.$$INSTANCE);
                if (job != null && !job.isActive()) {
                    CancellationException cancellationException = job.getCancellationException();
                    dispatchedContinuation.cancelCompletedResult$external__kotlinx_coroutines__android_common__kotlinx_coroutines(obj2, cancellationException);
                    dispatchedContinuation.resumeWith(ResultKt.createFailure(cancellationException));
                    z3 = true;
                }
                if (!z3) {
                    Continuation<T> continuation2 = dispatchedContinuation.continuation;
                    Object obj3 = dispatchedContinuation.countOrElement;
                    CoroutineContext context = continuation2.getContext();
                    Object updateThreadContext = ThreadContextKt.updateThreadContext(context, obj3);
                    if (updateThreadContext != ThreadContextKt.NO_THREAD_ELEMENTS) {
                        undispatchedCoroutine = CoroutineContextKt.updateUndispatchedCompletion(continuation2, context, updateThreadContext);
                    } else {
                        undispatchedCoroutine = null;
                    }
                    dispatchedContinuation.continuation.resumeWith(obj);
                    if (undispatchedCoroutine == null || undispatchedCoroutine.clearThreadContext()) {
                        ThreadContextKt.restoreThreadContext(context, updateThreadContext);
                    }
                }
                do {
                } while (eventLoop$external__kotlinx_coroutines__android_common__kotlinx_coroutines.processUnconfinedEvent());
            } finally {
                try {
                    return;
                } finally {
                }
            }
            return;
        }
        continuation.resumeWith(obj);
    }
}
