package kotlinx.coroutines;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: Job.kt */
/* loaded from: classes.dex */
public final class NonDisposableHandle implements DisposableHandle, ChildHandle {
    @NotNull
    public static final NonDisposableHandle INSTANCE = new NonDisposableHandle();

    @Override // kotlinx.coroutines.ChildHandle
    public final boolean childCancelled(@NotNull Throwable cause) {
        Intrinsics.checkNotNullParameter(cause, "cause");
        return false;
    }

    @Override // kotlinx.coroutines.DisposableHandle
    public final void dispose() {
    }

    @NotNull
    public final String toString() {
        return "NonDisposableHandle";
    }
}
