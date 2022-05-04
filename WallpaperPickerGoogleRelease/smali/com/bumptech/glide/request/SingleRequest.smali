.class public final Lcom/bumptech/glide/request/SingleRequest;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/request/Request;
.implements Lcom/bumptech/glide/request/target/SizeReadyCallback;
.implements Lcom/bumptech/glide/request/ResourceCallback;
.implements Lcom/bumptech/glide/util/pool/FactoryPools$Poolable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/request/Request;",
        "Lcom/bumptech/glide/request/target/SizeReadyCallback;",
        "Lcom/bumptech/glide/request/ResourceCallback;",
        "Lcom/bumptech/glide/util/pool/FactoryPools$Poolable;"
    }
.end annotation


# static fields
.field public static final IS_VERBOSE_LOGGABLE:Z

.field public static final POOL:Landroidx/core/util/Pools$Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Pools$Pool<",
            "Lcom/bumptech/glide/request/SingleRequest<",
            "*>;>;"
        }
    .end annotation
.end field


# instance fields
.field public animationFactory:Lcom/bumptech/glide/request/transition/TransitionFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/request/transition/TransitionFactory<",
            "-TR;>;"
        }
    .end annotation
.end field

.field public context:Landroid/content/Context;

.field public engine:Lcom/bumptech/glide/load/engine/Engine;

.field public errorDrawable:Landroid/graphics/drawable/Drawable;

.field public fallbackDrawable:Landroid/graphics/drawable/Drawable;

.field public glideContext:Lcom/bumptech/glide/GlideContext;

.field public height:I

.field public isCallingCallbacks:Z

.field public loadStatus:Lcom/bumptech/glide/load/engine/Engine$LoadStatus;

.field public model:Ljava/lang/Object;

.field public overrideHeight:I

.field public overrideWidth:I

.field public placeholderDrawable:Landroid/graphics/drawable/Drawable;

.field public priority:Lcom/bumptech/glide/Priority;

.field public requestCoordinator:Lcom/bumptech/glide/request/RequestCoordinator;

.field public requestListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/request/RequestListener<",
            "TR;>;>;"
        }
    .end annotation
.end field

.field public requestOptions:Lcom/bumptech/glide/request/BaseRequestOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/request/BaseRequestOptions<",
            "*>;"
        }
    .end annotation
.end field

.field public resource:Lcom/bumptech/glide/load/engine/Resource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/Resource<",
            "TR;>;"
        }
    .end annotation
.end field

.field public startTime:J

.field public final stateVerifier:Lcom/bumptech/glide/util/pool/StateVerifier;

.field public status:I

.field public final tag:Ljava/lang/String;

.field public target:Lcom/bumptech/glide/request/target/Target;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/request/target/Target<",
            "TR;>;"
        }
    .end annotation
.end field

.field public targetListener:Lcom/bumptech/glide/request/RequestListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/request/RequestListener<",
            "TR;>;"
        }
    .end annotation
.end field

.field public transcodeClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "TR;>;"
        }
    .end annotation
.end field

.field public width:I


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/bumptech/glide/request/SingleRequest$1;

    invoke-direct {v0}, Lcom/bumptech/glide/request/SingleRequest$1;-><init>()V

    const/16 v1, 0x96

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/pool/FactoryPools;->simple(ILcom/bumptech/glide/util/pool/FactoryPools$Factory;)Landroidx/core/util/Pools$Pool;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/request/SingleRequest;->POOL:Landroidx/core/util/Pools$Pool;

    const-string v0, "Request"

    const/4 v1, 0x2

    .line 2
    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Lcom/bumptech/glide/request/SingleRequest;->IS_VERBOSE_LOGGABLE:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    sget-boolean v0, Lcom/bumptech/glide/request/SingleRequest;->IS_VERBOSE_LOGGABLE:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->tag:Ljava/lang/String;

    .line 3
    new-instance v0, Lcom/bumptech/glide/util/pool/StateVerifier$DefaultStateVerifier;

    invoke-direct {v0}, Lcom/bumptech/glide/util/pool/StateVerifier$DefaultStateVerifier;-><init>()V

    .line 4
    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->stateVerifier:Lcom/bumptech/glide/util/pool/StateVerifier;

    return-void
.end method


