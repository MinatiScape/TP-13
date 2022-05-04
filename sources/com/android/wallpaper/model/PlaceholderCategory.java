package com.android.wallpaper.model;

import android.content.Context;
import androidx.fragment.app.FragmentActivity;
import com.android.wallpaper.asset.Asset;
/* loaded from: classes.dex */
public final class PlaceholderCategory extends Category {
    @Override // com.android.wallpaper.model.Category
    public final Asset getThumbnail(Context context) {
        return null;
    }

    @Override // com.android.wallpaper.model.Category
    public final void show(FragmentActivity fragmentActivity) {
    }

    public PlaceholderCategory(String str, String str2, int i) {
        super(str, str2, i);
    }
}
