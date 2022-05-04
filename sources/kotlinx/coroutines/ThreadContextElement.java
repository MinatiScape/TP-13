package kotlinx.coroutines;

import kotlin.coroutines.CoroutineContext;
import org.jetbrains.annotations.NotNull;
/* compiled from: ThreadContextElement.kt */
/* loaded from: classes.dex */
public interface ThreadContextElement<S> extends CoroutineContext.Element {
    void restoreThreadContext(@NotNull CoroutineContext coroutineContext, S s);

    String updateThreadContext(@NotNull CoroutineContext coroutineContext);
}
