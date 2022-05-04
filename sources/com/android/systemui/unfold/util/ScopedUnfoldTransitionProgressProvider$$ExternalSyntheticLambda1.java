package com.android.systemui.unfold.util;

import com.android.systemui.unfold.UnfoldTransitionProgressProvider;
import java.util.function.Consumer;
/* loaded from: classes.dex */
public final /* synthetic */ class ScopedUnfoldTransitionProgressProvider$$ExternalSyntheticLambda1 implements Consumer {
    public static final /* synthetic */ ScopedUnfoldTransitionProgressProvider$$ExternalSyntheticLambda1 INSTANCE = new ScopedUnfoldTransitionProgressProvider$$ExternalSyntheticLambda1();

    @Override // java.util.function.Consumer
    public final void accept(Object obj) {
        ((UnfoldTransitionProgressProvider.TransitionProgressListener) obj).onTransitionFinished();
    }
}
