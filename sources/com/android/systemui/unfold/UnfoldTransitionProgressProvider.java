package com.android.systemui.unfold;

import com.android.systemui.statusbar.policy.CallbackController;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: UnfoldTransitionProgressProvider.kt */
/* loaded from: classes.dex */
public interface UnfoldTransitionProgressProvider extends CallbackController<TransitionProgressListener> {

    /* compiled from: UnfoldTransitionProgressProvider.kt */
    /* loaded from: classes.dex */
    public interface TransitionProgressListener {

        /* compiled from: UnfoldTransitionProgressProvider.kt */
        /* loaded from: classes.dex */
        public static final class DefaultImpls {
            public static void onTransitionFinished(@NotNull TransitionProgressListener transitionProgressListener) {
                Intrinsics.checkNotNullParameter(transitionProgressListener, "this");
            }

            public static void onTransitionProgress(@NotNull TransitionProgressListener transitionProgressListener, float f) {
                Intrinsics.checkNotNullParameter(transitionProgressListener, "this");
            }

            public static void onTransitionStarted(@NotNull TransitionProgressListener transitionProgressListener) {
                Intrinsics.checkNotNullParameter(transitionProgressListener, "this");
            }
        }

        void onTransitionFinished();

        void onTransitionProgress(float f);

        void onTransitionStarted();
    }

    void destroy();
}
