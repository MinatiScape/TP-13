package com.android.systemui.unfold;

import com.android.systemui.unfold.config.UnfoldTransitionConfig;
import com.android.systemui.unfold.updates.FoldStateProvider;
import com.android.systemui.unfold.util.ATraceLoggerTransitionProgressListener;
import com.android.systemui.unfold.util.ScaleAwareTransitionProgressProvider;
import dagger.internal.Factory;
import java.util.Optional;
import javax.inject.Provider;
/* loaded from: classes.dex */
public final class UnfoldSharedModule_UnfoldTransitionProgressProviderFactory implements Factory<Optional<UnfoldTransitionProgressProvider>> {
    private final Provider<UnfoldTransitionConfig> configProvider;
    private final Provider<FoldStateProvider> foldStateProvider;
    private final UnfoldSharedModule module;
    private final Provider<ScaleAwareTransitionProgressProvider.Factory> scaleAwareProviderFactoryProvider;
    private final Provider<ATraceLoggerTransitionProgressListener> tracingListenerProvider;

    public static UnfoldSharedModule_UnfoldTransitionProgressProviderFactory create(UnfoldSharedModule unfoldSharedModule, Provider<UnfoldTransitionConfig> provider, Provider<ScaleAwareTransitionProgressProvider.Factory> provider2, Provider<ATraceLoggerTransitionProgressListener> provider3, Provider<FoldStateProvider> provider4) {
        return new UnfoldSharedModule_UnfoldTransitionProgressProviderFactory(unfoldSharedModule, provider, provider2, provider3, provider4);
    }

    @Override // javax.inject.Provider
    public Optional<UnfoldTransitionProgressProvider> get() {
        return unfoldTransitionProgressProvider(this.module, this.configProvider.get(), this.scaleAwareProviderFactoryProvider.get(), this.tracingListenerProvider.get(), this.foldStateProvider.get());
    }

    public UnfoldSharedModule_UnfoldTransitionProgressProviderFactory(UnfoldSharedModule unfoldSharedModule, Provider<UnfoldTransitionConfig> provider, Provider<ScaleAwareTransitionProgressProvider.Factory> provider2, Provider<ATraceLoggerTransitionProgressListener> provider3, Provider<FoldStateProvider> provider4) {
        this.module = unfoldSharedModule;
        this.configProvider = provider;
        this.scaleAwareProviderFactoryProvider = provider2;
        this.tracingListenerProvider = provider3;
        this.foldStateProvider = provider4;
    }

    public static Optional<UnfoldTransitionProgressProvider> unfoldTransitionProgressProvider(UnfoldSharedModule unfoldSharedModule, UnfoldTransitionConfig unfoldTransitionConfig, ScaleAwareTransitionProgressProvider.Factory factory, ATraceLoggerTransitionProgressListener aTraceLoggerTransitionProgressListener, FoldStateProvider foldStateProvider) {
        Optional<UnfoldTransitionProgressProvider> unfoldTransitionProgressProvider = unfoldSharedModule.unfoldTransitionProgressProvider(unfoldTransitionConfig, factory, aTraceLoggerTransitionProgressListener, foldStateProvider);
        if (unfoldTransitionProgressProvider != null) {
            return unfoldTransitionProgressProvider;
        }
        throw new NullPointerException("Cannot return null from a non-@Nullable @Provides method");
    }
}
