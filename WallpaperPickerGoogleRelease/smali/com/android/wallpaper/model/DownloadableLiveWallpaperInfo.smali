.class public Lcom/android/wallpaper/model/DownloadableLiveWallpaperInfo;
.super Lcom/android/wallpaper/model/LiveWallpaperInfo;
.source "SourceFile"


# static fields
.field public static final COLUMNS:[Ljava/lang/String;

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/android/wallpaper/model/DownloadableLiveWallpaperInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final WALLPAPERS_URI:Landroid/net/Uri;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/wallpaper/model/DownloadableLiveWallpaperInfo$1;

    invoke-direct {v0}, Lcom/android/wallpaper/model/DownloadableLiveWallpaperInfo$1;-><init>()V

    sput-object v0, Lcom/android/wallpaper/model/DownloadableLiveWallpaperInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    const-string v0, "content://com.google.pixel.livewallpaper.provider/wallpapers"

    .line 2
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/wallpaper/model/DownloadableLiveWallpaperInfo;->WALLPAPERS_URI:Landroid/net/Uri;

    const-string v0, "to_be_installed_wallpaper"

    .line 3
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/wallpaper/model/DownloadableLiveWallpaperInfo;->COLUMNS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/app/WallpaperInfo;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/wallpaper/model/LiveWallpaperInfo;-><init>(Landroid/app/WallpaperInfo;ZLjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;Lcom/android/wallpaper/model/DownloadableLiveWallpaperInfo$1;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1}, Lcom/android/wallpaper/model/LiveWallpaperInfo;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public static getToBeInstalledComponent(Landroid/content/Context;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "DownloadLiveWallpaperInfo"

    .line 1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 2
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    sget-object v3, Lcom/android/wallpaper/model/DownloadableLiveWallpaperInfo;->WALLPAPERS_URI:Landroid/net/Uri;

    .line 3
    invoke-virtual {p0, v3}, Landroid/content/ContentResolver;->acquireUnstableContentProviderClient(Landroid/net/Uri;)Landroid/content/ContentProviderClient;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-nez p0, :cond_1

    :try_start_1
    const-string v2, "Can\'t get to be installed with null ContentProviderClient"

    .line 4
    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    if-eqz p0, :cond_0

    .line 5
    :try_start_2
    invoke-virtual {p0}, Landroid/content/ContentProviderClient;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :cond_0
    return-object v1

    :cond_1
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v2, p0

    .line 6
    :try_start_3
    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentProviderClient;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    if-nez v2, :cond_3

    :try_start_4
    const-string v3, "Can\'t get to be installed with null cursor"

    .line 7
    invoke-static {v0, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz v2, :cond_2

    .line 8
    :try_start_5
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 9
    :cond_2
    :try_start_6
    invoke-virtual {p0}, Landroid/content/ContentProviderClient;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    return-object v1

    .line 10
    :cond_3
    :try_start_7
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 11
    :cond_4
    sget-object v3, Lcom/android/wallpaper/model/DownloadableLiveWallpaperInfo;->COLUMNS:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    .line 12
    invoke-interface {v2, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    if-nez v3, :cond_4

    .line 14
    :cond_5
    :try_start_8
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_8
    .catch Landroid/os/RemoteException; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    goto :goto_1

    :catchall_0
    move-exception v3

    if-eqz v2, :cond_6

    .line 15
    :try_start_9
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    :try_start_a
    invoke-virtual {v3, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_6
    :goto_0
    throw v3
    :try_end_a
    .catch Landroid/os/RemoteException; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    :catchall_2
    move-exception v2

    goto :goto_2

    :catch_0
    move-exception v2

    :try_start_b
    const-string v3, "Query to be installed exception: "

    .line 16
    invoke-static {v0, v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 17
    :goto_1
    :try_start_c
    invoke-virtual {p0}, Landroid/content/ContentProviderClient;->close()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_1

    goto :goto_4

    :goto_2
    if-eqz p0, :cond_7

    .line 18
    :try_start_d
    invoke-virtual {p0}, Landroid/content/ContentProviderClient;->close()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    goto :goto_3

    :catchall_3
    move-exception p0

    :try_start_e
    invoke-virtual {v2, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_7
    :goto_3
    throw v2
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_1

    :catch_1
    move-exception p0

    const-string v2, "ContentProviderClient close internal exception: "

    .line 19
    invoke-static {v0, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_4
    return-object v1
.end method


# virtual methods
.method public isToBeInstalled(Ljava/util/List;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/model/LiveWallpaperInfo;->mInfo:Landroid/app/WallpaperInfo;

    .line 2
    invoke-virtual {p0}, Landroid/app/WallpaperInfo;->getComponent()Landroid/content/ComponentName;

    move-result-object p0

    .line 3
    invoke-virtual {p0}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public showPreview(Landroid/app/Activity;Lcom/android/wallpaper/model/InlinePreviewIntentFactory;I)V
    .locals 6

    .line 1
    invoke-static {p1}, Lcom/android/wallpaper/model/DownloadableLiveWallpaperInfo;->getToBeInstalledComponent(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/wallpaper/model/DownloadableLiveWallpaperInfo;->isToBeInstalled(Ljava/util/List;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 3
    invoke-super {p0, p1, p2, p3}, Lcom/android/wallpaper/model/LiveWallpaperInfo;->showPreview(Landroid/app/Activity;Lcom/android/wallpaper/model/InlinePreviewIntentFactory;I)V

    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/model/LiveWallpaperInfo;->mInfo:Landroid/app/WallpaperInfo;

    .line 5
    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.google.pixel.livewallpaper.action.DOWNLOAD_LIVE_WALLPAPER"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 6
    new-instance v3, Landroid/content/ComponentName;

    const-string v4, "com.google.pixel.livewallpaper"

    const-string v5, "com.google.pixel.livewallpaper.split.FeatureActivity"

    invoke-direct {v3, v4, v5}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    const/high16 v3, 0x30000000

    .line 7
    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v3, "android.live_wallpaper.info"

    .line 8
    invoke-virtual {v1, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 9
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/4 v5, 0x0

    invoke-virtual {v0, v1, v5}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    .line 10
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    const/4 v5, 0x1

    :cond_1
    if-nez v5, :cond_2

    .line 11
    iget-object p0, p0, Lcom/android/wallpaper/model/LiveWallpaperInfo;->mInfo:Landroid/app/WallpaperInfo;

    .line 12
    new-instance p2, Landroid/content/Intent;

    invoke-direct {p2, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 13
    new-instance v0, Landroid/content/ComponentName;

    const-string v1, "com.google.pixel.livewallpaper.split.DownloadActivity"

    invoke-direct {v0, v4, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 14
    invoke-virtual {p2, v3, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 15
    invoke-static {p1, p2, p3}, Lcom/android/wallpaper/util/ActivityUtils;->startActivityForResultSafely(Landroid/app/Activity;Landroid/content/Intent;I)V

    goto :goto_0

    .line 16
    :cond_2
    invoke-interface {p2, p1, p0}, Lcom/android/wallpaper/model/InlinePreviewIntentFactory;->newIntent(Landroid/content/Context;Lcom/android/wallpaper/model/WallpaperInfo;)Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {p1, p0, p3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    :goto_0
    return-void
.end method
