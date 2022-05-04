.class public Lcom/bumptech/glide/load/engine/Engine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/engine/EngineJobListener;
.implements Lcom/bumptech/glide/load/engine/cache/MemoryCache$ResourceRemovedListener;
.implements Lcom/bumptech/glide/load/engine/EngineResource$ResourceListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;,
        Lcom/bumptech/glide/load/engine/Engine$DecodeJobFactory;,
        Lcom/bumptech/glide/load/engine/Engine$LazyDiskCacheProvider;,
        Lcom/bumptech/glide/load/engine/Engine$LoadStatus;
    }
.end annotation


# static fields
.field public static final VERBOSE_IS_LOGGABLE:Z


# instance fields
.field public final activeResources:Lcom/bumptech/glide/load/engine/ActiveResources;

.field public final cache:Lcom/bumptech/glide/load/engine/cache/MemoryCache;

.field public final decodeJobFactory:Lcom/bumptech/glide/load/engine/Engine$DecodeJobFactory;

.field public final diskCacheProvider:Lcom/bumptech/glide/load/engine/Engine$LazyDiskCacheProvider;

.field public final engineJobFactory:Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;

.field public final jobs:Lcom/bumptech/glide/load/engine/Jobs;

.field public final keyFactory:Lcom/bumptech/glide/load/engine/EngineKeyFactory;

.field public final resourceRecycler:Lcom/bumptech/glide/load/engine/ResourceRecycler;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    const-string v0, "Engine"

    const/4 v1, 0x2

    .line 1
    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Lcom/bumptech/glide/load/engine/Engine;->VERBOSE_IS_LOGGABLE:Z

    return-void
.end method

