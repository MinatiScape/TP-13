.class public Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->fetchWallpapers(Landroid/content/Context;Lcom/android/wallpaper/model/WallpaperReceiver;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback<",
        "Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;

.field public final synthetic val$collectionId:Ljava/lang/String;

.field public final synthetic val$context:Landroid/content/Context;

.field public final synthetic val$wallpapers:Ljava/util/List;


# direct methods
.method public constructor <init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;Landroid/content/Context;Ljava/util/List;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$2;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$2;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$2;->val$wallpapers:Ljava/util/List;

    iput-object p4, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$2;->val$collectionId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/android/volley/VolleyError;)V
    .locals 1

    const-string v0, "Unable to fetch Backdrop wallpapers for the collection ID: "

    .line 1
    invoke-static {v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$2;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/model/Category;->mCollectionId:Ljava/lang/String;

    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "BackdropCategory"

    .line 4
    invoke-static {v0, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public onSuccess(Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v6, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$2;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;

    iget-object v3, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$2;->val$context:Landroid/content/Context;

    iget-object v4, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$2;->val$wallpapers:Ljava/util/List;

    iget-object v5, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$2;->val$collectionId:Ljava/lang/String;

    move-object v0, v6

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$ParseBackdropImagesAsyncTask;-><init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;Ljava/util/List;Landroid/content/Context;Ljava/util/List;Ljava/lang/String;)V

    .line 2
    sget-object p0, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Void;

    invoke-virtual {v6, p0, p1}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method
