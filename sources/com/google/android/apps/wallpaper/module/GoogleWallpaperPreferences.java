package com.google.android.apps.wallpaper.module;

import com.android.wallpaper.module.WallpaperPreferences;
import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;
/* compiled from: GoogleWallpaperPreferences.kt */
/* loaded from: classes.dex */
public interface GoogleWallpaperPreferences extends WallpaperPreferences {
    @NotNull
    JSONArray getDefaultRecentWallpapers();

    @NotNull
    String getLastToBeInstalled();

    @NotNull
    JSONArray getRecentWallpapers();

    boolean isThemesSanitized();

    void setLastToBeInstalled(@NotNull String str);

    void setThemesSanitized();

    void updateLastWallpaper(@NotNull String str);
}
