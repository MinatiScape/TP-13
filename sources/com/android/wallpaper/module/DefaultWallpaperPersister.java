package com.android.wallpaper.module;

import android.annotation.SuppressLint;
import android.app.Activity;
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
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import android.view.Display;
import android.view.WindowManager;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.asset.StreamableAsset;
import com.android.wallpaper.compat.WallpaperManagerCompatV16;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.module.BitmapCropper;
import com.android.wallpaper.module.WallpaperPersister;
import com.android.wallpaper.util.DisplayUtils;
import com.android.wallpaper.util.ScreenSizeCalculator;
import com.android.wallpaper.util.WallpaperCropUtils;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Objects;
/* loaded from: classes.dex */
public class DefaultWallpaperPersister implements WallpaperPersister {
    public final Context mAppContext;
    public final DisplayUtils mDisplayUtils;
    public final WallpaperChangedNotifier mWallpaperChangedNotifier = WallpaperChangedNotifier.getInstance();
    public WallpaperInfo mWallpaperInfoInPreview;
    public final WallpaperManager mWallpaperManager;
    public final WallpaperManagerCompatV16 mWallpaperManagerCompat;
    public final WallpaperPreferences mWallpaperPreferences;

    @SuppressLint({"ServiceCast"})
    public DefaultWallpaperPersister(Context context) {
        this.mAppContext = context.getApplicationContext();
        Injector injector = InjectorProvider.getInjector();
        this.mWallpaperManager = (WallpaperManager) context.getSystemService("wallpaper");
        this.mWallpaperManagerCompat = injector.getWallpaperManagerCompat(context);
        this.mWallpaperPreferences = injector.getPreferences(context);
        this.mDisplayUtils = injector.getDisplayUtils(context);
    }

    public final int cropAndSetWallpaperBitmapInRotationStatic(Bitmap bitmap, List<String> list, String str, String str2) {
        Point point = new Point(bitmap.getWidth(), bitmap.getHeight());
        Resources resources = this.mAppContext.getResources();
        Display wallpaperDisplay = this.mDisplayUtils.getWallpaperDisplay();
        Point defaultCropSurfaceSize = WallpaperCropUtils.getDefaultCropSurfaceSize(resources, wallpaperDisplay);
        Point screenSize = ScreenSizeCalculator.getInstance().getScreenSize(wallpaperDisplay);
        float calculateMinZoom = WallpaperCropUtils.calculateMinZoom(point, screenSize);
        Context context = this.mAppContext;
        Rect calculateVisibleRect = WallpaperCropUtils.calculateVisibleRect(point, screenSize);
        WallpaperCropUtils.adjustCropRect(context, calculateVisibleRect, true);
        PointF pointF = new PointF(calculateVisibleRect.centerX(), calculateVisibleRect.centerY());
        Point point2 = new Point((int) (pointF.x * calculateMinZoom), (int) (pointF.y * calculateMinZoom));
        Rect calculateCropRect = WallpaperCropUtils.calculateCropRect(this.mAppContext, calculateMinZoom, point, defaultCropSurfaceSize, screenSize, Math.max(0, -((screenSize.x / 2) - point2.x)), Math.max(0, -((screenSize.y / 2) - point2.y)));
        Rect rect = new Rect((int) Math.floor(calculateCropRect.left / calculateMinZoom), (int) Math.floor(calculateCropRect.top / calculateMinZoom), (int) Math.floor(calculateCropRect.right / calculateMinZoom), (int) Math.floor(calculateCropRect.bottom / calculateMinZoom));
        Bitmap createBitmap = Bitmap.createBitmap(bitmap, rect.left, rect.top, rect.width(), rect.height());
        int bitmapToWallpaperManagerCompat = setBitmapToWallpaperManagerCompat(createBitmap, false, getDefaultWhichWallpaper());
        if (bitmapToWallpaperManagerCompat > 0) {
            this.mWallpaperPreferences.storeLatestHomeWallpaper(String.valueOf(bitmapToWallpaperManagerCompat), list, str, str2, createBitmap, WallpaperColors.fromBitmap(createBitmap));
        }
        return bitmapToWallpaperManagerCompat;
    }

