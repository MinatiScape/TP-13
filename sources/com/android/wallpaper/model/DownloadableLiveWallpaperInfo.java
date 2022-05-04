package com.android.wallpaper.model;

import android.app.Activity;
import android.app.WallpaperInfo;
import android.content.ComponentName;
import android.content.ContentProviderClient;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.RemoteException;
import android.util.Log;
import com.android.wallpaper.util.ActivityUtils;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class DownloadableLiveWallpaperInfo extends LiveWallpaperInfo {
    public static final Parcelable.Creator<DownloadableLiveWallpaperInfo> CREATOR = new Parcelable.Creator<DownloadableLiveWallpaperInfo>() { // from class: com.android.wallpaper.model.DownloadableLiveWallpaperInfo.1
        @Override // android.os.Parcelable.Creator
        public final DownloadableLiveWallpaperInfo createFromParcel(Parcel parcel) {
            return new DownloadableLiveWallpaperInfo(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public final DownloadableLiveWallpaperInfo[] newArray(int i) {
            return new DownloadableLiveWallpaperInfo[i];
        }
    };
    public static final Uri WALLPAPERS_URI = Uri.parse("content://com.google.pixel.livewallpaper.provider/wallpapers");
    public static final String[] COLUMNS = {"to_be_installed_wallpaper"};

    public DownloadableLiveWallpaperInfo(WallpaperInfo wallpaperInfo, String str) {
        super(wallpaperInfo, false, str);
    }

    public DownloadableLiveWallpaperInfo(Parcel parcel) {
        super(parcel);
    }

    public static ArrayList getToBeInstalledComponent(Context context) {
        Uri uri;
        ContentProviderClient acquireUnstableContentProviderClient;
        Cursor query;
        ArrayList arrayList = new ArrayList();
        try {
            ContentResolver contentResolver = context.getContentResolver();
            uri = WALLPAPERS_URI;
            acquireUnstableContentProviderClient = contentResolver.acquireUnstableContentProviderClient(uri);
        } catch (Exception e) {
            Log.e("DownloadLiveWallpaperInfo", "ContentProviderClient close internal exception: ", e);
        }
        if (acquireUnstableContentProviderClient == null) {
            Log.w("DownloadLiveWallpaperInfo", "Can't get to be installed with null ContentProviderClient");
            if (acquireUnstableContentProviderClient != null) {
                acquireUnstableContentProviderClient.close();
            }
            return arrayList;
        }
        try {
            query = acquireUnstableContentProviderClient.query(uri, null, null, null, null);
            try {
            } catch (Throwable th) {
                if (query != null) {
                    try {
                        query.close();
                    } catch (Throwable th2) {
                        th.addSuppressed(th2);
                    }
                }
                throw th;
            }
        } catch (RemoteException e2) {
            Log.e("DownloadLiveWallpaperInfo", "Query to be installed exception: ", e2);
        }
        if (query == null) {
            Log.w("DownloadLiveWallpaperInfo", "Can't get to be installed with null cursor");
            if (query != null) {
                query.close();
            }
            acquireUnstableContentProviderClient.close();
            return arrayList;
        } else if (query.moveToFirst()) {
            do {
                arrayList.add(query.getString(query.getColumnIndex(COLUMNS[0])));
            } while (query.moveToNext());
            query.close();
            acquireUnstableContentProviderClient.close();
            return arrayList;
        } else {
            query.close();
            acquireUnstableContentProviderClient.close();
            return arrayList;
        }
    }

    @Override // com.android.wallpaper.model.LiveWallpaperInfo, com.android.wallpaper.model.WallpaperInfo
    public final void showPreview(Activity activity, InlinePreviewIntentFactory inlinePreviewIntentFactory, int i) {
        if (!getToBeInstalledComponent(activity).contains(this.mInfo.getComponent().flattenToString())) {
            super.showPreview(activity, inlinePreviewIntentFactory, i);
            return;
        }
        WallpaperInfo wallpaperInfo = this.mInfo;
        Intent intent = new Intent("com.google.pixel.livewallpaper.action.DOWNLOAD_LIVE_WALLPAPER");
        intent.setComponent(new ComponentName("com.google.pixel.livewallpaper", "com.google.pixel.livewallpaper.split.FeatureActivity"));
        intent.addFlags(805306368);
        intent.putExtra("android.live_wallpaper.info", wallpaperInfo);
        boolean z = false;
        if (activity.getPackageManager().queryIntentActivities(intent, 0).size() > 0) {
            z = true;
        }
        if (!z) {
            WallpaperInfo wallpaperInfo2 = this.mInfo;
            Intent intent2 = new Intent("com.google.pixel.livewallpaper.action.DOWNLOAD_LIVE_WALLPAPER");
            intent2.setComponent(new ComponentName("com.google.pixel.livewallpaper", "com.google.pixel.livewallpaper.split.DownloadActivity"));
            intent2.putExtra("android.live_wallpaper.info", wallpaperInfo2);
            ActivityUtils.startActivityForResultSafely(activity, intent2, i);
            return;
        }
        activity.startActivityForResult(inlinePreviewIntentFactory.newIntent(activity, this), i);
    }
}
