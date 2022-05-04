package com.android.systemui.shared.navigationbar;

import android.annotation.TargetApi;
import android.graphics.Rect;
import android.os.Handler;
import android.view.CompositionSamplingListener;
import android.view.SurfaceControl;
import android.view.View;
import android.view.ViewRootImpl;
import android.view.ViewTreeObserver;
import java.io.PrintWriter;
import java.util.Objects;
import java.util.concurrent.Executor;
@TargetApi(29)
/* loaded from: classes.dex */
public class RegionSamplingHelper implements View.OnAttachStateChangeListener, View.OnLayoutChangeListener {
    private static final float NAVIGATION_LUMINANCE_CHANGE_THRESHOLD = 0.05f;
    private static final float NAVIGATION_LUMINANCE_THRESHOLD = 0.5f;
    private final Executor mBackgroundExecutor;
    private final SamplingCallback mCallback;
    private final SysuiCompositionSamplingListener mCompositionSamplingListener;
    private float mCurrentMedianLuma;
    private boolean mFirstSamplingAfterStart;
    private final Handler mHandler;
    private boolean mIsDestroyed;
    private float mLastMedianLuma;
    private final Rect mRegisteredSamplingBounds;
    private SurfaceControl mRegisteredStopLayer;
    private Runnable mRemoveDrawRunnable;
    private final View mSampledView;
    private boolean mSamplingEnabled;
    private final CompositionSamplingListener mSamplingListener;
    private boolean mSamplingListenerRegistered;
    private final Rect mSamplingRequestBounds;
    private ViewTreeObserver.OnDrawListener mUpdateOnDraw;
    private boolean mWaitingOnDraw;
    private boolean mWindowHasBlurs;
    private boolean mWindowVisible;
    private SurfaceControl mWrappedStopLayer;

    /* loaded from: classes.dex */
    public interface SamplingCallback {
        Rect getSampledRegion(View view);

        default boolean isSamplingEnabled() {
            return true;
        }

        void onRegionDarknessChanged(boolean z);
    }

    public RegionSamplingHelper(View view, SamplingCallback samplingCallback, Executor executor) {
        this(view, samplingCallback, view.getContext().getMainExecutor(), executor, new SysuiCompositionSamplingListener());
    }

    public void dump(PrintWriter printWriter) {
        dump("", printWriter);
    }

    public void stop() {
        this.mSamplingEnabled = false;
        updateSamplingListener();
    }

