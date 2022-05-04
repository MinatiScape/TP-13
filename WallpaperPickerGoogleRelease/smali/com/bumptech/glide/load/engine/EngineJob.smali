.class public Lcom/bumptech/glide/load/engine/EngineJob;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/engine/DecodeJob$Callback;
.implements Lcom/bumptech/glide/util/pool/FactoryPools$Poolable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/engine/EngineJob$MainThreadCallback;,
        Lcom/bumptech/glide/load/engine/EngineJob$EngineResourceFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/engine/DecodeJob$Callback<",
        "TR;>;",
        "Lcom/bumptech/glide/util/pool/FactoryPools$Poolable;"
    }
.end annotation


# static fields
.field public static final DEFAULT_FACTORY:Lcom/bumptech/glide/load/engine/EngineJob$EngineResourceFactory;

.field public static final MAIN_THREAD_HANDLER:Landroid/os/Handler;


# instance fields
.field public final animationExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

.field public final cbs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/request/ResourceCallback;",
            ">;"
        }
    .end annotation
.end field

.field public dataSource:Lcom/bumptech/glide/load/DataSource;

.field public decodeJob:Lcom/bumptech/glide/load/engine/DecodeJob;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/DecodeJob<",
            "TR;>;"
        }
    .end annotation
.end field

.field public final diskCacheExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

.field public engineResource:Lcom/bumptech/glide/load/engine/EngineResource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/EngineResource<",
            "*>;"
        }
    .end annotation
.end field

.field public final engineResourceFactory:Lcom/bumptech/glide/load/engine/EngineJob$EngineResourceFactory;

.field public exception:Lcom/bumptech/glide/load/engine/GlideException;

.field public hasLoadFailed:Z

.field public hasResource:Z

.field public ignoredCallbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/request/ResourceCallback;",
            ">;"
        }
    .end annotation
.end field

.field public isCacheable:Z

.field public volatile isCancelled:Z

.field public key:Lcom/bumptech/glide/load/Key;

.field public final listener:Lcom/bumptech/glide/load/engine/EngineJobListener;

.field public onlyRetrieveFromCache:Z

.field public final pool:Landroidx/core/util/Pools$Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Pools$Pool<",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "*>;>;"
        }
    .end annotation
.end field

.field public resource:Lcom/bumptech/glide/load/engine/Resource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/Resource<",
            "*>;"
        }
    .end annotation
.end field

.field public final sourceExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

.field public final sourceUnlimitedExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

.field public final stateVerifier:Lcom/bumptech/glide/util/pool/StateVerifier;

.field public useAnimationPool:Z

