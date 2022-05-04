package com.android.wallpaper.model;

import android.app.Activity;
import android.content.Context;
import android.os.Parcel;
import android.os.Parcelable;
import androidx.cardview.R$style;
import com.android.systemui.shared.R;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.asset.FileAsset;
import java.io.File;
import java.util.Arrays;
import java.util.List;
/* loaded from: classes.dex */
public class LegacyPartnerWallpaperInfo extends WallpaperInfo {
    public static final Parcelable.Creator<LegacyPartnerWallpaperInfo> CREATOR = new Parcelable.Creator<LegacyPartnerWallpaperInfo>() { // from class: com.android.wallpaper.model.LegacyPartnerWallpaperInfo.1
        @Override // android.os.Parcelable.Creator
        public final LegacyPartnerWallpaperInfo createFromParcel(Parcel parcel) {
            return new LegacyPartnerWallpaperInfo(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public final LegacyPartnerWallpaperInfo[] newArray(int i) {
            return new LegacyPartnerWallpaperInfo[i];
        }
    };
    public FileAsset mAsset;
    public boolean mFetchedSystemLegacyDir;
    public String mFullName;
    public File mSystemLegacyDir;
    public FileAsset mThumbAsset;
    public String mThumbName;

    public LegacyPartnerWallpaperInfo(String str, String str2) {
        this.mThumbName = str;
        this.mFullName = str2;
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
        File file;
        if (this.mAsset == null) {
            if (!this.mFetchedSystemLegacyDir) {
                this.mSystemLegacyDir = R$style.getInjector().getPartnerProvider(context).getLegacyWallpaperDirectory();
                this.mFetchedSystemLegacyDir = true;
            }
            File file2 = this.mSystemLegacyDir;
            if (file2 == null) {
                file = null;
            } else {
                file = new File(file2, this.mFullName);
            }
            this.mAsset = new FileAsset(file);
        }
        return this.mAsset;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final Asset getThumbAsset(Context context) {
        File file;
        if (this.mThumbAsset == null) {
            if (!this.mFetchedSystemLegacyDir) {
                this.mSystemLegacyDir = R$style.getInjector().getPartnerProvider(context).getLegacyWallpaperDirectory();
                this.mFetchedSystemLegacyDir = true;
            }
            File file2 = this.mSystemLegacyDir;
            if (file2 == null) {
                file = null;
            } else {
                file = new File(file2, this.mThumbName);
            }
            this.mThumbAsset = new FileAsset(file);
        }
        return this.mThumbAsset;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.mPlaceholderColor);
        parcel.writeString(this.mThumbName);
        parcel.writeString(this.mFullName);
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final String getCollectionId(Context context) {
        return context.getString(R.string.on_device_wallpaper_collection_id);
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final void showPreview(Activity activity, InlinePreviewIntentFactory inlinePreviewIntentFactory, int i) {
        activity.startActivityForResult(inlinePreviewIntentFactory.newIntent(activity, this), i);
    }

    public LegacyPartnerWallpaperInfo(Parcel parcel) {
        super(parcel);
        this.mThumbName = parcel.readString();
        this.mFullName = parcel.readString();
    }
}
