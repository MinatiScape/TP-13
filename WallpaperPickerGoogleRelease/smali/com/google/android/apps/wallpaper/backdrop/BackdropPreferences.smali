.class public Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static sInstance:Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;


# instance fields
.field public mSharedPrefs:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "wallpaper-backdrop"

    const/4 v1, 0x0

    .line 2
    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    .line 3
    new-instance v0, Landroid/app/backup/BackupManager;

    invoke-direct {v0, p1}, Landroid/app/backup/BackupManager;-><init>(Landroid/content/Context;)V

    .line 4
    new-instance p1, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences$1;

    invoke-direct {p1, p0, v0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences$1;-><init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;Landroid/app/backup/BackupManager;)V

    .line 5
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->sInstance:Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;

    invoke-direct {v0, p0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->sInstance:Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;

    .line 3
    :cond_0
    sget-object p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->sInstance:Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;

    return-object p0
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "collection_id"

    .line 2
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "collection_name"

    .line 3
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "required_network_state"

    .line 4
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "resume_token"

    .line 5
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 6
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public getCollectionId()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v0, "collection_id"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getCollectionName()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v0, "collection_name"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getResumeToken()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v0, "resume_token"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public setResumeToken(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v0, "resume_token"

    invoke-static {p0, v0, p1}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences$$ExternalSyntheticOutline0;->m(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
