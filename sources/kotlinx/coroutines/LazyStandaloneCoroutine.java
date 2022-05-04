package kotlinx.coroutines;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.IntrinsicsKt__IntrinsicsKt;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.internal.DispatchedContinuationKt;
import org.jetbrains.annotations.NotNull;
/* compiled from: Builders.common.kt */
/* loaded from: classes.dex */
public final class LazyStandaloneCoroutine extends StandaloneCoroutine {
    @NotNull
    public final Continuation<Unit> continuation;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public LazyStandaloneCoroutine(@NotNull CoroutineContext parentContext, @NotNull Function2<? super CoroutineScope, ? super Continuation<? super Unit>, ? extends Object> function2) {
        super(parentContext, false);
        Intrinsics.checkNotNullParameter(parentContext, "parentContext");
        this.continuation = IntrinsicsKt__IntrinsicsKt.createCoroutineUnintercepted(function2, this, this);
    }

    @Override // kotlinx.coroutines.JobSupport
    public final void onStart() {
        Continuation<Unit> continuation = this.continuation;
        Intrinsics.checkNotNullParameter(continuation, "<this>");
        try {
            DispatchedContinuationKt.resumeCancellableWith(IntrinsicsKt__IntrinsicsKt.intercepted(continuation), Unit.INSTANCE, null);
        } catch (Throwable th) {
            resumeWith(ResultKt.createFailure(th));
            throw th;
        }
    }
}
