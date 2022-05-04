package com.google.android.apps.wallpaper.model;

import android.app.Activity;
import android.content.Context;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import com.android.systemui.shared.R;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.model.InlinePreviewIntentFactory;
import com.android.wallpaper.model.WallpaperInfo;
import com.google.android.apps.wallpaper.asset.NetworkAsset;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public class NetworkWallpaperInfo extends WallpaperInfo {
    public static final Parcelable.Creator<NetworkWallpaperInfo> CREATOR = new Parcelable.Creator<NetworkWallpaperInfo>() { // from class: com.google.android.apps.wallpaper.model.NetworkWallpaperInfo.1
        @Override // android.os.Parcelable.Creator
        public final NetworkWallpaperInfo createFromParcel(Parcel parcel) {
            return new NetworkWallpaperInfo(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public final NetworkWallpaperInfo[] newArray(int i) {
            return new NetworkWallpaperInfo[i];
        }
    };
    public int mActionType;
    public String mActionUrl;
    public List<String> mAttributions;
    public String mBaseImageUrl;
    public String mCollectionId;
    public Uri mDesktopImageUrl;
    public NetworkAsset mFullAsset;
    public Uri mFullImageUrl;
    public NetworkAsset mThumbAsset;
    public Uri mThumbImageUrl;
    public Uri mTinyThumbImageUrl;
    public String mWallpaperId;

    public NetworkWallpaperInfo(String str, Uri uri, Uri uri2, Uri uri3, Uri uri4, ArrayList arrayList, String str2, String str3, String str4, int i) {
        this.mBaseImageUrl = str;
        this.mFullImageUrl = uri;
        this.mThumbImageUrl = uri2;
        this.mTinyThumbImageUrl = uri3;
        this.mDesktopImageUrl = uri4;
        this.mAttributions = arrayList;
        this.mActionUrl = str2;
        this.mCollectionId = str3;
        this.mWallpaperId = str4;
        this.mActionType = i;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final int getActionIconRes() {
        if (this.mActionType == 2) {
            return R.drawable.ic_case_24px;
        }
        return R.drawable.ic_explore_24px;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final int getActionLabelRes() {
        if (this.mActionType == 2) {
            return R.string.build_case;
        }
        return R.string.explore;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final Asset getAsset(Context context) {
        if (this.mFullAsset == null) {
            this.mFullAsset = new NetworkAsset(context, this.mFullImageUrl, this.mTinyThumbImageUrl);
        }
        return this.mFullAsset;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final Asset getThumbAsset(Context context) {
        if (this.mThumbAsset == null) {
            this.mThumbAsset = new NetworkAsset(context, this.mThumbImageUrl, this.mTinyThumbImageUrl);
        }
        return this.mThumbAsset;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.mPlaceholderColor);
        parcel.writeString(this.mBaseImageUrl);
        parcel.writeString(this.mFullImageUrl.toString());
        parcel.writeString(this.mThumbImageUrl.toString());
        parcel.writeString(this.mTinyThumbImageUrl.toString());
        parcel.writeString(this.mDesktopImageUrl.toString());
        parcel.writeStringList(this.mAttributions);
        parcel.writeString(this.mActionUrl);
        parcel.writeString(this.mCollectionId);
        parcel.writeString(this.mWallpaperId);
        parcel.writeInt(this.mActionType);
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final void showPreview(Activity activity, InlinePreviewIntentFactory inlinePreviewIntentFactory, int i) {
        activity.startActivityForResult(inlinePreviewIntentFactory.newIntent(activity, this), i);
    }

    public NetworkWallpaperInfo(Parcel parcel) {
        super(parcel);
        this.mBaseImageUrl = parcel.readString();
        this.mFullImageUrl = Uri.parse(parcel.readString());
        this.mThumbImageUrl = Uri.parse(parcel.readString());
        this.mTinyThumbImageUrl = Uri.parse(parcel.readString());
        this.mDesktopImageUrl = Uri.parse(parcel.readString());
        this.mAttributions = parcel.createStringArrayList();
        this.mActionUrl = parcel.readString();
        this.mCollectionId = parcel.readString();
        this.mWallpaperId = parcel.readString();
        this.mActionType = parcel.readInt();
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final String getActionUrl(Context context) {
        return this.mActionUrl;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final List<String> getAttributions(Context context) {
        return this.mAttributions;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final String getCollectionId(Context context) {
        return this.mCollectionId;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final String getBaseImageUrl() {
        return this.mBaseImageUrl;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final String getWallpaperId() {
        return this.mWallpaperId;
    }
}
