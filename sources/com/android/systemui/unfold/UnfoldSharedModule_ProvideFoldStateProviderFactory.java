package com.android.systemui.unfold;

import com.android.systemui.unfold.updates.DeviceFoldStateProvider;
import com.android.systemui.unfold.updates.FoldStateProvider;
import dagger.internal.Factory;
import javax.inject.Provider;
/* loaded from: classes.dex */
public final class UnfoldSharedModule_ProvideFoldStateProviderFactory implements Factory<FoldStateProvider> {
    private final Provider<DeviceFoldStateProvider> deviceFoldStateProvider;
    private final UnfoldSharedModule module;

    public static UnfoldSharedModule_ProvideFoldStateProviderFactory create(UnfoldSharedModule unfoldSharedModule, Provider<DeviceFoldStateProvider> provider) {
        return new UnfoldSharedModule_ProvideFoldStateProviderFactory(unfoldSharedModule, provider);
    }

    @Override // javax.inject.Provider
    public FoldStateProvider get() {
        return provideFoldStateProvider(this.module, this.deviceFoldStateProvider.get());
    }

    public UnfoldSharedModule_ProvideFoldStateProviderFactory(UnfoldSharedModule unfoldSharedModule, Provider<DeviceFoldStateProvider> provider) {
        this.module = unfoldSharedModule;
        this.deviceFoldStateProvider = provider;
    }

    public static FoldStateProvider provideFoldStateProvider(UnfoldSharedModule unfoldSharedModule, DeviceFoldStateProvider deviceFoldStateProvider) {
        FoldStateProvider provideFoldStateProvider = unfoldSharedModule.provideFoldStateProvider(deviceFoldStateProvider);
        if (provideFoldStateProvider != null) {
            return provideFoldStateProvider;
        }
        throw new NullPointerException("Cannot return null from a non-@Nullable @Provides method");
    }
}
