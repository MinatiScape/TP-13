package kotlinx.coroutines;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlinx.atomicfu.AtomicInt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: JobSupport.kt */
/* loaded from: classes.dex */
public final class InvokeOnCancelling extends JobCancellingNode {
    @NotNull
    public final AtomicInt _invoked = new AtomicInt();
    @NotNull
    public final Function1<Throwable, Unit> handler;

    @Override // kotlin.jvm.functions.Function1
    public final /* bridge */ /* synthetic */ Unit invoke(Throwable th) {
        invoke2(th);
        return Unit.INSTANCE;
    }

    @Override // kotlinx.coroutines.CompletionHandlerBase
    /* renamed from: invoke  reason: avoid collision after fix types in other method */
    public final void invoke2(@Nullable Throwable th) {
        if (this._invoked.compareAndSet(0, 1)) {
            this.handler.invoke(th);
        }
    }

    public InvokeOnCancelling(@NotNull JobNode jobNode) {
        this.handler = jobNode;
    }
}
