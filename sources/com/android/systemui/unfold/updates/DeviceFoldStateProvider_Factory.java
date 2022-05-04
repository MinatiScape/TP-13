package com.android.systemui.unfold.updates;

import android.content.Context;
import android.hardware.devicestate.DeviceStateManager;
import android.os.Handler;
import com.android.systemui.unfold.updates.hinge.HingeAngleProvider;
import com.android.systemui.unfold.updates.screen.ScreenStatusProvider;
import dagger.internal.Factory;
import java.util.concurrent.Executor;
import javax.inject.Provider;
/* loaded from: classes.dex */
public final class DeviceFoldStateProvider_Factory implements Factory<DeviceFoldStateProvider> {
    private final Provider<Context> contextProvider;
    private final Provider<DeviceStateManager> deviceStateManagerProvider;
    private final Provider<Handler> handlerProvider;
    private final Provider<HingeAngleProvider> hingeAngleProvider;
    private final Provider<Executor> mainExecutorProvider;
    private final Provider<ScreenStatusProvider> screenStatusProvider;

    public static DeviceFoldStateProvider_Factory create(Provider<Context> provider, Provider<HingeAngleProvider> provider2, Provider<ScreenStatusProvider> provider3, Provider<DeviceStateManager> provider4, Provider<Executor> provider5, Provider<Handler> provider6) {
        return new DeviceFoldStateProvider_Factory(provider, provider2, provider3, provider4, provider5, provider6);
    }

    public static DeviceFoldStateProvider newInstance(Context context, HingeAngleProvider hingeAngleProvider, ScreenStatusProvider screenStatusProvider, DeviceStateManager deviceStateManager, Executor executor, Handler handler) {
        return new DeviceFoldStateProvider(context, hingeAngleProvider, screenStatusProvider, deviceStateManager, executor, handler);
    }

    @Override // javax.inject.Provider
    public DeviceFoldStateProvider get() {
        return newInstance(this.contextProvider.get(), this.hingeAngleProvider.get(), this.screenStatusProvider.get(), this.deviceStateManagerProvider.get(), this.mainExecutorProvider.get(), this.handlerProvider.get());
    }

    public DeviceFoldStateProvider_Factory(Provider<Context> provider, Provider<HingeAngleProvider> provider2, Provider<ScreenStatusProvider> provider3, Provider<DeviceStateManager> provider4, Provider<Executor> provider5, Provider<Handler> provider6) {
        this.contextProvider = provider;
        this.hingeAngleProvider = provider2;
        this.screenStatusProvider = provider3;
        this.deviceStateManagerProvider = provider4;
        this.mainExecutorProvider = provider5;
        this.handlerProvider = provider6;
    }
}
