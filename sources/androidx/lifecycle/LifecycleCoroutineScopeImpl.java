package androidx.lifecycle;

import androidx.lifecycle.Lifecycle;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.Job;
import org.jetbrains.annotations.NotNull;
/* compiled from: Lifecycle.kt */
/* loaded from: classes.dex */
public final class LifecycleCoroutineScopeImpl extends LifecycleCoroutineScope implements LifecycleEventObserver {
    @NotNull
    public final CoroutineContext coroutineContext;
    @NotNull
    public final Lifecycle lifecycle;

    public LifecycleCoroutineScopeImpl(@NotNull Lifecycle lifecycle, @NotNull CoroutineContext coroutineContext) {
        Job job;
        Intrinsics.checkNotNullParameter(coroutineContext, "coroutineContext");
        this.lifecycle = lifecycle;
        this.coroutineContext = coroutineContext;
        if (((LifecycleRegistry) lifecycle).mState == Lifecycle.State.DESTROYED && (job = (Job) coroutineContext.get(Job.Key.$$INSTANCE)) != null) {
            job.cancel(null);
        }
    }

    @Override // androidx.lifecycle.LifecycleEventObserver
    public final void onStateChanged(@NotNull LifecycleOwner lifecycleOwner, @NotNull Lifecycle.Event event) {
        if (((LifecycleRegistry) this.lifecycle).mState.compareTo(Lifecycle.State.DESTROYED) <= 0) {
            this.lifecycle.removeObserver(this);
            CoroutineContext coroutineContext = this.coroutineContext;
            Intrinsics.checkNotNullParameter(coroutineContext, "<this>");
            Job job = (Job) coroutineContext.get(Job.Key.$$INSTANCE);
            if (job != null) {
                job.cancel(null);
            }
        }
    }

    @Override // kotlinx.coroutines.CoroutineScope
    @NotNull
    public final CoroutineContext getCoroutineContext() {
        return this.coroutineContext;
    }
}
