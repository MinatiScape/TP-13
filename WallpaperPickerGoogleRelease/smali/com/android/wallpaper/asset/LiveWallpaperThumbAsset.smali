.class public Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;
.super Lcom/android/wallpaper/asset/Asset;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset$LoadThumbnailTask;,
        Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset$LiveWallpaperThumbKey;
    }
.end annotation


# instance fields
.field public final mContext:Landroid/content/Context;

.field public final mInfo:Landroid/app/WallpaperInfo;

.field public mThumbnailDrawable:Landroid/graphics/drawable/Drawable;

.field public mUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/app/WallpaperInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/asset/Asset;-><init>()V

    .line 2
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;->mContext:Landroid/content/Context;

    .line 3
    iput-object p2, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;->mInfo:Landroid/app/WallpaperInfo;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/app/WallpaperInfo;Landroid/net/Uri;)V
    .locals 0

    .line 4
    invoke-direct {p0}, Lcom/android/wallpaper/asset/Asset;-><init>()V

    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;->mContext:Landroid/content/Context;

    .line 6
    iput-object p2, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;->mInfo:Landroid/app/WallpaperInfo;

    .line 7
    iput-object p3, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;->mUri:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public decodeBitmap(IILcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
    .locals 0

    .line 1
    new-instance p1, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset$LoadThumbnailTask;

    iget-object p2, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;->mContext:Landroid/content/Context;

    iget-object p0, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;->mInfo:Landroid/app/WallpaperInfo;

    invoke-direct {p1, p2, p0, p3}, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset$LoadThumbnailTask;-><init>(Landroid/content/Context;Landroid/app/WallpaperInfo;Lcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    .line 2
    sget-object p0, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 p2, 0x0

    new-array p2, p2, [Ljava/lang/Void;

    invoke-virtual {p1, p0, p2}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public decodeBitmapRegion(Landroid/graphics/Rect;IIZLcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
    .locals 0

    const/4 p0, 0x0

    .line 1
    invoke-interface {p5, p0}, Lcom/android/wallpaper/asset/Asset$BitmapReceiver;->onBitmapDecoded(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public decodeRawDimensions(Landroid/app/Activity;Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;)V
    .locals 0

    const/4 p0, 0x0

    .line 1
    invoke-interface {p2, p0}, Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;->onDimensionsDecoded(Landroid/graphics/Point;)V

    return-void
.end method

.method public getLowResBitmap(Landroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 5

    const/4 v0, 0x0

    .line 1
    :try_start_0
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
    invoke-virtual {p1}, Lcom/bumptech/glide/RequestBuilder;->submit()Lcom/bumptech/glide/request/FutureTarget;

    move-result-object p0

    const-wide/16 v1, 0x2

    sget-object p1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 6
    check-cast p0, Lcom/bumptech/glide/request/RequestFutureTarget;

    invoke-virtual {p0, v1, v2, p1}, Lcom/bumptech/glide/request/RequestFutureTarget;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/graphics/drawable/Drawable;

    .line 7
    instance-of p1, p0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz p1, :cond_0

    .line 8
    move-object p1, p0

    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    .line 9
    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p1

    if-eqz p1, :cond_0

    return-object p1

    .line 10
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    if-lez p1, :cond_2

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p1

    if-gtz p1, :cond_1

    goto :goto_0

    .line 11
    :cond_1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    .line 12
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    .line 13
    invoke-static {p1, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 14
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 15
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v2

    invoke-virtual {v1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {p0, v4, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 16
    invoke-virtual {p0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :cond_2
    :goto_0
    return-object v0

    :catch_0
    move-exception p0

    const-string p1, "LiveWallpaperThumbAsset"

    const-string v1, "Couldn\'t obtain low res bitmap"

    .line 17
    invoke-static {p1, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v0
.end method

.method public getThumbnailDrawable()Landroid/graphics/drawable/Drawable;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;->mThumbnailDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    return-object v0

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;->mUri:Landroid/net/Uri;

    if-eqz v0, :cond_2

    .line 3
    :try_start_0
    iget-object v0, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;->mContext:Landroid/content/Context;

    .line 4
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;->mUri:Landroid/net/Uri;

    const-string v2, "r"

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->openAssetFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_1

    .line 5
    :try_start_1
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v2, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 6
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->createInputStream()Ljava/io/FileInputStream;

    move-result-object v3

    invoke-static {v3}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    iput-object v1, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;->mThumbnailDrawable:Landroid/graphics/drawable/Drawable;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 7
    :try_start_2
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    return-object v1

    :catchall_0
    move-exception v1

    .line 8
    :try_start_3
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v0

    :try_start_4
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw v1

    :cond_1
    if-eqz v0, :cond_2

    .line 9
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_1

    :catch_0
    const-string v0, "LiveWallpaperThumbAsset"

    const-string v1, "Not found thumbnail from URI."

    .line 10
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;->mInfo:Landroid/app/WallpaperInfo;

    iget-object v1, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/WallpaperInfo;->loadThumbnail(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;->mThumbnailDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public loadDrawable(Landroid/content/Context;Landroid/widget/ImageView;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;->mUri:Landroid/net/Uri;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 2
    invoke-static {}, Lcom/bumptech/glide/request/RequestOptions;->centerCropTransform()Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    sget-object v2, Lcom/bumptech/glide/load/engine/DiskCacheStrategy;->NONE:Lcom/bumptech/glide/load/engine/DiskCacheStrategy;

    .line 3
    invoke-static {v2}, Lcom/bumptech/glide/request/RequestOptions;->diskCacheStrategyOf(Lcom/bumptech/glide/load/engine/DiskCacheStrategy;)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v2

    .line 4
    invoke-virtual {v2, v1}, Lcom/bumptech/glide/request/BaseRequestOptions;->skipMemoryCache(Z)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object v2

    .line 5
    invoke-virtual {v0, v2}, Lcom/bumptech/glide/request/BaseRequestOptions;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/request/RequestOptions;

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v2, p3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 6
    invoke-virtual {v0, v2}, Lcom/bumptech/glide/request/BaseRequestOptions;->placeholder(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p3

    check-cast p3, Lcom/bumptech/glide/request/RequestOptions;

    goto :goto_0

    .line 7
    :cond_0
    invoke-static {}, Lcom/bumptech/glide/request/RequestOptions;->centerCropTransform()Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v2, p3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 8
    invoke-virtual {v0, v2}, Lcom/bumptech/glide/request/BaseRequestOptions;->placeholder(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p3

    check-cast p3, Lcom/bumptech/glide/request/RequestOptions;

    .line 9
    :goto_0
    invoke-static {p1}, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object p1

    .line 10
    invoke-virtual {p1}, Lcom/bumptech/glide/RequestManager;->asDrawable()Lcom/bumptech/glide/RequestBuilder;

    move-result-object p1

    .line 11
    iput-object p0, p1, Lcom/bumptech/glide/RequestBuilder;->model:Ljava/lang/Object;

    .line 12
    iput-boolean v1, p1, Lcom/bumptech/glide/RequestBuilder;->isModelSet:Z

    .line 13
    invoke-virtual {p1, p3}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    .line 14
    invoke-static {}, Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;->withCrossFade()Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/RequestBuilder;->transition(Lcom/bumptech/glide/TransitionOptions;)Lcom/bumptech/glide/RequestBuilder;

    .line 15
    invoke-virtual {p0, p2}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    return-void
.end method

.method public loadLowResDrawable(Landroid/app/Activity;Landroid/widget/ImageView;ILcom/bumptech/glide/load/resource/bitmap/BitmapTransformation;)V
    .locals 5

    const/4 v0, 0x1

    if-nez p4, :cond_0

    .line 1
    new-instance p4, Lcom/bumptech/glide/load/resource/bitmap/FitCenter;

    invoke-direct {p4}, Lcom/bumptech/glide/load/resource/bitmap/FitCenter;-><init>()V

    goto :goto_0

    .line 2
    :cond_0
    new-instance v1, Lcom/bumptech/glide/load/MultiTransformation;

    const/4 v2, 0x2

    new-array v2, v2, [Lcom/bumptech/glide/load/Transformation;

    const/4 v3, 0x0

    new-instance v4, Lcom/bumptech/glide/load/resource/bitmap/FitCenter;

    invoke-direct {v4}, Lcom/bumptech/glide/load/resource/bitmap/FitCenter;-><init>()V

    aput-object v4, v2, v3

    aput-object p4, v2, v0

    invoke-direct {v1, v2}, Lcom/bumptech/glide/load/MultiTransformation;-><init>([Lcom/bumptech/glide/load/Transformation;)V

    move-object p4, v1

    .line 3
    :goto_0
    invoke-static {p1}, Lcom/bumptech/glide/Glide;->with(Landroid/app/Activity;)Lcom/bumptech/glide/RequestManager;

    move-result-object p1

    .line 4
    invoke-virtual {p1}, Lcom/bumptech/glide/RequestManager;->asDrawable()Lcom/bumptech/glide/RequestBuilder;

    move-result-object p1

    .line 5
    iput-object p0, p1, Lcom/bumptech/glide/RequestBuilder;->model:Ljava/lang/Object;

    .line 6
    iput-boolean v0, p1, Lcom/bumptech/glide/RequestBuilder;->isModelSet:Z

    .line 7
    invoke-static {p4}, Lcom/bumptech/glide/request/RequestOptions;->bitmapTransform(Lcom/bumptech/glide/load/Transformation;)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object p0

    new-instance p4, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {p4, p3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 8
    invoke-virtual {p0, p4}, Lcom/bumptech/glide/request/BaseRequestOptions;->placeholder(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    .line 10
    invoke-virtual {p0, p2}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    return-void
.end method
