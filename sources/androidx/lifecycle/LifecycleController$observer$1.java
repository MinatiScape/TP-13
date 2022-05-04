package androidx.lifecycle;

import androidx.lifecycle.Lifecycle;
import org.jetbrains.annotations.NotNull;
/* compiled from: LifecycleController.kt */
/* loaded from: classes.dex */
final class LifecycleController$observer$1 implements LifecycleEventObserver {
    @Override // androidx.lifecycle.LifecycleEventObserver
    public final void onStateChanged(@NotNull LifecycleOwner lifecycleOwner, @NotNull Lifecycle.Event event) {
        if (lifecycleOwner.getLifecycle().mState == Lifecycle.State.DESTROYED) {
            throw null;
        }
        Lifecycle.State state = lifecycleOwner.getLifecycle().mState;
        throw null;
    }
}
