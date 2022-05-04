package kotlinx.coroutines.intrinsics;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt__IntrinsicsKt;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.DispatchedKt;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public final class CancellableKt {
    public static final <R, T> void startCoroutineCancellable(@NotNull Function2<? super R, ? super Continuation<? super T>, ? extends Object> startCoroutineCancellable, R r, @NotNull Continuation<? super T> continuation) {
        Intrinsics.checkParameterIsNotNull(startCoroutineCancellable, "$this$startCoroutineCancellable");
        try {
            DispatchedKt.resumeCancellable(IntrinsicsKt__IntrinsicsKt.intercepted(IntrinsicsKt__IntrinsicsKt.createCoroutineUnintercepted(startCoroutineCancellable, r, continuation)), Unit.INSTANCE);
        } catch (Throwable th) {
            continuation.resumeWith(ResultKt.createFailure(th));
        }
    }
}
