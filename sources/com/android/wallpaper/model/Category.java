package com.android.wallpaper.model;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import androidx.fragment.app.FragmentActivity;
import com.android.wallpaper.asset.Asset;
/* loaded from: classes.dex */
public abstract class Category {
    public final String mCollectionId;
    public final int mPriority;
    public final String mTitle;

    public boolean containsThirdParty(String str) {
        return false;
    }

    public Drawable getOverlayIcon(Context context) {
        return null;
    }

    public int getOverlayIconSizeDp() {
        return 40;
    }

    public WallpaperInfo getSingleWallpaper() {
        return null;
    }

    public abstract Asset getThumbnail(Context context);

    public WallpaperRotationInitializer getWallpaperRotationInitializer() {
        return null;
    }

    public boolean isSingleWallpaperCategory() {
        return false;
    }

    public abstract void show(FragmentActivity fragmentActivity);

    public boolean supportsThirdParty() {
        return this instanceof ThirdPartyAppCategory;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof Category)) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        return TextUtils.equals(this.mCollectionId, ((Category) obj).mCollectionId);
    }

    public final int hashCode() {
        String str = this.mCollectionId;
        if (str == null) {
            return super.hashCode();
        }
        return str.hashCode();
    }

    public Category(String str, String str2, int i) {
        this.mTitle = str;
        this.mCollectionId = str2;
        this.mPriority = i;
    }
}
