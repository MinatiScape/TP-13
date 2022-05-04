package kotlinx.coroutines;

import androidx.concurrent.futures.AbstractResolvableFuture$$ExternalSyntheticOutline0;
import java.lang.Thread;
import java.util.Iterator;
import java.util.List;
import kotlin.ExceptionsKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.ConstrainedOnceSequence;
import kotlin.sequences.SequencesKt;
import kotlin.sequences.SequencesKt__SequencesKt$asSequence$$inlined$Sequence$1;
import org.jetbrains.annotations.NotNull;
/* compiled from: CoroutineExceptionHandlerImpl.kt */
/* loaded from: classes.dex */
public final class CoroutineExceptionHandlerImplKt {
    @NotNull
    public static final List<CoroutineExceptionHandler> handlers;

    public static final void handleCoroutineExceptionImpl(@NotNull CoroutineContext context, @NotNull Throwable th) {
        Throwable th2;
        Intrinsics.checkNotNullParameter(context, "context");
        for (CoroutineExceptionHandler coroutineExceptionHandler : handlers) {
            try {
                coroutineExceptionHandler.handleException(context, th);
            } catch (Throwable th3) {
                Thread currentThread = Thread.currentThread();
                Thread.UncaughtExceptionHandler uncaughtExceptionHandler = currentThread.getUncaughtExceptionHandler();
                if (th == th3) {
                    th2 = th;
                } else {
                    th2 = new RuntimeException("Exception while trying to handle coroutine exception", th3);
                    ExceptionsKt.addSuppressed(th2, th);
                }
                uncaughtExceptionHandler.uncaughtException(currentThread, th2);
            }
        }
        Thread currentThread2 = Thread.currentThread();
        currentThread2.getUncaughtExceptionHandler().uncaughtException(currentThread2, th);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v3, types: [kotlin.sequences.ConstrainedOnceSequence] */
    static {
        Iterator m = AbstractResolvableFuture$$ExternalSyntheticOutline0.m();
        Intrinsics.checkNotNullExpressionValue(m, "load(\n        CoroutineE….classLoader\n).iterator()");
        SequencesKt__SequencesKt$asSequence$$inlined$Sequence$1 sequencesKt__SequencesKt$asSequence$$inlined$Sequence$1 = new SequencesKt__SequencesKt$asSequence$$inlined$Sequence$1(m);
        if (!(sequencesKt__SequencesKt$asSequence$$inlined$Sequence$1 instanceof ConstrainedOnceSequence)) {
            sequencesKt__SequencesKt$asSequence$$inlined$Sequence$1 = new ConstrainedOnceSequence(sequencesKt__SequencesKt$asSequence$$inlined$Sequence$1);
        }
        handlers = SequencesKt.toList(sequencesKt__SequencesKt$asSequence$$inlined$Sequence$1);
    }
}
