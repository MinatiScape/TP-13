package com.android.systemui.unfold.util;

import android.view.View;
import com.android.internal.jank.InteractionJankMonitor;
import com.android.systemui.unfold.UnfoldTransitionProgressProvider;
import java.util.function.Supplier;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: JankMonitorTransitionProgressListener.kt */
/* loaded from: classes.dex */
public final class JankMonitorTransitionProgressListener implements UnfoldTransitionProgressProvider.TransitionProgressListener {
    @NotNull
    private final Supplier<View> attachedViewProvider;
    private final InteractionJankMonitor interactionJankMonitor = InteractionJankMonitor.getInstance();

    public JankMonitorTransitionProgressListener(@NotNull Supplier<View> attachedViewProvider) {
        Intrinsics.checkNotNullParameter(attachedViewProvider, "attachedViewProvider");
        this.attachedViewProvider = attachedViewProvider;
    }

    @Override // com.android.systemui.unfold.UnfoldTransitionProgressProvider.TransitionProgressListener
    public void onTransitionFinished() {
        this.interactionJankMonitor.end(44);
    }

    @Override // com.android.systemui.unfold.UnfoldTransitionProgressProvider.TransitionProgressListener
    public void onTransitionStarted() {
        this.interactionJankMonitor.begin(this.attachedViewProvider.get(), 44);
    }

    @Override // com.android.systemui.unfold.UnfoldTransitionProgressProvider.TransitionProgressListener
    public void onTransitionProgress(float f) {
        UnfoldTransitionProgressProvider.TransitionProgressListener.DefaultImpls.onTransitionProgress(this, f);
    }
}
