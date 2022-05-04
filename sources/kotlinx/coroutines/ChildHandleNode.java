package kotlinx.coroutines;

import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: JobSupport.kt */
/* loaded from: classes.dex */
public final class ChildHandleNode extends JobCancellingNode implements ChildHandle {
    @NotNull
    public final ChildJob childJob;

    @Override // kotlin.jvm.functions.Function1
    public final /* bridge */ /* synthetic */ Unit invoke(Throwable th) {
        invoke2(th);
        return Unit.INSTANCE;
    }

    @Override // kotlinx.coroutines.ChildHandle
    public final boolean childCancelled(@NotNull Throwable cause) {
        Intrinsics.checkNotNullParameter(cause, "cause");
        return getJob().childCancelled(cause);
    }

    @Override // kotlinx.coroutines.CompletionHandlerBase
    /* renamed from: invoke  reason: avoid collision after fix types in other method */
    public final void invoke2(@Nullable Throwable th) {
        this.childJob.parentCancelled(getJob());
    }

    public ChildHandleNode(@NotNull JobSupport jobSupport) {
        this.childJob = jobSupport;
    }
}
