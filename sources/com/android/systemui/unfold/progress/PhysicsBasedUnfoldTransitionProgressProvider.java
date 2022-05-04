package com.android.systemui.unfold.progress;

import android.util.AndroidRuntimeException;
import android.util.Log;
import android.util.MathUtils;
import androidx.dynamicanimation.animation.DynamicAnimation;
import androidx.dynamicanimation.animation.FloatPropertyCompat;
import androidx.dynamicanimation.animation.SpringAnimation;
import androidx.dynamicanimation.animation.SpringForce;
import com.android.systemui.unfold.UnfoldTransitionProgressProvider;
import com.android.systemui.unfold.updates.FoldStateProvider;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public final class PhysicsBasedUnfoldTransitionProgressProvider implements UnfoldTransitionProgressProvider, FoldStateProvider.FoldUpdatesListener, DynamicAnimation.OnAnimationEndListener {
    @NotNull
    private final FoldStateProvider foldStateProvider;
    private boolean isAnimatedCancelRunning;
    private boolean isTransitionRunning;
    @NotNull
    private final List<UnfoldTransitionProgressProvider.TransitionProgressListener> listeners;
    @NotNull
    private final SpringAnimation springAnimation;
    private float transitionProgress;

    /* loaded from: classes.dex */
    public static final class AnimationProgressProperty extends FloatPropertyCompat<PhysicsBasedUnfoldTransitionProgressProvider> {
        @NotNull
        public static final AnimationProgressProperty INSTANCE = new AnimationProgressProperty();

        private AnimationProgressProperty() {
            super("animation_progress");
        }

        public float getValue(@NotNull PhysicsBasedUnfoldTransitionProgressProvider provider) {
            Intrinsics.checkNotNullParameter(provider, "provider");
            return provider.transitionProgress;
        }

        public void setValue(@NotNull PhysicsBasedUnfoldTransitionProgressProvider provider, float f) {
            Intrinsics.checkNotNullParameter(provider, "provider");
            provider.setTransitionProgress(f);
        }
    }

    public PhysicsBasedUnfoldTransitionProgressProvider(@NotNull FoldStateProvider foldStateProvider) {
        Intrinsics.checkNotNullParameter(foldStateProvider, "foldStateProvider");
        this.foldStateProvider = foldStateProvider;
        SpringAnimation springAnimation = new SpringAnimation(this, AnimationProgressProperty.INSTANCE);
        if (!springAnimation.mEndListeners.contains(this)) {
            springAnimation.mEndListeners.add(this);
        }
        this.springAnimation = springAnimation;
        this.listeners = new ArrayList();
        foldStateProvider.addCallback(this);
        foldStateProvider.start();
    }

    private final void cancelTransition(float f, boolean z) {
        if (!this.isTransitionRunning || !z) {
            setTransitionProgress(f);
            this.isAnimatedCancelRunning = false;
            this.isTransitionRunning = false;
            SpringAnimation springAnimation = this.springAnimation;
            if (springAnimation.getAnimationHandler().mScheduler.isCurrentThread()) {
                if (springAnimation.mRunning) {
                    springAnimation.endAnimationInternal(true);
                }
                float f2 = springAnimation.mPendingPosition;
                if (f2 != Float.MAX_VALUE) {
                    SpringForce springForce = springAnimation.mSpring;
                    if (springForce == null) {
                        springAnimation.mSpring = new SpringForce(f2);
                    } else {
                        springForce.mFinalPosition = f2;
                    }
                    springAnimation.mPendingPosition = Float.MAX_VALUE;
                }
                for (UnfoldTransitionProgressProvider.TransitionProgressListener transitionProgressListener : this.listeners) {
                    transitionProgressListener.onTransitionFinished();
                }
                Log.d("PhysicsBasedUnfoldTransitionProgressProvider", "onTransitionFinished");
                return;
            }
            throw new AndroidRuntimeException("Animations may only be canceled from the same thread as the animation handler");
        }
        this.isAnimatedCancelRunning = true;
        this.springAnimation.animateToFinalPosition(f);
    }

    private final void onStartTransition() {
        for (UnfoldTransitionProgressProvider.TransitionProgressListener transitionProgressListener : this.listeners) {
            transitionProgressListener.onTransitionStarted();
        }
        this.isTransitionRunning = true;
        Log.d("PhysicsBasedUnfoldTransitionProgressProvider", "onTransitionStarted");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void setTransitionProgress(float f) {
        if (this.isTransitionRunning) {
            for (UnfoldTransitionProgressProvider.TransitionProgressListener transitionProgressListener : this.listeners) {
                transitionProgressListener.onTransitionProgress(f);
            }
        }
        this.transitionProgress = f;
    }

    private final void startTransition(float f) {
        if (!this.isTransitionRunning) {
            onStartTransition();
        }
        SpringAnimation springAnimation = this.springAnimation;
        SpringForce springForce = new SpringForce();
        springForce.mFinalPosition = f;
        springForce.mDampingRatio = 1.0f;
        springForce.mInitialized = false;
        springForce.mNaturalFreq = Math.sqrt(200.0f);
        springForce.mInitialized = false;
        springAnimation.mSpring = springForce;
        springAnimation.mMinVisibleChange = 0.001f;
        springAnimation.mValue = f;
        springAnimation.mStartValueIsSet = true;
        springAnimation.mMinValue = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        springAnimation.mMaxValue = 1.0f;
        this.springAnimation.start();
    }

    @Override // com.android.systemui.unfold.UnfoldTransitionProgressProvider
    public void destroy() {
        this.foldStateProvider.stop();
    }

    @Override // androidx.dynamicanimation.animation.DynamicAnimation.OnAnimationEndListener
    public void onAnimationEnd(@NotNull DynamicAnimation<? extends DynamicAnimation<?>> animation, boolean z, float f, float f2) {
        Intrinsics.checkNotNullParameter(animation, "animation");
        if (this.isAnimatedCancelRunning) {
            cancelTransition(f, false);
        }
    }

    @Override // com.android.systemui.unfold.updates.FoldStateProvider.FoldUpdatesListener
    public void onFoldUpdate(int i) {
        if (i != 2) {
            if (i != 3) {
                if (i == 4) {
                    startTransition(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                    if (this.foldStateProvider.isFullyOpened()) {
                        cancelTransition(1.0f, true);
                    }
                } else if (i != 6) {
                    if (i == 7) {
                        cancelTransition(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, false);
                    }
                }
            }
            if (this.isTransitionRunning) {
                cancelTransition(1.0f, true);
            }
        } else if (!this.isTransitionRunning) {
            startTransition(1.0f);
        }
        Log.d("PhysicsBasedUnfoldTransitionProgressProvider", Intrinsics.stringPlus("onFoldUpdate = ", Integer.valueOf(i)));
    }

    @Override // com.android.systemui.unfold.updates.FoldStateProvider.FoldUpdatesListener
    public void onHingeAngleUpdate(float f) {
        if (this.isTransitionRunning && !this.isAnimatedCancelRunning) {
            this.springAnimation.animateToFinalPosition(MathUtils.saturate(f / 165.0f));
        }
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
