package kotlinx.coroutines;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: Supervisor.kt */
/* loaded from: classes.dex */
public final class SupervisorJobImpl extends JobImpl {
    @Override // kotlinx.coroutines.JobSupport
    public final boolean childCancelled(@NotNull Throwable cause) {
        Intrinsics.checkNotNullParameter(cause, "cause");
        return false;
    }

    public SupervisorJobImpl(@Nullable Job job) {
        super(job);
    }
}
