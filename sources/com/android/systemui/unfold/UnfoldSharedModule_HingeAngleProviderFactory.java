package com.android.systemui.unfold;

import android.hardware.SensorManager;
import com.android.systemui.unfold.config.UnfoldTransitionConfig;
import com.android.systemui.unfold.updates.hinge.HingeAngleProvider;
import dagger.internal.Factory;
import java.util.concurrent.Executor;
import javax.inject.Provider;
/* loaded from: classes.dex */
public final class UnfoldSharedModule_HingeAngleProviderFactory implements Factory<HingeAngleProvider> {
    private final Provider<UnfoldTransitionConfig> configProvider;
    private final Provider<Executor> executorProvider;
    private final UnfoldSharedModule module;
    private final Provider<SensorManager> sensorManagerProvider;

    public static UnfoldSharedModule_HingeAngleProviderFactory create(UnfoldSharedModule unfoldSharedModule, Provider<UnfoldTransitionConfig> provider, Provider<SensorManager> provider2, Provider<Executor> provider3) {
        return new UnfoldSharedModule_HingeAngleProviderFactory(unfoldSharedModule, provider, provider2, provider3);
    }

    @Override // javax.inject.Provider
    public HingeAngleProvider get() {
        return hingeAngleProvider(this.module, this.configProvider.get(), this.sensorManagerProvider.get(), this.executorProvider.get());
    }

    public UnfoldSharedModule_HingeAngleProviderFactory(UnfoldSharedModule unfoldSharedModule, Provider<UnfoldTransitionConfig> provider, Provider<SensorManager> provider2, Provider<Executor> provider3) {
        this.module = unfoldSharedModule;
        this.configProvider = provider;
        this.sensorManagerProvider = provider2;
        this.executorProvider = provider3;
    }

    public static HingeAngleProvider hingeAngleProvider(UnfoldSharedModule unfoldSharedModule, UnfoldTransitionConfig unfoldTransitionConfig, SensorManager sensorManager, Executor executor) {
        HingeAngleProvider hingeAngleProvider = unfoldSharedModule.hingeAngleProvider(unfoldTransitionConfig, sensorManager, executor);
        if (hingeAngleProvider != null) {
            return hingeAngleProvider;
        }
        throw new NullPointerException("Cannot return null from a non-@Nullable @Provides method");
    }
}
