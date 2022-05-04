.class public Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/module/DefaultWallpaperRefresher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "GetWallpaperMetadataAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/util/List<",
        "Lcom/android/wallpaper/model/WallpaperMetadata;",
        ">;>;"
    }
.end annotation


# instance fields
.field public mCurrentHomeWallpaperHashCode:J

.field public mCurrentLockWallpaperHashCode:J

.field public final mListener:Lcom/android/wallpaper/module/WallpaperRefresher$RefreshListener;

.field public mSystemWallpaperPackageName:Ljava/lang/String;

.field public final mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

.field public final synthetic this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/module/DefaultWallpaperRefresher;Lcom/android/wallpaper/module/WallpaperRefresher$RefreshListener;)V
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ServiceCast"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->mListener:Lcom/android/wallpaper/module/WallpaperRefresher$RefreshListener;

    .line 3
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p2

    .line 4
    iget-object p1, p1, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mAppContext:Landroid/content/Context;

    .line 5
    invoke-interface {p2, p1}, Lcom/android/wallpaper/module/Injector;->getWallpaperManagerCompat(Landroid/content/Context;)Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    return-void
.end method


# virtual methods
.method public doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 20

    move-object/from16 v0, p0

    .line 1
    move-object/from16 v1, p1

    check-cast v1, [Ljava/lang/Void;

    .line 2
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 3
    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 4
    iget-object v2, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperManager:Landroid/app/WallpaperManager;

    .line 5
    invoke-virtual {v2}, Landroid/app/WallpaperManager;->getWallpaperInfo()Landroid/app/WallpaperInfo;

    move-result-object v2

    const-wide/16 v3, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-nez v2, :cond_2

    .line 6
    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 7
    iget-object v2, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 8
    invoke-interface {v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperHashCode()J

    move-result-wide v7

    .line 9
    invoke-static {}, Lcom/android/wallpaper/compat/BuildCompat;->isAtLeastN()Z

    move-result v2

    if-eqz v2, :cond_0

    cmp-long v2, v7, v3

    if-nez v2, :cond_0

    .line 10
    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 11
    iget-object v2, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 12
    invoke-interface {v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperManagerId()I

    move-result v2

    iget-object v7, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    .line 13
    invoke-virtual {v7, v5}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->getWallpaperId(I)I

    move-result v7

    if-ne v2, v7, :cond_1

    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->getCurrentHomeWallpaperHashCode()J

    move-result-wide v9

    cmp-long v2, v7, v9

    if-nez v2, :cond_1

    :goto_0
    move v2, v5

    goto :goto_1

    :cond_1
    move v2, v6

    goto :goto_1

    .line 15
    :cond_2
    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 16
    iget-object v2, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperManager:Landroid/app/WallpaperManager;

    .line 17
    invoke-virtual {v2}, Landroid/app/WallpaperManager;->getWallpaperInfo()Landroid/app/WallpaperInfo;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/WallpaperInfo;->getPackageName()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->mSystemWallpaperPackageName:Ljava/lang/String;

    .line 18
    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 19
    iget-object v2, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 20
    invoke-interface {v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperPackageName()Ljava/lang/String;

    move-result-object v2

    .line 21
    iget-object v7, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->mSystemWallpaperPackageName:Ljava/lang/String;

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    :goto_1
    const v7, 0x7f110086

    const/4 v8, 0x2

    if-eqz v2, :cond_4

    .line 22
    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 23
    iget-object v2, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 24
    invoke-interface {v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperAttributions()Ljava/util/List;

    move-result-object v2

    .line 25
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    if-nez v9, :cond_3

    .line 26
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    if-nez v9, :cond_3

    .line 27
    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_3

    move v2, v5

    goto :goto_2

    :cond_3
    move v2, v6

    :goto_2
    if-eqz v2, :cond_7

    .line 28
    :cond_4
    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 29
    iget-object v2, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 30
    invoke-interface {v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->clearHomeWallpaperMetadata()V

    .line 31
    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 32
    iget-object v2, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperManager:Landroid/app/WallpaperManager;

    .line 33
    invoke-virtual {v2}, Landroid/app/WallpaperManager;->getWallpaperInfo()Landroid/app/WallpaperInfo;

    move-result-object v2

    if-nez v2, :cond_6

    .line 34
    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 35
    iget-object v9, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    new-array v10, v5, [Ljava/lang/String;

    .line 36
    iget-object v2, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mAppContext:Landroid/content/Context;

    .line 37
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v10, v6

    invoke-static {v10}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 38
    invoke-interface {v9, v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperAttributions(Ljava/util/List;)V

    .line 39
    invoke-static {}, Lcom/android/wallpaper/compat/BuildCompat;->isAtLeastN()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 40
    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 41
    iget-object v2, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 42
    iget-object v9, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    invoke-virtual {v9, v5}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->getWallpaperId(I)I

    move-result v9

    invoke-interface {v2, v9}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperManagerId(I)V

    goto :goto_3

    .line 43
    :cond_5
    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 44
    iget-object v2, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 45
    invoke-virtual/range {p0 .. p0}, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->getCurrentHomeWallpaperHashCode()J

    move-result-wide v9

    invoke-interface {v2, v9, v10}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperHashCode(J)V

    goto :goto_3

    .line 46
    :cond_6
    iget-object v9, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 47
    iget-object v10, v9, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    new-array v11, v5, [Ljava/lang/String;

    .line 48
    iget-object v9, v9, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mAppContext:Landroid/content/Context;

    .line 49
    invoke-virtual {v9}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    invoke-virtual {v2, v9}, Landroid/app/WallpaperInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v11, v6

    .line 50
    invoke-static {v11}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v10, v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperAttributions(Ljava/util/List;)V

    .line 51
    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 52
    iget-object v2, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 53
    iget-object v9, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->mSystemWallpaperPackageName:Ljava/lang/String;

    invoke-interface {v2, v9}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperPackageName(Ljava/lang/String;)V

    .line 54
    :goto_3
    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 55
    iget-object v2, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 56
    invoke-interface {v2, v5}, Lcom/android/wallpaper/module/WallpaperPreferences;->setWallpaperPresentationMode(I)V

    .line 57
    :cond_7
    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 58
    iget-object v9, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperStatusChecker:Lcom/google/android/material/shape/EdgeTreatment;

    .line 59
    iget-object v2, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mAppContext:Landroid/content/Context;

    .line 60
    invoke-virtual {v9, v2}, Lcom/google/android/material/shape/EdgeTreatment;->isLockWallpaperSet(Landroid/content/Context;)Z

    move-result v2

    .line 61
    invoke-static {}, Lcom/android/wallpaper/compat/BuildCompat;->isAtLeastN()Z

    move-result v9

    if-eqz v9, :cond_12

    if-nez v2, :cond_8

    goto/16 :goto_d

    .line 62
    :cond_8
    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 63
    iget-object v2, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 64
    invoke-interface {v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->getLockWallpaperHashCode()J

    move-result-wide v9

    cmp-long v2, v9, v3

    if-nez v2, :cond_9

    .line 65
    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 66
    iget-object v2, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 67
    invoke-interface {v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->getLockWallpaperId()I

    move-result v2

    iget-object v3, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    .line 68
    invoke-virtual {v3, v8}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->getWallpaperId(I)I

    move-result v3

    if-ne v2, v3, :cond_e

    goto/16 :goto_a

    .line 69
    :cond_9
    iget-wide v11, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->mCurrentLockWallpaperHashCode:J

    cmp-long v2, v11, v3

    if-nez v2, :cond_d

    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 70
    iget-object v3, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperStatusChecker:Lcom/google/android/material/shape/EdgeTreatment;

    .line 71
    iget-object v2, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mAppContext:Landroid/content/Context;

    .line 72
    invoke-virtual {v3, v2}, Lcom/google/android/material/shape/EdgeTreatment;->isLockWallpaperSet(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_d

    const-string v2, "IO exception when closing input stream for lock screen WP."

    const-string v3, "DefaultWPRefresher"

    .line 73
    iget-object v4, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    invoke-virtual {v4, v8}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->getWallpaperFile(I)Landroid/os/ParcelFileDescriptor;

    move-result-object v4

    const/4 v11, 0x0

    if-eqz v4, :cond_c

    .line 74
    :try_start_0
    new-instance v12, Ljava/io/FileInputStream;

    invoke-virtual {v4}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 75
    :try_start_1
    invoke-static {v12}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v11

    .line 76
    invoke-virtual {v4}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 77
    :try_start_2
    invoke-virtual {v12}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_9

    .line 78
    :catch_0
    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9

    :catchall_0
    move-exception v0

    goto :goto_7

    :catch_1
    move-object v4, v11

    move-object v11, v12

    goto :goto_4

    :catchall_1
    move-exception v0

    goto :goto_6

    :catch_2
    move-object v4, v11

    :goto_4
    :try_start_3
    const-string v12, "IO exception when closing the file descriptor."

    .line 79
    invoke-static {v3, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v11, :cond_a

    .line 80
    :try_start_4
    invoke-virtual {v11}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_5

    .line 81
    :catch_3
    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_a
    :goto_5
    move-object v11, v4

    goto :goto_9

    :goto_6
    move-object v12, v11

    :goto_7
    if-eqz v12, :cond_b

    .line 82
    :try_start_5
    invoke-virtual {v12}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_8

    .line 83
    :catch_4
    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    :cond_b
    :goto_8
    throw v0

    .line 85
    :cond_c
    :goto_9
    invoke-static {v11}, Landroidx/cardview/R$color;->generateHashCode(Landroid/graphics/Bitmap;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->mCurrentLockWallpaperHashCode:J

    .line 86
    :cond_d
    iget-wide v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->mCurrentLockWallpaperHashCode:J

    cmp-long v2, v9, v2

    if-nez v2, :cond_e

    :goto_a
    move v2, v5

    goto :goto_b

    :cond_e
    move v2, v6

    :goto_b
    if-eqz v2, :cond_10

    .line 87
    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 88
    iget-object v2, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 89
    invoke-interface {v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->getLockWallpaperAttributions()Ljava/util/List;

    move-result-object v2

    .line 90
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_f

    .line 91
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_f

    .line 92
    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_f

    move v2, v5

    goto :goto_c

    :cond_f
    move v2, v6

    :goto_c
    if-eqz v2, :cond_11

    .line 93
    :cond_10
    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 94
    iget-object v2, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 95
    invoke-interface {v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->clearLockWallpaperMetadata()V

    .line 96
    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 97
    iget-object v3, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    new-array v4, v5, [Ljava/lang/String;

    .line 98
    iget-object v2, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mAppContext:Landroid/content/Context;

    .line 99
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v4, v6

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 100
    invoke-interface {v3, v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLockWallpaperAttributions(Ljava/util/List;)V

    .line 101
    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 102
    iget-object v2, v2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 103
    iget-object v3, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    invoke-virtual {v3, v8}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->getWallpaperId(I)I

    move-result v3

    invoke-interface {v2, v3}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLockWallpaperId(I)V

    .line 104
    :cond_11
    new-instance v2, Lcom/android/wallpaper/model/WallpaperMetadata;

    iget-object v3, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 105
    iget-object v3, v3, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 106
    invoke-interface {v3}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperAttributions()Ljava/util/List;

    move-result-object v5

    iget-object v3, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 107
    iget-object v3, v3, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 108
    invoke-interface {v3}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperActionUrl()Ljava/lang/String;

    move-result-object v6

    iget-object v3, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 109
    iget-object v3, v3, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 110
    invoke-interface {v3}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperActionLabelRes()I

    move-result v7

    iget-object v3, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 111
    iget-object v3, v3, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 112
    invoke-interface {v3}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperActionIconRes()I

    move-result v8

    iget-object v3, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 113
    iget-object v3, v3, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 114
    invoke-interface {v3}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperCollectionId()Ljava/lang/String;

    move-result-object v9

    iget-object v3, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 115
    iget-object v3, v3, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 116
    invoke-interface {v3}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperBackingFileName()Ljava/lang/String;

    move-result-object v10

    iget-object v3, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 117
    iget-object v3, v3, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperManager:Landroid/app/WallpaperManager;

    .line 118
    invoke-virtual {v3}, Landroid/app/WallpaperManager;->getWallpaperInfo()Landroid/app/WallpaperInfo;

    move-result-object v11

    move-object v4, v2

    invoke-direct/range {v4 .. v11}, Lcom/android/wallpaper/model/WallpaperMetadata;-><init>(Ljava/util/List;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Landroid/app/WallpaperInfo;)V

    .line 119
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 120
    new-instance v2, Lcom/android/wallpaper/model/WallpaperMetadata;

    iget-object v3, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 121
    iget-object v3, v3, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 122
    invoke-interface {v3}, Lcom/android/wallpaper/module/WallpaperPreferences;->getLockWallpaperAttributions()Ljava/util/List;

    move-result-object v13

    iget-object v3, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 123
    iget-object v3, v3, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 124
    invoke-interface {v3}, Lcom/android/wallpaper/module/WallpaperPreferences;->getLockWallpaperActionUrl()Ljava/lang/String;

    move-result-object v14

    iget-object v3, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 125
    iget-object v3, v3, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 126
    invoke-interface {v3}, Lcom/android/wallpaper/module/WallpaperPreferences;->getLockWallpaperActionLabelRes()I

    move-result v15

    iget-object v3, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 127
    iget-object v3, v3, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 128
    invoke-interface {v3}, Lcom/android/wallpaper/module/WallpaperPreferences;->getLockWallpaperActionIconRes()I

    move-result v16

    iget-object v3, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 129
    iget-object v3, v3, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 130
    invoke-interface {v3}, Lcom/android/wallpaper/module/WallpaperPreferences;->getLockWallpaperCollectionId()Ljava/lang/String;

    move-result-object v17

    iget-object v0, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 131
    iget-object v0, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 132
    invoke-interface {v0}, Lcom/android/wallpaper/module/WallpaperPreferences;->getLockWallpaperBackingFileName()Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x0

    move-object v12, v2

    invoke-direct/range {v12 .. v19}, Lcom/android/wallpaper/model/WallpaperMetadata;-><init>(Ljava/util/List;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Landroid/app/WallpaperInfo;)V

    .line 133
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_e

    .line 134
    :cond_12
    :goto_d
    new-instance v2, Lcom/android/wallpaper/model/WallpaperMetadata;

    iget-object v3, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 135
    iget-object v3, v3, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 136
    invoke-interface {v3}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperAttributions()Ljava/util/List;

    move-result-object v4

    iget-object v3, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 137
    iget-object v3, v3, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 138
    invoke-interface {v3}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperActionUrl()Ljava/lang/String;

    move-result-object v5

    iget-object v3, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 139
    iget-object v3, v3, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 140
    invoke-interface {v3}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperActionLabelRes()I

    move-result v6

    iget-object v3, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 141
    iget-object v3, v3, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 142
    invoke-interface {v3}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperActionIconRes()I

    move-result v7

    iget-object v3, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 143
    iget-object v3, v3, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 144
    invoke-interface {v3}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperCollectionId()Ljava/lang/String;

    move-result-object v8

    iget-object v3, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 145
    iget-object v3, v3, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 146
    invoke-interface {v3}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperBackingFileName()Ljava/lang/String;

    move-result-object v9

    iget-object v0, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 147
    iget-object v0, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperManager:Landroid/app/WallpaperManager;

    .line 148
    invoke-virtual {v0}, Landroid/app/WallpaperManager;->getWallpaperInfo()Landroid/app/WallpaperInfo;

    move-result-object v10

    move-object v3, v2

    invoke-direct/range {v3 .. v10}, Lcom/android/wallpaper/model/WallpaperMetadata;-><init>(Ljava/util/List;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Landroid/app/WallpaperInfo;)V

    .line 149
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_e
    return-object v1
.end method

.method public final getCurrentHomeWallpaperHashCode()J
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->mCurrentHomeWallpaperHashCode:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    invoke-virtual {v0}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 3
    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 4
    invoke-static {v0}, Landroidx/cardview/R$color;->generateHashCode(Landroid/graphics/Bitmap;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->mCurrentHomeWallpaperHashCode:J

    .line 5
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 6
    iget-object v0, v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperManager:Landroid/app/WallpaperManager;

    .line 7
    invoke-virtual {v0}, Landroid/app/WallpaperManager;->forgetLoadedWallpaper()V

    .line 8
    :cond_0
    iget-wide v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->mCurrentHomeWallpaperHashCode:J

    return-wide v0
.end method

.method public onPostExecute(Ljava/lang/Object;)V
    .locals 4

    .line 1
    check-cast p1, Ljava/util/List;

    .line 2
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x2

    if-le v0, v1, :cond_0

    const-string p0, "DefaultWPRefresher"

    const-string p1, "Got more than 2 WallpaperMetadata objects - only home and (optionally) lock are permitted."

    .line 3
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->mListener:Lcom/android/wallpaper/module/WallpaperRefresher$RefreshListener;

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/wallpaper/model/WallpaperMetadata;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_1

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/wallpaper/model/WallpaperMetadata;

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 6
    invoke-interface {p0}, Lcom/android/wallpaper/module/WallpaperPreferences;->getWallpaperPresentationMode()I

    move-result p0

    .line 7
    invoke-interface {v0, v1, p1, p0}, Lcom/android/wallpaper/module/WallpaperRefresher$RefreshListener;->onRefreshed(Lcom/android/wallpaper/model/WallpaperMetadata;Lcom/android/wallpaper/model/WallpaperMetadata;I)V

    :goto_1
    return-void
.end method
