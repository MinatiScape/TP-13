package com.android.systemui.unfold.util;

import android.os.Trace;
import com.android.systemui.unfold.UnfoldTransitionProgressProvider;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: ATraceLoggerTransitionProgressListener.kt */
/* loaded from: classes.dex */
public final class ATraceLoggerTransitionProgressListener implements UnfoldTransitionProgressProvider.TransitionProgressListener {
    @NotNull
    private final String traceName;

    public ATraceLoggerTransitionProgressListener(@UnfoldTransitionATracePrefix @NotNull String tracePrefix) {
        Intrinsics.checkNotNullParameter(tracePrefix, "tracePrefix");
        this.traceName = Intrinsics.stringPlus(tracePrefix, "#FoldUnfoldTransitionInProgress");
    }

    @Override // com.android.systemui.unfold.UnfoldTransitionProgressProvider.TransitionProgressListener
    public void onTransitionFinished() {
        Trace.endAsyncSection(this.traceName, 0);
    }

    @Override // com.android.systemui.unfold.UnfoldTransitionProgressProvider.TransitionProgressListener
    public void onTransitionProgress(float f) {
        Trace.setCounter(this.traceName, f * 100);
    }

    @Override // com.android.systemui.unfold.UnfoldTransitionProgressProvider.TransitionProgressListener
    public void onTransitionStarted() {
        Trace.beginAsyncSection(this.traceName, 0);
    }
}
