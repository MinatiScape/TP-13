package androidx.dynamicanimation.animation;

import android.view.View;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.dynamicanimation.animation.AnimationHandler;
import androidx.dynamicanimation.animation.DynamicAnimation;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import java.util.ArrayList;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public abstract class DynamicAnimation<T extends DynamicAnimation<T>> implements AnimationHandler.AnimationFrameCallback {
    public AnimationHandler mAnimationHandler;
    public float mMinVisibleChange;
    public final FloatPropertyCompat mProperty;
    public final Object mTarget;
    public static final AnonymousClass4 SCALE_X = new ViewProperty() { // from class: androidx.dynamicanimation.animation.DynamicAnimation.4
        @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
        public final float getValue(View view) {
            return view.getScaleX();
        }

        @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
        public final void setValue(View view, float f) {
            view.setScaleX(f);
        }
    };
    public static final AnonymousClass5 SCALE_Y = new ViewProperty() { // from class: androidx.dynamicanimation.animation.DynamicAnimation.5
        @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
        public final float getValue(View view) {
            return view.getScaleY();
        }

        @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
        public final void setValue(View view, float f) {
            view.setScaleY(f);
        }
    };
    public static final AnonymousClass6 ROTATION = new ViewProperty() { // from class: androidx.dynamicanimation.animation.DynamicAnimation.6
        @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
        public final float getValue(View view) {
            return view.getRotation();
        }

        @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
        public final void setValue(View view, float f) {
            view.setRotation(f);
        }
    };
    public static final AnonymousClass7 ROTATION_X = new ViewProperty() { // from class: androidx.dynamicanimation.animation.DynamicAnimation.7
        @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
        public final float getValue(View view) {
            return view.getRotationX();
        }

        @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
        public final void setValue(View view, float f) {
            view.setRotationX(f);
        }
    };
    public static final AnonymousClass8 ROTATION_Y = new ViewProperty() { // from class: androidx.dynamicanimation.animation.DynamicAnimation.8
        @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
        public final float getValue(View view) {
            return view.getRotationY();
        }

        @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
        public final void setValue(View view, float f) {
            view.setRotationY(f);
        }
    };
    public static final AnonymousClass12 ALPHA = new ViewProperty() { // from class: androidx.dynamicanimation.animation.DynamicAnimation.12
        @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
        public final float getValue(View view) {
            return view.getAlpha();
        }

        @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
        public final void setValue(View view, float f) {
            view.setAlpha(f);
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
        void onAnimationEnd(DynamicAnimation dynamicAnimation, boolean z, float f, float f2);
    }

    /* loaded from: classes.dex */
    public interface OnAnimationUpdateListener {
        void onAnimationUpdate();
    }

    public final void endAnimationInternal(boolean z) {
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
                this.mEndListeners.get(i).onAnimationEnd(this, z, this.mValue, this.mVelocity);
            }
        }
        ArrayList<OnAnimationEndListener> arrayList = this.mEndListeners;
        int size = arrayList.size();
        while (true) {
            size--;
            if (size < 0) {
                return;
            }
            if (arrayList.get(size) == null) {
                arrayList.remove(size);
            }
        }
    }

    /* JADX WARN: Type inference failed for: r0v11, types: [androidx.dynamicanimation.animation.DynamicAnimation$12] */
    /* JADX WARN: Type inference failed for: r0v3, types: [androidx.dynamicanimation.animation.DynamicAnimation$4] */
    /* JADX WARN: Type inference failed for: r0v4, types: [androidx.dynamicanimation.animation.DynamicAnimation$5] */
    /* JADX WARN: Type inference failed for: r0v5, types: [androidx.dynamicanimation.animation.DynamicAnimation$6] */
    /* JADX WARN: Type inference failed for: r0v6, types: [androidx.dynamicanimation.animation.DynamicAnimation$7] */
    /* JADX WARN: Type inference failed for: r0v7, types: [androidx.dynamicanimation.animation.DynamicAnimation$8] */
    static {
        new ViewProperty() { // from class: androidx.dynamicanimation.animation.DynamicAnimation.1
            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public final float getValue(View view) {
                return view.getTranslationX();
            }

            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public final void setValue(View view, float f) {
                view.setTranslationX(f);
            }
        };
        new ViewProperty() { // from class: androidx.dynamicanimation.animation.DynamicAnimation.2
            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public final float getValue(View view) {
                return view.getTranslationY();
            }

            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public final void setValue(View view, float f) {
                view.setTranslationY(f);
            }
        };
        new ViewProperty() { // from class: androidx.dynamicanimation.animation.DynamicAnimation.3
            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public final float getValue(View view) {
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                return ViewCompat.Api21Impl.getTranslationZ(view);
            }

            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public final void setValue(View view, float f) {
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                ViewCompat.Api21Impl.setTranslationZ(view, f);
            }
        };
        new ViewProperty() { // from class: androidx.dynamicanimation.animation.DynamicAnimation.9
            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public final float getValue(View view) {
                return view.getX();
            }

            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public final void setValue(View view, float f) {
                view.setX(f);
            }
        };
        new ViewProperty() { // from class: androidx.dynamicanimation.animation.DynamicAnimation.10
            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public final float getValue(View view) {
                return view.getY();
            }

            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public final void setValue(View view, float f) {
                view.setY(f);
            }
        };
        new ViewProperty() { // from class: androidx.dynamicanimation.animation.DynamicAnimation.11
            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public final float getValue(View view) {
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                return ViewCompat.Api21Impl.getZ(view);
            }

            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public final void setValue(View view, float f) {
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                ViewCompat.Api21Impl.setZ(view, f);
            }
        };
        new ViewProperty() { // from class: androidx.dynamicanimation.animation.DynamicAnimation.13
            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public final float getValue(View view) {
                return view.getScrollX();
            }

            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public final void setValue(View view, float f) {
                view.setScrollX((int) f);
            }
        };
        new ViewProperty() { // from class: androidx.dynamicanimation.animation.DynamicAnimation.14
            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public final float getValue(View view) {
                return view.getScrollY();
            }

            @Override // androidx.dynamicanimation.animation.FloatPropertyCompat
            public final void setValue(View view, float f) {
                view.setScrollY((int) f);
            }
        };
    }

    @Override // androidx.dynamicanimation.animation.AnimationHandler.AnimationFrameCallback
    public final boolean doAnimationFrame(long j) {
        float min;
        boolean z;
        long j2 = this.mLastFrameTime;
        if (j2 == 0) {
            this.mLastFrameTime = j;
            setPropertyValue(this.mValue);
            return false;
        }
        long j3 = j - j2;
        this.mLastFrameTime = j;
        SpringAnimation springAnimation = (SpringAnimation) this;
        boolean z2 = true;
        if (springAnimation.mPendingPosition != Float.MAX_VALUE) {
            long j4 = j3 / 2;
            MassState updateValues = springAnimation.mSpring.updateValues(springAnimation.mValue, springAnimation.mVelocity, j4);
            SpringForce springForce = springAnimation.mSpring;
            springForce.mFinalPosition = springAnimation.mPendingPosition;
            springAnimation.mPendingPosition = Float.MAX_VALUE;
            MassState updateValues2 = springForce.updateValues(updateValues.mValue, updateValues.mVelocity, j4);
            springAnimation.mValue = updateValues2.mValue;
            springAnimation.mVelocity = updateValues2.mVelocity;
        } else {
            MassState updateValues3 = springAnimation.mSpring.updateValues(springAnimation.mValue, springAnimation.mVelocity, j3);
            springAnimation.mValue = updateValues3.mValue;
            springAnimation.mVelocity = updateValues3.mVelocity;
        }
        float max = Math.max(springAnimation.mValue, springAnimation.mMinValue);
        springAnimation.mValue = max;
        springAnimation.mValue = Math.min(max, springAnimation.mMaxValue);
        float f = springAnimation.mVelocity;
        SpringForce springForce2 = springAnimation.mSpring;
        springForce2.getClass();
        if (Math.abs(f) >= springForce2.mVelocityThreshold || Math.abs(min - ((float) springForce2.mFinalPosition)) >= springForce2.mValueThreshold) {
            z = false;
        } else {
            z = true;
        }
        if (z) {
            springAnimation.mValue = (float) springAnimation.mSpring.mFinalPosition;
            springAnimation.mVelocity = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        } else {
            z2 = false;
        }
        float min2 = Math.min(this.mValue, this.mMaxValue);
        this.mValue = min2;
        float max2 = Math.max(min2, this.mMinValue);
        this.mValue = max2;
        setPropertyValue(max2);
        if (z2) {
            endAnimationInternal(false);
        }
        return z2;
    }

    public final AnimationHandler getAnimationHandler() {
        if (this.mAnimationHandler == null) {
            ThreadLocal<AnimationHandler> threadLocal = AnimationHandler.sAnimatorHandler;
            if (threadLocal.get() == null) {
                threadLocal.set(new AnimationHandler(new AnimationHandler.FrameCallbackScheduler16()));
            }
            this.mAnimationHandler = threadLocal.get();
        }
        return this.mAnimationHandler;
    }

    public final void setPropertyValue(float f) {
        this.mProperty.setValue(this.mTarget, f);
        for (int i = 0; i < this.mUpdateListeners.size(); i++) {
            if (this.mUpdateListeners.get(i) != null) {
                this.mUpdateListeners.get(i).onAnimationUpdate();
            }
        }
        ArrayList<OnAnimationUpdateListener> arrayList = this.mUpdateListeners;
        int size = arrayList.size();
        while (true) {
            size--;
            if (size < 0) {
                return;
            }
            if (arrayList.get(size) == null) {
                arrayList.remove(size);
            }
        }
    }

    public <K> DynamicAnimation(K k, FloatPropertyCompat<K> floatPropertyCompat) {
        this.mTarget = k;
        this.mProperty = floatPropertyCompat;
        if (floatPropertyCompat == ROTATION || floatPropertyCompat == ROTATION_X || floatPropertyCompat == ROTATION_Y) {
            this.mMinVisibleChange = 0.1f;
        } else if (floatPropertyCompat == ALPHA) {
            this.mMinVisibleChange = 0.00390625f;
        } else if (floatPropertyCompat == SCALE_X || floatPropertyCompat == SCALE_Y) {
            this.mMinVisibleChange = 0.002f;
        } else {
            this.mMinVisibleChange = 1.0f;
        }
    }

    /* loaded from: classes.dex */
    public static abstract class ViewProperty extends FloatPropertyCompat<View> {
        public ViewProperty(String str) {
            super(str);
        }
    }
}
