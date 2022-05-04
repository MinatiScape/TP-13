.class public Lcom/android/wallpaper/asset/WallpaperModelLoader$WallpaperFetcher;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/data/DataFetcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/asset/WallpaperModelLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WallpaperFetcher"
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
.field public mHeight:I

.field public mWallpaperModel:Lcom/android/wallpaper/asset/WallpaperModel;

.field public mWidth:I


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/asset/WallpaperModel;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/asset/WallpaperModelLoader$WallpaperFetcher;->mWallpaperModel:Lcom/android/wallpaper/asset/WallpaperModel;

    .line 3
    iput p2, p0, Lcom/android/wallpaper/asset/WallpaperModelLoader$WallpaperFetcher;->mWidth:I

    .line 4
    iput p3, p0, Lcom/android/wallpaper/asset/WallpaperModelLoader$WallpaperFetcher;->mHeight:I

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
    .locals 6
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
    iget-object p1, p0, Lcom/android/wallpaper/asset/WallpaperModelLoader$WallpaperFetcher;->mWallpaperModel:Lcom/android/wallpaper/asset/WallpaperModel;

    iget v1, p0, Lcom/android/wallpaper/asset/WallpaperModelLoader$WallpaperFetcher;->mWidth:I

    iget v2, p0, Lcom/android/wallpaper/asset/WallpaperModelLoader$WallpaperFetcher;->mHeight:I

    .line 2
    iget p0, p1, Lcom/android/wallpaper/asset/WallpaperModel;->mWallpaperSource:I

    if-eqz p0, :cond_0

    const-string p0, "Invalid wallpaper data source: "

    .line 3
    invoke-static {p0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    iget p1, p1, Lcom/android/wallpaper/asset/WallpaperModel;->mWallpaperSource:I

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "WallpaperModel"

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p1, Lcom/android/wallpaper/asset/WallpaperModel;->mWallpaperManager:Landroid/app/WallpaperManager;

    const/4 v3, 0x1

    const/high16 v4, 0x3f000000    # 0.5f

    const/high16 v5, 0x3f000000    # 0.5f

    invoke-virtual/range {v0 .. v5}, Landroid/app/WallpaperManager;->getBuiltInDrawable(IIZFF)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    .line 5
    :goto_0
    invoke-interface {p2, p0}, Lcom/bumptech/glide/load/data/DataFetcher$DataCallback;->onDataReady(Ljava/lang/Object;)V

    return-void
.end method
