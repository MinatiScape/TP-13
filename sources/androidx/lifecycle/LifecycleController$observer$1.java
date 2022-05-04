package androidx.lifecycle;

import androidx.lifecycle.Lifecycle;
import java.util.Objects;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public final class LifecycleController$observer$1 implements LifecycleEventObserver {
    @Override // androidx.lifecycle.LifecycleEventObserver
    public final void onStateChanged(@NotNull LifecycleOwner source, @NotNull Lifecycle.Event event) {
        Intrinsics.checkNotNullParameter(source, "source");
        Intrinsics.checkNotNullParameter(event, "<anonymous parameter 1>");
        Lifecycle lifecycle = source.getLifecycle();
        Intrinsics.checkNotNullExpressionValue(lifecycle, "source.lifecycle");
        if (((LifecycleRegistry) lifecycle).mState == Lifecycle.State.DESTROYED) {
            throw null;
        }
        Lifecycle lifecycle2 = source.getLifecycle();
        Intrinsics.checkNotNullExpressionValue(lifecycle2, "source.lifecycle");
        LifecycleRegistry lifecycleRegistry = (LifecycleRegistry) lifecycle2;
        Objects.requireNonNull(null);
        throw null;
    }
}
