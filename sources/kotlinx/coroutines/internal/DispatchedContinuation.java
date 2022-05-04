package kotlinx.coroutines.internal;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import java.util.concurrent.CancellationException;
import kotlin.Result;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.jvm.internal.CoroutineStackFrame;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.atomicfu.AtomicRef;
import kotlinx.coroutines.CompletedExceptionally;
import kotlinx.coroutines.CompletedWithCancellation;
import kotlinx.coroutines.CoroutineDispatcher;
import kotlinx.coroutines.DebugKt;
import kotlinx.coroutines.DebugStringsKt;
import kotlinx.coroutines.DispatchedTask;
import kotlinx.coroutines.EventLoop;
import kotlinx.coroutines.ThreadLocalEventLoop;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: DispatchedContinuation.kt */
/* loaded from: classes.dex */
public final class DispatchedContinuation<T> extends DispatchedTask<T> implements CoroutineStackFrame, Continuation<T> {
    @NotNull
    public final Continuation<T> continuation;
    @NotNull
    public final CoroutineDispatcher dispatcher;
    @Nullable
    public Object _state = DispatchedContinuationKt.UNDEFINED;
    @NotNull
    public final Object countOrElement = ThreadContextKt.threadContextElements(getContext());
    @NotNull
    public final AtomicRef<Object> _reusableCancellableContinuation = new AtomicRef<>(null);

    @Override // kotlin.coroutines.Continuation
    @NotNull
    public final CoroutineContext getContext() {
        return this.continuation.getContext();
    }

    @Override // kotlinx.coroutines.DispatchedTask
    @NotNull
    public final Continuation<T> getDelegate$external__kotlinx_coroutines__android_common__kotlinx_coroutines() {
        return this;
    }

    @Override // kotlin.coroutines.jvm.internal.CoroutineStackFrame
    @Nullable
    public final StackTraceElement getStackTraceElement() {
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public DispatchedContinuation(@NotNull CoroutineDispatcher dispatcher, @NotNull Continuation<? super T> continuation) {
        Intrinsics.checkNotNullParameter(dispatcher, "dispatcher");
        Intrinsics.checkNotNullParameter(continuation, "continuation");
        this.dispatcher = dispatcher;
        this.continuation = continuation;
    }

    @Override // kotlinx.coroutines.DispatchedTask
    public final void cancelCompletedResult$external__kotlinx_coroutines__android_common__kotlinx_coroutines(@Nullable Object obj, @NotNull CancellationException cause) {
        Intrinsics.checkNotNullParameter(cause, "cause");
        if (obj instanceof CompletedWithCancellation) {
            ((CompletedWithCancellation) obj).onCancellation.invoke(cause);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.CoroutineStackFrame
    @Nullable
    public final CoroutineStackFrame getCallerFrame() {
        Continuation<T> continuation = this.continuation;
        if (continuation instanceof CoroutineStackFrame) {
            return (CoroutineStackFrame) continuation;
        }
        return null;
    }

    @Override // kotlin.coroutines.Continuation
    public final void resumeWith(@NotNull Object obj) {
        Object obj2;
        boolean z;
        CoroutineContext context = this.continuation.getContext();
        Throwable th = Result.m80exceptionOrNullimpl(obj);
        if (th == null) {
            obj2 = obj;
        } else {
            obj2 = new CompletedExceptionally(th);
        }
        if (this.dispatcher.isDispatchNeeded(context)) {
            this._state = obj2;
            this.resumeMode = 0;
            this.dispatcher.dispatch(context, this);
            return;
        }
        boolean z2 = DebugKt.DEBUG;
        EventLoop eventLoop$external__kotlinx_coroutines__android_common__kotlinx_coroutines = ThreadLocalEventLoop.getEventLoop$external__kotlinx_coroutines__android_common__kotlinx_coroutines();
        if (eventLoop$external__kotlinx_coroutines__android_common__kotlinx_coroutines.useCount >= 4294967296L) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            this._state = obj2;
            this.resumeMode = 0;
            eventLoop$external__kotlinx_coroutines__android_common__kotlinx_coroutines.dispatchUnconfined(this);
            return;
        }
        eventLoop$external__kotlinx_coroutines__android_common__kotlinx_coroutines.incrementUseCount(true);
        try {
            CoroutineContext context2 = getContext();
            Object updateThreadContext = ThreadContextKt.updateThreadContext(context2, this.countOrElement);
            this.continuation.resumeWith(obj);
            ThreadContextKt.restoreThreadContext(context2, updateThreadContext);
            do {
            } while (eventLoop$external__kotlinx_coroutines__android_common__kotlinx_coroutines.processUnconfinedEvent());
        } finally {
            try {
            } finally {
            }
        }
    }

    @Override // kotlinx.coroutines.DispatchedTask
    @Nullable
    public final Object takeState$external__kotlinx_coroutines__android_common__kotlinx_coroutines() {
        Object obj = this._state;
        boolean z = DebugKt.DEBUG;
        this._state = DispatchedContinuationKt.UNDEFINED;
        return obj;
    }

    @NotNull
    public final String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("DispatchedContinuation[");
        m.append(this.dispatcher);
        m.append(", ");
        m.append(DebugStringsKt.toDebugString(this.continuation));
        m.append(']');
        return m.toString();
    }
}
