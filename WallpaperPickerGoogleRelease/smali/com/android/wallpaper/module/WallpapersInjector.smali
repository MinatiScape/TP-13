.class public Lcom/android/wallpaper/module/WallpapersInjector;
.super Lcom/android/customization/module/DefaultCustomizationInjector;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/GoogleWallpapersInjector;


# instance fields
.field public mBackdropFetcher:Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;

.field public mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

.field public mCustomizationSections:Lcom/android/wallpaper/module/CustomizationSections;

.field public mDrawableLayerResolver:Lcom/android/wallpaper/module/DrawableLayerResolver;

.field public mLiveWallpaperInfoFactory:Lcom/google/android/material/shape/CornerTreatment;

.field public mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

.field public mPartnerProvider:Lcom/google/android/apps/wallpaper/module/GooglePartnerProvider;

.field public mPrefs:Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;

.field public mUserEventLogger:Lcom/android/customization/module/ThemesUserEventLogger;

.field public mWallpaperRotationRefresher:Lcom/android/wallpaper/module/WallpaperRotationRefresher;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/customization/module/DefaultCustomizationInjector;-><init>()V

    return-void
.end method


# virtual methods
.method public declared-synchronized getCategoryProvider(Landroid/content/Context;)Lcom/android/wallpaper/model/CategoryProvider;
    .locals 1

    monitor-enter p0

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    .line 3
    :cond_0
    iget-object p1, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public getCustomizationSections()Lcom/android/wallpaper/module/CustomizationSections;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mCustomizationSections:Lcom/android/wallpaper/module/CustomizationSections;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/android/wallpaper/module/GoogleCustomizationSections;

    invoke-direct {v0}, Lcom/android/wallpaper/module/GoogleCustomizationSections;-><init>()V

    iput-object v0, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mCustomizationSections:Lcom/android/wallpaper/module/CustomizationSections;

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mCustomizationSections:Lcom/android/wallpaper/module/CustomizationSections;

    return-object p0
.end method

.method public getDownloadableIntentAction()Ljava/lang/String;
    .locals 0

    const-string p0, "com.google.pixel.livewallpaper.action.DOWNLOAD_LIVE_WALLPAPER"

    return-object p0
.end method

.method public getDrawableLayerResolver()Lcom/android/wallpaper/module/DrawableLayerResolver;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mDrawableLayerResolver:Lcom/android/wallpaper/module/DrawableLayerResolver;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/android/wallpaper/module/DeviceColorLayerResolver;

    invoke-direct {v0}, Lcom/android/wallpaper/module/DeviceColorLayerResolver;-><init>()V

    iput-object v0, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mDrawableLayerResolver:Lcom/android/wallpaper/module/DrawableLayerResolver;

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mDrawableLayerResolver:Lcom/android/wallpaper/module/DrawableLayerResolver;

    return-object p0
.end method

.method public getGooglePreferences(Landroid/content/Context;)Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/module/WallpapersInjector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;

    return-object p0
.end method

