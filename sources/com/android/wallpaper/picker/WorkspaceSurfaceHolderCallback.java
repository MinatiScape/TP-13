package com.android.wallpaper.picker;

import android.app.WallpaperColors;
import android.content.Context;
import android.os.Bundle;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import com.android.systemui.shared.R;
import com.android.wallpaper.util.PreviewUtils;
import com.android.wallpaper.util.PreviewUtils$$ExternalSyntheticLambda1;
import com.android.wallpaper.util.SurfaceViewUtils;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes.dex */
public class WorkspaceSurfaceHolderCallback implements SurfaceHolder.Callback {
    public Message mCallback;
    public boolean mIsWallpaperColorsReady;
    public Surface mLastSurface;
    public WorkspaceRenderListener mListener;
    public boolean mNeedsToCleanUp;
    public final PreviewUtils mPreviewUtils;
    public final AtomicBoolean mRequestPending = new AtomicBoolean(false);
    public final boolean mShouldUseWallpaperColors;
    public WallpaperColors mWallpaperColors;
    public final SurfaceView mWorkspaceSurface;

    /* loaded from: classes.dex */
    public interface WorkspaceRenderListener {
    }

    @Override // android.view.SurfaceHolder.Callback
    public final void surfaceChanged(SurfaceHolder surfaceHolder, int i, int i2, int i3) {
    }

    @Override // android.view.SurfaceHolder.Callback
    public final void surfaceDestroyed(SurfaceHolder surfaceHolder) {
    }

    public final void cleanUp() {
        Message message = this.mCallback;
        if (message != null) {
            try {
                try {
                    message.replyTo.send(message);
                    this.mNeedsToCleanUp = false;
                } catch (RemoteException e) {
                    Log.w("WsSurfaceHolderCallback", "Couldn't call cleanup on workspace preview", e);
                }
            } finally {
                this.mCallback = null;
            }
        } else if (this.mRequestPending.get()) {
            this.mNeedsToCleanUp = true;
        }
    }

    public final void maybeRenderPreview() {
        if ((!this.mShouldUseWallpaperColors || this.mIsWallpaperColorsReady) && this.mLastSurface != null) {
            this.mRequestPending.set(true);
            requestPreview(this.mWorkspaceSurface, new PreviewFragment$$ExternalSyntheticLambda6(this, 3));
        }
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceCreated(SurfaceHolder surfaceHolder) {
        boolean z;
        if (this.mPreviewUtils.mProviderInfo != null) {
            z = true;
        } else {
            z = false;
        }
        if (z && this.mLastSurface != surfaceHolder.getSurface()) {
            this.mLastSurface = surfaceHolder.getSurface();
            maybeRenderPreview();
        }
    }

    public WorkspaceSurfaceHolderCallback(SurfaceView surfaceView, Context context, boolean z) {
        this.mWorkspaceSurface = surfaceView;
        this.mPreviewUtils = new PreviewUtils(context, context.getString(R.string.grid_control_metadata_name));
        this.mShouldUseWallpaperColors = z;
    }

    public void requestPreview(SurfaceView surfaceView, PreviewFragment$$ExternalSyntheticLambda6 previewFragment$$ExternalSyntheticLambda6) {
        if (surfaceView.getDisplay() == null) {
            Log.w("WsSurfaceHolderCallback", "No display ID, avoiding asking for workspace preview, lest WallpaperPicker crash");
            return;
        }
        Bundle createSurfaceViewRequest = SurfaceViewUtils.createSurfaceViewRequest(surfaceView);
        WallpaperColors wallpaperColors = this.mWallpaperColors;
        if (wallpaperColors != null) {
            createSurfaceViewRequest.putParcelable("wallpaper_colors", wallpaperColors);
        }
        PreviewUtils previewUtils = this.mPreviewUtils;
        previewUtils.getClass();
        PreviewUtils.sExecutorService.submit(new PreviewUtils$$ExternalSyntheticLambda1(previewUtils, createSurfaceViewRequest, previewFragment$$ExternalSyntheticLambda6));
    }
}
