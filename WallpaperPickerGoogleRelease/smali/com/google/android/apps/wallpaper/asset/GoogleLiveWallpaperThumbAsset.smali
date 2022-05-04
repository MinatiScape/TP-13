.class public Lcom/google/android/apps/wallpaper/asset/GoogleLiveWallpaperThumbAsset;
.super Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/apps/wallpaper/asset/GoogleLiveWallpaperThumbAsset$LoadThumbnailTask;
    }
.end annotation


# instance fields
.field public mLayerResolver:Lcom/android/wallpaper/module/DrawableLayerResolver;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/app/WallpaperInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;-><init>(Landroid/content/Context;Landroid/app/WallpaperInfo;)V

    .line 2
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/wallpaper/module/Injector;->getDrawableLayerResolver()Lcom/android/wallpaper/module/DrawableLayerResolver;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/asset/GoogleLiveWallpaperThumbAsset;->mLayerResolver:Lcom/android/wallpaper/module/DrawableLayerResolver;

    return-void
.end method


# virtual methods
.method public decodeBitmap(IILcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
    .locals 1

    .line 1
    new-instance p1, Lcom/google/android/apps/wallpaper/asset/GoogleLiveWallpaperThumbAsset$LoadThumbnailTask;

    iget-object p2, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;->mInfo:Landroid/app/WallpaperInfo;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/asset/GoogleLiveWallpaperThumbAsset;->mLayerResolver:Lcom/android/wallpaper/module/DrawableLayerResolver;

    invoke-direct {p1, p2, v0, p0, p3}, Lcom/google/android/apps/wallpaper/asset/GoogleLiveWallpaperThumbAsset$LoadThumbnailTask;-><init>(Landroid/content/Context;Landroid/app/WallpaperInfo;Lcom/android/wallpaper/module/DrawableLayerResolver;Lcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    .line 2
    sget-object p0, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 p2, 0x0

    new-array p2, p2, [Ljava/lang/Void;

    invoke-virtual {p1, p0, p2}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public getThumbnailDrawable()Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;->mInfo:Landroid/app/WallpaperInfo;

    iget-object v1, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/WallpaperInfo;->loadThumbnail(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 2
    instance-of v1, v0, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v1, :cond_0

    .line 3
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/asset/GoogleLiveWallpaperThumbAsset;->mLayerResolver:Lcom/android/wallpaper/module/DrawableLayerResolver;

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    check-cast p0, Lcom/android/wallpaper/module/DeviceColorLayerResolver;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    sget p0, Lcom/android/wallpaper/module/DeviceColorLayerResolver;->LAYER_INDEX:I

    .line 5
    invoke-virtual {v0}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {p0, v1}, Ljava/lang/Math;->min(II)I

    move-result p0

    .line 6
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public loadDrawable(Landroid/content/Context;Landroid/widget/ImageView;I)V
    .locals 1

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

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 6
    invoke-virtual {p0, v0}, Lcom/bumptech/glide/request/BaseRequestOptions;->placeholder(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    .line 8
    invoke-static {}, Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;->withCrossFade()Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/RequestBuilder;->transition(Lcom/bumptech/glide/TransitionOptions;)Lcom/bumptech/glide/RequestBuilder;

    .line 9
    invoke-virtual {p0, p2}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    return-void
.end method
