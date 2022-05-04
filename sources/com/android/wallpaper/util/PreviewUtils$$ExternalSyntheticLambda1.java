package com.android.wallpaper.util;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.view.SurfaceControlViewHost;
import android.view.SurfaceView;
import com.android.wallpaper.picker.PreviewFragment$$ExternalSyntheticLambda6;
import com.android.wallpaper.picker.WallpaperColorThemePreview$$ExternalSyntheticLambda0;
import com.android.wallpaper.picker.WorkspaceSurfaceHolderCallback;
import com.android.wallpaper.util.PreviewUtils;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class PreviewUtils$$ExternalSyntheticLambda1 implements Runnable {
    public final /* synthetic */ PreviewUtils f$0;
    public final /* synthetic */ Bundle f$1;
    public final /* synthetic */ PreviewUtils.WorkspacePreviewCallback f$2;

    public /* synthetic */ PreviewUtils$$ExternalSyntheticLambda1(PreviewUtils previewUtils, Bundle bundle, PreviewFragment$$ExternalSyntheticLambda6 previewFragment$$ExternalSyntheticLambda6) {
        this.f$0 = previewUtils;
        this.f$1 = bundle;
        this.f$2 = previewFragment$$ExternalSyntheticLambda6;
    }

    @Override // java.lang.Runnable
    public final void run() {
        PreviewUtils previewUtils = this.f$0;
        Bundle bundle = this.f$1;
        final PreviewUtils.WorkspacePreviewCallback workspacePreviewCallback = this.f$2;
        final Bundle call = previewUtils.mContext.getContentResolver().call(previewUtils.getUri("preview"), "get_preview", (String) null, bundle);
        new Handler(Looper.getMainLooper()).post(new Runnable() { // from class: com.android.wallpaper.util.PreviewUtils$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                PreviewUtils.WorkspacePreviewCallback workspacePreviewCallback2 = PreviewUtils.WorkspacePreviewCallback.this;
                Bundle bundle2 = call;
                WorkspaceSurfaceHolderCallback workspaceSurfaceHolderCallback = (WorkspaceSurfaceHolderCallback) ((PreviewFragment$$ExternalSyntheticLambda6) workspacePreviewCallback2).f$0;
                workspaceSurfaceHolderCallback.mRequestPending.set(false);
                if (bundle2 != null && workspaceSurfaceHolderCallback.mLastSurface != null) {
                    workspaceSurfaceHolderCallback.mWorkspaceSurface.setChildSurfacePackage((SurfaceControlViewHost.SurfacePackage) bundle2.getParcelable("surface_package"));
                    workspaceSurfaceHolderCallback.mCallback = (Message) bundle2.getParcelable("callback");
                    if (workspaceSurfaceHolderCallback.mNeedsToCleanUp) {
                        workspaceSurfaceHolderCallback.cleanUp();
                        return;
                    }
                    WorkspaceSurfaceHolderCallback.WorkspaceRenderListener workspaceRenderListener = workspaceSurfaceHolderCallback.mListener;
                    if (workspaceRenderListener != null) {
                        SurfaceView surfaceView = ((WallpaperColorThemePreview$$ExternalSyntheticLambda0) workspaceRenderListener).f$0;
                        surfaceView.setTop(-1);
                        surfaceView.animate().alpha(1.0f).setDuration(300L).start();
                    }
                }
            }
        });
    }
}
