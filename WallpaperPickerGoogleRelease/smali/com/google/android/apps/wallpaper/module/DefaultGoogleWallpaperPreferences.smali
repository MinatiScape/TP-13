.class public final Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;
.super Lcom/android/customization/module/DefaultCustomizationPreferences;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/android/customization/module/DefaultCustomizationPreferences;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public getDefaultRecentWallpapers()Lorg/json/JSONArray;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v1, "default_recent_wallpapers"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 2
    :try_start_0
    new-instance v0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1;

    invoke-direct {v0, p0, v2}, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1;-><init>(Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;Lkotlin/coroutines/Continuation;)V

    const/4 p0, 0x1

    invoke-static {v2, v0, p0, v2}, Lkotlinx/coroutines/BuildersKt;->runBlocking$default(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/json/JSONArray;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    const-string v0, "DefaultGoogleWallpaperPreferences"

    const-string v1, "Error generating quick switch defaults"

    .line 3
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 4
    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    return-object p0

    .line 5
    :cond_0
    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    return-object p0
.end method

.method public getLastToBeInstalled()Ljava/lang/String;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "last_to_be_installed_string"

    const-string v1, ""

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "mNoBackupPrefs.getString(KEY_LAST_TO_BE_INSTALLED_STRING, \"\")"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public getRecentWallpapers()Lorg/json/JSONArray;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v1, "recent_wallpapers"

    const-string v2, "[]"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mContext:Landroid/content/Context;

    const-string v0, "mContext"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v1, p0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->cleanUpRecentsArray(Lorg/json/JSONArray;Landroid/content/Context;)Lorg/json/JSONArray;

    return-object v1
.end method

.method public isThemesSanitized()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "themes_sanitized"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public final notifyRecentsChange()V
    .locals 3

    .line 1
    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    const-string v1, "content"

    .line 2
    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "com.google.android.apps.wallpaper.recents"

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "/list_recent"

    .line 3
    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 4
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    return-void
.end method

.method public setLastToBeInstalled(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const-string v0, "toBeInstalledString"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v0, "last_to_be_installed_string"

    invoke-static {p0, v0, p1}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences$$ExternalSyntheticOutline0;->m(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setThemesSanitized(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "themes_sanitized"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public final storeLastWallpaper(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Bitmap;Landroid/app/WallpaperInfo;Landroid/app/WallpaperColors;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            "Landroid/graphics/Bitmap;",
            "Landroid/app/WallpaperInfo;",
            "Landroid/app/WallpaperColors;",
            ")V"
        }
    .end annotation

    move-object v7, p0

    move-object v0, p1

    .line 1
    iget-object v1, v7, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    const-string v8, "recent_wallpapers"

    const-string v2, "[]"

    invoke-interface {v1, v8, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 2
    new-instance v10, Lorg/json/JSONArray;

    invoke-direct {v10, v9}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 3
    iget-object v11, v7, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mContext:Landroid/content/Context;

    .line 4
    invoke-virtual/range {p8 .. p8}, Landroid/app/WallpaperColors;->getPrimaryColor()Landroid/graphics/Color;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Color;->toArgb()I

    move-result v1

    const-string v2, "mContext"

    .line 5
    invoke-static {v11, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const-string v1, "id"

    .line 7
    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    invoke-static {v10, p1}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->reorderRecentsOnly(Lorg/json/JSONArray;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    move-object v1, p1

    move-object/from16 v2, p4

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p7

    .line 9
    invoke-static/range {v1 .. v6}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->createRecentEntryJson(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Landroid/app/WallpaperInfo;Ljava/lang/Integer;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v10, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 10
    invoke-static {v10, v11}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->cleanUpRecentsArray(Lorg/json/JSONArray;Landroid/content/Context;)Lorg/json/JSONArray;

    .line 11
    :goto_0
    invoke-virtual {v10}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "updateLastWpJson(\n                context = mContext,\n                recentsArray = wpArray,\n                id = wallpaperId,\n                wallpaperInfo = wallpaperInfo,\n                collectionId = collectionId,\n                attributions = attributions,\n                actionUrl = actionUrl,\n                placeHolderColor = colors.primaryColor.toArgb()).toString()"

    .line 12
    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    iget-object v2, v7, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-static {v2, v8, v1}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences$$ExternalSyntheticOutline0;->m(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    :try_start_0
    sget-object v1, Lkotlinx/coroutines/Dispatchers;->INSTANCE:Lkotlinx/coroutines/Dispatchers;

    .line 15
    sget-object v1, Lkotlinx/coroutines/Dispatchers;->Default:Lkotlinx/coroutines/CoroutineDispatcher;

    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 16
    invoke-static {v2, v3}, Lkotlinx/coroutines/SupervisorKt;->SupervisorJob$default(Lkotlinx/coroutines/Job;I)Lkotlinx/coroutines/CompletableJob;

    move-result-object v2

    invoke-virtual {v1, v2}, Lkotlin/coroutines/AbstractCoroutineContextElement;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object v1

    invoke-static {v1}, Lkotlinx/coroutines/CoroutineScopeKt;->CoroutineScope(Lkotlin/coroutines/CoroutineContext;)Lkotlinx/coroutines/CoroutineScope;

    move-result-object v10

    const/4 v11, 0x0

    const/4 v12, 0x0

    .line 17
    new-instance v13, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;

    const/4 v6, 0x0

    move-object v1, v13

    move-object v2, p0

    move-object v3, p1

    move-object/from16 v4, p5

    move-object/from16 v5, p6

    invoke-direct/range {v1 .. v6}, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;-><init>(Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;Ljava/lang/String;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)V

    const/4 v0, 0x3

    const/4 v1, 0x0

    move-object p1, v10

    move-object/from16 p2, v11

    move-object/from16 p3, v12

    move-object/from16 p4, v13

    move/from16 p5, v0

    move-object/from16 p6, v1

    invoke-static/range {p1 .. p6}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string v1, "DefaultGoogleWallpaperPreferences"

    const-string v2, "Exception saving latest wallpaper, reverting list"

    .line 18
    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 19
    iget-object v0, v7, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-static {v0, v8, v9}, Lcom/android/wallpaper/module/DefaultWallpaperPreferences$$ExternalSyntheticOutline0;->m(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    return-void
.end method

.method public storeLatestHomeWallpaper(Ljava/lang/String;Lcom/android/wallpaper/model/LiveWallpaperInfo;Landroid/app/WallpaperColors;)V
    .locals 10
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/android/wallpaper/model/LiveWallpaperInfo;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Landroid/app/WallpaperColors;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const-string v0, "wallpaperId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "colors"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mContext:Landroid/content/Context;

    invoke-virtual {p2, v0}, Lcom/android/wallpaper/model/LiveWallpaperInfo;->getAttributions(Landroid/content/Context;)Ljava/util/List;

    move-result-object v3

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mContext:Landroid/content/Context;

    invoke-virtual {p2, v0}, Lcom/android/wallpaper/model/LiveWallpaperInfo;->getActionUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mContext:Landroid/content/Context;

    invoke-virtual {p2, v0}, Lcom/android/wallpaper/model/LiveWallpaperInfo;->getCollectionId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    .line 4
    iget-object v8, p2, Lcom/android/wallpaper/model/LiveWallpaperInfo;->mInfo:Landroid/app/WallpaperInfo;

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v6, p2

    move-object v9, p3

    .line 5
    invoke-virtual/range {v1 .. v9}, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;->storeLastWallpaper(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Bitmap;Landroid/app/WallpaperInfo;Landroid/app/WallpaperColors;)V

    return-void
.end method

.method public storeLatestHomeWallpaper(Ljava/lang/String;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Bitmap;Landroid/app/WallpaperColors;)V
    .locals 10
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/android/wallpaper/model/WallpaperInfo;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Landroid/graphics/Bitmap;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Landroid/app/WallpaperColors;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const-string v0, "wallpaperId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "wallpaper"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "croppedWallpaperBitmap"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "colors"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mContext:Landroid/content/Context;

    invoke-virtual {p2, v0}, Lcom/android/wallpaper/model/WallpaperInfo;->getAttributions(Landroid/content/Context;)Ljava/util/List;

    move-result-object v3

    .line 7
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mContext:Landroid/content/Context;

    invoke-virtual {p2, v0}, Lcom/android/wallpaper/model/WallpaperInfo;->getActionUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    .line 8
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mContext:Landroid/content/Context;

    invoke-virtual {p2, v0}, Lcom/android/wallpaper/model/WallpaperInfo;->getCollectionId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    const/4 v8, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v6, p2

    move-object v7, p3

    move-object v9, p4

    .line 9
    invoke-virtual/range {v1 .. v9}, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;->storeLastWallpaper(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Bitmap;Landroid/app/WallpaperInfo;Landroid/app/WallpaperColors;)V

    return-void
.end method

.method public storeLatestHomeWallpaper(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/app/WallpaperColors;)V
    .locals 10
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p5    # Landroid/graphics/Bitmap;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p6    # Landroid/app/WallpaperColors;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            "Landroid/app/WallpaperColors;",
            ")V"
        }
    .end annotation

    const-string v0, "wallpaperId"

    move-object v2, p1

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "colors"

    move-object/from16 v9, p6

    invoke-static {v9, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v6, 0x0

    const/4 v8, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v7, p5

    .line 10
    invoke-virtual/range {v1 .. v9}, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;->storeLastWallpaper(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Bitmap;Landroid/app/WallpaperInfo;Landroid/app/WallpaperColors;)V

    return-void
.end method

.method public updateLastWallpaper(Ljava/lang/String;)V
    .locals 7
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const-string v0, "wallpaperId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-virtual {p0}, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;->getRecentWallpapers()Lorg/json/JSONArray;

    move-result-object v0

    .line 2
    invoke-static {v0, p1}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->reorderRecentsOnly(Lorg/json/JSONArray;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 3
    invoke-virtual {p0}, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;->getDefaultRecentWallpapers()Lorg/json/JSONArray;

    move-result-object v1

    const-string v2, "recentsArray"

    .line 4
    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "id"

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lez v3, :cond_2

    const/4 v4, 0x0

    :goto_0
    add-int/lit8 v5, v4, 0x1

    .line 6
    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 7
    invoke-virtual {v4, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    goto :goto_2

    :cond_0
    if-lt v5, v3, :cond_1

    goto :goto_1

    :cond_1
    move v4, v5

    goto :goto_0

    :cond_2
    :goto_1
    const/4 v4, 0x0

    :goto_2
    if-nez v4, :cond_3

    return-void

    .line 8
    :cond_3
    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 9
    :cond_4
    iget-object p1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "recent_wallpapers"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 10
    invoke-virtual {p0}, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;->notifyRecentsChange()V

    return-void
.end method
