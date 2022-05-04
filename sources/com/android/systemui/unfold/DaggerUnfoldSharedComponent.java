package com.android.systemui.unfold;

import android.content.ContentResolver;
import android.content.Context;
import android.hardware.SensorManager;
import android.hardware.devicestate.DeviceStateManager;
import android.os.Handler;
import com.android.systemui.unfold.UnfoldSharedComponent;
import com.android.systemui.unfold.config.UnfoldTransitionConfig;
import com.android.systemui.unfold.updates.DeviceFoldStateProvider;
import com.android.systemui.unfold.updates.DeviceFoldStateProvider_Factory;
import com.android.systemui.unfold.updates.FoldStateProvider;
import com.android.systemui.unfold.updates.hinge.HingeAngleProvider;
import com.android.systemui.unfold.updates.screen.ScreenStatusProvider;
import com.android.systemui.unfold.util.ATraceLoggerTransitionProgressListener;
import com.android.systemui.unfold.util.ATraceLoggerTransitionProgressListener_Factory;
import com.android.systemui.unfold.util.C0009ScaleAwareTransitionProgressProvider_Factory;
import com.android.systemui.unfold.util.ScaleAwareTransitionProgressProvider;
import com.android.systemui.unfold.util.ScaleAwareTransitionProgressProvider_Factory_Impl;
import dagger.internal.DoubleCheck;
import dagger.internal.InstanceFactory;
import java.util.Optional;
import java.util.concurrent.Executor;
import javax.inject.Provider;
/* loaded from: classes.dex */
public final class DaggerUnfoldSharedComponent implements UnfoldSharedComponent {
    private Provider<ATraceLoggerTransitionProgressListener> aTraceLoggerTransitionProgressListenerProvider;
    private Provider<Executor> backgroundExecutorProvider;
    private Provider<UnfoldTransitionConfig> configProvider;
    private Provider<ContentResolver> contentResolverProvider;
    private Provider<Context> contextProvider;
    private Provider<DeviceFoldStateProvider> deviceFoldStateProvider;
    private Provider<DeviceStateManager> deviceStateManagerProvider;
    private Provider<Executor> executorProvider;
    private Provider<ScaleAwareTransitionProgressProvider.Factory> factoryProvider;
    private Provider<Handler> handlerProvider;
    private Provider<HingeAngleProvider> hingeAngleProvider;
    private Provider<FoldStateProvider> provideFoldStateProvider;
    private C0009ScaleAwareTransitionProgressProvider_Factory scaleAwareTransitionProgressProvider;
    private Provider<ScreenStatusProvider> screenStatusProvider2;
    private Provider<SensorManager> sensorManagerProvider;
    private Provider<String> tracingTagPrefixProvider;
    private Provider<Optional<UnfoldTransitionProgressProvider>> unfoldTransitionProgressProvider;

    /* loaded from: classes.dex */
    public static final class Factory implements UnfoldSharedComponent.Factory {
        private Factory() {
        }

        @Override // com.android.systemui.unfold.UnfoldSharedComponent.Factory
        public UnfoldSharedComponent create(Context context, UnfoldTransitionConfig unfoldTransitionConfig, ScreenStatusProvider screenStatusProvider, DeviceStateManager deviceStateManager, SensorManager sensorManager, Handler handler, Executor executor, Executor executor2, String str, ContentResolver contentResolver) {
            context.getClass();
            unfoldTransitionConfig.getClass();
            screenStatusProvider.getClass();
            deviceStateManager.getClass();
            sensorManager.getClass();
            handler.getClass();
            executor.getClass();
            executor2.getClass();
            str.getClass();
            contentResolver.getClass();
            return new DaggerUnfoldSharedComponent(new UnfoldSharedModule(), context, unfoldTransitionConfig, screenStatusProvider, deviceStateManager, sensorManager, handler, executor, executor2, str, contentResolver);
        }
    }

