package com.android.wallpaper.module;

import android.app.WallpaperColors;
import android.app.backup.BackupManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.text.TextUtils;
import android.util.Log;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import org.json.JSONArray;
import org.json.JSONException;
/* loaded from: classes.dex */
public class DefaultWallpaperPreferences implements WallpaperPreferences {
    public Context mContext;
    public SharedPreferences mNoBackupPrefs;
    public SharedPreferences mSharedPrefs;
    public DefaultWallpaperPreferences$$ExternalSyntheticLambda0 mSharedPrefsChangedListener;

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final List<String> getHomeWallpaperAttributions() {
        return Arrays.asList(this.mSharedPrefs.getString("home_wallpaper_attribution_line_1", null), this.mSharedPrefs.getString("home_wallpaper_attribution_line_2", null), this.mSharedPrefs.getString("home_wallpaper_attribution_line_3", null));
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final List<String> getLockWallpaperAttributions() {
        return Arrays.asList(this.mSharedPrefs.getString("lock_wallpaper_attribution_line_1", null), this.mSharedPrefs.getString("lock_wallpaper_attribution_line_2", null), this.mSharedPrefs.getString("lock_wallpaper_attribution_line_3", null));
    }

    public static int getCurrentDate() {
        return Integer.parseInt(new SimpleDateFormat("yyyyMMdd", Locale.US).format(Calendar.getInstance(TimeZone.getTimeZone("UTC")).getTime()));
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void addDailyRotation(long j) {
        try {
            JSONArray jSONArray = new JSONArray(this.mNoBackupPrefs.getString("daily_rotation_timestamps", "[]"));
            jSONArray.put(j);
            this.mNoBackupPrefs.edit().putString("daily_rotation_timestamps", jSONArray.toString()).apply();
        } catch (JSONException unused) {
            Log.e("DefaultWPPreferences", "Failed to add a daily rotation timestamp due to a JSON parse exception");
        }
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void clearDailyRotations() {
        this.mNoBackupPrefs.edit().remove("daily_rotation_timestamps").remove("daily_wallpaper_enabled_timestamp").apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final int getAppLaunchCount() {
        return this.mNoBackupPrefs.getInt("app_launch_count", 0);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final long getDailyWallpaperEnabledTimestamp() {
        return this.mNoBackupPrefs.getLong("daily_wallpaper_enabled_timestamp", -1L);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final int getDailyWallpaperLastRotationStatus() {
        return this.mNoBackupPrefs.getInt("last_rotation_status", -1);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final long getDailyWallpaperLastRotationStatusTimestamp() {
        return this.mNoBackupPrefs.getLong("last_rotation_status_timestamp", 0L);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final int getFirstLaunchDateSinceSetup() {
        return this.mNoBackupPrefs.getInt("first_launch_date_since_setup", 0);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final int getFirstWallpaperApplyDateSinceSetup() {
        return this.mNoBackupPrefs.getInt("first_wallpaper_apply_date_since_setup", 0);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final int getHomeWallpaperActionIconRes() {
        return getResIdPersistedByName("home_wallpaper_action_icon", "drawable");
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final int getHomeWallpaperActionLabelRes() {
        return getResIdPersistedByName("home_wallpaper_action_label", "string");
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final String getHomeWallpaperActionUrl() {
        return this.mSharedPrefs.getString("home_wallpaper_action_url", null);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final String getHomeWallpaperBackingFileName() {
        return this.mNoBackupPrefs.getString("home_wallpaper_backing_file", null);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final String getHomeWallpaperCollectionId() {
        return this.mSharedPrefs.getString("home_wallpaper_collection_id", null);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final long getHomeWallpaperHashCode() {
        return this.mSharedPrefs.getLong("home_wallpaper_hash_code", 0L);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final int getHomeWallpaperManagerId() {
        return this.mNoBackupPrefs.getInt("home_wallpaper_id", 0);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final String getHomeWallpaperPackageName() {
        return this.mNoBackupPrefs.getString("home_wallpaper_package_name", null);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final String getHomeWallpaperRemoteId() {
        return this.mNoBackupPrefs.getString("home_wallpaper_remote_id", null);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final String getHomeWallpaperServiceName() {
        return this.mNoBackupPrefs.getString("home_wallpaper_service_name", null);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final long getLastDailyLogTimestamp() {
        return this.mNoBackupPrefs.getLong("last_daily_log_timestamp", 0L);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final long getLastDailyRotationTimestamp() {
        try {
            JSONArray jSONArray = new JSONArray(this.mNoBackupPrefs.getString("daily_rotation_timestamps", "[]"));
            if (jSONArray.length() == 0) {
                return -1L;
            }
            return jSONArray.getLong(jSONArray.length() - 1);
        } catch (JSONException unused) {
            Log.e("DefaultWPPreferences", "Failed to find a daily rotation timestamp due to a JSON parse exception");
            return -1L;
        }
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final int getLockWallpaperActionIconRes() {
        return getResIdPersistedByName("lock_wallpaper_action_icon", "drawable");
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final int getLockWallpaperActionLabelRes() {
        return getResIdPersistedByName("lock_wallpaper_action_label", "string");
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final String getLockWallpaperActionUrl() {
        return this.mSharedPrefs.getString("lock_wallpaper_action_url", null);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final String getLockWallpaperBackingFileName() {
        return this.mNoBackupPrefs.getString("lock_wallpaper_backing_file", null);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final String getLockWallpaperCollectionId() {
        return this.mSharedPrefs.getString("lock_wallpaper_collection_id", null);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final long getLockWallpaperHashCode() {
        return this.mSharedPrefs.getLong("lock_wallpaper_hash_code", 0L);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final int getLockWallpaperId() {
        return this.mNoBackupPrefs.getInt("lock_wallpaper_id", 0);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final String getLockWallpaperRemoteId() {
        return this.mNoBackupPrefs.getString("lock_wallpaper_remote_id", null);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final int getNumDaysDailyRotationFailed() {
        return this.mNoBackupPrefs.getInt("num_days_daily_rotation_failed", 0);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final int getNumDaysDailyRotationNotAttempted() {
        return this.mNoBackupPrefs.getInt("num_days_daily_rotation_not_attempted", 0);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final int getPendingDailyWallpaperUpdateStatus() {
        return this.mNoBackupPrefs.getInt("pending_daily_wallpaper_update_status", 0);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final int getPendingWallpaperSetStatus() {
        return this.mNoBackupPrefs.getInt("pending_wallpaper_set_status", 0);
    }

    public final int getResIdPersistedByName(String str, String str2) {
        String string = this.mSharedPrefs.getString(str, null);
        if (string == null) {
            return 0;
        }
        return this.mContext.getResources().getIdentifier(string, str2, this.mContext.getPackageName());
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final WallpaperColors getWallpaperColors(String str) {
        Color color;
        String string = this.mNoBackupPrefs.getString("preview_wallpaper_color_id" + str, "");
        Color color2 = null;
        if (string.equals("")) {
            return null;
        }
        String[] split = string.split(",");
        Color valueOf = Color.valueOf(Integer.parseInt(split[0]));
        if (split.length >= 2) {
            color = Color.valueOf(Integer.parseInt(split[1]));
        } else {
            color = null;
        }
        if (split.length >= 3) {
            color2 = Color.valueOf(Integer.parseInt(split[2]));
        }
        return new WallpaperColors(valueOf, color, color2, 4);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final int getWallpaperPresentationMode() {
        return this.mSharedPrefs.getInt("wallpaper_presentation_mode", 1);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void incrementNumDaysDailyRotationFailed() {
        this.mNoBackupPrefs.edit().putInt("num_days_daily_rotation_failed", getNumDaysDailyRotationFailed() + 1).apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void incrementNumDaysDailyRotationNotAttempted() {
        this.mNoBackupPrefs.edit().putInt("num_days_daily_rotation_not_attempted", getNumDaysDailyRotationNotAttempted() + 1).apply();
    }

    public final void persistResIdByName(String str, int i) {
        this.mSharedPrefs.edit().putString(str, this.mContext.getResources().getResourceName(i)).apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void resetNumDaysDailyRotationFailed() {
        this.mNoBackupPrefs.edit().putInt("num_days_daily_rotation_failed", 0).apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void resetNumDaysDailyRotationNotAttempted() {
        this.mNoBackupPrefs.edit().putInt("num_days_daily_rotation_not_attempted", 0).apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setDailyWallpaperEnabledTimestamp(long j) {
        this.mNoBackupPrefs.edit().putLong("daily_wallpaper_enabled_timestamp", j).apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setDailyWallpaperRotationStatus(int i, long j) {
        this.mNoBackupPrefs.edit().putInt("last_rotation_status", i).putLong("last_rotation_status_timestamp", j).apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setHomeWallpaperActionIconRes(int i) {
        persistResIdByName("home_wallpaper_action_icon", i);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setHomeWallpaperActionLabelRes(int i) {
        persistResIdByName("home_wallpaper_action_label", i);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setHomeWallpaperActionUrl(String str) {
        this.mSharedPrefs.edit().putString("home_wallpaper_action_url", str).apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setHomeWallpaperAttributions(List<String> list) {
        SharedPreferences.Editor edit = this.mSharedPrefs.edit();
        if (list.size() > 0) {
            edit.putString("home_wallpaper_attribution_line_1", list.get(0));
        }
        if (list.size() > 1) {
            edit.putString("home_wallpaper_attribution_line_2", list.get(1));
        }
        if (list.size() > 2) {
            edit.putString("home_wallpaper_attribution_line_3", list.get(2));
        }
        edit.apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setHomeWallpaperBackingFileName(String str) {
        this.mNoBackupPrefs.edit().putString("home_wallpaper_backing_file", str).apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setHomeWallpaperBaseImageUrl(String str) {
        this.mNoBackupPrefs.edit().putString("home_wallpaper_base_image_url", str).apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setHomeWallpaperCollectionId(String str) {
        this.mSharedPrefs.edit().putString("home_wallpaper_collection_id", str).apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setHomeWallpaperHashCode(long j) {
        this.mSharedPrefs.edit().putLong("home_wallpaper_hash_code", j).apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setHomeWallpaperManagerId(int i) {
        this.mNoBackupPrefs.edit().putInt("home_wallpaper_id", i).apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setHomeWallpaperPackageName(String str) {
        this.mNoBackupPrefs.edit().putString("home_wallpaper_package_name", str).apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setHomeWallpaperRemoteId(String str) {
        this.mNoBackupPrefs.edit().putString("home_wallpaper_remote_id", str).apply();
        setFirstWallpaperApplyDateIfNeeded();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setHomeWallpaperServiceName(String str) {
        this.mNoBackupPrefs.edit().putString("home_wallpaper_service_name", str).apply();
        setFirstWallpaperApplyDateIfNeeded();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setLastAppActiveTimestamp(long j) {
        this.mNoBackupPrefs.edit().putLong("last_app_active_timestamp", j).apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setLastDailyLogTimestamp(long j) {
        this.mNoBackupPrefs.edit().putLong("last_daily_log_timestamp", j).apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setLockWallpaperActionIconRes(int i) {
        persistResIdByName("lock_wallpaper_action_icon", i);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setLockWallpaperActionLabelRes(int i) {
        persistResIdByName("lock_wallpaper_action_label", i);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setLockWallpaperActionUrl(String str) {
        this.mSharedPrefs.edit().putString("lock_wallpaper_action_url", str).apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setLockWallpaperAttributions(List<String> list) {
        SharedPreferences.Editor edit = this.mSharedPrefs.edit();
        if (list.size() > 0) {
            edit.putString("lock_wallpaper_attribution_line_1", list.get(0));
        }
        if (list.size() > 1) {
            edit.putString("lock_wallpaper_attribution_line_2", list.get(1));
        }
        if (list.size() > 2) {
            edit.putString("lock_wallpaper_attribution_line_3", list.get(2));
        }
        edit.apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setLockWallpaperCollectionId(String str) {
        this.mSharedPrefs.edit().putString("lock_wallpaper_collection_id", str).apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setLockWallpaperHashCode(long j) {
        this.mSharedPrefs.edit().putLong("lock_wallpaper_hash_code", j).apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setLockWallpaperId(int i) {
        this.mNoBackupPrefs.edit().putInt("lock_wallpaper_id", i).apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setLockWallpaperRemoteId(String str) {
        this.mNoBackupPrefs.edit().putString("lock_wallpaper_remote_id", str).apply();
        setFirstWallpaperApplyDateIfNeeded();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setPendingDailyWallpaperUpdateStatus(int i) {
        this.mNoBackupPrefs.edit().putInt("pending_daily_wallpaper_update_status", i).apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setPendingDailyWallpaperUpdateStatusSync() {
        this.mNoBackupPrefs.edit().putInt("pending_daily_wallpaper_update_status", 0).commit();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setPendingWallpaperSetStatus(int i) {
        this.mNoBackupPrefs.edit().putInt("pending_wallpaper_set_status", i).apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setPendingWallpaperSetStatusSync() {
        this.mNoBackupPrefs.edit().putInt("pending_wallpaper_set_status", 0).commit();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void setWallpaperPresentationMode(int i) {
        this.mSharedPrefs.edit().putInt("wallpaper_presentation_mode", i).apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void updateDailyWallpaperSet(int i, String str, String str2) {
        if (i == 0) {
            setHomeWallpaperCollectionId(str);
            setHomeWallpaperRemoteId(str2);
        } else if (i == 1) {
            setLockWallpaperCollectionId(str);
            setLockWallpaperRemoteId(str2);
        } else if (i == 2) {
            setHomeWallpaperCollectionId(str);
            setHomeWallpaperRemoteId(str2);
            setLockWallpaperCollectionId(str);
            setLockWallpaperRemoteId(str2);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r10v1, types: [android.content.SharedPreferences$OnSharedPreferenceChangeListener, com.android.wallpaper.module.DefaultWallpaperPreferences$$ExternalSyntheticLambda0] */
    public DefaultWallpaperPreferences(Context context) {
        this.mSharedPrefs = context.getSharedPreferences("wallpaper", 0);
        SharedPreferences sharedPreferences = context.getSharedPreferences("wallpaper-nobackup", 0);
        this.mNoBackupPrefs = sharedPreferences;
        if (sharedPreferences.getAll().isEmpty() && !this.mSharedPrefs.getAll().isEmpty()) {
            SharedPreferences.Editor edit = this.mNoBackupPrefs.edit();
            if (this.mSharedPrefs.contains("home_wallpaper_base_image_url")) {
                edit.putString("home_wallpaper_base_image_url", this.mSharedPrefs.getString("home_wallpaper_base_image_url", null));
            }
            if (this.mSharedPrefs.contains("home_wallpaper_id")) {
                edit.putInt("home_wallpaper_id", this.mSharedPrefs.getInt("home_wallpaper_id", 0));
            }
            if (this.mSharedPrefs.contains("home_wallpaper_remote_id")) {
                edit.putString("home_wallpaper_remote_id", this.mSharedPrefs.getString("home_wallpaper_remote_id", null));
            }
            if (this.mSharedPrefs.contains("home_wallpaper_backing_file")) {
                edit.putString("home_wallpaper_backing_file", this.mSharedPrefs.getString("home_wallpaper_backing_file", null));
            }
            if (this.mSharedPrefs.contains("lock_wallpaper_id")) {
                edit.putInt("lock_wallpaper_id", this.mSharedPrefs.getInt("lock_wallpaper_id", 0));
            }
            if (this.mSharedPrefs.contains("lock_wallpaper_backing_file")) {
                edit.putString("lock_wallpaper_backing_file", this.mSharedPrefs.getString("lock_wallpaper_backing_file", null));
            }
            if (this.mSharedPrefs.contains("daily_rotation_timestamps")) {
                edit.putString("daily_rotation_timestamps", this.mSharedPrefs.getString("daily_rotation_timestamps", null));
            }
            if (this.mSharedPrefs.contains("daily_wallpaper_enabled_timestamp")) {
                edit.putLong("daily_wallpaper_enabled_timestamp", this.mSharedPrefs.getLong("daily_wallpaper_enabled_timestamp", -1L));
            }
            if (this.mSharedPrefs.contains("last_daily_log_timestamp")) {
                edit.putLong("last_daily_log_timestamp", this.mSharedPrefs.getLong("last_daily_log_timestamp", 0L));
            }
            if (this.mSharedPrefs.contains("last_app_active_timestamp")) {
                edit.putLong("last_app_active_timestamp", this.mSharedPrefs.getLong("last_app_active_timestamp", 0L));
            }
            if (this.mSharedPrefs.contains("last_rotation_status")) {
                edit.putInt("last_rotation_status", this.mSharedPrefs.getInt("last_rotation_status", -1));
            }
            if (this.mSharedPrefs.contains("last_rotation_status_timestamp")) {
                edit.putLong("last_rotation_status_timestamp", this.mSharedPrefs.getLong("last_rotation_status_timestamp", 0L));
            }
            if (this.mSharedPrefs.contains("last_sync_timestamp")) {
                edit.putLong("last_sync_timestamp", this.mSharedPrefs.getLong("last_sync_timestamp", 0L));
            }
            if (this.mSharedPrefs.contains("pending_wallpaper_set_status")) {
                edit.putInt("pending_wallpaper_set_status", this.mSharedPrefs.getInt("pending_wallpaper_set_status", 0));
            }
            if (this.mSharedPrefs.contains("pending_daily_wallpaper_update_status")) {
                edit.putInt("pending_daily_wallpaper_update_status", this.mSharedPrefs.getInt("pending_daily_wallpaper_update_status", 0));
            }
            if (this.mSharedPrefs.contains("num_days_daily_rotation_failed")) {
                edit.putInt("num_days_daily_rotation_failed", this.mSharedPrefs.getInt("num_days_daily_rotation_failed", 0));
            }
            if (this.mSharedPrefs.contains("num_days_daily_rotation_not_attempted")) {
                edit.putInt("num_days_daily_rotation_not_attempted", this.mSharedPrefs.getInt("num_days_daily_rotation_not_attempted", 0));
            }
            if (this.mSharedPrefs.contains("home_wallpaper_package_name")) {
                edit.putString("home_wallpaper_package_name", this.mSharedPrefs.getString("home_wallpaper_package_name", null));
            }
            if (this.mSharedPrefs.contains("home_wallpaper_service_name")) {
                edit.putString("home_wallpaper_service_name", this.mSharedPrefs.getString("home_wallpaper_service_name", null));
            }
            edit.apply();
        }
        this.mContext = context.getApplicationContext();
        final BackupManager backupManager = new BackupManager(context);
        ?? defaultWallpaperPreferences$$ExternalSyntheticLambda0 = new SharedPreferences.OnSharedPreferenceChangeListener() { // from class: com.android.wallpaper.module.DefaultWallpaperPreferences$$ExternalSyntheticLambda0
            @Override // android.content.SharedPreferences.OnSharedPreferenceChangeListener
            public final void onSharedPreferenceChanged(SharedPreferences sharedPreferences2, String str) {
                backupManager.dataChanged();
            }
        };
        this.mSharedPrefsChangedListener = defaultWallpaperPreferences$$ExternalSyntheticLambda0;
        this.mSharedPrefs.registerOnSharedPreferenceChangeListener(defaultWallpaperPreferences$$ExternalSyntheticLambda0);
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void clearHomeWallpaperMetadata() {
        String homeWallpaperBackingFileName = getHomeWallpaperBackingFileName();
        if (!TextUtils.isEmpty(homeWallpaperBackingFileName)) {
            new File(homeWallpaperBackingFileName).delete();
        }
        this.mSharedPrefs.edit().remove("home_wallpaper_attribution_line_1").remove("home_wallpaper_attribution_line_2").remove("home_wallpaper_attribution_line_3").remove("home_wallpaper_action_url").remove("home_wallpaper_action_label").remove("home_wallpaper_action_icon").remove("home_wallpaper_hash_code").apply();
        this.mNoBackupPrefs.edit().remove("home_wallpaper_package_name").remove("home_wallpaper_id").remove("home_wallpaper_remote_id").remove("home_wallpaper_service_name").remove("home_wallpaper_base_image_url").remove("home_wallpaper_backing_file").apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void clearLockWallpaperMetadata() {
        String lockWallpaperBackingFileName = getLockWallpaperBackingFileName();
        if (!TextUtils.isEmpty(lockWallpaperBackingFileName)) {
            new File(lockWallpaperBackingFileName).delete();
        }
        this.mSharedPrefs.edit().remove("lock_wallpaper_attribution_line_1").remove("lock_wallpaper_attribution_line_2").remove("lock_wallpaper_attribution_line_3").remove("lock_wallpaper_action_url").remove("lock_wallpaper_action_label").remove("lock_wallpaper_action_icon").remove("lock_wallpaper_collection_id").remove("lock_wallpaper_hash_code").apply();
        this.mNoBackupPrefs.edit().remove("lock_wallpaper_id").remove("lock_wallpaper_backing_file").remove("lock_wallpaper_remote_id").apply();
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final ArrayList getDailyRotationsInLastWeek() {
        long dailyWallpaperEnabledTimestamp = getDailyWallpaperEnabledTimestamp();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.add(3, -1);
        long timeInMillis = calendar.getTimeInMillis();
        if (dailyWallpaperEnabledTimestamp == -1 || dailyWallpaperEnabledTimestamp > timeInMillis) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        try {
            JSONArray jSONArray = new JSONArray(this.mNoBackupPrefs.getString("daily_rotation_timestamps", "[]"));
            for (int i = 0; i < jSONArray.length(); i++) {
                long j = jSONArray.getLong(i);
                if (j >= timeInMillis) {
                    arrayList.add(Long.valueOf(j));
                }
            }
            this.mNoBackupPrefs.edit().putString("daily_rotation_timestamps", new JSONArray((Collection) arrayList).toString()).apply();
        } catch (JSONException unused) {
            Log.e("DefaultWPPreferences", "Failed to get daily rotation timestamps due to a JSON parse exception");
        }
        return arrayList;
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final ArrayList getDailyRotationsPreviousDay() {
        long dailyWallpaperEnabledTimestamp = getDailyWallpaperEnabledTimestamp();
        Calendar calendar = Calendar.getInstance();
        calendar.set(9, 0);
        calendar.set(10, 0);
        calendar.set(12, 0);
        calendar.add(5, -1);
        long timeInMillis = calendar.getTimeInMillis();
        Calendar calendar2 = Calendar.getInstance();
        calendar2.set(9, 0);
        calendar2.set(10, 0);
        calendar2.set(12, 0);
        long timeInMillis2 = calendar2.getTimeInMillis();
        if (dailyWallpaperEnabledTimestamp == -1 || dailyWallpaperEnabledTimestamp > timeInMillis) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        try {
            JSONArray jSONArray = new JSONArray(this.mNoBackupPrefs.getString("daily_rotation_timestamps", "[]"));
            for (int i = 0; i < jSONArray.length(); i++) {
                long j = jSONArray.getLong(i);
                if (j >= timeInMillis && j < timeInMillis2) {
                    arrayList.add(Long.valueOf(j));
                }
            }
        } catch (JSONException unused) {
            Log.e("DefaultWPPreferences", "Failed to get daily rotation timestamps due to a JSON parse exception");
        }
        return arrayList;
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void incrementAppLaunched() {
        if (getFirstLaunchDateSinceSetup() == 0) {
            this.mNoBackupPrefs.edit().putInt("first_launch_date_since_setup", getCurrentDate()).apply();
        }
        int appLaunchCount = getAppLaunchCount();
        if (appLaunchCount < Integer.MAX_VALUE) {
            this.mNoBackupPrefs.edit().putInt("app_launch_count", appLaunchCount + 1).apply();
        }
    }

    public final void setFirstWallpaperApplyDateIfNeeded() {
        if (getFirstWallpaperApplyDateSinceSetup() == 0) {
            this.mNoBackupPrefs.edit().putInt("first_wallpaper_apply_date_since_setup", getCurrentDate()).apply();
        }
    }

    @Override // com.android.wallpaper.module.WallpaperPreferences
    public final void storeWallpaperColors(String str, WallpaperColors wallpaperColors) {
        Color secondaryColor;
        Color tertiaryColor;
        String str2 = new String(String.valueOf(wallpaperColors.getPrimaryColor().toArgb()));
        if (wallpaperColors.getSecondaryColor() != null) {
            str2 = str2 + "," + secondaryColor.toArgb();
        }
        if (wallpaperColors.getTertiaryColor() != null) {
            str2 = str2 + "," + tertiaryColor.toArgb();
        }
        this.mNoBackupPrefs.edit().putString("preview_wallpaper_color_id" + str, str2).apply();
    }
}
