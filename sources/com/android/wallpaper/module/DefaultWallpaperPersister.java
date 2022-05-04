package com.android.wallpaper.module;

import android.annotation.SuppressLint;
import android.app.WallpaperColors;
import android.app.WallpaperManager;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.graphics.PointF;
import android.graphics.Rect;
import android.os.AsyncTask;
import android.os.ParcelFileDescriptor;
import android.util.Log;
import android.view.Display;
import android.view.WindowManager;
import androidx.cardview.R$style;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.asset.StreamableAsset;
import com.android.wallpaper.asset.StreamableAsset$$ExternalSyntheticLambda5;
import com.android.wallpaper.compat.WallpaperManagerCompat;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.module.BitmapCropper;
import com.android.wallpaper.module.WallpaperChangedNotifier;
import com.android.wallpaper.module.WallpaperPersister;
import com.android.wallpaper.util.DisplayUtils;
import com.android.wallpaper.util.ScreenSizeCalculator;
import com.android.wallpaper.util.WallpaperCropUtils;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
/* loaded from: classes.dex */
public final class DefaultWallpaperPersister implements WallpaperPersister {
    public final Context mAppContext;
    public final DisplayUtils mDisplayUtils;
    public final WallpaperChangedNotifier mWallpaperChangedNotifier;
    public WallpaperInfo mWallpaperInfoInPreview;
    public final WallpaperManager mWallpaperManager;
    public final WallpaperManagerCompat mWallpaperManagerCompat;
    public final WallpaperPreferences mWallpaperPreferences;

    /* loaded from: classes.dex */
    public class SetWallpaperTask extends AsyncTask<Void, Void, Boolean> {
        public Bitmap mBitmap;
        public final WallpaperPersister.SetWallpaperCallback mCallback;
        public final int mDestination;
        public InputStream mInputStream;
        public final WallpaperInfo mWallpaper;

