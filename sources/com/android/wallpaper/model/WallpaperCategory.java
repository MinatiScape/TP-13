package com.android.wallpaper.model;

import android.content.Context;
import androidx.fragment.app.FragmentActivity;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.asset.ResourceAsset;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public class WallpaperCategory extends Category {
    public int mFeaturedThumbnailIndex;
    public Asset mThumbAsset;
    public final List<WallpaperInfo> mWallpapers;
    public final Object mWallpapersLock;

    public WallpaperCategory(String str, String str2, ArrayList arrayList, int i) {
        this(str, str2, 0, arrayList, i);
    }

    @Override // com.android.wallpaper.model.Category
    public boolean containsThirdParty(String str) {
        return false;
    }

    @Override // com.android.wallpaper.model.Category
    public final void show(FragmentActivity fragmentActivity) {
    }

    @Override // com.android.wallpaper.model.Category
    public boolean supportsThirdParty() {
        return this instanceof ThirdPartyLiveWallpaperCategory;
    }

    public WallpaperCategory(String str, String str2, int i, ArrayList arrayList, int i2) {
        super(str, str2, i2);
        this.mWallpapers = arrayList;
        this.mWallpapersLock = new Object();
        this.mFeaturedThumbnailIndex = i;
    }

    public void fetchWallpapers(Context context, WallpaperReceiver wallpaperReceiver, boolean z) {
        wallpaperReceiver.onWallpapersReceived(new ArrayList(this.mWallpapers));
    }

    @Override // com.android.wallpaper.model.Category
    public Asset getThumbnail(Context context) {
        synchronized (this.mWallpapersLock) {
            if (this.mThumbAsset == null && this.mWallpapers.size() > 0) {
                this.mThumbAsset = this.mWallpapers.get(this.mFeaturedThumbnailIndex).getThumbAsset(context);
            }
        }
        return this.mThumbAsset;
    }

    @Override // com.android.wallpaper.model.Category
    public final boolean isSingleWallpaperCategory() {
        List<WallpaperInfo> list = this.mWallpapers;
        if (list == null || list.size() != 1) {
            return false;
        }
        return true;
    }

    @Override // com.android.wallpaper.model.Category
    public final WallpaperInfo getSingleWallpaper() {
        if (isSingleWallpaperCategory()) {
            return this.mWallpapers.get(0);
        }
        return null;
    }

    public WallpaperCategory(String str, String str2, ResourceAsset resourceAsset, ArrayList arrayList, int i) {
        super(str, str2, i);
        this.mWallpapers = arrayList;
        this.mWallpapersLock = new Object();
        this.mThumbAsset = resourceAsset;
    }
}