    public int getDefaultWhichWallpaper() {
        return isSeparateLockScreenWallpaperSet() ? 1 : 3;
    }

    public final boolean isSeparateLockScreenWallpaperSet() {
        ParcelFileDescriptor wallpaperFile = this.mWallpaperManagerCompat.getWallpaperFile(2);
        if (wallpaperFile == null) {
            return false;
        }
        try {
            wallpaperFile.close();
            return true;
        } catch (IOException e) {
            Log.e("WallpaperPersister", "Unable to close PFD for lock wallpaper", e);
            return true;
        }
    }

    public void onLiveWallpaperSet() {
        android.app.WallpaperInfo wallpaperInfo = this.mWallpaperManager.getWallpaperInfo();
        WallpaperInfo wallpaperInfo2 = this.mWallpaperInfoInPreview;
        android.app.WallpaperInfo wallpaperComponent = wallpaperInfo2 != null ? wallpaperInfo2.getWallpaperComponent() : null;
        if (wallpaperInfo == null || wallpaperComponent == null || !wallpaperInfo.getPackageName().equals(wallpaperComponent.getPackageName())) {
            this.mWallpaperInfoInPreview = null;
            return;
        }
        android.app.WallpaperInfo wallpaperComponent2 = this.mWallpaperInfoInPreview.getWallpaperComponent();
        this.mWallpaperPreferences.clearHomeWallpaperMetadata();
        this.mWallpaperPreferences.setHomeWallpaperAttributions(this.mWallpaperInfoInPreview.getAttributions(this.mAppContext));
        this.mWallpaperPreferences.setHomeWallpaperPackageName(wallpaperComponent2.getPackageName());
        this.mWallpaperPreferences.setHomeWallpaperServiceName(wallpaperComponent2.getServiceName());
        this.mWallpaperPreferences.setHomeWallpaperCollectionId(this.mWallpaperInfoInPreview.getCollectionId(this.mAppContext));
        this.mWallpaperPreferences.setWallpaperPresentationMode(1);
        this.mWallpaperPreferences.clearDailyRotations();
    }

    public boolean saveStaticWallpaperMetadata(List<String> list, String str, int i, int i2, String str2, int i3) {
        this.mWallpaperPreferences.clearHomeWallpaperMetadata();
        boolean isSeparateLockScreenWallpaperSet = isSeparateLockScreenWallpaperSet();
        this.mWallpaperPreferences.setHomeWallpaperManagerId(i3);
        if (!isSeparateLockScreenWallpaperSet) {
            this.mWallpaperPreferences.setLockWallpaperId(i3);
        }
        this.mWallpaperPreferences.setHomeWallpaperAttributions(list);
        this.mWallpaperPreferences.setHomeWallpaperActionUrl(str);
        this.mWallpaperPreferences.setHomeWallpaperActionLabelRes(i);
        this.mWallpaperPreferences.setHomeWallpaperActionIconRes(i2);
        this.mWallpaperPreferences.setHomeWallpaperBaseImageUrl(null);
        this.mWallpaperPreferences.setHomeWallpaperCollectionId(str2);
        if (isSeparateLockScreenWallpaperSet) {
            return true;
        }
        this.mWallpaperPreferences.setLockWallpaperAttributions(list);
        this.mWallpaperPreferences.setLockWallpaperActionUrl(str);
        this.mWallpaperPreferences.setLockWallpaperActionLabelRes(i);
        this.mWallpaperPreferences.setLockWallpaperActionIconRes(i2);
        this.mWallpaperPreferences.setLockWallpaperCollectionId(str2);
        return true;
    }

