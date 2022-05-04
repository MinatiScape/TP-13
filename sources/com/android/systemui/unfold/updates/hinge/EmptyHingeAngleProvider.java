package com.android.systemui.unfold.updates.hinge;

import androidx.core.util.Consumer;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public final class EmptyHingeAngleProvider implements HingeAngleProvider {
    public void addCallback(@NotNull Consumer<Float> listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
    }

    public void removeCallback(@NotNull Consumer<Float> listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
    }

    @Override // com.android.systemui.unfold.updates.hinge.HingeAngleProvider
    public void start() {
    }

    @Override // com.android.systemui.unfold.updates.hinge.HingeAngleProvider
    public void stop() {
    }
}
