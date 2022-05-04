.class public Lcom/google/android/apps/wallpaper/asset/NetworkAsset;
.super Lcom/android/wallpaper/asset/StreamableAsset;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/apps/wallpaper/asset/NetworkAsset$DecodeDimensionsAsyncTask;
    }
.end annotation


# instance fields
.field public mRequester:Lcom/google/android/gms/common/internal/zzam;

.field public mTinyUri:Landroid/net/Uri;

.field public mUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/asset/StreamableAsset;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;->mUri:Landroid/net/Uri;

    const/4 p2, 0x0

    .line 3
    iput-object p2, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;->mTinyUri:Landroid/net/Uri;

    .line 4
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p2

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-interface {p2, p1}, Lcom/android/wallpaper/module/Injector;->getRequester(Landroid/content/Context;)Lcom/google/android/gms/common/internal/zzam;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;->mRequester:Lcom/google/android/gms/common/internal/zzam;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;Landroid/net/Uri;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Lcom/android/wallpaper/asset/StreamableAsset;-><init>()V

    .line 6
    iput-object p2, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;->mUri:Landroid/net/Uri;

    .line 7
    iput-object p3, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;->mTinyUri:Landroid/net/Uri;

    .line 8
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p2

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-interface {p2, p1}, Lcom/android/wallpaper/module/Injector;->getRequester(Landroid/content/Context;)Lcom/google/android/gms/common/internal/zzam;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;->mRequester:Lcom/google/android/gms/common/internal/zzam;

    return-void
.end method


