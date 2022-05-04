package androidx.lifecycle;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.BuildersKt;
import kotlinx.coroutines.Dispatchers;
import kotlinx.coroutines.ExecutorCoroutineDispatcher;
import kotlinx.coroutines.MainCoroutineDispatcher;
import kotlinx.coroutines.SupervisorJobImpl;
import kotlinx.coroutines.SupervisorKt;
import kotlinx.coroutines.internal.MainDispatcherLoader;
import org.jetbrains.annotations.NotNull;
/* compiled from: LifecycleOwner.kt */
/* loaded from: classes.dex */
public final class LifecycleOwnerKt {
    @NotNull
    public static final LifecycleCoroutineScopeImpl getLifecycleScope(@NotNull LifecycleOwner lifecycleOwner) {
        LifecycleCoroutineScopeImpl lifecycleCoroutineScopeImpl;
        LifecycleRegistry lifecycle = lifecycleOwner.getLifecycle();
        Intrinsics.checkNotNullExpressionValue(lifecycle, "lifecycle");
        while (true) {
            lifecycleCoroutineScopeImpl = (LifecycleCoroutineScopeImpl) lifecycle.mInternalScopeRef.get();
            if (lifecycleCoroutineScopeImpl == null) {
                SupervisorJobImpl SupervisorJob$default = SupervisorKt.SupervisorJob$default();
                ExecutorCoroutineDispatcher executorCoroutineDispatcher = Dispatchers.Default;
                MainCoroutineDispatcher mainCoroutineDispatcher = MainDispatcherLoader.dispatcher;
                lifecycleCoroutineScopeImpl = new LifecycleCoroutineScopeImpl(lifecycle, SupervisorJob$default.plus(mainCoroutineDispatcher.getImmediate()));
                if (lifecycle.mInternalScopeRef.compareAndSet(null, lifecycleCoroutineScopeImpl)) {
                    BuildersKt.launch$default(lifecycleCoroutineScopeImpl, mainCoroutineDispatcher.getImmediate(), new LifecycleCoroutineScopeImpl$register$1(lifecycleCoroutineScopeImpl, null), 2);
                    break;
                }
            } else {
                break;
            }
        }
        return lifecycleCoroutineScopeImpl;
    }
}
