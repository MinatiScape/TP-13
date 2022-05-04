package com.android.systemui.shared.navigationbar;

import android.annotation.TargetApi;
import android.graphics.Rect;
import android.os.Handler;
import android.view.CompositionSamplingListener;
import android.view.SurfaceControl;
import android.view.View;
import android.view.ViewRootImpl;
import android.view.ViewTreeObserver;
import com.android.wallpaper.picker.ImagePreviewFragment$4$$ExternalSyntheticLambda0;
import com.android.wallpaper.util.PreviewUtils$$ExternalSyntheticLambda0;
import java.io.PrintWriter;
import java.util.concurrent.Executor;
@TargetApi(29)
/* loaded from: classes.dex */
public class RegionSamplingHelper implements View.OnAttachStateChangeListener, View.OnLayoutChangeListener {
    private static final float NAVIGATION_LUMINANCE_CHANGE_THRESHOLD = 0.05f;
    private static final float NAVIGATION_LUMINANCE_THRESHOLD = 0.5f;
    private final Executor mBackgroundExecutor;
    private final SamplingCallback mCallback;
    private float mCurrentMedianLuma;
    private boolean mFirstSamplingAfterStart;
    private boolean mIsDestroyed;
    private float mLastMedianLuma;
    private final View mSampledView;
    private final CompositionSamplingListener mSamplingListener;
    private boolean mWaitingOnDraw;
    private boolean mWindowHasBlurs;
    private boolean mWindowVisible;
    private final Handler mHandler = new Handler();
    private final Rect mSamplingRequestBounds = new Rect();
    private final Rect mRegisteredSamplingBounds = new Rect();
    private boolean mSamplingEnabled = false;
    private boolean mSamplingListenerRegistered = false;
    private SurfaceControl mRegisteredStopLayer = null;
    private SurfaceControl mWrappedStopLayer = null;
    private ViewTreeObserver.OnDrawListener mUpdateOnDraw = new ViewTreeObserver.OnDrawListener() { // from class: com.android.systemui.shared.navigationbar.RegionSamplingHelper.1
        @Override // android.view.ViewTreeObserver.OnDrawListener
        public void onDraw() {
            RegionSamplingHelper.this.mHandler.post(RegionSamplingHelper.this.mRemoveDrawRunnable);
            RegionSamplingHelper.this.onDraw();
        }
    };
    private Runnable mRemoveDrawRunnable = new Runnable() { // from class: com.android.systemui.shared.navigationbar.RegionSamplingHelper.2
        @Override // java.lang.Runnable
        public void run() {
            RegionSamplingHelper.this.mSampledView.getViewTreeObserver().removeOnDrawListener(RegionSamplingHelper.this.mUpdateOnDraw);
        }
    };

    /* loaded from: classes.dex */
    public interface SamplingCallback {
        Rect getSampledRegion(View view);

        default boolean isSamplingEnabled() {
            return true;
        }

        void onRegionDarknessChanged(boolean z);
    }