# virtual methods
.method public decodeRawDimensions(Landroid/app/Activity;Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;)V
    .locals 4

    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 1
    invoke-super {p0, v0, p2}, Lcom/android/wallpaper/asset/StreamableAsset;->decodeRawDimensions(Landroid/app/Activity;Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;)V

    return-void

    .line 2
    :cond_0
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;->mRequester:Lcom/google/android/gms/common/internal/zzam;

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;->mUri:Landroid/net/Uri;

    new-instance v3, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$1;

    invoke-direct {v3, p0, p2}, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$1;-><init>(Lcom/google/android/apps/wallpaper/asset/NetworkAsset;Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;)V

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-static {p1}, Lcom/bumptech/glide/Glide;->with(Landroid/app/Activity;)Lcom/bumptech/glide/RequestManager;

    move-result-object p0

    .line 4
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    const-class p1, Ljava/io/File;

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/RequestManager;->as(Ljava/lang/Class;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    .line 6
    sget-object p1, Lcom/bumptech/glide/request/RequestOptions;->skipMemoryCacheTrueOptions:Lcom/bumptech/glide/request/RequestOptions;

    const/4 p2, 0x1

    if-nez p1, :cond_1

    .line 7
    new-instance p1, Lcom/bumptech/glide/request/RequestOptions;

    invoke-direct {p1}, Lcom/bumptech/glide/request/RequestOptions;-><init>()V

    invoke-virtual {p1, p2}, Lcom/bumptech/glide/request/BaseRequestOptions;->skipMemoryCache(Z)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/request/RequestOptions;

    invoke-virtual {p1}, Lcom/bumptech/glide/request/BaseRequestOptions;->autoClone()Lcom/bumptech/glide/request/BaseRequestOptions;

    sput-object p1, Lcom/bumptech/glide/request/RequestOptions;->skipMemoryCacheTrueOptions:Lcom/bumptech/glide/request/RequestOptions;

    .line 8
    :cond_1
    sget-object p1, Lcom/bumptech/glide/request/RequestOptions;->skipMemoryCacheTrueOptions:Lcom/bumptech/glide/request/RequestOptions;

    .line 9
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    .line 10
    iput-object v2, p0, Lcom/bumptech/glide/RequestBuilder;->model:Ljava/lang/Object;

    .line 11
    iput-boolean p2, p0, Lcom/bumptech/glide/RequestBuilder;->isModelSet:Z

    .line 12
    sget-object p1, Lcom/bumptech/glide/load/model/stream/HttpGlideUrlLoader;->TIMEOUT:Lcom/bumptech/glide/load/Option;

    const/16 p2, 0x2710

    .line 13
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/bumptech/glide/request/RequestOptions;->option(Lcom/bumptech/glide/load/Option;Ljava/lang/Object;)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    .line 14
    invoke-virtual {p0, v3, v0, p0}, Lcom/bumptech/glide/RequestBuilder;->into(Lcom/bumptech/glide/request/target/Target;Lcom/bumptech/glide/request/RequestListener;Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/request/target/Target;

    return-void
.end method

.method public getLowResBitmap(Landroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 2

    .line 1
    :try_start_0
    invoke-static {p1}, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object p1

    .line 2
    invoke-virtual {p1}, Lcom/bumptech/glide/RequestManager;->asBitmap()Lcom/bumptech/glide/RequestBuilder;

    move-result-object p1

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;->mTinyUri:Landroid/net/Uri;

    .line 3
    invoke-virtual {p1, p0}, Lcom/bumptech/glide/RequestBuilder;->load(Landroid/net/Uri;)Lcom/bumptech/glide/RequestBuilder;

    .line 4
    invoke-static {}, Lcom/bumptech/glide/request/RequestOptions;->noTransformation()Lcom/bumptech/glide/request/RequestOptions;

    move-result-object p0

    sget-object v0, Lcom/bumptech/glide/load/model/stream/HttpGlideUrlLoader;->TIMEOUT:Lcom/bumptech/glide/load/Option;

    const/16 v1, 0x2710

    .line 5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/bumptech/glide/request/BaseRequestOptions;->set(Lcom/bumptech/glide/load/Option;Ljava/lang/Object;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p0

    .line 6
    invoke-virtual {p1, p0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/bumptech/glide/RequestBuilder;->submit()Lcom/bumptech/glide/request/FutureTarget;

    move-result-object p0

    .line 8
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

    const-string p1, "NetworkAsset"

    const-string v0, "Couldn\'t obtain low res bitmap"

    .line 9
    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p0, 0x0

    return-object p0
.end method

.method public loadDrawable(Landroid/content/Context;Landroid/widget/ImageView;I)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object v0

    .line 2
    invoke-virtual {v0}, Lcom/bumptech/glide/RequestManager;->asDrawable()Lcom/bumptech/glide/RequestBuilder;

    move-result-object v0

    .line 3
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;->mTinyUri:Landroid/net/Uri;

    if-eqz v1, :cond_0

    .line 4
    invoke-static {p1}, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/bumptech/glide/RequestManager;->asDrawable()Lcom/bumptech/glide/RequestBuilder;

    move-result-object p1

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;->mTinyUri:Landroid/net/Uri;

    .line 6
    invoke-virtual {p1, v1}, Lcom/bumptech/glide/RequestBuilder;->load(Landroid/net/Uri;)Lcom/bumptech/glide/RequestBuilder;

    .line 7
    invoke-static {}, Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;->withCrossFade()Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/bumptech/glide/RequestBuilder;->transition(Lcom/bumptech/glide/TransitionOptions;)Lcom/bumptech/glide/RequestBuilder;

    .line 8
    iput-object p1, v0, Lcom/bumptech/glide/RequestBuilder;->thumbnailBuilder:Lcom/bumptech/glide/RequestBuilder;

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;->mUri:Landroid/net/Uri;

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/RequestBuilder;->load(Landroid/net/Uri;)Lcom/bumptech/glide/RequestBuilder;

    .line 10
    invoke-static {}, Lcom/bumptech/glide/request/RequestOptions;->noTransformation()Lcom/bumptech/glide/request/RequestOptions;

    move-result-object p0

    new-instance p1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {p1, p3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 11
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/request/BaseRequestOptions;->placeholder(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p0

    check-cast p0, Lcom/bumptech/glide/request/RequestOptions;

    sget-object p1, Lcom/bumptech/glide/load/model/stream/HttpGlideUrlLoader;->TIMEOUT:Lcom/bumptech/glide/load/Option;

    const/16 p3, 0x2710

    .line 12
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p0, p1, p3}, Lcom/bumptech/glide/request/BaseRequestOptions;->set(Lcom/bumptech/glide/load/Option;Ljava/lang/Object;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    .line 14
    invoke-static {}, Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;->withCrossFade()Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/RequestBuilder;->transition(Lcom/bumptech/glide/TransitionOptions;)Lcom/bumptech/glide/RequestBuilder;

    .line 15
    invoke-virtual {p0, p2}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    return-void
.end method

.method public loadDrawableWithTransition(Landroid/content/Context;Landroid/widget/ImageView;ILcom/android/wallpaper/asset/Asset$DrawableLoadedListener;I)V
    .locals 8

    .line 1
    invoke-virtual {p2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 2
    invoke-static {p1, p2, p5}, Lcom/android/wallpaper/asset/Asset;->getPlaceholderDrawable(Landroid/content/Context;Landroid/widget/ImageView;I)Landroid/graphics/drawable/Drawable;

    move-result-object p5

    invoke-virtual {p2, p5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 3
    :cond_1
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p5

    invoke-interface {p5, p1}, Lcom/android/wallpaper/module/Injector;->getRequester(Landroid/content/Context;)Lcom/google/android/gms/common/internal/zzam;

    move-result-object p5

    .line 4
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;->mUri:Landroid/net/Uri;

    new-instance v7, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$2;

    move-object v1, v7

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$2;-><init>(Lcom/google/android/apps/wallpaper/asset/NetworkAsset;Landroid/content/Context;Landroid/widget/ImageView;ILcom/android/wallpaper/asset/Asset$DrawableLoadedListener;)V

    invoke-virtual {p5, v0, v7}, Lcom/google/android/gms/common/internal/zzam;->loadImageBitmap(Landroid/net/Uri;Lcom/bumptech/glide/request/target/Target;)V

    return-void
.end method

.method public loadLowResDrawable(Landroid/app/Activity;Landroid/widget/ImageView;ILcom/bumptech/glide/load/resource/bitmap/BitmapTransformation;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/bumptech/glide/Glide;->with(Landroid/app/Activity;)Lcom/bumptech/glide/RequestManager;

    move-result-object p1

    .line 2
    invoke-virtual {p1}, Lcom/bumptech/glide/RequestManager;->asBitmap()Lcom/bumptech/glide/RequestBuilder;

    move-result-object p1

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;->mTinyUri:Landroid/net/Uri;

    .line 3
    invoke-virtual {p1, p0}, Lcom/bumptech/glide/RequestBuilder;->load(Landroid/net/Uri;)Lcom/bumptech/glide/RequestBuilder;

    .line 4
    invoke-static {p4}, Lcom/bumptech/glide/request/RequestOptions;->bitmapTransform(Lcom/bumptech/glide/load/Transformation;)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object p0

    new-instance p4, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {p4, p3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 5
    invoke-virtual {p0, p4}, Lcom/bumptech/glide/request/BaseRequestOptions;->placeholder(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p0

    check-cast p0, Lcom/bumptech/glide/request/RequestOptions;

    sget-object p3, Lcom/bumptech/glide/load/model/stream/HttpGlideUrlLoader;->TIMEOUT:Lcom/bumptech/glide/load/Option;

    const/16 p4, 0x2710

    .line 6
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    invoke-virtual {p0, p3, p4}, Lcom/bumptech/glide/request/BaseRequestOptions;->set(Lcom/bumptech/glide/load/Option;Ljava/lang/Object;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    .line 8
    new-instance p1, Lcom/bumptech/glide/load/resource/bitmap/BitmapTransitionOptions;

    invoke-direct {p1}, Lcom/bumptech/glide/load/resource/bitmap/BitmapTransitionOptions;-><init>()V

    .line 9
    new-instance p3, Lcom/bumptech/glide/request/transition/DrawableCrossFadeFactory;

    const/16 p4, 0x12c

    const/4 v0, 0x0

    invoke-direct {p3, p4, v0}, Lcom/bumptech/glide/request/transition/DrawableCrossFadeFactory;-><init>(IZ)V

    .line 10
    new-instance p4, Lcom/bumptech/glide/request/transition/BitmapTransitionFactory;

    invoke-direct {p4, p3}, Lcom/bumptech/glide/request/transition/BitmapTransitionFactory;-><init>(Lcom/bumptech/glide/request/transition/TransitionFactory;)V

    .line 11
    iput-object p4, p1, Lcom/bumptech/glide/TransitionOptions;->transitionFactory:Lcom/bumptech/glide/request/transition/TransitionFactory;

    .line 12
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/RequestBuilder;->transition(Lcom/bumptech/glide/TransitionOptions;)Lcom/bumptech/glide/RequestBuilder;

    .line 13
    invoke-virtual {p0, p2}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    return-void
.end method

.method public openInputStream()Ljava/io/InputStream;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;->mRequester:Lcom/google/android/gms/common/internal/zzam;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;->mUri:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/internal/zzam;->loadImageFile(Landroid/net/Uri;)Ljava/io/File;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 2
    :cond_0
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    :catch_0
    const-string v0, "File not found for the image at URL: "

    .line 3
    invoke-static {v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;->mUri:Landroid/net/Uri;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "NetworkAsset"

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1
.end method
