package com.android.wallpaper.module;

import android.content.Context;
import com.android.customization.module.CustomizationInjector;
import com.google.android.apps.wallpaper.backdrop.BackdropFetcher;
import com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences;
/* loaded from: classes.dex */
public interface GoogleWallpapersInjector extends CustomizationInjector {
    GoogleWallpaperPreferences getGooglePreferences(Context context);

    BackdropFetcher getServerFetcher(Context context);
}
