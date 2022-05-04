package com.google.android.apps.wallpaper.backdrop;

import android.content.Context;
import android.net.Uri;
import android.os.AsyncTask;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import androidx.cardview.R$style;
import com.android.volley.VolleyError;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.model.WallpaperCategory;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.model.WallpaperReceiver;
import com.android.wallpaper.model.WallpaperRotationInitializer;
import com.android.wallpaper.module.GoogleWallpapersInjector;
import com.android.wallpaper.network.ServerFetcher$ResultsCallback;
import com.google.android.apps.wallpaper.asset.NetworkAsset;
import com.google.android.apps.wallpaper.backdrop.BackdropWallpaperRotationInitializer;
import com.google.android.apps.wallpaper.model.NetworkWallpaperInfo;
import com.google.chrome.dongle.imax.wallpaper2.protos.ImaxWallpaperProto$Attribution;
import com.google.chrome.dongle.imax.wallpaper2.protos.ImaxWallpaperProto$Collection;
import com.google.chrome.dongle.imax.wallpaper2.protos.ImaxWallpaperProto$Image;
import com.google.protobuf.Internal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes.dex */
public final class BackdropCategory extends WallpaperCategory {
    public final String mCollectionName;
    public final FifeImageUrlFactory mFifeImageUrlFactory;
    public final ArrayList mPendingWallpapersReceivers;
    public BackdropWallpaperRotationInitializer mRotationInitializer;
    public NetworkAsset mThumbAsset;
    public final String mThumbUrl;

    /* loaded from: classes.dex */
    public class ParseBackdropImagesAsyncTask extends AsyncTask<Void, Void, Void> {
        public final Context mAppContext;
        public final List<ImaxWallpaperProto$Image> mBackdropImages;
        public final String mCollectionId;
        public final List<WallpaperInfo> mWallpapers;

        public ParseBackdropImagesAsyncTask(Internal.ProtobufList protobufList, Context context, List list, String str) {
            this.mBackdropImages = protobufList;
            this.mAppContext = context.getApplicationContext();
            this.mWallpapers = list;
            this.mCollectionId = str;
        }

        @Override // android.os.AsyncTask
        public final Void doInBackground(Void[] voidArr) {
            synchronized (BackdropCategory.this.mWallpapersLock) {
                if (this.mWallpapers.size() > 0) {
                    return null;
                }
                for (ImaxWallpaperProto$Image imaxWallpaperProto$Image : this.mBackdropImages) {
                    ArrayList arrayList = new ArrayList();
                    for (ImaxWallpaperProto$Attribution imaxWallpaperProto$Attribution : imaxWallpaperProto$Image.getAttributionList()) {
                        arrayList.add(imaxWallpaperProto$Attribution.getText());
                    }
                    if (arrayList.size() == 0) {
                        arrayList.add(BackdropCategory.this.mTitle);
                    }
                    Uri createFullSizedUri = BackdropCategory.this.mFifeImageUrlFactory.createFullSizedUri(this.mAppContext, imaxWallpaperProto$Image.getImageUrl());
                    Uri createThumbUri = BackdropCategory.this.mFifeImageUrlFactory.createThumbUri(this.mAppContext, imaxWallpaperProto$Image.getImageUrl());
                    Uri createTinyUri = BackdropCategory.this.mFifeImageUrlFactory.createTinyUri(imaxWallpaperProto$Image.getImageUrl());
                    FifeImageUrlFactory fifeImageUrlFactory = BackdropCategory.this.mFifeImageUrlFactory;
                    Context context = this.mAppContext;
                    String imageUrl = imaxWallpaperProto$Image.getImageUrl();
                    fifeImageUrlFactory.getClass();
                    this.mWallpapers.add(new NetworkWallpaperInfo(imaxWallpaperProto$Image.getImageUrl(), createFullSizedUri, createThumbUri, createTinyUri, FifeImageUrlFactory.createDesktopUri(context, imageUrl), arrayList, imaxWallpaperProto$Image.getActionUrl(), this.mCollectionId, String.valueOf(imaxWallpaperProto$Image.getAssetId()), imaxWallpaperProto$Image.getType().getNumber()));
                }
                return null;
            }
        }

