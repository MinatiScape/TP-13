.class public Lcom/bumptech/glide/load/engine/DecodeJob;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/engine/DataFetcherGenerator$FetcherReadyCallback;
.implements Ljava/lang/Runnable;
.implements Ljava/lang/Comparable;
.implements Lcom/bumptech/glide/util/pool/FactoryPools$Poolable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/engine/DecodeJob$DiskCacheProvider;,
        Lcom/bumptech/glide/load/engine/DecodeJob$Callback;,
        Lcom/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager;,
        Lcom/bumptech/glide/load/engine/DecodeJob$ReleaseManager;,
        Lcom/bumptech/glide/load/engine/DecodeJob$DecodeCallback;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/engine/DataFetcherGenerator$FetcherReadyCallback;",
        "Ljava/lang/Runnable;",
        "Ljava/lang/Comparable<",
        "Lcom/bumptech/glide/load/engine/DecodeJob<",
        "*>;>;",
        "Lcom/bumptech/glide/util/pool/FactoryPools$Poolable;"
    }
.end annotation


# instance fields
.field public callback:Lcom/bumptech/glide/load/engine/DecodeJob$Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/DecodeJob$Callback<",
            "TR;>;"
        }
    .end annotation
.end field

.field public currentAttemptingKey:Lcom/bumptech/glide/load/Key;

.field public currentData:Ljava/lang/Object;

.field public currentDataSource:Lcom/bumptech/glide/load/DataSource;

.field public currentFetcher:Lcom/bumptech/glide/load/data/DataFetcher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/data/DataFetcher<",
            "*>;"
        }
    .end annotation
.end field

.field public volatile currentGenerator:Lcom/bumptech/glide/load/engine/DataFetcherGenerator;

.field public currentSourceKey:Lcom/bumptech/glide/load/Key;

.field public currentThread:Ljava/lang/Thread;

.field public final decodeHelper:Lcom/bumptech/glide/load/engine/DecodeHelper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/DecodeHelper<",
            "TR;>;"
        }
    .end annotation
.end field

.field public final deferredEncodeManager:Lcom/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager<",
            "*>;"
        }
    .end annotation
.end field

.field public final diskCacheProvider:Lcom/bumptech/glide/load/engine/DecodeJob$DiskCacheProvider;

.field public diskCacheStrategy:Lcom/bumptech/glide/load/engine/DiskCacheStrategy;

.field public glideContext:Lcom/bumptech/glide/GlideContext;

.field public height:I

.field public volatile isCallbackNotified:Z

.field public volatile isCancelled:Z

.field public loadKey:Lcom/bumptech/glide/load/engine/EngineKey;

.field public model:Ljava/lang/Object;

.field public onlyRetrieveFromCache:Z

.field public options:Lcom/bumptech/glide/load/Options;

.field public order:I

.field public final pool:Landroidx/core/util/Pools$Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Pools$Pool<",
            "Lcom/bumptech/glide/load/engine/DecodeJob<",
            "*>;>;"
        }
    .end annotation
.end field

.field public priority:Lcom/bumptech/glide/Priority;

.field public final releaseManager:Lcom/bumptech/glide/load/engine/DecodeJob$ReleaseManager;

.field public runReason:I

.field public signature:Lcom/bumptech/glide/load/Key;

.field public stage:I

.field public startFetchTime:J

.field public final stateVerifier:Lcom/bumptech/glide/util/pool/StateVerifier;

.field public final throwables:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field public width:I


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/load/engine/DecodeJob$DiskCacheProvider;Landroidx/core/util/Pools$Pool;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "diskCacheProvider",
            "pool"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/DecodeJob$DiskCacheProvider;",
            "Landroidx/core/util/Pools$Pool<",
            "Lcom/bumptech/glide/load/engine/DecodeJob<",
            "*>;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Lcom/bumptech/glide/load/engine/DecodeHelper;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/DecodeHelper;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->decodeHelper:Lcom/bumptech/glide/load/engine/DecodeHelper;

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->throwables:Ljava/util/List;

    .line 4
    new-instance v0, Lcom/bumptech/glide/util/pool/StateVerifier$DefaultStateVerifier;

    invoke-direct {v0}, Lcom/bumptech/glide/util/pool/StateVerifier$DefaultStateVerifier;-><init>()V

    .line 5
    iput-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->stateVerifier:Lcom/bumptech/glide/util/pool/StateVerifier;

    .line 6
    new-instance v0, Lcom/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->deferredEncodeManager:Lcom/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager;

    .line 7
    new-instance v0, Lcom/bumptech/glide/load/engine/DecodeJob$ReleaseManager;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/DecodeJob$ReleaseManager;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->releaseManager:Lcom/bumptech/glide/load/engine/DecodeJob$ReleaseManager;

    .line 8
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->diskCacheProvider:Lcom/bumptech/glide/load/engine/DecodeJob$DiskCacheProvider;

    .line 9
    iput-object p2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->pool:Landroidx/core/util/Pools$Pool;

    return-void
.end method


# virtual methods
.method public compareTo(Ljava/lang/Object;)I
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "other"
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/bumptech/glide/load/engine/DecodeJob;

    .line 2
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->priority:Lcom/bumptech/glide/Priority;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    iget-object v1, p1, Lcom/bumptech/glide/load/engine/DecodeJob;->priority:Lcom/bumptech/glide/Priority;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    sub-int/2addr v0, v1

    if-nez v0, :cond_0

    .line 3
    iget p0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->order:I

    iget p1, p1, Lcom/bumptech/glide/load/engine/DecodeJob;->order:I

    sub-int v0, p0, p1

    :cond_0
    return v0
