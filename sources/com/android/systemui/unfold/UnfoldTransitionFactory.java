package com.android.systemui.unfold;

import android.content.ContentResolver;
import android.content.Context;
import android.hardware.SensorManager;
import android.hardware.devicestate.DeviceStateManager;
import android.os.Handler;
import com.android.systemui.unfold.config.ResourceUnfoldTransitionConfig;
import com.android.systemui.unfold.config.UnfoldTransitionConfig;
import com.android.systemui.unfold.progress.FixedTimingTransitionProgressProvider;
import com.android.systemui.unfold.progress.PhysicsBasedUnfoldTransitionProgressProvider;
import com.android.systemui.unfold.updates.DeviceFoldStateProvider;
import com.android.systemui.unfold.updates.hinge.EmptyHingeAngleProvider;
import com.android.systemui.unfold.updates.hinge.HingeAngleProvider;
import com.android.systemui.unfold.updates.hinge.HingeSensorAngleProvider;
import com.android.systemui.unfold.updates.screen.ScreenStatusProvider;
import com.android.systemui.unfold.util.ScaleAwareTransitionProgressProvider;
import java.util.concurrent.Executor;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public final class UnfoldTransitionFactory {
    @NotNull
    public static final UnfoldTransitionConfig createConfig(@NotNull Context context) {
        Intrinsics.checkNotNullParameter(context, "context");
        return new ResourceUnfoldTransitionConfig(context);
    }

    @NotNull
    public static final UnfoldTransitionProgressProvider createUnfoldTransitionProgressProvider(@NotNull Context context, @NotNull UnfoldTransitionConfig config, @NotNull ScreenStatusProvider screenStatusProvider, @NotNull DeviceStateManager deviceStateManager, @NotNull SensorManager sensorManager, @NotNull Handler mainHandler, @NotNull Executor mainExecutor) {
        HingeAngleProvider hingeAngleProvider;
        UnfoldTransitionProgressProvider unfoldTransitionProgressProvider;
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(config, "config");
        Intrinsics.checkNotNullParameter(screenStatusProvider, "screenStatusProvider");
        Intrinsics.checkNotNullParameter(deviceStateManager, "deviceStateManager");
        Intrinsics.checkNotNullParameter(sensorManager, "sensorManager");
        Intrinsics.checkNotNullParameter(mainHandler, "mainHandler");
        Intrinsics.checkNotNullParameter(mainExecutor, "mainExecutor");
        if (config.isEnabled()) {
            if (config.isHingeAngleEnabled()) {
                hingeAngleProvider = new HingeSensorAngleProvider(sensorManager);
            } else {
                hingeAngleProvider = new EmptyHingeAngleProvider();
            }
            DeviceFoldStateProvider deviceFoldStateProvider = new DeviceFoldStateProvider(context, hingeAngleProvider, screenStatusProvider, deviceStateManager, mainExecutor, mainHandler);
            if (config.isHingeAngleEnabled()) {
                unfoldTransitionProgressProvider = new PhysicsBasedUnfoldTransitionProgressProvider(deviceFoldStateProvider);
            } else {
                unfoldTransitionProgressProvider = new FixedTimingTransitionProgressProvider(deviceFoldStateProvider);
            }
            ContentResolver contentResolver = context.getContentResolver();
            Intrinsics.checkNotNullExpressionValue(contentResolver, "context.contentResolver");
            return new ScaleAwareTransitionProgressProvider(unfoldTransitionProgressProvider, contentResolver);
        }
        throw new IllegalStateException("Trying to create UnfoldTransitionProgressProvider when the transition is disabled");
    }
}
