package kotlinx.coroutines;

import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.Job;
import kotlinx.coroutines.internal.ContextScope;
import org.jetbrains.annotations.NotNull;
/* compiled from: CoroutineScope.kt */
/* loaded from: classes.dex */
public final class CoroutineScopeKt {
    @NotNull
    public static final ContextScope CoroutineScope(@NotNull CoroutineContext context) {
        Intrinsics.checkNotNullParameter(context, "context");
        if (context.get(Job.Key.$$INSTANCE) == null) {
            context = context.plus(new JobImpl(null));
        }
        return new ContextScope(context);
    }
}
