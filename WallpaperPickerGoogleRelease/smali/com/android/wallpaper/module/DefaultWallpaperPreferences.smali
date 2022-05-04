.class public Lcom/android/wallpaper/module/DefaultWallpaperPreferences;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/WallpaperPreferences;


# instance fields
.field public mContext:Landroid/content/Context;

.field public mNoBackupPrefs:Landroid/content/SharedPreferences;

.field public mSharedPrefs:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 9

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "wallpaper"

    const/4 v1, 0x0

    .line 2
    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v0, "wallpaper-nobackup"

    .line 3
    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    .line 4
    invoke-interface {v0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_13

    .line 5
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 6
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v3, "home_wallpaper_base_image_url"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    const/4 v4, 0x0

    if-eqz v2, :cond_0

    .line 7
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    .line 8
    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 9
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 10
    :cond_0
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v3, "home_wallpaper_id"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 11
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    .line 12
    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 13
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 14
    :cond_1
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v3, "home_wallpaper_remote_id"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 15
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    .line 16
    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 17
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 18
    :cond_2
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v3, "home_wallpaper_backing_file"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 19
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    .line 20
    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 21
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 22
    :cond_3
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v3, "lock_wallpaper_id"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 23
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    .line 24
    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 25
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 26
    :cond_4
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v3, "lock_wallpaper_backing_file"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 27
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    .line 28
    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 29
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 30
    :cond_5
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v3, "daily_rotation_timestamps"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 31
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    .line 32
    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 33
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 34
    :cond_6
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v3, "daily_wallpaper_enabled_timestamp"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 35
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-wide/16 v5, -0x1

    .line 36
    invoke-interface {v2, v3, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    .line 37
    invoke-interface {v0, v3, v5, v6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 38
    :cond_7
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v3, "last_daily_log_timestamp"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    const-wide/16 v5, 0x0

    if-eqz v2, :cond_8

    .line 39
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    .line 40
    invoke-interface {v2, v3, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v7

    .line 41
    invoke-interface {v0, v3, v7, v8}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 42
    :cond_8
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v3, "last_app_active_timestamp"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 43
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    .line 44
    invoke-interface {v2, v3, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v7

    .line 45
    invoke-interface {v0, v3, v7, v8}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 46
    :cond_9
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v3, "last_rotation_status"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 47
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const/4 v7, -0x1

    .line 48
    invoke-interface {v2, v3, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 49
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 50
    :cond_a
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v3, "last_rotation_status_timestamp"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 51
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    .line 52
    invoke-interface {v2, v3, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v7

    .line 53
    invoke-interface {v0, v3, v7, v8}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 54
    :cond_b
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v3, "last_sync_timestamp"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 55
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    .line 56
    invoke-interface {v2, v3, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    .line 57
    invoke-interface {v0, v3, v5, v6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 58
    :cond_c
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v3, "pending_wallpaper_set_status"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 59
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    .line 60
    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 61
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 62
    :cond_d
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v3, "pending_daily_wallpaper_update_status"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 63
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    .line 64
    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 65
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 66
    :cond_e
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v3, "num_days_daily_rotation_failed"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 67
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    .line 68
    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 69
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 70
    :cond_f
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v3, "num_days_daily_rotation_not_attempted"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 71
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    .line 72
    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 73
    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 74
    :cond_10
    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v2, "home_wallpaper_package_name"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 75
    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    .line 76
    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 77
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 78
    :cond_11
    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v2, "home_wallpaper_service_name"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 79
    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    .line 80
    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 81
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 82
    :cond_12
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 83
    :cond_13
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mContext:Landroid/content/Context;

    .line 84
    new-instance v0, Landroid/app/backup/BackupManager;

    invoke-direct {v0, p1}, Landroid/app/backup/BackupManager;-><init>(Landroid/content/Context;)V

    .line 85
    new-instance p1, Lcom/android/wallpaper/module/DefaultWallpaperPreferences$$ExternalSyntheticLambda1;

    invoke-direct {p1, v0}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences$$ExternalSyntheticLambda1;-><init>(Landroid/app/backup/BackupManager;)V

    .line 86
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    return-void
.end method


# virtual methods
.method public addDailyRotation(J)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v1, "daily_rotation_timestamps"

    const-string v2, "[]"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2
    :try_start_0
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 3
    invoke-virtual {v2, p1, p2}, Lorg/json/JSONArray;->put(J)Lorg/json/JSONArray;

    .line 4
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 5
    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p1

    .line 6
    invoke-interface {p0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 7
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p0, "DefaultWPPreferences"

    const-string p1, "Failed to add a daily rotation timestamp due to a JSON parse exception"

    .line 8
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method public clearDailyRotations()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "daily_rotation_timestamps"

    .line 2
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "daily_wallpaper_enabled_timestamp"

    .line 3
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 4
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public clearHomeWallpaperMetadata()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->getHomeWallpaperBackingFileName()Ljava/lang/String;

    move-result-object v0

    .line 2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 3
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "home_wallpaper_attribution_line_1"

    .line 5
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "home_wallpaper_attribution_line_2"

    .line 6
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "home_wallpaper_attribution_line_3"

    .line 7
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "home_wallpaper_action_url"

    .line 8
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "home_wallpaper_action_label"

    .line 9
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "home_wallpaper_action_icon"

    .line 10
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "home_wallpaper_hash_code"

    .line 11
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 12
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 13
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "home_wallpaper_package_name"

    .line 14
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "home_wallpaper_id"

    .line 15
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "home_wallpaper_remote_id"

    .line 16
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "home_wallpaper_service_name"

    .line 17
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "home_wallpaper_base_image_url"

    .line 18
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "home_wallpaper_backing_file"

    .line 19
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 20
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public clearLockWallpaperMetadata()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->getLockWallpaperBackingFileName()Ljava/lang/String;

    move-result-object v0

    .line 2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 3
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "lock_wallpaper_attribution_line_1"

    .line 5
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "lock_wallpaper_attribution_line_2"

    .line 6
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "lock_wallpaper_attribution_line_3"

    .line 7
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "lock_wallpaper_action_url"

    .line 8
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "lock_wallpaper_action_label"

    .line 9
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "lock_wallpaper_action_icon"

    .line 10
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "lock_wallpaper_collection_id"

    .line 11
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "lock_wallpaper_hash_code"

    .line 12
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 13
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 14
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "lock_wallpaper_id"

    .line 15
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "lock_wallpaper_backing_file"

    .line 16
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "lock_wallpaper_remote_id"

    .line 17
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 18
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public getAppLaunchCount()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "app_launch_count"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public final getCurrentDate()I
    .locals 3

    const-string p0, "UTC"

    .line 1
    invoke-static {p0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object p0

    .line 2
    new-instance v0, Ljava/text/SimpleDateFormat;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "yyyyMMdd"

    invoke-direct {v0, v2, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 3
    invoke-virtual {p0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public getDailyRotationsInLastWeek()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->getDailyWallpaperEnabledTimestamp()J

    move-result-wide v0

    .line 2
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    .line 3
    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2, v3}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    const/4 v3, 0x3

    const/4 v4, -0x1

    .line 4
    invoke-virtual {v2, v3, v4}, Ljava/util/Calendar;->add(II)V

    .line 5
    invoke-virtual {v2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v4, v0, v4

    if-eqz v4, :cond_3

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    goto :goto_2

    .line 6
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v4, "daily_rotation_timestamps"

    const-string v5, "[]"

    invoke-interface {v1, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 8
    :try_start_0
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x0

    .line 9
    :goto_0
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v1, v6, :cond_2

    .line 10
    invoke-virtual {v5, v1}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v6

    cmp-long v8, v6, v2

    if-ltz v8, :cond_1

    .line 11
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 12
    :cond_2
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, v0}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    .line 13
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 14
    invoke-virtual {v1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v1

    .line 15
    invoke-interface {p0, v4, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 16
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    const-string p0, "DefaultWPPreferences"

    const-string v1, "Failed to get daily rotation timestamps due to a JSON parse exception"

    .line 17
    invoke-static {p0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    return-object v0

    :cond_3
    :goto_2
    const/4 p0, 0x0

    return-object p0
.end method

.method public getDailyRotationsPreviousDay()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->getDailyWallpaperEnabledTimestamp()J

    move-result-wide v0

    .line 2
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    const/16 v3, 0x9

    const/4 v4, 0x0

    .line 3
    invoke-virtual {v2, v3, v4}, Ljava/util/Calendar;->set(II)V

    const/16 v5, 0xa

    .line 4
    invoke-virtual {v2, v5, v4}, Ljava/util/Calendar;->set(II)V

    const/16 v6, 0xc

    .line 5
    invoke-virtual {v2, v6, v4}, Ljava/util/Calendar;->set(II)V

    const/4 v7, 0x5

    const/4 v8, -0x1

    .line 6
    invoke-virtual {v2, v7, v8}, Ljava/util/Calendar;->add(II)V

    .line 7
    invoke-virtual {v2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v7

    .line 8
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    .line 9
    invoke-virtual {v2, v3, v4}, Ljava/util/Calendar;->set(II)V

    .line 10
    invoke-virtual {v2, v5, v4}, Ljava/util/Calendar;->set(II)V

    .line 11
    invoke-virtual {v2, v6, v4}, Ljava/util/Calendar;->set(II)V

    .line 12
    invoke-virtual {v2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    const-wide/16 v5, -0x1

    cmp-long v5, v0, v5

    if-eqz v5, :cond_3

    cmp-long v0, v0, v7

    if-lez v0, :cond_0

    goto :goto_1

    .line 13
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v1, "daily_rotation_timestamps"

    const-string v5, "[]"

    invoke-interface {p0, v1, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 15
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 16
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result p0

    if-ge v4, p0, :cond_2

    .line 17
    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v5

    cmp-long p0, v5, v7

    if-ltz p0, :cond_1

    cmp-long p0, v5, v2

    if-gez p0, :cond_1

    .line 18
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :catch_0
    const-string p0, "DefaultWPPreferences"

    const-string v1, "Failed to get daily rotation timestamps due to a JSON parse exception"

    .line 19
    invoke-static {p0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    return-object v0

    :cond_3
    :goto_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public getDailyWallpaperEnabledTimestamp()J
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "daily_wallpaper_enabled_timestamp"

    const-wide/16 v1, -0x1

    invoke-interface {p0, v0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getDailyWallpaperLastRotationStatus()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "last_rotation_status"

    const/4 v1, -0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public getDailyWallpaperLastRotationStatusTimestamp()J
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "last_rotation_status_timestamp"

    const-wide/16 v1, 0x0

    invoke-interface {p0, v0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getFirstLaunchDateSinceSetup()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "first_launch_date_since_setup"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public getFirstWallpaperApplyDateSinceSetup()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "first_wallpaper_apply_date_since_setup"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public getHomeWallpaperActionIconRes()I
    .locals 2

    const-string v0, "home_wallpaper_action_icon"

    const-string v1, "drawable"

    .line 1
    invoke-virtual {p0, v0, v1}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->getResIdPersistedByName(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public getHomeWallpaperActionLabelRes()I
    .locals 2

    const-string v0, "home_wallpaper_action_label"

    const-string v1, "string"

    .line 1
    invoke-virtual {p0, v0, v1}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->getResIdPersistedByName(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public getHomeWallpaperActionUrl()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v0, "home_wallpaper_action_url"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getHomeWallpaperAttributions()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    .line 1
    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v2, "home_wallpaper_attribution_line_1"

    const/4 v3, 0x0

    .line 2
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v2, "home_wallpaper_attribution_line_2"

    .line 3
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v1, "home_wallpaper_attribution_line_3"

    .line 4
    invoke-interface {p0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x2

    aput-object p0, v0, v1

    .line 5
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public getHomeWallpaperBackingFileName()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "home_wallpaper_backing_file"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getHomeWallpaperBaseImageUrl()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "home_wallpaper_base_image_url"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getHomeWallpaperCollectionId()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v0, "home_wallpaper_collection_id"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getHomeWallpaperHashCode()J
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v0, "home_wallpaper_hash_code"

    const-wide/16 v1, 0x0

    invoke-interface {p0, v0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getHomeWallpaperManagerId()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "home_wallpaper_id"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public getHomeWallpaperPackageName()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "home_wallpaper_package_name"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getHomeWallpaperRemoteId()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "home_wallpaper_remote_id"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getHomeWallpaperServiceName()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "home_wallpaper_service_name"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getLastDailyLogTimestamp()J
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "last_daily_log_timestamp"

    const-wide/16 v1, 0x0

    invoke-interface {p0, v0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getLastDailyRotationTimestamp()J
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "daily_rotation_timestamps"

    const-string v1, "[]"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-wide/16 v0, -0x1

    .line 2
    :try_start_0
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 3
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result p0

    if-nez p0, :cond_0

    return-wide v0

    .line 4
    :cond_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result p0

    add-int/lit8 p0, p0, -0x1

    invoke-virtual {v2, p0}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    const-string p0, "DefaultWPPreferences"

    const-string v2, "Failed to find a daily rotation timestamp due to a JSON parse exception"

    .line 5
    invoke-static {p0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-wide v0
.end method

.method public getLastSyncTimestamp()J
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "last_sync_timestamp"

    const-wide/16 v1, 0x0

    invoke-interface {p0, v0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getLockWallpaperActionIconRes()I
    .locals 2

    const-string v0, "lock_wallpaper_action_icon"

    const-string v1, "drawable"

    .line 1
    invoke-virtual {p0, v0, v1}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->getResIdPersistedByName(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public getLockWallpaperActionLabelRes()I
    .locals 2

    const-string v0, "lock_wallpaper_action_label"

    const-string v1, "string"

    .line 1
    invoke-virtual {p0, v0, v1}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->getResIdPersistedByName(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public getLockWallpaperActionUrl()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v0, "lock_wallpaper_action_url"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getLockWallpaperAttributions()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    .line 1
    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v2, "lock_wallpaper_attribution_line_1"

    const/4 v3, 0x0

    .line 2
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v2, "lock_wallpaper_attribution_line_2"

    .line 3
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v1, "lock_wallpaper_attribution_line_3"

    .line 4
    invoke-interface {p0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x2

    aput-object p0, v0, v1

    .line 5
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public getLockWallpaperBackingFileName()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "lock_wallpaper_backing_file"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getLockWallpaperCollectionId()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v0, "lock_wallpaper_collection_id"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getLockWallpaperHashCode()J
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v0, "lock_wallpaper_hash_code"

    const-wide/16 v1, 0x0

    invoke-interface {p0, v0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getLockWallpaperId()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "lock_wallpaper_id"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public getLockWallpaperRemoteId()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "lock_wallpaper_remote_id"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getNumDaysDailyRotationFailed()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "num_days_daily_rotation_failed"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public getNumDaysDailyRotationNotAttempted()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "num_days_daily_rotation_not_attempted"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public getPendingDailyWallpaperUpdateStatus()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "pending_daily_wallpaper_update_status"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public getPendingWallpaperSetStatus()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "pending_wallpaper_set_status"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public final getResIdPersistedByName(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return p0

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mContext:Landroid/content/Context;

    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    .line 4
    invoke-virtual {v0, p1, p2, p0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public getWallpaperPresentationMode()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v0, "wallpaper_presentation_mode"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public incrementAppLaunched()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v1, "first_launch_date_since_setup"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->getCurrentDate()I

    move-result v0

    .line 3
    iget-object v3, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3, v1, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 4
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 5
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v1, "app_launch_count"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    const v2, 0x7fffffff

    if-ge v0, v2, :cond_1

    add-int/lit8 v0, v0, 0x1

    .line 6
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_1
    return-void
.end method

.method public incrementNumDaysDailyRotationFailed()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    const-string v2, "num_days_daily_rotation_failed"

    invoke-interface {p0, v2, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    add-int/lit8 p0, p0, 0x1

    .line 3
    invoke-interface {v0, v2, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 4
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public incrementNumDaysDailyRotationNotAttempted()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    const-string v2, "num_days_daily_rotation_not_attempted"

    invoke-interface {p0, v2, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    add-int/lit8 p0, p0, 0x1

    .line 3
    invoke-interface {v0, v2, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 4
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public final persistResIdByName(Ljava/lang/String;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p2

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    invoke-static {p0, p1, p2}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences$$ExternalSyntheticOutline0;->m(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public resetNumDaysDailyRotationFailed()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "num_days_daily_rotation_failed"

    const/4 v1, 0x0

    .line 2
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 3
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public resetNumDaysDailyRotationNotAttempted()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "num_days_daily_rotation_not_attempted"

    const/4 v1, 0x0

    .line 2
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 3
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setDailyWallpaperEnabledTimestamp(J)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "daily_wallpaper_enabled_timestamp"

    .line 2
    invoke-interface {p0, v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 3
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setDailyWallpaperRotationStatus(IJ)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "last_rotation_status"

    .line 2
    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "last_rotation_status_timestamp"

    .line 3
    invoke-interface {p0, p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 4
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public final setFirstWallpaperApplyDateIfNeeded()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    const-string v2, "first_wallpaper_apply_date_since_setup"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->getCurrentDate()I

    move-result v0

    .line 3
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, v2, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 4
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_0
    return-void
.end method

.method public setHomeWallpaperActionIconRes(I)V
    .locals 1

    const-string v0, "home_wallpaper_action_icon"

    .line 1
    invoke-virtual {p0, v0, p1}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->persistResIdByName(Ljava/lang/String;I)V

    return-void
.end method

.method public setHomeWallpaperActionLabelRes(I)V
    .locals 1

    const-string v0, "home_wallpaper_action_label"

    .line 1
    invoke-virtual {p0, v0, p1}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->persistResIdByName(Ljava/lang/String;I)V

    return-void
.end method

.method public setHomeWallpaperActionUrl(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v0, "home_wallpaper_action_url"

    invoke-static {p0, v0, p1}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences$$ExternalSyntheticOutline0;->m(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setHomeWallpaperAttributions(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 2
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x0

    .line 3
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "home_wallpaper_attribution_line_1"

    .line 4
    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 5
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_1

    .line 6
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "home_wallpaper_attribution_line_2"

    .line 7
    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 8
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x2

    if-le v0, v1, :cond_2

    .line 9
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const-string v0, "home_wallpaper_attribution_line_3"

    .line 10
    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 11
    :cond_2
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setHomeWallpaperBackingFileName(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "home_wallpaper_backing_file"

    invoke-static {p0, v0, p1}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences$$ExternalSyntheticOutline0;->m(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setHomeWallpaperBaseImageUrl(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "home_wallpaper_base_image_url"

    invoke-static {p0, v0, p1}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences$$ExternalSyntheticOutline0;->m(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setHomeWallpaperCollectionId(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v0, "home_wallpaper_collection_id"

    invoke-static {p0, v0, p1}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences$$ExternalSyntheticOutline0;->m(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setHomeWallpaperHashCode(J)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "home_wallpaper_hash_code"

    invoke-interface {p0, v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 2
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setHomeWallpaperManagerId(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "home_wallpaper_id"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 2
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setHomeWallpaperPackageName(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "home_wallpaper_package_name"

    invoke-static {p0, v0, p1}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences$$ExternalSyntheticOutline0;->m(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setHomeWallpaperRemoteId(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "home_wallpaper_remote_id"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 2
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 3
    invoke-virtual {p0}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->setFirstWallpaperApplyDateIfNeeded()V

    return-void
.end method

.method public setHomeWallpaperServiceName(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "home_wallpaper_service_name"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 2
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 3
    invoke-virtual {p0}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->setFirstWallpaperApplyDateIfNeeded()V

    return-void
.end method

.method public setLastAppActiveTimestamp(J)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "last_app_active_timestamp"

    .line 2
    invoke-interface {p0, v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 3
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setLastDailyLogTimestamp(J)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "last_daily_log_timestamp"

    .line 2
    invoke-interface {p0, v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 3
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setLastSyncTimestamp(J)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "last_sync_timestamp"

    .line 2
    invoke-interface {p0, v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 3
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public setLockWallpaperActionIconRes(I)V
    .locals 1

    const-string v0, "lock_wallpaper_action_icon"

    .line 1
    invoke-virtual {p0, v0, p1}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->persistResIdByName(Ljava/lang/String;I)V

    return-void
.end method

.method public setLockWallpaperActionLabelRes(I)V
    .locals 1

    const-string v0, "lock_wallpaper_action_label"

    .line 1
    invoke-virtual {p0, v0, p1}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->persistResIdByName(Ljava/lang/String;I)V

    return-void
.end method

.method public setLockWallpaperActionUrl(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v0, "lock_wallpaper_action_url"

    invoke-static {p0, v0, p1}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences$$ExternalSyntheticOutline0;->m(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setLockWallpaperAttributions(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 2
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x0

    .line 3
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "lock_wallpaper_attribution_line_1"

    .line 4
    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 5
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_1

    .line 6
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "lock_wallpaper_attribution_line_2"

    .line 7
    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 8
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x2

    if-le v0, v1, :cond_2

    .line 9
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const-string v0, "lock_wallpaper_attribution_line_3"

    .line 10
    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 11
    :cond_2
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setLockWallpaperCollectionId(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v0, "lock_wallpaper_collection_id"

    invoke-static {p0, v0, p1}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences$$ExternalSyntheticOutline0;->m(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setLockWallpaperHashCode(J)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "lock_wallpaper_hash_code"

    .line 2
    invoke-interface {p0, v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 3
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setLockWallpaperId(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "lock_wallpaper_id"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 2
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setLockWallpaperRemoteId(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "lock_wallpaper_remote_id"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 2
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 3
    invoke-virtual {p0}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->setFirstWallpaperApplyDateIfNeeded()V

    return-void
.end method

.method public setPendingDailyWallpaperUpdateStatus(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "pending_daily_wallpaper_update_status"

    .line 2
    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 3
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setPendingDailyWallpaperUpdateStatusSync(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "pending_daily_wallpaper_update_status"

    .line 2
    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 3
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public setPendingWallpaperSetStatus(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "pending_wallpaper_set_status"

    .line 2
    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 3
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setPendingWallpaperSetStatusSync(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "pending_wallpaper_set_status"

    .line 2
    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 3
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public setWallpaperPresentationMode(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "wallpaper_presentation_mode"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 2
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public updateDailyWallpaperSet(ILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    if-nez p1, :cond_0

    .line 1
    invoke-virtual {p0, p2}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->setHomeWallpaperCollectionId(Ljava/lang/String;)V

    .line 2
    invoke-virtual {p0, p3}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->setHomeWallpaperRemoteId(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 3
    invoke-virtual {p0, p2}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->setLockWallpaperCollectionId(Ljava/lang/String;)V

    .line 4
    invoke-virtual {p0, p3}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->setLockWallpaperRemoteId(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    .line 5
    invoke-virtual {p0, p2}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->setHomeWallpaperCollectionId(Ljava/lang/String;)V

    .line 6
    invoke-virtual {p0, p3}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->setHomeWallpaperRemoteId(Ljava/lang/String;)V

    .line 7
    invoke-virtual {p0, p2}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->setLockWallpaperCollectionId(Ljava/lang/String;)V

    .line 8
    invoke-virtual {p0, p3}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->setLockWallpaperRemoteId(Ljava/lang/String;)V

    :cond_2
    :goto_0
    return-void
.end method
