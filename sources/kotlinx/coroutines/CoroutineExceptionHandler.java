package kotlinx.coroutines;

import kotlin.coroutines.CoroutineContext;
import org.jetbrains.annotations.NotNull;
/* compiled from: CoroutineExceptionHandler.kt */
/* loaded from: classes.dex */
public interface CoroutineExceptionHandler extends CoroutineContext.Element {

    /* compiled from: CoroutineExceptionHandler.kt */
    /* loaded from: classes.dex */
    public static final class Key implements CoroutineContext.Key<CoroutineExceptionHandler> {
        public static final /* synthetic */ Key $$INSTANCE = new Key();
    }

    void handleException(@NotNull CoroutineContext coroutineContext, @NotNull Throwable th);
}