.end method

.method public final decodeFromData(Lcom/bumptech/glide/load/data/DataFetcher;Ljava/lang/Object;Lcom/bumptech/glide/load/DataSource;)Lcom/bumptech/glide/load/engine/Resource;
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "fetcher",
            "data",
            "dataSource"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Data:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/bumptech/glide/load/data/DataFetcher<",
            "*>;TData;",
            "Lcom/bumptech/glide/load/DataSource;",
            ")",
            "Lcom/bumptech/glide/load/engine/Resource<",
            "TR;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/bumptech/glide/load/engine/GlideException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 1
    invoke-interface {p1}, Lcom/bumptech/glide/load/data/DataFetcher;->cleanup()V

    return-object v0

    .line 2
    :cond_0
    :try_start_0
    sget v1, Lcom/bumptech/glide/util/LogTime;->$r8$clinit:I

    .line 3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtimeNanos()J

    move-result-wide v1

    .line 4
    invoke-virtual {p0, p2, p3}, Lcom/bumptech/glide/load/engine/DecodeJob;->decodeFromFetcher(Ljava/lang/Object;Lcom/bumptech/glide/load/DataSource;)Lcom/bumptech/glide/load/engine/Resource;

    move-result-object p2

    const-string p3, "DecodeJob"

    const/4 v3, 0x2

    .line 5
    invoke-static {p3, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p3

    if-eqz p3, :cond_1

    .line 6
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0xf

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v3, "Decoded result "

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 7
    invoke-virtual {p0, p3, v1, v2, v0}, Lcom/bumptech/glide/load/engine/DecodeJob;->logWithTimeAndKey(Ljava/lang/String;JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    :cond_1
    invoke-interface {p1}, Lcom/bumptech/glide/load/data/DataFetcher;->cleanup()V

    return-object p2

    :catchall_0
    move-exception p0

    invoke-interface {p1}, Lcom/bumptech/glide/load/data/DataFetcher;->cleanup()V

    throw p0
.end method

.method public final decodeFromFetcher(Ljava/lang/Object;Lcom/bumptech/glide/load/DataSource;)Lcom/bumptech/glide/load/engine/Resource;
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "data",
            "dataSource"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Data:",
            "Ljava/lang/Object;",
            ">(TData;",
            "Lcom/bumptech/glide/load/DataSource;",
            ")",
            "Lcom/bumptech/glide/load/engine/Resource<",
            "TR;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/bumptech/glide/load/engine/GlideException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->decodeHelper:Lcom/bumptech/glide/load/engine/DecodeHelper;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/load/engine/DecodeHelper;->getLoadPath(Ljava/lang/Class;)Lcom/bumptech/glide/load/engine/LoadPath;

    move-result-object v2

    .line 2
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->options:Lcom/bumptech/glide/load/Options;

    .line 3
    sget-object v1, Lcom/bumptech/glide/load/DataSource;->RESOURCE_DISK_CACHE:Lcom/bumptech/glide/load/DataSource;

    if-eq p2, v1, :cond_1

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->decodeHelper:Lcom/bumptech/glide/load/engine/DecodeHelper;

    .line 4
    iget-boolean v1, v1, Lcom/bumptech/glide/load/engine/DecodeHelper;->isScaleOnlyOrNoTransform:Z

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    .line 5
    :goto_1
    sget-object v3, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->ALLOW_HARDWARE_CONFIG:Lcom/bumptech/glide/load/Option;

    invoke-virtual {v0, v3}, Lcom/bumptech/glide/load/Options;->get(Lcom/bumptech/glide/load/Option;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    if-eqz v4, :cond_2

    .line 6
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_3

    if-eqz v1, :cond_2

    goto :goto_2

    .line 7
    :cond_2
    new-instance v0, Lcom/bumptech/glide/load/Options;

    invoke-direct {v0}, Lcom/bumptech/glide/load/Options;-><init>()V

    .line 8
    iget-object v4, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->options:Lcom/bumptech/glide/load/Options;

    invoke-virtual {v0, v4}, Lcom/bumptech/glide/load/Options;->putAll(Lcom/bumptech/glide/load/Options;)V

    .line 9
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 10
    iget-object v4, v0, Lcom/bumptech/glide/load/Options;->values:Landroidx/collection/ArrayMap;

    invoke-virtual {v4, v3, v1}, Landroidx/collection/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    :goto_2
    move-object v4, v0

    .line 11
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->glideContext:Lcom/bumptech/glide/GlideContext;

    .line 12
    iget-object v0, v0, Lcom/bumptech/glide/GlideContext;->registry:Lcom/bumptech/glide/Registry;

    .line 13
    iget-object v0, v0, Lcom/bumptech/glide/Registry;->dataRewinderRegistry:Lcom/bumptech/glide/load/data/DataRewinderRegistry;

    .line 14
    monitor-enter v0

    .line 15
    :try_start_0
    iget-object v1, v0, Lcom/bumptech/glide/load/data/DataRewinderRegistry;->rewinders:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/load/data/DataRewinder$Factory;

    if-nez v1, :cond_5

    .line 16
    iget-object v3, v0, Lcom/bumptech/glide/load/data/DataRewinderRegistry;->rewinders:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_4
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/bumptech/glide/load/data/DataRewinder$Factory;

    .line 17
    invoke-interface {v5}, Lcom/bumptech/glide/load/data/DataRewinder$Factory;->getDataClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_4

    move-object v1, v5

    :cond_5
    if-nez v1, :cond_6

    .line 18
    sget-object v1, Lcom/bumptech/glide/load/data/DataRewinderRegistry;->DEFAULT_FACTORY:Lcom/bumptech/glide/load/data/DataRewinder$Factory;

    .line 19
    :cond_6
    invoke-interface {v1, p1}, Lcom/bumptech/glide/load/data/DataRewinder$Factory;->build(Ljava/lang/Object;)Lcom/bumptech/glide/load/data/DataRewinder;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    monitor-exit v0

    .line 20
    :try_start_1
    iget v5, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->width:I

    iget v6, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->height:I

    new-instance v7, Lcom/bumptech/glide/load/engine/DecodeJob$DecodeCallback;

    invoke-direct {v7, p0, p2}, Lcom/bumptech/glide/load/engine/DecodeJob$DecodeCallback;-><init>(Lcom/bumptech/glide/load/engine/DecodeJob;Lcom/bumptech/glide/load/DataSource;)V

    move-object v3, p1

    invoke-virtual/range {v2 .. v7}, Lcom/bumptech/glide/load/engine/LoadPath;->load(Lcom/bumptech/glide/load/data/DataRewinder;Lcom/bumptech/glide/load/Options;IILcom/bumptech/glide/load/engine/DecodePath$DecodeCallback;)Lcom/bumptech/glide/load/engine/Resource;

    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    invoke-interface {p1}, Lcom/bumptech/glide/load/data/DataRewinder;->cleanup()V

    return-object p0

    :catchall_0
    move-exception p0

    invoke-interface {p1}, Lcom/bumptech/glide/load/data/DataRewinder;->cleanup()V

    throw p0

    :catchall_1
    move-exception p0

    .line 22
    monitor-exit v0

    throw p0
.end method

.method public final decodeFromRetrievedData()V
    .locals 10

    const-string v0, "DecodeJob"

    const/4 v1, 0x2

    .line 1
    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "Retrieved data"

    .line 2
    iget-wide v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->startFetchTime:J

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentData:Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentSourceKey:Lcom/bumptech/glide/load/Key;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentFetcher:Lcom/bumptech/glide/load/data/DataFetcher;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, 0x1e

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    add-int/2addr v7, v6

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v6, v7

    const-string v7, "data: "

    const-string v8, ", cache key: "

    invoke-static {v6, v7, v3, v8, v4}, Landroidx/recyclerview/R$attr$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", fetcher: "

    invoke-static {v3, v4, v5}, Landroid/support/v4/app/FragmentTabHost$SavedState$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/bumptech/glide/load/engine/DecodeJob;->logWithTimeAndKey(Ljava/lang/String;JLjava/lang/String;)V

    :cond_0
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentFetcher:Lcom/bumptech/glide/load/data/DataFetcher;

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentData:Ljava/lang/Object;

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentDataSource:Lcom/bumptech/glide/load/DataSource;

    invoke-virtual {p0, v1, v2, v3}, Lcom/bumptech/glide/load/engine/DecodeJob;->decodeFromData(Lcom/bumptech/glide/load/data/DataFetcher;Ljava/lang/Object;Lcom/bumptech/glide/load/DataSource;)Lcom/bumptech/glide/load/engine/Resource;

    move-result-object v1
    :try_end_0
    .catch Lcom/bumptech/glide/load/engine/GlideException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 4
    iget-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentAttemptingKey:Lcom/bumptech/glide/load/Key;

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentDataSource:Lcom/bumptech/glide/load/DataSource;

    invoke-virtual {v1, v2, v3}, Lcom/bumptech/glide/load/engine/GlideException;->setLoggingDetails(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/DataSource;)V

    .line 5
    iget-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->throwables:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object v1, v0

    :goto_0
    if-eqz v1, :cond_8

    .line 6
    iget-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentDataSource:Lcom/bumptech/glide/load/DataSource;

    .line 7
    instance-of v3, v1, Lcom/bumptech/glide/load/engine/Initializable;

    if-eqz v3, :cond_1

    .line 8
    move-object v3, v1

    check-cast v3, Lcom/bumptech/glide/load/engine/Initializable;

    invoke-interface {v3}, Lcom/bumptech/glide/load/engine/Initializable;->initialize()V

    .line 9
    :cond_1
    iget-object v3, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->deferredEncodeManager:Lcom/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager;

    .line 10
    iget-object v3, v3, Lcom/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager;->toEncode:Lcom/bumptech/glide/load/engine/LockedResource;

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v3, :cond_2

    move v3, v5

    goto :goto_1

    :cond_2
    move v3, v4

    :goto_1
    if-eqz v3, :cond_3

    .line 11
    invoke-static {v1}, Lcom/bumptech/glide/load/engine/LockedResource;->obtain(Lcom/bumptech/glide/load/engine/Resource;)Lcom/bumptech/glide/load/engine/LockedResource;

    move-result-object v0

    move-object v1, v0

    .line 12
    :cond_3
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->setNotifiedOrThrow()V

    .line 13
    iget-object v3, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->callback:Lcom/bumptech/glide/load/engine/DecodeJob$Callback;

    check-cast v3, Lcom/bumptech/glide/load/engine/EngineJob;

    .line 14
    iput-object v1, v3, Lcom/bumptech/glide/load/engine/EngineJob;->resource:Lcom/bumptech/glide/load/engine/Resource;

    .line 15
    iput-object v2, v3, Lcom/bumptech/glide/load/engine/EngineJob;->dataSource:Lcom/bumptech/glide/load/DataSource;

    .line 16
    sget-object v1, Lcom/bumptech/glide/load/engine/EngineJob;->MAIN_THREAD_HANDLER:Landroid/os/Handler;

    invoke-virtual {v1, v5, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    const/4 v1, 0x5

    .line 17
    iput v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->stage:I

    .line 18
    :try_start_1
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->deferredEncodeManager:Lcom/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager;

    .line 19
    iget-object v2, v1, Lcom/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager;->toEncode:Lcom/bumptech/glide/load/engine/LockedResource;

    if-eqz v2, :cond_4

    move v2, v5

    goto :goto_2

    :cond_4
    move v2, v4

    :goto_2
    if-eqz v2, :cond_5

    .line 20
    iget-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->diskCacheProvider:Lcom/bumptech/glide/load/engine/DecodeJob$DiskCacheProvider;

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->options:Lcom/bumptech/glide/load/Options;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 21
    :try_start_2
    check-cast v2, Lcom/bumptech/glide/load/engine/Engine$LazyDiskCacheProvider;

    invoke-virtual {v2}, Lcom/bumptech/glide/load/engine/Engine$LazyDiskCacheProvider;->getDiskCache()Lcom/bumptech/glide/load/engine/cache/DiskCache;

    move-result-object v2

    iget-object v6, v1, Lcom/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager;->key:Lcom/bumptech/glide/load/Key;

    new-instance v7, Lcom/bumptech/glide/load/engine/DataCacheWriter;

    iget-object v8, v1, Lcom/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager;->encoder:Lcom/bumptech/glide/load/ResourceEncoder;

    iget-object v9, v1, Lcom/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager;->toEncode:Lcom/bumptech/glide/load/engine/LockedResource;

    invoke-direct {v7, v8, v9, v3}, Lcom/bumptech/glide/load/engine/DataCacheWriter;-><init>(Lcom/bumptech/glide/load/Encoder;Ljava/lang/Object;Lcom/bumptech/glide/load/Options;)V

    invoke-interface {v2, v6, v7}, Lcom/bumptech/glide/load/engine/cache/DiskCache;->put(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/cache/DiskCache$Writer;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 22
    :try_start_3
    iget-object v1, v1, Lcom/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager;->toEncode:Lcom/bumptech/glide/load/engine/LockedResource;

    invoke-virtual {v1}, Lcom/bumptech/glide/load/engine/LockedResource;->unlock()V

    goto :goto_3

    :catchall_0
    move-exception p0

    iget-object v1, v1, Lcom/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager;->toEncode:Lcom/bumptech/glide/load/engine/LockedResource;

    invoke-virtual {v1}, Lcom/bumptech/glide/load/engine/LockedResource;->unlock()V

    .line 23
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :cond_5
    :goto_3
    if-eqz v0, :cond_6

    .line 24
    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/LockedResource;->unlock()V

    .line 25
    :cond_6
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->releaseManager:Lcom/bumptech/glide/load/engine/DecodeJob$ReleaseManager;

    .line 26
    monitor-enter v0

    .line 27
    :try_start_4
    iput-boolean v5, v0, Lcom/bumptech/glide/load/engine/DecodeJob$ReleaseManager;->isEncodeComplete:Z

    .line 28
    invoke-virtual {v0, v4}, Lcom/bumptech/glide/load/engine/DecodeJob$ReleaseManager;->isComplete(Z)Z

    move-result v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    monitor-exit v0

    if-eqz v1, :cond_9

    .line 29
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->releaseInternal()V

    goto :goto_4

    :catchall_1
    move-exception p0

    .line 30
    monitor-exit v0

    throw p0

    :catchall_2
    move-exception p0

    if-eqz v0, :cond_7

    .line 31
    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/LockedResource;->unlock()V

    :cond_7
    throw p0

    .line 32
    :cond_8
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->runGenerators()V

    :cond_9
    :goto_4
    return-void
.end method

.method public final getNextGenerator()Lcom/bumptech/glide/load/engine/DataFetcherGenerator;
    .locals 3

    .line 1
    iget v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->stage:I

    invoke-static {v0}, Landroidx/constraintlayout/solver/SolverVariable$Type$r8$EnumUnboxingUtility;->$enumboxing$ordinal(I)I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 2
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    iget p0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->stage:I

    invoke-static {p0}, Landroidx/constraintlayout/solver/SolverVariable$Type$r8$EnumUnboxingUtility;->string$valueOf$com$bumptech$glide$load$engine$DecodeJob$Stage(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x14

    const-string v2, "Unrecognized stage: "

    invoke-static {v1, v2, p0}, Lcom/bumptech/glide/Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3
    :cond_1
    new-instance v0, Lcom/bumptech/glide/load/engine/SourceGenerator;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->decodeHelper:Lcom/bumptech/glide/load/engine/DecodeHelper;

    invoke-direct {v0, v1, p0}, Lcom/bumptech/glide/load/engine/SourceGenerator;-><init>(Lcom/bumptech/glide/load/engine/DecodeHelper;Lcom/bumptech/glide/load/engine/DataFetcherGenerator$FetcherReadyCallback;)V

    return-object v0

    .line 4
    :cond_2
    new-instance v0, Lcom/bumptech/glide/load/engine/DataCacheGenerator;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->decodeHelper:Lcom/bumptech/glide/load/engine/DecodeHelper;

    invoke-direct {v0, v1, p0}, Lcom/bumptech/glide/load/engine/DataCacheGenerator;-><init>(Lcom/bumptech/glide/load/engine/DecodeHelper;Lcom/bumptech/glide/load/engine/DataFetcherGenerator$FetcherReadyCallback;)V

    return-object v0

    .line 5
    :cond_3
    new-instance v0, Lcom/bumptech/glide/load/engine/ResourceCacheGenerator;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->decodeHelper:Lcom/bumptech/glide/load/engine/DecodeHelper;

    invoke-direct {v0, v1, p0}, Lcom/bumptech/glide/load/engine/ResourceCacheGenerator;-><init>(Lcom/bumptech/glide/load/engine/DecodeHelper;Lcom/bumptech/glide/load/engine/DataFetcherGenerator$FetcherReadyCallback;)V

    return-object v0
.end method

.method public final getNextStage$enumunboxing$(I)I
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "current"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroidx/constraintlayout/solver/SolverVariable$Type$r8$EnumUnboxingUtility;->$enumboxing$ordinal(I)I

    move-result v0

    const/4 v1, 0x2

    if-eqz v0, :cond_6

    const/4 v2, 0x1

    const/4 v3, 0x3

    if-eq v0, v2, :cond_4

    const/4 v2, 0x6

    if-eq v0, v1, :cond_2

    if-eq v0, v3, :cond_1

    const/4 p0, 0x5

    if-ne v0, p0, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Landroidx/constraintlayout/solver/SolverVariable$Type$r8$EnumUnboxingUtility;->string$valueOf$com$bumptech$glide$load$engine$DecodeJob$Stage(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x14

    const-string v1, "Unrecognized stage: "

    invoke-static {v0, v1, p1}, Lcom/bumptech/glide/Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    :goto_0
    return v2

    .line 3
    :cond_2
    iget-boolean p0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->onlyRetrieveFromCache:Z

    if-eqz p0, :cond_3

    goto :goto_1

    :cond_3
    const/4 v2, 0x4

    :goto_1
    return v2

    .line 4
    :cond_4
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->diskCacheStrategy:Lcom/bumptech/glide/load/engine/DiskCacheStrategy;

    invoke-virtual {p1}, Lcom/bumptech/glide/load/engine/DiskCacheStrategy;->decodeCachedData()Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_2

    .line 5
    :cond_5
    invoke-virtual {p0, v3}, Lcom/bumptech/glide/load/engine/DecodeJob;->getNextStage$enumunboxing$(I)I

    move-result v3

    :goto_2
    return v3

    .line 6
    :cond_6
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->diskCacheStrategy:Lcom/bumptech/glide/load/engine/DiskCacheStrategy;

    invoke-virtual {p1}, Lcom/bumptech/glide/load/engine/DiskCacheStrategy;->decodeCachedResource()Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_3

    .line 7
    :cond_7
    invoke-virtual {p0, v1}, Lcom/bumptech/glide/load/engine/DecodeJob;->getNextStage$enumunboxing$(I)I

    move-result v1

    :goto_3
    return v1
.end method

.method public getVerifier()Lcom/bumptech/glide/util/pool/StateVerifier;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->stateVerifier:Lcom/bumptech/glide/util/pool/StateVerifier;

    return-object p0
.end method

.method public final logWithTimeAndKey(Ljava/lang/String;JLjava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "message",
            "startTime",
            "extraArgs"
        }
    .end annotation

    .line 1
    invoke-static {p2, p3}, Lcom/bumptech/glide/util/LogTime;->getElapsedMillis(J)D

    move-result-wide p2

    iget-object p0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->loadKey:Lcom/bumptech/glide/load/engine/EngineKey;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    if-eqz p4, :cond_1

    const-string v0, ", "

    .line 2
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, p4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    goto :goto_0

    :cond_0
    new-instance p4, Ljava/lang/String;

    invoke-direct {p4, v0}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const-string p4, ""

    .line 3
    :goto_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x32

    invoke-static {p1, v1}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v1

    invoke-static {p4, v2}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v0, v1}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " in "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2, p3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string p1, ", load key: "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ", thread: "

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "DecodeJob"

    .line 4
    invoke-static {p1, p0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final notifyFailed()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->setNotifiedOrThrow()V

    .line 2
    new-instance v0, Lcom/bumptech/glide/load/engine/GlideException;

    const-string v1, "Failed to load resource"

    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->throwables:Ljava/util/List;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-direct {v0, v1, v2}, Lcom/bumptech/glide/load/engine/GlideException;-><init>(Ljava/lang/String;Ljava/util/List;)V

    .line 3
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->callback:Lcom/bumptech/glide/load/engine/DecodeJob$Callback;

    check-cast v1, Lcom/bumptech/glide/load/engine/EngineJob;

    .line 4
    iput-object v0, v1, Lcom/bumptech/glide/load/engine/EngineJob;->exception:Lcom/bumptech/glide/load/engine/GlideException;

    .line 5
    sget-object v0, Lcom/bumptech/glide/load/engine/EngineJob;->MAIN_THREAD_HANDLER:Landroid/os/Handler;

    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 6
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->releaseManager:Lcom/bumptech/glide/load/engine/DecodeJob$ReleaseManager;

    .line 7
    monitor-enter v0

    const/4 v1, 0x1

    .line 8
    :try_start_0
    iput-boolean v1, v0, Lcom/bumptech/glide/load/engine/DecodeJob$ReleaseManager;->isFailed:Z

    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1}, Lcom/bumptech/glide/load/engine/DecodeJob$ReleaseManager;->isComplete(Z)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    if-eqz v1, :cond_0

    .line 10
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->releaseInternal()V

    :cond_0
    return-void

    :catchall_0
    move-exception p0

    .line 11
    monitor-exit v0

    throw p0
.end method

.method public onDataFetcherFailed(Lcom/bumptech/glide/load/Key;Ljava/lang/Exception;Lcom/bumptech/glide/load/data/DataFetcher;Lcom/bumptech/glide/load/DataSource;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "attemptedKey",
            "e",
            "fetcher",
            "dataSource"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/Key;",
            "Ljava/lang/Exception;",
            "Lcom/bumptech/glide/load/data/DataFetcher<",
            "*>;",
            "Lcom/bumptech/glide/load/DataSource;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p3}, Lcom/bumptech/glide/load/data/DataFetcher;->cleanup()V

    .line 2
    new-instance v0, Lcom/bumptech/glide/load/engine/GlideException;

    const-string v1, "Fetching data failed"

    invoke-direct {v0, v1, p2}, Lcom/bumptech/glide/load/engine/GlideException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 3
    invoke-interface {p3}, Lcom/bumptech/glide/load/data/DataFetcher;->getDataClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {v0, p1, p4, p2}, Lcom/bumptech/glide/load/engine/GlideException;->setLoggingDetails(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/DataSource;Ljava/lang/Class;)V

    .line 4
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->throwables:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 5
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    iget-object p2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentThread:Ljava/lang/Thread;

    if-eq p1, p2, :cond_0

    const/4 p1, 0x2

    .line 6
    iput p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->runReason:I

    .line 7
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->callback:Lcom/bumptech/glide/load/engine/DecodeJob$Callback;

    check-cast p1, Lcom/bumptech/glide/load/engine/EngineJob;

    invoke-virtual {p1, p0}, Lcom/bumptech/glide/load/engine/EngineJob;->reschedule(Lcom/bumptech/glide/load/engine/DecodeJob;)V

    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->runGenerators()V

    :goto_0
    return-void
.end method

.method public onDataFetcherReady(Lcom/bumptech/glide/load/Key;Ljava/lang/Object;Lcom/bumptech/glide/load/data/DataFetcher;Lcom/bumptech/glide/load/DataSource;Lcom/bumptech/glide/load/Key;)V
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
            "sourceKey",
            "data",
            "fetcher",
            "dataSource",
            "attemptedKey"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/Key;",
            "Ljava/lang/Object;",
            "Lcom/bumptech/glide/load/data/DataFetcher<",
            "*>;",
            "Lcom/bumptech/glide/load/DataSource;",
            "Lcom/bumptech/glide/load/Key;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentSourceKey:Lcom/bumptech/glide/load/Key;

    .line 2
    iput-object p2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentData:Ljava/lang/Object;

    .line 3
    iput-object p3, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentFetcher:Lcom/bumptech/glide/load/data/DataFetcher;

    .line 4
    iput-object p4, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentDataSource:Lcom/bumptech/glide/load/DataSource;

    .line 5
    iput-object p5, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentAttemptingKey:Lcom/bumptech/glide/load/Key;

    .line 6
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    iget-object p2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentThread:Ljava/lang/Thread;

    if-eq p1, p2, :cond_0

    const/4 p1, 0x3

    .line 7
    iput p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->runReason:I

    .line 8
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->callback:Lcom/bumptech/glide/load/engine/DecodeJob$Callback;

    check-cast p1, Lcom/bumptech/glide/load/engine/EngineJob;

    invoke-virtual {p1, p0}, Lcom/bumptech/glide/load/engine/EngineJob;->reschedule(Lcom/bumptech/glide/load/engine/DecodeJob;)V

    goto :goto_0

    .line 9
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->decodeFromRetrievedData()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    return-void

    :catchall_0
    move-exception p0

    .line 10
    throw p0
.end method

.method public final releaseInternal()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->releaseManager:Lcom/bumptech/glide/load/engine/DecodeJob$ReleaseManager;

    .line 2
    monitor-enter v0

    const/4 v1, 0x0

    .line 3
    :try_start_0
    iput-boolean v1, v0, Lcom/bumptech/glide/load/engine/DecodeJob$ReleaseManager;->isEncodeComplete:Z

    .line 4
    iput-boolean v1, v0, Lcom/bumptech/glide/load/engine/DecodeJob$ReleaseManager;->isReleased:Z

    .line 5
    iput-boolean v1, v0, Lcom/bumptech/glide/load/engine/DecodeJob$ReleaseManager;->isFailed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    monitor-exit v0

    .line 7
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->deferredEncodeManager:Lcom/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager;

    const/4 v2, 0x0

    .line 8
    iput-object v2, v0, Lcom/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager;->key:Lcom/bumptech/glide/load/Key;

    .line 9
    iput-object v2, v0, Lcom/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager;->encoder:Lcom/bumptech/glide/load/ResourceEncoder;

    .line 10
    iput-object v2, v0, Lcom/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager;->toEncode:Lcom/bumptech/glide/load/engine/LockedResource;

    .line 11
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->decodeHelper:Lcom/bumptech/glide/load/engine/DecodeHelper;

    .line 12
    iput-object v2, v0, Lcom/bumptech/glide/load/engine/DecodeHelper;->glideContext:Lcom/bumptech/glide/GlideContext;

    .line 13
    iput-object v2, v0, Lcom/bumptech/glide/load/engine/DecodeHelper;->model:Ljava/lang/Object;

    .line 14
    iput-object v2, v0, Lcom/bumptech/glide/load/engine/DecodeHelper;->signature:Lcom/bumptech/glide/load/Key;

    .line 15
    iput-object v2, v0, Lcom/bumptech/glide/load/engine/DecodeHelper;->resourceClass:Ljava/lang/Class;

    .line 16
    iput-object v2, v0, Lcom/bumptech/glide/load/engine/DecodeHelper;->transcodeClass:Ljava/lang/Class;

    .line 17
    iput-object v2, v0, Lcom/bumptech/glide/load/engine/DecodeHelper;->options:Lcom/bumptech/glide/load/Options;

    .line 18
    iput-object v2, v0, Lcom/bumptech/glide/load/engine/DecodeHelper;->priority:Lcom/bumptech/glide/Priority;

    .line 19
    iput-object v2, v0, Lcom/bumptech/glide/load/engine/DecodeHelper;->transformations:Ljava/util/Map;

    .line 20
    iput-object v2, v0, Lcom/bumptech/glide/load/engine/DecodeHelper;->diskCacheStrategy:Lcom/bumptech/glide/load/engine/DiskCacheStrategy;

    .line 21
    iget-object v3, v0, Lcom/bumptech/glide/load/engine/DecodeHelper;->loadData:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 22
    iput-boolean v1, v0, Lcom/bumptech/glide/load/engine/DecodeHelper;->isLoadDataSet:Z

    .line 23
    iget-object v3, v0, Lcom/bumptech/glide/load/engine/DecodeHelper;->cacheKeys:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 24
    iput-boolean v1, v0, Lcom/bumptech/glide/load/engine/DecodeHelper;->isCacheKeysSet:Z

    .line 25
    iput-boolean v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->isCallbackNotified:Z

    .line 26
    iput-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->glideContext:Lcom/bumptech/glide/GlideContext;

    .line 27
    iput-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->signature:Lcom/bumptech/glide/load/Key;

    .line 28
    iput-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->options:Lcom/bumptech/glide/load/Options;

    .line 29
    iput-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->priority:Lcom/bumptech/glide/Priority;

    .line 30
    iput-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->loadKey:Lcom/bumptech/glide/load/engine/EngineKey;

    .line 31
    iput-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->callback:Lcom/bumptech/glide/load/engine/DecodeJob$Callback;

    .line 32
    iput v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->stage:I

    .line 33
    iput-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentGenerator:Lcom/bumptech/glide/load/engine/DataFetcherGenerator;

    .line 34
    iput-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentThread:Ljava/lang/Thread;

    .line 35
    iput-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentSourceKey:Lcom/bumptech/glide/load/Key;

    .line 36
    iput-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentData:Ljava/lang/Object;

    .line 37
    iput-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentDataSource:Lcom/bumptech/glide/load/DataSource;

    .line 38
    iput-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentFetcher:Lcom/bumptech/glide/load/data/DataFetcher;

    const-wide/16 v3, 0x0

    .line 39
    iput-wide v3, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->startFetchTime:J

    .line 40
    iput-boolean v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->isCancelled:Z

    .line 41
    iput-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->model:Ljava/lang/Object;

    .line 42
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->throwables:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 43
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->pool:Landroidx/core/util/Pools$Pool;

    invoke-interface {v0, p0}, Landroidx/core/util/Pools$Pool;->release(Ljava/lang/Object;)Z

    return-void

    :catchall_0
    move-exception p0

    .line 44
    monitor-exit v0

    throw p0
.end method

.method public reschedule()V
    .locals 1

    const/4 v0, 0x2

    .line 1
    iput v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->runReason:I

    .line 2
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->callback:Lcom/bumptech/glide/load/engine/DecodeJob$Callback;

    check-cast v0, Lcom/bumptech/glide/load/engine/EngineJob;

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/load/engine/EngineJob;->reschedule(Lcom/bumptech/glide/load/engine/DecodeJob;)V

    return-void
.end method

.method public run()V
    .locals 7

    const-string v0, "DecodeJob"

    .line 1
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentFetcher:Lcom/bumptech/glide/load/data/DataFetcher;

    .line 2
    :try_start_0
    iget-boolean v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->isCancelled:Z

    if-eqz v2, :cond_1

    .line 3
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->notifyFailed()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 4
    invoke-interface {v1}, Lcom/bumptech/glide/load/data/DataFetcher;->cleanup()V

    :cond_0
    return-void

    .line 5
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->runWrapped()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v1, :cond_4

    goto :goto_0

    :catchall_0
    move-exception v2

    const/4 v3, 0x3

    .line 6
    :try_start_2
    invoke-static {v0, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 7
    iget-boolean v3, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->isCancelled:Z

    iget v4, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->stage:I

    invoke-static {v4}, Landroidx/constraintlayout/solver/SolverVariable$Type$r8$EnumUnboxingUtility;->string$valueOf$com$bumptech$glide$load$engine$DecodeJob$Stage(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, 0x39

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v5, "DecodeJob threw unexpectedly, isCancelled: "

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, ", stage: "

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 8
    :cond_2
    iget v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->stage:I

    const/4 v3, 0x5

    if-eq v0, v3, :cond_3

    .line 9
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->throwables:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->notifyFailed()V

    .line 11
    :cond_3
    iget-boolean p0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->isCancelled:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz p0, :cond_5

    if-eqz v1, :cond_4

    .line 12
    :goto_0
    invoke-interface {v1}, Lcom/bumptech/glide/load/data/DataFetcher;->cleanup()V

    :cond_4
    return-void

    .line 13
    :cond_5
    :try_start_3
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception p0

    if-eqz v1, :cond_6

    .line 14
    invoke-interface {v1}, Lcom/bumptech/glide/load/data/DataFetcher;->cleanup()V

    .line 15
    :cond_6
    throw p0
.end method

.method public final runGenerators()V
    .locals 3

    .line 1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentThread:Ljava/lang/Thread;

    .line 2
    sget v0, Lcom/bumptech/glide/util/LogTime;->$r8$clinit:I

    .line 3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtimeNanos()J

    move-result-wide v0

    .line 4
    iput-wide v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->startFetchTime:J

    const/4 v0, 0x0

    .line 5
    :cond_0
    iget-boolean v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->isCancelled:Z

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentGenerator:Lcom/bumptech/glide/load/engine/DataFetcherGenerator;

    if-eqz v1, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentGenerator:Lcom/bumptech/glide/load/engine/DataFetcherGenerator;

    .line 6
    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/DataFetcherGenerator;->startNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 7
    iget v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->stage:I

    invoke-virtual {p0, v1}, Lcom/bumptech/glide/load/engine/DecodeJob;->getNextStage$enumunboxing$(I)I

    move-result v1

    iput v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->stage:I

    .line 8
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->getNextGenerator()Lcom/bumptech/glide/load/engine/DataFetcherGenerator;

    move-result-object v1

    iput-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentGenerator:Lcom/bumptech/glide/load/engine/DataFetcherGenerator;

    .line 9
    iget v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->stage:I

    const/4 v2, 0x4

    if-ne v1, v2, :cond_0

    const/4 v0, 0x2

    .line 10
    iput v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->runReason:I

    .line 11
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->callback:Lcom/bumptech/glide/load/engine/DecodeJob$Callback;

    check-cast v0, Lcom/bumptech/glide/load/engine/EngineJob;

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/load/engine/EngineJob;->reschedule(Lcom/bumptech/glide/load/engine/DecodeJob;)V

    return-void

    .line 12
    :cond_1
    iget v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->stage:I

    const/4 v2, 0x6

    if-eq v1, v2, :cond_2

    iget-boolean v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->isCancelled:Z

    if-eqz v1, :cond_3

    :cond_2
    if-nez v0, :cond_3

    .line 13
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->notifyFailed()V

    :cond_3
    return-void
.end method

.method public final runWrapped()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->runReason:I

    invoke-static {v0}, Landroidx/constraintlayout/solver/SolverVariable$Type$r8$EnumUnboxingUtility;->$enumboxing$ordinal(I)I

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 2
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->decodeFromRetrievedData()V

    goto :goto_0

    .line 3
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    iget p0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->runReason:I

    invoke-static {p0}, Landroidx/constraintlayout/solver/SolverVariable$Type$r8$EnumUnboxingUtility;->string$valueOf$com$bumptech$glide$load$engine$DecodeJob$RunReason(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x19

    const-string v2, "Unrecognized run reason: "

    invoke-static {v1, v2, p0}, Lcom/bumptech/glide/Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 4
    :cond_1
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->runGenerators()V

    goto :goto_0

    .line 5
    :cond_2
    invoke-virtual {p0, v1}, Lcom/bumptech/glide/load/engine/DecodeJob;->getNextStage$enumunboxing$(I)I

    move-result v0

    iput v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->stage:I

    .line 6
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->getNextGenerator()Lcom/bumptech/glide/load/engine/DataFetcherGenerator;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->currentGenerator:Lcom/bumptech/glide/load/engine/DataFetcherGenerator;

    .line 7
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->runGenerators()V

    :goto_0
    return-void
.end method

.method public final setNotifiedOrThrow()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->stateVerifier:Lcom/bumptech/glide/util/pool/StateVerifier;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/pool/StateVerifier;->throwIfRecycled()V

    .line 2
    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->isCallbackNotified:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 3
    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->isCallbackNotified:Z

    return-void

    .line 4
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Already notified"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
