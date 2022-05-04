package kotlinx.coroutines.intrinsics;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.IntrinsicsKt__IntrinsicsKt;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.AbstractCoroutine;
import kotlinx.coroutines.internal.DispatchedContinuationKt;
/* compiled from: Cancellable.kt */
/* loaded from: classes.dex */
public final class CancellableKt {
    public static void startCoroutineCancellable$default(Function2 function2, AbstractCoroutine abstractCoroutine, AbstractCoroutine abstractCoroutine2) {
        try {
            DispatchedContinuationKt.resumeCancellableWith(IntrinsicsKt__IntrinsicsKt.intercepted(IntrinsicsKt__IntrinsicsKt.createCoroutineUnintercepted(function2, abstractCoroutine, abstractCoroutine2)), Unit.INSTANCE, null);
        } catch (Throwable th) {
            abstractCoroutine2.resumeWith(ResultKt.createFailure(th));
            throw th;
        }
    }
}
