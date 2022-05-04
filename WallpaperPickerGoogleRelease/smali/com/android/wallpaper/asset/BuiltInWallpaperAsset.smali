.class public final Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;
.super Lcom/android/wallpaper/asset/Asset;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x13
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeDimensionsAsyncTask;,
        Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapRegionAsyncTask;,
        Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapAsyncTask;
    }
.end annotation


# instance fields
.field public mBuiltInWallpaperModel:Lcom/android/wallpaper/asset/WallpaperModel;

.field public final mContext:Landroid/content/Context;

.field public mDimensions:Landroid/graphics/Point;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/asset/Asset;-><init>()V

    .line 2
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;->mContext:Landroid/content/Context;

    return-void
.end method

.method public static access$100(Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;)Landroid/graphics/Point;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;->mDimensions:Landroid/graphics/Point;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/WallpaperManager;->getBuiltInDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 3
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 4
    new-instance v1, Landroid/graphics/Point;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    invoke-direct {v1, v2, v0}, Landroid/graphics/Point;-><init>(II)V

    iput-object v1, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;->mDimensions:Landroid/graphics/Point;

    move-object v0, v1

    :goto_0
    return-object v0
.end method


# virtual methods
.method public decodeBitmap(IILcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapAsyncTask;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapAsyncTask;-><init>(Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;IILcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    .line 2
    sget-object p0, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Void;

    invoke-virtual {v0, p0, p1}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public decodeBitmapRegion(Landroid/graphics/Rect;IIZLcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
    .locals 0

    .line 1
    new-instance p2, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapRegionAsyncTask;

    invoke-direct {p2, p0, p1, p5}, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapRegionAsyncTask;-><init>(Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;Landroid/graphics/Rect;Lcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    .line 2
    sget-object p0, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Void;

    invoke-virtual {p2, p0, p1}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public decodeRawDimensions(Landroid/app/Activity;Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;)V
    .locals 0

    .line 1
    new-instance p1, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeDimensionsAsyncTask;

    invoke-direct {p1, p0, p2}, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeDimensionsAsyncTask;-><init>(Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;)V

    .line 2
    sget-object p0, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 p2, 0x0

    new-array p2, p2, [Ljava/lang/Void;

    invoke-virtual {p1, p0, p2}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public loadDrawable(Landroid/content/Context;Landroid/widget/ImageView;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;->mBuiltInWallpaperModel:Lcom/android/wallpaper/asset/WallpaperModel;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/android/wallpaper/asset/WallpaperModel;

    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/android/wallpaper/asset/WallpaperModel;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;->mBuiltInWallpaperModel:Lcom/android/wallpaper/asset/WallpaperModel;

    .line 4
    :cond_0
    invoke-static {p1}, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/bumptech/glide/RequestManager;->asDrawable()Lcom/bumptech/glide/RequestBuilder;

    move-result-object p1

    iget-object p0, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;->mBuiltInWallpaperModel:Lcom/android/wallpaper/asset/WallpaperModel;

    .line 6
    invoke-virtual {p1, p0}, Lcom/bumptech/glide/RequestBuilder;->load(Ljava/lang/Object;)Lcom/bumptech/glide/RequestBuilder;

    .line 7
    invoke-static {}, Lcom/bumptech/glide/request/RequestOptions;->centerCropTransform()Lcom/bumptech/glide/request/RequestOptions;

    move-result-object p0

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 8
    invoke-virtual {p0, v0}, Lcom/bumptech/glide/request/BaseRequestOptions;->placeholder(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    .line 10
    invoke-static {}, Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;->withCrossFade()Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/RequestBuilder;->transition(Lcom/bumptech/glide/TransitionOptions;)Lcom/bumptech/glide/RequestBuilder;

    .line 11
    invoke-virtual {p0, p2}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    return-void
.end method