    public RegionSamplingHelper(View view, SamplingCallback samplingCallback, Executor executor, Executor executor2, SysuiCompositionSamplingListener sysuiCompositionSamplingListener) {
        this.mHandler = new Handler();
        this.mSamplingRequestBounds = new Rect();
        this.mRegisteredSamplingBounds = new Rect();
        this.mSamplingEnabled = false;
        this.mSamplingListenerRegistered = false;
        this.mRegisteredStopLayer = null;
        this.mWrappedStopLayer = null;
        this.mUpdateOnDraw = new ViewTreeObserver.OnDrawListener() { // from class: com.android.systemui.shared.navigationbar.RegionSamplingHelper.1
            @Override // android.view.ViewTreeObserver.OnDrawListener
            public void onDraw() {
                RegionSamplingHelper.this.mHandler.post(RegionSamplingHelper.this.mRemoveDrawRunnable);
                RegionSamplingHelper.this.onDraw();
            }
        };
        this.mRemoveDrawRunnable = new Runnable() { // from class: com.android.systemui.shared.navigationbar.RegionSamplingHelper.2
            @Override // java.lang.Runnable
            public void run() {
                RegionSamplingHelper.this.mSampledView.getViewTreeObserver().removeOnDrawListener(RegionSamplingHelper.this.mUpdateOnDraw);
            }
        };
        this.mBackgroundExecutor = executor2;
        this.mCompositionSamplingListener = sysuiCompositionSamplingListener;
        this.mSamplingListener = new CompositionSamplingListener(executor) { // from class: com.android.systemui.shared.navigationbar.RegionSamplingHelper.3
            public void onSampleCollected(float f) {
                if (RegionSamplingHelper.this.mSamplingEnabled) {
                    RegionSamplingHelper.this.updateMediaLuma(f);
                }
            }
        };
        this.mSampledView = view;
        view.addOnAttachStateChangeListener(this);
        view.addOnLayoutChangeListener(this);
        this.mCallback = samplingCallback;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$unregisterSamplingListener$1(SurfaceControl surfaceControl) {
        this.mCompositionSamplingListener.unregister(this.mSamplingListener);
        if (surfaceControl != null && surfaceControl.isValid()) {
            surfaceControl.release();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$updateSamplingListener$0(SurfaceControl surfaceControl) {
        if (surfaceControl == null || surfaceControl.isValid()) {
            this.mCompositionSamplingListener.register(this.mSamplingListener, 0, surfaceControl, this.mSamplingRequestBounds);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onDraw() {
        if (this.mWaitingOnDraw) {
            this.mWaitingOnDraw = false;
            updateSamplingListener();
        }
    }

    private void unregisterSamplingListener() {
        if (this.mSamplingListenerRegistered) {
            this.mSamplingListenerRegistered = false;
            final SurfaceControl surfaceControl = this.mWrappedStopLayer;
            this.mRegisteredStopLayer = null;
            this.mWrappedStopLayer = null;
            this.mRegisteredSamplingBounds.setEmpty();
            this.mBackgroundExecutor.execute(new Runnable() { // from class: com.android.systemui.shared.navigationbar.RegionSamplingHelper$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    RegionSamplingHelper.this.lambda$unregisterSamplingListener$1(surfaceControl);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateMediaLuma(float f) {
        boolean z;
        this.mCurrentMedianLuma = f;
        if (Math.abs(f - this.mLastMedianLuma) > NAVIGATION_LUMINANCE_CHANGE_THRESHOLD) {
            SamplingCallback samplingCallback = this.mCallback;
            if (f < NAVIGATION_LUMINANCE_THRESHOLD) {
                z = true;
            } else {
                z = false;
            }
            samplingCallback.onRegionDarknessChanged(z);
            this.mLastMedianLuma = f;
        }
    }

    private void updateSamplingListener() {
        boolean z;
        SurfaceControl surfaceControl;
        if (!this.mSamplingEnabled || this.mSamplingRequestBounds.isEmpty() || !this.mWindowVisible || this.mWindowHasBlurs || (!this.mSampledView.isAttachedToWindow() && !this.mFirstSamplingAfterStart)) {
            z = false;
        } else {
            z = true;
        }
        if (z) {
            ViewRootImpl viewRootImpl = this.mSampledView.getViewRootImpl();
            SurfaceControl surfaceControl2 = null;
            if (viewRootImpl != null) {
                surfaceControl = viewRootImpl.getSurfaceControl();
            } else {
                surfaceControl = null;
            }
            if (surfaceControl != null && surfaceControl.isValid()) {
                surfaceControl2 = surfaceControl;
            } else if (!this.mWaitingOnDraw) {
                this.mWaitingOnDraw = true;
                if (this.mHandler.hasCallbacks(this.mRemoveDrawRunnable)) {
                    this.mHandler.removeCallbacks(this.mRemoveDrawRunnable);
                } else {
                    this.mSampledView.getViewTreeObserver().addOnDrawListener(this.mUpdateOnDraw);
                }
            }
            if (!this.mSamplingRequestBounds.equals(this.mRegisteredSamplingBounds) || this.mRegisteredStopLayer != surfaceControl2) {
                unregisterSamplingListener();
                this.mSamplingListenerRegistered = true;
                SurfaceControl wrap = wrap(surfaceControl2);
                this.mBackgroundExecutor.execute(new RegionSamplingHelper$$ExternalSyntheticLambda0(this, wrap, 0));
                this.mRegisteredSamplingBounds.set(this.mSamplingRequestBounds);
                this.mRegisteredStopLayer = surfaceControl2;
                this.mWrappedStopLayer = wrap;
            }
            this.mFirstSamplingAfterStart = false;
            return;
        }
        unregisterSamplingListener();
    }

    public void dump(String str, PrintWriter printWriter) {
        printWriter.println(str + "RegionSamplingHelper:");
        printWriter.println(str + "\tsampleView isAttached: " + this.mSampledView.isAttachedToWindow());
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append("\tsampleView isScValid: ");
        sb.append(this.mSampledView.isAttachedToWindow() ? Boolean.valueOf(this.mSampledView.getViewRootImpl().getSurfaceControl().isValid()) : "notAttached");
        printWriter.println(sb.toString());
        printWriter.println(str + "\tmSamplingEnabled: " + this.mSamplingEnabled);
        printWriter.println(str + "\tmSamplingListenerRegistered: " + this.mSamplingListenerRegistered);
        printWriter.println(str + "\tmSamplingRequestBounds: " + this.mSamplingRequestBounds);
        printWriter.println(str + "\tmRegisteredSamplingBounds: " + this.mRegisteredSamplingBounds);
        printWriter.println(str + "\tmLastMedianLuma: " + this.mLastMedianLuma);
        printWriter.println(str + "\tmCurrentMedianLuma: " + this.mCurrentMedianLuma);
        printWriter.println(str + "\tmWindowVisible: " + this.mWindowVisible);
        printWriter.println(str + "\tmWindowHasBlurs: " + this.mWindowHasBlurs);
        printWriter.println(str + "\tmWaitingOnDraw: " + this.mWaitingOnDraw);
        printWriter.println(str + "\tmRegisteredStopLayer: " + this.mRegisteredStopLayer);
        printWriter.println(str + "\tmWrappedStopLayer: " + this.mWrappedStopLayer);
        printWriter.println(str + "\tmIsDestroyed: " + this.mIsDestroyed);
    }

    public void setWindowHasBlurs(boolean z) {
        this.mWindowHasBlurs = z;
        updateSamplingListener();
    }

    public void setWindowVisible(boolean z) {
        this.mWindowVisible = z;
        updateSamplingListener();
    }

    public void start(Rect rect) {
        if (this.mCallback.isSamplingEnabled()) {
            if (rect != null) {
                this.mSamplingRequestBounds.set(rect);
            }
            this.mSamplingEnabled = true;
            this.mLastMedianLuma = -1.0f;
            this.mFirstSamplingAfterStart = true;
            updateSamplingListener();
        }
    }

    public void updateSamplingRect() {
        Rect sampledRegion = this.mCallback.getSampledRegion(this.mSampledView);
        if (!this.mSamplingRequestBounds.equals(sampledRegion)) {
            this.mSamplingRequestBounds.set(sampledRegion);
            updateSamplingListener();
        }
    }

    public SurfaceControl wrap(SurfaceControl surfaceControl) {
        if (surfaceControl == null) {
            return null;
        }
        return new SurfaceControl(surfaceControl, "regionSampling");
    }

    public void stopAndDestroy() {
        stop();
        Executor executor = this.mBackgroundExecutor;
        final CompositionSamplingListener compositionSamplingListener = this.mSamplingListener;
        Objects.requireNonNull(compositionSamplingListener);
        executor.execute(new Runnable() { // from class: com.android.systemui.shared.navigationbar.RegionSamplingHelper$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                compositionSamplingListener.destroy();
            }
        });
        this.mIsDestroyed = true;
    }

    @Override // android.view.View.OnLayoutChangeListener
    public void onLayoutChange(View view, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
        updateSamplingRect();
    }

    /* loaded from: classes.dex */
    public static class SysuiCompositionSamplingListener {
        public void register(CompositionSamplingListener compositionSamplingListener, int i, SurfaceControl surfaceControl, Rect rect) {
            CompositionSamplingListener.register(compositionSamplingListener, i, surfaceControl, rect);
        }

        public void unregister(CompositionSamplingListener compositionSamplingListener) {
            CompositionSamplingListener.unregister(compositionSamplingListener);
        }
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public void onViewAttachedToWindow(View view) {
        updateSamplingListener();
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public void onViewDetachedFromWindow(View view) {
        stopAndDestroy();
    }
}
