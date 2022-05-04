package com.google.android.apps.wallpaper.backdrop;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Looper;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import androidx.appcompat.R$layout;
import androidx.cardview.R$style;
import com.android.systemui.shared.R;
import com.android.volley.NetworkResponse;
import com.android.volley.NoConnectionError;
import com.android.volley.ParseError;
import com.android.volley.ServerError;
import com.android.volley.TimeoutError;
import com.android.volley.VolleyError;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.module.DefaultWallpaperPersister;
import com.android.wallpaper.module.GoogleWallpapersInjector;
import com.android.wallpaper.module.Injector;
import com.android.wallpaper.module.WallpaperPersister;
import com.android.wallpaper.module.WallpaperPreferences;
import com.android.wallpaper.network.ServerFetcher$NextImageInCollectionCallback;
import com.android.wallpaper.util.DiskBasedLogger;
import com.bumptech.glide.request.target.SimpleTarget;
import com.bumptech.glide.request.transition.Transition;
import com.google.android.apps.wallpaper.module.CompositeUserEventLogger;
import com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences;
import com.google.android.gms.common.util.zzh;
import com.google.chrome.dongle.imax.wallpaper2.protos.ImaxWallpaperProto$Image;
import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.ExecutorService;
/* loaded from: classes.dex */
public final class BackdropWallpaperRotator {

    /* loaded from: classes.dex */
    public static class BackdropRotationAsyncTask extends AsyncTask<Void, Void, Void> {
        public Context mAppContext;
        public String mCollectionId;
        public String mCollectionName;
        public RotationListener mListener;
        public String mResumeToken;

        @Override // android.os.AsyncTask
        public final Void doInBackground(Void[] voidArr) {
            BackdropWallpaperRotator.fetchAndSetNextWallpaper(this.mAppContext, this.mCollectionId, this.mCollectionName, this.mResumeToken, this.mListener);
            return null;
        }

        public BackdropRotationAsyncTask(Context context, String str, String str2, String str3, RotationListener rotationListener) {
            this.mAppContext = context;
            this.mCollectionId = str;
            this.mCollectionName = str2;
            this.mListener = rotationListener;
            this.mResumeToken = str3;
        }
    }

    /* loaded from: classes.dex */
    public static class NextImageCallback implements ServerFetcher$NextImageInCollectionCallback {
        public final Context mAppContext;
        public final String mCollectionId;
        public final String mCollectionName;
        public final RotationListener mListener;
        public final WallpaperPreferences mPreferences;
        public final String mResumeToken;

        @Override // com.android.wallpaper.network.ServerFetcher$NextImageInCollectionCallback
        public final void onError(VolleyError volleyError) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Volley error of type ");
            m.append(volleyError.getClass().getSimpleName());
            m.append(" requesting next wallpaper metadata for collectionId: ");
            m.append(this.mCollectionId);
            m.append(" and collectionName: ");
            m.append(this.mCollectionName);
            m.append(" with resumeToken: ");
            m.append(this.mResumeToken);
            m.append(", rescheduling this task.");
            DiskBasedLogger.e("BackdropWPRotator", m.toString(), this.mAppContext);
            DiskBasedLogger.e("BackdropWPRotator", "Detailed error message: " + volleyError.getMessage(), this.mAppContext);
            NetworkResponse networkResponse = volleyError.networkResponse;
            if (networkResponse != null) {
                StringBuilder m2 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Volley network response with status code: ");
                m2.append(networkResponse.statusCode);
                m2.append(" and headers: ");
                m2.append(networkResponse.headers);
                m2.append(" and network roundtrip time of ");
                m2.append(networkResponse.networkTimeMs);
                m2.append("ms");
                DiskBasedLogger.e("BackdropWPRotator", m2.toString(), this.mAppContext);
            }
            CompositeUserEventLogger userEventLogger = R$style.getInjector().getUserEventLogger(this.mAppContext);
            if (volleyError instanceof NoConnectionError) {
                userEventLogger.logDailyWallpaperMetadataRequestFailure(1);
            } else if (volleyError instanceof ParseError) {
                userEventLogger.logDailyWallpaperMetadataRequestFailure(2);
            } else if (volleyError instanceof ServerError) {
                userEventLogger.logDailyWallpaperMetadataRequestFailure(3);
            } else if (volleyError instanceof TimeoutError) {
                userEventLogger.logDailyWallpaperMetadataRequestFailure(4);
            } else {
                userEventLogger.logDailyWallpaperMetadataRequestFailure(0);
            }
            BackdropWallpaperRotator.m35$$Nest$smdoneUpdatingWithStatus(this.mAppContext, 1);
            this.mListener.onError();
        }

