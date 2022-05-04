.class public final Lcom/bumptech/glide/load/engine/DecodeHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Transcode:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final cacheKeys:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/Key;",
            ">;"
        }
    .end annotation
.end field

.field public diskCacheProvider:Lcom/bumptech/glide/load/engine/DecodeJob$DiskCacheProvider;

.field public diskCacheStrategy:Lcom/bumptech/glide/load/engine/DiskCacheStrategy;

.field public glideContext:Lcom/bumptech/glide/GlideContext;

.field public height:I

.field public isCacheKeysSet:Z

.field public isLoadDataSet:Z

.field public isScaleOnlyOrNoTransform:Z

.field public isTransformationRequired:Z

.field public final loadData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/model/ModelLoader$LoadData<",
            "*>;>;"
        }
    .end annotation
.end field

.field public model:Ljava/lang/Object;

.field public options:Lcom/bumptech/glide/load/Options;

.field public priority:Lcom/bumptech/glide/Priority;

.field public resourceClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public signature:Lcom/bumptech/glide/load/Key;

.field public transcodeClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "TTranscode;>;"
        }
    .end annotation
.end field

.field public transformations:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/bumptech/glide/load/Transformation<",
            "*>;>;"
        }
    .end annotation
.end field

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->loadData:Ljava/util/List;

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->cacheKeys:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getCacheKeys()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/Key;",
            ">;"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->isCacheKeysSet:Z

    if-nez v0, :cond_3

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->isCacheKeysSet:Z

    .line 3
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->cacheKeys:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/DecodeHelper;->getLoadData()Ljava/util/List;

    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_3

    .line 6
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/bumptech/glide/load/model/ModelLoader$LoadData;

    .line 7
    iget-object v5, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->cacheKeys:Ljava/util/List;

    iget-object v6, v4, Lcom/bumptech/glide/load/model/ModelLoader$LoadData;->sourceKey:Lcom/bumptech/glide/load/Key;

    invoke-interface {v5, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 8
    iget-object v5, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->cacheKeys:Ljava/util/List;

    iget-object v6, v4, Lcom/bumptech/glide/load/model/ModelLoader$LoadData;->sourceKey:Lcom/bumptech/glide/load/Key;

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    move v5, v2

    .line 9
    :goto_1
    iget-object v6, v4, Lcom/bumptech/glide/load/model/ModelLoader$LoadData;->alternateKeys:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_2

    .line 10
    iget-object v6, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->cacheKeys:Ljava/util/List;

    iget-object v7, v4, Lcom/bumptech/glide/load/model/ModelLoader$LoadData;->alternateKeys:Ljava/util/List;

    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 11
    iget-object v6, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->cacheKeys:Ljava/util/List;

    iget-object v7, v4, Lcom/bumptech/glide/load/model/ModelLoader$LoadData;->alternateKeys:Ljava/util/List;

    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/bumptech/glide/load/Key;

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 12
    :cond_3
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->cacheKeys:Ljava/util/List;

    return-object p0
.end method

.method public getDiskCache()Lcom/bumptech/glide/load/engine/cache/DiskCache;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->diskCacheProvider:Lcom/bumptech/glide/load/engine/DecodeJob$DiskCacheProvider;

    check-cast p0, Lcom/bumptech/glide/load/engine/Engine$LazyDiskCacheProvider;

    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/Engine$LazyDiskCacheProvider;->getDiskCache()Lcom/bumptech/glide/load/engine/cache/DiskCache;

    move-result-object p0

    return-object p0
.end method

.method public getLoadData()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/model/ModelLoader$LoadData<",
            "*>;>;"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->isLoadDataSet:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->isLoadDataSet:Z

    .line 3
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->loadData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->glideContext:Lcom/bumptech/glide/GlideContext;

    .line 5
    iget-object v0, v0, Lcom/bumptech/glide/GlideContext;->registry:Lcom/bumptech/glide/Registry;

    .line 6
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->model:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/Registry;->getModelLoaders(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    :goto_0
    if-ge v1, v2, :cond_1

    .line 8
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bumptech/glide/load/model/ModelLoader;

    .line 9
    iget-object v4, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->model:Ljava/lang/Object;

    iget v5, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->width:I

    iget v6, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->height:I

    iget-object v7, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->options:Lcom/bumptech/glide/load/Options;

    .line 10
    invoke-interface {v3, v4, v5, v6, v7}, Lcom/bumptech/glide/load/model/ModelLoader;->buildLoadData(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 11
    iget-object v4, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->loadData:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 12
    :cond_1
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->loadData:Ljava/util/List;

    return-object p0
.end method

.method public getLoadPath(Ljava/lang/Class;)Lcom/bumptech/glide/load/engine/LoadPath;
    .locals 17
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dataClass"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Data:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TData;>;)",
            "Lcom/bumptech/glide/load/engine/LoadPath<",
            "TData;*TTranscode;>;"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v7, p1

    .line 1
    iget-object v1, v0, Lcom/bumptech/glide/load/engine/DecodeHelper;->glideContext:Lcom/bumptech/glide/GlideContext;

    .line 2
    iget-object v8, v1, Lcom/bumptech/glide/GlideContext;->registry:Lcom/bumptech/glide/Registry;

    .line 3
    iget-object v9, v0, Lcom/bumptech/glide/load/engine/DecodeHelper;->resourceClass:Ljava/lang/Class;

    iget-object v10, v0, Lcom/bumptech/glide/load/engine/DecodeHelper;->transcodeClass:Ljava/lang/Class;

    .line 4
    iget-object v0, v8, Lcom/bumptech/glide/Registry;->loadPathCache:Lcom/bumptech/glide/provider/LoadPathCache;

    .line 5
    iget-object v1, v0, Lcom/bumptech/glide/provider/LoadPathCache;->keyRef:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v11, 0x0

    invoke-virtual {v1, v11}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/util/MultiClassKey;

    if-nez v1, :cond_0

    .line 6
    new-instance v1, Lcom/bumptech/glide/util/MultiClassKey;

    invoke-direct {v1}, Lcom/bumptech/glide/util/MultiClassKey;-><init>()V

    .line 7
    :cond_0
    iput-object v7, v1, Lcom/bumptech/glide/util/MultiClassKey;->first:Ljava/lang/Class;

    .line 8
    iput-object v9, v1, Lcom/bumptech/glide/util/MultiClassKey;->second:Ljava/lang/Class;

    .line 9
    iput-object v10, v1, Lcom/bumptech/glide/util/MultiClassKey;->third:Ljava/lang/Class;

    .line 10
    iget-object v2, v0, Lcom/bumptech/glide/provider/LoadPathCache;->cache:Landroidx/collection/ArrayMap;

    monitor-enter v2

    .line 11
    :try_start_0
    iget-object v3, v0, Lcom/bumptech/glide/provider/LoadPathCache;->cache:Landroidx/collection/ArrayMap;

    .line 12
    invoke-virtual {v3, v1, v11}, Landroidx/collection/SimpleArrayMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 13
    check-cast v3, Lcom/bumptech/glide/load/engine/LoadPath;

    .line 14
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 15
    iget-object v0, v0, Lcom/bumptech/glide/provider/LoadPathCache;->keyRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 16
    iget-object v0, v8, Lcom/bumptech/glide/Registry;->loadPathCache:Lcom/bumptech/glide/provider/LoadPathCache;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    sget-object v0, Lcom/bumptech/glide/provider/LoadPathCache;->NO_PATHS_SIGNAL:Lcom/bumptech/glide/load/engine/LoadPath;

    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_7

    :cond_1
    if-nez v3, :cond_d

    .line 18
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 19
    iget-object v0, v8, Lcom/bumptech/glide/Registry;->decoderRegistry:Lcom/bumptech/glide/provider/ResourceDecoderRegistry;

    .line 20
    invoke-virtual {v0, v7, v9}, Lcom/bumptech/glide/provider/ResourceDecoderRegistry;->getResourceClasses(Ljava/lang/Class;Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 21
    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_2
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v14, v0

    check-cast v14, Ljava/lang/Class;

    .line 22
    iget-object v0, v8, Lcom/bumptech/glide/Registry;->transcoderRegistry:Lcom/bumptech/glide/load/resource/transcode/TranscoderRegistry;

    .line 23
    invoke-virtual {v0, v14, v10}, Lcom/bumptech/glide/load/resource/transcode/TranscoderRegistry;->getTranscodeClasses(Ljava/lang/Class;Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 24
    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_0
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Ljava/lang/Class;

    .line 25
    iget-object v1, v8, Lcom/bumptech/glide/Registry;->decoderRegistry:Lcom/bumptech/glide/provider/ResourceDecoderRegistry;

    .line 26
    monitor-enter v1

    .line 27
    :try_start_1
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 28
    iget-object v0, v1, Lcom/bumptech/glide/provider/ResourceDecoderRegistry;->bucketPriorityList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_3
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 29
    iget-object v5, v1, Lcom/bumptech/glide/provider/ResourceDecoderRegistry;->decoders:Ljava/util/Map;

    invoke-interface {v5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-nez v2, :cond_4

    goto :goto_1

    .line 30
    :cond_4
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_5
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/bumptech/glide/provider/ResourceDecoderRegistry$Entry;

    .line 31
    invoke-virtual {v5, v7, v14}, Lcom/bumptech/glide/provider/ResourceDecoderRegistry$Entry;->handles(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 32
    iget-object v5, v5, Lcom/bumptech/glide/provider/ResourceDecoderRegistry$Entry;->decoder:Lcom/bumptech/glide/load/ResourceDecoder;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    .line 33
    :cond_6
    monitor-exit v1

    .line 34
    iget-object v1, v8, Lcom/bumptech/glide/Registry;->transcoderRegistry:Lcom/bumptech/glide/load/resource/transcode/TranscoderRegistry;

    .line 35
    monitor-enter v1

    .line 36
    :try_start_2
    invoke-virtual {v3, v14}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 37
    sget-object v0, Lcom/bumptech/glide/load/resource/transcode/UnitTranscoder;->UNIT_TRANSCODER:Lcom/bumptech/glide/load/resource/transcode/UnitTranscoder;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit v1

    :goto_3
    move-object v5, v0

    goto :goto_4

    .line 38
    :cond_7
    :try_start_3
    iget-object v0, v1, Lcom/bumptech/glide/load/resource/transcode/TranscoderRegistry;->transcoders:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bumptech/glide/load/resource/transcode/TranscoderRegistry$Entry;

    .line 39
    invoke-virtual {v2, v14, v3}, Lcom/bumptech/glide/load/resource/transcode/TranscoderRegistry$Entry;->handles(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 40
    iget-object v0, v2, Lcom/bumptech/glide/load/resource/transcode/TranscoderRegistry$Entry;->transcoder:Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit v1

    goto :goto_3

    .line 41
    :goto_4
    new-instance v6, Lcom/bumptech/glide/load/engine/DecodePath;

    iget-object v2, v8, Lcom/bumptech/glide/Registry;->throwableListPool:Landroidx/core/util/Pools$Pool;

    move-object v0, v6

    move-object/from16 v1, p1

    move-object/from16 v16, v2

    move-object v2, v14

    move-object v11, v6

    move-object/from16 v6, v16

    invoke-direct/range {v0 .. v6}, Lcom/bumptech/glide/load/engine/DecodePath;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;Ljava/util/List;Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;Landroidx/core/util/Pools$Pool;)V

    .line 42
    invoke-virtual {v12, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v11, 0x0

    goto/16 :goto_0

    .line 43
    :cond_9
    :try_start_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x2f

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v4, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v4, "No transcoder registered to transcode from "

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " to "

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :catchall_1
    move-exception v0

    .line 44
    monitor-exit v1

    throw v0

    .line 45
    :cond_a
    invoke-virtual {v12}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_b

    const/4 v11, 0x0

    goto :goto_5

    .line 46
    :cond_b
    new-instance v11, Lcom/bumptech/glide/load/engine/LoadPath;

    iget-object v5, v8, Lcom/bumptech/glide/Registry;->throwableListPool:Landroidx/core/util/Pools$Pool;

    move-object v0, v11

    move-object/from16 v1, p1

    move-object v2, v9

    move-object v3, v10

    move-object v4, v12

    invoke-direct/range {v0 .. v5}, Lcom/bumptech/glide/load/engine/LoadPath;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;Ljava/util/List;Landroidx/core/util/Pools$Pool;)V

    .line 47
    :goto_5
    iget-object v0, v8, Lcom/bumptech/glide/Registry;->loadPathCache:Lcom/bumptech/glide/provider/LoadPathCache;

    .line 48
    iget-object v1, v0, Lcom/bumptech/glide/provider/LoadPathCache;->cache:Landroidx/collection/ArrayMap;

    monitor-enter v1

    .line 49
    :try_start_5
    iget-object v0, v0, Lcom/bumptech/glide/provider/LoadPathCache;->cache:Landroidx/collection/ArrayMap;

    new-instance v2, Lcom/bumptech/glide/util/MultiClassKey;

    invoke-direct {v2, v7, v9, v10}, Lcom/bumptech/glide/util/MultiClassKey;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;)V

    if-eqz v11, :cond_c

    move-object v3, v11

    goto :goto_6

    .line 50
    :cond_c
    sget-object v3, Lcom/bumptech/glide/provider/LoadPathCache;->NO_PATHS_SIGNAL:Lcom/bumptech/glide/load/engine/LoadPath;

    .line 51
    :goto_6
    invoke-virtual {v0, v2, v3}, Landroidx/collection/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    monitor-exit v1

    goto :goto_7

    :catchall_2
    move-exception v0

    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v0

    :cond_d
    move-object v11, v3

    :goto_7
    return-object v11

    :catchall_3
    move-exception v0

    .line 53
    :try_start_6
    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    throw v0
.end method

.method public getSourceEncoder(Ljava/lang/Object;)Lcom/bumptech/glide/load/Encoder;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            ">(TX;)",
            "Lcom/bumptech/glide/load/Encoder<",
            "TX;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/bumptech/glide/Registry$NoSourceEncoderAvailableException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->glideContext:Lcom/bumptech/glide/GlideContext;

    .line 2
    iget-object p0, p0, Lcom/bumptech/glide/GlideContext;->registry:Lcom/bumptech/glide/Registry;

    .line 3
    iget-object p0, p0, Lcom/bumptech/glide/Registry;->encoderRegistry:Lcom/bumptech/glide/provider/EncoderRegistry;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 4
    monitor-enter p0

    .line 5
    :try_start_0
    iget-object v1, p0, Lcom/bumptech/glide/provider/EncoderRegistry;->encoders:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bumptech/glide/provider/EncoderRegistry$Entry;

    .line 6
    iget-object v3, v2, Lcom/bumptech/glide/provider/EncoderRegistry$Entry;->dataClass:Ljava/lang/Class;

    invoke-virtual {v3, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 7
    iget-object v0, v2, Lcom/bumptech/glide/provider/EncoderRegistry$Entry;->encoder:Lcom/bumptech/glide/load/Encoder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 8
    monitor-exit p0

    :goto_0
    if-eqz v0, :cond_2

    return-object v0

    .line 9
    :cond_2
    new-instance p0, Lcom/bumptech/glide/Registry$NoSourceEncoderAvailableException;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/bumptech/glide/Registry$NoSourceEncoderAvailableException;-><init>(Ljava/lang/Class;)V

    throw p0

    :catchall_0
    move-exception p1

    .line 10
    monitor-exit p0

    throw p1
.end method

.method public getTransformation(Ljava/lang/Class;)Lcom/bumptech/glide/load/Transformation;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "resourceClass"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Z:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TZ;>;)",
            "Lcom/bumptech/glide/load/Transformation<",
            "TZ;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->transformations:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/load/Transformation;

    if-nez v0, :cond_1

    .line 2
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->transformations:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 3
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Class;

    invoke-virtual {v3, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 4
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/load/Transformation;

    :cond_1
    if-nez v0, :cond_4

    .line 5
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->transformations:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-boolean p0, p0, Lcom/bumptech/glide/load/engine/DecodeHelper;->isTransformationRequired:Z

    if-nez p0, :cond_2

    goto :goto_0

    .line 6
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x73

    const-string v1, "Missing transformation for "

    const-string v2, ". If you wish to ignore unknown resource types, use the optional transformation methods."

    invoke-static {v0, v1, p1, v2}, Landroidx/viewpager2/widget/FakeDrag$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 7
    :cond_3
    :goto_0
    sget-object p0, Lcom/bumptech/glide/load/resource/UnitTransformation;->TRANSFORMATION:Lcom/bumptech/glide/load/Transformation;

    check-cast p0, Lcom/bumptech/glide/load/resource/UnitTransformation;

    return-object p0

    :cond_4
    return-object v0
.end method

.method public hasLoadPath(Ljava/lang/Class;)Z
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dataClass"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/load/engine/DecodeHelper;->getLoadPath(Ljava/lang/Class;)Lcom/bumptech/glide/load/engine/LoadPath;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
