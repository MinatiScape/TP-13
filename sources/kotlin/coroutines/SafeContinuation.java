package kotlin.coroutines;

import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.CoroutineStackFrame;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: SafeContinuationJvm.kt */
/* loaded from: classes.dex */
public final class SafeContinuation<T> implements Continuation<T>, CoroutineStackFrame {
    @Deprecated
    public static final AtomicReferenceFieldUpdater<SafeContinuation<?>, Object> RESULT = AtomicReferenceFieldUpdater.newUpdater(SafeContinuation.class, Object.class, "result");
    @NotNull
    public final Continuation<T> delegate;
    @Nullable
    public volatile Object result;

    public SafeContinuation() {
        throw null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public SafeContinuation(@NotNull Continuation<? super T> delegate) {
        Intrinsics.checkNotNullParameter(delegate, "delegate");
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.UNDECIDED;
        this.delegate = delegate;
        this.result = coroutineSingletons;
    }

    @Override // kotlin.coroutines.jvm.internal.CoroutineStackFrame
    @Nullable
    public final StackTraceElement getStackTraceElement() {
        return null;
    }

    @Override // kotlin.coroutines.jvm.internal.CoroutineStackFrame
    @Nullable
    public final CoroutineStackFrame getCallerFrame() {
        Continuation<T> continuation = this.delegate;
        if (continuation instanceof CoroutineStackFrame) {
            return (CoroutineStackFrame) continuation;
        }
        return null;
    }

    @Override // kotlin.coroutines.Continuation
    @NotNull
    public final CoroutineContext getContext() {
        return this.delegate.getContext();
    }

    @Nullable
    public final Object getOrThrow() {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.COROUTINE_SUSPENDED;
        Object obj = this.result;
        CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.UNDECIDED;
        if (obj == coroutineSingletons2) {
            if (RESULT.compareAndSet(this, coroutineSingletons2, coroutineSingletons)) {
                return coroutineSingletons;
            }
            obj = this.result;
        }
        if (obj == CoroutineSingletons.RESUMED) {
            return coroutineSingletons;
        }
        if (!(obj instanceof Result.Failure)) {
            return obj;
        }
        throw ((Result.Failure) obj).exception;
    }

    @Override // kotlin.coroutines.Continuation
    public final void resumeWith(@NotNull Object obj) {
        while (true) {
            Object obj2 = this.result;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.UNDECIDED;
            if (obj2 != coroutineSingletons) {
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.COROUTINE_SUSPENDED;
                if (obj2 != coroutineSingletons2) {
                    throw new IllegalStateException("Already resumed");
                } else if (RESULT.compareAndSet(this, coroutineSingletons2, CoroutineSingletons.RESUMED)) {
                    this.delegate.resumeWith(obj);
                    return;
                }
            } else if (RESULT.compareAndSet(this, coroutineSingletons, obj)) {
                return;
            }
        }
    }

    @NotNull
    public final String toString() {
        return Intrinsics.stringPlus("SafeContinuation for ", this.delegate);
    }
}
