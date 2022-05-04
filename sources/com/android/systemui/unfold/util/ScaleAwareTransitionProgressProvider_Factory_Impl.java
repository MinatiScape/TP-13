package com.android.systemui.unfold.util;

import com.android.systemui.unfold.UnfoldTransitionProgressProvider;
import com.android.systemui.unfold.util.ScaleAwareTransitionProgressProvider;
import dagger.internal.InstanceFactory;
import javax.inject.Provider;
/* loaded from: classes.dex */
public final class ScaleAwareTransitionProgressProvider_Factory_Impl implements ScaleAwareTransitionProgressProvider.Factory {
    private final C0009ScaleAwareTransitionProgressProvider_Factory delegateFactory;

    public static Provider<ScaleAwareTransitionProgressProvider.Factory> create(C0009ScaleAwareTransitionProgressProvider_Factory scaleAwareTransitionProgressProvider_Factory) {
        return InstanceFactory.create(new ScaleAwareTransitionProgressProvider_Factory_Impl(scaleAwareTransitionProgressProvider_Factory));
    }

    @Override // com.android.systemui.unfold.util.ScaleAwareTransitionProgressProvider.Factory
    public ScaleAwareTransitionProgressProvider wrap(UnfoldTransitionProgressProvider unfoldTransitionProgressProvider) {
        return this.delegateFactory.get(unfoldTransitionProgressProvider);
    }

    public ScaleAwareTransitionProgressProvider_Factory_Impl(C0009ScaleAwareTransitionProgressProvider_Factory scaleAwareTransitionProgressProvider_Factory) {
        this.delegateFactory = scaleAwareTransitionProgressProvider_Factory;
    }
}
