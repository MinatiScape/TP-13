package com.android.customization.picker.grid;

import android.content.Context;
import android.os.Bundle;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.ViewGroup;
import com.android.customization.model.grid.GridOption;
import com.android.customization.model.grid.GridOptionsManager;
import com.android.customization.model.grid.LauncherGridOptionsProvider;
import com.android.wallpaper.picker.PreviewFragment$$ExternalSyntheticLambda6;
import com.android.wallpaper.picker.WorkspaceSurfaceHolderCallback;
import com.android.wallpaper.util.PreviewUtils;
import com.android.wallpaper.util.PreviewUtils$$ExternalSyntheticLambda1;
import com.android.wallpaper.util.SurfaceViewUtils;
/* loaded from: classes.dex */
public final class GridOptionPreviewer {
    public final GridOptionsManager mGridManager;
    public GridOption mGridOption;
    public SurfaceView mGridOptionSurface;
    public final ViewGroup mPreviewContainer;
    public GridOptionSurfaceHolderCallback mSurfaceCallback;

    /* loaded from: classes.dex */
    public class GridOptionSurfaceHolderCallback extends WorkspaceSurfaceHolderCallback {
        public GridOptionSurfaceHolderCallback(SurfaceView surfaceView, Context context) {
            super(surfaceView, context, false);
        }

        @Override // com.android.wallpaper.picker.WorkspaceSurfaceHolderCallback
        public final void requestPreview(SurfaceView surfaceView, PreviewFragment$$ExternalSyntheticLambda6 previewFragment$$ExternalSyntheticLambda6) {
            GridOptionsManager gridOptionsManager = GridOptionPreviewer.this.mGridManager;
            Bundle createSurfaceViewRequest = SurfaceViewUtils.createSurfaceViewRequest(surfaceView);
            String str = GridOptionPreviewer.this.mGridOption.name;
            LauncherGridOptionsProvider launcherGridOptionsProvider = gridOptionsManager.mProvider;
            launcherGridOptionsProvider.getClass();
            createSurfaceViewRequest.putString("name", str);
            PreviewUtils previewUtils = launcherGridOptionsProvider.mPreviewUtils;
            previewUtils.getClass();
            PreviewUtils.sExecutorService.submit(new PreviewUtils$$ExternalSyntheticLambda1(previewUtils, createSurfaceViewRequest, previewFragment$$ExternalSyntheticLambda6));
        }

        @Override // com.android.wallpaper.picker.WorkspaceSurfaceHolderCallback, android.view.SurfaceHolder.Callback
        public final void surfaceCreated(SurfaceHolder surfaceHolder) {
            if (GridOptionPreviewer.this.mGridOption != null) {
                super.surfaceCreated(surfaceHolder);
            }
        }
    }

    public GridOptionPreviewer(GridOptionsManager gridOptionsManager, ViewGroup viewGroup) {
        this.mGridManager = gridOptionsManager;
        this.mPreviewContainer = viewGroup;
    }
}
