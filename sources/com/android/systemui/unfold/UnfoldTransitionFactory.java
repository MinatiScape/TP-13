package com.android.systemui.unfold;

import android.content.Context;
import android.hardware.SensorManager;
import android.hardware.devicestate.DeviceStateManager;
import android.os.Handler;
import com.android.systemui.shared.system.QuickStepContract;
import com.android.systemui.unfold.UnfoldSharedComponent;
import com.android.systemui.unfold.config.ResourceUnfoldTransitionConfig;
import com.android.systemui.unfold.config.UnfoldTransitionConfig;
import com.android.systemui.unfold.updates.screen.ScreenStatusProvider;
import java.util.concurrent.Executor;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: UnfoldTransitionFactory.kt */
/* loaded from: classes.dex */
public final class UnfoldTransitionFactory {
    @NotNull
    public static final UnfoldTransitionConfig createConfig(@NotNull Context context) {
        Intrinsics.checkNotNullParameter(context, "context");
        return new ResourceUnfoldTransitionConfig(context);
    }

    @NotNull
    public static final UnfoldTransitionProgressProvider createUnfoldTransitionProgressProvider(@NotNull Context context, @NotNull UnfoldTransitionConfig config, @NotNull ScreenStatusProvider screenStatusProvider, @NotNull DeviceStateManager deviceStateManager, @NotNull SensorManager sensorManager, @NotNull Handler mainHandler, @NotNull Executor mainExecutor, @NotNull Executor backgroundExecutor, @NotNull String tracingTagPrefix) {
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(config, "config");
        Intrinsics.checkNotNullParameter(screenStatusProvider, "screenStatusProvider");
        Intrinsics.checkNotNullParameter(deviceStateManager, "deviceStateManager");
        Intrinsics.checkNotNullParameter(sensorManager, "sensorManager");
        Intrinsics.checkNotNullParameter(mainHandler, "mainHandler");
        Intrinsics.checkNotNullParameter(mainExecutor, "mainExecutor");
        Intrinsics.checkNotNullParameter(backgroundExecutor, "backgroundExecutor");
        Intrinsics.checkNotNullParameter(tracingTagPrefix, "tracingTagPrefix");
        UnfoldSharedComponent.Factory factory = DaggerUnfoldSharedComponent.factory();
        Intrinsics.checkNotNullExpressionValue(factory, "factory()");
        UnfoldTransitionProgressProvider orElse = UnfoldSharedComponent.Factory.DefaultImpls.create$default(factory, context, config, screenStatusProvider, deviceStateManager, sensorManager, mainHandler, mainExecutor, backgroundExecutor, tracingTagPrefix, null, QuickStepContract.SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED, null).getUnfoldTransitionProvider().orElse(null);
        if (orElse != null) {
            return orElse;
        }
        throw new IllegalStateException("Trying to create UnfoldTransitionProgressProvider when the transition is disabled");
    }
}