.method public constructor <init>(Lcom/bumptech/glide/load/engine/cache/MemoryCache;Lcom/bumptech/glide/load/engine/cache/DiskCache$Factory;Lcom/bumptech/glide/load/engine/executor/GlideExecutor;Lcom/bumptech/glide/load/engine/executor/GlideExecutor;Lcom/bumptech/glide/load/engine/executor/GlideExecutor;Lcom/bumptech/glide/load/engine/executor/GlideExecutor;Lcom/bumptech/glide/load/engine/Jobs;Lcom/bumptech/glide/load/engine/EngineKeyFactory;Lcom/bumptech/glide/load/engine/ActiveResources;Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;Lcom/bumptech/glide/load/engine/Engine$DecodeJobFactory;Lcom/bumptech/glide/load/engine/ResourceRecycler;Z)V
    .locals 10
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "cache",
            "diskCacheFactory",
            "diskCacheExecutor",
            "sourceExecutor",
            "sourceUnlimitedExecutor",
            "animationExecutor",
            "jobs",
            "keyFactory",
            "activeResources",
            "engineJobFactory",
            "decodeJobFactory",
            "resourceRecycler",
            "isActiveResourceRetentionAllowed"
        }
    .end annotation

    move-object v6, p0

    move-object v7, p1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object v7, v6, Lcom/bumptech/glide/load/engine/Engine;->cache:Lcom/bumptech/glide/load/engine/cache/MemoryCache;

    .line 3
    new-instance v8, Lcom/bumptech/glide/load/engine/Engine$LazyDiskCacheProvider;

    move-object v0, p2

    invoke-direct {v8, p2}, Lcom/bumptech/glide/load/engine/Engine$LazyDiskCacheProvider;-><init>(Lcom/bumptech/glide/load/engine/cache/DiskCache$Factory;)V

    iput-object v8, v6, Lcom/bumptech/glide/load/engine/Engine;->diskCacheProvider:Lcom/bumptech/glide/load/engine/Engine$LazyDiskCacheProvider;

    if-nez p9, :cond_0

    .line 4
    new-instance v0, Lcom/bumptech/glide/load/engine/ActiveResources;

    move/from16 v1, p13

    invoke-direct {v0, v1}, Lcom/bumptech/glide/load/engine/ActiveResources;-><init>(Z)V

    goto :goto_0

    :cond_0
    move-object/from16 v0, p9

    .line 5
    :goto_0
    iput-object v0, v6, Lcom/bumptech/glide/load/engine/Engine;->activeResources:Lcom/bumptech/glide/load/engine/ActiveResources;

    .line 6
    iput-object v6, v0, Lcom/bumptech/glide/load/engine/ActiveResources;->listener:Lcom/bumptech/glide/load/engine/EngineResource$ResourceListener;

    if-nez p8, :cond_1

    .line 7
    new-instance v0, Lcom/bumptech/glide/load/engine/EngineKeyFactory;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/EngineKeyFactory;-><init>()V

    goto :goto_1

    :cond_1
    move-object/from16 v0, p8

    .line 8
    :goto_1
    iput-object v0, v6, Lcom/bumptech/glide/load/engine/Engine;->keyFactory:Lcom/bumptech/glide/load/engine/EngineKeyFactory;

    if-nez p7, :cond_2

    .line 9
    new-instance v0, Lcom/bumptech/glide/load/engine/Jobs;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/Jobs;-><init>()V

    goto :goto_2

    :cond_2
    move-object/from16 v0, p7

    .line 10
    :goto_2
    iput-object v0, v6, Lcom/bumptech/glide/load/engine/Engine;->jobs:Lcom/bumptech/glide/load/engine/Jobs;

    if-nez p10, :cond_3

    .line 11
    new-instance v9, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;

    move-object v0, v9

    move-object v1, p3

    move-object v2, p4

    move-object v3, p5

    move-object/from16 v4, p6

    move-object v5, p0

    invoke-direct/range {v0 .. v5}, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;-><init>(Lcom/bumptech/glide/load/engine/executor/GlideExecutor;Lcom/bumptech/glide/load/engine/executor/GlideExecutor;Lcom/bumptech/glide/load/engine/executor/GlideExecutor;Lcom/bumptech/glide/load/engine/executor/GlideExecutor;Lcom/bumptech/glide/load/engine/EngineJobListener;)V

    goto :goto_3

    :cond_3
    move-object/from16 v9, p10

    .line 12
    :goto_3
    iput-object v9, v6, Lcom/bumptech/glide/load/engine/Engine;->engineJobFactory:Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;

    if-nez p11, :cond_4

    .line 13
    new-instance v0, Lcom/bumptech/glide/load/engine/Engine$DecodeJobFactory;

    invoke-direct {v0, v8}, Lcom/bumptech/glide/load/engine/Engine$DecodeJobFactory;-><init>(Lcom/bumptech/glide/load/engine/DecodeJob$DiskCacheProvider;)V

    goto :goto_4

    :cond_4
    move-object/from16 v0, p11

    .line 14
    :goto_4
    iput-object v0, v6, Lcom/bumptech/glide/load/engine/Engine;->decodeJobFactory:Lcom/bumptech/glide/load/engine/Engine$DecodeJobFactory;

    if-nez p12, :cond_5

    .line 15
    new-instance v0, Lcom/bumptech/glide/load/engine/ResourceRecycler;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/ResourceRecycler;-><init>()V

    goto :goto_5

    :cond_5
    move-object/from16 v0, p12

    .line 16
    :goto_5
    iput-object v0, v6, Lcom/bumptech/glide/load/engine/Engine;->resourceRecycler:Lcom/bumptech/glide/load/engine/ResourceRecycler;

    .line 17
    move-object v0, v7

    check-cast v0, Lcom/bumptech/glide/load/engine/cache/LruResourceCache;

    .line 18
    iput-object v6, v0, Lcom/bumptech/glide/load/engine/cache/LruResourceCache;->listener:Lcom/bumptech/glide/load/engine/cache/MemoryCache$ResourceRemovedListener;

    return-void
.end method

