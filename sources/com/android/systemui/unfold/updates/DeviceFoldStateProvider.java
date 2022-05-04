package com.android.systemui.unfold.updates;

import android.content.Context;
import android.hardware.devicestate.DeviceStateManager;
import android.os.Handler;
import com.android.systemui.unfold.updates.FoldStateProvider;
import com.android.systemui.unfold.updates.hinge.HingeAngleProvider;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.android.systemui.unfold.updates.screen.ScreenStatusProvider;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.function.Consumer;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* loaded from: classes.dex */
public final class DeviceFoldStateProvider implements FoldStateProvider {
    @NotNull
    private final DeviceStateManager deviceStateManager;
    @NotNull
    private final FoldStateListener foldStateListener;
    @NotNull
    private final Handler handler;
    @NotNull
    private final HingeAngleProvider hingeAngleProvider;
    private boolean isFolded;
    @Nullable
    private Integer lastFoldUpdate;
    private float lastHingeAngle;
    @NotNull
    private final Executor mainExecutor;
    @NotNull
    private final ScreenStatusProvider screenStatusProvider;
    @NotNull
    private final List<FoldStateProvider.FoldUpdatesListener> outputListeners = new ArrayList();
    @NotNull
    private final HingeAngleListener hingeAngleListener = new HingeAngleListener(this);
    @NotNull
    private final ScreenStatusListener screenListener = new ScreenStatusListener(this);
    @NotNull
    private final TimeoutRunnable timeoutRunnable = new TimeoutRunnable(this);
    private boolean isUnfoldHandled = true;

    /* loaded from: classes.dex */
    public final class FoldStateListener extends DeviceStateManager.FoldStateListener {
        public final /* synthetic */ DeviceFoldStateProvider this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public FoldStateListener(@NotNull final DeviceFoldStateProvider this$0, Context context) {
            super(context, new Consumer<Boolean>() { // from class: com.android.systemui.unfold.updates.DeviceFoldStateProvider.FoldStateListener.1
                @Override // java.util.function.Consumer
                public /* bridge */ /* synthetic */ void accept(Boolean bool) {
                    accept(bool.booleanValue());
                }

                public final void accept(boolean z) {
                    DeviceFoldStateProvider.this.isFolded = z;
                    DeviceFoldStateProvider.this.lastHingeAngle = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
                    if (z) {
                        DeviceFoldStateProvider.this.hingeAngleProvider.stop();
                        DeviceFoldStateProvider.this.notifyFoldUpdate(7);
                        DeviceFoldStateProvider.this.cancelTimeout();
                        DeviceFoldStateProvider.this.isUnfoldHandled = false;
                        return;
                    }
                    DeviceFoldStateProvider.this.notifyFoldUpdate(0);
                    DeviceFoldStateProvider.this.rescheduleAbortAnimationTimeout();
                    DeviceFoldStateProvider.this.hingeAngleProvider.start();
                }
            });
            Intrinsics.checkNotNullParameter(this$0, "this$0");
            Intrinsics.checkNotNullParameter(context, "context");
            this.this$0 = this$0;
        }
    }

    /* loaded from: classes.dex */
    public final class HingeAngleListener implements androidx.core.util.Consumer<Float> {
        public final /* synthetic */ DeviceFoldStateProvider this$0;

        public HingeAngleListener(DeviceFoldStateProvider this$0) {
            Intrinsics.checkNotNullParameter(this$0, "this$0");
            this.this$0 = this$0;
        }

        @Override // androidx.core.util.Consumer
        public /* bridge */ /* synthetic */ void accept(Float f) {
            accept(f.floatValue());
        }

        public void accept(float f) {
            this.this$0.onHingeAngle(f);
        }
    }

    /* loaded from: classes.dex */
    public final class ScreenStatusListener implements ScreenStatusProvider.ScreenListener {
        public final /* synthetic */ DeviceFoldStateProvider this$0;

        public ScreenStatusListener(DeviceFoldStateProvider this$0) {
            Intrinsics.checkNotNullParameter(this$0, "this$0");
            this.this$0 = this$0;
        }

        @Override // com.android.systemui.unfold.updates.screen.ScreenStatusProvider.ScreenListener
        public void onScreenTurnedOn() {
            if (!(this.this$0.isFolded || this.this$0.isUnfoldHandled)) {
                for (FoldStateProvider.FoldUpdatesListener foldUpdatesListener : this.this$0.outputListeners) {
                    foldUpdatesListener.onFoldUpdate(4);
                }
                this.this$0.isUnfoldHandled = true;
            }
        }
    }

