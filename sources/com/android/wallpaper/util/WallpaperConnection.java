package com.android.wallpaper.util;

import android.app.Activity;
import android.app.WallpaperColors;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.IBinder;
import android.os.ParcelFileDescriptor;
import android.os.RemoteException;
import android.service.wallpaper.IWallpaperConnection;
import android.service.wallpaper.IWallpaperEngine;
import android.service.wallpaper.IWallpaperService;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.SurfaceControl;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import androidx.core.widget.ContentLoadingProgressBar$$ExternalSyntheticLambda0;
import androidx.core.widget.ContentLoadingProgressBar$$ExternalSyntheticLambda2;
/* loaded from: classes.dex */
public final class WallpaperConnection extends IWallpaperConnection.Stub implements ServiceConnection {
    private boolean mConnected;
    private final SurfaceView mContainerView;
    private final Context mContext;
    private IWallpaperEngine mEngine;
    private boolean mEngineReady;
    private final Intent mIntent;
    private boolean mIsEngineVisible;
    private boolean mIsVisible;
    private final WallpaperConnectionListener mListener;
    private final SurfaceView mSecondContainerView;
    private IWallpaperService mService;

    /* loaded from: classes.dex */
    public interface WallpaperConnectionListener {
        default void onConnected() {
        }

        default void onDisconnected() {
        }

        default void onEngineShown() {
        }

        default void onWallpaperColorsChanged(WallpaperColors wallpaperColors, int i) {
        }
    }

    public WallpaperConnection(Intent intent, Activity activity, WallpaperConnectionListener wallpaperConnectionListener, SurfaceView surfaceView) {
        this(intent, activity, wallpaperConnectionListener, surfaceView, null);
    }

    public static boolean isPreviewAvailable() {
        try {
            return IWallpaperEngine.class.getMethod("mirrorSurfaceControl", new Class[0]) != null;
        } catch (NoSuchMethodException | SecurityException unused) {
            return false;
        }
    }

    public final void attachEngine(IWallpaperEngine iWallpaperEngine, int i) {
        synchronized (this) {
            if (this.mConnected) {
                this.mEngine = iWallpaperEngine;
                if (!(!this.mIsVisible || iWallpaperEngine == null || true == this.mIsEngineVisible)) {
                    try {
                        iWallpaperEngine.setVisibility(true);
                        this.mIsEngineVisible = true;
                    } catch (RemoteException e) {
                        Log.w("WallpaperConnection", "Failure setting wallpaper visibility ", e);
                    }
                }
                try {
                    this.mEngine.requestWallpaperColors();
                } catch (RemoteException e2) {
                    Log.w("WallpaperConnection", "Failed requesting wallpaper colors", e2);
                }
            } else {
                try {
                    iWallpaperEngine.destroy();
                } catch (RemoteException unused) {
                }
            }
        }
    }

    public final boolean connect() {
        synchronized (this) {
            if (this.mConnected) {
                return true;
            }
            if (!this.mContext.bindService(this.mIntent, this, 65)) {
                return false;
            }
            this.mConnected = true;
            WallpaperConnectionListener wallpaperConnectionListener = this.mListener;
            if (wallpaperConnectionListener != null) {
                wallpaperConnectionListener.onConnected();
            }
            return true;
        }
    }

    public final void disconnect() {
        synchronized (this) {
            this.mConnected = false;
            IWallpaperEngine iWallpaperEngine = this.mEngine;
            if (iWallpaperEngine != null) {
                try {
                    iWallpaperEngine.destroy();
                } catch (RemoteException unused) {
                }
                this.mEngine = null;
            }
            try {
                this.mContext.unbindService(this);
            } catch (IllegalArgumentException unused2) {
                Log.i("WallpaperConnection", "Can't unbind wallpaper service. It might have crashed, just ignoring.");
            }
            this.mService = null;
        }
        WallpaperConnectionListener wallpaperConnectionListener = this.mListener;
        if (wallpaperConnectionListener != null) {
            wallpaperConnectionListener.onDisconnected();
        }
    }

    public final void engineShown(IWallpaperEngine iWallpaperEngine) {
        this.mEngineReady = true;
        SurfaceView surfaceView = this.mContainerView;
        if (surfaceView != null) {
            surfaceView.post(new ContentLoadingProgressBar$$ExternalSyntheticLambda0(this, 1));
        }
        SurfaceView surfaceView2 = this.mSecondContainerView;
        if (surfaceView2 != null) {
            surfaceView2.post(new ContentLoadingProgressBar$$ExternalSyntheticLambda2(this, 2));
        }
        this.mContainerView.post(new WallpaperConnection$$ExternalSyntheticLambda0(this, 0));
    }

    public final void onLocalWallpaperColorsChanged(RectF rectF, WallpaperColors wallpaperColors, int i) {
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        this.mService = null;
        this.mEngine = null;
        Log.w("WallpaperConnection", "Wallpaper service gone: " + componentName);
    }

    public final ParcelFileDescriptor setWallpaper(String str) {
        return null;
    }

    /* renamed from: $r8$lambda$1nxmYJiT3qROc-bA69duWP3-R9s  reason: not valid java name */
    public static /* synthetic */ void m29$r8$lambda$1nxmYJiT3qROcbA69duWP3R9s(WallpaperConnection wallpaperConnection, WallpaperColors wallpaperColors, int i) {
        WallpaperConnectionListener wallpaperConnectionListener = wallpaperConnection.mListener;
        if (wallpaperConnectionListener != null) {
            wallpaperConnectionListener.onWallpaperColorsChanged(wallpaperColors, i);
        }
    }

