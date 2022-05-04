package com.android.wallpaper.model;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.os.Parcel;
import android.os.Parcelable;
import androidx.cardview.R$style;
import com.android.systemui.shared.R;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.asset.ResourceAsset;
import java.util.Arrays;
import java.util.List;
/* loaded from: classes.dex */
public class PartnerWallpaperInfo extends WallpaperInfo {
    public static final Parcelable.Creator<PartnerWallpaperInfo> CREATOR = new Parcelable.Creator<PartnerWallpaperInfo>() { // from class: com.android.wallpaper.model.PartnerWallpaperInfo.1
        @Override // android.os.Parcelable.Creator
        public final PartnerWallpaperInfo createFromParcel(Parcel parcel) {
            return new PartnerWallpaperInfo(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public final PartnerWallpaperInfo[] newArray(int i) {
            return new PartnerWallpaperInfo[i];
        }
    };
    public ResourceAsset mAsset;
    public boolean mFetchedPartnerResources;
    public int mFullRes;
    public Resources mPartnerResources;
    public ResourceAsset mThumbAsset;
    public int mThumbRes;

    public PartnerWallpaperInfo(int i, int i2) {
        this.mThumbRes = i;
        this.mFullRes = i2;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final List<String> getAttributions(Context context) {
        return Arrays.asList(context.getResources().getString(R.string.on_device_wallpaper_title));
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final int getBackupPermission() {
        return 0;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final Asset getAsset(Context context) {
        if (this.mAsset == null) {
            if (!this.mFetchedPartnerResources) {
                this.mPartnerResources = R$style.getInjector().getPartnerProvider(context).mResources;
                this.mFetchedPartnerResources = true;
            }
            this.mAsset = new ResourceAsset(this.mPartnerResources, this.mFullRes);
        }
        return this.mAsset;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final Asset getThumbAsset(Context context) {
        if (this.mThumbAsset == null) {
            if (!this.mFetchedPartnerResources) {
                this.mPartnerResources = R$style.getInjector().getPartnerProvider(context).mResources;
                this.mFetchedPartnerResources = true;
            }
            this.mThumbAsset = new ResourceAsset(this.mPartnerResources, this.mThumbRes);
        }
        return this.mThumbAsset;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.mPlaceholderColor);
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

    public PartnerWallpaperInfo(Parcel parcel) {
        super(parcel);
        this.mThumbRes = parcel.readInt();
        this.mFullRes = parcel.readInt();
    }
}
