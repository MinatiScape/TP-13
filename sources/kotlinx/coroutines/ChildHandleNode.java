package kotlinx.coroutines;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* loaded from: classes.dex */
public final class ChildHandleNode extends JobCancellingNode<JobSupport> implements ChildHandle {
    @NotNull
    public final ChildJob childJob;

    public ChildHandleNode(@NotNull JobSupport jobSupport, @NotNull ChildJob childJob) {
        super(jobSupport);
        this.childJob = childJob;
    }

    @Override // kotlinx.coroutines.ChildHandle
    public boolean childCancelled(@NotNull Throwable cause) {
        Intrinsics.checkParameterIsNotNull(cause, "cause");
        return ((JobSupport) this.job).childCancelled(cause);
    }

    @Override // kotlin.jvm.functions.Function1
    public /* bridge */ /* synthetic */ Unit invoke(Throwable th) {
        invoke2(th);
        return Unit.INSTANCE;
    }

    @Override // kotlinx.coroutines.internal.LockFreeLinkedListNode
    @NotNull
    public String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("ChildHandle[");
        m.append(this.childJob);
        m.append(']');
        return m.toString();
    }

    @Override // kotlinx.coroutines.CompletionHandlerBase
    /* renamed from: invoke  reason: avoid collision after fix types in other method */
    public void invoke2(@Nullable Throwable th) {
        this.childJob.parentCancelled((ParentJob) this.job);
    }
}
