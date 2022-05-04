.class public Lcom/android/wallpaper/asset/CurrentWallpaperAssetVNLoader;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/model/ModelLoader;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/asset/CurrentWallpaperAssetVNLoader$CurrentWallpaperAssetVNDataFetcher;,
        Lcom/android/wallpaper/asset/CurrentWallpaperAssetVNLoader$CurrentWallpaperAssetVNLoaderFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/model/ModelLoader<",
        "Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public buildLoadData(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;
    .locals 0

    .line 1
    check-cast p1, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;

    .line 2
    new-instance p0, Lcom/bumptech/glide/load/model/ModelLoader$LoadData;

    .line 3
    new-instance p2, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN$CurrentWallpaperVNKey;

    iget-object p3, p1, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;->mWallpaperManager:Landroid/app/WallpaperManager;

    iget p4, p1, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;->mWallpaperManagerFlag:I

    invoke-direct {p2, p3, p4}, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN$CurrentWallpaperVNKey;-><init>(Landroid/app/WallpaperManager;I)V

    .line 4
    new-instance p3, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVNLoader$CurrentWallpaperAssetVNDataFetcher;

    invoke-direct {p3, p1}, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVNLoader$CurrentWallpaperAssetVNDataFetcher;-><init>(Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;)V

    invoke-direct {p0, p2, p3}, Lcom/bumptech/glide/load/model/ModelLoader$LoadData;-><init>(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/data/DataFetcher;)V

    return-object p0
.end method

.method public bridge synthetic handles(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;

    const/4 p0, 0x1

    return p0
.end method
