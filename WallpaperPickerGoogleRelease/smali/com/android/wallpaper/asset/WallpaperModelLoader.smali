.class public Lcom/android/wallpaper/asset/WallpaperModelLoader;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/model/ModelLoader;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/asset/WallpaperModelLoader$WallpaperFetcher;,
        Lcom/android/wallpaper/asset/WallpaperModelLoader$WallpaperModelLoaderFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/model/ModelLoader<",
        "Lcom/android/wallpaper/asset/WallpaperModel;",
        "Landroid/graphics/drawable/Drawable;",
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
    .locals 1

    .line 1
    check-cast p1, Lcom/android/wallpaper/asset/WallpaperModel;

    .line 2
    new-instance p0, Lcom/bumptech/glide/load/model/ModelLoader$LoadData;

    .line 3
    iget p4, p1, Lcom/android/wallpaper/asset/WallpaperModel;->mWallpaperSource:I

    if-eqz p4, :cond_0

    const-string p4, "Invalid wallpaper data source: "

    .line 4
    invoke-static {p4}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    iget v0, p1, Lcom/android/wallpaper/asset/WallpaperModel;->mWallpaperSource:I

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    const-string v0, "WallpaperModel"

    invoke-static {v0, p4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 5
    :cond_0
    new-instance p4, Lcom/bumptech/glide/signature/ObjectKey;

    invoke-direct {p4, p1}, Lcom/bumptech/glide/signature/ObjectKey;-><init>(Ljava/lang/Object;)V

    .line 6
    new-instance v0, Lcom/android/wallpaper/asset/WallpaperModelLoader$WallpaperFetcher;

    invoke-direct {v0, p1, p2, p3}, Lcom/android/wallpaper/asset/WallpaperModelLoader$WallpaperFetcher;-><init>(Lcom/android/wallpaper/asset/WallpaperModel;II)V

    invoke-direct {p0, p4, v0}, Lcom/bumptech/glide/load/model/ModelLoader$LoadData;-><init>(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/data/DataFetcher;)V

    return-object p0
.end method

.method public bridge synthetic handles(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/android/wallpaper/asset/WallpaperModel;

    const/4 p0, 0x1

    return p0
.end method