# virtual methods
.method public final assertNotCallingCallbacks()V
    .locals 1

    .line 1
    iget-boolean p0, p0, Lcom/bumptech/glide/request/SingleRequest;->isCallingCallbacks:Z

    if-nez p0, :cond_0

    return-void

    .line 2
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "You can\'t start or clear loads in RequestListener or Target callbacks. If you\'re trying to start a fallback request when a load fails, use RequestBuilder#error(RequestBuilder). Otherwise consider posting your into() or clear() calls to the main thread using a Handler instead."

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public begin()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/bumptech/glide/request/SingleRequest;->assertNotCallingCallbacks()V

    .line 2
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->stateVerifier:Lcom/bumptech/glide/util/pool/StateVerifier;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/pool/StateVerifier;->throwIfRecycled()V

    .line 3
    sget v0, Lcom/bumptech/glide/util/LogTime;->$r8$clinit:I

    .line 4
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtimeNanos()J

    move-result-wide v0

    .line 5
    iput-wide v0, p0, Lcom/bumptech/glide/request/SingleRequest;->startTime:J

    .line 6
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->model:Ljava/lang/Object;

    const/4 v1, 0x3

    if-nez v0, :cond_2

    .line 7
    iget v0, p0, Lcom/bumptech/glide/request/SingleRequest;->overrideWidth:I

    iget v2, p0, Lcom/bumptech/glide/request/SingleRequest;->overrideHeight:I

    invoke-static {v0, v2}, Lcom/bumptech/glide/util/Util;->isValidDimensions(II)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 8
    iget v0, p0, Lcom/bumptech/glide/request/SingleRequest;->overrideWidth:I

    iput v0, p0, Lcom/bumptech/glide/request/SingleRequest;->width:I

    .line 9
    iget v0, p0, Lcom/bumptech/glide/request/SingleRequest;->overrideHeight:I

    iput v0, p0, Lcom/bumptech/glide/request/SingleRequest;->height:I

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/bumptech/glide/request/SingleRequest;->getFallbackDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_1

    const/4 v1, 0x5

    .line 11
    :cond_1
    new-instance v0, Lcom/bumptech/glide/load/engine/GlideException;

    const-string v2, "Received null model"

    invoke-direct {v0, v2}, Lcom/bumptech/glide/load/engine/GlideException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lcom/bumptech/glide/request/SingleRequest;->onLoadFailed(Lcom/bumptech/glide/load/engine/GlideException;I)V

    return-void

    .line 12
    :cond_2
    iget v0, p0, Lcom/bumptech/glide/request/SingleRequest;->status:I

    const/4 v2, 0x2

    if-eq v0, v2, :cond_a

    const/4 v3, 0x4

    if-ne v0, v3, :cond_3

    .line 13
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->resource:Lcom/bumptech/glide/load/engine/Resource;

    sget-object v1, Lcom/bumptech/glide/load/DataSource;->MEMORY_CACHE:Lcom/bumptech/glide/load/DataSource;

    invoke-virtual {p0, v0, v1}, Lcom/bumptech/glide/request/SingleRequest;->onResourceReady(Lcom/bumptech/glide/load/engine/Resource;Lcom/bumptech/glide/load/DataSource;)V

    return-void

    .line 14
    :cond_3
    iput v1, p0, Lcom/bumptech/glide/request/SingleRequest;->status:I

    .line 15
    iget v0, p0, Lcom/bumptech/glide/request/SingleRequest;->overrideWidth:I

    iget v3, p0, Lcom/bumptech/glide/request/SingleRequest;->overrideHeight:I

    invoke-static {v0, v3}, Lcom/bumptech/glide/util/Util;->isValidDimensions(II)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 16
    iget v0, p0, Lcom/bumptech/glide/request/SingleRequest;->overrideWidth:I

    iget v3, p0, Lcom/bumptech/glide/request/SingleRequest;->overrideHeight:I

    invoke-virtual {p0, v0, v3}, Lcom/bumptech/glide/request/SingleRequest;->onSizeReady(II)V

    goto :goto_0

    .line 17
    :cond_4
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->target:Lcom/bumptech/glide/request/target/Target;

    invoke-interface {v0, p0}, Lcom/bumptech/glide/request/target/Target;->getSize(Lcom/bumptech/glide/request/target/SizeReadyCallback;)V

    .line 18
    :goto_0
    iget v0, p0, Lcom/bumptech/glide/request/SingleRequest;->status:I

    if-eq v0, v2, :cond_5

    if-ne v0, v1, :cond_8

    .line 19
    :cond_5
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->requestCoordinator:Lcom/bumptech/glide/request/RequestCoordinator;

    if-eqz v0, :cond_7

    invoke-interface {v0, p0}, Lcom/bumptech/glide/request/RequestCoordinator;->canNotifyStatusChanged(Lcom/bumptech/glide/request/Request;)Z

    move-result v0

    if-eqz v0, :cond_6

    goto :goto_1

    :cond_6
    const/4 v0, 0x0

    goto :goto_2

    :cond_7
    :goto_1
    const/4 v0, 0x1

    :goto_2
    if-eqz v0, :cond_8

    .line 20
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->target:Lcom/bumptech/glide/request/target/Target;

    invoke-virtual {p0}, Lcom/bumptech/glide/request/SingleRequest;->getPlaceholderDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/bumptech/glide/request/target/Target;->onLoadStarted(Landroid/graphics/drawable/Drawable;)V

    .line 21
    :cond_8
    sget-boolean v0, Lcom/bumptech/glide/request/SingleRequest;->IS_VERBOSE_LOGGABLE:Z

    if-eqz v0, :cond_9

    .line 22
    iget-wide v0, p0, Lcom/bumptech/glide/request/SingleRequest;->startTime:J

    invoke-static {v0, v1}, Lcom/bumptech/glide/util/LogTime;->getElapsedMillis(J)D

    move-result-wide v0

    const/16 v2, 0x2f

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v2, "finished run method in "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/request/SingleRequest;->logV(Ljava/lang/String;)V

    :cond_9
    return-void

    .line 23
    :cond_a
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Cannot restart a running request"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public clear()V
    .locals 6

    .line 1
    invoke-static {}, Lcom/bumptech/glide/util/Util;->assertMainThread()V

    .line 2
    invoke-virtual {p0}, Lcom/bumptech/glide/request/SingleRequest;->assertNotCallingCallbacks()V

    .line 3
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->stateVerifier:Lcom/bumptech/glide/util/pool/StateVerifier;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/pool/StateVerifier;->throwIfRecycled()V

    .line 4
    iget v0, p0, Lcom/bumptech/glide/request/SingleRequest;->status:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    return-void

    .line 5
    :cond_0
    invoke-virtual {p0}, Lcom/bumptech/glide/request/SingleRequest;->assertNotCallingCallbacks()V

    .line 6
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->stateVerifier:Lcom/bumptech/glide/util/pool/StateVerifier;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/pool/StateVerifier;->throwIfRecycled()V

    .line 7
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->target:Lcom/bumptech/glide/request/target/Target;

    invoke-interface {v0, p0}, Lcom/bumptech/glide/request/target/Target;->removeCallback(Lcom/bumptech/glide/request/target/SizeReadyCallback;)V

    .line 8
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->loadStatus:Lcom/bumptech/glide/load/engine/Engine$LoadStatus;

    const/4 v2, 0x1

    if-eqz v0, :cond_7

    .line 9
    iget-object v3, v0, Lcom/bumptech/glide/load/engine/Engine$LoadStatus;->engineJob:Lcom/bumptech/glide/load/engine/EngineJob;

    iget-object v0, v0, Lcom/bumptech/glide/load/engine/Engine$LoadStatus;->cb:Lcom/bumptech/glide/request/ResourceCallback;

    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    invoke-static {}, Lcom/bumptech/glide/util/Util;->assertMainThread()V

    .line 11
    iget-object v4, v3, Lcom/bumptech/glide/load/engine/EngineJob;->stateVerifier:Lcom/bumptech/glide/util/pool/StateVerifier;

    invoke-virtual {v4}, Lcom/bumptech/glide/util/pool/StateVerifier;->throwIfRecycled()V

    .line 12
    iget-boolean v4, v3, Lcom/bumptech/glide/load/engine/EngineJob;->hasResource:Z

    if-nez v4, :cond_4

    iget-boolean v4, v3, Lcom/bumptech/glide/load/engine/EngineJob;->hasLoadFailed:Z

    if-eqz v4, :cond_1

    goto :goto_0

    .line 13
    :cond_1
    iget-object v4, v3, Lcom/bumptech/glide/load/engine/EngineJob;->cbs:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 14
    iget-object v0, v3, Lcom/bumptech/glide/load/engine/EngineJob;->cbs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 15
    iget-boolean v0, v3, Lcom/bumptech/glide/load/engine/EngineJob;->hasLoadFailed:Z

    if-nez v0, :cond_6

    iget-boolean v0, v3, Lcom/bumptech/glide/load/engine/EngineJob;->hasResource:Z

    if-nez v0, :cond_6

    iget-boolean v0, v3, Lcom/bumptech/glide/load/engine/EngineJob;->isCancelled:Z

    if-eqz v0, :cond_2

    goto :goto_1

    .line 16
    :cond_2
    iput-boolean v2, v3, Lcom/bumptech/glide/load/engine/EngineJob;->isCancelled:Z

    .line 17
    iget-object v0, v3, Lcom/bumptech/glide/load/engine/EngineJob;->decodeJob:Lcom/bumptech/glide/load/engine/DecodeJob;

    .line 18
    iput-boolean v2, v0, Lcom/bumptech/glide/load/engine/DecodeJob;->isCancelled:Z

    .line 19
    iget-object v0, v0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentGenerator:Lcom/bumptech/glide/load/engine/DataFetcherGenerator;

    if-eqz v0, :cond_3

    .line 20
    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/DataFetcherGenerator;->cancel()V

    .line 21
    :cond_3
    iget-object v0, v3, Lcom/bumptech/glide/load/engine/EngineJob;->listener:Lcom/bumptech/glide/load/engine/EngineJobListener;

    iget-object v4, v3, Lcom/bumptech/glide/load/engine/EngineJob;->key:Lcom/bumptech/glide/load/Key;

    check-cast v0, Lcom/bumptech/glide/load/engine/Engine;

    invoke-virtual {v0, v3, v4}, Lcom/bumptech/glide/load/engine/Engine;->onEngineJobCancelled(Lcom/bumptech/glide/load/engine/EngineJob;Lcom/bumptech/glide/load/Key;)V

    goto :goto_1

    .line 22
    :cond_4
    :goto_0
    iget-object v4, v3, Lcom/bumptech/glide/load/engine/EngineJob;->ignoredCallbacks:Ljava/util/List;

    if-nez v4, :cond_5

    .line 23
    new-instance v4, Ljava/util/ArrayList;

    const/4 v5, 0x2

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v4, v3, Lcom/bumptech/glide/load/engine/EngineJob;->ignoredCallbacks:Ljava/util/List;

    .line 24
    :cond_5
    iget-object v4, v3, Lcom/bumptech/glide/load/engine/EngineJob;->ignoredCallbacks:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    .line 25
    iget-object v3, v3, Lcom/bumptech/glide/load/engine/EngineJob;->ignoredCallbacks:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_6
    :goto_1
    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->loadStatus:Lcom/bumptech/glide/load/engine/Engine$LoadStatus;

    .line 27
    :cond_7
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->resource:Lcom/bumptech/glide/load/engine/Resource;

    if-eqz v0, :cond_8

    .line 28
    invoke-virtual {p0, v0}, Lcom/bumptech/glide/request/SingleRequest;->releaseResource(Lcom/bumptech/glide/load/engine/Resource;)V

    .line 29
    :cond_8
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->requestCoordinator:Lcom/bumptech/glide/request/RequestCoordinator;

    if-eqz v0, :cond_a

    invoke-interface {v0, p0}, Lcom/bumptech/glide/request/RequestCoordinator;->canNotifyCleared(Lcom/bumptech/glide/request/Request;)Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_2

    :cond_9
    const/4 v2, 0x0

    :cond_a
    :goto_2
    if-eqz v2, :cond_b

    .line 30
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->target:Lcom/bumptech/glide/request/target/Target;

    invoke-virtual {p0}, Lcom/bumptech/glide/request/SingleRequest;->getPlaceholderDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/bumptech/glide/request/target/Target;->onLoadCleared(Landroid/graphics/drawable/Drawable;)V

    .line 31
    :cond_b
    iput v1, p0, Lcom/bumptech/glide/request/SingleRequest;->status:I

    return-void
.end method

