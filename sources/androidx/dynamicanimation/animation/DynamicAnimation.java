package androidx.dynamicanimation.animation;

import android.view.View;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.dynamicanimation.animation.AnimationHandler;
import androidx.dynamicanimation.animation.DynamicAnimation;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import java.util.ArrayList;
import java.util.Objects;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public abstract class DynamicAnimation<T extends DynamicAnimation<T>> implements AnimationHandler.AnimationFrameCallback {
    public AnimationHandler mAnimationHandler;
    public float mMinVisibleChange;
    public final FloatPropertyCompat mProperty;
    public final Object mTarget;
    public static final ViewProperty SCALE_X = new ViewProperty("scaleX") { // from class: androidx.dynamicanimation.animation.DynamicAnimation.4
        @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
        public float getValue(View view) {
            return view.getScaleX();
        }

        @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
        public void setValue(View view, float value) {
            view.setScaleX(value);
        }
    };
    public static final ViewProperty SCALE_Y = new ViewProperty("scaleY") { // from class: androidx.dynamicanimation.animation.DynamicAnimation.5
        @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
        public float getValue(View view) {
            return view.getScaleY();
        }

        @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
        public void setValue(View view, float value) {
            view.setScaleY(value);
        }
    };
    public static final ViewProperty ROTATION = new ViewProperty("rotation") { // from class: androidx.dynamicanimation.animation.DynamicAnimation.6
        @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
        public float getValue(View view) {
            return view.getRotation();
        }

        @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
        public void setValue(View view, float value) {
            view.setRotation(value);
        }
    };
    public static final ViewProperty ROTATION_X = new ViewProperty("rotationX") { // from class: androidx.dynamicanimation.animation.DynamicAnimation.7
        @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
        public float getValue(View view) {
            return view.getRotationX();
        }

        @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
        public void setValue(View view, float value) {
            view.setRotationX(value);
        }
    };
    public static final ViewProperty ROTATION_Y = new ViewProperty("rotationY") { // from class: androidx.dynamicanimation.animation.DynamicAnimation.8
        @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
        public float getValue(View view) {
            return view.getRotationY();
        }

        @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
        public void setValue(View view, float value) {
            view.setRotationY(value);
        }
    };
    public static final ViewProperty ALPHA = new ViewProperty("alpha") { // from class: androidx.dynamicanimation.animation.DynamicAnimation.12
        @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
        public float getValue(View view) {
            return view.getAlpha();
        }

        @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
        public void setValue(View view, float value) {
            view.setAlpha(value);
        }
    };
    public float mVelocity = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
    public float mValue = Float.MAX_VALUE;
    public boolean mStartValueIsSet = false;
    public boolean mRunning = false;
    public float mMaxValue = Float.MAX_VALUE;
    public float mMinValue = -3.4028235E38f;
    public long mLastFrameTime = 0;
    public final ArrayList<OnAnimationEndListener> mEndListeners = new ArrayList<>();
    public final ArrayList<OnAnimationUpdateListener> mUpdateListeners = new ArrayList<>();

    /* loaded from: classes.dex */
    public static class MassState {
        public float mValue;
        public float mVelocity;
    }

    /* loaded from: classes.dex */
    public interface OnAnimationEndListener {
        void onAnimationEnd(DynamicAnimation animation, boolean canceled, float value, float velocity);
    }

    /* loaded from: classes.dex */
    public interface OnAnimationUpdateListener {
        void onAnimationUpdate(DynamicAnimation animation, float value, float velocity);
    }

    /* loaded from: classes.dex */
    public static abstract class ViewProperty extends FloatPropertyCompat<View> {
        public ViewProperty(String str, AnonymousClass1 r2) {
            super(str);
        }
    }

    static {
        new ViewProperty("translationX") { // from class: androidx.dynamicanimation.animation.DynamicAnimation.1
            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public float getValue(View view) {
                return view.getTranslationX();
            }

            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public void setValue(View view, float value) {
                view.setTranslationX(value);
            }
        };
        new ViewProperty("translationY") { // from class: androidx.dynamicanimation.animation.DynamicAnimation.2
            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public float getValue(View view) {
                return view.getTranslationY();
            }

            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public void setValue(View view, float value) {
                view.setTranslationY(value);
            }
        };
        new ViewProperty("translationZ") { // from class: androidx.dynamicanimation.animation.DynamicAnimation.3
            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public float getValue(View view) {
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                return view.getTranslationZ();
            }

            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public void setValue(View view, float value) {
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                view.setTranslationZ(value);
            }
        };
        new ViewProperty("x") { // from class: androidx.dynamicanimation.animation.DynamicAnimation.9
            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public float getValue(View view) {
                return view.getX();
            }

            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public void setValue(View view, float value) {
                view.setX(value);
            }
        };
        new ViewProperty("y") { // from class: androidx.dynamicanimation.animation.DynamicAnimation.10
            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public float getValue(View view) {
                return view.getY();
            }

            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public void setValue(View view, float value) {
                view.setY(value);
            }
        };
        new ViewProperty("z") { // from class: androidx.dynamicanimation.animation.DynamicAnimation.11
            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public float getValue(View view) {
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                return view.getZ();
            }

            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public void setValue(View view, float value) {
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                view.setZ(value);
            }
        };
        new ViewProperty("scrollX") { // from class: androidx.dynamicanimation.animation.DynamicAnimation.13
            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public float getValue(View view) {
                return view.getScrollX();
            }

            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public void setValue(View view, float value) {
                view.setScrollX((int) value);
            }
        };
        new ViewProperty("scrollY") { // from class: androidx.dynamicanimation.animation.DynamicAnimation.14
            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public float getValue(View view) {
                return view.getScrollY();
            }

            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public void setValue(View view, float value) {
                view.setScrollY((int) value);
            }
        };
    }

    public <K> DynamicAnimation(K object, FloatPropertyCompat<K> property) {
        this.mTarget = object;
        this.mProperty = property;
        if (property == ROTATION || property == ROTATION_X || property == ROTATION_Y) {
            this.mMinVisibleChange = 0.1f;
        } else if (property == ALPHA) {
            this.mMinVisibleChange = 0.00390625f;
        } else if (property == SCALE_X || property == SCALE_Y) {
            this.mMinVisibleChange = 0.002f;
        } else {
            this.mMinVisibleChange = 1.0f;
        }
    }

    public static <T> void removeNullEntries(ArrayList<T> list) {
        for (int size = list.size() - 1; size >= 0; size--) {
            if (list.get(size) == null) {
                list.remove(size);
            }
        }
    }

    @Override // androidx.dynamicanimation.animation.AnimationHandler.AnimationFrameCallback
    public boolean doAnimationFrame(long frameTime) {
        long j = this.mLastFrameTime;
        if (j == 0) {
            this.mLastFrameTime = frameTime;
            setPropertyValue(this.mValue);
            return false;
        }
        long j2 = frameTime - j;
        this.mLastFrameTime = frameTime;
        SpringAnimation springAnimation = (SpringAnimation) this;
        boolean z = true;
        if (springAnimation.mPendingPosition != Float.MAX_VALUE) {
            long j3 = j2 / 2;
            MassState updateValues = springAnimation.mSpring.updateValues(springAnimation.mValue, springAnimation.mVelocity, j3);
            SpringForce springForce = springAnimation.mSpring;
            springForce.mFinalPosition = springAnimation.mPendingPosition;
            springAnimation.mPendingPosition = Float.MAX_VALUE;
            MassState updateValues2 = springForce.updateValues(updateValues.mValue, updateValues.mVelocity, j3);
            springAnimation.mValue = updateValues2.mValue;
            springAnimation.mVelocity = updateValues2.mVelocity;
        } else {
            MassState updateValues3 = springAnimation.mSpring.updateValues(springAnimation.mValue, springAnimation.mVelocity, j2);
            springAnimation.mValue = updateValues3.mValue;
            springAnimation.mVelocity = updateValues3.mVelocity;
        }
        float max = Math.max(springAnimation.mValue, springAnimation.mMinValue);
        springAnimation.mValue = max;
        float min = Math.min(max, springAnimation.mMaxValue);
        springAnimation.mValue = min;
        float f = springAnimation.mVelocity;
        SpringForce springForce2 = springAnimation.mSpring;
        Objects.requireNonNull(springForce2);
        if (((double) Math.abs(f)) < springForce2.mVelocityThreshold && ((double) Math.abs(min - ((float) springForce2.mFinalPosition))) < springForce2.mValueThreshold) {
            springAnimation.mValue = (float) springAnimation.mSpring.mFinalPosition;
            springAnimation.mVelocity = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        } else {
            z = false;
        }
        float min2 = Math.min(this.mValue, this.mMaxValue);
        this.mValue = min2;
        float max2 = Math.max(min2, this.mMinValue);
        this.mValue = max2;
        setPropertyValue(max2);
        if (z) {
            endAnimationInternal(false);
        }
        return z;
    }

    public final void endAnimationInternal(boolean canceled) {
        this.mRunning = false;
        AnimationHandler animationHandler = getAnimationHandler();
        animationHandler.mDelayedCallbackStartTime.remove(this);
        int indexOf = animationHandler.mAnimationCallbacks.indexOf(this);
        if (indexOf >= 0) {
            animationHandler.mAnimationCallbacks.set(indexOf, null);
            animationHandler.mListDirty = true;
        }
        this.mLastFrameTime = 0L;
        this.mStartValueIsSet = false;
        for (int i = 0; i < this.mEndListeners.size(); i++) {
            if (this.mEndListeners.get(i) != null) {
                this.mEndListeners.get(i).onAnimationEnd(this, canceled, this.mValue, this.mVelocity);
            }
        }
        removeNullEntries(this.mEndListeners);
    }

    public AnimationHandler getAnimationHandler() {
        if (this.mAnimationHandler == null) {
            ThreadLocal<AnimationHandler> threadLocal = AnimationHandler.sAnimatorHandler;
            if (threadLocal.get() == null) {
                threadLocal.set(new AnimationHandler(new AnimationHandler.FrameCallbackScheduler16()));
            }
            this.mAnimationHandler = threadLocal.get();
        }
        return this.mAnimationHandler;
    }

    public void setPropertyValue(float value) {
        this.mProperty.setValue(this.mTarget, value);
        for (int i = 0; i < this.mUpdateListeners.size(); i++) {
            if (this.mUpdateListeners.get(i) != null) {
                this.mUpdateListeners.get(i).onAnimationUpdate(this, this.mValue, this.mVelocity);
            }
        }
        removeNullEntries(this.mUpdateListeners);
    }
}
