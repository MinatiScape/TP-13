package kotlinx.coroutines;

import java.util.concurrent.CancellationException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: Exceptions.kt */
/* loaded from: classes.dex */
public final class JobCancellationException extends CancellationException implements CopyableThrowable<JobCancellationException> {
    @NotNull
    public final Job job;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public JobCancellationException(@NotNull String message, @Nullable Throwable th, @NotNull Job job) {
        super(message);
        Intrinsics.checkNotNullParameter(message, "message");
        Intrinsics.checkNotNullParameter(job, "job");
        this.job = job;
        if (th != null) {
            initCause(th);
        }
    }

    @Override // kotlinx.coroutines.CopyableThrowable
    public final JobCancellationException createCopy() {
        if (!DebugKt.DEBUG) {
            return null;
        }
        String message = getMessage();
        Intrinsics.checkNotNull(message);
        return new JobCancellationException(message, this, this.job);
    }

    public final boolean equals(@Nullable Object obj) {
        if (obj != this) {
            if (obj instanceof JobCancellationException) {
                JobCancellationException jobCancellationException = (JobCancellationException) obj;
                if (!Intrinsics.areEqual(jobCancellationException.getMessage(), getMessage()) || !Intrinsics.areEqual(jobCancellationException.job, this.job) || !Intrinsics.areEqual(jobCancellationException.getCause(), getCause())) {
                }
            }
            return false;
        }
        return true;
    }

    @Override // java.lang.Throwable
    @NotNull
    public final Throwable fillInStackTrace() {
        if (DebugKt.DEBUG) {
            Throwable fillInStackTrace = super.fillInStackTrace();
            Intrinsics.checkNotNullExpressionValue(fillInStackTrace, "super.fillInStackTrace()");
            return fillInStackTrace;
        }
        setStackTrace(new StackTraceElement[0]);
        return this;
    }

    @Override // java.lang.Throwable
    @NotNull
    public final String toString() {
        return super.toString() + "; job=" + this.job;
    }

    public final int hashCode() {
        int i;
        String message = getMessage();
        Intrinsics.checkNotNull(message);
        int hashCode = (this.job.hashCode() + (message.hashCode() * 31)) * 31;
        Throwable cause = getCause();
        if (cause == null) {
            i = 0;
        } else {
            i = cause.hashCode();
        }
        return hashCode + i;
    }
}