.method public final getFallbackDrawable()Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->fallbackDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    .line 2
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->requestOptions:Lcom/bumptech/glide/request/BaseRequestOptions;

    .line 3
    iget-object v1, v0, Lcom/bumptech/glide/request/BaseRequestOptions;->fallbackDrawable:Landroid/graphics/drawable/Drawable;

    .line 4
    iput-object v1, p0, Lcom/bumptech/glide/request/SingleRequest;->fallbackDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v1, :cond_0

    .line 5
    iget v0, v0, Lcom/bumptech/glide/request/BaseRequestOptions;->fallbackId:I

    if-lez v0, :cond_0

    .line 6
    invoke-virtual {p0, v0}, Lcom/bumptech/glide/request/SingleRequest;->loadDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->fallbackDrawable:Landroid/graphics/drawable/Drawable;

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/bumptech/glide/request/SingleRequest;->fallbackDrawable:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method public final getPlaceholderDrawable()Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    .line 2
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->requestOptions:Lcom/bumptech/glide/request/BaseRequestOptions;

    .line 3
    iget-object v1, v0, Lcom/bumptech/glide/request/BaseRequestOptions;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    .line 4
    iput-object v1, p0, Lcom/bumptech/glide/request/SingleRequest;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v1, :cond_0

    .line 5
    iget v0, v0, Lcom/bumptech/glide/request/BaseRequestOptions;->placeholderId:I

    if-lez v0, :cond_0

    .line 6
    invoke-virtual {p0, v0}, Lcom/bumptech/glide/request/SingleRequest;->loadDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/bumptech/glide/request/SingleRequest;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method public getVerifier()Lcom/bumptech/glide/util/pool/StateVerifier;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/request/SingleRequest;->stateVerifier:Lcom/bumptech/glide/util/pool/StateVerifier;

    return-object p0
.end method

