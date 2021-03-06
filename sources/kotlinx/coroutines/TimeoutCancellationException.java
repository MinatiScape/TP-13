package kotlinx.coroutines;

import java.util.concurrent.CancellationException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: Timeout.kt */
/* loaded from: classes.dex */
public final class TimeoutCancellationException extends CancellationException implements CopyableThrowable<TimeoutCancellationException> {
    @Nullable
    public final Job coroutine;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public TimeoutCancellationException(@NotNull String message, @Nullable Job job) {
        super(message);
        Intrinsics.checkNotNullParameter(message, "message");
        this.coroutine = job;
    }

    @Override // kotlinx.coroutines.CopyableThrowable
    public final TimeoutCancellationException createCopy() {
        String message = getMessage();
        if (message == null) {
            message = "";
        }
        TimeoutCancellationException timeoutCancellationException = new TimeoutCancellationException(message, this.coroutine);
        timeoutCancellationException.initCause(this);
        return timeoutCancellationException;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public TimeoutCancellationException(@NotNull String message) {
        this(message, null);
        Intrinsics.checkNotNullParameter(message, "message");
    }
}
