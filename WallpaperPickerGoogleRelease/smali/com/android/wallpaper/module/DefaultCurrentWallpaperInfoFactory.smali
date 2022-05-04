.class public Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory;


# instance fields
.field public mHomeWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

.field public final mLiveWallpaperInfoFactory:Lcom/google/android/material/shape/CornerTreatment;

.field public mLockWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

.field public mPresentationMode:I

.field public final mWallpaperRefresher:Lcom/android/wallpaper/module/WallpaperRefresher;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    .line 3
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    .line 4
    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/Injector;->getWallpaperRefresher(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperRefresher;

    move-result-object v1

    iput-object v1, p0, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;->mWallpaperRefresher:Lcom/android/wallpaper/module/WallpaperRefresher;

    .line 5
    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/Injector;->getLiveWallpaperInfoFactory(Landroid/content/Context;)Lcom/google/android/material/shape/CornerTreatment;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;->mLiveWallpaperInfoFactory:Lcom/google/android/material/shape/CornerTreatment;

    return-void
.end method


# virtual methods
.method public declared-synchronized createCurrentWallpaperInfos(Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory$WallpaperInfoCallback;Z)V
    .locals 3

    monitor-enter p0

    if-nez p2, :cond_0

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;->mHomeWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    if-eqz v0, :cond_0

    iget v1, p0, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;->mPresentationMode:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_0

    .line 2
    iget-object p2, p0, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;->mLockWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-interface {p1, v0, p2, v1}, Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory$WallpaperInfoCallback;->onWallpaperInfoCreated(Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/model/WallpaperInfo;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    const/4 p2, 0x0

    .line 4
    :try_start_1
    iput-object p2, p0, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;->mHomeWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 5
    iput-object p2, p0, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;->mLockWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 6
    :cond_1
    iget-object p2, p0, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;->mWallpaperRefresher:Lcom/android/wallpaper/module/WallpaperRefresher;

    new-instance v0, Lcom/android/wallpaper/picker/WallpaperInfoHelper$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Lcom/android/wallpaper/picker/WallpaperInfoHelper$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory$WallpaperInfoCallback;)V

    check-cast p2, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    invoke-virtual {p2, v0}, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->refresh(Lcom/android/wallpaper/module/WallpaperRefresher$RefreshListener;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 7
    monitor-exit p0

    return-void

    :goto_0
    monitor-exit p0

    throw p1
.end method
