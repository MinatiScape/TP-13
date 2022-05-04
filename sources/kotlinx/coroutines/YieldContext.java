package kotlinx.coroutines;

import kotlin.coroutines.AbstractCoroutineContextElement;
import kotlin.coroutines.CoroutineContext;
import org.jetbrains.annotations.NotNull;
/* compiled from: Unconfined.kt */
/* loaded from: classes.dex */
public final class YieldContext extends AbstractCoroutineContextElement {
    @NotNull
    public static final Key Key = new Key();

    /* compiled from: Unconfined.kt */
    /* loaded from: classes.dex */
    public static final class Key implements CoroutineContext.Key<YieldContext> {
    }

    public YieldContext() {
        throw null;
    }
}
