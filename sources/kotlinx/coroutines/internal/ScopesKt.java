package kotlinx.coroutines.internal;

import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.AbstractCoroutine;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public final class ScopesKt {
    @NotNull
    public static final Throwable tryRecover(@NotNull AbstractCoroutine<?> abstractCoroutine, @NotNull Throwable exception) {
        Continuation<T> continuation;
        Intrinsics.checkParameterIsNotNull(exception, "exception");
        if (!(abstractCoroutine instanceof ScopeCoroutine)) {
            abstractCoroutine = null;
        }
        ScopeCoroutine scopeCoroutine = (ScopeCoroutine) abstractCoroutine;
        return (scopeCoroutine == null || (continuation = scopeCoroutine.uCont) == 0) ? exception : StackTraceRecoveryKt.recoverStackTrace(exception, continuation);
    }
}
