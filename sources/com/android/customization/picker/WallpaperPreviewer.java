package com.android.customization.picker;

import android.app.Activity;
import android.graphics.Point;
import android.graphics.Rect;
import android.view.Surface;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.ImageView;
import androidx.cardview.R$style;
import androidx.cardview.widget.CardView;
import androidx.fragment.app.FragmentActivity;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleObserver;
import androidx.lifecycle.LifecycleRegistry;
import androidx.lifecycle.OnLifecycleEvent;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.picker.LivePreviewFragment$$ExternalSyntheticLambda6;
import com.android.wallpaper.util.ScreenSizeCalculator;
import com.android.wallpaper.util.WallpaperConnection;
import com.android.wallpaper.util.WallpaperSurfaceCallback;
/* loaded from: classes.dex */
public class WallpaperPreviewer implements LifecycleObserver {
    public final Activity mActivity;
    public final ImageView mHomePreview;
    public WallpaperInfo mWallpaper;
    public WallpaperColorsListener mWallpaperColorsListener;
    public WallpaperConnection mWallpaperConnection;
    public final SurfaceView mWallpaperSurface;
    public WallpaperSurfaceCallback mWallpaperSurfaceCallback;
    public final Rect mPreviewLocalRect = new Rect();
    public final Rect mPreviewGlobalRect = new Rect();
    public final int[] mLivePreviewLocation = new int[2];

    /* loaded from: classes.dex */
    public interface WallpaperColorsListener {
        void onWallpaperColorsChanged();
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_DESTROY)
    public void onDestroy() {
        WallpaperConnection wallpaperConnection = this.mWallpaperConnection;
        if (wallpaperConnection != null) {
            wallpaperConnection.disconnect();
            this.mWallpaperConnection = null;
        }
        this.mWallpaperSurfaceCallback.cleanUp();
        this.mWallpaperSurface.getHolder().removeCallback(this.mWallpaperSurfaceCallback);
        Surface surface = this.mWallpaperSurface.getHolder().getSurface();
        if (surface != null) {
            surface.release();
        }
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_PAUSE)
    public void onPause() {
        WallpaperConnection wallpaperConnection = this.mWallpaperConnection;
        if (wallpaperConnection != null) {
            wallpaperConnection.setVisibility(false);
        }
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_RESUME)
    public void onResume() {
        WallpaperConnection wallpaperConnection = this.mWallpaperConnection;
        if (wallpaperConnection != null) {
            wallpaperConnection.setVisibility(true);
        }
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_STOP)
    public void onStop() {
        WallpaperConnection wallpaperConnection = this.mWallpaperConnection;
        if (wallpaperConnection != null) {
            wallpaperConnection.disconnect();
            this.mWallpaperConnection = null;
        }
    }

    public WallpaperPreviewer(LifecycleRegistry lifecycleRegistry, FragmentActivity fragmentActivity, ImageView imageView, SurfaceView surfaceView) {
        lifecycleRegistry.addObserver(this);
        this.mActivity = fragmentActivity;
        this.mHomePreview = imageView;
        this.mWallpaperSurface = surfaceView;
        this.mWallpaperSurfaceCallback = new WallpaperSurfaceCallback(fragmentActivity, imageView, surfaceView, null, new LivePreviewFragment$$ExternalSyntheticLambda6(this));
        surfaceView.setZOrderMediaOverlay(true);
        surfaceView.getHolder().addCallback(this.mWallpaperSurfaceCallback);
        final View rootView = imageView.getRootView();
        rootView.addOnLayoutChangeListener(new View.OnLayoutChangeListener() { // from class: com.android.customization.picker.WallpaperPreviewer.1
            @Override // android.view.View.OnLayoutChangeListener
            public final void onLayoutChange(View view, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
                WallpaperPreviewer wallpaperPreviewer = WallpaperPreviewer.this;
                wallpaperPreviewer.getClass();
                ScreenSizeCalculator screenSizeCalculator = ScreenSizeCalculator.getInstance();
                Activity activity = wallpaperPreviewer.mActivity;
                screenSizeCalculator.getClass();
                Point screenSize = screenSizeCalculator.getScreenSize(((WindowManager) activity.getSystemService(WindowManager.class)).getDefaultDisplay());
                float f = screenSize.y / screenSize.x;
                CardView cardView = (CardView) wallpaperPreviewer.mHomePreview.getParent();
                int measuredHeight = (int) (cardView.getMeasuredHeight() / f);
                ViewGroup.LayoutParams layoutParams = cardView.getLayoutParams();
                layoutParams.width = measuredHeight;
                cardView.setLayoutParams(layoutParams);
                cardView.setRadius(R$style.getPreviewCornerRadius(wallpaperPreviewer.mActivity, measuredHeight));
                rootView.removeOnLayoutChangeListener(this);
            }
        });
    }
}
