package kotlinx.coroutines;

import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.internal.ContextScope;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public final class CoroutineScopeKt {
    @NotNull
    public static final CoroutineScope CoroutineScope(@NotNull CoroutineContext context) {
        Intrinsics.checkParameterIsNotNull(context, "context");
        if (context.get(Job.Key) == null) {
            context = context.plus(new JobImpl(null));
        }
        return new ContextScope(context);
    }
}
