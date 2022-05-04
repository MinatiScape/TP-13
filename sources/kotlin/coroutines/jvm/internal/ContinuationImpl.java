package kotlin.coroutines.jvm.internal;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.ContinuationInterceptor;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: ContinuationImpl.kt */
/* loaded from: classes.dex */
public abstract class ContinuationImpl extends BaseContinuationImpl {
    @Nullable
    private final CoroutineContext _context;
    @Nullable
    public transient Continuation<Object> intercepted;

    public ContinuationImpl(@Nullable Continuation<Object> continuation, @Nullable CoroutineContext coroutineContext) {
        super(continuation);
        this._context = coroutineContext;
    }

    @Override // kotlin.coroutines.Continuation
    @NotNull
    public final CoroutineContext getContext() {
        CoroutineContext coroutineContext = this._context;
        Intrinsics.checkNotNull(coroutineContext);
        return coroutineContext;
    }

    @NotNull
    public final Continuation<Object> intercepted() {
        Continuation<Object> continuation = this.intercepted;
        if (continuation == null) {
            CoroutineContext coroutineContext = this._context;
            Intrinsics.checkNotNull(coroutineContext);
            ContinuationInterceptor continuationInterceptor = (ContinuationInterceptor) coroutineContext.get(ContinuationInterceptor.Key.$$INSTANCE);
            if (continuationInterceptor == null) {
                continuation = this;
            } else {
                continuation = continuationInterceptor.interceptContinuation(this);
            }
            this.intercepted = continuation;
        }
        return continuation;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final void releaseIntercepted() {
        Continuation<?> continuation = this.intercepted;
        if (!(continuation == null || continuation == this)) {
            CoroutineContext coroutineContext = this._context;
            Intrinsics.checkNotNull(coroutineContext);
            int i = ContinuationInterceptor.$r8$clinit;
            CoroutineContext.Element element = coroutineContext.get(ContinuationInterceptor.Key.$$INSTANCE);
            Intrinsics.checkNotNull(element);
            ((ContinuationInterceptor) element).releaseInterceptedContinuation(continuation);
        }
        this.intercepted = CompletedContinuation.INSTANCE;
    }

    public ContinuationImpl(@Nullable Continuation<Object> continuation) {
        this(continuation, continuation == null ? null : continuation.getContext());
    }
}
