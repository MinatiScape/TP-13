package kotlinx.coroutines;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.atomicfu.AtomicBoolean;
import org.jetbrains.annotations.NotNull;
/* compiled from: CompletionState.kt */
/* loaded from: classes.dex */
public class CompletedExceptionally {
    @NotNull
    public final AtomicBoolean _handled = new AtomicBoolean(false);
    @NotNull
    public final Throwable cause;

    public CompletedExceptionally(Throwable cause) {
        Intrinsics.checkNotNullParameter(cause, "cause");
        this.cause = cause;
    }

    @NotNull
    public final String toString() {
        return DebugStringsKt.getClassSimpleName(this) + '[' + this.cause + ']';
    }
}
