package kotlinx.coroutines;

import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.CoroutineExceptionHandler;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public final class JobKt {
    public static void cancel$default(CoroutineContext cancel, CancellationException cancellationException, int i, Object obj) {
        Intrinsics.checkParameterIsNotNull(cancel, "$this$cancel");
        Job job = (Job) cancel.get(Job.Key);
        if (job != null) {
            job.cancel(null);
        }
    }

    public static final void handleCoroutineException(@NotNull CoroutineContext context, @NotNull Throwable th) {
        Intrinsics.checkParameterIsNotNull(context, "context");
        try {
            int i = CoroutineExceptionHandler.$r8$clinit;
            CoroutineExceptionHandler coroutineExceptionHandler = (CoroutineExceptionHandler) context.get(CoroutineExceptionHandler.Key.$$INSTANCE);
            if (coroutineExceptionHandler != null) {
                coroutineExceptionHandler.handleException(context, th);
            } else {
                CoroutineExceptionHandlerImplKt.handleCoroutineExceptionImpl(context, th);
            }
        } catch (Throwable th2) {
            if (th != th2) {
                RuntimeException runtimeException = new RuntimeException("Exception while trying to handle coroutine exception", th2);
                ResultKt.addSuppressed(runtimeException, th);
                th = runtimeException;
            }
            CoroutineExceptionHandlerImplKt.handleCoroutineExceptionImpl(context, th);
        }
    }
}
