package com.android.customization.module;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import com.android.wallpaper.module.BaseWallpaperInjector;
import com.android.wallpaper.picker.CustomizationPickerActivity;
/* loaded from: classes.dex */
public class DefaultCustomizationInjector extends BaseWallpaperInjector implements CustomizationInjector {
    @Override // com.android.wallpaper.module.Injector
    public final Intent getDeepLinkRedirectIntent(Context context, Uri uri) {
        Intent intent = new Intent();
        intent.setClass(context, CustomizationPickerActivity.class);
        intent.setData(uri);
        intent.setFlags(268468224);
        return intent;
    }
}