        @Override // android.os.AsyncTask
        public final void onPostExecute(Void r4) {
            synchronized (BackdropCategory.this.mWallpapersLock) {
                Iterator it = BackdropCategory.this.mPendingWallpapersReceivers.iterator();
                while (it.hasNext()) {
                    WallpaperReceiver wallpaperReceiver = (WallpaperReceiver) it.next();
                    if (wallpaperReceiver != null) {
                        wallpaperReceiver.onWallpapersReceived(this.mWallpapers);
                    }
                }
                BackdropCategory.this.mPendingWallpapersReceivers.clear();
            }
        }
    }

    @Override // com.android.wallpaper.model.WallpaperCategory, com.android.wallpaper.model.Category
    public final Asset getThumbnail(Context context) {
        if (this.mThumbAsset == null) {
            this.mThumbAsset = new NetworkAsset(context, this.mFifeImageUrlFactory.createThumbUri(context, this.mThumbUrl), this.mFifeImageUrlFactory.createTinyUri(this.mThumbUrl));
        }
        return this.mThumbAsset;
    }

    @Override // com.android.wallpaper.model.Category
    public final WallpaperRotationInitializer getWallpaperRotationInitializer() {
        BackdropWallpaperRotationInitializer.Factory factory;
        String str = this.mCollectionId;
        if (str != null && str.endsWith("_no_rotate")) {
            return null;
        }
        if (this.mRotationInitializer == null) {
            synchronized (WallpaperRotationInitializerFactory.class) {
                if (WallpaperRotationInitializerFactory.sInstance == null) {
                    WallpaperRotationInitializerFactory.sInstance = new BackdropWallpaperRotationInitializer.Factory();
                }
                factory = WallpaperRotationInitializerFactory.sInstance;
            }
            String str2 = this.mCollectionId;
            String str3 = this.mCollectionName;
            factory.getClass();
            this.mRotationInitializer = new BackdropWallpaperRotationInitializer(str2, str3);
        }
        return this.mRotationInitializer;
    }

    public BackdropCategory(ImaxWallpaperProto$Collection imaxWallpaperProto$Collection, int i) {
        super(imaxWallpaperProto$Collection.getCollectionName(), imaxWallpaperProto$Collection.getCollectionId(), new ArrayList(), i);
        this.mCollectionName = imaxWallpaperProto$Collection.getCollectionName();
        this.mThumbUrl = imaxWallpaperProto$Collection.getPreview().getImageUrl();
        if (FifeImageUrlFactory.sInstance == null) {
            FifeImageUrlFactory.sInstance = new FifeImageUrlFactory();
        }
        this.mFifeImageUrlFactory = FifeImageUrlFactory.sInstance;
        this.mPendingWallpapersReceivers = new ArrayList();
    }

    /* JADX WARN: Type inference failed for: r7v4, types: [com.google.android.apps.wallpaper.backdrop.BackdropCategory$2] */
    @Override // com.android.wallpaper.model.WallpaperCategory
    public final void fetchWallpapers(final Context context, WallpaperReceiver wallpaperReceiver, boolean z) {
        boolean z2;
        BackdropFetcher serverFetcher = ((GoogleWallpapersInjector) R$style.getInjector()).getServerFetcher(context);
        synchronized (this.mWallpapersLock) {
            final List<WallpaperInfo> list = this.mWallpapers;
            if (list.size() <= 0 || wallpaperReceiver == null || z) {
                if (z) {
                    list.clear();
                }
                if (this.mPendingWallpapersReceivers.size() > 0) {
                    z2 = true;
                } else {
                    z2 = false;
                }
                this.mPendingWallpapersReceivers.add(wallpaperReceiver);
                if (!z2) {
                    final String str = this.mCollectionId;
                    serverFetcher.fetchImagesInCollection(context, str, new ServerFetcher$ResultsCallback<ImaxWallpaperProto$Image>() { // from class: com.google.android.apps.wallpaper.backdrop.BackdropCategory.2
                        @Override // com.android.wallpaper.network.ServerFetcher$ResultsCallback
                        public final void onError(VolleyError volleyError) {
                            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Unable to fetch Backdrop wallpapers for the collection ID: ");
                            m.append(BackdropCategory.this.mCollectionId);
                            Log.e("BackdropCategory", m.toString(), volleyError);
                        }

                        @Override // com.android.wallpaper.network.ServerFetcher$ResultsCallback
                        public final void onSuccess(Internal.ProtobufList protobufList) {
                            new ParseBackdropImagesAsyncTask(protobufList, context, list, str).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
                        }
                    });
                    return;
                }
                return;
            }
            wallpaperReceiver.onWallpapersReceived(list);
        }
    }
}
