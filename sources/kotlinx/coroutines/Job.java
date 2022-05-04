package kotlinx.coroutines;

import java.util.concurrent.CancellationException;
import kotlin.coroutines.CoroutineContext;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: Job.kt */
/* loaded from: classes.dex */
public interface Job extends CoroutineContext.Element {

    /* compiled from: Job.kt */
    /* loaded from: classes.dex */
    public static final class Key implements CoroutineContext.Key<Job> {
        public static final /* synthetic */ Key $$INSTANCE = new Key();
    }

    @NotNull
    ChildHandle attachChild(@NotNull JobSupport jobSupport);

    void cancel(@Nullable CancellationException cancellationException);

    @NotNull
    CancellationException getCancellationException();

    @NotNull
    DisposableHandle invokeOnCompletion(boolean z, boolean z2, @NotNull JobNode jobNode);

    boolean isActive();

    boolean start();
}