        @Override // com.android.wallpaper.network.ServerFetcher$NextImageInCollectionCallback
        public final void onSuccess(final ImaxWallpaperProto$Image imaxWallpaperProto$Image, final String str) {
            if (FifeImageUrlFactory.sInstance == null) {
                FifeImageUrlFactory.sInstance = new FifeImageUrlFactory();
            }
            FifeImageUrlFactory fifeImageUrlFactory = FifeImageUrlFactory.sInstance;
            Context context = this.mAppContext;
            String imageUrl = imaxWallpaperProto$Image.getImageUrl();
            fifeImageUrlFactory.getClass();
            final Uri createRotatingWallpaperUri = FifeImageUrlFactory.createRotatingWallpaperUri(context, imageUrl);
            final Injector injector = R$style.getInjector();
            injector.getRequester(this.mAppContext).loadImageBitmap(createRotatingWallpaperUri, new SimpleTarget<Bitmap>() { // from class: com.google.android.apps.wallpaper.backdrop.BackdropWallpaperRotator.NextImageCallback.1
                @Override // com.bumptech.glide.request.target.Target
                public final void onLoadFailed(Drawable drawable) {
                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Wallpaper bitmap load failed for FIFE URL: ");
                    m.append(createRotatingWallpaperUri);
                    m.append(" from collection with collectionId: ");
                    m.append(NextImageCallback.this.mCollectionId);
                    m.append(" with new resumeToken: ");
                    m.append(str);
                    m.append(", rescheduling this task.");
                    DiskBasedLogger.e("BackdropWPRotator", m.toString(), NextImageCallback.this.mAppContext);
                    BackdropWallpaperRotator.m35$$Nest$smdoneUpdatingWithStatus(NextImageCallback.this.mAppContext, 2);
                    NextImageCallback.this.mListener.onError();
                }

                @Override // com.bumptech.glide.request.target.Target
                public final void onResourceReady(Object obj, Transition transition) {
                    int i;
                    int i2;
                    boolean z;
                    Bitmap bitmap = (Bitmap) obj;
                    WallpaperPersister wallpaperPersister = injector.getWallpaperPersister(NextImageCallback.this.mAppContext);
                    ArrayList parseAttributions = R$layout.parseAttributions(imaxWallpaperProto$Image.getAttributionList(), NextImageCallback.this.mCollectionName);
                    int i3 = 2;
                    if (imaxWallpaperProto$Image.getType().getNumber() == 2) {
                        i = R.string.build_case;
                    } else {
                        ExecutorService executorService = WallpaperInfo.sExecutor;
                        i = R.string.explore;
                    }
                    int i4 = i;
                    if (imaxWallpaperProto$Image.getType().getNumber() == 2) {
                        i2 = R.drawable.ic_case_24px;
                    } else {
                        ExecutorService executorService2 = WallpaperInfo.sExecutor;
                        i2 = R.drawable.ic_explore_24px;
                    }
                    int i5 = i2;
                    String actionUrl = imaxWallpaperProto$Image.getActionUrl();
                    String str2 = NextImageCallback.this.mCollectionId;
                    DefaultWallpaperPersister defaultWallpaperPersister = (DefaultWallpaperPersister) wallpaperPersister;
                    int cropAndSetWallpaperBitmapInRotationStatic = defaultWallpaperPersister.cropAndSetWallpaperBitmapInRotationStatic(bitmap, parseAttributions, actionUrl, str2);
                    if (cropAndSetWallpaperBitmapInRotationStatic == 0) {
                        z = false;
                    } else {
                        defaultWallpaperPersister.saveStaticWallpaperMetadata(parseAttributions, actionUrl, i4, i5, str2, cropAndSetWallpaperBitmapInRotationStatic);
                        z = true;
                    }
                    if (!z) {
                        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Unable to set wallpaper in rotation for wallpaper from FIFE URL: ");
                        m.append(createRotatingWallpaperUri);
                        m.append(" from collection with collectionId: ");
                        m.append(NextImageCallback.this.mCollectionId);
                        m.append(" with new resumeToken: ");
                        m.append(str);
                        m.append(", rescheduling this task.");
                        DiskBasedLogger.e("BackdropWPRotator", m.toString(), NextImageCallback.this.mAppContext);
                        BackdropWallpaperRotator.m35$$Nest$smdoneUpdatingWithStatus(NextImageCallback.this.mAppContext, 3);
                        NextImageCallback.this.mListener.onError();
                        return;
                    }
                    NextImageCallback.this.mPreferences.setLastAppActiveTimestamp(new Date().getTime());
                    BackdropWallpaperRotator.m35$$Nest$smdoneUpdatingWithStatus(NextImageCallback.this.mAppContext, 0);
                    zzh wallpaperStatusChecker = R$style.getInjector().getWallpaperStatusChecker();
                    Context context2 = NextImageCallback.this.mAppContext;
                    wallpaperStatusChecker.getClass();
                    boolean isLockWallpaperSet = zzh.isLockWallpaperSet(context2);
                    NextImageCallback nextImageCallback = NextImageCallback.this;
                    WallpaperPreferences wallpaperPreferences = nextImageCallback.mPreferences;
                    if (isLockWallpaperSet) {
                        i3 = 0;
                    }
                    wallpaperPreferences.updateDailyWallpaperSet(i3, nextImageCallback.mCollectionId, String.valueOf(imaxWallpaperProto$Image.getAssetId()));
                    NextImageCallback.this.mListener.onSuccess(str);
                }
            });
        }

