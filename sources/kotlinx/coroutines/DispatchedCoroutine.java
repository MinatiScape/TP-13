package kotlinx.coroutines;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.IntrinsicsKt__IntrinsicsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.atomicfu.AtomicInt;
import kotlinx.coroutines.internal.DispatchedContinuationKt;
import kotlinx.coroutines.internal.ScopeCoroutine;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: Builders.common.kt */
/* loaded from: classes.dex */
public final class DispatchedCoroutine<T> extends ScopeCoroutine<T> {
    @NotNull
    public final AtomicInt _decision = new AtomicInt();

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public DispatchedCoroutine(@NotNull CoroutineContext coroutineContext, @NotNull Continuation<? super T> uCont) {
        super(coroutineContext, uCont);
        Intrinsics.checkNotNullParameter(uCont, "uCont");
    }

    @Override // kotlinx.coroutines.internal.ScopeCoroutine, kotlinx.coroutines.AbstractCoroutine
    public final void afterResume(@Nullable Object obj) {
        boolean z;
        AtomicInt atomicInt = this._decision;
        while (true) {
            int i = atomicInt.value;
            z = false;
            if (i == 0) {
                if (this._decision.compareAndSet(0, 2)) {
                    z = true;
                    break;
                }
            } else if (i != 1) {
                throw new IllegalStateException("Already resumed".toString());
            }
        }
        if (!z) {
            DispatchedContinuationKt.resumeCancellableWith(IntrinsicsKt__IntrinsicsKt.intercepted(this.uCont), CompletionStateKt.recoverResult(obj, this.uCont), null);
        }
    }

    @Override // kotlinx.coroutines.internal.ScopeCoroutine, kotlinx.coroutines.JobSupport
    public final void afterCompletion(@Nullable Object obj) {
        afterResume(obj);
    }
}