        public SetWallpaperTask(WallpaperInfo wallpaperInfo, Bitmap bitmap, int i, WallpaperPersister.SetWallpaperCallback setWallpaperCallback) {
            this.mWallpaper = wallpaperInfo;
            this.mBitmap = bitmap;
            this.mDestination = i;
            this.mCallback = setWallpaperCallback;
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Removed duplicated region for block: B:56:0x021f  */
        /* JADX WARN: Type inference failed for: r1v12, types: [java.io.InputStream] */
        /* JADX WARN: Type inference failed for: r1v13 */
        @Override // android.os.AsyncTask
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final java.lang.Boolean doInBackground(java.lang.Void[] r12) {
            /*
                Method dump skipped, instructions count: 578
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.wallpaper.module.DefaultWallpaperPersister.SetWallpaperTask.doInBackground(java.lang.Object[]):java.lang.Object");
        }

        @Override // android.os.AsyncTask
        public final void onPostExecute(Boolean bool) {
            Boolean bool2 = bool;
            InputStream inputStream = this.mInputStream;
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    Log.e("WallpaperPersister", "Failed to close input stream " + e);
                    this.mCallback.onError(e);
                    return;
                }
            }
            if (bool2.booleanValue()) {
                this.mCallback.onSuccess(this.mWallpaper);
                WallpaperChangedNotifier wallpaperChangedNotifier = DefaultWallpaperPersister.this.mWallpaperChangedNotifier;
                for (int i = 0; i < wallpaperChangedNotifier.mListeners.size(); i++) {
                    ((WallpaperChangedNotifier.Listener) wallpaperChangedNotifier.mListeners.get(i)).onWallpaperChanged();
                }
                return;
            }
            this.mCallback.onError(null);
        }

        public SetWallpaperTask(WallpaperInfo wallpaperInfo, InputStream inputStream, int i, WallpaperPersister.SetWallpaperCallback setWallpaperCallback) {
            this.mWallpaper = wallpaperInfo;
            this.mInputStream = inputStream;
            this.mDestination = i;
            this.mCallback = setWallpaperCallback;
        }
    }

    public final int cropAndSetWallpaperBitmapInRotationStatic(Bitmap bitmap, List<String> list, String str, String str2) {
        Rect calculateVisibleRect;
        boolean z;
        Point point = new Point(bitmap.getWidth(), bitmap.getHeight());
        Resources resources = this.mAppContext.getResources();
        Display wallpaperDisplay = this.mDisplayUtils.getWallpaperDisplay();
        Point defaultCropSurfaceSize = WallpaperCropUtils.getDefaultCropSurfaceSize(resources, wallpaperDisplay);
        Point screenSize = ScreenSizeCalculator.getInstance().getScreenSize(wallpaperDisplay);
        float calculateMinZoom = WallpaperCropUtils.calculateMinZoom(point, screenSize);
        WallpaperCropUtils.adjustCropRect(this.mAppContext, WallpaperCropUtils.calculateVisibleRect(point, screenSize));
        PointF pointF = new PointF(calculateVisibleRect.centerX(), calculateVisibleRect.centerY());
        Point point2 = new Point((int) (pointF.x * calculateMinZoom), (int) (pointF.y * calculateMinZoom));
        Rect calculateCropRect = WallpaperCropUtils.calculateCropRect(this.mAppContext, calculateMinZoom, point, defaultCropSurfaceSize, screenSize, Math.max(0, -((screenSize.x / 2) - point2.x)), Math.max(0, -((screenSize.y / 2) - point2.y)));
        Rect rect = new Rect((int) Math.floor(calculateCropRect.left / calculateMinZoom), (int) Math.floor(calculateCropRect.top / calculateMinZoom), (int) Math.floor(calculateCropRect.right / calculateMinZoom), (int) Math.floor(calculateCropRect.bottom / calculateMinZoom));
        Bitmap createBitmap = Bitmap.createBitmap(bitmap, rect.left, rect.top, rect.width(), rect.height());
        ParcelFileDescriptor wallpaperFile = this.mWallpaperManagerCompat.getWallpaperFile(2);
        int i = 1;
        if (wallpaperFile != null) {
            try {
                wallpaperFile.close();
            } catch (IOException e) {
                Log.e("WallpaperPersister", "Unable to close PFD for lock wallpaper", e);
            }
            z = true;
        } else {
            z = false;
        }
        if (!z) {
            i = 3;
        }
        int bitmapToWallpaperManagerCompat = setBitmapToWallpaperManagerCompat(createBitmap, false, i);
        if (bitmapToWallpaperManagerCompat > 0) {
            this.mWallpaperPreferences.storeLatestHomeWallpaper(String.valueOf(bitmapToWallpaperManagerCompat), list, str, str2, createBitmap, WallpaperColors.fromBitmap(createBitmap));
        }
        return bitmapToWallpaperManagerCompat;
    }

    public final void onLiveWallpaperSet() {
        android.app.WallpaperInfo wallpaperInfo;
        android.app.WallpaperInfo wallpaperInfo2 = this.mWallpaperManager.getWallpaperInfo();
        WallpaperInfo wallpaperInfo3 = this.mWallpaperInfoInPreview;
        if (wallpaperInfo3 != null) {
            wallpaperInfo = wallpaperInfo3.getWallpaperComponent();
        } else {
            wallpaperInfo = null;
        }
        if (wallpaperInfo2 == null || wallpaperInfo == null || !wallpaperInfo2.getPackageName().equals(wallpaperInfo.getPackageName())) {
            this.mWallpaperInfoInPreview = null;
            return;
        }
        android.app.WallpaperInfo wallpaperComponent = this.mWallpaperInfoInPreview.getWallpaperComponent();
        this.mWallpaperPreferences.clearHomeWallpaperMetadata();
        this.mWallpaperPreferences.setHomeWallpaperAttributions(this.mWallpaperInfoInPreview.getAttributions(this.mAppContext));
        this.mWallpaperPreferences.setHomeWallpaperPackageName(wallpaperComponent.getPackageName());
        this.mWallpaperPreferences.setHomeWallpaperServiceName(wallpaperComponent.getServiceName());
        this.mWallpaperPreferences.setHomeWallpaperCollectionId(this.mWallpaperInfoInPreview.getCollectionId(this.mAppContext));
        this.mWallpaperPreferences.setWallpaperPresentationMode(1);
        this.mWallpaperPreferences.clearDailyRotations();
    }

    public final void saveStaticWallpaperMetadata(List list, String str, int i, int i2, String str2, int i3) {
        boolean z;
        this.mWallpaperPreferences.clearHomeWallpaperMetadata();
        ParcelFileDescriptor wallpaperFile = this.mWallpaperManagerCompat.getWallpaperFile(2);
        if (wallpaperFile != null) {
            z = true;
            try {
                wallpaperFile.close();
            } catch (IOException e) {
                Log.e("WallpaperPersister", "Unable to close PFD for lock wallpaper", e);
            }
        } else {
            z = false;
        }
        this.mWallpaperPreferences.setHomeWallpaperManagerId(i3);
        if (!z) {
            this.mWallpaperPreferences.setLockWallpaperId(i3);
        }
        this.mWallpaperPreferences.setHomeWallpaperAttributions(list);
        this.mWallpaperPreferences.setHomeWallpaperActionUrl(str);
        this.mWallpaperPreferences.setHomeWallpaperActionLabelRes(i);
        this.mWallpaperPreferences.setHomeWallpaperActionIconRes(i2);
        this.mWallpaperPreferences.setHomeWallpaperBaseImageUrl(null);
        this.mWallpaperPreferences.setHomeWallpaperCollectionId(str2);
        if (!z) {
            this.mWallpaperPreferences.setLockWallpaperAttributions(list);
            this.mWallpaperPreferences.setLockWallpaperActionUrl(str);
            this.mWallpaperPreferences.setLockWallpaperActionLabelRes(i);
            this.mWallpaperPreferences.setLockWallpaperActionIconRes(i2);
            this.mWallpaperPreferences.setLockWallpaperCollectionId(str2);
        }
    }

    public final int setBitmapToWallpaperManagerCompat(Bitmap bitmap, boolean z, int i) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        if (bitmap.compress(Bitmap.CompressFormat.PNG, 100, byteArrayOutputStream)) {
            try {
                return this.mWallpaperManagerCompat.setStream(new ByteArrayInputStream(byteArrayOutputStream.toByteArray()), z, i);
            } catch (IOException unused) {
                Log.e("WallpaperPersister", "unable to write stream to wallpaper manager");
                return 0;
            }
        } else {
            Log.e("WallpaperPersister", "unable to compress wallpaper");
            try {
                return this.mWallpaperManagerCompat.setBitmap(bitmap, z, i);
            } catch (IOException unused2) {
                Log.e("WallpaperPersister", "unable to set wallpaper");
                return 0;
            }
        }
    }

    public final void setIndividualWallpaper(final WallpaperInfo wallpaperInfo, Asset asset, Rect rect, float f, final int i, final WallpaperPersister.SetWallpaperCallback setWallpaperCallback) {
        if (rect == null && (asset instanceof StreamableAsset)) {
            StreamableAsset streamableAsset = (StreamableAsset) asset;
            StreamableAsset.StreamReceiver streamReceiver = new StreamableAsset.StreamReceiver() { // from class: com.android.wallpaper.module.DefaultWallpaperPersister.1
                @Override // com.android.wallpaper.asset.StreamableAsset.StreamReceiver
                public final void onInputStreamOpened(InputStream inputStream) {
                    if (inputStream == null) {
                        setWallpaperCallback.onError(null);
                        return;
                    }
                    DefaultWallpaperPersister defaultWallpaperPersister = DefaultWallpaperPersister.this;
                    WallpaperInfo wallpaperInfo2 = wallpaperInfo;
                    int i2 = i;
                    WallpaperPersister.SetWallpaperCallback setWallpaperCallback2 = setWallpaperCallback;
                    defaultWallpaperPersister.getClass();
                    new SetWallpaperTask(wallpaperInfo2, inputStream, i2, setWallpaperCallback2).execute(new Void[0]);
                }
            };
            streamableAsset.getClass();
            StreamableAsset.sExecutorService.execute(new StreamableAsset$$ExternalSyntheticLambda5(streamableAsset, streamReceiver));
        } else if (rect == null) {
            Point screenSize = ScreenSizeCalculator.getInstance().getScreenSize(((WindowManager) this.mAppContext.getSystemService("window")).getDefaultDisplay());
            asset.decodeBitmap(screenSize.x, screenSize.y, new Asset.BitmapReceiver() { // from class: com.android.wallpaper.module.DefaultWallpaperPersister.2
                @Override // com.android.wallpaper.asset.Asset.BitmapReceiver
                public final void onBitmapDecoded(Bitmap bitmap) {
                    if (bitmap == null) {
                        setWallpaperCallback.onError(null);
                        return;
                    }
                    DefaultWallpaperPersister defaultWallpaperPersister = DefaultWallpaperPersister.this;
                    WallpaperInfo wallpaperInfo2 = wallpaperInfo;
                    int i2 = i;
                    WallpaperPersister.SetWallpaperCallback setWallpaperCallback2 = setWallpaperCallback;
                    defaultWallpaperPersister.getClass();
                    new SetWallpaperTask(wallpaperInfo2, bitmap, i2, setWallpaperCallback2).execute(new Void[0]);
                }
            });
        } else {
            ((DefaultBitmapCropper) R$style.getInjector().getBitmapCropper()).cropAndScaleBitmap(asset, f, rect, false, new BitmapCropper.Callback() { // from class: com.android.wallpaper.module.DefaultWallpaperPersister.3
                @Override // com.android.wallpaper.module.BitmapCropper.Callback
                public final void onBitmapCropped(Bitmap bitmap) {
                    DefaultWallpaperPersister defaultWallpaperPersister = DefaultWallpaperPersister.this;
                    WallpaperInfo wallpaperInfo2 = wallpaperInfo;
                    int i2 = i;
                    WallpaperPersister.SetWallpaperCallback setWallpaperCallback2 = setWallpaperCallback;
                    defaultWallpaperPersister.getClass();
                    new SetWallpaperTask(wallpaperInfo2, bitmap, i2, setWallpaperCallback2).execute(new Void[0]);
                }

                @Override // com.android.wallpaper.module.BitmapCropper.Callback
                public final void onError(OutOfMemoryError outOfMemoryError) {
                    setWallpaperCallback.onError(outOfMemoryError);
                }
            });
        }
    }

    @SuppressLint({"ServiceCast"})
    public DefaultWallpaperPersister(Context context) {
        WallpaperChangedNotifier wallpaperChangedNotifier;
        this.mAppContext = context.getApplicationContext();
        Injector injector = R$style.getInjector();
        this.mWallpaperManager = (WallpaperManager) context.getSystemService("wallpaper");
        this.mWallpaperManagerCompat = injector.getWallpaperManagerCompat(context);
        this.mWallpaperPreferences = injector.getPreferences(context);
        synchronized (WallpaperChangedNotifier.sInstanceLock) {
            if (WallpaperChangedNotifier.sInstance == null) {
                WallpaperChangedNotifier.sInstance = new WallpaperChangedNotifier();
            }
            wallpaperChangedNotifier = WallpaperChangedNotifier.sInstance;
        }
        this.mWallpaperChangedNotifier = wallpaperChangedNotifier;
        this.mDisplayUtils = injector.getDisplayUtils(context);
    }
}