.method public isCleared()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/bumptech/glide/request/SingleRequest;->status:I

    const/4 v0, 0x6

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public isComplete()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/bumptech/glide/request/SingleRequest;->status:I

    const/4 v0, 0x4

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public isEquivalentTo(Lcom/bumptech/glide/request/Request;)Z
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/bumptech/glide/request/SingleRequest;

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    .line 2
    check-cast p1, Lcom/bumptech/glide/request/SingleRequest;

    .line 3
    iget v0, p0, Lcom/bumptech/glide/request/SingleRequest;->overrideWidth:I

    iget v2, p1, Lcom/bumptech/glide/request/SingleRequest;->overrideWidth:I

    const/4 v3, 0x1

    if-ne v0, v2, :cond_6

    iget v0, p0, Lcom/bumptech/glide/request/SingleRequest;->overrideHeight:I

    iget v2, p1, Lcom/bumptech/glide/request/SingleRequest;->overrideHeight:I

    if-ne v0, v2, :cond_6

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->model:Ljava/lang/Object;

    iget-object v2, p1, Lcom/bumptech/glide/request/SingleRequest;->model:Ljava/lang/Object;

    .line 4
    sget-object v4, Lcom/bumptech/glide/util/Util;->HEX_CHAR_ARRAY:[C

    if-nez v0, :cond_1

    if-nez v2, :cond_0

    move v0, v3

    goto :goto_0

    :cond_0
    move v0, v1

    goto :goto_0

    .line 5
    :cond_1
    instance-of v4, v0, Lcom/bumptech/glide/load/model/Model;

    if-eqz v4, :cond_2

    .line 6
    check-cast v0, Lcom/bumptech/glide/load/model/Model;

    invoke-interface {v0, v2}, Lcom/bumptech/glide/load/model/Model;->isEquivalentTo(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    .line 7
    :cond_2
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_0
    if-eqz v0, :cond_6

    .line 8
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->transcodeClass:Ljava/lang/Class;

    iget-object v2, p1, Lcom/bumptech/glide/request/SingleRequest;->transcodeClass:Ljava/lang/Class;

    .line 9
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->requestOptions:Lcom/bumptech/glide/request/BaseRequestOptions;

    iget-object v2, p1, Lcom/bumptech/glide/request/SingleRequest;->requestOptions:Lcom/bumptech/glide/request/BaseRequestOptions;

    .line 10
    invoke-virtual {v0, v2}, Lcom/bumptech/glide/request/BaseRequestOptions;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->priority:Lcom/bumptech/glide/Priority;

    iget-object v2, p1, Lcom/bumptech/glide/request/SingleRequest;->priority:Lcom/bumptech/glide/Priority;

    if-ne v0, v2, :cond_6

    .line 11
    iget-object p0, p0, Lcom/bumptech/glide/request/SingleRequest;->requestListeners:Ljava/util/List;

    if-nez p0, :cond_3

    move p0, v1

    goto :goto_1

    :cond_3
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    .line 12
    :goto_1
    iget-object p1, p1, Lcom/bumptech/glide/request/SingleRequest;->requestListeners:Ljava/util/List;

    if-nez p1, :cond_4

    move p1, v1

    goto :goto_2

    :cond_4
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    :goto_2
    if-ne p0, p1, :cond_5

    move p0, v3

    goto :goto_3

    :cond_5
    move p0, v1

    :goto_3
    if-eqz p0, :cond_6

    move v1, v3

    :cond_6
    return v1
.end method

.method public final isFirstReadyResource()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/request/SingleRequest;->requestCoordinator:Lcom/bumptech/glide/request/RequestCoordinator;

    if-eqz p0, :cond_1

    invoke-interface {p0}, Lcom/bumptech/glide/request/RequestCoordinator;->isAnyResourceSet()Z

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method public isResourceSet()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/bumptech/glide/request/SingleRequest;->isComplete()Z

    move-result p0

    return p0
.end method

.method public isRunning()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/bumptech/glide/request/SingleRequest;->status:I

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1

    const/4 v0, 0x3

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method public final loadDrawable(I)Landroid/graphics/drawable/Drawable;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "resourceId"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->requestOptions:Lcom/bumptech/glide/request/BaseRequestOptions;

    .line 2
    iget-object v0, v0, Lcom/bumptech/glide/request/BaseRequestOptions;->theme:Landroid/content/res/Resources$Theme;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 3
    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    .line 4
    :goto_0
    iget-object p0, p0, Lcom/bumptech/glide/request/SingleRequest;->glideContext:Lcom/bumptech/glide/GlideContext;

    .line 5
    invoke-static {p0, p0, p1, v0}, Lcom/bumptech/glide/load/resource/drawable/DrawableDecoderCompat;->getDrawable(Landroid/content/Context;Landroid/content/Context;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public final logV(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "message"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/request/SingleRequest;->tag:Ljava/lang/String;

    const/4 v0, 0x7

    invoke-static {p1, v0}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v0

    invoke-static {p0, v0}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " this: "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "Request"

    invoke-static {p1, p0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onLoadFailed(Lcom/bumptech/glide/load/engine/GlideException;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "e"
        }
    .end annotation

    const/4 v0, 0x5

    .line 1
    invoke-virtual {p0, p1, v0}, Lcom/bumptech/glide/request/SingleRequest;->onLoadFailed(Lcom/bumptech/glide/load/engine/GlideException;I)V

    return-void
.end method

.method public final onLoadFailed(Lcom/bumptech/glide/load/engine/GlideException;I)V
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "e",
            "maxLogLevel"
        }
    .end annotation

    .line 2
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->stateVerifier:Lcom/bumptech/glide/util/pool/StateVerifier;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/pool/StateVerifier;->throwIfRecycled()V

    .line 3
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->glideContext:Lcom/bumptech/glide/GlideContext;

    .line 4
    iget v0, v0, Lcom/bumptech/glide/GlideContext;->logLevel:I

    const/4 v1, 0x0

    if-gt v0, p2, :cond_0

    .line 5
    iget-object p2, p0, Lcom/bumptech/glide/request/SingleRequest;->model:Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    iget v2, p0, Lcom/bumptech/glide/request/SingleRequest;->width:I

    iget v3, p0, Lcom/bumptech/glide/request/SingleRequest;->height:I

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x34

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v4, "Load failed for "

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " with size ["

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "x"

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "]"

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v2, "Glide"

    invoke-static {v2, p2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p2, 0x4

    if-gt v0, p2, :cond_0

    .line 6
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 8
    invoke-virtual {p1, p1, p2}, Lcom/bumptech/glide/load/engine/GlideException;->addRootCauses(Ljava/lang/Throwable;Ljava/util/List;)V

    .line 9
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v3, v1

    :goto_0
    if-ge v3, v0, :cond_0

    add-int/lit8 v4, v3, 0x1

    const/16 v5, 0x27

    const-string v6, "Root cause ("

    const-string v7, " of "

    .line 10
    invoke-static {v5, v6, v4, v7, v0}, Lcom/bumptech/glide/gifdecoder/GifHeaderParser$$ExternalSyntheticOutline0;->m(ILjava/lang/String;ILjava/lang/String;I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v2, v5, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move v3, v4

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 11
    iput-object p2, p0, Lcom/bumptech/glide/request/SingleRequest;->loadStatus:Lcom/bumptech/glide/load/engine/Engine$LoadStatus;

    const/4 p2, 0x5

    .line 12
    iput p2, p0, Lcom/bumptech/glide/request/SingleRequest;->status:I

    const/4 p2, 0x1

    .line 13
    iput-boolean p2, p0, Lcom/bumptech/glide/request/SingleRequest;->isCallingCallbacks:Z

    .line 14
    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->requestListeners:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 15
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    move v2, v1

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bumptech/glide/request/RequestListener;

    .line 16
    iget-object v4, p0, Lcom/bumptech/glide/request/SingleRequest;->model:Ljava/lang/Object;

    iget-object v5, p0, Lcom/bumptech/glide/request/SingleRequest;->target:Lcom/bumptech/glide/request/target/Target;

    .line 17
    invoke-virtual {p0}, Lcom/bumptech/glide/request/SingleRequest;->isFirstReadyResource()Z

    move-result v6

    invoke-interface {v3, p1, v4, v5, v6}, Lcom/bumptech/glide/request/RequestListener;->onLoadFailed(Lcom/bumptech/glide/load/engine/GlideException;Ljava/lang/Object;Lcom/bumptech/glide/request/target/Target;Z)Z

    move-result v3

    or-int/2addr v2, v3

    goto :goto_1

    :cond_1
    move v2, v1

    .line 18
    :cond_2
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->targetListener:Lcom/bumptech/glide/request/RequestListener;

    if-eqz v0, :cond_3

    iget-object v3, p0, Lcom/bumptech/glide/request/SingleRequest;->model:Ljava/lang/Object;

    iget-object v4, p0, Lcom/bumptech/glide/request/SingleRequest;->target:Lcom/bumptech/glide/request/target/Target;

    .line 19
    invoke-virtual {p0}, Lcom/bumptech/glide/request/SingleRequest;->isFirstReadyResource()Z

    move-result v5

    invoke-interface {v0, p1, v3, v4, v5}, Lcom/bumptech/glide/request/RequestListener;->onLoadFailed(Lcom/bumptech/glide/load/engine/GlideException;Ljava/lang/Object;Lcom/bumptech/glide/request/target/Target;Z)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_2

    :cond_3
    move p2, v1

    :goto_2
    or-int p1, v2, p2

    if-nez p1, :cond_4

    .line 20
    invoke-virtual {p0}, Lcom/bumptech/glide/request/SingleRequest;->setErrorPlaceholder()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    :cond_4
    iput-boolean v1, p0, Lcom/bumptech/glide/request/SingleRequest;->isCallingCallbacks:Z

    .line 22
    iget-object p1, p0, Lcom/bumptech/glide/request/SingleRequest;->requestCoordinator:Lcom/bumptech/glide/request/RequestCoordinator;

    if-eqz p1, :cond_5

    .line 23
    invoke-interface {p1, p0}, Lcom/bumptech/glide/request/RequestCoordinator;->onRequestFailed(Lcom/bumptech/glide/request/Request;)V

    :cond_5
    return-void

    :catchall_0
    move-exception p1

    .line 24
    iput-boolean v1, p0, Lcom/bumptech/glide/request/SingleRequest;->isCallingCallbacks:Z

    throw p1
.end method

.method public onResourceReady(Lcom/bumptech/glide/load/engine/Resource;Lcom/bumptech/glide/load/DataSource;)V
    .locals 13
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "resource",
            "dataSource"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/Resource<",
            "*>;",
            "Lcom/bumptech/glide/load/DataSource;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->stateVerifier:Lcom/bumptech/glide/util/pool/StateVerifier;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/pool/StateVerifier;->throwIfRecycled()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->loadStatus:Lcom/bumptech/glide/load/engine/Engine$LoadStatus;

    const/4 v0, 0x5

    if-nez p1, :cond_0

    .line 3
    new-instance p1, Lcom/bumptech/glide/load/engine/GlideException;

    iget-object p2, p0, Lcom/bumptech/glide/request/SingleRequest;->transcodeClass:Ljava/lang/Class;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x52

    const-string v2, "Expected to receive a Resource<R> with an object of "

    const-string v3, " inside, but instead got null."

    invoke-static {v1, v2, p2, v3}, Landroidx/viewpager2/widget/FakeDrag$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/bumptech/glide/load/engine/GlideException;-><init>(Ljava/lang/String;)V

    .line 4
    invoke-virtual {p0, p1, v0}, Lcom/bumptech/glide/request/SingleRequest;->onLoadFailed(Lcom/bumptech/glide/load/engine/GlideException;I)V

    return-void

    .line 5
    :cond_0
    invoke-interface {p1}, Lcom/bumptech/glide/load/engine/Resource;->get()Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_b

    .line 6
    iget-object v1, p0, Lcom/bumptech/glide/request/SingleRequest;->transcodeClass:Ljava/lang/Class;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_1

    goto/16 :goto_4

    .line 7
    :cond_1
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->requestCoordinator:Lcom/bumptech/glide/request/RequestCoordinator;

    const/4 v8, 0x0

    const/4 v9, 0x1

    if-eqz v0, :cond_3

    invoke-interface {v0, p0}, Lcom/bumptech/glide/request/RequestCoordinator;->canSetImage(Lcom/bumptech/glide/request/Request;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    move v0, v8

    goto :goto_1

    :cond_3
    :goto_0
    move v0, v9

    :goto_1
    const/4 v1, 0x4

    if-nez v0, :cond_4

    .line 8
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/request/SingleRequest;->releaseResource(Lcom/bumptech/glide/load/engine/Resource;)V

    .line 9
    iput v1, p0, Lcom/bumptech/glide/request/SingleRequest;->status:I

    return-void

    .line 10
    :cond_4
    invoke-virtual {p0}, Lcom/bumptech/glide/request/SingleRequest;->isFirstReadyResource()Z

    move-result v0

    .line 11
    iput v1, p0, Lcom/bumptech/glide/request/SingleRequest;->status:I

    .line 12
    iput-object p1, p0, Lcom/bumptech/glide/request/SingleRequest;->resource:Lcom/bumptech/glide/load/engine/Resource;

    .line 13
    iget-object p1, p0, Lcom/bumptech/glide/request/SingleRequest;->glideContext:Lcom/bumptech/glide/GlideContext;

    .line 14
    iget p1, p1, Lcom/bumptech/glide/GlideContext;->logLevel:I

    const/4 v1, 0x3

    if-gt p1, v1, :cond_5

    .line 15
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/bumptech/glide/request/SingleRequest;->model:Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lcom/bumptech/glide/request/SingleRequest;->width:I

    iget v4, p0, Lcom/bumptech/glide/request/SingleRequest;->height:I

    iget-wide v5, p0, Lcom/bumptech/glide/request/SingleRequest;->startTime:J

    .line 16
    invoke-static {v5, v6}, Lcom/bumptech/glide/util/LogTime;->getElapsedMillis(J)D

    move-result-wide v5

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v10

    add-int/lit8 v10, v10, 0x5f

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v11

    add-int/2addr v11, v10

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v10

    add-int/2addr v10, v11

    const-string v11, "Finished loading "

    const-string v12, " from "

    invoke-static {v10, v11, p1, v12, v1}, Landroidx/recyclerview/R$attr$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " for "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " with size ["

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "x"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "] in "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5, v6}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, " ms"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "Glide"

    .line 17
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    :cond_5
    iput-boolean v9, p0, Lcom/bumptech/glide/request/SingleRequest;->isCallingCallbacks:Z

    .line 19
    :try_start_0
    iget-object p1, p0, Lcom/bumptech/glide/request/SingleRequest;->requestListeners:Ljava/util/List;

    if-eqz p1, :cond_6

    .line 20
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    move v10, v8

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/request/RequestListener;

    .line 21
    iget-object v3, p0, Lcom/bumptech/glide/request/SingleRequest;->model:Ljava/lang/Object;

    iget-object v4, p0, Lcom/bumptech/glide/request/SingleRequest;->target:Lcom/bumptech/glide/request/target/Target;

    move-object v2, v7

    move-object v5, p2

    move v6, v0

    .line 22
    invoke-interface/range {v1 .. v6}, Lcom/bumptech/glide/request/RequestListener;->onResourceReady(Ljava/lang/Object;Ljava/lang/Object;Lcom/bumptech/glide/request/target/Target;Lcom/bumptech/glide/load/DataSource;Z)Z

    move-result v1

    or-int/2addr v10, v1

    goto :goto_2

    :cond_6
    move v10, v8

    .line 23
    :cond_7
    iget-object v1, p0, Lcom/bumptech/glide/request/SingleRequest;->targetListener:Lcom/bumptech/glide/request/RequestListener;

    if-eqz v1, :cond_8

    iget-object v3, p0, Lcom/bumptech/glide/request/SingleRequest;->model:Ljava/lang/Object;

    iget-object v4, p0, Lcom/bumptech/glide/request/SingleRequest;->target:Lcom/bumptech/glide/request/target/Target;

    move-object v2, v7

    move-object v5, p2

    move v6, v0

    .line 24
    invoke-interface/range {v1 .. v6}, Lcom/bumptech/glide/request/RequestListener;->onResourceReady(Ljava/lang/Object;Ljava/lang/Object;Lcom/bumptech/glide/request/target/Target;Lcom/bumptech/glide/load/DataSource;Z)Z

    move-result p1

    if-eqz p1, :cond_8

    goto :goto_3

    :cond_8
    move v9, v8

    :goto_3
    or-int p1, v9, v10

    if-nez p1, :cond_9

    .line 25
    iget-object p1, p0, Lcom/bumptech/glide/request/SingleRequest;->animationFactory:Lcom/bumptech/glide/request/transition/TransitionFactory;

    .line 26
    invoke-interface {p1, p2, v0}, Lcom/bumptech/glide/request/transition/TransitionFactory;->build(Lcom/bumptech/glide/load/DataSource;Z)Lcom/bumptech/glide/request/transition/Transition;

    move-result-object p1

    .line 27
    iget-object p2, p0, Lcom/bumptech/glide/request/SingleRequest;->target:Lcom/bumptech/glide/request/target/Target;

    invoke-interface {p2, v7, p1}, Lcom/bumptech/glide/request/target/Target;->onResourceReady(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    :cond_9
    iput-boolean v8, p0, Lcom/bumptech/glide/request/SingleRequest;->isCallingCallbacks:Z

    .line 29
    iget-object p1, p0, Lcom/bumptech/glide/request/SingleRequest;->requestCoordinator:Lcom/bumptech/glide/request/RequestCoordinator;

    if-eqz p1, :cond_a

    .line 30
    invoke-interface {p1, p0}, Lcom/bumptech/glide/request/RequestCoordinator;->onRequestSuccess(Lcom/bumptech/glide/request/Request;)V

    :cond_a
    return-void

    :catchall_0
    move-exception p1

    .line 31
    iput-boolean v8, p0, Lcom/bumptech/glide/request/SingleRequest;->isCallingCallbacks:Z

    throw p1

    .line 32
    :cond_b
    :goto_4
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/request/SingleRequest;->releaseResource(Lcom/bumptech/glide/load/engine/Resource;)V

    .line 33
    new-instance p2, Lcom/bumptech/glide/load/engine/GlideException;

    iget-object v1, p0, Lcom/bumptech/glide/request/SingleRequest;->transcodeClass:Ljava/lang/Class;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    if-eqz v7, :cond_c

    .line 34
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    goto :goto_5

    :cond_c
    move-object v3, v2

    :goto_5
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    if-eqz v7, :cond_d

    goto :goto_6

    :cond_d
    const-string v2, " To indicate failure return a null Resource object, rather than a Resource object containing null data."

    .line 35
    :goto_6
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, 0x47

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v6, v5

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v5, v6

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v6, v5

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v5, v6

    const-string v6, "Expected to receive an object of "

    const-string v7, " but instead got "

    invoke-static {v5, v6, v1, v7, v3}, Landroidx/recyclerview/R$attr$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "{"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "} inside Resource{"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "}."

    invoke-static {v1, p1, v2}, Landroid/support/v4/app/FragmentTabHost$SavedState$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/bumptech/glide/load/engine/GlideException;-><init>(Ljava/lang/String;)V

    .line 36
    invoke-virtual {p0, p2, v0}, Lcom/bumptech/glide/request/SingleRequest;->onLoadFailed(Lcom/bumptech/glide/load/engine/GlideException;I)V

    return-void
.end method

.method public onSizeReady(II)V
    .locals 37
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "width",
            "height"
        }
    .end annotation

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    .line 1
    iget-object v3, v0, Lcom/bumptech/glide/request/SingleRequest;->stateVerifier:Lcom/bumptech/glide/util/pool/StateVerifier;

    invoke-virtual {v3}, Lcom/bumptech/glide/util/pool/StateVerifier;->throwIfRecycled()V

    .line 2
    sget-boolean v3, Lcom/bumptech/glide/request/SingleRequest;->IS_VERBOSE_LOGGABLE:Z

    if-eqz v3, :cond_0

    .line 3
    iget-wide v4, v0, Lcom/bumptech/glide/request/SingleRequest;->startTime:J

    invoke-static {v4, v5}, Lcom/bumptech/glide/util/LogTime;->getElapsedMillis(J)D

    move-result-wide v4

    const/16 v6, 0x2b

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v6, "Got onSizeReady in "

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/bumptech/glide/request/SingleRequest;->logV(Ljava/lang/String;)V

    .line 4
    :cond_0
    iget v4, v0, Lcom/bumptech/glide/request/SingleRequest;->status:I

    const/4 v5, 0x3

    if-eq v4, v5, :cond_1

    return-void

    :cond_1
    const/4 v4, 0x2

    .line 5
    iput v4, v0, Lcom/bumptech/glide/request/SingleRequest;->status:I

    .line 6
    iget-object v6, v0, Lcom/bumptech/glide/request/SingleRequest;->requestOptions:Lcom/bumptech/glide/request/BaseRequestOptions;

    .line 7
    iget v6, v6, Lcom/bumptech/glide/request/BaseRequestOptions;->sizeMultiplier:F

    const/high16 v7, -0x80000000

    if-ne v1, v7, :cond_2

    goto :goto_0

    :cond_2
    int-to-float v1, v1

    mul-float/2addr v1, v6

    .line 8
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 9
    :goto_0
    iput v1, v0, Lcom/bumptech/glide/request/SingleRequest;->width:I

    if-ne v2, v7, :cond_3

    move v1, v2

    goto :goto_1

    :cond_3
    int-to-float v1, v2

    mul-float/2addr v6, v1

    .line 10
    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 11
    :goto_1
    iput v1, v0, Lcom/bumptech/glide/request/SingleRequest;->height:I

    if-eqz v3, :cond_4

    .line 12
    iget-wide v1, v0, Lcom/bumptech/glide/request/SingleRequest;->startTime:J

    invoke-static {v1, v2}, Lcom/bumptech/glide/util/LogTime;->getElapsedMillis(J)D

    move-result-wide v1

    const/16 v6, 0x3b

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v6, "finished setup for calling load in "

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/SingleRequest;->logV(Ljava/lang/String;)V

    .line 13
    :cond_4
    iget-object v1, v0, Lcom/bumptech/glide/request/SingleRequest;->engine:Lcom/bumptech/glide/load/engine/Engine;

    iget-object v2, v0, Lcom/bumptech/glide/request/SingleRequest;->glideContext:Lcom/bumptech/glide/GlideContext;

    iget-object v15, v0, Lcom/bumptech/glide/request/SingleRequest;->model:Ljava/lang/Object;

    iget-object v6, v0, Lcom/bumptech/glide/request/SingleRequest;->requestOptions:Lcom/bumptech/glide/request/BaseRequestOptions;

    .line 14
    iget-object v14, v6, Lcom/bumptech/glide/request/BaseRequestOptions;->signature:Lcom/bumptech/glide/load/Key;

    .line 15
    iget v13, v0, Lcom/bumptech/glide/request/SingleRequest;->width:I

    iget v12, v0, Lcom/bumptech/glide/request/SingleRequest;->height:I

    .line 16
    iget-object v11, v6, Lcom/bumptech/glide/request/BaseRequestOptions;->resourceClass:Ljava/lang/Class;

    .line 17
    iget-object v10, v0, Lcom/bumptech/glide/request/SingleRequest;->transcodeClass:Ljava/lang/Class;

    iget-object v9, v0, Lcom/bumptech/glide/request/SingleRequest;->priority:Lcom/bumptech/glide/Priority;

    .line 18
    iget-object v8, v6, Lcom/bumptech/glide/request/BaseRequestOptions;->diskCacheStrategy:Lcom/bumptech/glide/load/engine/DiskCacheStrategy;

    .line 19
    iget-object v7, v6, Lcom/bumptech/glide/request/BaseRequestOptions;->transformations:Ljava/util/Map;

    .line 20
    iget-boolean v5, v6, Lcom/bumptech/glide/request/BaseRequestOptions;->isTransformationRequired:Z

    .line 21
    iget-boolean v4, v6, Lcom/bumptech/glide/request/BaseRequestOptions;->isScaleOnlyOrNoTransform:Z

    move/from16 v16, v3

    .line 22
    iget-object v3, v6, Lcom/bumptech/glide/request/BaseRequestOptions;->options:Lcom/bumptech/glide/load/Options;

    move/from16 p1, v4

    .line 23
    iget-boolean v4, v6, Lcom/bumptech/glide/request/BaseRequestOptions;->isCacheable:Z

    move/from16 p2, v5

    .line 24
    iget-boolean v5, v6, Lcom/bumptech/glide/request/BaseRequestOptions;->useUnlimitedSourceGeneratorsPool:Z

    move-object/from16 v23, v2

    .line 25
    iget-boolean v2, v6, Lcom/bumptech/glide/request/BaseRequestOptions;->useAnimationPool:Z

    .line 26
    iget-boolean v6, v6, Lcom/bumptech/glide/request/BaseRequestOptions;->onlyRetrieveFromCache:Z

    .line 27
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move/from16 v21, v2

    .line 28
    sget-object v2, Lcom/bumptech/glide/load/DataSource;->MEMORY_CACHE:Lcom/bumptech/glide/load/DataSource;

    invoke-static {}, Lcom/bumptech/glide/util/Util;->assertMainThread()V

    .line 29
    sget-boolean v24, Lcom/bumptech/glide/load/engine/Engine;->VERBOSE_IS_LOGGABLE:Z

    if-eqz v24, :cond_5

    sget v17, Lcom/bumptech/glide/util/LogTime;->$r8$clinit:I

    .line 30
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtimeNanos()J

    move-result-wide v17

    goto :goto_2

    :cond_5
    const-wide/16 v17, 0x0

    :goto_2
    move-wide/from16 v25, v17

    move/from16 v17, v6

    .line 31
    iget-object v6, v1, Lcom/bumptech/glide/load/engine/Engine;->keyFactory:Lcom/bumptech/glide/load/engine/EngineKeyFactory;

    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    new-instance v6, Lcom/bumptech/glide/load/engine/EngineKey;

    move/from16 v20, v5

    move-object/from16 v27, v6

    move/from16 v5, v17

    move-object/from16 v28, v7

    move-object v7, v15

    move-object/from16 v29, v8

    move-object v8, v14

    move-object/from16 v30, v9

    move v9, v13

    move-object/from16 v31, v10

    move v10, v12

    move-object/from16 v32, v11

    move-object/from16 v11, v28

    move/from16 v33, v12

    move-object/from16 v12, v32

    move/from16 v34, v13

    move-object/from16 v13, v31

    move-object/from16 v35, v14

    move-object v14, v3

    invoke-direct/range {v6 .. v14}, Lcom/bumptech/glide/load/engine/EngineKey;-><init>(Ljava/lang/Object;Lcom/bumptech/glide/load/Key;IILjava/util/Map;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/Options;)V

    if-nez v4, :cond_6

    move-object/from16 v9, v27

    const/4 v10, 0x0

    goto :goto_4

    .line 33
    :cond_6
    iget-object v7, v1, Lcom/bumptech/glide/load/engine/Engine;->activeResources:Lcom/bumptech/glide/load/engine/ActiveResources;

    .line 34
    iget-object v8, v7, Lcom/bumptech/glide/load/engine/ActiveResources;->activeEngineResources:Ljava/util/Map;

    move-object/from16 v9, v27

    invoke-interface {v8, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/bumptech/glide/load/engine/ActiveResources$ResourceWeakReference;

    if-nez v8, :cond_7

    const/4 v10, 0x0

    goto :goto_3

    .line 35
    :cond_7
    invoke-virtual {v8}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/bumptech/glide/load/engine/EngineResource;

    if-nez v10, :cond_8

    .line 36
    invoke-virtual {v7, v8}, Lcom/bumptech/glide/load/engine/ActiveResources;->cleanupActiveReference(Lcom/bumptech/glide/load/engine/ActiveResources$ResourceWeakReference;)V

    :cond_8
    :goto_3
    if-eqz v10, :cond_9

    .line 37
    invoke-virtual {v10}, Lcom/bumptech/glide/load/engine/EngineResource;->acquire()V

    :cond_9
    :goto_4
    if-eqz v10, :cond_a

    .line 38
    invoke-virtual {v0, v10, v2}, Lcom/bumptech/glide/request/SingleRequest;->onResourceReady(Lcom/bumptech/glide/load/engine/Resource;Lcom/bumptech/glide/load/DataSource;)V

    if-eqz v24, :cond_10

    const-string v1, "Loaded resource from active resources"

    move-wide/from16 v7, v25

    .line 39
    invoke-static {v1, v7, v8, v9}, Lcom/bumptech/glide/load/engine/Engine;->logWithTimeAndKey(Ljava/lang/String;JLcom/bumptech/glide/load/Key;)V

    goto :goto_8

    :cond_a
    move-wide/from16 v7, v25

    const/4 v10, 0x1

    if-nez v4, :cond_b

    move-object/from16 v26, v3

    move/from16 v19, v4

    const/4 v12, 0x0

    goto :goto_7

    .line 40
    :cond_b
    iget-object v11, v1, Lcom/bumptech/glide/load/engine/Engine;->cache:Lcom/bumptech/glide/load/engine/cache/MemoryCache;

    check-cast v11, Lcom/bumptech/glide/load/engine/cache/LruResourceCache;

    .line 41
    monitor-enter v11

    .line 42
    :try_start_0
    iget-object v12, v11, Lcom/bumptech/glide/util/LruCache;->cache:Ljava/util/Map;

    invoke-interface {v12, v9}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    if-eqz v12, :cond_c

    .line 43
    iget-wide v13, v11, Lcom/bumptech/glide/util/LruCache;->currentSize:J

    invoke-virtual {v11, v12}, Lcom/bumptech/glide/load/engine/cache/LruResourceCache;->getSize(Ljava/lang/Object;)I

    move-result v6

    move-object/from16 v26, v3

    move/from16 v19, v4

    int-to-long v3, v6

    sub-long/2addr v13, v3

    iput-wide v13, v11, Lcom/bumptech/glide/util/LruCache;->currentSize:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_5

    :cond_c
    move-object/from16 v26, v3

    move/from16 v19, v4

    .line 44
    :goto_5
    monitor-exit v11

    .line 45
    check-cast v12, Lcom/bumptech/glide/load/engine/Resource;

    if-nez v12, :cond_d

    const/4 v12, 0x0

    goto :goto_6

    .line 46
    :cond_d
    instance-of v3, v12, Lcom/bumptech/glide/load/engine/EngineResource;

    if-eqz v3, :cond_e

    .line 47
    check-cast v12, Lcom/bumptech/glide/load/engine/EngineResource;

    goto :goto_6

    .line 48
    :cond_e
    new-instance v3, Lcom/bumptech/glide/load/engine/EngineResource;

    invoke-direct {v3, v12, v10, v10}, Lcom/bumptech/glide/load/engine/EngineResource;-><init>(Lcom/bumptech/glide/load/engine/Resource;ZZ)V

    move-object v12, v3

    :goto_6
    if-eqz v12, :cond_f

    .line 49
    invoke-virtual {v12}, Lcom/bumptech/glide/load/engine/EngineResource;->acquire()V

    .line 50
    iget-object v3, v1, Lcom/bumptech/glide/load/engine/Engine;->activeResources:Lcom/bumptech/glide/load/engine/ActiveResources;

    invoke-virtual {v3, v9, v12}, Lcom/bumptech/glide/load/engine/ActiveResources;->activate(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/EngineResource;)V

    :cond_f
    :goto_7
    if-eqz v12, :cond_11

    .line 51
    invoke-virtual {v0, v12, v2}, Lcom/bumptech/glide/request/SingleRequest;->onResourceReady(Lcom/bumptech/glide/load/engine/Resource;Lcom/bumptech/glide/load/DataSource;)V

    if-eqz v24, :cond_10

    const-string v1, "Loaded resource from cache"

    .line 52
    invoke-static {v1, v7, v8, v9}, Lcom/bumptech/glide/load/engine/Engine;->logWithTimeAndKey(Ljava/lang/String;JLcom/bumptech/glide/load/Key;)V

    :cond_10
    :goto_8
    move-object v1, v0

    const/4 v0, 0x0

    goto/16 :goto_d

    .line 53
    :cond_11
    iget-object v2, v1, Lcom/bumptech/glide/load/engine/Engine;->jobs:Lcom/bumptech/glide/load/engine/Jobs;

    if-eqz v5, :cond_12

    .line 54
    iget-object v2, v2, Lcom/bumptech/glide/load/engine/Jobs;->onlyCacheJobs:Ljava/util/Map;

    goto :goto_9

    :cond_12
    iget-object v2, v2, Lcom/bumptech/glide/load/engine/Jobs;->jobs:Ljava/util/Map;

    .line 55
    :goto_9
    invoke-interface {v2, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bumptech/glide/load/engine/EngineJob;

    if-eqz v2, :cond_14

    .line 56
    invoke-virtual {v2, v0}, Lcom/bumptech/glide/load/engine/EngineJob;->addCallback(Lcom/bumptech/glide/request/ResourceCallback;)V

    if-eqz v24, :cond_13

    const-string v1, "Added to existing load"

    .line 57
    invoke-static {v1, v7, v8, v9}, Lcom/bumptech/glide/load/engine/Engine;->logWithTimeAndKey(Ljava/lang/String;JLcom/bumptech/glide/load/Key;)V

    .line 58
    :cond_13
    new-instance v1, Lcom/bumptech/glide/load/engine/Engine$LoadStatus;

    invoke-direct {v1, v0, v2}, Lcom/bumptech/glide/load/engine/Engine$LoadStatus;-><init>(Lcom/bumptech/glide/request/ResourceCallback;Lcom/bumptech/glide/load/engine/EngineJob;)V

    move-object/from16 v36, v1

    move-object v1, v0

    move-object/from16 v0, v36

    goto/16 :goto_d

    .line 59
    :cond_14
    iget-object v2, v1, Lcom/bumptech/glide/load/engine/Engine;->engineJobFactory:Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;

    .line 60
    iget-object v2, v2, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->pool:Landroidx/core/util/Pools$Pool;

    invoke-interface {v2}, Landroidx/core/util/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bumptech/glide/load/engine/EngineJob;

    const-string v3, "Argument must not be null"

    .line 61
    invoke-static {v2, v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-object/from16 v17, v2

    move-object/from16 v18, v9

    move/from16 v22, v5

    .line 62
    invoke-virtual/range {v17 .. v22}, Lcom/bumptech/glide/load/engine/EngineJob;->init(Lcom/bumptech/glide/load/Key;ZZZZ)Lcom/bumptech/glide/load/engine/EngineJob;

    move-result-object v2

    .line 63
    iget-object v3, v1, Lcom/bumptech/glide/load/engine/Engine;->decodeJobFactory:Lcom/bumptech/glide/load/engine/Engine$DecodeJobFactory;

    .line 64
    iget-object v4, v3, Lcom/bumptech/glide/load/engine/Engine$DecodeJobFactory;->pool:Landroidx/core/util/Pools$Pool;

    invoke-interface {v4}, Landroidx/core/util/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/bumptech/glide/load/engine/DecodeJob;

    const-string v6, "Argument must not be null"

    .line 65
    invoke-static {v4, v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 66
    iget v6, v3, Lcom/bumptech/glide/load/engine/Engine$DecodeJobFactory;->creationOrder:I

    add-int/lit8 v11, v6, 0x1

    iput v11, v3, Lcom/bumptech/glide/load/engine/Engine$DecodeJobFactory;->creationOrder:I

    .line 67
    iget-object v3, v4, Lcom/bumptech/glide/load/engine/DecodeJob;->decodeHelper:Lcom/bumptech/glide/load/engine/DecodeHelper;

    iget-object v11, v4, Lcom/bumptech/glide/load/engine/DecodeJob;->diskCacheProvider:Lcom/bumptech/glide/load/engine/DecodeJob$DiskCacheProvider;

    move-object/from16 v12, v23

    .line 68
    iput-object v12, v3, Lcom/bumptech/glide/load/engine/DecodeHelper;->glideContext:Lcom/bumptech/glide/GlideContext;

    .line 69
    iput-object v15, v3, Lcom/bumptech/glide/load/engine/DecodeHelper;->model:Ljava/lang/Object;

    move-object/from16 v13, v35

    .line 70
    iput-object v13, v3, Lcom/bumptech/glide/load/engine/DecodeHelper;->signature:Lcom/bumptech/glide/load/Key;

    move/from16 v14, v34

    .line 71
    iput v14, v3, Lcom/bumptech/glide/load/engine/DecodeHelper;->width:I

    move/from16 v10, v33

    .line 72
    iput v10, v3, Lcom/bumptech/glide/load/engine/DecodeHelper;->height:I

    move-wide/from16 v18, v7

    move-object/from16 v7, v29

    .line 73
    iput-object v7, v3, Lcom/bumptech/glide/load/engine/DecodeHelper;->diskCacheStrategy:Lcom/bumptech/glide/load/engine/DiskCacheStrategy;

    move-object/from16 v8, v32

    .line 74
    iput-object v8, v3, Lcom/bumptech/glide/load/engine/DecodeHelper;->resourceClass:Ljava/lang/Class;

    .line 75
    iput-object v11, v3, Lcom/bumptech/glide/load/engine/DecodeHelper;->diskCacheProvider:Lcom/bumptech/glide/load/engine/DecodeJob$DiskCacheProvider;

    move-object/from16 v8, v31

    .line 76
    iput-object v8, v3, Lcom/bumptech/glide/load/engine/DecodeHelper;->transcodeClass:Ljava/lang/Class;

    move-object/from16 v8, v30

    .line 77
    iput-object v8, v3, Lcom/bumptech/glide/load/engine/DecodeHelper;->priority:Lcom/bumptech/glide/Priority;

    move-object/from16 v11, v26

    .line 78
    iput-object v11, v3, Lcom/bumptech/glide/load/engine/DecodeHelper;->options:Lcom/bumptech/glide/load/Options;

    move-object/from16 v0, v28

    .line 79
    iput-object v0, v3, Lcom/bumptech/glide/load/engine/DecodeHelper;->transformations:Ljava/util/Map;

    move/from16 v0, p2

    .line 80
    iput-boolean v0, v3, Lcom/bumptech/glide/load/engine/DecodeHelper;->isTransformationRequired:Z

    move/from16 v0, p1

    .line 81
    iput-boolean v0, v3, Lcom/bumptech/glide/load/engine/DecodeHelper;->isScaleOnlyOrNoTransform:Z

    .line 82
    iput-object v12, v4, Lcom/bumptech/glide/load/engine/DecodeJob;->glideContext:Lcom/bumptech/glide/GlideContext;

    .line 83
    iput-object v13, v4, Lcom/bumptech/glide/load/engine/DecodeJob;->signature:Lcom/bumptech/glide/load/Key;

    .line 84
    iput-object v8, v4, Lcom/bumptech/glide/load/engine/DecodeJob;->priority:Lcom/bumptech/glide/Priority;

    .line 85
    iput-object v9, v4, Lcom/bumptech/glide/load/engine/DecodeJob;->loadKey:Lcom/bumptech/glide/load/engine/EngineKey;

    .line 86
    iput v14, v4, Lcom/bumptech/glide/load/engine/DecodeJob;->width:I

    .line 87
    iput v10, v4, Lcom/bumptech/glide/load/engine/DecodeJob;->height:I

    .line 88
    iput-object v7, v4, Lcom/bumptech/glide/load/engine/DecodeJob;->diskCacheStrategy:Lcom/bumptech/glide/load/engine/DiskCacheStrategy;

    .line 89
    iput-boolean v5, v4, Lcom/bumptech/glide/load/engine/DecodeJob;->onlyRetrieveFromCache:Z

    .line 90
    iput-object v11, v4, Lcom/bumptech/glide/load/engine/DecodeJob;->options:Lcom/bumptech/glide/load/Options;

    .line 91
    iput-object v2, v4, Lcom/bumptech/glide/load/engine/DecodeJob;->callback:Lcom/bumptech/glide/load/engine/DecodeJob$Callback;

    .line 92
    iput v6, v4, Lcom/bumptech/glide/load/engine/DecodeJob;->order:I

    const/4 v0, 0x1

    .line 93
    iput v0, v4, Lcom/bumptech/glide/load/engine/DecodeJob;->runReason:I

    .line 94
    iput-object v15, v4, Lcom/bumptech/glide/load/engine/DecodeJob;->model:Ljava/lang/Object;

    .line 95
    iget-object v1, v1, Lcom/bumptech/glide/load/engine/Engine;->jobs:Lcom/bumptech/glide/load/engine/Jobs;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    iget-boolean v3, v2, Lcom/bumptech/glide/load/engine/EngineJob;->onlyRetrieveFromCache:Z

    .line 97
    invoke-virtual {v1, v3}, Lcom/bumptech/glide/load/engine/Jobs;->getJobMap(Z)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v1, p0

    .line 98
    invoke-virtual {v2, v1}, Lcom/bumptech/glide/load/engine/EngineJob;->addCallback(Lcom/bumptech/glide/request/ResourceCallback;)V

    .line 99
    iput-object v4, v2, Lcom/bumptech/glide/load/engine/EngineJob;->decodeJob:Lcom/bumptech/glide/load/engine/DecodeJob;

    .line 100
    invoke-virtual {v4, v0}, Lcom/bumptech/glide/load/engine/DecodeJob;->getNextStage$enumunboxing$(I)I

    move-result v3

    const/4 v5, 0x2

    if-eq v3, v5, :cond_16

    const/4 v5, 0x3

    if-ne v3, v5, :cond_15

    goto :goto_a

    :cond_15
    const/4 v10, 0x0

    goto :goto_b

    :cond_16
    :goto_a
    move v10, v0

    :goto_b
    if-eqz v10, :cond_17

    .line 101
    iget-object v0, v2, Lcom/bumptech/glide/load/engine/EngineJob;->diskCacheExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

    goto :goto_c

    .line 102
    :cond_17
    iget-boolean v0, v2, Lcom/bumptech/glide/load/engine/EngineJob;->useUnlimitedSourceGeneratorPool:Z

    if-eqz v0, :cond_18

    .line 103
    iget-object v0, v2, Lcom/bumptech/glide/load/engine/EngineJob;->sourceUnlimitedExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

    goto :goto_c

    :cond_18
    iget-boolean v0, v2, Lcom/bumptech/glide/load/engine/EngineJob;->useAnimationPool:Z

    if-eqz v0, :cond_19

    iget-object v0, v2, Lcom/bumptech/glide/load/engine/EngineJob;->animationExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

    goto :goto_c

    :cond_19
    iget-object v0, v2, Lcom/bumptech/glide/load/engine/EngineJob;->sourceExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

    .line 104
    :goto_c
    iget-object v0, v0, Lcom/bumptech/glide/load/engine/executor/GlideExecutor;->delegate:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, v4}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    if-eqz v24, :cond_1a

    const-string v0, "Started new load"

    move-wide/from16 v3, v18

    .line 105
    invoke-static {v0, v3, v4, v9}, Lcom/bumptech/glide/load/engine/Engine;->logWithTimeAndKey(Ljava/lang/String;JLcom/bumptech/glide/load/Key;)V

    .line 106
    :cond_1a
    new-instance v0, Lcom/bumptech/glide/load/engine/Engine$LoadStatus;

    invoke-direct {v0, v1, v2}, Lcom/bumptech/glide/load/engine/Engine$LoadStatus;-><init>(Lcom/bumptech/glide/request/ResourceCallback;Lcom/bumptech/glide/load/engine/EngineJob;)V

    .line 107
    :goto_d
    iput-object v0, v1, Lcom/bumptech/glide/request/SingleRequest;->loadStatus:Lcom/bumptech/glide/load/engine/Engine$LoadStatus;

    .line 108
    iget v0, v1, Lcom/bumptech/glide/request/SingleRequest;->status:I

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1b

    const/4 v0, 0x0

    .line 109
    iput-object v0, v1, Lcom/bumptech/glide/request/SingleRequest;->loadStatus:Lcom/bumptech/glide/load/engine/Engine$LoadStatus;

    :cond_1b
    if-eqz v16, :cond_1c

    .line 110
    iget-wide v2, v1, Lcom/bumptech/glide/request/SingleRequest;->startTime:J

    invoke-static {v2, v3}, Lcom/bumptech/glide/util/LogTime;->getElapsedMillis(J)D

    move-result-wide v2

    const/16 v0, 0x30

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v0, "finished onSizeReady in "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/bumptech/glide/request/SingleRequest;->logV(Ljava/lang/String;)V

    :cond_1c
    return-void

    :catchall_0
    move-exception v0

    .line 111
    monitor-exit v11

    throw v0
.end method

.method public recycle()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/bumptech/glide/request/SingleRequest;->assertNotCallingCallbacks()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->context:Landroid/content/Context;

    .line 3
    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->glideContext:Lcom/bumptech/glide/GlideContext;

    .line 4
    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->model:Ljava/lang/Object;

    .line 5
    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->transcodeClass:Ljava/lang/Class;

    .line 6
    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->requestOptions:Lcom/bumptech/glide/request/BaseRequestOptions;

    const/4 v1, -0x1

    .line 7
    iput v1, p0, Lcom/bumptech/glide/request/SingleRequest;->overrideWidth:I

    .line 8
    iput v1, p0, Lcom/bumptech/glide/request/SingleRequest;->overrideHeight:I

    .line 9
    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->target:Lcom/bumptech/glide/request/target/Target;

    .line 10
    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->requestListeners:Ljava/util/List;

    .line 11
    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->targetListener:Lcom/bumptech/glide/request/RequestListener;

    .line 12
    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->requestCoordinator:Lcom/bumptech/glide/request/RequestCoordinator;

    .line 13
    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->animationFactory:Lcom/bumptech/glide/request/transition/TransitionFactory;

    .line 14
    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->loadStatus:Lcom/bumptech/glide/load/engine/Engine$LoadStatus;

    .line 15
    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->errorDrawable:Landroid/graphics/drawable/Drawable;

    .line 16
    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    .line 17
    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->fallbackDrawable:Landroid/graphics/drawable/Drawable;

    .line 18
    iput v1, p0, Lcom/bumptech/glide/request/SingleRequest;->width:I

    .line 19
    iput v1, p0, Lcom/bumptech/glide/request/SingleRequest;->height:I

    .line 20
    sget-object v0, Lcom/bumptech/glide/request/SingleRequest;->POOL:Landroidx/core/util/Pools$Pool;

    check-cast v0, Lcom/bumptech/glide/util/pool/FactoryPools$FactoryPool;

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/util/pool/FactoryPools$FactoryPool;->release(Ljava/lang/Object;)Z

    return-void
.end method

.method public final releaseResource(Lcom/bumptech/glide/load/engine/Resource;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "resource"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/Resource<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->engine:Lcom/bumptech/glide/load/engine/Engine;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-static {}, Lcom/bumptech/glide/util/Util;->assertMainThread()V

    .line 3
    instance-of v0, p1, Lcom/bumptech/glide/load/engine/EngineResource;

    if-eqz v0, :cond_0

    .line 4
    check-cast p1, Lcom/bumptech/glide/load/engine/EngineResource;

    invoke-virtual {p1}, Lcom/bumptech/glide/load/engine/EngineResource;->release()V

    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/bumptech/glide/request/SingleRequest;->resource:Lcom/bumptech/glide/load/engine/Resource;

    return-void

    .line 6
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Cannot release anything but an EngineResource"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final setErrorPlaceholder()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->requestCoordinator:Lcom/bumptech/glide/request/RequestCoordinator;

    if-eqz v0, :cond_1

    invoke-interface {v0, p0}, Lcom/bumptech/glide/request/RequestCoordinator;->canNotifyStatusChanged(Lcom/bumptech/glide/request/Request;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    if-nez v0, :cond_2

    return-void

    :cond_2
    const/4 v0, 0x0

    .line 2
    iget-object v1, p0, Lcom/bumptech/glide/request/SingleRequest;->model:Ljava/lang/Object;

    if-nez v1, :cond_3

    .line 3
    invoke-virtual {p0}, Lcom/bumptech/glide/request/SingleRequest;->getFallbackDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :cond_3
    if-nez v0, :cond_5

    .line 4
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->errorDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_4

    .line 5
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->requestOptions:Lcom/bumptech/glide/request/BaseRequestOptions;

    .line 6
    iget-object v1, v0, Lcom/bumptech/glide/request/BaseRequestOptions;->errorPlaceholder:Landroid/graphics/drawable/Drawable;

    .line 7
    iput-object v1, p0, Lcom/bumptech/glide/request/SingleRequest;->errorDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v1, :cond_4

    .line 8
    iget v0, v0, Lcom/bumptech/glide/request/BaseRequestOptions;->errorId:I

    if-lez v0, :cond_4

    .line 9
    invoke-virtual {p0, v0}, Lcom/bumptech/glide/request/SingleRequest;->loadDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->errorDrawable:Landroid/graphics/drawable/Drawable;

    .line 10
    :cond_4
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->errorDrawable:Landroid/graphics/drawable/Drawable;

    :cond_5
    if-nez v0, :cond_6

    .line 11
    invoke-virtual {p0}, Lcom/bumptech/glide/request/SingleRequest;->getPlaceholderDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 12
    :cond_6
    iget-object p0, p0, Lcom/bumptech/glide/request/SingleRequest;->target:Lcom/bumptech/glide/request/target/Target;

    invoke-interface {p0, v0}, Lcom/bumptech/glide/request/target/Target;->onLoadFailed(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
