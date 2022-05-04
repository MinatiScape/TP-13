package androidx.lifecycle;

import androidx.lifecycle.Lifecycle;
import org.jetbrains.annotations.NotNull;
/* compiled from: RepeatOnLifecycle.kt */
/* loaded from: classes.dex */
final class RepeatOnLifecycleKt$repeatOnLifecycle$3$1$1$1 implements LifecycleEventObserver {
    @Override // androidx.lifecycle.LifecycleEventObserver
    public final void onStateChanged(@NotNull LifecycleOwner lifecycleOwner, @NotNull Lifecycle.Event event) {
        if (event == Lifecycle.Event.ON_DESTROY) {
            throw null;
        }
    }
}
