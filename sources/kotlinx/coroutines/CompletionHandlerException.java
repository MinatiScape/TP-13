package kotlinx.coroutines;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public final class CompletionHandlerException extends RuntimeException {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CompletionHandlerException(@NotNull String message, @NotNull Throwable th) {
        super(message, th);
        Intrinsics.checkParameterIsNotNull(message, "message");
    }
}
