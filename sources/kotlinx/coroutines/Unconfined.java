package kotlinx.coroutines;

import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: Unconfined.kt */
/* loaded from: classes.dex */
public final class Unconfined extends CoroutineDispatcher {
    public static final /* synthetic */ int $r8$clinit = 0;

    static {
        new Unconfined();
    }

    @Override // kotlinx.coroutines.CoroutineDispatcher
    public final boolean isDispatchNeeded(@NotNull CoroutineContext context) {
        Intrinsics.checkNotNullParameter(context, "context");
        return false;
    }

    @Override // kotlinx.coroutines.CoroutineDispatcher
    @NotNull
    public final String toString() {
        return "Dispatchers.Unconfined";
    }

    @Override // kotlinx.coroutines.CoroutineDispatcher
    public final void dispatch(@NotNull CoroutineContext context, @NotNull Runnable block) {
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(block, "block");
        if (((YieldContext) context.get(YieldContext.Key)) == null) {
            throw new UnsupportedOperationException("Dispatchers.Unconfined.dispatch function can only be used by the yield function. If you wrap Unconfined dispatcher in your code, make sure you properly delegate isDispatchNeeded and dispatch calls.");
        }
    }
}
