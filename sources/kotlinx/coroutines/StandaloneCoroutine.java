package kotlinx.coroutines;

import kotlin.Unit;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public class StandaloneCoroutine extends AbstractCoroutine<Unit> {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public StandaloneCoroutine(@NotNull CoroutineContext parentContext, boolean z) {
        super(parentContext, z);
        Intrinsics.checkParameterIsNotNull(parentContext, "parentContext");
    }

    @Override // kotlinx.coroutines.JobSupport
    public boolean handleJobException(@NotNull Throwable th) {
        JobKt.handleCoroutineException(this.context, th);
        return true;
    }
}
