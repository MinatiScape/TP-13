package kotlinx.coroutines;

import java.util.concurrent.CancellationException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* loaded from: classes.dex */
public final class JobCancellationException extends CancellationException implements CopyableThrowable<JobCancellationException> {
    @NotNull
    public final Job job;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public JobCancellationException(@NotNull String message, @Nullable Throwable th, @NotNull Job job) {
        super(message);
        Intrinsics.checkParameterIsNotNull(message, "message");
        Intrinsics.checkParameterIsNotNull(job, "job");
        this.job = job;
        if (th != null) {
            initCause(th);
        }
    }

    @Override // kotlinx.coroutines.CopyableThrowable
    public JobCancellationException createCopy() {
        if (!DebugKt.DEBUG) {
            return null;
        }
        String message = getMessage();
        if (message != null) {
            return new JobCancellationException(message, this, this.job);
        }
        Intrinsics.throwNpe();
        throw null;
    }

    public boolean equals(@Nullable Object obj) {
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
    public Throwable fillInStackTrace() {
        if (!DebugKt.DEBUG) {
            return this;
        }
        Throwable fillInStackTrace = super.fillInStackTrace();
        Intrinsics.checkExpressionValueIsNotNull(fillInStackTrace, "super.fillInStackTrace()");
        return fillInStackTrace;
    }

    public int hashCode() {
        String message = getMessage();
        if (message != null) {
            int hashCode = (this.job.hashCode() + (message.hashCode() * 31)) * 31;
            Throwable cause = getCause();
            return hashCode + (cause != null ? cause.hashCode() : 0);
        }
        Intrinsics.throwNpe();
        throw null;
    }

    @Override // java.lang.Throwable
    @NotNull
    public String toString() {
        return super.toString() + "; job=" + this.job;
    }
}
