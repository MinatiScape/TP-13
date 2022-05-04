package com.android.systemui.unfold.progress;

import android.animation.Animator;
import android.animation.ObjectAnimator;
import android.util.FloatProperty;
import com.android.systemui.unfold.UnfoldTransitionProgressProvider;
import com.android.systemui.unfold.updates.FoldStateProvider;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public final class FixedTimingTransitionProgressProvider implements UnfoldTransitionProgressProvider, FoldStateProvider.FoldUpdatesListener {
    @NotNull
    private static final Companion Companion = new Companion(null);
    @Deprecated
    private static final long TRANSITION_TIME_MILLIS = 400;
    private final ObjectAnimator animator;
    @NotNull
    private final AnimatorListener animatorListener;
    @NotNull
    private final FoldStateProvider foldStateProvider;
    @NotNull
    private final List<UnfoldTransitionProgressProvider.TransitionProgressListener> listeners = new ArrayList();
    private float transitionProgress;

    /* loaded from: classes.dex */
    public static final class AnimationProgressProperty extends FloatProperty<FixedTimingTransitionProgressProvider> {
        @NotNull
        public static final AnimationProgressProperty INSTANCE = new AnimationProgressProperty();

        private AnimationProgressProperty() {
            super("animation_progress");
        }

        @NotNull
        public Float get(@NotNull FixedTimingTransitionProgressProvider provider) {
            Intrinsics.checkNotNullParameter(provider, "provider");
            return Float.valueOf(provider.transitionProgress);
        }

        public void setValue(@NotNull FixedTimingTransitionProgressProvider provider, float f) {
            Intrinsics.checkNotNullParameter(provider, "provider");
            provider.setTransitionProgress(f);
        }
    }

    /* loaded from: classes.dex */
    public final class AnimatorListener implements Animator.AnimatorListener {
        public final /* synthetic */ FixedTimingTransitionProgressProvider this$0;

        public AnimatorListener(FixedTimingTransitionProgressProvider this$0) {
            Intrinsics.checkNotNullParameter(this$0, "this$0");
            this.this$0 = this$0;
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationCancel(@NotNull Animator animator) {
            Intrinsics.checkNotNullParameter(animator, "animator");
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationEnd(@NotNull Animator animator) {
            Intrinsics.checkNotNullParameter(animator, "animator");
            for (UnfoldTransitionProgressProvider.TransitionProgressListener transitionProgressListener : this.this$0.listeners) {
                transitionProgressListener.onTransitionFinished();
            }
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationRepeat(@NotNull Animator animator) {
            Intrinsics.checkNotNullParameter(animator, "animator");
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationStart(@NotNull Animator animator) {
            Intrinsics.checkNotNullParameter(animator, "animator");
            for (UnfoldTransitionProgressProvider.TransitionProgressListener transitionProgressListener : this.this$0.listeners) {
                transitionProgressListener.onTransitionStarted();
            }
        }
    }

    /* loaded from: classes.dex */
    public static final class Companion {
        private Companion() {
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public FixedTimingTransitionProgressProvider(@NotNull FoldStateProvider foldStateProvider) {
        Intrinsics.checkNotNullParameter(foldStateProvider, "foldStateProvider");
        this.foldStateProvider = foldStateProvider;
        AnimatorListener animatorListener = new AnimatorListener(this);
        this.animatorListener = animatorListener;
        ObjectAnimator ofFloat = ObjectAnimator.ofFloat(this, AnimationProgressProperty.INSTANCE, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 1.0f);
        ofFloat.setDuration(TRANSITION_TIME_MILLIS);
        ofFloat.addListener(animatorListener);
        this.animator = ofFloat;
        foldStateProvider.addCallback(this);
        foldStateProvider.start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void setTransitionProgress(float f) {
        for (UnfoldTransitionProgressProvider.TransitionProgressListener transitionProgressListener : this.listeners) {
            transitionProgressListener.onTransitionProgress(f);
        }
        this.transitionProgress = f;
    }

    @Override // com.android.systemui.unfold.UnfoldTransitionProgressProvider
    public void destroy() {
        this.animator.cancel();
        this.foldStateProvider.removeCallback(this);
        this.foldStateProvider.stop();
    }

    @Override // com.android.systemui.unfold.updates.FoldStateProvider.FoldUpdatesListener
    public void onFoldUpdate(int i) {
        if (i == 4) {
            this.animator.start();
        } else if (i == 7) {
            this.animator.cancel();
        }
    }

    @Override // com.android.systemui.unfold.updates.FoldStateProvider.FoldUpdatesListener
    public void onHingeAngleUpdate(float f) {
    }

    public void addCallback(@NotNull UnfoldTransitionProgressProvider.TransitionProgressListener listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        this.listeners.add(listener);
    }

    public void removeCallback(@NotNull UnfoldTransitionProgressProvider.TransitionProgressListener listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        this.listeners.remove(listener);
    }
}
