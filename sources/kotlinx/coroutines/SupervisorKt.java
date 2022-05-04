package kotlinx.coroutines;

import kotlin.ExceptionsKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.CoroutineExceptionHandler;
import org.jetbrains.annotations.NotNull;
/* compiled from: Supervisor.kt */
/* loaded from: classes.dex */
public final class SupervisorKt {
    public static SupervisorJobImpl SupervisorJob$default() {
        return new SupervisorJobImpl(null);
    }

    public static final void handleCoroutineException(@NotNull CoroutineContext context, @NotNull Throwable th) {
        Intrinsics.checkNotNullParameter(context, "context");
        try {
            CoroutineExceptionHandler coroutineExceptionHandler = (CoroutineExceptionHandler) context.get(CoroutineExceptionHandler.Key.$$INSTANCE);
            if (coroutineExceptionHandler == null) {
                CoroutineExceptionHandlerImplKt.handleCoroutineExceptionImpl(context, th);
            } else {
                coroutineExceptionHandler.handleException(context, th);
            }
        } catch (Throwable th2) {
            if (th != th2) {
                RuntimeException runtimeException = new RuntimeException("Exception while trying to handle coroutine exception", th2);
                ExceptionsKt.addSuppressed(runtimeException, th);
                th = runtimeException;
            }
            CoroutineExceptionHandlerImplKt.handleCoroutineExceptionImpl(context, th);
        }
    }
}