    public RegionSamplingHelper(View view, SamplingCallback samplingCallback, Executor executor) {
        this.mBackgroundExecutor = executor;
        this.mSamplingListener = new CompositionSamplingListener(view.getContext().getMainExecutor()) { // from class: com.android.systemui.shared.navigationbar.RegionSamplingHelper.3
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
        CompositionSamplingListener.unregister(this.mSamplingListener);
        if (surfaceControl != null && surfaceControl.isValid()) {
            surfaceControl.release();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$updateSamplingListener$0(SurfaceControl surfaceControl) {
        if (surfaceControl == null || surfaceControl.isValid()) {
            CompositionSamplingListener.register(this.mSamplingListener, 0, surfaceControl, this.mSamplingRequestBounds);
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
            SurfaceControl surfaceControl = this.mWrappedStopLayer;
            this.mRegisteredStopLayer = null;
            this.mRegisteredSamplingBounds.setEmpty();
            this.mBackgroundExecutor.execute(new ImagePreviewFragment$4$$ExternalSyntheticLambda0(this, surfaceControl));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateMediaLuma(float f) {
        this.mCurrentMedianLuma = f;
        if (Math.abs(f - this.mLastMedianLuma) > NAVIGATION_LUMINANCE_CHANGE_THRESHOLD) {
            this.mCallback.onRegionDarknessChanged(f < NAVIGATION_LUMINANCE_THRESHOLD);
            this.mLastMedianLuma = f;
        }
    }

    private void updateSamplingListener() {
        if (this.mSamplingEnabled && !this.mSamplingRequestBounds.isEmpty() && this.mWindowVisible && !this.mWindowHasBlurs && (this.mSampledView.isAttachedToWindow() || this.mFirstSamplingAfterStart)) {
            ViewRootImpl viewRootImpl = this.mSampledView.getViewRootImpl();
            SurfaceControl surfaceControl = null;
            SurfaceControl surfaceControl2 = viewRootImpl != null ? viewRootImpl.getSurfaceControl() : null;
            if (surfaceControl2 == null || !surfaceControl2.isValid()) {
                if (!this.mWaitingOnDraw) {
                    this.mWaitingOnDraw = true;
                    if (this.mHandler.hasCallbacks(this.mRemoveDrawRunnable)) {
                        this.mHandler.removeCallbacks(this.mRemoveDrawRunnable);
                    } else {
                        this.mSampledView.getViewTreeObserver().addOnDrawListener(this.mUpdateOnDraw);
                    }
                }
                surfaceControl2 = null;
            }
            if (!this.mSamplingRequestBounds.equals(this.mRegisteredSamplingBounds) || this.mRegisteredStopLayer != surfaceControl2) {
                unregisterSamplingListener();
                this.mSamplingListenerRegistered = true;
                if (surfaceControl2 != null) {
                    surfaceControl = new SurfaceControl(surfaceControl2, "regionSampling");
                }
                this.mBackgroundExecutor.execute(new PreviewUtils$$ExternalSyntheticLambda0(this, surfaceControl));
                this.mRegisteredSamplingBounds.set(this.mSamplingRequestBounds);
                this.mRegisteredStopLayer = surfaceControl2;
                this.mWrappedStopLayer = surfaceControl;
            }
            this.mFirstSamplingAfterStart = false;
            return;
        }
        unregisterSamplingListener();
    }

    public void dump(PrintWriter printWriter) {
        printWriter.println("RegionSamplingHelper:");
        printWriter.println("  sampleView isAttached: " + this.mSampledView.isAttachedToWindow());
        StringBuilder sb = new StringBuilder();
        sb.append("  sampleView isScValid: ");
        sb.append(this.mSampledView.isAttachedToWindow() ? Boolean.valueOf(this.mSampledView.getViewRootImpl().getSurfaceControl().isValid()) : "notAttached");
        printWriter.println(sb.toString());
        printWriter.println("  mSamplingEnabled: " + this.mSamplingEnabled);
        printWriter.println("  mSamplingListenerRegistered: " + this.mSamplingListenerRegistered);
        printWriter.println("  mSamplingRequestBounds: " + this.mSamplingRequestBounds);
        printWriter.println("  mRegisteredSamplingBounds: " + this.mRegisteredSamplingBounds);
        printWriter.println("  mLastMedianLuma: " + this.mLastMedianLuma);
        printWriter.println("  mCurrentMedianLuma: " + this.mCurrentMedianLuma);
        printWriter.println("  mWindowVisible: " + this.mWindowVisible);
        printWriter.println("  mWindowHasBlurs: " + this.mWindowHasBlurs);
        printWriter.println("  mWaitingOnDraw: " + this.mWaitingOnDraw);
        printWriter.println("  mRegisteredStopLayer: " + this.mRegisteredStopLayer);
        printWriter.println("  mWrappedStopLayer: " + this.mWrappedStopLayer);
        printWriter.println("  mIsDestroyed: " + this.mIsDestroyed);
    }

    @Override // android.view.View.OnLayoutChangeListener
    public void onLayoutChange(View view, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
        updateSamplingRect();
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public void onViewAttachedToWindow(View view) {
        updateSamplingListener();
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public void onViewDetachedFromWindow(View view) {
        stopAndDestroy();
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

    public void stop() {
        this.mSamplingEnabled = false;
        updateSamplingListener();
    }

    public void stopAndDestroy() {
        stop();
        this.mSamplingListener.destroy();
        this.mIsDestroyed = true;
    }

    public void updateSamplingRect() {
        Rect sampledRegion = this.mCallback.getSampledRegion(this.mSampledView);
        if (!this.mSamplingRequestBounds.equals(sampledRegion)) {
            this.mSamplingRequestBounds.set(sampledRegion);
            updateSamplingListener();
        }
    }
}