        public NextImageCallback(Context context, String str, String str2, String str3, RotationListener rotationListener, WallpaperPreferences wallpaperPreferences) {
            this.mAppContext = context;
            this.mCollectionId = str;
            this.mCollectionName = str2;
            this.mResumeToken = str3;
            this.mListener = rotationListener;
            this.mPreferences = wallpaperPreferences;
        }
    }

    /* loaded from: classes.dex */
    public interface RotationListener {
        void onError();

        void onSuccess(String str);
    }

    /* renamed from: -$$Nest$smdoneUpdatingWithStatus  reason: not valid java name */
    public static void m35$$Nest$smdoneUpdatingWithStatus(Context context, int i) {
        Injector injector = R$style.getInjector();
        GoogleWallpaperPreferences preferences = injector.getPreferences(context);
        CompositeUserEventLogger userEventLogger = injector.getUserEventLogger(context);
        preferences.setPendingDailyWallpaperUpdateStatus(0);
        userEventLogger.logDailyWallpaperSetNextWallpaperResult(i);
    }

    public static void fetchAndSetNextWallpaper(Context context, String str, String str2, String str3, RotationListener rotationListener) {
        Injector injector = R$style.getInjector();
        GoogleWallpaperPreferences preferences = injector.getPreferences(context);
        preferences.setPendingDailyWallpaperUpdateStatus(1);
        ((GoogleWallpapersInjector) injector).getServerFetcher(context).fetchNextImageInCollection(context, str, str3, new NextImageCallback(context, str, str2, str3, rotationListener, preferences));
    }

    public static void updateWallpaper(Context context, String str, String str2, String str3, RotationListener rotationListener) {
        boolean z;
        if (Looper.myLooper() == Looper.getMainLooper()) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            new BackdropRotationAsyncTask(context, str, str2, str3, rotationListener).execute(new Void[0]);
        } else {
            fetchAndSetNextWallpaper(context, str, str2, str3, rotationListener);
        }
    }
}
