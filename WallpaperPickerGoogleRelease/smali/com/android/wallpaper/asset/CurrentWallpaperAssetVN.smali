.class public Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;
.super Lcom/android/wallpaper/asset/StreamableAsset;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN$CurrentWallpaperVNKey;
    }
.end annotation


# instance fields
.field public mWallpaperId:I

.field public mWallpaperManager:Landroid/app/WallpaperManager;

.field public mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

.field public mWallpaperManagerFlag:I


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/asset/StreamableAsset;-><init>()V

    .line 2
    invoke-static {p1}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;->mWallpaperManager:Landroid/app/WallpaperManager;

    .line 3
    invoke-static {p1}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->getInstance(Landroid/content/Context;)Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;->mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    .line 4
    iput p2, p0, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;->mWallpaperManagerFlag:I

    .line 5
    invoke-virtual {p1, p2}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->getWallpaperId(I)I

    move-result p1

    iput p1, p0, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;->mWallpaperId:I

    return-void
.end method


# virtual methods
.method public adjustCropRect(Landroid/content/Context;Landroid/graphics/Point;Landroid/graphics/Rect;)V
    .locals 0

    const/4 p0, 0x0

    .line 1
    invoke-virtual {p3, p0, p0}, Landroid/graphics/Rect;->offsetTo(II)V

    const/4 p0, 0x1

    .line 2
    invoke-static {p1, p3, p0}, Lcom/android/wallpaper/util/WallpaperCropUtils;->adjustCropRect(Landroid/content/Context;Landroid/graphics/Rect;Z)V

    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    check-cast p1, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;

    .line 3
    iget v0, p1, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;->mWallpaperManagerFlag:I

    iget v2, p0, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;->mWallpaperManagerFlag:I

    if-ne v0, v2, :cond_0

    iget p1, p1, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;->mWallpaperId:I

    iget p0, p0, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;->mWallpaperId:I

    if-ne p1, p0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public getLowResBitmap(Landroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    :try_start_0
    invoke-static {p1}, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object p1

    .line 2
    invoke-virtual {p1}, Lcom/bumptech/glide/RequestManager;->asBitmap()Lcom/bumptech/glide/RequestBuilder;

    move-result-object p1

    .line 3
    iput-object p0, p1, Lcom/bumptech/glide/RequestBuilder;->model:Ljava/lang/Object;

    const/4 p0, 0x1

    .line 4
    iput-boolean p0, p1, Lcom/bumptech/glide/RequestBuilder;->isModelSet:Z

    .line 5
    invoke-virtual {p1}, Lcom/bumptech/glide/RequestBuilder;->submit()Lcom/bumptech/glide/request/FutureTarget;

    move-result-object p0

    .line 6
    check-cast p0, Lcom/bumptech/glide/request/RequestFutureTarget;

    invoke-virtual {p0}, Lcom/bumptech/glide/request/RequestFutureTarget;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const-string p1, "CurrentWallpaperAssetVN"

    const-string v0, "Couldn\'t obtain low res bitmap"

    .line 7
    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p0, 0x0

    return-object p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;->mWallpaperManagerFlag:I

    const/16 v1, 0x20f

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    .line 2
    iget p0, p0, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;->mWallpaperId:I

    add-int/2addr v1, p0

    return v1
.end method

.method public loadDrawable(Landroid/content/Context;Landroid/widget/ImageView;I)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object p1

    .line 2
    invoke-virtual {p1}, Lcom/bumptech/glide/RequestManager;->asDrawable()Lcom/bumptech/glide/RequestBuilder;

    move-result-object p1

    .line 3
    iput-object p0, p1, Lcom/bumptech/glide/RequestBuilder;->model:Ljava/lang/Object;

    const/4 p0, 0x1

    .line 4
    iput-boolean p0, p1, Lcom/bumptech/glide/RequestBuilder;->isModelSet:Z

    .line 5
    invoke-static {}, Lcom/bumptech/glide/request/RequestOptions;->centerCropTransform()Lcom/bumptech/glide/request/RequestOptions;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    .line 6
    invoke-static {}, Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;->withCrossFade()Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/RequestBuilder;->transition(Lcom/bumptech/glide/TransitionOptions;)Lcom/bumptech/glide/RequestBuilder;

    .line 7
    invoke-virtual {p0, p2}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    return-void
.end method

.method public loadLowResDrawable(Landroid/app/Activity;Landroid/widget/ImageView;ILcom/bumptech/glide/load/resource/bitmap/BitmapTransformation;)V
    .locals 4

    .line 1
    new-instance v0, Lcom/bumptech/glide/load/MultiTransformation;

    const/4 v1, 0x2

    new-array v1, v1, [Lcom/bumptech/glide/load/Transformation;

    new-instance v2, Lcom/bumptech/glide/load/resource/bitmap/FitCenter;

    invoke-direct {v2}, Lcom/bumptech/glide/load/resource/bitmap/FitCenter;-><init>()V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object p4, v1, v2

    invoke-direct {v0, v1}, Lcom/bumptech/glide/load/MultiTransformation;-><init>([Lcom/bumptech/glide/load/Transformation;)V

    .line 2
    invoke-static {p1}, Lcom/bumptech/glide/Glide;->with(Landroid/app/Activity;)Lcom/bumptech/glide/RequestManager;

    move-result-object p1

    .line 3
    invoke-virtual {p1}, Lcom/bumptech/glide/RequestManager;->asDrawable()Lcom/bumptech/glide/RequestBuilder;

    move-result-object p1

    .line 4
    iput-object p0, p1, Lcom/bumptech/glide/RequestBuilder;->model:Ljava/lang/Object;

    .line 5
    iput-boolean v2, p1, Lcom/bumptech/glide/RequestBuilder;->isModelSet:Z

    .line 6
    invoke-static {v0}, Lcom/bumptech/glide/request/RequestOptions;->bitmapTransform(Lcom/bumptech/glide/load/Transformation;)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object p0

    new-instance p4, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {p4, p3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 7
    invoke-virtual {p0, p4}, Lcom/bumptech/glide/request/BaseRequestOptions;->placeholder(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p0

    .line 8
    invoke-virtual {p1, p0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    .line 9
    invoke-virtual {p0, p2}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    return-void
.end method

.method public openInputStream()Ljava/io/InputStream;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;->mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    iget v1, p0, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;->mWallpaperManagerFlag:I

    invoke-virtual {v0, v1}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->getWallpaperFile(I)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "ParcelFileDescriptor for wallpaper "

    .line 2
    invoke-static {v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget p0, p0, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;->mWallpaperManagerFlag:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " is null, unable to open InputStream."

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "CurrentWallpaperAssetVN"

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return-object p0

    .line 3
    :cond_0
    new-instance p0, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;

    invoke-direct {p0, v0}, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;-><init>(Landroid/os/ParcelFileDescriptor;)V

    return-object p0
.end method
