.class public Lcom/bumptech/glide/load/engine/DecodePath;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/engine/DecodePath$DecodeCallback;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<DataType:",
        "Ljava/lang/Object;",
        "ResourceType:",
        "Ljava/lang/Object;",
        "Transcode:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final dataClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "TDataType;>;"
        }
    .end annotation
.end field

.field public final decoders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "+",
            "Lcom/bumptech/glide/load/ResourceDecoder<",
            "TDataType;TResourceType;>;>;"
        }
    .end annotation
.end field

.field public final failureMessage:Ljava/lang/String;

.field public final listPool:Landroidx/core/util/Pools$Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Pools$Pool<",
            "Ljava/util/List<",
            "Ljava/lang/Throwable;",
            ">;>;"
        }
    .end annotation
.end field

.field public final transcoder:Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder<",
            "TResourceType;TTranscode;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;Ljava/util/List;Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;Landroidx/core/util/Pools$Pool;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "dataClass",
            "resourceClass",
            "transcodeClass",
            "decoders",
            "transcoder",
            "listPool"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "TDataType;>;",
            "Ljava/lang/Class<",
            "TResourceType;>;",
            "Ljava/lang/Class<",
            "TTranscode;>;",
            "Ljava/util/List<",
            "+",
            "Lcom/bumptech/glide/load/ResourceDecoder<",
            "TDataType;TResourceType;>;>;",
            "Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder<",
            "TResourceType;TTranscode;>;",
            "Landroidx/core/util/Pools$Pool<",
            "Ljava/util/List<",
            "Ljava/lang/Throwable;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/DecodePath;->dataClass:Ljava/lang/Class;

    .line 3
    iput-object p4, p0, Lcom/bumptech/glide/load/engine/DecodePath;->decoders:Ljava/util/List;

    .line 4
    iput-object p5, p0, Lcom/bumptech/glide/load/engine/DecodePath;->transcoder:Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;

    .line 5
    iput-object p6, p0, Lcom/bumptech/glide/load/engine/DecodePath;->listPool:Landroidx/core/util/Pools$Pool;

    .line 6
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    .line 7
    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p4

    add-int/lit8 p4, p4, 0x17

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p5

    add-int/2addr p5, p4

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p4

    add-int/2addr p4, p5

    const-string p5, "Failed DecodePath{"

    const-string p6, "->"

    invoke-static {p4, p5, p1, p6, p2}, Landroidx/recyclerview/R$attr$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "}"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/DecodePath;->failureMessage:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public decode(Lcom/bumptech/glide/load/data/DataRewinder;IILcom/bumptech/glide/load/Options;Lcom/bumptech/glide/load/engine/DecodePath$DecodeCallback;)Lcom/bumptech/glide/load/engine/Resource;
    .locals 10
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "rewinder",
            "width",
            "height",
            "options",
            "callback"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/data/DataRewinder<",
            "TDataType;>;II",
            "Lcom/bumptech/glide/load/Options;",
            "Lcom/bumptech/glide/load/engine/DecodePath$DecodeCallback<",
            "TResourceType;>;)",
            "Lcom/bumptech/glide/load/engine/Resource<",
            "TTranscode;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/bumptech/glide/load/engine/GlideException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodePath;->listPool:Landroidx/core/util/Pools$Pool;

    invoke-interface {v0}, Landroidx/core/util/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    const-string v1, "Argument must not be null"

    .line 2
    invoke-static {v0, v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    move-object v6, v0

    .line 3
    :try_start_0
    invoke-virtual/range {v1 .. v6}, Lcom/bumptech/glide/load/engine/DecodePath;->decodeResourceWithList(Lcom/bumptech/glide/load/data/DataRewinder;IILcom/bumptech/glide/load/Options;Ljava/util/List;)Lcom/bumptech/glide/load/engine/Resource;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    iget-object p2, p0, Lcom/bumptech/glide/load/engine/DecodePath;->listPool:Landroidx/core/util/Pools$Pool;

    invoke-interface {p2, v0}, Landroidx/core/util/Pools$Pool;->release(Ljava/lang/Object;)Z

    .line 5
    check-cast p5, Lcom/bumptech/glide/load/engine/DecodeJob$DecodeCallback;

    .line 6
    iget-object p2, p5, Lcom/bumptech/glide/load/engine/DecodeJob$DecodeCallback;->this$0:Lcom/bumptech/glide/load/engine/DecodeJob;

    iget-object p3, p5, Lcom/bumptech/glide/load/engine/DecodeJob$DecodeCallback;->dataSource:Lcom/bumptech/glide/load/DataSource;

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    invoke-interface {p1}, Lcom/bumptech/glide/load/engine/Resource;->get()Ljava/lang/Object;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    .line 8
    sget-object p5, Lcom/bumptech/glide/load/DataSource;->RESOURCE_DISK_CACHE:Lcom/bumptech/glide/load/DataSource;

    const/4 v0, 0x0

    if-eq p3, p5, :cond_0

    .line 9
    iget-object p5, p2, Lcom/bumptech/glide/load/engine/DecodeJob;->decodeHelper:Lcom/bumptech/glide/load/engine/DecodeHelper;

    invoke-virtual {p5, v7}, Lcom/bumptech/glide/load/engine/DecodeHelper;->getTransformation(Ljava/lang/Class;)Lcom/bumptech/glide/load/Transformation;

    move-result-object p5

    .line 10
    iget-object v1, p2, Lcom/bumptech/glide/load/engine/DecodeJob;->glideContext:Lcom/bumptech/glide/GlideContext;

    iget v2, p2, Lcom/bumptech/glide/load/engine/DecodeJob;->width:I

    iget v3, p2, Lcom/bumptech/glide/load/engine/DecodeJob;->height:I

    invoke-interface {p5, v1, p1, v2, v3}, Lcom/bumptech/glide/load/Transformation;->transform(Landroid/content/Context;Lcom/bumptech/glide/load/engine/Resource;II)Lcom/bumptech/glide/load/engine/Resource;

    move-result-object v1

    move-object v6, p5

    move-object p5, v1

    goto :goto_0

    :cond_0
    move-object p5, p1

    move-object v6, v0

    .line 11
    :goto_0
    invoke-virtual {p1, p5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 12
    invoke-interface {p1}, Lcom/bumptech/glide/load/engine/Resource;->recycle()V

    .line 13
    :cond_1
    iget-object p1, p2, Lcom/bumptech/glide/load/engine/DecodeJob;->decodeHelper:Lcom/bumptech/glide/load/engine/DecodeHelper;

    .line 14
    iget-object p1, p1, Lcom/bumptech/glide/load/engine/DecodeHelper;->glideContext:Lcom/bumptech/glide/GlideContext;

    .line 15
    iget-object p1, p1, Lcom/bumptech/glide/GlideContext;->registry:Lcom/bumptech/glide/Registry;

    .line 16
    iget-object p1, p1, Lcom/bumptech/glide/Registry;->resourceEncoderRegistry:Lcom/bumptech/glide/provider/ResourceEncoderRegistry;

    invoke-interface {p5}, Lcom/bumptech/glide/load/engine/Resource;->getResourceClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/bumptech/glide/provider/ResourceEncoderRegistry;->get(Ljava/lang/Class;)Lcom/bumptech/glide/load/ResourceEncoder;

    move-result-object p1

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz p1, :cond_2

    move p1, v2

    goto :goto_1

    :cond_2
    move p1, v1

    :goto_1
    if-eqz p1, :cond_4

    .line 17
    iget-object p1, p2, Lcom/bumptech/glide/load/engine/DecodeJob;->decodeHelper:Lcom/bumptech/glide/load/engine/DecodeHelper;

    .line 18
    iget-object p1, p1, Lcom/bumptech/glide/load/engine/DecodeHelper;->glideContext:Lcom/bumptech/glide/GlideContext;

    .line 19
    iget-object p1, p1, Lcom/bumptech/glide/GlideContext;->registry:Lcom/bumptech/glide/Registry;

    .line 20
    iget-object p1, p1, Lcom/bumptech/glide/Registry;->resourceEncoderRegistry:Lcom/bumptech/glide/provider/ResourceEncoderRegistry;

    invoke-interface {p5}, Lcom/bumptech/glide/load/engine/Resource;->getResourceClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/bumptech/glide/provider/ResourceEncoderRegistry;->get(Ljava/lang/Class;)Lcom/bumptech/glide/load/ResourceEncoder;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 21
    iget-object p1, p2, Lcom/bumptech/glide/load/engine/DecodeJob;->options:Lcom/bumptech/glide/load/Options;

    invoke-interface {v0, p1}, Lcom/bumptech/glide/load/ResourceEncoder;->getEncodeStrategy(Lcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/EncodeStrategy;

    move-result-object p1

    goto :goto_2

    .line 22
    :cond_3
    new-instance p0, Lcom/bumptech/glide/Registry$NoResultEncoderAvailableException;

    invoke-interface {p5}, Lcom/bumptech/glide/load/engine/Resource;->getResourceClass()Ljava/lang/Class;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/bumptech/glide/Registry$NoResultEncoderAvailableException;-><init>(Ljava/lang/Class;)V

    throw p0

    .line 23
    :cond_4
    sget-object p1, Lcom/bumptech/glide/load/EncodeStrategy;->NONE:Lcom/bumptech/glide/load/EncodeStrategy;

    :goto_2
    move-object v9, v0

    .line 24
    iget-object v0, p2, Lcom/bumptech/glide/load/engine/DecodeJob;->decodeHelper:Lcom/bumptech/glide/load/engine/DecodeHelper;

    iget-object v3, p2, Lcom/bumptech/glide/load/engine/DecodeJob;->currentSourceKey:Lcom/bumptech/glide/load/Key;

    .line 25
    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/DecodeHelper;->getLoadData()Ljava/util/List;

    move-result-object v0

    .line 26
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    move v5, v1

    :goto_3
    if-ge v5, v4, :cond_6

    .line 27
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/bumptech/glide/load/model/ModelLoader$LoadData;

    .line 28
    iget-object v8, v8, Lcom/bumptech/glide/load/model/ModelLoader$LoadData;->sourceKey:Lcom/bumptech/glide/load/Key;

    invoke-interface {v8, v3}, Lcom/bumptech/glide/load/Key;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    move v1, v2

    goto :goto_4

    :cond_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    :cond_6
    :goto_4
    xor-int/lit8 v0, v1, 0x1

    .line 29
    iget-object v1, p2, Lcom/bumptech/glide/load/engine/DecodeJob;->diskCacheStrategy:Lcom/bumptech/glide/load/engine/DiskCacheStrategy;

    invoke-virtual {v1, v0, p3, p1}, Lcom/bumptech/glide/load/engine/DiskCacheStrategy;->isResourceCacheable(ZLcom/bumptech/glide/load/DataSource;Lcom/bumptech/glide/load/EncodeStrategy;)Z

    move-result p3

    if-eqz p3, :cond_a

    if-eqz v9, :cond_9

    .line 30
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p3

    if-eqz p3, :cond_8

    if-ne p3, v2, :cond_7

    .line 31
    new-instance p1, Lcom/bumptech/glide/load/engine/ResourceCacheKey;

    iget-object p3, p2, Lcom/bumptech/glide/load/engine/DecodeJob;->decodeHelper:Lcom/bumptech/glide/load/engine/DecodeHelper;

    .line 32
    iget-object p3, p3, Lcom/bumptech/glide/load/engine/DecodeHelper;->glideContext:Lcom/bumptech/glide/GlideContext;

    .line 33
    iget-object v1, p3, Lcom/bumptech/glide/GlideContext;->arrayPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;

    .line 34
    iget-object v2, p2, Lcom/bumptech/glide/load/engine/DecodeJob;->currentSourceKey:Lcom/bumptech/glide/load/Key;

    iget-object v3, p2, Lcom/bumptech/glide/load/engine/DecodeJob;->signature:Lcom/bumptech/glide/load/Key;

    iget v4, p2, Lcom/bumptech/glide/load/engine/DecodeJob;->width:I

    iget v5, p2, Lcom/bumptech/glide/load/engine/DecodeJob;->height:I

    iget-object v8, p2, Lcom/bumptech/glide/load/engine/DecodeJob;->options:Lcom/bumptech/glide/load/Options;

    move-object v0, p1

    invoke-direct/range {v0 .. v8}, Lcom/bumptech/glide/load/engine/ResourceCacheKey;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/Key;IILcom/bumptech/glide/load/Transformation;Ljava/lang/Class;Lcom/bumptech/glide/load/Options;)V

    goto :goto_5

    .line 35
    :cond_7
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    add-int/lit8 p2, p2, 0x12

    const-string p3, "Unknown strategy: "

    invoke-static {p2, p3, p1}, Lcom/bumptech/glide/Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 36
    :cond_8
    new-instance p1, Lcom/bumptech/glide/load/engine/DataCacheKey;

    iget-object p3, p2, Lcom/bumptech/glide/load/engine/DecodeJob;->currentSourceKey:Lcom/bumptech/glide/load/Key;

    iget-object v0, p2, Lcom/bumptech/glide/load/engine/DecodeJob;->signature:Lcom/bumptech/glide/load/Key;

    invoke-direct {p1, p3, v0}, Lcom/bumptech/glide/load/engine/DataCacheKey;-><init>(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/Key;)V

    .line 37
    :goto_5
    invoke-static {p5}, Lcom/bumptech/glide/load/engine/LockedResource;->obtain(Lcom/bumptech/glide/load/engine/Resource;)Lcom/bumptech/glide/load/engine/LockedResource;

    move-result-object p5

    .line 38
    iget-object p2, p2, Lcom/bumptech/glide/load/engine/DecodeJob;->deferredEncodeManager:Lcom/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager;

    .line 39
    iput-object p1, p2, Lcom/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager;->key:Lcom/bumptech/glide/load/Key;

    .line 40
    iput-object v9, p2, Lcom/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager;->encoder:Lcom/bumptech/glide/load/ResourceEncoder;

    .line 41
    iput-object p5, p2, Lcom/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager;->toEncode:Lcom/bumptech/glide/load/engine/LockedResource;

    goto :goto_6

    .line 42
    :cond_9
    new-instance p0, Lcom/bumptech/glide/Registry$NoResultEncoderAvailableException;

    invoke-interface {p5}, Lcom/bumptech/glide/load/engine/Resource;->get()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/bumptech/glide/Registry$NoResultEncoderAvailableException;-><init>(Ljava/lang/Class;)V

    throw p0

    .line 43
    :cond_a
    :goto_6
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/DecodePath;->transcoder:Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;

    invoke-interface {p0, p5, p4}, Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;->transcode(Lcom/bumptech/glide/load/engine/Resource;Lcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;

    move-result-object p0

    return-object p0

    :catchall_0
    move-exception p1

    .line 44
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/DecodePath;->listPool:Landroidx/core/util/Pools$Pool;

    invoke-interface {p0, v0}, Landroidx/core/util/Pools$Pool;->release(Ljava/lang/Object;)Z

    throw p1
.end method

.method public final decodeResourceWithList(Lcom/bumptech/glide/load/data/DataRewinder;IILcom/bumptech/glide/load/Options;Ljava/util/List;)Lcom/bumptech/glide/load/engine/Resource;
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "rewinder",
            "width",
            "height",
            "options",
            "exceptions"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/data/DataRewinder<",
            "TDataType;>;II",
            "Lcom/bumptech/glide/load/Options;",
            "Ljava/util/List<",
            "Ljava/lang/Throwable;",
            ">;)",
            "Lcom/bumptech/glide/load/engine/Resource<",
            "TResourceType;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/bumptech/glide/load/engine/GlideException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodePath;->decoders:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_3

    .line 2
    iget-object v3, p0, Lcom/bumptech/glide/load/engine/DecodePath;->decoders:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bumptech/glide/load/ResourceDecoder;

    .line 3
    :try_start_0
    invoke-interface {p1}, Lcom/bumptech/glide/load/data/DataRewinder;->rewindAndGet()Ljava/lang/Object;

    move-result-object v4

    .line 4
    invoke-interface {v3, v4, p4}, Lcom/bumptech/glide/load/ResourceDecoder;->handles(Ljava/lang/Object;Lcom/bumptech/glide/load/Options;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 5
    invoke-interface {p1}, Lcom/bumptech/glide/load/data/DataRewinder;->rewindAndGet()Ljava/lang/Object;

    move-result-object v4

    .line 6
    invoke-interface {v3, v4, p2, p3, p4}, Lcom/bumptech/glide/load/ResourceDecoder;->decode(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v4

    const/4 v5, 0x2

    const-string v6, "DecodePath"

    .line 7
    invoke-static {v6, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 8
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, 0x1a

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v5, "Failed to decode data for "

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v6, v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 9
    :cond_0
    invoke-interface {p5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    :goto_1
    if-eqz v1, :cond_2

    goto :goto_2

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    :goto_2
    if-eqz v1, :cond_4

    return-object v1

    .line 10
    :cond_4
    new-instance p1, Lcom/bumptech/glide/load/engine/GlideException;

    iget-object p0, p0, Lcom/bumptech/glide/load/engine/DecodePath;->failureMessage:Ljava/lang/String;

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2, p5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-direct {p1, p0, p2}, Lcom/bumptech/glide/load/engine/GlideException;-><init>(Ljava/lang/String;Ljava/util/List;)V

    throw p1
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodePath;->dataClass:Ljava/lang/Class;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodePath;->decoders:Ljava/util/List;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iget-object p0, p0, Lcom/bumptech/glide/load/engine/DecodePath;->transcoder:Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x2f

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v3, v2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v3

    const-string v3, "DecodePath{ dataClass="

    const-string v4, ", decoders="

    invoke-static {v2, v3, v0, v4, v1}, Landroidx/recyclerview/R$attr$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", transcoder="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0x7d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
