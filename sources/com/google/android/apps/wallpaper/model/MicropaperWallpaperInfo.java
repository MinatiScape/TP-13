package com.google.android.apps.wallpaper.model;

import android.app.WallpaperInfo;
import android.content.ComponentName;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.android.wallpaper.model.ImageWallpaperInfo;
import java.util.List;
import wireless.android.learning.acmi.micropaper.frontend.MicropaperFrontend;
/* loaded from: classes.dex */
public class MicropaperWallpaperInfo extends ImageWallpaperInfo {
    public static final Parcelable.Creator<MicropaperWallpaperInfo> CREATOR = new Parcelable.Creator<MicropaperWallpaperInfo>() { // from class: com.google.android.apps.wallpaper.model.MicropaperWallpaperInfo.1
        @Override // android.os.Parcelable.Creator
        public final MicropaperWallpaperInfo createFromParcel(Parcel parcel) {
            return new MicropaperWallpaperInfo(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public final MicropaperWallpaperInfo[] newArray(int i) {
            return new MicropaperWallpaperInfo[i];
        }
    };
    public static final Uri sAssetUri = new Uri.Builder().scheme("content").authority("com.google.pixel.dynamicwallpapers.parameters").appendPath("home").build();
    public final WallpaperInfo mInfo;

    public MicropaperWallpaperInfo(WallpaperInfo wallpaperInfo) {
        super(sAssetUri, 0);
        this.mInfo = wallpaperInfo;
    }

    static {
        ComponentName componentName = MicropaperFrontend.MICROPAPER_SERVICE;
    }

    @Override // com.android.wallpaper.model.ImageWallpaperInfo, com.android.wallpaper.model.WallpaperInfo
    public final List<String> getAttributions(Context context) {
        ComponentName componentName = MicropaperFrontend.MICROPAPER_SERVICE;
        return context.getContentResolver().call(new Uri.Builder().scheme("content").authority("com.google.pixel.dynamicwallpapers.parameters").build(), "PROVIDER_GET_HOME_IMAGE_LABELS", (String) null, (Bundle) null).getStringArrayList("EXTRA_IMAGE_LABELS");
    }

    public MicropaperWallpaperInfo(Parcel parcel) {
        super(parcel);
        this.mInfo = (WallpaperInfo) parcel.readParcelable(WallpaperInfo.class.getClassLoader());
    }

    @Override // com.android.wallpaper.model.ImageWallpaperInfo, com.android.wallpaper.model.WallpaperInfo, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeParcelable(this.mInfo, 0);
    }
}
