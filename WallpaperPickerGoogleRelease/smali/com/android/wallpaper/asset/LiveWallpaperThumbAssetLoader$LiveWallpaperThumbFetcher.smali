.class public Lcom/android/wallpaper/asset/LiveWallpaperThumbAssetLoader$LiveWallpaperThumbFetcher;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/data/DataFetcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/asset/LiveWallpaperThumbAssetLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LiveWallpaperThumbFetcher"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/data/DataFetcher<",
        "Landroid/graphics/drawable/Drawable;",
        ">;"
    }
.end annotation


# instance fields
.field public mLiveWallpaperThumbAsset:Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAssetLoader$LiveWallpaperThumbFetcher;->mLiveWallpaperThumbAsset:Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;

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
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Landroid/graphics/drawable/Drawable;

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
            "Landroid/graphics/drawable/Drawable;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAssetLoader$LiveWallpaperThumbFetcher;->mLiveWallpaperThumbAsset:Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;

    invoke-virtual {p0}, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;->getThumbnailDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-interface {p2, p0}, Lcom/bumptech/glide/load/data/DataFetcher$DataCallback;->onDataReady(Ljava/lang/Object;)V

    return-void
.end method