.field public useUnlimitedSourceGeneratorPool:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/bumptech/glide/load/engine/EngineJob$EngineResourceFactory;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/EngineJob$EngineResourceFactory;-><init>()V

    sput-object v0, Lcom/bumptech/glide/load/engine/EngineJob;->DEFAULT_FACTORY:Lcom/bumptech/glide/load/engine/EngineJob$EngineResourceFactory;

    .line 2
    new-instance v0, Landroid/os/Handler;

    .line 3
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    new-instance v2, Lcom/bumptech/glide/load/engine/EngineJob$MainThreadCallback;

    invoke-direct {v2}, Lcom/bumptech/glide/load/engine/EngineJob$MainThreadCallback;-><init>()V

    invoke-direct {v0, v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    sput-object v0, Lcom/bumptech/glide/load/engine/EngineJob;->MAIN_THREAD_HANDLER:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>(Lcom/bumptech/glide/load/engine/executor/GlideExecutor;Lcom/bumptech/glide/load/engine/executor/GlideExecutor;Lcom/bumptech/glide/load/engine/executor/GlideExecutor;Lcom/bumptech/glide/load/engine/executor/GlideExecutor;Lcom/bumptech/glide/load/engine/EngineJobListener;Landroidx/core/util/Pools$Pool;Lcom/bumptech/glide/load/engine/EngineJob$EngineResourceFactory;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "diskCacheExecutor",
            "sourceExecutor",
            "sourceUnlimitedExecutor",
            "animationExecutor",
            "listener",
            "pool",
            "engineResourceFactory"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/executor/GlideExecutor;",
            "Lcom/bumptech/glide/load/engine/executor/GlideExecutor;",
            "Lcom/bumptech/glide/load/engine/executor/GlideExecutor;",
            "Lcom/bumptech/glide/load/engine/executor/GlideExecutor;",
            "Lcom/bumptech/glide/load/engine/EngineJobListener;",
            "Landroidx/core/util/Pools$Pool<",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "*>;>;",
            "Lcom/bumptech/glide/load/engine/EngineJob$EngineResourceFactory;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->cbs:Ljava/util/List;

    .line 3
    new-instance v0, Lcom/bumptech/glide/util/pool/StateVerifier$DefaultStateVerifier;

    invoke-direct {v0}, Lcom/bumptech/glide/util/pool/StateVerifier$DefaultStateVerifier;-><init>()V

    .line 4
    iput-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->stateVerifier:Lcom/bumptech/glide/util/pool/StateVerifier;

    .line 5
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->diskCacheExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

    .line 6
    iput-object p2, p0, Lcom/bumptech/glide/load/engine/EngineJob;->sourceExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

    .line 7
    iput-object p3, p0, Lcom/bumptech/glide/load/engine/EngineJob;->sourceUnlimitedExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

    .line 8
    iput-object p4, p0, Lcom/bumptech/glide/load/engine/EngineJob;->animationExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

    .line 9
    iput-object p5, p0, Lcom/bumptech/glide/load/engine/EngineJob;->listener:Lcom/bumptech/glide/load/engine/EngineJobListener;

    .line 10
    iput-object p6, p0, Lcom/bumptech/glide/load/engine/EngineJob;->pool:Landroidx/core/util/Pools$Pool;

    .line 11
    iput-object p7, p0, Lcom/bumptech/glide/load/engine/EngineJob;->engineResourceFactory:Lcom/bumptech/glide/load/engine/EngineJob$EngineResourceFactory;

    return-void
.end method


# virtual methods
.method public addCallback(Lcom/bumptech/glide/request/ResourceCallback;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "cb"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/bumptech/glide/util/Util;->assertMainThread()V

    .line 2
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->stateVerifier:Lcom/bumptech/glide/util/pool/StateVerifier;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/pool/StateVerifier;->throwIfRecycled()V

    .line 3
    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->hasResource:Z

    if-eqz v0, :cond_0

    .line 4
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->engineResource:Lcom/bumptech/glide/load/engine/EngineResource;

    iget-object p0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->dataSource:Lcom/bumptech/glide/load/DataSource;

    invoke-interface {p1, v0, p0}, Lcom/bumptech/glide/request/ResourceCallback;->onResourceReady(Lcom/bumptech/glide/load/engine/Resource;Lcom/bumptech/glide/load/DataSource;)V

    goto :goto_0

    .line 5
    :cond_0
    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->hasLoadFailed:Z

    if-eqz v0, :cond_1

    .line 6
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->exception:Lcom/bumptech/glide/load/engine/GlideException;

    invoke-interface {p1, p0}, Lcom/bumptech/glide/request/ResourceCallback;->onLoadFailed(Lcom/bumptech/glide/load/engine/GlideException;)V

    goto :goto_0

    .line 7
    :cond_1
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->cbs:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_0
    return-void
.end method

.method public getVerifier()Lcom/bumptech/glide/util/pool/StateVerifier;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->stateVerifier:Lcom/bumptech/glide/util/pool/StateVerifier;

    return-object p0
.end method

.method public init(Lcom/bumptech/glide/load/Key;ZZZZ)Lcom/bumptech/glide/load/engine/EngineJob;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "key",
            "isCacheable",
            "useUnlimitedSourceGeneratorPool",
            "useAnimationPool",
            "onlyRetrieveFromCache"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/Key;",
            "ZZZZ)",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "TR;>;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->key:Lcom/bumptech/glide/load/Key;

    .line 2
    iput-boolean p2, p0, Lcom/bumptech/glide/load/engine/EngineJob;->isCacheable:Z

    .line 3
    iput-boolean p3, p0, Lcom/bumptech/glide/load/engine/EngineJob;->useUnlimitedSourceGeneratorPool:Z

    .line 4
    iput-boolean p4, p0, Lcom/bumptech/glide/load/engine/EngineJob;->useAnimationPool:Z

    .line 5
    iput-boolean p5, p0, Lcom/bumptech/glide/load/engine/EngineJob;->onlyRetrieveFromCache:Z

    return-object p0
.end method

.method public final release(Z)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "isRemovedFromQueue"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/bumptech/glide/util/Util;->assertMainThread()V

    .line 2
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->cbs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->key:Lcom/bumptech/glide/load/Key;

    .line 4
    iput-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->engineResource:Lcom/bumptech/glide/load/engine/EngineResource;

    .line 5
    iput-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->resource:Lcom/bumptech/glide/load/engine/Resource;

    .line 6
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->ignoredCallbacks:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 7
    invoke-interface {v1}, Ljava/util/List;->clear()V

    :cond_0
    const/4 v1, 0x0

    .line 8
    iput-boolean v1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->hasLoadFailed:Z

    .line 9
    iput-boolean v1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->isCancelled:Z

    .line 10
    iput-boolean v1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->hasResource:Z

    .line 11
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->decodeJob:Lcom/bumptech/glide/load/engine/DecodeJob;

    .line 12
    iget-object v2, v1, Lcom/bumptech/glide/load/engine/DecodeJob;->releaseManager:Lcom/bumptech/glide/load/engine/DecodeJob$ReleaseManager;

    .line 13
    monitor-enter v2

    const/4 v3, 0x1

    .line 14
    :try_start_0
    iput-boolean v3, v2, Lcom/bumptech/glide/load/engine/DecodeJob$ReleaseManager;->isReleased:Z

    .line 15
    invoke-virtual {v2, p1}, Lcom/bumptech/glide/load/engine/DecodeJob$ReleaseManager;->isComplete(Z)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v2

    if-eqz p1, :cond_1

    .line 16
    invoke-virtual {v1}, Lcom/bumptech/glide/load/engine/DecodeJob;->releaseInternal()V

    .line 17
    :cond_1
    iput-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->decodeJob:Lcom/bumptech/glide/load/engine/DecodeJob;

    .line 18
    iput-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->exception:Lcom/bumptech/glide/load/engine/GlideException;

    .line 19
    iput-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->dataSource:Lcom/bumptech/glide/load/DataSource;

    .line 20
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->pool:Landroidx/core/util/Pools$Pool;

    invoke-interface {p1, p0}, Landroidx/core/util/Pools$Pool;->release(Ljava/lang/Object;)Z

    return-void

    :catchall_0
    move-exception p0

    .line 21
    monitor-exit v2

    throw p0
.end method

.method public reschedule(Lcom/bumptech/glide/load/engine/DecodeJob;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "job"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/DecodeJob<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->useUnlimitedSourceGeneratorPool:Z

    if-eqz v0, :cond_0

    .line 2
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->sourceUnlimitedExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

    goto :goto_0

    :cond_0
    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->useAnimationPool:Z

    if-eqz v0, :cond_1

    iget-object p0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->animationExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

    goto :goto_0

    :cond_1
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->sourceExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

    .line 3
    :goto_0
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/executor/GlideExecutor;->delegate:Ljava/util/concurrent/ExecutorService;

    invoke-interface {p0, p1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
