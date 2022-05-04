package com.google.android.apps.wallpaper.model;

import android.app.WallpaperInfo;
import android.content.Context;
import android.content.pm.ServiceInfo;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.asset.LiveWallpaperThumbAsset;
import com.android.wallpaper.model.LiveWallpaperInfo;
import com.google.android.apps.wallpaper.asset.GoogleLiveWallpaperThumbAsset;
/* loaded from: classes.dex */
public class GoogleLiveWallpaperInfo extends LiveWallpaperInfo {
    public static final Parcelable.Creator<GoogleLiveWallpaperInfo> CREATOR = new Parcelable.Creator<GoogleLiveWallpaperInfo>() { // from class: com.google.android.apps.wallpaper.model.GoogleLiveWallpaperInfo.1
        @Override // android.os.Parcelable.Creator
        public final GoogleLiveWallpaperInfo createFromParcel(Parcel parcel) {
            return new GoogleLiveWallpaperInfo(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public final GoogleLiveWallpaperInfo[] newArray(int i) {
            return new GoogleLiveWallpaperInfo[i];
        }
    };

    public GoogleLiveWallpaperInfo(WallpaperInfo wallpaperInfo) {
        super(wallpaperInfo, true, null);
    }

    public GoogleLiveWallpaperInfo(WallpaperInfo wallpaperInfo, int i) {
        super(wallpaperInfo, false, null);
    }

    @Override // com.android.wallpaper.model.LiveWallpaperInfo, com.android.wallpaper.model.WallpaperInfo
    public final Asset getThumbAsset(Context context) {
        Uri uri;
        Bundle bundle;
        String string;
        if (this.mThumbAsset == null) {
            ServiceInfo serviceInfo = this.mInfo.getServiceInfo();
            if (serviceInfo == null || (bundle = serviceInfo.metaData) == null || (string = bundle.getString("android.service.wallpaper.thumbnail")) == null) {
                uri = null;
            } else {
                uri = Uri.parse(string);
            }
            if (uri != null) {
                LiveWallpaperThumbAsset liveWallpaperThumbAsset = new LiveWallpaperThumbAsset(context, this.mInfo);
                liveWallpaperThumbAsset.mUri = uri;
                this.mThumbAsset = liveWallpaperThumbAsset;
            } else {
                this.mThumbAsset = new GoogleLiveWallpaperThumbAsset(context, this.mInfo);
            }
        }
        return this.mThumbAsset;
    }

    public GoogleLiveWallpaperInfo(Parcel parcel) {
        super(parcel);
    }
}
