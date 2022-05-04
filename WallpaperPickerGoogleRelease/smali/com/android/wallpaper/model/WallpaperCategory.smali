.class public Lcom/android/wallpaper/model/WallpaperCategory;
.super Lcom/android/wallpaper/model/Category;
.source "SourceFile"


# instance fields
.field public mFeaturedThumbnailIndex:I

.field public mThumbAsset:Lcom/android/wallpaper/asset/Asset;

.field public final mWallpapers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            ">;"
        }
    .end annotation
.end field

.field public final mWallpapersLock:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ILjava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2, p5}, Lcom/android/wallpaper/model/Category;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 2
    iput-object p4, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapers:Ljava/util/List;

    .line 3
    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapersLock:Ljava/lang/Object;

    .line 4
    iput p3, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mFeaturedThumbnailIndex:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/android/wallpaper/asset/Asset;Ljava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/android/wallpaper/asset/Asset;",
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            ">;I)V"
        }
    .end annotation

    .line 9
    invoke-direct {p0, p1, p2, p5}, Lcom/android/wallpaper/model/Category;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 10
    iput-object p4, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapers:Ljava/util/List;

    .line 11
    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapersLock:Ljava/lang/Object;

    .line 12
    iput-object p3, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mThumbAsset:Lcom/android/wallpaper/asset/Asset;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            ">;I)V"
        }
    .end annotation

    .line 5
    invoke-direct {p0, p1, p2, p4}, Lcom/android/wallpaper/model/Category;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 6
    iput-object p3, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapers:Ljava/util/List;

    .line 7
    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapersLock:Ljava/lang/Object;

    const/4 p1, 0x0

    .line 8
    iput p1, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mFeaturedThumbnailIndex:I

    return-void
.end method


# virtual methods
.method public containsThirdParty(Ljava/lang/String;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public fetchWallpapers(Landroid/content/Context;Lcom/android/wallpaper/model/WallpaperReceiver;Z)V
    .locals 0

    .line 1
    new-instance p1, Ljava/util/ArrayList;

    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapers:Ljava/util/List;

    invoke-direct {p1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {p2, p1}, Lcom/android/wallpaper/model/WallpaperReceiver;->onWallpapersReceived(Ljava/util/List;)V

    return-void
.end method

.method public getSingleWallpaper()Lcom/android/wallpaper/model/WallpaperInfo;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapers:Ljava/util/List;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    if-eqz v1, :cond_1

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapers:Ljava/util/List;

    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/wallpaper/model/WallpaperInfo;

    goto :goto_1

    :cond_1
    const/4 p0, 0x0

    :goto_1
    return-object p0
.end method

.method public getThumbnail(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapersLock:Ljava/lang/Object;

    monitor-enter v0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mThumbAsset:Lcom/android/wallpaper/asset/Asset;

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 3
    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapers:Ljava/util/List;

    iget v2, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mFeaturedThumbnailIndex:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-virtual {v1, p1}, Lcom/android/wallpaper/model/WallpaperInfo;->getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mThumbAsset:Lcom/android/wallpaper/asset/Asset;

    .line 4
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mThumbAsset:Lcom/android/wallpaper/asset/Asset;

    return-object p0

    :catchall_0
    move-exception p0

    .line 6
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public isEnumerable()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public isSingleWallpaperCategory()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapers:Ljava/util/List;

    const/4 v0, 0x1

    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public show(Landroid/app/Activity;Lcom/android/wallpaper/model/PickerIntentFactory;I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/model/Category;->mCollectionId:Ljava/lang/String;

    .line 2
    check-cast p2, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$IndividualPickerActivityIntentFactory;

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    new-instance p2, Landroid/content/Intent;

    const-class v0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;

    invoke-direct {p2, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v0, "com.android.wallpaper.category_collection_id"

    invoke-virtual {p2, v0, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    .line 4
    invoke-virtual {p1, p0, p3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method public supportsThirdParty()Z
    .locals 0

    instance-of p0, p0, Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory;

    return p0
.end method
