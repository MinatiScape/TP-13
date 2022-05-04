.class public Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;
.super Lcom/android/wallpaper/model/WallpaperCategory;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;
    }
.end annotation


# instance fields
.field public final mCollectionName:Ljava/lang/String;

.field public final mFifeImageUrlFactory:Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;

.field public final mPendingWallpapersReceivers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/WallpaperReceiver;",
            ">;"
        }
    .end annotation
.end field

.field public mRotationInitializer:Lcom/android/wallpaper/model/WallpaperRotationInitializer;

.field public mThumbAsset:Lcom/android/wallpaper/asset/Asset;

.field public final mThumbUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;I)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;->getCollectionName()Ljava/lang/String;

    move-result-object v0

    .line 2
    invoke-virtual {p1}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;->getCollectionId()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 3
    invoke-direct {p0, v0, v1, v2, p2}, Lcom/android/wallpaper/model/WallpaperCategory;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;I)V

    .line 4
    invoke-virtual {p1}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;->getCollectionName()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->mCollectionName:Ljava/lang/String;

    const/4 p2, 0x0

    .line 5
    invoke-virtual {p1, p2}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;->getPreview(I)Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;->getImageUrl()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->mThumbUrl:Ljava/lang/String;

    .line 6
    invoke-static {}, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;->getInstance()Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->mFifeImageUrlFactory:Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;

    .line 7
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->mPendingWallpapersReceivers:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public fetchWallpapers(Landroid/content/Context;Lcom/android/wallpaper/model/WallpaperReceiver;Z)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    check-cast v0, Lcom/android/wallpaper/module/GoogleWallpapersInjector;

    .line 2
    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/GoogleWallpapersInjector;->getServerFetcher(Landroid/content/Context;)Lcom/android/wallpaper/network/ServerFetcher;

    move-result-object v0

    .line 3
    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapersLock:Ljava/lang/Object;

    monitor-enter v1

    .line 4
    :try_start_0
    iget-object v2, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapers:Ljava/util/List;

    .line 5
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_0

    if-eqz p2, :cond_0

    if-nez p3, :cond_0

    .line 6
    invoke-interface {p2, v2}, Lcom/android/wallpaper/model/WallpaperReceiver;->onWallpapersReceived(Ljava/util/List;)V

    .line 7
    monitor-exit v1

    return-void

    :cond_0
    if-eqz p3, :cond_1

    .line 8
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 9
    :cond_1
    iget-object p3, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->mPendingWallpapersReceivers:Ljava/util/List;

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p3

    if-lez p3, :cond_2

    const/4 p3, 0x1

    goto :goto_0

    :cond_2
    const/4 p3, 0x0

    .line 10
    :goto_0
    iget-object v3, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->mPendingWallpapersReceivers:Ljava/util/List;

    invoke-interface {v3, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    if-eqz p3, :cond_3

    .line 11
    monitor-exit v1

    return-void

    .line 12
    :cond_3
    iget-object p2, p0, Lcom/android/wallpaper/model/Category;->mCollectionId:Ljava/lang/String;

    .line 13
    new-instance p3, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$2;

    invoke-direct {p3, p0, p1, v2, p2}, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$2;-><init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;Landroid/content/Context;Ljava/util/List;Ljava/lang/String;)V

    check-cast v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;->fetchImagesInCollection(Landroid/content/Context;Ljava/lang/String;Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback;)V

    .line 14
    monitor-exit v1

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public getThumbnail(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->mThumbAsset:Lcom/android/wallpaper/asset/Asset;

    if-nez v0, :cond_0

    .line 2
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->mFifeImageUrlFactory:Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->mThumbUrl:Ljava/lang/String;

    invoke-virtual {v0, p1, v1}, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;->createThumbUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 3
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->mFifeImageUrlFactory:Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->mThumbUrl:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;->createTinyUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 4
    new-instance v2, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;

    invoke-direct {v2, p1, v0, v1}, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;-><init>(Landroid/content/Context;Landroid/net/Uri;Landroid/net/Uri;)V

    iput-object v2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->mThumbAsset:Lcom/android/wallpaper/asset/Asset;

    .line 5
    :cond_0
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->mThumbAsset:Lcom/android/wallpaper/asset/Asset;

    return-object p0
.end method

.method public getWallpaperRotationInitializer()Lcom/android/wallpaper/model/WallpaperRotationInitializer;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/Category;->mCollectionId:Ljava/lang/String;

    if-eqz v0, :cond_0

    const-string v1, "_no_rotate"

    .line 2
    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 3
    :cond_0
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->mRotationInitializer:Lcom/android/wallpaper/model/WallpaperRotationInitializer;

    if-nez v0, :cond_1

    .line 4
    invoke-static {}, Lcom/google/android/apps/wallpaper/backdrop/WallpaperRotationInitializerFactory;->getInstance()Lcom/google/android/apps/wallpaper/backdrop/WallpaperRotationInitializerFactory;

    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/wallpaper/model/Category;->mCollectionId:Ljava/lang/String;

    .line 6
    iget-object v2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->mCollectionName:Ljava/lang/String;

    .line 7
    check-cast v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$Factory;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    new-instance v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;

    invoke-direct {v0, v1, v2}, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    iput-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->mRotationInitializer:Lcom/android/wallpaper/model/WallpaperRotationInitializer;

    .line 10
    :cond_1
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->mRotationInitializer:Lcom/android/wallpaper/model/WallpaperRotationInitializer;

    return-object p0
.end method