    /* loaded from: classes.dex */
    public final class TimeoutRunnable implements Runnable {
        public final /* synthetic */ DeviceFoldStateProvider this$0;

        public TimeoutRunnable(DeviceFoldStateProvider this$0) {
            Intrinsics.checkNotNullParameter(this$0, "this$0");
            this.this$0 = this$0;
        }

        @Override // java.lang.Runnable
        public void run() {
            this.this$0.notifyFoldUpdate(3);
        }
    }

    public DeviceFoldStateProvider(@NotNull Context context, @NotNull HingeAngleProvider hingeAngleProvider, @NotNull ScreenStatusProvider screenStatusProvider, @NotNull DeviceStateManager deviceStateManager, @NotNull Executor mainExecutor, @NotNull Handler handler) {
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(hingeAngleProvider, "hingeAngleProvider");
        Intrinsics.checkNotNullParameter(screenStatusProvider, "screenStatusProvider");
        Intrinsics.checkNotNullParameter(deviceStateManager, "deviceStateManager");
        Intrinsics.checkNotNullParameter(mainExecutor, "mainExecutor");
        Intrinsics.checkNotNullParameter(handler, "handler");
        this.hingeAngleProvider = hingeAngleProvider;
        this.screenStatusProvider = screenStatusProvider;
        this.deviceStateManager = deviceStateManager;
        this.mainExecutor = mainExecutor;
        this.handler = handler;
        this.foldStateListener = new FoldStateListener(this, context);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void cancelTimeout() {
        this.handler.removeCallbacks(this.timeoutRunnable);
    }

    private static /* synthetic */ void getLastFoldUpdate$annotations() {
    }

    private final boolean isTransitionInProgess() {
        Integer num;
        Integer num2 = this.lastFoldUpdate;
        return (num2 != null && num2.intValue() == 0) || ((num = this.lastFoldUpdate) != null && num.intValue() == 2);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void notifyFoldUpdate(int i) {
        for (FoldStateProvider.FoldUpdatesListener foldUpdatesListener : this.outputListeners) {
            foldUpdatesListener.onFoldUpdate(i);
        }
        this.lastFoldUpdate = Integer.valueOf(i);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void onHingeAngle(float f) {
        boolean z = true;
        boolean z2 = f < this.lastHingeAngle;
        boolean z3 = 180.0f - f < 15.0f;
        Integer num = this.lastFoldUpdate;
        if (num == null || num.intValue() != 2) {
            z = false;
        }
        if (z2 && !z && !z3) {
            notifyFoldUpdate(2);
        }
        if (isTransitionInProgess()) {
            if (z3) {
                notifyFoldUpdate(6);
                cancelTimeout();
            } else {
                rescheduleAbortAnimationTimeout();
            }
        }
        this.lastHingeAngle = f;
        for (FoldStateProvider.FoldUpdatesListener foldUpdatesListener : this.outputListeners) {
            foldUpdatesListener.onHingeAngleUpdate(f);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void rescheduleAbortAnimationTimeout() {
        if (isTransitionInProgess()) {
            cancelTimeout();
        }
        this.handler.postDelayed(this.timeoutRunnable, 1000L);
    }

    @Override // com.android.systemui.unfold.updates.FoldStateProvider
    public boolean isFullyOpened() {
        Integer num;
        return !this.isFolded && (num = this.lastFoldUpdate) != null && num.intValue() == 6;
    }

    @Override // com.android.systemui.unfold.updates.FoldStateProvider
    public void start() {
        this.deviceStateManager.registerCallback(this.mainExecutor, this.foldStateListener);
        this.screenStatusProvider.addCallback(this.screenListener);
        this.hingeAngleProvider.addCallback(this.hingeAngleListener);
    }

    @Override // com.android.systemui.unfold.updates.FoldStateProvider
    public void stop() {
        this.screenStatusProvider.removeCallback(this.screenListener);
        this.deviceStateManager.unregisterCallback(this.foldStateListener);
        this.hingeAngleProvider.removeCallback(this.hingeAngleListener);
        this.hingeAngleProvider.stop();
    }

    public void addCallback(@NotNull FoldStateProvider.FoldUpdatesListener listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        this.outputListeners.add(listener);
    }

    public void removeCallback(@NotNull FoldStateProvider.FoldUpdatesListener listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        this.outputListeners.remove(listener);
    }
}
