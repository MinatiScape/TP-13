package kotlinx.coroutines;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.jvm.internal.CoroutineStackFrame;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.internal.ThreadContextKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* loaded from: classes.dex */
public final class DispatchedContinuation<T> extends DispatchedTask<T> implements CoroutineStackFrame, Continuation<T> {
    @Nullable
    public Object _state = DispatchedKt.UNDEFINED;
    @Nullable
    public final CoroutineStackFrame callerFrame;
    @NotNull
    public final Continuation<T> continuation;
    @NotNull
    public final Object countOrElement;
    @NotNull
    public final CoroutineDispatcher dispatcher;

    /* JADX WARN: Multi-variable type inference failed */
    public DispatchedContinuation(@NotNull CoroutineDispatcher coroutineDispatcher, @NotNull Continuation<? super T> continuation) {
        super(0);
        this.dispatcher = coroutineDispatcher;
        this.continuation = continuation;
        this.callerFrame = (CoroutineStackFrame) (!(continuation instanceof CoroutineStackFrame) ? (Continuation<? super T>) false : continuation);
        this.countOrElement = ThreadContextKt.threadContextElements(getContext());
    }

    @Override // kotlin.coroutines.jvm.internal.CoroutineStackFrame
    @Nullable
    public CoroutineStackFrame getCallerFrame() {
        return this.callerFrame;
    }

    @Override // kotlin.coroutines.Continuation
    @NotNull
    public CoroutineContext getContext() {
        return this.continuation.getContext();
    }

    @Override // kotlinx.coroutines.DispatchedTask
    @NotNull
    public Continuation<T> getDelegate$kotlinx_coroutines_core() {
        return this;
    }

    @Override // kotlin.coroutines.jvm.internal.CoroutineStackFrame
    @Nullable
    public StackTraceElement getStackTraceElement() {
        return null;
    }

    @Override // kotlin.coroutines.Continuation
    public void resumeWith(@NotNull Object obj) {
        CoroutineContext context = this.continuation.getContext();
        Object state = CompletedExceptionallyKt.toState(obj);
        if (this.dispatcher.isDispatchNeeded(context)) {
            this._state = state;
            this.resumeMode = 0;
            this.dispatcher.dispatch(context, this);
            return;
        }
        ThreadLocalEventLoop threadLocalEventLoop = ThreadLocalEventLoop.INSTANCE;
        EventLoop eventLoop$kotlinx_coroutines_core = ThreadLocalEventLoop.getEventLoop$kotlinx_coroutines_core();
        if (eventLoop$kotlinx_coroutines_core.isUnconfinedLoopActive()) {
            this._state = state;
            this.resumeMode = 0;
            eventLoop$kotlinx_coroutines_core.dispatchUnconfined(this);
            return;
        }
        eventLoop$kotlinx_coroutines_core.incrementUseCount(true);
        try {
            CoroutineContext context2 = getContext();
            Object updateThreadContext = ThreadContextKt.updateThreadContext(context2, this.countOrElement);
            this.continuation.resumeWith(obj);
            ThreadContextKt.restoreThreadContext(context2, updateThreadContext);
            do {
            } while (eventLoop$kotlinx_coroutines_core.processUnconfinedEvent());
        } finally {
            try {
            } finally {
            }
        }
    }

    @Override // kotlinx.coroutines.DispatchedTask
    @Nullable
    public Object takeState$kotlinx_coroutines_core() {
        Object obj = this._state;
        boolean z = DebugKt.DEBUG;
        this._state = DispatchedKt.UNDEFINED;
        return obj;
    }

    @NotNull
    public String toString() {
        String str;
        Object obj;
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("DispatchedContinuation[");
        m.append(this.dispatcher);
        m.append(", ");
        Continuation<T> toDebugString = this.continuation;
        Intrinsics.checkParameterIsNotNull(toDebugString, "$this$toDebugString");
        if (toDebugString instanceof DispatchedContinuation) {
            str = toDebugString.toString();
        } else {
            try {
                obj = toDebugString + '@' + TimeSourceKt.getHexAddress(toDebugString);
            } catch (Throwable th) {
                obj = ResultKt.createFailure(th);
            }
            Throwable th2 = Result.m32exceptionOrNullimpl(obj);
            Object obj2 = obj;
            if (th2 != null) {
                obj2 = toDebugString.getClass().getName() + '@' + TimeSourceKt.getHexAddress(toDebugString);
            }
            str = (String) obj2;
        }
        m.append(str);
        m.append(']');
        return m.toString();
    }
}
