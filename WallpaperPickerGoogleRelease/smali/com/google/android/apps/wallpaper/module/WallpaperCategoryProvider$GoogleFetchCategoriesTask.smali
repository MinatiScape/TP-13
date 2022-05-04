.class public Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;
.super Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GoogleFetchCategoriesTask"
.end annotation


# instance fields
.field public mForceRefresh:Z

.field public mPixelApkResources:Landroid/content/res/Resources;

.field public mStubApkResources:Landroid/content/res/Resources;

.field public mStubPackageName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/model/CategoryReceiver;Landroid/content/Context;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;-><init>(Lcom/android/wallpaper/model/CategoryReceiver;Landroid/content/Context;)V

    .line 2
    iput-boolean p3, p0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->mForceRefresh:Z

    return-void
.end method


# virtual methods
.method public doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 14

    .line 1
    check-cast p1, [Ljava/lang/Void;

    .line 2
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p1

    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mAppContext:Landroid/content/Context;

    invoke-interface {p1, v0}, Lcom/android/wallpaper/module/Injector;->getPartnerProvider(Landroid/content/Context;)Lcom/android/wallpaper/module/PartnerProvider;

    move-result-object p1

    .line 3
    iget-boolean v0, p0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->mForceRefresh:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 4
    sput-object v1, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider;->sSystemStaticCategories:Ljava/util/List;

    .line 5
    sput-object v1, Lcom/android/wallpaper/module/DefaultCategoryProvider;->sSystemCategories:Ljava/util/List;

    .line 6
    :cond_0
    iput-object v1, p0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->mStubApkResources:Landroid/content/res/Resources;

    .line 7
    iput-object v1, p0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->mPixelApkResources:Landroid/content/res/Resources;

    .line 8
    iput-object v1, p0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->mStubPackageName:Ljava/lang/String;

    const/16 v0, 0x80

    .line 9
    :try_start_0
    move-object v1, p1

    check-cast v1, Lcom/android/wallpaper/module/DefaultPartnerProvider;

    .line 10
    iget-object v1, v1, Lcom/android/wallpaper/module/DefaultPartnerProvider;->mPackageName:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 11
    move-object v1, p1

    check-cast v1, Lcom/android/wallpaper/module/DefaultPartnerProvider;

    .line 12
    iget-object v1, v1, Lcom/android/wallpaper/module/DefaultPartnerProvider;->mResources:Landroid/content/res/Resources;

    .line 13
    iput-object v1, p0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->mStubApkResources:Landroid/content/res/Resources;

    .line 14
    check-cast p1, Lcom/android/wallpaper/module/DefaultPartnerProvider;

    .line 15
    iget-object p1, p1, Lcom/android/wallpaper/module/DefaultPartnerProvider;->mPackageName:Ljava/lang/String;

    .line 16
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->mStubPackageName:Ljava/lang/String;

    .line 17
    :cond_1
    iget-object p1, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mAppContext:Landroid/content/Context;

    .line 18
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const-string v1, "com.google.pixel.livewallpaper"

    invoke-virtual {p1, v1, v0}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 19
    iget-object v1, p1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    if-eqz v1, :cond_2

    .line 20
    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mAppContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Landroid/content/pm/ApplicationInfo;)Landroid/content/res/Resources;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->mPixelApkResources:Landroid/content/res/Resources;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v1, "WPCategoryProvider"

    const-string v2, "Stub APK not found: "

    .line 21
    invoke-static {v1, v2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 22
    :cond_2
    :goto_0
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p1

    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mAppContext:Landroid/content/Context;

    invoke-interface {p1, v1}, Lcom/android/wallpaper/module/Injector;->getPartnerProvider(Landroid/content/Context;)Lcom/android/wallpaper/module/PartnerProvider;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mPartnerProvider:Lcom/android/wallpaper/module/PartnerProvider;

    .line 23
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p1

    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mAppContext:Landroid/content/Context;

    invoke-interface {p1, v1}, Lcom/android/wallpaper/module/Injector;->getFormFactorChecker(Landroid/content/Context;)Lcom/android/wallpaper/util/DownloadableUtils;

    move-result-object p1

    .line 24
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p1, 0x1

    new-array v1, p1, [Lcom/android/wallpaper/model/Category;

    .line 25
    new-instance v2, Lcom/android/wallpaper/model/ImageCategory;

    iget-object v3, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mAppContext:Landroid/content/Context;

    const v4, 0x7f1100e8

    .line 26
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mAppContext:Landroid/content/Context;

    const v5, 0x7f11009e

    .line 27
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const v5, 0x7f0800ee

    invoke-direct {v2, v3, v4, p1, v5}, Lcom/android/wallpaper/model/ImageCategory;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    .line 28
    invoke-virtual {p0, v1}, Landroid/os/AsyncTask;->publishProgress([Ljava/lang/Object;)V

    .line 29
    sget-object v1, Lcom/android/wallpaper/module/DefaultCategoryProvider;->sSystemCategories:Ljava/util/List;

    if-eqz v1, :cond_3

    move v1, v3

    .line 30
    :goto_1
    sget-object v2, Lcom/android/wallpaper/module/DefaultCategoryProvider;->sSystemCategories:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_4

    new-array v2, p1, [Lcom/android/wallpaper/model/Category;

    .line 31
    sget-object v4, Lcom/android/wallpaper/module/DefaultCategoryProvider;->sSystemCategories:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/wallpaper/model/Category;

    aput-object v4, v2, v3

    invoke-virtual {p0, v2}, Landroid/os/AsyncTask;->publishProgress([Ljava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 32
    :cond_3
    invoke-virtual {p0}, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->getSystemCategories()Ljava/util/List;

    move-result-object v1

    sput-object v1, Lcom/android/wallpaper/module/DefaultCategoryProvider;->sSystemCategories:Ljava/util/List;

    :cond_4
    new-array v1, p1, [Lcom/android/wallpaper/model/Category;

    .line 33
    sget-object v2, Lcom/android/wallpaper/module/DefaultCategoryProvider;->sSystemCategories:Ljava/util/List;

    if-eqz v2, :cond_5

    .line 34
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_15

    .line 35
    :cond_5
    sget-object v2, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider;->sSystemStaticCategories:Ljava/util/List;

    if-eqz v2, :cond_6

    .line 36
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_6

    goto/16 :goto_b

    .line 37
    :cond_6
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 38
    iget-object v4, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mPartnerProvider:Lcom/android/wallpaper/module/PartnerProvider;

    check-cast v4, Lcom/android/wallpaper/module/DefaultPartnerProvider;

    .line 39
    iget-object v5, v4, Lcom/android/wallpaper/module/DefaultPartnerProvider;->mResources:Landroid/content/res/Resources;

    if-eqz v5, :cond_7

    .line 40
    iget-object v4, v4, Lcom/android/wallpaper/module/DefaultPartnerProvider;->mPackageName:Ljava/lang/String;

    const-string v6, "default_wallpapper_hidden"

    const-string v7, "bool"

    invoke-virtual {v5, v6, v7, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    if-eqz v4, :cond_7

    .line 41
    invoke-virtual {v5, v4}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v4

    if-eqz v4, :cond_7

    goto :goto_2

    :cond_7
    move p1, v3

    :goto_2
    if-nez p1, :cond_8

    .line 42
    new-instance p1, Lcom/android/wallpaper/model/DefaultWallpaperInfo;

    invoke-direct {p1}, Lcom/android/wallpaper/model/DefaultWallpaperInfo;-><init>()V

    .line 43
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    :cond_8
    iget-object p1, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mAppContext:Landroid/content/Context;

    sget-object v4, Lcom/android/wallpaper/model/PartnerWallpaperInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 45
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v4

    invoke-interface {v4, p1}, Lcom/android/wallpaper/module/Injector;->getPartnerProvider(Landroid/content/Context;)Lcom/android/wallpaper/module/PartnerProvider;

    move-result-object p1

    .line 46
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 47
    check-cast p1, Lcom/android/wallpaper/module/DefaultPartnerProvider;

    .line 48
    iget-object v5, p1, Lcom/android/wallpaper/module/DefaultPartnerProvider;->mResources:Landroid/content/res/Resources;

    .line 49
    iget-object p1, p1, Lcom/android/wallpaper/module/DefaultPartnerProvider;->mPackageName:Ljava/lang/String;

    const-string v6, "_small"

    const-string v7, "wallpapers"

    if-nez v5, :cond_9

    goto :goto_5

    :cond_9
    const-string v8, "array"

    .line 50
    invoke-virtual {v5, v7, v8, p1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v8

    if-nez v8, :cond_a

    goto :goto_5

    .line 51
    :cond_a
    invoke-virtual {v5, v8}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v8

    .line 52
    array-length v9, v8

    move v10, v3

    :goto_3
    if-ge v10, v9, :cond_d

    aget-object v11, v8, v10

    const-string v12, "drawable"

    .line 53
    invoke-virtual {v5, v11, v12, p1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v13

    if-eqz v13, :cond_b

    .line 54
    invoke-static {v11, v6, v5, v12, p1}, Lcom/android/wallpaper/model/PartnerWallpaperInfo$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)I

    move-result v13

    if-eqz v13, :cond_c

    .line 55
    invoke-virtual {v5, v11, v12, p1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v11

    .line 56
    new-instance v12, Lcom/android/wallpaper/model/PartnerWallpaperInfo;

    invoke-direct {v12, v13, v11}, Lcom/android/wallpaper/model/PartnerWallpaperInfo;-><init>(II)V

    .line 57
    invoke-virtual {v4, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 58
    :cond_b
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Couldn\'t find wallpaper "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    const-string v12, "PartnerWallpaperInfo"

    invoke-static {v12, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_c
    :goto_4
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    .line 59
    :cond_d
    :goto_5
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 60
    iget-object p1, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mAppContext:Landroid/content/Context;

    sget-object v4, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 61
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v4

    invoke-interface {v4, p1}, Lcom/android/wallpaper/module/Injector;->getPartnerProvider(Landroid/content/Context;)Lcom/android/wallpaper/module/PartnerProvider;

    move-result-object p1

    .line 62
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 63
    check-cast p1, Lcom/android/wallpaper/module/DefaultPartnerProvider;

    invoke-virtual {p1}, Lcom/android/wallpaper/module/DefaultPartnerProvider;->getLegacyWallpaperDirectory()Ljava/io/File;

    move-result-object p1

    if-eqz p1, :cond_12

    .line 64
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-nez v5, :cond_e

    goto :goto_9

    .line 65
    :cond_e
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p1

    array-length v5, p1

    move v8, v3

    :goto_6
    if-ge v8, v5, :cond_12

    aget-object v9, p1, v8

    .line 66
    invoke-virtual {v9}, Ljava/io/File;->isFile()Z

    move-result v10

    if-nez v10, :cond_f

    goto :goto_8

    .line 67
    :cond_f
    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v10

    .line 68
    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    const/16 v11, 0x2e

    .line 69
    invoke-virtual {v9, v11}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v11

    const/4 v12, -0x1

    if-le v11, v12, :cond_10

    .line 70
    invoke-virtual {v9, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v12

    .line 71
    invoke-virtual {v9, v3, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    goto :goto_7

    :cond_10
    const-string v12, ""

    .line 72
    :goto_7
    invoke-virtual {v9, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_11

    goto :goto_8

    .line 73
    :cond_11
    invoke-static {v9, v6, v12}, Landroidx/concurrent/futures/AbstractResolvableFuture$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 74
    new-instance v11, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;

    invoke-direct {v11, v9, v10}, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_8
    add-int/lit8 v8, v8, 0x1

    goto :goto_6

    .line 75
    :cond_12
    :goto_9
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 76
    :try_start_1
    iget-object p1, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mAppContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const-string v4, "com.google.android.launcher"

    invoke-virtual {p1, v4, v0}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object p1

    if-eqz p1, :cond_13

    .line 77
    iget-object v0, p1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    if-eqz v0, :cond_13

    .line 78
    invoke-virtual {v0, v7, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 79
    iget-object v4, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mAppContext:Landroid/content/Context;

    invoke-static {v4, p1, v0}, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->getAll(Landroid/content/Context;Landroid/content/pm/ApplicationInfo;I)Ljava/util/List;

    move-result-object p1
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_a

    :catch_1
    :cond_13
    const/4 p1, 0x0

    :goto_a
    if-eqz p1, :cond_14

    .line 80
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 81
    :cond_14
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_16

    :cond_15
    :goto_b
    const/4 p1, 0x0

    goto :goto_c

    :cond_16
    new-instance p1, Lcom/android/wallpaper/model/WallpaperCategory;

    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mAppContext:Landroid/content/Context;

    const v4, 0x7f1100f3

    .line 82
    invoke-virtual {v0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v4, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mAppContext:Landroid/content/Context;

    const v5, 0x7f1100f1

    .line 83
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0xc8

    invoke-direct {p1, v0, v4, v2, v5}, Lcom/android/wallpaper/model/WallpaperCategory;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;I)V

    :goto_c
    aput-object p1, v1, v3

    .line 84
    invoke-virtual {p0, v1}, Landroid/os/AsyncTask;->publishProgress([Ljava/lang/Object;)V

    .line 85
    iget-object p1, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mAppContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const-string v0, "android.software.live_wallpaper"

    invoke-virtual {p1, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_17

    .line 86
    iget-object p1, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mAppContext:Landroid/content/Context;

    .line 87
    invoke-virtual {p0}, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->getExcludedLiveWallpaperPackageNames()Ljava/util/Set;

    move-result-object v0

    .line 88
    invoke-static {p1, v0}, Lcom/android/wallpaper/model/LiveWallpaperInfo;->getAll(Landroid/content/Context;Ljava/util/Set;)Ljava/util/List;

    move-result-object v7

    .line 89
    move-object p1, v7

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_17

    const/4 p1, 0x1

    new-array p1, p1, [Lcom/android/wallpaper/model/Category;

    .line 90
    new-instance v0, Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory;

    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mAppContext:Landroid/content/Context;

    const v2, 0x7f1100a5

    .line 91
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mAppContext:Landroid/content/Context;

    const v2, 0x7f1100a4

    .line 92
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/16 v8, 0x12c

    .line 93
    invoke-virtual {p0}, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->getExcludedLiveWallpaperPackageNames()Ljava/util/Set;

    move-result-object v9

    move-object v4, v0

    invoke-direct/range {v4 .. v9}, Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;ILjava/util/Set;)V

    aput-object v0, p1, v3

    .line 94
    invoke-virtual {p0, p1}, Landroid/os/AsyncTask;->publishProgress([Ljava/lang/Object;)V

    .line 95
    :cond_17
    iget-object p1, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mAppContext:Landroid/content/Context;

    const/16 v0, 0x190

    const-string v1, "com.android.launcher"

    const-string v2, "com.android.wallpaper.livepicker"

    const-string v4, "com.google.android.googlequicksearchbox"

    .line 96
    filled-new-array {v1, v2, v4}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 97
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 98
    new-instance v4, Landroid/content/Intent;

    const-string v5, "android.intent.action.SET_WALLPAPER"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 99
    invoke-virtual {v2, v4, v3}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v2

    .line 100
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 101
    new-instance v5, Landroid/content/Intent;

    const-string v6, "android.intent.action.GET_CONTENT"

    invoke-direct {v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v6, "image/*"

    .line 102
    invoke-virtual {v5, v6}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 103
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    invoke-virtual {v6, v5, v3}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v5

    move v6, v3

    .line 104
    :goto_d
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v7

    if-ge v6, v7, :cond_1c

    .line 105
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/content/pm/ResolveInfo;

    .line 106
    new-instance v8, Landroid/content/ComponentName;

    iget-object v9, v7, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v10, v9, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object v9, v9, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {v8, v10, v9}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    invoke-virtual {v8}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v8

    .line 108
    invoke-interface {v1, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_1b

    .line 109
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_18

    goto :goto_e

    .line 110
    :cond_18
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_19
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_1a

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/content/pm/ResolveInfo;

    .line 111
    iget-object v10, v10, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v10, v10, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v8, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_19

    goto :goto_e

    .line 112
    :cond_1a
    new-instance v9, Lcom/android/wallpaper/model/ThirdPartyAppCategory;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const v11, 0x7f110139

    .line 113
    invoke-virtual {p1, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "_"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v9, p1, v7, v8, v0}, Lcom/android/wallpaper/model/ThirdPartyAppCategory;-><init>(Landroid/content/Context;Landroid/content/pm/ResolveInfo;Ljava/lang/String;I)V

    .line 114
    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1b
    :goto_e
    add-int/lit8 v6, v6, 0x1

    goto :goto_d

    .line 115
    :cond_1c
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_f
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/wallpaper/model/ThirdPartyAppCategory;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/android/wallpaper/model/Category;

    aput-object v0, v1, v3

    .line 116
    invoke-virtual {p0, v1}, Landroid/os/AsyncTask;->publishProgress([Ljava/lang/Object;)V

    goto :goto_f

    :cond_1d
    const/4 p0, 0x0

    return-object p0
.end method

.method public getExcludedLiveWallpaperPackageNames()Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 2
    sget-object v1, Lcom/android/wallpaper/module/DefaultCategoryProvider;->sSystemCategories:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 3
    invoke-interface {v1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object v1

    sget-object v2, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda2;->INSTANCE:Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda2;

    .line 4
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v1

    sget-object v2, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda1;->INSTANCE:Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda1;

    .line 5
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->flatMap(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    move-result-object v1

    .line 6
    invoke-static {}, Ljava/util/stream/Collectors;->toSet()Ljava/util/stream/Collector;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    .line 7
    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 8
    :cond_0
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->mStubApkResources:Landroid/content/res/Resources;

    if-eqz v1, :cond_1

    .line 9
    iget-object v2, p0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->mStubPackageName:Ljava/lang/String;

    const-string v3, "nexus_live_categories"

    invoke-virtual {p0, v1, v3, v2}, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->getNexusLiveWallpaperPackageNames(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 10
    :cond_1
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->mPixelApkResources:Landroid/content/res/Resources;

    if-eqz v1, :cond_2

    const-string v2, "pixel_live_categories"

    const-string v3, "com.google.pixel.livewallpaper"

    .line 11
    invoke-virtual {p0, v1, v2, v3}, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->getNexusLiveWallpaperPackageNames(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 12
    :cond_2
    sget-object p0, Lwireless/android/learning/acmi/micropaper/frontend/MicropaperFrontend;->MICROPAPER_SERVICE:Landroid/content/ComponentName;

    .line 13
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public final getNexusLiveWallpaperCategories(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/res/Resources;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/Category;",
            ">;"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p3

    .line 1
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    const-string v5, "array"

    move-object/from16 v0, p2

    .line 2
    invoke-virtual {v2, v0, v5, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    return-object v4

    .line 3
    :cond_0
    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v6

    const/4 v0, 0x0

    move v7, v0

    .line 4
    :goto_0
    array-length v0, v6

    if-ge v7, v0, :cond_13

    .line 5
    aget-object v8, v6, v7

    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "_title"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v9, "string"

    invoke-virtual {v2, v0, v9, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 7
    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 8
    invoke-virtual {v1, v2, v8, v3}, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->getPackageNameForNexusLiveWp(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, "_featured_service_name"

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0, v9, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 10
    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    const-string v0, "_service_names"

    .line 11
    invoke-static {v8, v0, v2, v5, v3}, Lcom/android/wallpaper/model/PartnerWallpaperInfo$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    goto :goto_1

    .line 12
    :cond_1
    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    .line 13
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    :goto_1
    move-object v12, v0

    .line 14
    iget-object v13, v1, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mAppContext:Landroid/content/Context;

    .line 15
    sget-object v0, Lcom/android/wallpaper/model/LiveWallpaperInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    const-string v14, "android.service.wallpaper.WallpaperService"

    if-eqz v12, :cond_4

    .line 16
    invoke-virtual {v13}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 17
    new-instance v15, Landroid/content/Intent;

    invoke-direct {v15, v14}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/16 v2, 0x80

    invoke-virtual {v0, v15, v2}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    .line 18
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Landroid/content/pm/ResolveInfo;

    .line 19
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/content/pm/ResolveInfo;

    move-object/from16 p2, v0

    .line 20
    iget-object v0, v15, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v0, v0, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    invoke-interface {v12, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    const/4 v3, -0x1

    if-eq v0, v3, :cond_2

    .line 21
    aput-object v15, v2, v0

    :cond_2
    move-object/from16 v0, p2

    move-object/from16 v3, p3

    goto :goto_2

    .line 22
    :cond_3
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_3

    .line 23
    :cond_4
    invoke-static {v13}, Lcom/android/wallpaper/model/LiveWallpaperInfo;->getAllOnDevice(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    :goto_3
    move-object v2, v0

    .line 24
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 25
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    invoke-interface {v0, v13}, Lcom/android/wallpaper/module/Injector;->getLiveWallpaperInfoFactory(Landroid/content/Context;)Lcom/google/android/material/shape/CornerTreatment;

    move-result-object v15

    const/4 v0, 0x0

    move-object/from16 v16, v5

    move v5, v0

    .line 26
    :goto_4
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    const-string v17, "Skipping wallpaper "

    if-ge v5, v0, :cond_8

    .line 27
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object/from16 p2, v2

    move-object v2, v0

    check-cast v2, Landroid/content/pm/ResolveInfo;

    move-object/from16 v18, v6

    const-string v6, "LiveWallpaperInfo"

    if-nez v2, :cond_5

    const-string v0, "Found a null resolve info"

    .line 28
    invoke-static {v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    .line 29
    :cond_5
    :try_start_0
    new-instance v0, Landroid/app/WallpaperInfo;

    invoke-direct {v0, v13, v2}, Landroid/app/WallpaperInfo;-><init>(Landroid/content/Context;Landroid/content/pm/ResolveInfo;)V
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 30
    invoke-virtual {v0}, Landroid/app/WallpaperInfo;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v10, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    :goto_5
    move-object/from16 v19, v13

    goto :goto_8

    .line 31
    :cond_6
    invoke-static {v15}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    invoke-virtual {v0}, Landroid/app/WallpaperInfo;->getComponent()Landroid/content/ComponentName;

    move-result-object v2

    .line 33
    sget-object v6, Lwireless/android/learning/acmi/micropaper/frontend/MicropaperFrontend;->MICROPAPER_SERVICE:Landroid/content/ComponentName;

    .line 34
    invoke-virtual {v2, v6}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 35
    new-instance v2, Lcom/google/android/apps/wallpaper/model/MicropaperWallpaperInfo;

    invoke-direct {v2, v0}, Lcom/google/android/apps/wallpaper/model/MicropaperWallpaperInfo;-><init>(Landroid/app/WallpaperInfo;)V

    move-object/from16 v19, v13

    goto :goto_6

    .line 36
    :cond_7
    new-instance v2, Lcom/google/android/apps/wallpaper/model/GoogleLiveWallpaperInfo;

    const/4 v6, 0x0

    move-object/from16 v19, v13

    const/4 v13, 0x0

    invoke-direct {v2, v0, v13, v6}, Lcom/google/android/apps/wallpaper/model/GoogleLiveWallpaperInfo;-><init>(Landroid/app/WallpaperInfo;ZLjava/lang/String;)V

    .line 37
    :goto_6
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_8

    :catch_0
    move-exception v0

    move-object/from16 v19, v13

    goto :goto_7

    :catch_1
    move-exception v0

    move-object/from16 v19, v13

    .line 38
    invoke-static/range {v17 .. v17}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v2, v2, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v6, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_8

    .line 39
    :goto_7
    invoke-static/range {v17 .. v17}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v2, v2, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v6, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_8
    add-int/lit8 v5, v5, 0x1

    move-object/from16 v2, p2

    move-object/from16 v6, v18

    move-object/from16 v13, v19

    goto/16 :goto_4

    :cond_8
    move-object/from16 v18, v6

    .line 40
    iget-object v2, v1, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mAppContext:Landroid/content/Context;

    .line 41
    sget-object v0, Lcom/android/wallpaper/model/DownloadableLiveWallpaperInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 42
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 43
    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5, v14}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/16 v6, 0x280

    invoke-virtual {v0, v5, v6}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    if-nez v12, :cond_9

    goto :goto_a

    .line 44
    :cond_9
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [Landroid/content/pm/ResolveInfo;

    .line 45
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/pm/ResolveInfo;

    .line 46
    iget-object v13, v6, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v13, v13, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    invoke-interface {v12, v13}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v13

    const/4 v14, -0x1

    if-eq v13, v14, :cond_a

    .line 47
    aput-object v6, v5, v13

    goto :goto_9

    .line 48
    :cond_b
    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 49
    :goto_a
    invoke-static {v2}, Lcom/android/wallpaper/model/DownloadableLiveWallpaperInfo;->getToBeInstalledComponent(Landroid/content/Context;)Ljava/util/List;

    move-result-object v5

    .line 50
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 51
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_c
    :goto_b
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v13, v0

    check-cast v13, Landroid/content/pm/ResolveInfo;

    if-nez v13, :cond_d

    goto :goto_b

    .line 52
    :cond_d
    :try_start_1
    new-instance v0, Landroid/app/WallpaperInfo;

    invoke-direct {v0, v2, v13}, Landroid/app/WallpaperInfo;-><init>(Landroid/content/Context;Landroid/content/pm/ResolveInfo;)V
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 53
    invoke-virtual {v0}, Landroid/app/WallpaperInfo;->getPackageName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_e

    goto :goto_b

    .line 54
    :cond_e
    new-instance v13, Lcom/android/wallpaper/model/DownloadableLiveWallpaperInfo;

    const/4 v14, 0x0

    invoke-direct {v13, v0, v14, v8}, Lcom/android/wallpaper/model/DownloadableLiveWallpaperInfo;-><init>(Landroid/app/WallpaperInfo;ZLjava/lang/String;)V

    .line 55
    invoke-virtual {v13, v5}, Lcom/android/wallpaper/model/DownloadableLiveWallpaperInfo;->isToBeInstalled(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 56
    invoke-virtual {v6, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_b

    :catch_2
    move-exception v0

    .line 57
    invoke-static/range {v17 .. v17}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    iget-object v13, v13, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const-string v14, "DownloadLiveWallpaperInfo"

    invoke-static {v14, v13, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_b

    :cond_f
    const/4 v0, 0x0

    .line 58
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 59
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_10

    goto :goto_e

    :cond_10
    move v2, v0

    .line 60
    :goto_c
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v2, v5, :cond_12

    .line 61
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/wallpaper/model/WallpaperInfo;

    .line 62
    invoke-virtual {v5}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperComponent()Landroid/app/WallpaperInfo;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/WallpaperInfo;->getServiceName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_11

    move v13, v2

    goto :goto_d

    :cond_11
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    :cond_12
    move v13, v0

    .line 63
    :goto_d
    new-instance v0, Lcom/android/wallpaper/model/WallpaperCategory;

    const-string v2, "nexus_live_category_"

    .line 64
    invoke-static {v2, v7}, Landroid/support/media/ExifInterface$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v12

    const/16 v15, 0x65

    move-object v10, v0

    move-object v14, v3

    .line 65
    invoke-direct/range {v10 .. v15}, Lcom/android/wallpaper/model/WallpaperCategory;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/util/List;I)V

    .line 66
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_e
    add-int/lit8 v7, v7, 0x1

    move-object/from16 v2, p1

    move-object/from16 v3, p3

    move-object/from16 v5, v16

    move-object/from16 v6, v18

    goto/16 :goto_0

    :cond_13
    return-object v4
.end method

.method public final getNexusLiveWallpaperPackageNames(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/res/Resources;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "array"

    .line 2
    invoke-virtual {p1, p2, v1, p3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p2

    if-nez p2, :cond_0

    return-object v0

    .line 3
    :cond_0
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object p2

    const/4 v1, 0x0

    .line 4
    :goto_0
    array-length v2, p2

    if-ge v1, v2, :cond_1

    .line 5
    aget-object v2, p2, v1

    .line 6
    invoke-virtual {p0, p1, v2, p3}, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->getPackageNameForNexusLiveWp(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 7
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public final getPackageNameForNexusLiveWp(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "_package_name"

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p2, "string"

    invoke-virtual {p1, p0, p2, p3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    .line 2
    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getSystemCategories()Ljava/util/List;
    .locals 28
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/Category;",
            ">;"
        }
    .end annotation

    move-object/from16 v1, p0

    .line 1
    iget-object v0, v1, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mPartnerProvider:Lcom/android/wallpaper/module/PartnerProvider;

    check-cast v0, Lcom/android/wallpaper/module/DefaultPartnerProvider;

    .line 2
    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultPartnerProvider;->mResources:Landroid/content/res/Resources;

    .line 3
    iget-object v0, v0, Lcom/android/wallpaper/module/DefaultPartnerProvider;->mPackageName:Ljava/lang/String;

    .line 4
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eqz v2, :cond_11

    if-nez v0, :cond_0

    goto/16 :goto_11

    :cond_0
    const-string v7, "wallpapers"

    const-string v8, "xml"

    .line 5
    invoke-virtual {v2, v7, v8, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    goto/16 :goto_11

    .line 6
    :cond_1
    :try_start_0
    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_1

    .line 7
    :try_start_1
    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->getDepth()I

    move-result v0

    move v7, v5

    .line 8
    :goto_0
    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->next()I

    move-result v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_5

    const/4 v9, 0x3

    if-ne v8, v9, :cond_2

    .line 9
    :try_start_2
    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->getDepth()I

    move-result v10
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-le v10, v0, :cond_f

    goto :goto_1

    :catchall_0
    move-exception v0

    move-object v3, v0

    move v6, v5

    goto/16 :goto_e

    :cond_2
    :goto_1
    if-eq v8, v6, :cond_f

    const/4 v6, 0x2

    if-ne v8, v6, :cond_e

    :try_start_3
    const-string v6, "category"

    .line 10
    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_e

    .line 11
    iget-object v6, v1, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mPartnerProvider:Lcom/android/wallpaper/module/PartnerProvider;

    .line 12
    check-cast v6, Lcom/android/wallpaper/module/DefaultPartnerProvider;

    .line 13
    iget-object v6, v6, Lcom/android/wallpaper/module/DefaultPartnerProvider;->mResources:Landroid/content/res/Resources;

    .line 14
    invoke-static {v2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v8

    .line 15
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    const-string v10, "id"

    .line 16
    invoke-interface {v8, v4, v10}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string v10, "title"

    .line 17
    invoke-interface {v8, v4, v10, v5}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v10
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_5

    if-eqz v10, :cond_3

    .line 18
    :try_start_4
    invoke-virtual {v6, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v10
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_2

    :cond_3
    :try_start_5
    const-string v10, ""

    :goto_2
    move-object v11, v10

    const-string v10, "featured"

    .line 19
    invoke-interface {v8, v4, v10}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const/4 v13, -0x1

    const-string v15, "priority"

    .line 20
    invoke-interface {v8, v4, v15, v13}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v13

    const-string v15, "thumbnail"

    .line 21
    invoke-interface {v8, v4, v15, v5}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v4

    add-int/lit8 v8, v7, 0x1

    add-int/lit8 v7, v7, 0x64

    if-gez v13, :cond_4

    move v15, v7

    goto :goto_3

    :cond_4
    move v15, v13

    .line 22
    :goto_3
    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->getDepth()I

    move-result v7
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_5

    move v13, v5

    .line 23
    :goto_4
    :try_start_6
    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->next()I

    move-result v5
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    if-ne v5, v9, :cond_5

    .line 24
    :try_start_7
    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->getDepth()I

    move-result v9

    if-le v9, v7, :cond_9

    goto :goto_5

    :catchall_1
    move-exception v0

    move-object v3, v0

    const/4 v6, 0x0

    goto/16 :goto_e

    :cond_5
    :goto_5
    const/4 v9, 0x1

    if-eq v5, v9, :cond_9

    const/4 v9, 0x2

    if-ne v5, v9, :cond_8

    const-string v5, "static-wallpaper"

    .line 25
    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 26
    iget-object v5, v1, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mPartnerProvider:Lcom/android/wallpaper/module/PartnerProvider;

    .line 27
    check-cast v5, Lcom/android/wallpaper/module/DefaultPartnerProvider;

    .line 28
    iget-object v5, v5, Lcom/android/wallpaper/module/DefaultPartnerProvider;->mPackageName:Ljava/lang/String;

    .line 29
    invoke-static {v2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v9

    .line 30
    invoke-static {v5, v12, v9}, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->fromAttributeSet(Ljava/lang/String;Ljava/lang/String;Landroid/util/AttributeSet;)Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;

    move-result-object v5

    goto :goto_6

    :cond_6
    const-string v5, "live-wallpaper"

    .line 31
    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 32
    iget-object v5, v1, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mAppContext:Landroid/content/Context;

    .line 33
    invoke-static {v2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v9

    .line 34
    invoke-static {v5, v12, v9}, Lcom/android/wallpaper/model/LiveWallpaperInfo;->fromAttributeSet(Landroid/content/Context;Ljava/lang/String;Landroid/util/AttributeSet;)Lcom/android/wallpaper/model/LiveWallpaperInfo;

    move-result-object v5

    goto :goto_6

    :cond_7
    const/4 v5, 0x0

    :goto_6
    if-eqz v5, :cond_8

    .line 35
    invoke-virtual {v14, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-nez v13, :cond_8

    const/4 v5, 0x1

    new-array v5, v5, [Lcom/android/wallpaper/model/Category;

    .line 36
    new-instance v9, Lcom/android/wallpaper/model/PlaceholderCategory;

    invoke-direct {v9, v11, v12, v15}, Lcom/android/wallpaper/model/PlaceholderCategory;-><init>(Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    const/4 v13, 0x0

    :try_start_8
    aput-object v9, v5, v13
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 37
    :try_start_9
    invoke-virtual {v1, v5}, Landroid/os/AsyncTask;->publishProgress([Ljava/lang/Object;)V

    const/4 v13, 0x1

    goto :goto_7

    :catchall_2
    move-exception v0

    move-object v3, v0

    move v6, v13

    goto/16 :goto_e

    :cond_8
    :goto_7
    const/4 v9, 0x3

    goto :goto_4

    :cond_9
    if-eqz v4, :cond_a

    .line 38
    new-instance v5, Lcom/android/wallpaper/model/WallpaperCategory;

    new-instance v13, Lcom/android/wallpaper/asset/ResourceAsset;

    invoke-direct {v13, v6, v4}, Lcom/android/wallpaper/asset/ResourceAsset;-><init>(Landroid/content/res/Resources;I)V

    move-object v10, v5

    invoke-direct/range {v10 .. v15}, Lcom/android/wallpaper/model/WallpaperCategory;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/android/wallpaper/asset/Asset;Ljava/util/List;I)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    goto :goto_a

    :cond_a
    const/4 v13, 0x0

    .line 39
    :goto_8
    :try_start_a
    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v4
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    if-ge v13, v4, :cond_c

    .line 40
    :try_start_b
    invoke-virtual {v14, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-virtual {v4}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    if-eqz v4, :cond_b

    goto :goto_9

    :cond_b
    add-int/lit8 v13, v13, 0x1

    goto :goto_8

    :cond_c
    const/4 v13, 0x0

    .line 41
    :goto_9
    :try_start_c
    new-instance v5, Lcom/android/wallpaper/model/WallpaperCategory;

    move-object v10, v5

    invoke-direct/range {v10 .. v15}, Lcom/android/wallpaper/model/WallpaperCategory;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/util/List;I)V

    .line 42
    :goto_a
    iget-object v4, v5, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapers:Ljava/util/List;

    invoke-static {v4}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    .line 43
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_d

    .line 44
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v4, 0x1

    new-array v4, v4, [Lcom/android/wallpaper/model/Category;
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    const/4 v6, 0x0

    :try_start_d
    aput-object v5, v4, v6

    .line 45
    invoke-virtual {v1, v4}, Landroid/os/AsyncTask;->publishProgress([Ljava/lang/Object;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    goto :goto_b

    :catchall_3
    move-exception v0

    goto :goto_d

    :cond_d
    const/4 v6, 0x0

    :goto_b
    move v7, v8

    goto :goto_c

    :catchall_4
    move-exception v0

    const/4 v6, 0x0

    goto :goto_d

    :cond_e
    move v6, v5

    :goto_c
    const/4 v4, 0x0

    const/4 v5, 0x1

    move/from16 v27, v6

    move v6, v5

    move/from16 v5, v27

    goto/16 :goto_0

    :cond_f
    move v6, v5

    .line 46
    :try_start_e
    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->close()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_e .. :try_end_e} :catch_0

    goto :goto_12

    :catchall_5
    move-exception v0

    move v6, v5

    :goto_d
    move-object v3, v0

    :goto_e
    if-eqz v2, :cond_10

    .line 47
    :try_start_f
    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->close()V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_6

    goto :goto_f

    :catchall_6
    move-exception v0

    move-object v2, v0

    :try_start_10
    invoke-virtual {v3, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_10
    :goto_f
    throw v3
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_10 .. :try_end_10} :catch_0

    :catch_0
    move-exception v0

    goto :goto_10

    :catch_1
    move-exception v0

    move v6, v5

    :goto_10
    const-string v2, "DefaultCategoryProvider"

    const-string v3, "Couldn\'t read system wallpapers definition"

    .line 48
    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 49
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v3

    goto :goto_12

    :cond_11
    :goto_11
    move v6, v5

    .line 50
    :goto_12
    iget-object v0, v1, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->mStubApkResources:Landroid/content/res/Resources;

    if-eqz v0, :cond_17

    if-eqz v3, :cond_17

    .line 51
    iget-object v2, v1, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->mStubPackageName:Ljava/lang/String;

    const-string v4, "nexus_live_categories"

    invoke-virtual {v1, v0, v4, v2}, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->getNexusLiveWallpaperCategories(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 52
    invoke-static {v3, v0}, Landroidx/transition/R$id;->merge(Ljava/util/List;Ljava/util/List;)V

    .line 53
    iget-object v0, v1, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->mStubApkResources:Landroid/content/res/Resources;

    .line 54
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 55
    iget-object v4, v1, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->mStubPackageName:Ljava/lang/String;

    const-string v5, "array"

    const-string v7, "static_categories"

    invoke-virtual {v0, v7, v5, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    if-nez v4, :cond_13

    :cond_12
    move-object/from16 v25, v3

    goto/16 :goto_17

    .line 56
    :cond_13
    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v4

    .line 57
    array-length v7, v4

    move v8, v6

    :goto_13
    if-ge v6, v7, :cond_12

    aget-object v15, v4, v6

    .line 58
    iget-object v14, v1, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->mStubPackageName:Ljava/lang/String;

    sget-object v9, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 59
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 60
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, "_wallpapers"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9, v5, v14}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v9

    .line 61
    invoke-virtual {v0, v9}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v12

    .line 62
    array-length v11, v12

    :goto_14
    const-string v9, "_title"

    const-string v10, "string"

    if-ge v8, v11, :cond_14

    move-object/from16 v22, v4

    aget-object v4, v12, v8

    move-object/from16 v23, v5

    const-string v5, "drawable"

    .line 63
    invoke-virtual {v0, v4, v5, v14}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    .line 64
    invoke-static {v4, v9, v0, v10, v14}, Lcom/android/wallpaper/model/PartnerWallpaperInfo$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)I

    move-result v16

    const-string v9, "_subtitle1"

    .line 65
    invoke-static {v4, v9, v0, v10, v14}, Lcom/android/wallpaper/model/PartnerWallpaperInfo$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)I

    move-result v17

    const-string v9, "_subtitle2"

    .line 66
    invoke-static {v4, v9, v0, v10, v14}, Lcom/android/wallpaper/model/PartnerWallpaperInfo$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)I

    move-result v18

    const-string v9, "_action_type"

    move/from16 v24, v7

    const-string v7, "integer"

    .line 67
    invoke-static {v4, v9, v0, v7, v14}, Lcom/android/wallpaper/model/PartnerWallpaperInfo$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)I

    move-result v7

    const-string v9, "_action_url"

    .line 68
    invoke-static {v4, v9, v0, v10, v14}, Lcom/android/wallpaper/model/PartnerWallpaperInfo$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)I

    move-result v19

    .line 69
    new-instance v10, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;

    move-object v9, v10

    move-object/from16 v25, v3

    move-object v3, v10

    move-object v10, v14

    move/from16 v20, v11

    move-object v11, v4

    move-object v4, v12

    move-object v12, v15

    move-object/from16 v21, v4

    move-object v4, v13

    move v13, v5

    move-object v5, v14

    move/from16 v14, v16

    move-object/from16 v26, v5

    move-object v5, v15

    move/from16 v15, v17

    move/from16 v16, v18

    move/from16 v17, v7

    move/from16 v18, v19

    invoke-direct/range {v9 .. v18}, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIIIII)V

    .line 70
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v8, v8, 0x1

    move-object v13, v4

    move-object v15, v5

    move/from16 v11, v20

    move-object/from16 v12, v21

    move-object/from16 v4, v22

    move-object/from16 v5, v23

    move/from16 v7, v24

    move-object/from16 v3, v25

    move-object/from16 v14, v26

    goto :goto_14

    :cond_14
    move-object/from16 v25, v3

    move-object/from16 v22, v4

    move-object/from16 v23, v5

    move/from16 v24, v7

    move-object v4, v13

    move-object v5, v15

    const-string v3, "_featured_image"

    .line 71
    invoke-static {v5, v3}, Landroidx/appcompat/view/SupportMenuInflater$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-object v7, v1, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->mStubPackageName:Ljava/lang/String;

    invoke-virtual {v0, v3, v10, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    if-eqz v3, :cond_16

    .line 72
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v7, 0x0

    .line 73
    :goto_15
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v7, v8, :cond_16

    .line 74
    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;

    .line 75
    iget-object v8, v8, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mWallpaperId:Ljava/lang/String;

    .line 76
    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_15

    move/from16 v19, v7

    goto :goto_16

    :cond_15
    add-int/lit8 v7, v7, 0x1

    goto :goto_15

    :cond_16
    const/4 v3, 0x0

    move/from16 v19, v3

    .line 77
    :goto_16
    new-instance v3, Lcom/android/wallpaper/model/WallpaperCategory;

    .line 78
    invoke-static {v5, v9}, Landroidx/appcompat/view/SupportMenuInflater$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, v1, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->mStubPackageName:Ljava/lang/String;

    invoke-virtual {v0, v7, v10, v8}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v7

    .line 79
    invoke-virtual {v0, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v17

    const-string v7, "nexus_static_category_"

    .line 80
    invoke-static {v7, v5}, Landroidx/appcompat/view/SupportMenuInflater$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    const/16 v21, 0x66

    move-object/from16 v16, v3

    move-object/from16 v20, v4

    invoke-direct/range {v16 .. v21}, Lcom/android/wallpaper/model/WallpaperCategory;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/util/List;I)V

    .line 81
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    const/4 v8, 0x0

    move-object/from16 v4, v22

    move-object/from16 v5, v23

    move/from16 v7, v24

    move-object/from16 v3, v25

    goto/16 :goto_13

    .line 82
    :goto_17
    sput-object v2, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider;->sSystemStaticCategories:Ljava/util/List;

    const/4 v0, 0x1

    goto :goto_18

    :cond_17
    move-object/from16 v25, v3

    .line 83
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    .line 84
    sput-object v0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider;->sSystemStaticCategories:Ljava/util/List;

    const/4 v0, 0x0

    .line 85
    :goto_18
    iget-object v2, v1, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->mPixelApkResources:Landroid/content/res/Resources;

    if-eqz v2, :cond_18

    const-string v3, "pixel_live_categories"

    const-string v4, "com.google.pixel.livewallpaper"

    .line 86
    invoke-virtual {v1, v2, v3, v4}, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;->getNexusLiveWallpaperCategories(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    goto :goto_19

    :cond_18
    const/4 v2, 0x0

    :goto_19
    if-eqz v2, :cond_19

    .line 87
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_19

    move-object/from16 v3, v25

    .line 88
    invoke-static {v3, v2}, Landroidx/transition/R$id;->merge(Ljava/util/List;Ljava/util/List;)V

    const/4 v0, 0x1

    goto :goto_1a

    :cond_19
    move-object/from16 v3, v25

    :goto_1a
    if-eqz v0, :cond_1a

    const/4 v0, 0x0

    .line 89
    :goto_1b
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_1a

    const/4 v2, 0x1

    new-array v2, v2, [Lcom/android/wallpaper/model/Category;

    .line 90
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/wallpaper/model/Category;

    const/4 v5, 0x0

    aput-object v4, v2, v5

    invoke-virtual {v1, v2}, Landroid/os/AsyncTask;->publishProgress([Ljava/lang/Object;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1b

    :cond_1a
    const/4 v0, 0x0

    .line 91
    :goto_1c
    sget-object v2, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider;->sSystemStaticCategories:Ljava/util/List;

    .line 92
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_1b

    const/4 v2, 0x1

    new-array v2, v2, [Lcom/android/wallpaper/model/Category;

    .line 93
    sget-object v4, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider;->sSystemStaticCategories:Ljava/util/List;

    .line 94
    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/wallpaper/model/Category;

    const/4 v5, 0x0

    aput-object v4, v2, v5

    invoke-virtual {v1, v2}, Landroid/os/AsyncTask;->publishProgress([Ljava/lang/Object;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1c

    :cond_1b
    return-object v3
.end method
