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
import com.android.wallpaper.module.DefaultWallpaperPreferences$$ExternalSyntheticOutline0;
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
/* loaded from: classes.dex */
public final class DefaultGoogleWallpaperPreferences extends DefaultCustomizationPreferences implements GoogleWallpaperPreferences {
    public DefaultGoogleWallpaperPreferences(@Nullable Context context) {
        super(context);
    }

    @Override // com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences
    @NotNull
    public JSONArray getDefaultRecentWallpapers() {
        String string = this.mNoBackupPrefs.getString("default_recent_wallpapers", null);
        if (string != null) {
            return new JSONArray(string);
        }
        try {
            return (JSONArray) BuildersKt.runBlocking$default(null, new DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1(this, null), 1, null);
        } catch (Throwable th) {
            Log.e("DefaultGoogleWallpaperPreferences", "Error generating quick switch defaults", th);
            return new JSONArray();
        }
    }

    @Override // com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences
    @NotNull
    public String getLastToBeInstalled() {
        String string = this.mNoBackupPrefs.getString("last_to_be_installed_string", "");
        Intrinsics.checkNotNullExpressionValue(string, "mNoBackupPrefs.getString(KEY_LAST_TO_BE_INSTALLED_STRING, \"\")");
        return string;
    }

    @Override // com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences
    @NotNull
    public JSONArray getRecentWallpapers() {
        JSONArray jSONArray = new JSONArray(this.mNoBackupPrefs.getString("recent_wallpapers", "[]"));
        Context mContext = this.mContext;
        Intrinsics.checkNotNullExpressionValue(mContext, "mContext");
        RecentWallpaperUtils.cleanUpRecentsArray(jSONArray, mContext);
        return jSONArray;
    }

    @Override // com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences
    public boolean isThemesSanitized() {
        return this.mNoBackupPrefs.getBoolean("themes_sanitized", false);
    }

    public final void notifyRecentsChange() {
        Uri.Builder builder = new Uri.Builder();
        builder.scheme("content").authority("com.google.android.apps.wallpaper.recents").path("/list_recent");
        this.mContext.getContentResolver().notifyChange(builder.build(), null);
    }

    @Override // com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences
    public void setLastToBeInstalled(@NotNull String toBeInstalledString) {
        Intrinsics.checkNotNullParameter(toBeInstalledString, "toBeInstalledString");
        DefaultWallpaperPreferences$$ExternalSyntheticOutline0.m(this.mNoBackupPrefs, "last_to_be_installed_string", toBeInstalledString);
    }

    @Override // com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences
    public void setThemesSanitized(boolean z) {
        this.mNoBackupPrefs.edit().putBoolean("themes_sanitized", z).apply();
    }

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
        Intrinsics.checkNotNullExpressionValue(jSONArray2, "updateLastWpJson(\n                context = mContext,\n                recentsArray = wpArray,\n                id = wallpaperId,\n                wallpaperInfo = wallpaperInfo,\n                collectionId = collectionId,\n                attributions = attributions,\n                actionUrl = actionUrl,\n                placeHolderColor = colors.primaryColor.toArgb()).toString()");
        DefaultWallpaperPreferences$$ExternalSyntheticOutline0.m(this.mNoBackupPrefs, "recent_wallpapers", jSONArray2);
        try {
            Dispatchers dispatchers = Dispatchers.INSTANCE;
            BuildersKt.launch$default(CoroutineScopeKt.CoroutineScope(Dispatchers.Default.plus(SupervisorKt.SupervisorJob$default(null, 1))), null, null, new DefaultGoogleWallpaperPreferences$storeLastWallpaper$1(this, id, wallpaperInfo, bitmap, null), 3, null);
        } catch (Exception e) {
            Log.w("DefaultGoogleWallpaperPreferences", "Exception saving latest wallpaper, reverting list", e);
            DefaultWallpaperPreferences$$ExternalSyntheticOutline0.m(this.mNoBackupPrefs, "recent_wallpapers", string);
        }
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public void storeLatestHomeWallpaper(@NotNull String wallpaperId, @NotNull LiveWallpaperInfo liveWallpaperInfo, @NotNull WallpaperColors colors) {
        Intrinsics.checkNotNullParameter(wallpaperId, "wallpaperId");
        Intrinsics.checkNotNullParameter(colors, "colors");
        storeLastWallpaper(wallpaperId, liveWallpaperInfo.getAttributions(this.mContext), liveWallpaperInfo.getActionUrl(this.mContext), liveWallpaperInfo.getCollectionId(this.mContext), liveWallpaperInfo, null, liveWallpaperInfo.mInfo, colors);
    }

    @Override // com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences
    public void updateLastWallpaper(@NotNull String id) {
        JSONObject jSONObject;
        Intrinsics.checkNotNullParameter(id, "wallpaperId");
        JSONArray recentWallpapers = getRecentWallpapers();
        if (!RecentWallpaperUtils.reorderRecentsOnly(recentWallpapers, id)) {
            JSONArray recentsArray = getDefaultRecentWallpapers();
            Intrinsics.checkNotNullParameter(recentsArray, "recentsArray");
            Intrinsics.checkNotNullParameter(id, "id");
            int length = recentsArray.length();
            if (length > 0) {
                int i = 0;
                while (true) {
                    int i2 = i + 1;
                    jSONObject = recentsArray.getJSONObject(i);
                    if (Intrinsics.areEqual(jSONObject.get(FlagManager.FIELD_ID), id)) {
                        break;
                    } else if (i2 >= length) {
                        break;
                    } else {
                        i = i2;
                    }
                }
            }
            jSONObject = null;
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
    public void storeLatestHomeWallpaper(@NotNull String wallpaperId, @NotNull WallpaperInfo wallpaper, @NotNull Bitmap croppedWallpaperBitmap, @NotNull WallpaperColors colors) {
        Intrinsics.checkNotNullParameter(wallpaperId, "wallpaperId");
        Intrinsics.checkNotNullParameter(wallpaper, "wallpaper");
        Intrinsics.checkNotNullParameter(croppedWallpaperBitmap, "croppedWallpaperBitmap");
        Intrinsics.checkNotNullParameter(colors, "colors");
        storeLastWallpaper(wallpaperId, wallpaper.getAttributions(this.mContext), wallpaper.getActionUrl(this.mContext), wallpaper.getCollectionId(this.mContext), wallpaper, croppedWallpaperBitmap, null, colors);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public void storeLatestHomeWallpaper(@NotNull String wallpaperId, @Nullable List<String> list, @Nullable String str, @Nullable String str2, @NotNull Bitmap bitmap, @NotNull WallpaperColors colors) {
        Intrinsics.checkNotNullParameter(wallpaperId, "wallpaperId");
        Intrinsics.checkNotNullParameter(colors, "colors");
        storeLastWallpaper(wallpaperId, list, str, str2, null, bitmap, null, colors);
    }
}
