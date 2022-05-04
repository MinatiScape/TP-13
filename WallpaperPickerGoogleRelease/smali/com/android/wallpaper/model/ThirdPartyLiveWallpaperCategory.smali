.class public Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory;
.super Lcom/android/wallpaper/model/WallpaperCategory;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory$FetchLiveWallpapersTask;
    }
.end annotation


# instance fields
.field public final mExcludedPackages:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;ILjava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            ">;I",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/wallpaper/model/WallpaperCategory;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;I)V

    .line 2
    iput-object p5, p0, Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory;->mExcludedPackages:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public containsThirdParty(Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapersLock:Ljava/lang/Object;

    monitor-enter v0

    .line 2
    :try_start_0
    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapers:Ljava/util/List;

    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/wallpaper/model/WallpaperInfo;

    .line 4
    invoke-virtual {v1}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperComponent()Landroid/app/WallpaperInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 5
    invoke-virtual {v1}, Landroid/app/WallpaperInfo;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 p0, 0x1

    .line 6
    monitor-exit v0

    return p0

    .line 7
    :cond_1
    monitor-exit v0

    const/4 p0, 0x0

    return p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public fetchWallpapers(Landroid/content/Context;Lcom/android/wallpaper/model/WallpaperReceiver;Z)V
    .locals 6

    if-eqz p3, :cond_0

    .line 1
    new-instance p3, Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory$FetchLiveWallpapersTask;

    .line 2
    iget-object v3, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapers:Ljava/util/List;

    .line 3
    iget-object v4, p0, Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory;->mExcludedPackages:Ljava/util/Set;

    move-object v0, p3

    move-object v1, p0

    move-object v2, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory$FetchLiveWallpapersTask;-><init>(Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory;Landroid/content/Context;Ljava/util/List;Ljava/util/Set;Lcom/android/wallpaper/model/WallpaperReceiver;)V

    .line 4
    sget-object p0, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Void;

    invoke-virtual {p3, p0, p1}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 5
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/android/wallpaper/model/WallpaperCategory;->fetchWallpapers(Landroid/content/Context;Lcom/android/wallpaper/model/WallpaperReceiver;Z)V

    :goto_0
    return-void
.end method
