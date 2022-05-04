package com.android.systemui.unfold;

import android.content.ContentResolver;
import android.content.Context;
import android.hardware.SensorManager;
import android.hardware.devicestate.DeviceStateManager;
import android.os.Handler;
import com.android.systemui.dagger.qualifiers.Main;
import com.android.systemui.dagger.qualifiers.UiBackground;
import com.android.systemui.shared.system.QuickStepContract;
import com.android.systemui.unfold.config.UnfoldTransitionConfig;
import com.android.systemui.unfold.updates.screen.ScreenStatusProvider;
import com.android.systemui.unfold.util.UnfoldTransitionATracePrefix;
import java.util.Optional;
import java.util.concurrent.Executor;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: UnfoldSharedComponent.kt */
/* loaded from: classes.dex */
public interface UnfoldSharedComponent {

    /* compiled from: UnfoldSharedComponent.kt */
    /* loaded from: classes.dex */
    public interface Factory {

        /* compiled from: UnfoldSharedComponent.kt */
        /* loaded from: classes.dex */
        public static final class DefaultImpls {
            public static /* synthetic */ UnfoldSharedComponent create$default(Factory factory, Context context, UnfoldTransitionConfig unfoldTransitionConfig, ScreenStatusProvider screenStatusProvider, DeviceStateManager deviceStateManager, SensorManager sensorManager, Handler handler, Executor executor, Executor executor2, String str, ContentResolver contentResolver, int i, Object obj) {
                ContentResolver contentResolver2;
                if (obj == null) {
                    if ((i & QuickStepContract.SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED) != 0) {
                        ContentResolver contentResolver3 = context.getContentResolver();
                        Intrinsics.checkNotNullExpressionValue(contentResolver3, "fun create(\n            … ): UnfoldSharedComponent");
                        contentResolver2 = contentResolver3;
                    } else {
                        contentResolver2 = contentResolver;
                    }
                    return factory.create(context, unfoldTransitionConfig, screenStatusProvider, deviceStateManager, sensorManager, handler, executor, executor2, str, contentResolver2);
                }
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: create");
            }
        }

        @NotNull
        UnfoldSharedComponent create(@NotNull Context context, @NotNull UnfoldTransitionConfig unfoldTransitionConfig, @NotNull ScreenStatusProvider screenStatusProvider, @NotNull DeviceStateManager deviceStateManager, @NotNull SensorManager sensorManager, @Main @NotNull Handler handler, @Main @NotNull Executor executor, @UiBackground @NotNull Executor executor2, @UnfoldTransitionATracePrefix @NotNull String str, @NotNull ContentResolver contentResolver);
    }

    @NotNull
    Optional<UnfoldTransitionProgressProvider> getUnfoldTransitionProvider();
}
