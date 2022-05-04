package com.android.wallpaper.model;

import android.app.Activity;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Log;
import com.android.systemui.shared.R;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.asset.ResourceAsset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
/* loaded from: classes.dex */
public class AppResourceWallpaperInfo extends WallpaperInfo {
    public static final Parcelable.Creator<AppResourceWallpaperInfo> CREATOR = new Parcelable.Creator<AppResourceWallpaperInfo>() { // from class: com.android.wallpaper.model.AppResourceWallpaperInfo.1
        @Override // android.os.Parcelable.Creator
        public final AppResourceWallpaperInfo createFromParcel(Parcel parcel) {
            return new AppResourceWallpaperInfo(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public final AppResourceWallpaperInfo[] newArray(int i) {
            return new AppResourceWallpaperInfo[i];
        }
    };
    public ResourceAsset mAsset;
    public int mFullRes;
    public String mPackageName;
    public Resources mResources;
    public ResourceAsset mThumbAsset;
    public int mThumbRes;

    public AppResourceWallpaperInfo(String str, int i, int i2) {
        this.mPackageName = str;
        this.mThumbRes = i;
        this.mFullRes = i2;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof AppResourceWallpaperInfo)) {
            return false;
        }
        AppResourceWallpaperInfo appResourceWallpaperInfo = (AppResourceWallpaperInfo) obj;
        return this.mPackageName.equals(appResourceWallpaperInfo.mPackageName) && this.mThumbRes == appResourceWallpaperInfo.mThumbRes && this.mFullRes == appResourceWallpaperInfo.mFullRes;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final List<String> getAttributions(Context context) {
        return Arrays.asList(context.getResources().getString(R.string.on_device_wallpaper_title));
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final int getBackupPermission() {
        return 0;
    }

    public static ArrayList getAll(Context context, ApplicationInfo applicationInfo, int i) {
        String[] stringArray;
        ArrayList arrayList = new ArrayList();
        try {
            Resources resourcesForApplication = context.getPackageManager().getResourcesForApplication(applicationInfo);
            for (String str : resourcesForApplication.getStringArray(i)) {
                int identifier = resourcesForApplication.getIdentifier(str, "drawable", applicationInfo.packageName);
                int identifier2 = resourcesForApplication.getIdentifier(str + "_small", "drawable", applicationInfo.packageName);
                if (!(identifier == 0 || identifier2 == 0)) {
                    arrayList.add(new AppResourceWallpaperInfo(applicationInfo.packageName, identifier2, identifier));
                }
            }
        } catch (PackageManager.NameNotFoundException unused) {
            Log.e("AppResource", "Hosting app package not found");
        }
        return arrayList;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final Asset getAsset(Context context) {
        if (this.mAsset == null) {
            Resources resources = this.mResources;
            if (resources == null) {
                try {
                    this.mResources = context.getPackageManager().getResourcesForApplication(this.mPackageName);
                } catch (PackageManager.NameNotFoundException unused) {
                    Log.e("AppResource", "Could not get app resources");
                }
                resources = this.mResources;
            }
            this.mAsset = new ResourceAsset(resources, this.mFullRes);
        }
        return this.mAsset;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final Asset getThumbAsset(Context context) {
        if (this.mThumbAsset == null) {
            Resources resources = this.mResources;
            if (resources == null) {
                try {
                    this.mResources = context.getPackageManager().getResourcesForApplication(this.mPackageName);
                } catch (PackageManager.NameNotFoundException unused) {
                    Log.e("AppResource", "Could not get app resources");
                }
                resources = this.mResources;
            }
            this.mThumbAsset = new ResourceAsset(resources, this.mThumbRes);
        }
        return this.mThumbAsset;
    }

    public final int hashCode() {
        return ((((this.mPackageName.hashCode() + 527) * 31) + this.mThumbRes) * 31) + this.mFullRes;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.mPlaceholderColor);
        parcel.writeString(this.mPackageName);
        parcel.writeInt(this.mThumbRes);
        parcel.writeInt(this.mFullRes);
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final String getCollectionId(Context context) {
        return context.getString(R.string.on_device_wallpaper_collection_id);
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final void showPreview(Activity activity, InlinePreviewIntentFactory inlinePreviewIntentFactory, int i) {
        activity.startActivityForResult(inlinePreviewIntentFactory.newIntent(activity, this), i);
    }

    public AppResourceWallpaperInfo(Parcel parcel) {
        super(parcel);
        this.mPackageName = parcel.readString();
        this.mThumbRes = parcel.readInt();
        this.mFullRes = parcel.readInt();
    }
}
