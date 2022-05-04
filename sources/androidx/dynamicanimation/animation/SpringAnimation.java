package androidx.dynamicanimation.animation;

import android.util.AndroidRuntimeException;
/* loaded from: classes.dex */
public final class SpringAnimation extends DynamicAnimation<SpringAnimation> {
    public SpringForce mSpring = null;
    public float mPendingPosition = Float.MAX_VALUE;

    public final void start() {
        SpringForce springForce = this.mSpring;
        if (springForce != null) {
            double d = (float) springForce.mFinalPosition;
            if (d > this.mMaxValue) {
                throw new UnsupportedOperationException("Final position of the spring cannot be greater than the max value.");
            } else if (d >= this.mMinValue) {
                double abs = Math.abs(this.mMinVisibleChange * 0.75f);
                springForce.mValueThreshold = abs;
                springForce.mVelocityThreshold = abs * 62.5d;
                if (getAnimationHandler().mScheduler.isCurrentThread()) {
                    boolean z = this.mRunning;
                    if (!z && !z) {
                        this.mRunning = true;
                        if (!this.mStartValueIsSet) {
                            this.mValue = this.mProperty.getValue(this.mTarget);
                        }
                        float f = this.mValue;
                        if (f > this.mMaxValue || f < this.mMinValue) {
                            throw new IllegalArgumentException("Starting value need to be in between min value and max value");
                        }
                        AnimationHandler animationHandler = getAnimationHandler();
                        if (animationHandler.mAnimationCallbacks.size() == 0) {
                            animationHandler.mScheduler.postFrameCallback(animationHandler.mRunnable);
                        }
                        if (!animationHandler.mAnimationCallbacks.contains(this)) {
                            animationHandler.mAnimationCallbacks.add(this);
                            return;
                        }
                        return;
                    }
                    return;
                }
                throw new AndroidRuntimeException("Animations may only be started on the same thread as the animation handler");
            } else {
                throw new UnsupportedOperationException("Final position of the spring cannot be less than the min value.");
            }
        } else {
            throw new UnsupportedOperationException("Incomplete SpringAnimation: Either final position or a spring force needs to be set.");
        }
    }

    public <K> SpringAnimation(K k, FloatPropertyCompat<K> floatPropertyCompat) {
        super(k, floatPropertyCompat);
    }
}
