package com.google.android.material.animation;

import android.animation.Animator;
import android.animation.TimeInterpolator;
import android.animation.ValueAnimator;
/* loaded from: classes.dex */
public final class MotionTiming {
    public long delay;
    public long duration;
    public TimeInterpolator interpolator;
    public int repeatCount;
    public int repeatMode;

    public MotionTiming(long j) {
        this.interpolator = null;
        this.repeatCount = 0;
        this.repeatMode = 1;
        this.delay = j;
        this.duration = 150L;
    }

    public final void apply(Animator animator) {
        animator.setStartDelay(this.delay);
        animator.setDuration(this.duration);
        animator.setInterpolator(getInterpolator());
        if (animator instanceof ValueAnimator) {
            ValueAnimator valueAnimator = (ValueAnimator) animator;
            valueAnimator.setRepeatCount(this.repeatCount);
            valueAnimator.setRepeatMode(this.repeatMode);
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof MotionTiming)) {
            return false;
        }
        MotionTiming motionTiming = (MotionTiming) obj;
        if (this.delay == motionTiming.delay && this.duration == motionTiming.duration && this.repeatCount == motionTiming.repeatCount && this.repeatMode == motionTiming.repeatMode) {
            return getInterpolator().getClass().equals(motionTiming.getInterpolator().getClass());
        }
        return false;
    }

    public final TimeInterpolator getInterpolator() {
        TimeInterpolator timeInterpolator = this.interpolator;
        if (timeInterpolator != null) {
            return timeInterpolator;
        }
        return AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR;
    }

    public final int hashCode() {
        long j = this.delay;
        long j2 = this.duration;
        return ((((getInterpolator().getClass().hashCode() + (((((int) (j ^ (j >>> 32))) * 31) + ((int) ((j2 >>> 32) ^ j2))) * 31)) * 31) + this.repeatCount) * 31) + this.repeatMode;
    }

    public final String toString() {
        return '\n' + MotionTiming.class.getName() + '{' + Integer.toHexString(System.identityHashCode(this)) + " delay: " + this.delay + " duration: " + this.duration + " interpolator: " + getInterpolator().getClass() + " repeatCount: " + this.repeatCount + " repeatMode: " + this.repeatMode + "}\n";
    }

    public MotionTiming(long j, long j2, TimeInterpolator timeInterpolator) {
        this.repeatCount = 0;
        this.repeatMode = 1;
        this.delay = j;
        this.duration = j2;
        this.interpolator = timeInterpolator;
    }
}