    /* renamed from: $r8$lambda$caOSgknIvl-qlVpoioFcEp8xlv8  reason: not valid java name */
    public static /* synthetic */ void m30$r8$lambda$caOSgknIvlqlVpoioFcEp8xlv8(WallpaperConnection wallpaperConnection) {
        WallpaperConnectionListener wallpaperConnectionListener = wallpaperConnection.mListener;
        if (wallpaperConnectionListener != null) {
            wallpaperConnectionListener.onEngineShown();
        }
    }

    public WallpaperConnection(Intent intent, Activity activity, WallpaperConnectionListener wallpaperConnectionListener, SurfaceView surfaceView, SurfaceView surfaceView2) {
        this.mContext = activity.getApplicationContext();
        this.mIntent = intent;
        this.mListener = wallpaperConnectionListener;
        this.mContainerView = surfaceView;
        this.mSecondContainerView = surfaceView2;
    }

    private float[] getScale(SurfaceView surfaceView) {
        Matrix matrix = new Matrix();
        float[] fArr = new float[9];
        Rect surfaceFrame = surfaceView.getHolder().getSurfaceFrame();
        if (DisplayMetricsRetriever.sInstance == null) {
            DisplayMetricsRetriever.sInstance = new DisplayMetricsRetriever();
        }
        DisplayMetrics displayMetrics = DisplayMetricsRetriever.sInstance.getDisplayMetrics(this.mContainerView.getResources(), this.mContainerView.getDisplay());
        matrix.postScale(surfaceFrame.width() / displayMetrics.widthPixels, surfaceFrame.height() / displayMetrics.heightPixels);
        matrix.getValues(fArr);
        return fArr;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void mirrorAndReparent(SurfaceView surfaceView) {
        if (this.mEngine == null) {
            Log.i("WallpaperConnection", "Engine is null, was the service disconnected?");
            return;
        }
        try {
            SurfaceControl surfaceControl = surfaceView.getSurfaceControl();
            SurfaceControl mirrorSurfaceControl = this.mEngine.mirrorSurfaceControl();
            if (mirrorSurfaceControl != null) {
                float[] scale = getScale(surfaceView);
                SurfaceControl.Transaction transaction = new SurfaceControl.Transaction();
                transaction.setMatrix(mirrorSurfaceControl, scale[0], scale[3], scale[1], scale[4]);
                transaction.reparent(mirrorSurfaceControl, surfaceControl);
                transaction.show(mirrorSurfaceControl);
                transaction.apply();
            }
        } catch (RemoteException e) {
            Log.e("WallpaperConnection", "Couldn't reparent wallpaper surface", e);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void reparentWallpaperSurface(final SurfaceView surfaceView) {
        if (this.mEngine == null) {
            Log.i("WallpaperConnection", "Engine is null, was the service disconnected?");
        } else if (surfaceView.getSurfaceControl() != null) {
            mirrorAndReparent(surfaceView);
        } else {
            Log.d("WallpaperConnection", "SurfaceView not initialized yet, adding callback");
            surfaceView.getHolder().addCallback(new SurfaceHolder.Callback() { // from class: com.android.wallpaper.util.WallpaperConnection.1
                @Override // android.view.SurfaceHolder.Callback
                public final void surfaceChanged(SurfaceHolder surfaceHolder, int i, int i2, int i3) {
                }

                @Override // android.view.SurfaceHolder.Callback
                public final void surfaceDestroyed(SurfaceHolder surfaceHolder) {
                }

                @Override // android.view.SurfaceHolder.Callback
                public final void surfaceCreated(SurfaceHolder surfaceHolder) {
                    WallpaperConnection.this.mirrorAndReparent(surfaceView);
                    surfaceView.getHolder().removeCallback(this);
                }
            });
        }
    }

    public final void onWallpaperColorsChanged(final WallpaperColors wallpaperColors, final int i) {
        this.mContainerView.post(new Runnable() { // from class: com.android.wallpaper.util.WallpaperConnection$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                WallpaperConnection.m29$r8$lambda$1nxmYJiT3qROcbA69duWP3R9s(WallpaperConnection.this, wallpaperColors, i);
            }
        });
    }

    public final void setVisibility(boolean z) {
        this.mIsVisible = z;
        IWallpaperEngine iWallpaperEngine = this.mEngine;
        if (iWallpaperEngine != null && z != this.mIsEngineVisible) {
            try {
                iWallpaperEngine.setVisibility(z);
                this.mIsEngineVisible = z;
            } catch (RemoteException e) {
                Log.w("WallpaperConnection", "Failure setting wallpaper visibility ", e);
            }
        }
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        this.mService = IWallpaperService.Stub.asInterface(iBinder);
        try {
            this.mService.attach(this, this.mContainerView.getWindowToken(), 1001, true, this.mContainerView.getWidth(), this.mContainerView.getHeight(), new Rect(0, 0, 0, 0), this.mContainerView.getDisplay().getDisplayId());
        } catch (RemoteException e) {
            Log.w("WallpaperConnection", "Failed attaching wallpaper; clearing", e);
        }
    }

    public final IWallpaperEngine getEngine() {
        return this.mEngine;
    }

    public final boolean isEngineReady() {
        return this.mEngineReady;
    }
}
