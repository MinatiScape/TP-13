.class public Lcom/android/wallpaper/asset/CurrentWallpaperAssetVNLoader$CurrentWallpaperAssetVNDataFetcher;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/data/DataFetcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/asset/CurrentWallpaperAssetVNLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CurrentWallpaperAssetVNDataFetcher"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/data/DataFetcher<",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# instance fields
.field public mAsset:Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVNLoader$CurrentWallpaperAssetVNDataFetcher;->mAsset:Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 0

    return-void
.end method

.method public cleanup()V
    .locals 0

    return-void
.end method

.method public getDataClass()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Ljava/io/InputStream;

    return-object p0
.end method

.method public getDataSource()Lcom/bumptech/glide/load/DataSource;
    .locals 0

    .line 1
    sget-object p0, Lcom/bumptech/glide/load/DataSource;->LOCAL:Lcom/bumptech/glide/load/DataSource;

    return-object p0
.end method

.method public loadData(Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/data/DataFetcher$DataCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/Priority;",
            "Lcom/bumptech/glide/load/data/DataFetcher$DataCallback<",
            "-",
            "Ljava/io/InputStream;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVNLoader$CurrentWallpaperAssetVNDataFetcher;->mAsset:Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;->mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    iget p0, p0, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;->mWallpaperManagerFlag:I

    invoke-virtual {p1, p0}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->getWallpaperFile(I)Landroid/os/ParcelFileDescriptor;

    move-result-object p0

    if-nez p0, :cond_0

    .line 3
    new-instance p0, Ljava/lang/Exception;

    const-string p1, "ParcelFileDescriptor for wallpaper is null, unable to open InputStream."

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, p0}, Lcom/bumptech/glide/load/data/DataFetcher$DataCallback;->onLoadFailed(Ljava/lang/Exception;)V

    return-void

    .line 4
    :cond_0
    new-instance p1, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;

    invoke-direct {p1, p0}, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;-><init>(Landroid/os/ParcelFileDescriptor;)V

    invoke-interface {p2, p1}, Lcom/bumptech/glide/load/data/DataFetcher$DataCallback;->onDataReady(Ljava/lang/Object;)V

    return-void
.end method
