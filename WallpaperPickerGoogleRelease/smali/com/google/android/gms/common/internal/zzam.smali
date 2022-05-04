.class public Lcom/google/android/gms/common/internal/zzam;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic $r8$classId:I

.field public zza:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public zzb:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 6

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/common/internal/zzam;->$r8$classId:I

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/common/internal/zzam;->zzb:Ljava/lang/Object;

    .line 8
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    .line 9
    new-instance v1, Lcom/android/volley/toolbox/BasicNetwork;

    new-instance v2, Lcom/android/volley/toolbox/HurlStack;

    invoke-direct {v2}, Lcom/android/volley/toolbox/HurlStack;-><init>()V

    invoke-direct {v1, v2}, Lcom/android/volley/toolbox/BasicNetwork;-><init>(Lcom/android/volley/toolbox/BaseHttpStack;)V

    .line 10
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    .line 11
    new-instance v2, Lcom/android/volley/toolbox/Volley$1;

    invoke-direct {v2, p1}, Lcom/android/volley/toolbox/Volley$1;-><init>(Landroid/content/Context;)V

    .line 12
    new-instance p1, Lcom/android/volley/RequestQueue;

    new-instance v3, Lcom/android/volley/toolbox/DiskBasedCache;

    invoke-direct {v3, v2}, Lcom/android/volley/toolbox/DiskBasedCache;-><init>(Lcom/android/volley/toolbox/DiskBasedCache$FileSupplier;)V

    invoke-direct {p1, v3, v1}, Lcom/android/volley/RequestQueue;-><init>(Lcom/android/volley/Cache;Lcom/android/volley/Network;)V

    .line 13
    iget-object v1, p1, Lcom/android/volley/RequestQueue;->mCacheDispatcher:Lcom/android/volley/CacheDispatcher;

    if-eqz v1, :cond_0

    .line 14
    iput-boolean v0, v1, Lcom/android/volley/CacheDispatcher;->mQuit:Z

    .line 15
    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 16
    :cond_0
    iget-object v1, p1, Lcom/android/volley/RequestQueue;->mDispatchers:[Lcom/android/volley/NetworkDispatcher;

    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_2

    aget-object v5, v1, v4

    if-eqz v5, :cond_1

    .line 17
    iput-boolean v0, v5, Lcom/android/volley/NetworkDispatcher;->mQuit:Z

    .line 18
    invoke-virtual {v5}, Ljava/lang/Thread;->interrupt()V

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 19
    :cond_2
    new-instance v0, Lcom/android/volley/CacheDispatcher;

    iget-object v1, p1, Lcom/android/volley/RequestQueue;->mCacheQueue:Ljava/util/concurrent/PriorityBlockingQueue;

    iget-object v2, p1, Lcom/android/volley/RequestQueue;->mNetworkQueue:Ljava/util/concurrent/PriorityBlockingQueue;

    iget-object v4, p1, Lcom/android/volley/RequestQueue;->mCache:Lcom/android/volley/Cache;

    iget-object v5, p1, Lcom/android/volley/RequestQueue;->mDelivery:Lcom/android/volley/ResponseDelivery;

    invoke-direct {v0, v1, v2, v4, v5}, Lcom/android/volley/CacheDispatcher;-><init>(Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/BlockingQueue;Lcom/android/volley/Cache;Lcom/android/volley/ResponseDelivery;)V

    iput-object v0, p1, Lcom/android/volley/RequestQueue;->mCacheDispatcher:Lcom/android/volley/CacheDispatcher;

    .line 20
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 21
    :goto_1
    iget-object v0, p1, Lcom/android/volley/RequestQueue;->mDispatchers:[Lcom/android/volley/NetworkDispatcher;

    array-length v0, v0

    if-ge v3, v0, :cond_3

    .line 22
    new-instance v0, Lcom/android/volley/NetworkDispatcher;

    iget-object v1, p1, Lcom/android/volley/RequestQueue;->mNetworkQueue:Ljava/util/concurrent/PriorityBlockingQueue;

    iget-object v2, p1, Lcom/android/volley/RequestQueue;->mNetwork:Lcom/android/volley/Network;

    iget-object v4, p1, Lcom/android/volley/RequestQueue;->mCache:Lcom/android/volley/Cache;

    iget-object v5, p1, Lcom/android/volley/RequestQueue;->mDelivery:Lcom/android/volley/ResponseDelivery;

    invoke-direct {v0, v1, v2, v4, v5}, Lcom/android/volley/NetworkDispatcher;-><init>(Ljava/util/concurrent/BlockingQueue;Lcom/android/volley/Network;Lcom/android/volley/Cache;Lcom/android/volley/ResponseDelivery;)V

    .line 23
    iget-object v1, p1, Lcom/android/volley/RequestQueue;->mDispatchers:[Lcom/android/volley/NetworkDispatcher;

    aput-object v0, v1, v3

    .line 24
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 25
    :cond_3
    iput-object p1, p0, Lcom/google/android/gms/common/internal/zzam;->zza:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/common/internal/zzam;->$r8$classId:I

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "null reference"

    .line 2
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3
    iput-object p1, p0, Lcom/google/android/gms/common/internal/zzam;->zzb:Ljava/lang/Object;

    .line 4
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/common/internal/zzam;->zza:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Landroidx/preference/R$layout;)V
    .locals 0

    const/4 p2, 0x0

    iput p2, p0, Lcom/google/android/gms/common/internal/zzam;->$r8$classId:I

    .line 5
    invoke-direct {p0, p1}, Lcom/google/android/gms/common/internal/zzam;-><init>(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public addToRequestQueue(Lcom/android/volley/Request;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/android/volley/Request<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/common/internal/zzam;->zza:Ljava/lang/Object;

    check-cast p0, Lcom/android/volley/RequestQueue;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    iput-object p0, p1, Lcom/android/volley/Request;->mRequestQueue:Lcom/android/volley/RequestQueue;

    .line 3
    iget-object v0, p0, Lcom/android/volley/RequestQueue;->mCurrentRequests:Ljava/util/Set;

    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/android/volley/RequestQueue;->mCurrentRequests:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 5
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    iget-object v0, p0, Lcom/android/volley/RequestQueue;->mSequenceGenerator:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    .line 7
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p1, Lcom/android/volley/Request;->mSequence:Ljava/lang/Integer;

    const-string v0, "add-to-queue"

    .line 8
    invoke-virtual {p1, v0}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, p1, v0}, Lcom/android/volley/RequestQueue;->sendRequestEvent(Lcom/android/volley/Request;I)V

    .line 10
    iget-boolean v0, p1, Lcom/android/volley/Request;->mShouldCache:Z

    if-nez v0, :cond_0

    .line 11
    iget-object p0, p0, Lcom/android/volley/RequestQueue;->mNetworkQueue:Ljava/util/concurrent/PriorityBlockingQueue;

    invoke-virtual {p0, p1}, Ljava/util/concurrent/PriorityBlockingQueue;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/android/volley/RequestQueue;->mCacheQueue:Ljava/util/concurrent/PriorityBlockingQueue;

    invoke-virtual {p0, p1}, Ljava/util/concurrent/PriorityBlockingQueue;->add(Ljava/lang/Object;)Z

    :goto_0
    return-void

    :catchall_0
    move-exception p0

    .line 13
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public loadImageBitmap(Landroid/net/Uri;Lcom/bumptech/glide/request/target/Target;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Lcom/bumptech/glide/request/target/Target<",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/common/internal/zzam;->zzb:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-static {p0}, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object p0

    .line 2
    invoke-virtual {p0}, Lcom/bumptech/glide/RequestManager;->asBitmap()Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    .line 3
    iput-object p1, p0, Lcom/bumptech/glide/RequestBuilder;->model:Ljava/lang/Object;

    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p0, Lcom/bumptech/glide/RequestBuilder;->isModelSet:Z

    .line 5
    invoke-static {}, Lcom/bumptech/glide/request/RequestOptions;->noTransformation()Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    sget-object v0, Lcom/bumptech/glide/load/model/stream/HttpGlideUrlLoader;->TIMEOUT:Lcom/bumptech/glide/load/Option;

    const/16 v1, 0x2710

    .line 6
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/RequestOptions;->option(Lcom/bumptech/glide/load/Option;Ljava/lang/Object;)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, p2, v0, p0}, Lcom/bumptech/glide/RequestBuilder;->into(Lcom/bumptech/glide/request/target/Target;Lcom/bumptech/glide/request/RequestListener;Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/request/target/Target;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 8
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Unable to get Bitmap for image with url: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "WallpaperRequester"

    invoke-static {p2, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public loadImageFile(Landroid/net/Uri;)Ljava/io/File;
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/common/internal/zzam;->zzb:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-static {p0}, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object p0

    .line 2
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    const-class v0, Ljava/io/File;

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/RequestManager;->as(Ljava/lang/Class;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    sget-object v0, Lcom/bumptech/glide/RequestManager;->DOWNLOAD_ONLY_OPTIONS:Lcom/bumptech/glide/request/RequestOptions;

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    .line 4
    iput-object p1, p0, Lcom/bumptech/glide/RequestBuilder;->model:Ljava/lang/Object;

    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/bumptech/glide/RequestBuilder;->isModelSet:Z

    .line 6
    sget-object v0, Lcom/bumptech/glide/load/model/stream/HttpGlideUrlLoader;->TIMEOUT:Lcom/bumptech/glide/load/Option;

    const/16 v1, 0x2710

    .line 7
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/RequestOptions;->option(Lcom/bumptech/glide/load/Option;Ljava/lang/Object;)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    .line 8
    invoke-virtual {p0}, Lcom/bumptech/glide/RequestBuilder;->submit()Lcom/bumptech/glide/request/FutureTarget;

    move-result-object p0

    .line 9
    check-cast p0, Lcom/bumptech/glide/request/RequestFutureTarget;

    invoke-virtual {p0}, Lcom/bumptech/glide/request/RequestFutureTarget;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 10
    :catch_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Unable to get File for image with url: "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "WallpaperRequester"

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    iget v0, p0, Lcom/google/android/gms/common/internal/zzam;->$r8$classId:I

    packed-switch v0, :pswitch_data_0

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 1
    :pswitch_0
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x64

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzam;->zzb:Ljava/lang/Object;

    .line 2
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 3
    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzam;->zza:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    .line 4
    iget-object v3, p0, Lcom/google/android/gms/common/internal/zzam;->zza:Ljava/lang/Object;

    check-cast v3, Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v1, -0x1

    if-ge v2, v3, :cond_0

    const-string v3, ", "

    .line 5
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/16 p0, 0x7d

    .line 6
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public zza(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzam;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzam;->zza:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "="

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method
