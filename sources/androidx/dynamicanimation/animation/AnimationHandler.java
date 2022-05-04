package androidx.dynamicanimation.animation;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.Choreographer;
import androidx.collection.SimpleArrayMap;
import com.android.wallpaper.picker.ImagePreviewFragment$4$$ExternalSyntheticLambda0;
import com.android.wallpaper.util.DiskBasedLogger$$ExternalSyntheticLambda1;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final class AnimationHandler {
    public static final ThreadLocal<AnimationHandler> sAnimatorHandler = new ThreadLocal<>();
    public FrameCallbackScheduler mScheduler;
    public final SimpleArrayMap<AnimationFrameCallback, Long> mDelayedCallbackStartTime = new SimpleArrayMap<>();
    public final ArrayList<AnimationFrameCallback> mAnimationCallbacks = new ArrayList<>();
    public final AnimationCallbackDispatcher mCallbackDispatcher = new AnimationCallbackDispatcher(null);
    public final Runnable mRunnable = new DiskBasedLogger$$ExternalSyntheticLambda1(this);
    public long mCurrentFrameTime = 0;
    public boolean mListDirty = false;

    /* loaded from: classes.dex */
    public class AnimationCallbackDispatcher {
        public AnimationCallbackDispatcher(AnonymousClass1 r2) {
        }
    }

    /* loaded from: classes.dex */
    public interface AnimationFrameCallback {
        boolean doAnimationFrame(long frameTime);
    }

    /* loaded from: classes.dex */
    public interface FrameCallbackScheduler {
        boolean isCurrentThread();

        void postFrameCallback(Runnable frameCallback);
    }

    /* loaded from: classes.dex */
    public static class FrameCallbackScheduler14 implements FrameCallbackScheduler {
        public final Handler mHandler = new Handler(Looper.myLooper());
        public long mLastFrameTime;

        @Override // androidx.dynamicanimation.animation.AnimationHandler.FrameCallbackScheduler
        public boolean isCurrentThread() {
            return Thread.currentThread() == this.mHandler.getLooper().getThread();
        }

        @Override // androidx.dynamicanimation.animation.AnimationHandler.FrameCallbackScheduler
        public void postFrameCallback(Runnable frameCallback) {
            this.mHandler.postDelayed(new ImagePreviewFragment$4$$ExternalSyntheticLambda0(this, frameCallback), Math.max(10 - (SystemClock.uptimeMillis() - this.mLastFrameTime), 0L));
        }
    }

    /* loaded from: classes.dex */
    public static final class FrameCallbackScheduler16 implements FrameCallbackScheduler {
        public final Choreographer mChoreographer = Choreographer.getInstance();
        public final Looper mLooper = Looper.myLooper();

        @Override // androidx.dynamicanimation.animation.AnimationHandler.FrameCallbackScheduler
        public boolean isCurrentThread() {
            return Thread.currentThread() == this.mLooper.getThread();
        }

        @Override // androidx.dynamicanimation.animation.AnimationHandler.FrameCallbackScheduler
        public void postFrameCallback(final Runnable frameCallback) {
            this.mChoreographer.postFrameCallback(new Choreographer.FrameCallback() { // from class: androidx.dynamicanimation.animation.AnimationHandler$FrameCallbackScheduler16$$ExternalSyntheticLambda0
                @Override // android.view.Choreographer.FrameCallback
                public final void doFrame(long j) {
                    frameCallback.run();
                }
            });
        }
    }

    public AnimationHandler(FrameCallbackScheduler scheduler) {
        this.mScheduler = scheduler;
    }

    public FrameCallbackScheduler getScheduler() {
        return this.mScheduler;
    }

    public void setScheduler(FrameCallbackScheduler scheduler) {
        this.mScheduler = scheduler;
    }
}
