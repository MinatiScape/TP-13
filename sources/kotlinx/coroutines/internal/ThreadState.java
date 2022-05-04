package kotlinx.coroutines.internal;

import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.ThreadContextElement;
import org.jetbrains.annotations.NotNull;
/* compiled from: ThreadContext.kt */
/* loaded from: classes.dex */
public final class ThreadState {
    @NotNull
    public final CoroutineContext context;
    @NotNull
    public final ThreadContextElement<Object>[] elements;
    public int i;
    @NotNull
    public final Object[] values;

    public ThreadState(@NotNull CoroutineContext context, int i) {
        Intrinsics.checkNotNullParameter(context, "context");
        this.context = context;
        this.values = new Object[i];
        this.elements = new ThreadContextElement[i];
    }
}
