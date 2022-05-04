package com.android.wallpaper.model;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import android.graphics.drawable.Drawable;
import androidx.fragment.app.FragmentActivity;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.util.ActivityUtils;
/* loaded from: classes.dex */
public final class ThirdPartyAppCategory extends Category {
    public final ResolveInfo mResolveInfo;

    @Override // com.android.wallpaper.model.Category
    public final int getOverlayIconSizeDp() {
        return 48;
    }

    @Override // com.android.wallpaper.model.Category
    public final Asset getThumbnail(Context context) {
        return null;
    }

    @Override // com.android.wallpaper.model.Category
    public final boolean containsThirdParty(String str) {
        return this.mResolveInfo.activityInfo.packageName.equals(str);
    }

    @Override // com.android.wallpaper.model.Category
    public final Drawable getOverlayIcon(Context context) {
        return this.mResolveInfo.loadIcon(context.getPackageManager());
    }

    @Override // com.android.wallpaper.model.Category
    public final void show(FragmentActivity fragmentActivity) {
        ActivityInfo activityInfo = this.mResolveInfo.activityInfo;
        ComponentName componentName = new ComponentName(activityInfo.packageName, activityInfo.name);
        Intent intent = new Intent("android.intent.action.SET_WALLPAPER");
        intent.setComponent(componentName);
        ActivityUtils.startActivityForResultSafely(fragmentActivity, intent, 0);
    }

    public ThirdPartyAppCategory(Context context, ResolveInfo resolveInfo, String str) {
        super(resolveInfo.loadLabel(context.getPackageManager()).toString(), str, 400);
        this.mResolveInfo = resolveInfo;
    }
}