    public int setBitmapToWallpaperManagerCompat(Bitmap bitmap, boolean z, int i) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        if (bitmap.compress(Bitmap.CompressFormat.PNG, 100, byteArrayOutputStream)) {
            try {
                return this.mWallpaperManagerCompat.setStream(new ByteArrayInputStream(byteArrayOutputStream.toByteArray()), null, z, i);
            } catch (IOException unused) {
                Log.e("WallpaperPersister", "unable to write stream to wallpaper manager");
                return 0;
            }
        } else {
            Log.e("WallpaperPersister", "unable to compress wallpaper");
            try {
                return this.mWallpaperManagerCompat.setBitmap(bitmap, null, z, i);
            } catch (IOException unused2) {
                Log.e("WallpaperPersister", "unable to set wallpaper");
                return 0;
            }
        }
    }

    public void setIndividualWallpaper(final WallpaperInfo wallpaperInfo, Asset asset, Rect rect, float f, final int i, final WallpaperPersister.SetWallpaperCallback setWallpaperCallback) {
        if (rect == null && (asset instanceof StreamableAsset)) {
            StreamableAsset streamableAsset = (StreamableAsset) asset;
            StreamableAsset.StreamReceiver streamReceiver = new StreamableAsset.StreamReceiver() { // from class: com.android.wallpaper.module.DefaultWallpaperPersister.1
                @Override // com.android.wallpaper.asset.StreamableAsset.StreamReceiver
                public void onInputStreamOpened(InputStream inputStream) {
                    if (inputStream == null) {
                        setWallpaperCallback.onError(null);
                        return;
                    }
                    DefaultWallpaperPersister defaultWallpaperPersister = DefaultWallpaperPersister.this;
                    WallpaperInfo wallpaperInfo2 = wallpaperInfo;
                    int i2 = i;
                    WallpaperPersister.SetWallpaperCallback setWallpaperCallback2 = setWallpaperCallback;
                    Objects.requireNonNull(defaultWallpaperPersister);
                    new SetWallpaperTask(wallpaperInfo2, inputStream, i2, setWallpaperCallback2).execute(new Void[0]);
                }
            };
            Objects.requireNonNull(streamableAsset);
            new StreamableAsset.AnonymousClass1(streamReceiver).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
        } else if (rect == null) {
            Point screenSize = ScreenSizeCalculator.getInstance().getScreenSize(((WindowManager) this.mAppContext.getSystemService("window")).getDefaultDisplay());
            asset.decodeBitmap(screenSize.x, screenSize.y, new Asset.BitmapReceiver() { // from class: com.android.wallpaper.module.DefaultWallpaperPersister.2
                @Override // com.android.wallpaper.asset.Asset.BitmapReceiver
                public void onBitmapDecoded(Bitmap bitmap) {
                    if (bitmap == null) {
                        setWallpaperCallback.onError(null);
                    } else {
                        DefaultWallpaperPersister.this.setIndividualWallpaper(wallpaperInfo, bitmap, i, setWallpaperCallback);
                    }
                }
            });
        } else {
            ((DefaultBitmapCropper) InjectorProvider.getInjector().getBitmapCropper()).cropAndScaleBitmap(asset, f, rect, false, new BitmapCropper.Callback() { // from class: com.android.wallpaper.module.DefaultWallpaperPersister.3
                @Override // com.android.wallpaper.module.BitmapCropper.Callback
                public void onBitmapCropped(Bitmap bitmap) {
                    DefaultWallpaperPersister.this.setIndividualWallpaper(wallpaperInfo, bitmap, i, setWallpaperCallback);
                }

                @Override // com.android.wallpaper.module.BitmapCropper.Callback
                public void onError(Throwable th) {
                    setWallpaperCallback.onError(th);
                }
            });
        }
    }

    public void setIndividualWallpaperWithPosition(Activity activity, final WallpaperInfo wallpaperInfo, final int i, final WallpaperPersister.SetWallpaperCallback setWallpaperCallback) {
        final Point screenSize = ScreenSizeCalculator.getInstance().getScreenSize(((WindowManager) this.mAppContext.getSystemService("window")).getDefaultDisplay());
        final Asset asset = wallpaperInfo.getAsset(activity);
        asset.decodeRawDimensions(activity, new Asset.DimensionsReceiver() { // from class: com.android.wallpaper.module.DefaultWallpaperPersister.4
            @Override // com.android.wallpaper.asset.Asset.DimensionsReceiver
            public void onDimensionsDecoded(Point point) {
                if (point == null) {
                    setWallpaperCallback.onError(null);
                    return;
                }
                int i2 = i;
                if (i2 == 0) {
                    final DefaultWallpaperPersister defaultWallpaperPersister = DefaultWallpaperPersister.this;
                    final WallpaperInfo wallpaperInfo2 = wallpaperInfo;
                    Asset asset2 = asset;
                    final Point point2 = screenSize;
                    final WallpaperPersister.SetWallpaperCallback setWallpaperCallback2 = setWallpaperCallback;
                    Objects.requireNonNull(defaultWallpaperPersister);
                    int i3 = point.x;
                    if (i3 < point2.x || point.y < point2.y) {
                        asset2.decodeBitmap(i3, point.y, new Asset.BitmapReceiver() { // from class: com.android.wallpaper.module.DefaultWallpaperPersister.5
                            @Override // com.android.wallpaper.asset.Asset.BitmapReceiver
                            public void onBitmapDecoded(Bitmap bitmap) {
                                if (bitmap == null) {
                                    setWallpaperCallback2.onError(null);
                                    return;
                                }
                                DefaultWallpaperPersister defaultWallpaperPersister2 = DefaultWallpaperPersister.this;
                                WallpaperInfo wallpaperInfo3 = wallpaperInfo2;
                                Point point3 = point2;
                                WallpaperPersister.SetWallpaperCallback setWallpaperCallback3 = setWallpaperCallback2;
                                Objects.requireNonNull(defaultWallpaperPersister2);
                                SetWallpaperTask setWallpaperTask = new SetWallpaperTask(wallpaperInfo3, bitmap, 2, setWallpaperCallback3);
                                if (setWallpaperTask.mStretchSize == null) {
                                    setWallpaperTask.mFillSize = point3;
                                    setWallpaperTask.execute(new Void[0]);
                                    return;
                                }
                                throw new IllegalArgumentException("Can't pass a fill size option if a stretch size is already set.");
                            }
                        });
                        return;
                    }
                    int i4 = point.x;
                    int i5 = (i4 - point2.x) / 2;
                    int i6 = point.y;
                    int i7 = (i6 - point2.y) / 2;
                    asset2.decodeBitmapRegion(new Rect(i5, i7, i4 - i5, i6 - i7), point2.x, point2.y, false, new Asset.BitmapReceiver() { // from class: com.android.wallpaper.module.DefaultWallpaperPersister$$ExternalSyntheticLambda0
                        @Override // com.android.wallpaper.asset.Asset.BitmapReceiver
                        public final void onBitmapDecoded(Bitmap bitmap) {
                            DefaultWallpaperPersister.this.setIndividualWallpaper(wallpaperInfo2, bitmap, 2, setWallpaperCallback2);
                        }
                    });
                } else if (i2 == 1) {
                    DefaultWallpaperPersister defaultWallpaperPersister2 = DefaultWallpaperPersister.this;
                    WallpaperInfo wallpaperInfo3 = wallpaperInfo;
                    Asset asset3 = asset;
                    Point point3 = screenSize;
                    WallpaperPersister.SetWallpaperCallback setWallpaperCallback3 = setWallpaperCallback;
                    Objects.requireNonNull(defaultWallpaperPersister2);
                    float max = Math.max(point3.x / point.x, point3.y / point.y);
                    int i8 = (int) (point.x * max);
                    int i9 = (int) (point.y * max);
                    int i10 = (i8 - point3.x) / 2;
                    int i11 = (i9 - point3.y) / 2;
                    defaultWallpaperPersister2.setIndividualWallpaper(wallpaperInfo3, asset3, new Rect(i10, i11, i8 - i10, i9 - i11), max, 2, setWallpaperCallback3);
                } else if (i2 != 2) {
                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Unsupported wallpaper position option specified: ");
                    m.append(i);
                    Log.e("WallpaperPersister", m.toString());
                    setWallpaperCallback.onError(null);
                } else {
                    Asset asset4 = asset;
                    Point point4 = screenSize;
                    asset4.decodeBitmap(point4.x, point4.y, new Asset.BitmapReceiver() { // from class: com.android.wallpaper.module.DefaultWallpaperPersister.4.1
                        @Override // com.android.wallpaper.asset.Asset.BitmapReceiver
                        public void onBitmapDecoded(Bitmap bitmap) {
                            AnonymousClass4 r7 = AnonymousClass4.this;
                            DefaultWallpaperPersister defaultWallpaperPersister3 = DefaultWallpaperPersister.this;
                            WallpaperInfo wallpaperInfo4 = wallpaperInfo;
                            Point point5 = screenSize;
                            WallpaperPersister.SetWallpaperCallback setWallpaperCallback4 = setWallpaperCallback;
                            Objects.requireNonNull(defaultWallpaperPersister3);
                            SetWallpaperTask setWallpaperTask = new SetWallpaperTask(wallpaperInfo4, bitmap, 2, setWallpaperCallback4);
                            if (setWallpaperTask.mFillSize == null) {
                                setWallpaperTask.mStretchSize = point5;
                                setWallpaperTask.execute(new Void[0]);
                                return;
                            }
                            throw new IllegalArgumentException("Can't pass a stretch size option if a fill size is already set.");
                        }
                    });
                }
            }
        });
    }

    public boolean setWallpaperInRotation(Bitmap bitmap, List<String> list, int i, int i2, String str, String str2) {
        int cropAndSetWallpaperBitmapInRotationStatic = cropAndSetWallpaperBitmapInRotationStatic(bitmap, list, str, str2);
        if (cropAndSetWallpaperBitmapInRotationStatic == 0) {
            return false;
        }
        saveStaticWallpaperMetadata(list, str, i, i2, str2, cropAndSetWallpaperBitmapInRotationStatic);
        return true;
    }

    /* loaded from: classes.dex */
    public class SetWallpaperTask extends AsyncTask<Void, Void, Boolean> {
        public Bitmap mBitmap;
        public final WallpaperPersister.SetWallpaperCallback mCallback;
        public final int mDestination;
        public Point mFillSize;
        public InputStream mInputStream;
        public Point mStretchSize;
        public final WallpaperInfo mWallpaper;

        public SetWallpaperTask(WallpaperInfo wallpaperInfo, Bitmap bitmap, int i, WallpaperPersister.SetWallpaperCallback setWallpaperCallback) {
            this.mWallpaper = wallpaperInfo;
            this.mBitmap = bitmap;
            this.mDestination = i;
            this.mCallback = setWallpaperCallback;
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Removed duplicated region for block: B:29:0x012e  */
        /* JADX WARN: Removed duplicated region for block: B:43:0x019f  */
        /* JADX WARN: Removed duplicated region for block: B:46:0x0243  */
        /* JADX WARN: Removed duplicated region for block: B:47:0x0248  */
        /* JADX WARN: Removed duplicated region for block: B:71:0x0308  */
        /* JADX WARN: Removed duplicated region for block: B:79:0x0329  */
        /* JADX WARN: Removed duplicated region for block: B:85:0x0321 A[EXC_TOP_SPLITTER, SYNTHETIC] */
        /* JADX WARN: Removed duplicated region for block: B:97:0x02d5 A[EXC_TOP_SPLITTER, SYNTHETIC] */
        /* JADX WARN: Type inference failed for: r13v10, types: [android.graphics.Bitmap] */
        /* JADX WARN: Type inference failed for: r13v11 */
        /* JADX WARN: Type inference failed for: r13v12 */
        /* JADX WARN: Type inference failed for: r13v2 */
        /* JADX WARN: Type inference failed for: r13v4, types: [android.graphics.Bitmap] */
        /* JADX WARN: Type inference failed for: r13v7 */
        /* JADX WARN: Type inference failed for: r13v9 */
        @Override // android.os.AsyncTask
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public java.lang.Boolean doInBackground(java.lang.Void[] r26) {
            /*
                Method dump skipped, instructions count: 812
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.wallpaper.module.DefaultWallpaperPersister.SetWallpaperTask.doInBackground(java.lang.Object[]):java.lang.Object");
        }

        @Override // android.os.AsyncTask
        public void onPostExecute(Boolean bool) {
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
                DefaultWallpaperPersister.this.mWallpaperChangedNotifier.notifyWallpaperChanged();
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

    public final void setIndividualWallpaper(WallpaperInfo wallpaperInfo, Bitmap bitmap, int i, WallpaperPersister.SetWallpaperCallback setWallpaperCallback) {
        new SetWallpaperTask(wallpaperInfo, bitmap, i, setWallpaperCallback).execute(new Void[0]);
    }
}