    private DaggerUnfoldSharedComponent(UnfoldSharedModule unfoldSharedModule, Context context, UnfoldTransitionConfig unfoldTransitionConfig, ScreenStatusProvider screenStatusProvider, DeviceStateManager deviceStateManager, SensorManager sensorManager, Handler handler, Executor executor, Executor executor2, String str, ContentResolver contentResolver) {
        initialize(unfoldSharedModule, context, unfoldTransitionConfig, screenStatusProvider, deviceStateManager, sensorManager, handler, executor, executor2, str, contentResolver);
    }

    public static UnfoldSharedComponent.Factory factory() {
        return new Factory();
    }

    @Override // com.android.systemui.unfold.UnfoldSharedComponent
    public Optional<UnfoldTransitionProgressProvider> getUnfoldTransitionProvider() {
        return this.unfoldTransitionProgressProvider.get();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v12, types: [dagger.internal.DoubleCheck] */
    /* JADX WARN: Type inference failed for: r3v12, types: [dagger.internal.DoubleCheck] */
    private void initialize(UnfoldSharedModule unfoldSharedModule, Context context, UnfoldTransitionConfig unfoldTransitionConfig, ScreenStatusProvider screenStatusProvider, DeviceStateManager deviceStateManager, SensorManager sensorManager, Handler handler, Executor executor, Executor executor2, String str, ContentResolver contentResolver) {
        this.configProvider = InstanceFactory.create(unfoldTransitionConfig);
        InstanceFactory create = InstanceFactory.create(contentResolver);
        this.contentResolverProvider = create;
        C0009ScaleAwareTransitionProgressProvider_Factory create2 = C0009ScaleAwareTransitionProgressProvider_Factory.create(create);
        this.scaleAwareTransitionProgressProvider = create2;
        this.factoryProvider = ScaleAwareTransitionProgressProvider_Factory_Impl.create(create2);
        InstanceFactory create3 = InstanceFactory.create(str);
        this.tracingTagPrefixProvider = create3;
        this.aTraceLoggerTransitionProgressListenerProvider = ATraceLoggerTransitionProgressListener_Factory.create(create3);
        this.contextProvider = InstanceFactory.create(context);
        this.sensorManagerProvider = InstanceFactory.create(sensorManager);
        InstanceFactory create4 = InstanceFactory.create(executor2);
        this.backgroundExecutorProvider = create4;
        this.hingeAngleProvider = UnfoldSharedModule_HingeAngleProviderFactory.create(unfoldSharedModule, this.configProvider, this.sensorManagerProvider, create4);
        this.screenStatusProvider2 = InstanceFactory.create(screenStatusProvider);
        this.deviceStateManagerProvider = InstanceFactory.create(deviceStateManager);
        this.executorProvider = InstanceFactory.create(executor);
        InstanceFactory create5 = InstanceFactory.create(handler);
        this.handlerProvider = create5;
        DeviceFoldStateProvider_Factory create6 = DeviceFoldStateProvider_Factory.create(this.contextProvider, this.hingeAngleProvider, this.screenStatusProvider2, this.deviceStateManagerProvider, this.executorProvider, create5);
        this.deviceFoldStateProvider = create6;
        UnfoldSharedModule_ProvideFoldStateProviderFactory create7 = UnfoldSharedModule_ProvideFoldStateProviderFactory.create(unfoldSharedModule, create6);
        Object obj = DoubleCheck.UNINITIALIZED;
        create7.getClass();
        if (!(create7 instanceof DoubleCheck)) {
            create7 = new DoubleCheck(create7);
        }
        this.provideFoldStateProvider = create7;
        UnfoldSharedModule_UnfoldTransitionProgressProviderFactory create8 = UnfoldSharedModule_UnfoldTransitionProgressProviderFactory.create(unfoldSharedModule, this.configProvider, this.factoryProvider, this.aTraceLoggerTransitionProgressListenerProvider, create7);
        create8.getClass();
        if (!(create8 instanceof DoubleCheck)) {
            create8 = new DoubleCheck(create8);
        }
        this.unfoldTransitionProgressProvider = create8;
    }
}
