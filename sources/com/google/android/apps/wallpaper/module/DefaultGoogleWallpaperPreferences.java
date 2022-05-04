package com.google.android.apps.wallpaper.module;

import android.app.WallpaperColors;
import android.content.Context;
import android.graphics.Bitmap;
import android.net.Uri;
import android.util.Log;
import com.android.customization.module.DefaultCustomizationPreferences;
import com.android.systemui.flags.FlagManager;
import com.android.wallpaper.model.LiveWallpaperInfo;
import com.android.wallpaper.model.WallpaperInfo;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.BuildersKt;
import kotlinx.coroutines.CoroutineScopeKt;
import kotlinx.coroutines.Dispatchers;
import kotlinx.coroutines.SupervisorKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONArray;
import org.json.JSONObject;
/* compiled from: DefaultGoogleWallpaperPreferences.kt */
/* loaded from: classes.dex */
public final class DefaultGoogleWallpaperPreferences extends DefaultCustomizationPreferences implements GoogleWallpaperPreferences {
    public final void storeLastWallpaper(String id, List<String> list, String str, String str2, WallpaperInfo wallpaperInfo, Bitmap bitmap, android.app.WallpaperInfo wallpaperInfo2, WallpaperColors wallpaperColors) {
        String string = this.mNoBackupPrefs.getString("recent_wallpapers", "[]");
        JSONArray jSONArray = new JSONArray(string);
        Context mContext = this.mContext;
        int argb = wallpaperColors.getPrimaryColor().toArgb();
        Intrinsics.checkNotNullExpressionValue(mContext, "mContext");
        Integer valueOf = Integer.valueOf(argb);
        Intrinsics.checkNotNullParameter(id, "id");
        if (!RecentWallpaperUtils.reorderRecentsOnly(jSONArray, id)) {
            jSONArray.put(RecentWallpaperUtils.createRecentEntryJson(id, str2, list, str, wallpaperInfo2, valueOf));
            RecentWallpaperUtils.cleanUpRecentsArray(jSONArray, mContext);
        }
        String jSONArray2 = jSONArray.toString();
        Intrinsics.checkNotNullExpressionValue(jSONArray2, "updateLastWpJson(\n      …olor.toArgb()).toString()");
        this.mNoBackupPrefs.edit().putString("recent_wallpapers", jSONArray2).apply();
        try {
            BuildersKt.launch$default(CoroutineScopeKt.CoroutineScope(Dispatchers.Default.plus(SupervisorKt.SupervisorJob$default())), null, new DefaultGoogleWallpaperPreferences$storeLastWallpaper$1(this, id, wallpaperInfo, bitmap, null), 3);
        } catch (Exception e) {
            Log.w("DefaultGoogleWallpaperPreferences", "Exception saving latest wallpaper, reverting list", e);
            this.mNoBackupPrefs.edit().putString("recent_wallpapers", string).apply();
        }
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void storeLatestHomeWallpaper(@NotNull String wallpaperId, @NotNull LiveWallpaperInfo liveWallpaperInfo, @NotNull WallpaperColors colors) {
        Intrinsics.checkNotNullParameter(wallpaperId, "wallpaperId");
        Intrinsics.checkNotNullParameter(colors, "colors");
        storeLastWallpaper(wallpaperId, liveWallpaperInfo.getAttributions(this.mContext), liveWallpaperInfo.getActionUrl(this.mContext), liveWallpaperInfo.getCollectionId(this.mContext), liveWallpaperInfo, null, liveWallpaperInfo.mInfo, colors);
    }

    @Override // com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences
    @NotNull
    public final JSONArray getDefaultRecentWallpapers() {
        String string = this.mNoBackupPrefs.getString("default_recent_wallpapers", null);
        if (string != null) {
            return new JSONArray(string);
        }
        try {
            return (JSONArray) BuildersKt.runBlocking$default(new DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1(this, null));
        } catch (Throwable th) {
            Log.e("DefaultGoogleWallpaperPreferences", "Error generating quick switch defaults", th);
            return new JSONArray();
        }
    }

    @Override // com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences
    @NotNull
    public final String getLastToBeInstalled() {
        String string = this.mNoBackupPrefs.getString("last_to_be_installed_string", "");
        Intrinsics.checkNotNullExpressionValue(string, "mNoBackupPrefs.getString…_BE_INSTALLED_STRING, \"\")");
        return string;
    }

    @Override // com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences
    @NotNull
    public final JSONArray getRecentWallpapers() {
        JSONArray jSONArray = new JSONArray(this.mNoBackupPrefs.getString("recent_wallpapers", "[]"));
        Context mContext = this.mContext;
        Intrinsics.checkNotNullExpressionValue(mContext, "mContext");
        RecentWallpaperUtils.cleanUpRecentsArray(jSONArray, mContext);
        return jSONArray;
    }

    @Override // com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences
    public final boolean isThemesSanitized() {
        return this.mNoBackupPrefs.getBoolean("themes_sanitized", false);
    }

    public final void notifyRecentsChange() {
        Uri.Builder builder = new Uri.Builder();
        builder.scheme("content").authority("com.google.android.apps.wallpaper.recents").path("/list_recent");
        this.mContext.getContentResolver().notifyChange(builder.build(), null);
    }

    @Override // com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences
    public final void setLastToBeInstalled(@NotNull String toBeInstalledString) {
        Intrinsics.checkNotNullParameter(toBeInstalledString, "toBeInstalledString");
        this.mNoBackupPrefs.edit().putString("last_to_be_installed_string", toBeInstalledString).apply();
    }

    @Override // com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences
    public final void setThemesSanitized() {
        this.mNoBackupPrefs.edit().putBoolean("themes_sanitized", true).apply();
    }

    @Override // com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences
    public final void updateLastWallpaper(@NotNull String wallpaperId) {
        JSONObject jSONObject;
        Intrinsics.checkNotNullParameter(wallpaperId, "wallpaperId");
        JSONArray recentWallpapers = getRecentWallpapers();
        if (!RecentWallpaperUtils.reorderRecentsOnly(recentWallpapers, wallpaperId)) {
            JSONArray recentsArray = getDefaultRecentWallpapers();
            Intrinsics.checkNotNullParameter(recentsArray, "recentsArray");
            int length = recentsArray.length();
            int i = 0;
            while (true) {
                if (i >= length) {
                    jSONObject = null;
                    break;
                }
                int i2 = i + 1;
                jSONObject = recentsArray.getJSONObject(i);
                if (Intrinsics.areEqual(jSONObject.get(FlagManager.EXTRA_ID), wallpaperId)) {
                    break;
                }
                i = i2;
            }
            if (jSONObject != null) {
                recentWallpapers.put(jSONObject);
            } else {
                return;
            }
        }
        this.mNoBackupPrefs.edit().putString("recent_wallpapers", recentWallpapers.toString()).apply();
        notifyRecentsChange();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void storeLatestHomeWallpaper(@NotNull String wallpaperId, @NotNull WallpaperInfo wallpaper, @NotNull Bitmap croppedWallpaperBitmap, @NotNull WallpaperColors colors) {
        Intrinsics.checkNotNullParameter(wallpaperId, "wallpaperId");
        Intrinsics.checkNotNullParameter(wallpaper, "wallpaper");
        Intrinsics.checkNotNullParameter(croppedWallpaperBitmap, "croppedWallpaperBitmap");
        Intrinsics.checkNotNullParameter(colors, "colors");
        storeLastWallpaper(wallpaperId, wallpaper.getAttributions(this.mContext), wallpaper.getActionUrl(this.mContext), wallpaper.getCollectionId(this.mContext), wallpaper, croppedWallpaperBitmap, null, colors);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void storeLatestHomeWallpaper(@NotNull String wallpaperId, @Nullable List<String> list, @Nullable String str, @Nullable String str2, @NotNull Bitmap bitmap, @NotNull WallpaperColors colors) {
        Intrinsics.checkNotNullParameter(wallpaperId, "wallpaperId");
        Intrinsics.checkNotNullParameter(colors, "colors");
        storeLastWallpaper(wallpaperId, list, str, str2, null, bitmap, null, colors);
    }

    public DefaultGoogleWallpaperPreferences(@Nullable Context context) {
        super(context);
    }
}
