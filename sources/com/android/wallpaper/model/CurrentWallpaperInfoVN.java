package com.android.wallpaper.model;

import android.app.Activity;
import android.content.Context;
import android.os.Parcel;
import android.os.Parcelable;
import com.android.systemui.shared.R;
import com.android.wallpaper.asset.Asset;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public class CurrentWallpaperInfoVN extends WallpaperInfo {
    public static final Parcelable.Creator<CurrentWallpaperInfoVN> CREATOR = new Parcelable.Creator<CurrentWallpaperInfoVN>() { // from class: com.android.wallpaper.model.CurrentWallpaperInfoVN.1
        @Override // android.os.Parcelable.Creator
        public final CurrentWallpaperInfoVN createFromParcel(Parcel parcel) {
            return new CurrentWallpaperInfoVN(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public final CurrentWallpaperInfoVN[] newArray(int i) {
            return new CurrentWallpaperInfoVN[i];
        }
    };
    public int mActionIconRes;
    public int mActionLabelRes;
    public String mActionUrl;
    public Asset mAsset;
    public List<String> mAttributions;
    public String mCollectionId;
    public int mWallpaperManagerFlag;

    public CurrentWallpaperInfoVN(List<String> list, String str, int i, int i2, String str2, int i3) {
        this.mAttributions = list;
        this.mWallpaperManagerFlag = i3;
        this.mActionUrl = str;
        this.mActionLabelRes = i;
        this.mActionIconRes = i2;
        this.mCollectionId = str2;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final String getStoredWallpaperId(Context context) {
        return null;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final String getWallpaperId() {
        return "unknown_current_wallpaper_id";
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final int getActionIconRes() {
        int i = this.mActionIconRes;
        if (i != 0) {
            return i;
        }
        return R.drawable.ic_explore_24px;
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final int getActionLabelRes() {
        int i = this.mActionLabelRes;
        if (i != 0) {
            return i;
        }
        return R.string.explore;
    }

    /* JADX WARN: Code restructure failed: missing block: B:7:0x0018, code lost:
        if (com.google.android.gms.common.util.zzh.isHomeStaticWallpaperSet(r3) == false) goto L9;
     */
    @Override // com.android.wallpaper.model.WallpaperInfo
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final com.android.wallpaper.asset.Asset getAsset(android.content.Context r3) {
        /*
            r2 = this;
            com.android.wallpaper.asset.Asset r0 = r2.mAsset
            if (r0 != 0) goto L2d
            int r0 = r2.mWallpaperManagerFlag
            r1 = 1
            if (r0 != r1) goto L1b
            com.android.wallpaper.module.Injector r0 = androidx.cardview.R$style.getInjector()
            com.google.android.gms.common.util.zzh r0 = r0.getWallpaperStatusChecker()
            r0.getClass()
            boolean r0 = com.google.android.gms.common.util.zzh.isHomeStaticWallpaperSet(r3)
            if (r0 != 0) goto L1b
            goto L1c
        L1b:
            r1 = 0
        L1c:
            if (r1 == 0) goto L24
            com.android.wallpaper.asset.BuiltInWallpaperAsset r0 = new com.android.wallpaper.asset.BuiltInWallpaperAsset
            r0.<init>(r3)
            goto L2b
        L24:
            com.android.wallpaper.asset.CurrentWallpaperAssetVN r0 = new com.android.wallpaper.asset.CurrentWallpaperAssetVN
            int r1 = r2.mWallpaperManagerFlag
            r0.<init>(r3, r1)
        L2b:
            r2.mAsset = r0
        L2d:
            com.android.wallpaper.asset.Asset r2 = r2.mAsset
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.wallpaper.model.CurrentWallpaperInfoVN.getAsset(android.content.Context):com.android.wallpaper.asset.Asset");
    }

    @Override // com.android.wallpaper.model.WallpaperInfo, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.mPlaceholderColor);
        parcel.writeStringList(this.mAttributions);
        parcel.writeInt(this.mWallpaperManagerFlag);
        parcel.writeString(this.mActionUrl);
        parcel.writeString(this.mCollectionId);
        parcel.writeInt(this.mActionLabelRes);
        parcel.writeInt(this.mActionIconRes);
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final Asset getThumbAsset(Context context) {
        return getAsset(context);
    }

    @Override // com.android.wallpaper.model.WallpaperInfo
    public final void showPreview(Activity activity, InlinePreviewIntentFactory inlinePreviewIntentFactory, int i) {
        activity.startActivityForResult(inlinePreviewIntentFactory.newIntent(activity, this), i);
    }

    public CurrentWallpaperInfoVN(Parcel parcel) {
        super(parcel);
        ArrayList arrayList = new ArrayList();
        this.mAttributions = arrayList;
        parcel.readStringList(arrayList);
        this.mWallpaperManagerFlag = parcel.readInt();
        this.mActionUrl = parcel.readString();
        this.mCollectionId = parcel.readString();
        this.mActionLabelRes = parcel.readInt();
        this.mActionIconRes = parcel.readInt();
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
}
