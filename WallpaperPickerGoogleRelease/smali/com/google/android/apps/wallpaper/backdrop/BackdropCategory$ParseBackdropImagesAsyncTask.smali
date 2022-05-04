.class public Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ParseBackdropImagesAsyncTask"
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
.field public final mAppContext:Landroid/content/Context;

.field public final mBackdropImages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;",
            ">;"
        }
    .end annotation
.end field

.field public final mCollectionId:Ljava/lang/String;

.field public final mWallpapers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;


# direct methods
.method public constructor <init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;Ljava/util/List;Landroid/content/Context;Ljava/util/List;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;",
            ">;",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;->mBackdropImages:Ljava/util/List;

    .line 3
    invoke-virtual {p3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;->mAppContext:Landroid/content/Context;

    .line 4
    iput-object p4, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;->mWallpapers:Ljava/util/List;

    .line 5
    iput-object p5, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;->mCollectionId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 14

    .line 1
    check-cast p1, [Ljava/lang/Void;

    .line 2
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;

    .line 3
    iget-object p1, p1, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapersLock:Ljava/lang/Object;

    .line 4
    monitor-enter p1

    .line 5
    :try_start_0
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;->mWallpapers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 6
    monitor-exit p1

    goto/16 :goto_2

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;->mBackdropImages:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;

    .line 8
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 9
    invoke-virtual {v1}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;->getAttributionList()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Attribution;

    .line 10
    invoke-virtual {v3}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Attribution;->getText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 11
    :cond_1
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_2

    .line 12
    iget-object v2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;

    .line 13
    iget-object v2, v2, Lcom/android/wallpaper/model/Category;->mTitle:Ljava/lang/String;

    .line 14
    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 15
    :cond_2
    iget-object v2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;

    .line 16
    iget-object v2, v2, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->mFifeImageUrlFactory:Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;

    .line 17
    iget-object v3, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;->mAppContext:Landroid/content/Context;

    .line 18
    invoke-virtual {v1}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;->getImageUrl()Ljava/lang/String;

    move-result-object v4

    .line 19
    invoke-virtual {v2, v3, v4}, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;->createFullSizedUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 20
    iget-object v2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;

    .line 21
    iget-object v2, v2, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->mFifeImageUrlFactory:Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;

    .line 22
    iget-object v3, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;->mAppContext:Landroid/content/Context;

    .line 23
    invoke-virtual {v1}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;->getImageUrl()Ljava/lang/String;

    move-result-object v5

    .line 24
    invoke-virtual {v2, v3, v5}, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;->createThumbUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    .line 25
    iget-object v2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;

    .line 26
    iget-object v2, v2, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->mFifeImageUrlFactory:Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;

    .line 27
    invoke-virtual {v1}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;->getImageUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;->createTinyUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    .line 28
    iget-object v2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;

    .line 29
    iget-object v2, v2, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->mFifeImageUrlFactory:Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;

    .line 30
    iget-object v3, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;->mAppContext:Landroid/content/Context;

    .line 31
    invoke-virtual {v1}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;->getImageUrl()Ljava/lang/String;

    move-result-object v7

    .line 32
    invoke-virtual {v2, v3, v7}, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;->createDesktopUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    .line 33
    new-instance v13, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;

    .line 34
    invoke-virtual {v1}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;->getImageUrl()Ljava/lang/String;

    move-result-object v3

    .line 35
    invoke-virtual {v1}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;->getActionUrl()Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;->mCollectionId:Ljava/lang/String;

    .line 36
    invoke-virtual {v1}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;->getAssetId()J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;->getType()Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;->getNumber()I

    move-result v12

    move-object v2, v13

    invoke-direct/range {v2 .. v12}, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 37
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;->mWallpapers:Ljava/util/List;

    invoke-interface {v1, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 38
    :cond_3
    monitor-exit p1

    :goto_2
    const/4 p0, 0x0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public onPostExecute(Ljava/lang/Object;)V
    .locals 3

    .line 1
    check-cast p1, Ljava/lang/Void;

    .line 2
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;

    .line 3
    iget-object p1, p1, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapersLock:Ljava/lang/Object;

    .line 4
    monitor-enter p1

    .line 5
    :try_start_0
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;

    .line 6
    iget-object v0, v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->mPendingWallpapersReceivers:Ljava/util/List;

    .line 7
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/wallpaper/model/WallpaperReceiver;

    if-eqz v1, :cond_0

    .line 8
    iget-object v2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;->mWallpapers:Ljava/util/List;

    invoke-interface {v1, v2}, Lcom/android/wallpaper/model/WallpaperReceiver;->onWallpapersReceived(Ljava/util/List;)V

    goto :goto_0

    .line 9
    :cond_1
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;

    .line 10
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->mPendingWallpapersReceivers:Ljava/util/List;

    .line 11
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 12
    monitor-exit p1

    return-void

    :catchall_0
    move-exception p0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
