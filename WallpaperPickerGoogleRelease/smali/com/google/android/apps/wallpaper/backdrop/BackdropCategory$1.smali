.class public Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback<",
        "Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic val$context:Landroid/content/Context;

.field public final synthetic val$priority:I

.field public final synthetic val$receiver:Lcom/android/wallpaper/model/CategoryReceiver;


# direct methods
.method public constructor <init>(ILcom/android/wallpaper/model/CategoryReceiver;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$1;->val$priority:I

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$1;->val$receiver:Lcom/android/wallpaper/model/CategoryReceiver;

    iput-object p3, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/android/volley/VolleyError;)V
    .locals 2

    const-string v0, "BackdropCategory"

    const-string v1, "Unable to fetch Backdrop wallpaper categories"

    .line 1
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$1;->val$receiver:Lcom/android/wallpaper/model/CategoryReceiver;

    invoke-interface {p0}, Lcom/android/wallpaper/model/CategoryReceiver;->doneFetchingCategories()V

    return-void
.end method

.method public onSuccess(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;

    .line 2
    new-instance v1, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;

    iget v2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$1;->val$priority:I

    invoke-direct {v1, v0, v2}, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;-><init>(Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;I)V

    .line 3
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$1;->val$receiver:Lcom/android/wallpaper/model/CategoryReceiver;

    invoke-interface {v0, v1}, Lcom/android/wallpaper/model/CategoryReceiver;->onCategoryReceived(Lcom/android/wallpaper/model/Category;)V

    .line 4
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$1;->val$context:Landroid/content/Context;

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 5
    invoke-virtual {v1, v0, v2, v3}, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory;->fetchWallpapers(Landroid/content/Context;Lcom/android/wallpaper/model/WallpaperReceiver;Z)V

    goto :goto_0

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$1;->val$receiver:Lcom/android/wallpaper/model/CategoryReceiver;

    invoke-interface {p0}, Lcom/android/wallpaper/model/CategoryReceiver;->doneFetchingCategories()V

    return-void
.end method