.method public declared-synchronized getIndividualPickerFragment(Ljava/lang/String;)Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;
    .locals 2

    monitor-enter p0

    .line 1
    :try_start_0
    sget v0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;->$r8$clinit:I

    .line 2
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "category_collection_id"

    .line 3
    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    new-instance p1, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    invoke-direct {p1}, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;-><init>()V

    .line 5
    invoke-virtual {p1, v0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public getLiveWallpaperInfoFactory(Landroid/content/Context;)Lcom/google/android/material/shape/CornerTreatment;
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mLiveWallpaperInfoFactory:Lcom/google/android/material/shape/CornerTreatment;

    if-nez p1, :cond_0

    .line 2
    new-instance p1, Lcom/google/android/material/shape/CornerTreatment;

    const/4 v0, 0x2

    invoke-direct {p1, v0}, Lcom/google/android/material/shape/CornerTreatment;-><init>(I)V

    iput-object p1, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mLiveWallpaperInfoFactory:Lcom/google/android/material/shape/CornerTreatment;

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mLiveWallpaperInfoFactory:Lcom/google/android/material/shape/CornerTreatment;

    return-object p0
.end method

.method public declared-synchronized getLoggingOptInStatusProvider(Landroid/content/Context;)Lcom/android/wallpaper/module/LoggingOptInStatusProvider;
    .locals 1

    monitor-enter p0

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/customization/module/DefaultCustomizationInjector;->getFormFactorChecker(Landroid/content/Context;)Lcom/android/wallpaper/util/DownloadableUtils;

    move-result-object p1

    .line 3
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    new-instance p1, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;

    invoke-direct {p1}, Lcom/google/android/apps/wallpaper/module/AlwaysLoggingOptInStatusProvider;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;

    .line 5
    :cond_0
    iget-object p1, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mLoggingOptInStatusProvider:Lcom/android/wallpaper/module/LoggingOptInStatusProvider;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getPartnerProvider(Landroid/content/Context;)Lcom/android/wallpaper/module/PartnerProvider;
    .locals 1

    monitor-enter p0

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mPartnerProvider:Lcom/google/android/apps/wallpaper/module/GooglePartnerProvider;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/google/android/apps/wallpaper/module/GooglePartnerProvider;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/google/android/apps/wallpaper/module/GooglePartnerProvider;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mPartnerProvider:Lcom/google/android/apps/wallpaper/module/GooglePartnerProvider;

    .line 3
    :cond_0
    iget-object p1, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mPartnerProvider:Lcom/google/android/apps/wallpaper/module/GooglePartnerProvider;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;
    .locals 1

    monitor-enter p0

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mPrefs:Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mPrefs:Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;

    .line 3
    :cond_0
    iget-object p1, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mPrefs:Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public getPreviewFragment(Landroid/content/Context;Lcom/android/wallpaper/model/WallpaperInfo;IZZZ)Landroidx/fragment/app/Fragment;
    .locals 16

    move-object/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    move/from16 v4, p5

    move/from16 v5, p6

    .line 1
    instance-of v0, v1, Lcom/android/wallpaper/model/DownloadableLiveWallpaperInfo;

    const-string v6, "testing_mode_enabled"

    const-string v7, "view_as_home"

    const-string v8, "preview_mode"

    const-string v9, "wallpaper"

    const/4 v10, 0x1

    const/4 v11, 0x0

    if-eqz v0, :cond_2

    .line 2
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 3
    new-instance v4, Landroid/content/ComponentName;

    const-string v12, "com.google.pixel.livewallpaper"

    const-string v13, "com.google.pixel.livewallpaper.split.DownloadService"

    invoke-direct {v4, v12, v13}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 4
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    invoke-virtual {v4, v0, v11}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    goto :goto_0

    :cond_0
    move v10, v11

    :goto_0
    if-eqz v10, :cond_1

    .line 6
    sget v0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->$r8$clinit:I

    .line 7
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 8
    invoke-virtual {v0, v9, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 9
    invoke-virtual {v0, v8, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 10
    invoke-virtual {v0, v7, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 11
    invoke-virtual {v0, v6, v5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 12
    new-instance v1, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;

    invoke-direct {v1}, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;-><init>()V

    .line 13
    invoke-virtual {v1, v0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    return-object v1

    .line 14
    :cond_1
    sget v0, Lcom/android/wallpaper/picker/DownloadablePreviewFragment;->$r8$clinit:I

    .line 15
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 16
    invoke-virtual {v0, v9, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 17
    invoke-virtual {v0, v8, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 18
    invoke-virtual {v0, v7, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 19
    invoke-virtual {v0, v6, v5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 20
    new-instance v1, Lcom/android/wallpaper/picker/DownloadablePreviewFragment;

    invoke-direct {v1}, Lcom/android/wallpaper/picker/DownloadablePreviewFragment;-><init>()V

    .line 21
    invoke-virtual {v1, v0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    return-object v1

    .line 22
    :cond_2
    sget v0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->$r8$clinit:I

    .line 23
    new-instance v12, Landroid/os/Bundle;

    invoke-direct {v12}, Landroid/os/Bundle;-><init>()V

    .line 24
    invoke-virtual {v12, v9, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 25
    invoke-virtual {v12, v8, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 26
    invoke-virtual {v12, v7, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v13, "view_full_screen"

    .line 27
    invoke-virtual {v12, v13, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 28
    invoke-virtual {v12, v6, v5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    :try_start_0
    const-string v0, "systemui"

    const-string v14, "property_dynamic_photos_enabled"

    .line 29
    invoke-static {v0, v14, v10}, Landroid/provider/DeviceConfig;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string v14, "MicropaperPreviewFragmentGoogle"

    const-string v15, "Can\'t get DYNAMIC_PHOTOS_ENABLED flag"

    .line 30
    invoke-static {v14, v15, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move v0, v10

    :goto_1
    if-eqz v0, :cond_c

    .line 31
    sget-object v0, Lwireless/android/learning/acmi/micropaper/frontend/MicropaperFrontend;->MICROPAPER_SERVICE:Landroid/content/ComponentName;

    .line 32
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 33
    new-instance v14, Landroid/content/Intent;

    const-string v15, "android.service.wallpaper.WallpaperService"

    invoke-direct {v14, v15}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 34
    sget-object v15, Lwireless/android/learning/acmi/micropaper/frontend/MicropaperFrontend;->MICROPAPER_SERVICE:Landroid/content/ComponentName;

    invoke-virtual {v14, v15}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 35
    invoke-virtual {v0, v14, v11}, Landroid/content/pm/PackageManager;->resolveService(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    if-eqz v0, :cond_3

    move v0, v10

    goto :goto_2

    :cond_3
    move v0, v11

    :goto_2
    if-eqz v0, :cond_c

    .line 36
    instance-of v0, v1, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;

    if-eqz v0, :cond_8

    .line 37
    move-object v0, v1

    check-cast v0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;

    .line 38
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v14

    move-object/from16 v15, p1

    invoke-interface {v14, v15}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v14

    .line 39
    iget v0, v0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mWallpaperManagerFlag:I

    const/4 v10, 0x2

    if-ne v0, v10, :cond_4

    const/4 v0, 0x1

    goto :goto_3

    :cond_4
    move v0, v11

    :goto_3
    if-eqz v0, :cond_5

    .line 40
    invoke-interface {v14}, Lcom/android/wallpaper/module/WallpaperPreferences;->getLockWallpaperBackingFileName()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    .line 41
    :cond_5
    invoke-interface {v14}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperBackingFileName()Ljava/lang/String;

    move-result-object v0

    .line 42
    :goto_4
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    const/4 v14, 0x0

    if-eqz v10, :cond_6

    goto :goto_5

    .line 43
    :cond_6
    new-instance v10, Ljava/io/File;

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v11

    invoke-direct {v10, v11, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 44
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_7

    goto :goto_5

    .line 45
    :cond_7
    invoke-static {v10}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v14

    :goto_5
    if-eqz v14, :cond_9

    .line 46
    new-instance v0, Lcom/android/wallpaper/model/ImageWallpaperInfo;

    invoke-direct {v0, v14}, Lcom/android/wallpaper/model/ImageWallpaperInfo;-><init>(Landroid/net/Uri;)V

    goto :goto_6

    :cond_8
    move-object/from16 v15, p1

    :cond_9
    move-object v0, v1

    .line 47
    :goto_6
    instance-of v1, v0, Lcom/google/android/apps/wallpaper/model/MicropaperWallpaperInfo;

    if-nez v1, :cond_b

    instance-of v1, v0, Lcom/android/wallpaper/model/ImageWallpaperInfo;

    if-eqz v1, :cond_a

    .line 48
    invoke-virtual {v0}, Lcom/android/wallpaper/model/WallpaperInfo;->getUri()Landroid/net/Uri;

    move-result-object v1

    .line 49
    :try_start_1
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    invoke-virtual {v10, v1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/libraries/microvideo/MicrovideoFiles;->isMicrovideo(Ljava/io/InputStream;)Z

    move-result v1
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_7

    :catch_1
    const/4 v1, 0x0

    :goto_7
    if-eqz v1, :cond_a

    goto :goto_8

    :cond_a
    const/4 v10, 0x0

    goto :goto_9

    :cond_b
    :goto_8
    const/4 v10, 0x1

    :goto_9
    move v11, v10

    goto :goto_a

    :cond_c
    move-object v0, v1

    const/4 v11, 0x0

    :goto_a
    if-eqz v11, :cond_d

    .line 50
    new-instance v0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;

    invoke-direct {v0}, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;-><init>()V

    .line 51
    invoke-virtual {v0, v12}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    goto :goto_b

    .line 52
    :cond_d
    instance-of v1, v0, Lcom/android/wallpaper/model/LiveWallpaperInfo;

    if-eqz v1, :cond_e

    .line 53
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 54
    invoke-virtual {v1, v9, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 55
    invoke-virtual {v1, v8, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 56
    invoke-virtual {v1, v7, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 57
    invoke-virtual {v1, v13, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 58
    invoke-virtual {v1, v6, v5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 59
    new-instance v0, Lcom/android/wallpaper/picker/LiveWallpaperColorThemePreviewFragment;

    invoke-direct {v0}, Lcom/android/wallpaper/picker/LiveWallpaperColorThemePreviewFragment;-><init>()V

    .line 60
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    goto :goto_b

    .line 61
    :cond_e
    sget v1, Lcom/android/wallpaper/picker/ImageWallpaperColorThemePreviewFragment;->$r8$clinit:I

    .line 62
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 63
    invoke-virtual {v1, v9, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 64
    invoke-virtual {v1, v8, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 65
    invoke-virtual {v1, v7, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 66
    invoke-virtual {v1, v13, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 67
    invoke-virtual {v1, v6, v5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 68
    new-instance v0, Lcom/android/wallpaper/picker/ImageWallpaperColorThemePreviewFragment;

    invoke-direct {v0}, Lcom/android/wallpaper/picker/ImageWallpaperColorThemePreviewFragment;-><init>()V

    .line 69
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    :goto_b
    return-object v0
.end method

.method public getServerFetcher(Landroid/content/Context;)Lcom/android/wallpaper/network/ServerFetcher;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mBackdropFetcher:Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;

    invoke-virtual {p0, p1}, Lcom/android/customization/module/DefaultCustomizationInjector;->getRequester(Landroid/content/Context;)Lcom/google/android/gms/common/internal/zzam;

    move-result-object p1

    new-instance v1, Lcom/google/android/apps/wallpaper/module/DeviceConfigFilteringLabelProvider;

    invoke-direct {v1}, Lcom/google/android/apps/wallpaper/module/DeviceConfigFilteringLabelProvider;-><init>()V

    invoke-direct {v0, p1, v1}, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;-><init>(Lcom/google/android/gms/common/internal/zzam;Lcom/google/android/apps/wallpaper/module/FilteringLabelProvider;)V

    iput-object v0, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mBackdropFetcher:Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mBackdropFetcher:Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;

    return-object p0
.end method

.method public getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mUserEventLogger:Lcom/android/customization/module/ThemesUserEventLogger;

    if-nez v0, :cond_0

    .line 3
    new-instance v0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;

    new-instance v1, Lcom/android/customization/module/StatsLogUserEventLogger;

    invoke-direct {v1}, Lcom/android/customization/module/StatsLogUserEventLogger;-><init>()V

    new-instance v2, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;

    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v2, p1}, Lcom/google/android/apps/wallpaper/module/ClearcutUserEventLogger;-><init>(Landroid/content/Context;)V

    invoke-direct {v0, v1, v2}, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;-><init>(Lcom/android/customization/module/ThemesUserEventLogger;Lcom/android/customization/module/ThemesUserEventLogger;)V

    iput-object v0, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mUserEventLogger:Lcom/android/customization/module/ThemesUserEventLogger;

    .line 5
    :cond_0
    iget-object p1, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mUserEventLogger:Lcom/android/customization/module/ThemesUserEventLogger;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getWallpaperRotationRefresher()Lcom/android/wallpaper/module/WallpaperRotationRefresher;
    .locals 1

    monitor-enter p0

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mWallpaperRotationRefresher:Lcom/android/wallpaper/module/WallpaperRotationRefresher;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationRefresher;

    invoke-direct {v0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationRefresher;-><init>()V

    iput-object v0, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mWallpaperRotationRefresher:Lcom/android/wallpaper/module/WallpaperRotationRefresher;

    .line 3
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/module/WallpapersInjector;->mWallpaperRotationRefresher:Lcom/android/wallpaper/module/WallpaperRotationRefresher;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
