.class public abstract Lcom/android/wallpaper/model/WallpaperInfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final sExecutor:Ljava/util/concurrent/ExecutorService;


# instance fields
.field public mPlaceholderColor:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/android/wallpaper/model/WallpaperInfo;->sExecutor:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/android/wallpaper/model/WallpaperInfo;->mPlaceholderColor:I

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 4
    iput v0, p0, Lcom/android/wallpaper/model/WallpaperInfo;->mPlaceholderColor:I

    .line 5
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/android/wallpaper/model/WallpaperInfo;->mPlaceholderColor:I

    return-void
.end method


# virtual methods
.method public computePlaceholderColor(Landroid/content/Context;)Ljava/util/concurrent/Future;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/concurrent/Future<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/android/wallpaper/model/WallpaperInfo;->mPlaceholderColor:I

    if-eqz v0, :cond_0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-static {p0}, Ljava/util/concurrent/CompletableFuture;->completedFuture(Ljava/lang/Object;)Ljava/util/concurrent/CompletableFuture;

    move-result-object p0

    return-object p0

    .line 3
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    .line 4
    sget-object v0, Lcom/android/wallpaper/model/WallpaperInfo;->sExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/android/wallpaper/model/WallpaperInfo$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/android/wallpaper/model/WallpaperInfo$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/model/WallpaperInfo;Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object p0

    return-object p0
.end method

.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getActionIconRes(Landroid/content/Context;)I
    .locals 0

    const p0, 0x7f0800ac

    return p0
.end method

.method public getActionLabelRes(Landroid/content/Context;)I
    .locals 0

    const p0, 0x7f110080

    return p0
.end method

.method public getActionUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public abstract getAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
.end method

.method public abstract getAttributions(Landroid/content/Context;)Ljava/util/List;
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
.end method

.method public getBackupPermission()I
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public getBaseImageUrl()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public abstract getCollectionId(Landroid/content/Context;)Ljava/lang/String;
.end method

.method public getDesktopAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/model/WallpaperInfo;->getAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object p0

    return-object p0
.end method

.method public abstract getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
.end method

.method public getTitle(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getUri()Landroid/net/Uri;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getWallpaperComponent()Landroid/app/WallpaperInfo;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getWallpaperId()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public abstract showPreview(Landroid/app/Activity;Lcom/android/wallpaper/model/InlinePreviewIntentFactory;I)V
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/wallpaper/model/WallpaperInfo;->mPlaceholderColor:I

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
