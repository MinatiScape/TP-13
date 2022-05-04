package com.android.wallpaper.model;

import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import com.android.systemui.flags.FlagManager;
import com.android.systemui.shared.R;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.asset.SystemStaticAsset;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public class SystemStaticWallpaperInfo extends WallpaperInfo {
    public static final Parcelable.Creator<SystemStaticWallpaperInfo> CREATOR = new Parcelable.Creator<SystemStaticWallpaperInfo>() { // from class: com.android.wallpaper.model.SystemStaticWallpaperInfo.1
        @Override // android.os.Parcelable.Creator
        public final SystemStaticWallpaperInfo createFromParcel(Parcel parcel) {
            return new SystemStaticWallpaperInfo(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public final SystemStaticWallpaperInfo[] newArray(int i) {
            return new SystemStaticWallpaperInfo[i];
        }
    };
    public final int mActionTypeResId;
    public String mActionUrl;
    public final int mActionUrlResId;
    public SystemStaticAsset mAsset;
    public ArrayList mAttributions;
    public final String mCollectionId;
    public final int mDrawableResId;
    public final String mPackageName;
    public Resources mResources;
    public final int mSubtitle1ResId;
    public final int mSubtitle2ResId;
    public final int mTitleResId;
    public final String mWallpaperId;

    public SystemStaticWallpaperInfo(String str, String str2, String str3, int i, int i2, int i3, int i4, int i5, int i6) {
        this.mPackageName = str;
        this.mWallpaperId = str2;
        this.mCollectionId = str3;
        this.mDrawableResId = i;
        this.mTitleResId = i2;
        this.mSubtitle1ResId = i3;
        this.mSubtitle2ResId = i4;
        this.mActionTypeResId = i5;
        this.mActionUrlResId = i6;
    }

    public static SystemStaticWallpaperInfo fromAttributeSet(String str, String str2, AttributeSet attributeSet) {
        String attributeValue = attributeSet.getAttributeValue(null, FlagManager.EXTRA_ID);
        if (TextUtils.isEmpty(attributeValue)) {
            return null;
        }
        return new SystemStaticWallpaperInfo(str, attributeValue, str2, attributeSet.getAttributeResourceValue(null, "src", 0), attributeSet.getAttributeResourceValue(null, "title", 0), attributeSet.getAttributeResourceValue(null, "subtitle1", 0), attributeSet.getAttributeResourceValue(null, "subtitle2", 0), 0, attributeSet.getAttributeResourceValue(null, "actionUrl", 0));
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final int getActionIconRes() {
        return R.drawable.ic_explore_24px;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final int getActionLabelRes() {
        return R.string.explore;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final String getActionUrl(Context context) {
        if (this.mActionUrl == null && this.mActionUrlResId != 0) {
            this.mActionUrl = getPackageResources(context).getString(this.mActionUrlResId);
        }
        return this.mActionUrl;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final Asset getAsset(Context context) {
        if (this.mAsset == null) {
            this.mAsset = new SystemStaticAsset(getPackageResources(context), this.mDrawableResId, this.mWallpaperId);
        }
        return this.mAsset;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final List<String> getAttributions(Context context) {
        if (this.mAttributions == null) {
            Resources packageResources = getPackageResources(context);
            ArrayList arrayList = new ArrayList();
            this.mAttributions = arrayList;
            int i = this.mTitleResId;
            if (i != 0) {
                arrayList.add(packageResources.getString(i));
            }
            int i2 = this.mSubtitle1ResId;
            if (i2 != 0) {
                this.mAttributions.add(packageResources.getString(i2));
            }
            int i3 = this.mSubtitle2ResId;
            if (i3 != 0) {
                this.mAttributions.add(packageResources.getString(i3));
            }
        }
        return this.mAttributions;
    }

    public final Resources getPackageResources(Context context) {
        Resources resources = this.mResources;
        if (resources != null) {
            return resources;
        }
        try {
            this.mResources = context.getPackageManager().getResourcesForApplication(this.mPackageName);
        } catch (PackageManager.NameNotFoundException unused) {
            Log.e("PartnerStaticWPInfo", "Could not get app resources");
        }
        return this.mResources;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.mPlaceholderColor);
        parcel.writeString(this.mPackageName);
        parcel.writeString(this.mWallpaperId);
        parcel.writeString(this.mCollectionId);
        parcel.writeInt(this.mDrawableResId);
        parcel.writeInt(this.mTitleResId);
        parcel.writeInt(this.mSubtitle1ResId);
        parcel.writeInt(this.mSubtitle2ResId);
        parcel.writeInt(this.mActionTypeResId);
        parcel.writeInt(this.mActionUrlResId);
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final Asset getThumbAsset(Context context) {
        return getAsset(context);
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final void showPreview(Activity activity, InlinePreviewIntentFactory inlinePreviewIntentFactory, int i) {
        activity.startActivityForResult(inlinePreviewIntentFactory.newIntent(activity, this), i);
    }

    public SystemStaticWallpaperInfo(Parcel parcel) {
        super(parcel);
        this.mPackageName = parcel.readString();
        this.mWallpaperId = parcel.readString();
        this.mCollectionId = parcel.readString();
        this.mDrawableResId = parcel.readInt();
        this.mTitleResId = parcel.readInt();
        this.mSubtitle1ResId = parcel.readInt();
        this.mSubtitle2ResId = parcel.readInt();
        this.mActionTypeResId = parcel.readInt();
        this.mActionUrlResId = parcel.readInt();
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final String getCollectionId(Context context) {
        return this.mCollectionId;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final String getWallpaperId() {
        return this.mWallpaperId;
    }
}
