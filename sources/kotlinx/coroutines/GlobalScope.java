package kotlinx.coroutines;

import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import org.jetbrains.annotations.NotNull;
/* compiled from: CoroutineScope.kt */
/* loaded from: classes.dex */
public final class GlobalScope implements CoroutineScope {
    @NotNull
    public static final GlobalScope INSTANCE = new GlobalScope();

    @Override // kotlinx.coroutines.CoroutineScope
    @NotNull
    public final CoroutineContext getCoroutineContext() {
        return EmptyCoroutineContext.INSTANCE;
    }
}