.method public static logWithTimeAndKey(Ljava/lang/String;JLcom/bumptech/glide/load/Key;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "log",
            "startTime",
            "key"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2}, Lcom/bumptech/glide/util/LogTime;->getElapsedMillis(J)D

    move-result-wide p1

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x25

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v1, v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " in "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string p0, "ms, key: "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "Engine"

    invoke-static {p1, p0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method public onEngineJobCancelled(Lcom/bumptech/glide/load/engine/EngineJob;Lcom/bumptech/glide/load/Key;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "engineJob",
            "key"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "*>;",
            "Lcom/bumptech/glide/load/Key;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/bumptech/glide/util/Util;->assertMainThread()V

    .line 2
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/Engine;->jobs:Lcom/bumptech/glide/load/engine/Jobs;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iget-boolean v0, p1, Lcom/bumptech/glide/load/engine/EngineJob;->onlyRetrieveFromCache:Z

    .line 4
    invoke-virtual {p0, v0}, Lcom/bumptech/glide/load/engine/Jobs;->getJobMap(Z)Ljava/util/Map;

    move-result-object p0

    .line 5
    invoke-interface {p0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 6
    invoke-interface {p0, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public onEngineJobComplete(Lcom/bumptech/glide/load/engine/EngineJob;Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/EngineResource;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "engineJob",
            "key",
            "resource"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "*>;",
            "Lcom/bumptech/glide/load/Key;",
            "Lcom/bumptech/glide/load/engine/EngineResource<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/bumptech/glide/util/Util;->assertMainThread()V

    if-eqz p3, :cond_0

    .line 2
    iput-object p2, p3, Lcom/bumptech/glide/load/engine/EngineResource;->key:Lcom/bumptech/glide/load/Key;

    .line 3
    iput-object p0, p3, Lcom/bumptech/glide/load/engine/EngineResource;->listener:Lcom/bumptech/glide/load/engine/EngineResource$ResourceListener;

    .line 4
    iget-boolean v0, p3, Lcom/bumptech/glide/load/engine/EngineResource;->isCacheable:Z

    if-eqz v0, :cond_0

    .line 5
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine;->activeResources:Lcom/bumptech/glide/load/engine/ActiveResources;

    invoke-virtual {v0, p2, p3}, Lcom/bumptech/glide/load/engine/ActiveResources;->activate(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/EngineResource;)V

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/Engine;->jobs:Lcom/bumptech/glide/load/engine/Jobs;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    iget-boolean p3, p1, Lcom/bumptech/glide/load/engine/EngineJob;->onlyRetrieveFromCache:Z

    .line 8
    invoke-virtual {p0, p3}, Lcom/bumptech/glide/load/engine/Jobs;->getJobMap(Z)Ljava/util/Map;

    move-result-object p0

    .line 9
    invoke-interface {p0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 10
    invoke-interface {p0, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-void
.end method

.method public onResourceReleased(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/EngineResource;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "cacheKey",
            "resource"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/Key;",
            "Lcom/bumptech/glide/load/engine/EngineResource<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/bumptech/glide/util/Util;->assertMainThread()V

    .line 2
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine;->activeResources:Lcom/bumptech/glide/load/engine/ActiveResources;

    .line 3
    iget-object v0, v0, Lcom/bumptech/glide/load/engine/ActiveResources;->activeEngineResources:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/load/engine/ActiveResources$ResourceWeakReference;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 4
    iput-object v1, v0, Lcom/bumptech/glide/load/engine/ActiveResources$ResourceWeakReference;->resource:Lcom/bumptech/glide/load/engine/Resource;

    .line 5
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 6
    :cond_0
    iget-boolean v0, p2, Lcom/bumptech/glide/load/engine/EngineResource;->isCacheable:Z

    if-eqz v0, :cond_1

    .line 7
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/Engine;->cache:Lcom/bumptech/glide/load/engine/cache/MemoryCache;

    check-cast p0, Lcom/bumptech/glide/load/engine/cache/LruResourceCache;

    .line 8
    invoke-virtual {p0, p1, p2}, Lcom/bumptech/glide/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/bumptech/glide/load/engine/Resource;

    goto :goto_0

    .line 9
    :cond_1
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/Engine;->resourceRecycler:Lcom/bumptech/glide/load/engine/ResourceRecycler;

    invoke-virtual {p0, p2}, Lcom/bumptech/glide/load/engine/ResourceRecycler;->recycle(Lcom/bumptech/glide/load/engine/Resource;)V

    :goto_0
    return-void
.end method

.method public shutdown()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine;->engineJobFactory:Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->shutdown()V

    .line 2
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine;->diskCacheProvider:Lcom/bumptech/glide/load/engine/Engine$LazyDiskCacheProvider;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/Engine$LazyDiskCacheProvider;->clearDiskCacheIfCreated()V

    .line 3
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/Engine;->activeResources:Lcom/bumptech/glide/load/engine/ActiveResources;

    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/ActiveResources;->shutdown()V

    return-void
.end method
