package com.android.systemui.unfold;

import android.hardware.SensorManager;
import com.android.systemui.dagger.qualifiers.UiBackground;
import com.android.systemui.unfold.UnfoldTransitionProgressProvider;
import com.android.systemui.unfold.config.UnfoldTransitionConfig;
import com.android.systemui.unfold.progress.FixedTimingTransitionProgressProvider;
import com.android.systemui.unfold.progress.PhysicsBasedUnfoldTransitionProgressProvider;
import com.android.systemui.unfold.updates.DeviceFoldStateProvider;
import com.android.systemui.unfold.updates.FoldStateProvider;
import com.android.systemui.unfold.updates.hinge.EmptyHingeAngleProvider;
import com.android.systemui.unfold.updates.hinge.HingeAngleProvider;
import com.android.systemui.unfold.updates.hinge.HingeSensorAngleProvider;
import com.android.systemui.unfold.util.ATraceLoggerTransitionProgressListener;
import com.android.systemui.unfold.util.ScaleAwareTransitionProgressProvider;
import java.util.Optional;
import java.util.concurrent.Executor;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: UnfoldSharedModule.kt */
/* loaded from: classes.dex */
public final class UnfoldSharedModule {
    @NotNull
    public final FoldStateProvider provideFoldStateProvider(@NotNull DeviceFoldStateProvider deviceFoldStateProvider) {
        Intrinsics.checkNotNullParameter(deviceFoldStateProvider, "deviceFoldStateProvider");
        return deviceFoldStateProvider;
    }

    @NotNull
    public final HingeAngleProvider hingeAngleProvider(@NotNull UnfoldTransitionConfig config, @NotNull SensorManager sensorManager, @UiBackground @NotNull Executor executor) {
        Intrinsics.checkNotNullParameter(config, "config");
        Intrinsics.checkNotNullParameter(sensorManager, "sensorManager");
        Intrinsics.checkNotNullParameter(executor, "executor");
        if (config.isHingeAngleEnabled()) {
            return new HingeSensorAngleProvider(sensorManager, executor);
        }
        return EmptyHingeAngleProvider.INSTANCE;
    }

    @NotNull
    public final Optional<UnfoldTransitionProgressProvider> unfoldTransitionProgressProvider(@NotNull UnfoldTransitionConfig config, @NotNull ScaleAwareTransitionProgressProvider.Factory scaleAwareProviderFactory, @NotNull ATraceLoggerTransitionProgressListener tracingListener, @NotNull FoldStateProvider foldStateProvider) {
        UnfoldTransitionProgressProvider unfoldTransitionProgressProvider;
        Intrinsics.checkNotNullParameter(config, "config");
        Intrinsics.checkNotNullParameter(scaleAwareProviderFactory, "scaleAwareProviderFactory");
        Intrinsics.checkNotNullParameter(tracingListener, "tracingListener");
        Intrinsics.checkNotNullParameter(foldStateProvider, "foldStateProvider");
        if (!config.isEnabled()) {
            Optional<UnfoldTransitionProgressProvider> empty = Optional.empty();
            Intrinsics.checkNotNullExpressionValue(empty, "{\n            Optional.empty()\n        }");
            return empty;
        }
        if (config.isHingeAngleEnabled()) {
            unfoldTransitionProgressProvider = new PhysicsBasedUnfoldTransitionProgressProvider(foldStateProvider);
        } else {
            unfoldTransitionProgressProvider = new FixedTimingTransitionProgressProvider(foldStateProvider);
        }
        ScaleAwareTransitionProgressProvider wrap = scaleAwareProviderFactory.wrap(unfoldTransitionProgressProvider);
        wrap.addCallback((UnfoldTransitionProgressProvider.TransitionProgressListener) tracingListener);
        Optional<UnfoldTransitionProgressProvider> of = Optional.of(wrap);
        Intrinsics.checkNotNullExpressionValue(of, "{\n            val basePr…             })\n        }");
        return of;
    }
}
