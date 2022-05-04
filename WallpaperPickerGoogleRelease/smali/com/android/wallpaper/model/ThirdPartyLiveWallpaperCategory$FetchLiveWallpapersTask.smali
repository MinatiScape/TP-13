.class public Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory$FetchLiveWallpapersTask;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FetchLiveWallpapersTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field public final mCategoryWallpapers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            ">;"
        }
    .end annotation
.end field

.field public final mContext:Landroid/content/Context;

.field public final mExcludedPackages:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final mReceiver:Lcom/android/wallpaper/model/WallpaperReceiver;

.field public final synthetic this$0:Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory;Landroid/content/Context;Ljava/util/List;Ljava/util/Set;Lcom/android/wallpaper/model/WallpaperReceiver;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/android/wallpaper/model/WallpaperReceiver;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory$FetchLiveWallpapersTask;->this$0:Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory$FetchLiveWallpapersTask;->mContext:Landroid/content/Context;

    .line 3
    iput-object p3, p0, Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory$FetchLiveWallpapersTask;->mCategoryWallpapers:Ljava/util/List;

    .line 4
    iput-object p4, p0, Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory$FetchLiveWallpapersTask;->mExcludedPackages:Ljava/util/Set;

    .line 5
    iput-object p5, p0, Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory$FetchLiveWallpapersTask;->mReceiver:Lcom/android/wallpaper/model/WallpaperReceiver;

    return-void
.end method


# virtual methods
.method public doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    check-cast p1, [Ljava/lang/Void;

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory$FetchLiveWallpapersTask;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory$FetchLiveWallpapersTask;->mExcludedPackages:Ljava/util/Set;

    invoke-static {p1, v0}, Lcom/android/wallpaper/model/LiveWallpaperInfo;->getAll(Landroid/content/Context;Ljava/util/Set;)Ljava/util/List;

    move-result-object p1

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory$FetchLiveWallpapersTask;->this$0:Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory;

    iget-object v0, v0, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapersLock:Ljava/lang/Object;

    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory$FetchLiveWallpapersTask;->mCategoryWallpapers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory$FetchLiveWallpapersTask;->mCategoryWallpapers:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 6
    monitor-exit v0

    const/4 p0, 0x0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public onPostExecute(Ljava/lang/Object;)V
    .locals 1

    .line 1
    check-cast p1, Ljava/lang/Void;

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory$FetchLiveWallpapersTask;->mReceiver:Lcom/android/wallpaper/model/WallpaperReceiver;

    new-instance v0, Ljava/util/ArrayList;

    iget-object p0, p0, Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory$FetchLiveWallpapersTask;->mCategoryWallpapers:Ljava/util/List;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {p1, v0}, Lcom/android/wallpaper/model/WallpaperReceiver;->onWallpapersReceived(Ljava/util/List;)V

    return-void
.end method
