package kotlinx.coroutines;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* loaded from: classes.dex */
public final class InvokeOnCompletion extends JobNode<Job> {
    public final Function1<Throwable, Unit> handler;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public InvokeOnCompletion(@NotNull Job job, @NotNull Function1<? super Throwable, Unit> handler) {
        super(job);
        Intrinsics.checkParameterIsNotNull(handler, "handler");
        this.handler = handler;
    }

    @Override // kotlin.jvm.functions.Function1
    public Unit invoke(Throwable th) {
        this.handler.invoke(th);
        return Unit.INSTANCE;
    }

    @Override // kotlinx.coroutines.internal.LockFreeLinkedListNode
    @NotNull
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("InvokeOnCompletion[");
        Intrinsics.checkParameterIsNotNull(this, "$this$classSimpleName");
        sb.append("InvokeOnCompletion");
        sb.append('@');
        sb.append(TimeSourceKt.getHexAddress(this));
        sb.append(']');
        return sb.toString();
    }

    @Override // kotlinx.coroutines.CompletionHandlerBase
    /* renamed from: invoke  reason: avoid collision after fix types in other method */
    public void invoke2(@Nullable Throwable th) {
        this.handler.invoke(th);
    }
}
