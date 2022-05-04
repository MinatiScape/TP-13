.class public Lcom/bumptech/glide/RequestBuilder;
.super Lcom/bumptech/glide/request/BaseRequestOptions;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TranscodeType:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/bumptech/glide/request/BaseRequestOptions<",
        "Lcom/bumptech/glide/RequestBuilder<",
        "TTranscodeType;>;>;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# instance fields
.field public final context:Landroid/content/Context;

.field public final glideContext:Lcom/bumptech/glide/GlideContext;

.field public isDefaultTransitionOptionsSet:Z

.field public isModelSet:Z

.field public isThumbnailBuilt:Z

.field public model:Ljava/lang/Object;

.field public requestListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/request/RequestListener<",
            "TTranscodeType;>;>;"
        }
    .end annotation
.end field

.field public final requestManager:Lcom/bumptech/glide/RequestManager;

.field public thumbnailBuilder:Lcom/bumptech/glide/RequestBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/RequestBuilder<",
            "TTranscodeType;>;"
        }
    .end annotation
.end field

.field public final transcodeClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "TTranscodeType;>;"
        }
    .end annotation
.end field

.field public transitionOptions:Lcom/bumptech/glide/TransitionOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/TransitionOptions<",
            "*-TTranscodeType;>;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/bumptech/glide/request/RequestOptions;

    invoke-direct {v0}, Lcom/bumptech/glide/request/RequestOptions;-><init>()V

    sget-object v1, Lcom/bumptech/glide/load/engine/DiskCacheStrategy;->DATA:Lcom/bumptech/glide/load/engine/DiskCacheStrategy;

    .line 2
    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/BaseRequestOptions;->diskCacheStrategy(Lcom/bumptech/glide/load/engine/DiskCacheStrategy;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/request/RequestOptions;

    sget-object v1, Lcom/bumptech/glide/Priority;->LOW:Lcom/bumptech/glide/Priority;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/BaseRequestOptions;->priority(Lcom/bumptech/glide/Priority;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/request/RequestOptions;

    const/4 v1, 0x1

    .line 3
    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/BaseRequestOptions;->skipMemoryCache(Z)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/request/RequestOptions;

    return-void
.end method

.method public constructor <init>(Lcom/bumptech/glide/Glide;Lcom/bumptech/glide/RequestManager;Ljava/lang/Class;Landroid/content/Context;)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "CheckResult"
        }
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "glide",
            "requestManager",
            "transcodeClass",
            "context"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/Glide;",
            "Lcom/bumptech/glide/RequestManager;",
            "Ljava/lang/Class<",
            "TTranscodeType;>;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/bumptech/glide/request/BaseRequestOptions;-><init>()V

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/bumptech/glide/RequestBuilder;->isDefaultTransitionOptionsSet:Z

    .line 3
    iput-object p2, p0, Lcom/bumptech/glide/RequestBuilder;->requestManager:Lcom/bumptech/glide/RequestManager;

    .line 4
    iput-object p3, p0, Lcom/bumptech/glide/RequestBuilder;->transcodeClass:Ljava/lang/Class;

    .line 5
    iput-object p4, p0, Lcom/bumptech/glide/RequestBuilder;->context:Landroid/content/Context;

    .line 6
    iget-object p4, p2, Lcom/bumptech/glide/RequestManager;->glide:Lcom/bumptech/glide/Glide;

    .line 7
    iget-object p4, p4, Lcom/bumptech/glide/Glide;->glideContext:Lcom/bumptech/glide/GlideContext;

    .line 8
    iget-object v0, p4, Lcom/bumptech/glide/GlideContext;->defaultTransitionOptions:Ljava/util/Map;

    invoke-interface {v0, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/TransitionOptions;

    if-nez v0, :cond_1

    .line 9
    iget-object p4, p4, Lcom/bumptech/glide/GlideContext;->defaultTransitionOptions:Ljava/util/Map;

    invoke-interface {p4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p4

    invoke-interface {p4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p4

    :cond_0
    :goto_0
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 10
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    invoke-virtual {v2, p3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 11
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/TransitionOptions;

    goto :goto_0

    :cond_1
    if-nez v0, :cond_2

    .line 12
    sget-object v0, Lcom/bumptech/glide/GlideContext;->DEFAULT_TRANSITION_OPTIONS:Lcom/bumptech/glide/TransitionOptions;

    .line 13
    :cond_2
    iput-object v0, p0, Lcom/bumptech/glide/RequestBuilder;->transitionOptions:Lcom/bumptech/glide/TransitionOptions;

    .line 14
    iget-object p1, p1, Lcom/bumptech/glide/Glide;->glideContext:Lcom/bumptech/glide/GlideContext;

    .line 15
    iput-object p1, p0, Lcom/bumptech/glide/RequestBuilder;->glideContext:Lcom/bumptech/glide/GlideContext;

    .line 16
    iget-object p1, p2, Lcom/bumptech/glide/RequestManager;->defaultRequestListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 17
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_3
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/bumptech/glide/request/RequestListener;

    if-eqz p3, :cond_3

    .line 18
    iget-object p4, p0, Lcom/bumptech/glide/RequestBuilder;->requestListeners:Ljava/util/List;

    if-nez p4, :cond_4

    .line 19
    new-instance p4, Ljava/util/ArrayList;

    invoke-direct {p4}, Ljava/util/ArrayList;-><init>()V

    iput-object p4, p0, Lcom/bumptech/glide/RequestBuilder;->requestListeners:Ljava/util/List;

    .line 20
    :cond_4
    iget-object p4, p0, Lcom/bumptech/glide/RequestBuilder;->requestListeners:Ljava/util/List;

    invoke-interface {p4, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 21
    :cond_5
    iget-object p1, p2, Lcom/bumptech/glide/RequestManager;->requestOptions:Lcom/bumptech/glide/request/RequestOptions;

    .line 22
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    return-void
.end method


# virtual methods
.method public apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/RequestBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "requestOptions"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/BaseRequestOptions<",
            "*>;)",
            "Lcom/bumptech/glide/RequestBuilder<",
            "TTranscodeType;>;"
        }
    .end annotation

    const-string v0, "Argument must not be null"

    .line 1
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2
    invoke-super {p0, p1}, Lcom/bumptech/glide/request/BaseRequestOptions;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p0

    check-cast p0, Lcom/bumptech/glide/RequestBuilder;

    return-object p0
.end method

.method public bridge synthetic apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/request/BaseRequestOptions;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "requestOptions"
        }
    .end annotation

    .line 3
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    return-object p0
.end method

.method public final buildRequestRecursive(Lcom/bumptech/glide/request/target/Target;Lcom/bumptech/glide/request/RequestListener;Lcom/bumptech/glide/request/RequestCoordinator;Lcom/bumptech/glide/TransitionOptions;Lcom/bumptech/glide/Priority;IILcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/request/Request;
    .locals 19
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
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
            "target",
            "targetListener",
            "parentCoordinator",
            "transitionOptions",
            "priority",
            "overrideWidth",
            "overrideHeight",
            "requestOptions"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/target/Target<",
            "TTranscodeType;>;",
            "Lcom/bumptech/glide/request/RequestListener<",
            "TTranscodeType;>;",
            "Lcom/bumptech/glide/request/RequestCoordinator;",
            "Lcom/bumptech/glide/TransitionOptions<",
            "*-TTranscodeType;>;",
            "Lcom/bumptech/glide/Priority;",
            "II",
            "Lcom/bumptech/glide/request/BaseRequestOptions<",
            "*>;)",
            "Lcom/bumptech/glide/request/Request;"
        }
    .end annotation

    move-object/from16 v9, p0

    move-object/from16 v3, p8

    .line 1
    iget-object v0, v9, Lcom/bumptech/glide/RequestBuilder;->thumbnailBuilder:Lcom/bumptech/glide/RequestBuilder;

    if-eqz v0, :cond_4

    .line 2
    iget-boolean v1, v9, Lcom/bumptech/glide/RequestBuilder;->isThumbnailBuilt:Z

    if-nez v1, :cond_3

    .line 3
    iget-object v1, v0, Lcom/bumptech/glide/RequestBuilder;->transitionOptions:Lcom/bumptech/glide/TransitionOptions;

    .line 4
    iget-boolean v2, v0, Lcom/bumptech/glide/RequestBuilder;->isDefaultTransitionOptionsSet:Z

    if-eqz v2, :cond_0

    move-object/from16 v14, p4

    goto :goto_0

    :cond_0
    move-object v14, v1

    .line 5
    :goto_0
    iget v0, v0, Lcom/bumptech/glide/request/BaseRequestOptions;->fields:I

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/BaseRequestOptions;->isSet(II)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 6
    iget-object v0, v9, Lcom/bumptech/glide/RequestBuilder;->thumbnailBuilder:Lcom/bumptech/glide/RequestBuilder;

    .line 7
    iget-object v0, v0, Lcom/bumptech/glide/request/BaseRequestOptions;->priority:Lcom/bumptech/glide/Priority;

    move-object/from16 v6, p5

    goto :goto_1

    :cond_1
    move-object/from16 v6, p5

    .line 8
    invoke-virtual {v9, v6}, Lcom/bumptech/glide/RequestBuilder;->getThumbnailPriority(Lcom/bumptech/glide/Priority;)Lcom/bumptech/glide/Priority;

    move-result-object v0

    :goto_1
    move-object v15, v0

    .line 9
    iget-object v0, v9, Lcom/bumptech/glide/RequestBuilder;->thumbnailBuilder:Lcom/bumptech/glide/RequestBuilder;

    .line 10
    iget v1, v0, Lcom/bumptech/glide/request/BaseRequestOptions;->overrideWidth:I

    .line 11
    iget v0, v0, Lcom/bumptech/glide/request/BaseRequestOptions;->overrideHeight:I

    .line 12
    invoke-static/range {p6 .. p7}, Lcom/bumptech/glide/util/Util;->isValidDimensions(II)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, v9, Lcom/bumptech/glide/RequestBuilder;->thumbnailBuilder:Lcom/bumptech/glide/RequestBuilder;

    .line 13
    iget v4, v2, Lcom/bumptech/glide/request/BaseRequestOptions;->overrideWidth:I

    iget v2, v2, Lcom/bumptech/glide/request/BaseRequestOptions;->overrideHeight:I

    invoke-static {v4, v2}, Lcom/bumptech/glide/util/Util;->isValidDimensions(II)Z

    move-result v2

    if-nez v2, :cond_2

    .line 14
    iget v0, v3, Lcom/bumptech/glide/request/BaseRequestOptions;->overrideWidth:I

    .line 15
    iget v1, v3, Lcom/bumptech/glide/request/BaseRequestOptions;->overrideHeight:I

    move/from16 v16, v0

    move/from16 v17, v1

    goto :goto_2

    :cond_2
    move/from16 v17, v0

    move/from16 v16, v1

    .line 16
    :goto_2
    new-instance v13, Lcom/bumptech/glide/request/ThumbnailRequestCoordinator;

    move-object/from16 v4, p3

    invoke-direct {v13, v4}, Lcom/bumptech/glide/request/ThumbnailRequestCoordinator;-><init>(Lcom/bumptech/glide/request/RequestCoordinator;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p8

    move-object v4, v13

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    .line 17
    invoke-virtual/range {v0 .. v8}, Lcom/bumptech/glide/RequestBuilder;->obtainRequest(Lcom/bumptech/glide/request/target/Target;Lcom/bumptech/glide/request/RequestListener;Lcom/bumptech/glide/request/BaseRequestOptions;Lcom/bumptech/glide/request/RequestCoordinator;Lcom/bumptech/glide/TransitionOptions;Lcom/bumptech/glide/Priority;II)Lcom/bumptech/glide/request/Request;

    move-result-object v0

    const/4 v1, 0x1

    .line 18
    iput-boolean v1, v9, Lcom/bumptech/glide/RequestBuilder;->isThumbnailBuilt:Z

    .line 19
    iget-object v1, v9, Lcom/bumptech/glide/RequestBuilder;->thumbnailBuilder:Lcom/bumptech/glide/RequestBuilder;

    move-object v10, v1

    move-object/from16 v11, p1

    move-object/from16 v12, p2

    move-object v2, v13

    move-object/from16 v18, v1

    .line 20
    invoke-virtual/range {v10 .. v18}, Lcom/bumptech/glide/RequestBuilder;->buildRequestRecursive(Lcom/bumptech/glide/request/target/Target;Lcom/bumptech/glide/request/RequestListener;Lcom/bumptech/glide/request/RequestCoordinator;Lcom/bumptech/glide/TransitionOptions;Lcom/bumptech/glide/Priority;IILcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/request/Request;

    move-result-object v1

    const/4 v3, 0x0

    .line 21
    iput-boolean v3, v9, Lcom/bumptech/glide/RequestBuilder;->isThumbnailBuilt:Z

    .line 22
    iput-object v0, v2, Lcom/bumptech/glide/request/ThumbnailRequestCoordinator;->full:Lcom/bumptech/glide/request/Request;

    .line 23
    iput-object v1, v2, Lcom/bumptech/glide/request/ThumbnailRequestCoordinator;->thumb:Lcom/bumptech/glide/request/Request;

    goto :goto_3

    .line 24
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot use a request as both the main request and a thumbnail, consider using clone() on the request(s) passed to thumbnail()"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    move-object/from16 v4, p3

    move-object/from16 v6, p5

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p8

    move-object/from16 v5, p4

    move/from16 v7, p6

    move/from16 v8, p7

    .line 25
    invoke-virtual/range {v0 .. v8}, Lcom/bumptech/glide/RequestBuilder;->obtainRequest(Lcom/bumptech/glide/request/target/Target;Lcom/bumptech/glide/request/RequestListener;Lcom/bumptech/glide/request/BaseRequestOptions;Lcom/bumptech/glide/request/RequestCoordinator;Lcom/bumptech/glide/TransitionOptions;Lcom/bumptech/glide/Priority;II)Lcom/bumptech/glide/request/Request;

    move-result-object v13

    :goto_3
    return-object v13
.end method

.method public clone()Lcom/bumptech/glide/request/BaseRequestOptions;
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/bumptech/glide/request/BaseRequestOptions;->clone()Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p0

    check-cast p0, Lcom/bumptech/glide/RequestBuilder;

    .line 2
    iget-object v0, p0, Lcom/bumptech/glide/RequestBuilder;->transitionOptions:Lcom/bumptech/glide/TransitionOptions;

    invoke-virtual {v0}, Lcom/bumptech/glide/TransitionOptions;->clone()Lcom/bumptech/glide/TransitionOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/RequestBuilder;->transitionOptions:Lcom/bumptech/glide/TransitionOptions;

    return-object p0
.end method

.method public clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 3
    invoke-super {p0}, Lcom/bumptech/glide/request/BaseRequestOptions;->clone()Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p0

    check-cast p0, Lcom/bumptech/glide/RequestBuilder;

    .line 4
    iget-object v0, p0, Lcom/bumptech/glide/RequestBuilder;->transitionOptions:Lcom/bumptech/glide/TransitionOptions;

    invoke-virtual {v0}, Lcom/bumptech/glide/TransitionOptions;->clone()Lcom/bumptech/glide/TransitionOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/RequestBuilder;->transitionOptions:Lcom/bumptech/glide/TransitionOptions;

    return-object p0
.end method

.method public final getThumbnailPriority(Lcom/bumptech/glide/Priority;)Lcom/bumptech/glide/Priority;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "current"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_2

    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    .line 2
    sget-object p0, Lcom/bumptech/glide/Priority;->NORMAL:Lcom/bumptech/glide/Priority;

    return-object p0

    .line 3
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 4
    iget-object p0, p0, Lcom/bumptech/glide/request/BaseRequestOptions;->priority:Lcom/bumptech/glide/Priority;

    .line 5
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x12

    const-string v1, "unknown priority: "

    invoke-static {v0, v1, p0}, Lcom/bumptech/glide/Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 6
    :cond_1
    sget-object p0, Lcom/bumptech/glide/Priority;->HIGH:Lcom/bumptech/glide/Priority;

    return-object p0

    .line 7
    :cond_2
    sget-object p0, Lcom/bumptech/glide/Priority;->IMMEDIATE:Lcom/bumptech/glide/Priority;

    return-object p0
.end method

.method public final into(Lcom/bumptech/glide/request/target/Target;Lcom/bumptech/glide/request/RequestListener;Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/request/target/Target;
    .locals 11
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "target",
            "targetListener",
            "options"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Y::",
            "Lcom/bumptech/glide/request/target/Target<",
            "TTranscodeType;>;>(TY;",
            "Lcom/bumptech/glide/request/RequestListener<",
            "TTranscodeType;>;",
            "Lcom/bumptech/glide/request/BaseRequestOptions<",
            "*>;)TY;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/bumptech/glide/util/Util;->assertMainThread()V

    const-string v0, "Argument must not be null"

    .line 2
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3
    iget-boolean v1, p0, Lcom/bumptech/glide/RequestBuilder;->isModelSet:Z

    if-eqz v1, :cond_5

    .line 4
    iget-object v6, p0, Lcom/bumptech/glide/RequestBuilder;->transitionOptions:Lcom/bumptech/glide/TransitionOptions;

    .line 5
    iget-object v7, p3, Lcom/bumptech/glide/request/BaseRequestOptions;->priority:Lcom/bumptech/glide/Priority;

    .line 6
    iget v8, p3, Lcom/bumptech/glide/request/BaseRequestOptions;->overrideWidth:I

    .line 7
    iget v9, p3, Lcom/bumptech/glide/request/BaseRequestOptions;->overrideHeight:I

    const/4 v5, 0x0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v10, p3

    .line 8
    invoke-virtual/range {v2 .. v10}, Lcom/bumptech/glide/RequestBuilder;->buildRequestRecursive(Lcom/bumptech/glide/request/target/Target;Lcom/bumptech/glide/request/RequestListener;Lcom/bumptech/glide/request/RequestCoordinator;Lcom/bumptech/glide/TransitionOptions;Lcom/bumptech/glide/Priority;IILcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/request/Request;

    move-result-object p2

    .line 9
    invoke-interface {p1}, Lcom/bumptech/glide/request/target/Target;->getRequest()Lcom/bumptech/glide/request/Request;

    move-result-object v1

    .line 10
    invoke-interface {p2, v1}, Lcom/bumptech/glide/request/Request;->isEquivalentTo(Lcom/bumptech/glide/request/Request;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 11
    iget-boolean p3, p3, Lcom/bumptech/glide/request/BaseRequestOptions;->isCacheable:Z

    if-nez p3, :cond_0

    .line 12
    invoke-interface {v1}, Lcom/bumptech/glide/request/Request;->isComplete()Z

    move-result p3

    if-eqz p3, :cond_0

    const/4 p3, 0x1

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    :goto_0
    if-nez p3, :cond_2

    .line 13
    invoke-interface {p2}, Lcom/bumptech/glide/request/Request;->recycle()V

    .line 14
    invoke-static {v1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 15
    invoke-interface {v1}, Lcom/bumptech/glide/request/Request;->isRunning()Z

    move-result p0

    if-nez p0, :cond_1

    .line 16
    invoke-interface {v1}, Lcom/bumptech/glide/request/Request;->begin()V

    :cond_1
    return-object p1

    .line 17
    :cond_2
    iget-object p3, p0, Lcom/bumptech/glide/RequestBuilder;->requestManager:Lcom/bumptech/glide/RequestManager;

    invoke-virtual {p3, p1}, Lcom/bumptech/glide/RequestManager;->clear(Lcom/bumptech/glide/request/target/Target;)V

    .line 18
    invoke-interface {p1, p2}, Lcom/bumptech/glide/request/target/Target;->setRequest(Lcom/bumptech/glide/request/Request;)V

    .line 19
    iget-object p0, p0, Lcom/bumptech/glide/RequestBuilder;->requestManager:Lcom/bumptech/glide/RequestManager;

    .line 20
    iget-object p3, p0, Lcom/bumptech/glide/RequestManager;->targetTracker:Lcom/bumptech/glide/manager/TargetTracker;

    .line 21
    iget-object p3, p3, Lcom/bumptech/glide/manager/TargetTracker;->targets:Ljava/util/Set;

    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 22
    iget-object p0, p0, Lcom/bumptech/glide/RequestManager;->requestTracker:Lcom/bumptech/glide/manager/RequestTracker;

    .line 23
    iget-object p3, p0, Lcom/bumptech/glide/manager/RequestTracker;->requests:Ljava/util/Set;

    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 24
    iget-boolean p3, p0, Lcom/bumptech/glide/manager/RequestTracker;->isPaused:Z

    if-nez p3, :cond_3

    .line 25
    invoke-interface {p2}, Lcom/bumptech/glide/request/Request;->begin()V

    goto :goto_1

    .line 26
    :cond_3
    invoke-interface {p2}, Lcom/bumptech/glide/request/Request;->clear()V

    const/4 p3, 0x2

    const-string v0, "RequestTracker"

    .line 27
    invoke-static {v0, p3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p3

    if-eqz p3, :cond_4

    const-string p3, "Paused, delaying request"

    .line 28
    invoke-static {v0, p3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    :cond_4
    iget-object p0, p0, Lcom/bumptech/glide/manager/RequestTracker;->pendingRequests:Ljava/util/List;

    invoke-interface {p0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_1
    return-object p1

    .line 30
    :cond_5
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "You must call #load() before calling #into()"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "view"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/ImageView;",
            ")",
            "Lcom/bumptech/glide/request/target/ViewTarget<",
            "Landroid/widget/ImageView;",
            "TTranscodeType;>;"
        }
    .end annotation

    .line 31
    invoke-static {}, Lcom/bumptech/glide/util/Util;->assertMainThread()V

    const-string v0, "Argument must not be null"

    .line 32
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 33
    iget v0, p0, Lcom/bumptech/glide/request/BaseRequestOptions;->fields:I

    const/16 v1, 0x800

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/BaseRequestOptions;->isSet(II)Z

    move-result v0

    if-nez v0, :cond_0

    .line 34
    iget-boolean v0, p0, Lcom/bumptech/glide/request/BaseRequestOptions;->isTransformationAllowed:Z

    if-eqz v0, :cond_0

    .line 35
    invoke-virtual {p1}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 36
    sget-object v0, Lcom/bumptech/glide/RequestBuilder$2;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    invoke-virtual {p1}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 37
    :pswitch_0
    invoke-virtual {p0}, Lcom/bumptech/glide/RequestBuilder;->clone()Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object v0

    .line 38
    sget-object v2, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->CENTER_INSIDE:Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;

    new-instance v3, Lcom/bumptech/glide/load/resource/bitmap/CenterInside;

    invoke-direct {v3}, Lcom/bumptech/glide/load/resource/bitmap/CenterInside;-><init>()V

    .line 39
    invoke-virtual {v0, v2, v3}, Lcom/bumptech/glide/request/BaseRequestOptions;->optionalTransform(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/Transformation;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object v0

    .line 40
    iput-boolean v1, v0, Lcom/bumptech/glide/request/BaseRequestOptions;->isScaleOnlyOrNoTransform:Z

    goto :goto_1

    .line 41
    :pswitch_1
    invoke-virtual {p0}, Lcom/bumptech/glide/RequestBuilder;->clone()Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object v0

    .line 42
    sget-object v2, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->FIT_CENTER:Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;

    new-instance v3, Lcom/bumptech/glide/load/resource/bitmap/FitCenter;

    invoke-direct {v3}, Lcom/bumptech/glide/load/resource/bitmap/FitCenter;-><init>()V

    .line 43
    invoke-virtual {v0, v2, v3}, Lcom/bumptech/glide/request/BaseRequestOptions;->optionalTransform(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/Transformation;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object v0

    .line 44
    iput-boolean v1, v0, Lcom/bumptech/glide/request/BaseRequestOptions;->isScaleOnlyOrNoTransform:Z

    goto :goto_1

    .line 45
    :pswitch_2
    invoke-virtual {p0}, Lcom/bumptech/glide/RequestBuilder;->clone()Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object v0

    .line 46
    sget-object v2, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->CENTER_INSIDE:Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;

    new-instance v3, Lcom/bumptech/glide/load/resource/bitmap/CenterInside;

    invoke-direct {v3}, Lcom/bumptech/glide/load/resource/bitmap/CenterInside;-><init>()V

    .line 47
    invoke-virtual {v0, v2, v3}, Lcom/bumptech/glide/request/BaseRequestOptions;->optionalTransform(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/Transformation;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object v0

    .line 48
    iput-boolean v1, v0, Lcom/bumptech/glide/request/BaseRequestOptions;->isScaleOnlyOrNoTransform:Z

    goto :goto_1

    .line 49
    :pswitch_3
    invoke-virtual {p0}, Lcom/bumptech/glide/RequestBuilder;->clone()Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object v0

    .line 50
    sget-object v1, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->CENTER_OUTSIDE:Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;

    new-instance v2, Lcom/bumptech/glide/load/resource/bitmap/CenterCrop;

    invoke-direct {v2}, Lcom/bumptech/glide/load/resource/bitmap/CenterCrop;-><init>()V

    invoke-virtual {v0, v1, v2}, Lcom/bumptech/glide/request/BaseRequestOptions;->optionalTransform(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/Transformation;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object v0

    goto :goto_1

    :cond_0
    :goto_0
    move-object v0, p0

    .line 51
    :goto_1
    iget-object v1, p0, Lcom/bumptech/glide/RequestBuilder;->glideContext:Lcom/bumptech/glide/GlideContext;

    iget-object v2, p0, Lcom/bumptech/glide/RequestBuilder;->transcodeClass:Ljava/lang/Class;

    .line 52
    iget-object v1, v1, Lcom/bumptech/glide/GlideContext;->imageViewTargetFactory:Lcom/bumptech/glide/request/target/ImageViewTargetFactory;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    const-class v1, Landroid/graphics/Bitmap;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 54
    new-instance v1, Lcom/bumptech/glide/request/target/BitmapImageViewTarget;

    invoke-direct {v1, p1}, Lcom/bumptech/glide/request/target/BitmapImageViewTarget;-><init>(Landroid/widget/ImageView;)V

    goto :goto_2

    .line 55
    :cond_1
    const-class v1, Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 56
    new-instance v1, Lcom/bumptech/glide/request/target/DrawableImageViewTarget;

    invoke-direct {v1, p1}, Lcom/bumptech/glide/request/target/DrawableImageViewTarget;-><init>(Landroid/widget/ImageView;)V

    :goto_2
    const/4 p1, 0x0

    .line 57
    invoke-virtual {p0, v1, p1, v0}, Lcom/bumptech/glide/RequestBuilder;->into(Lcom/bumptech/glide/request/target/Target;Lcom/bumptech/glide/request/RequestListener;Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/request/target/Target;

    return-object v1

    .line 58
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x40

    const-string v1, "Unhandled class: "

    const-string v2, ", try .as*(Class).transcode(ResourceTranscoder)"

    invoke-static {v0, v1, p1, v2}, Landroidx/viewpager2/widget/FakeDrag$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public load(Landroid/net/Uri;)Lcom/bumptech/glide/RequestBuilder;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "uri"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")",
            "Lcom/bumptech/glide/RequestBuilder<",
            "TTranscodeType;>;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/bumptech/glide/RequestBuilder;->model:Ljava/lang/Object;

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/bumptech/glide/RequestBuilder;->isModelSet:Z

    return-object p0
.end method

.method public load(Ljava/lang/Object;)Lcom/bumptech/glide/RequestBuilder;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "model"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Lcom/bumptech/glide/RequestBuilder<",
            "TTranscodeType;>;"
        }
    .end annotation

    .line 3
    iput-object p1, p0, Lcom/bumptech/glide/RequestBuilder;->model:Ljava/lang/Object;

    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lcom/bumptech/glide/RequestBuilder;->isModelSet:Z

    return-object p0
.end method

.method public final obtainRequest(Lcom/bumptech/glide/request/target/Target;Lcom/bumptech/glide/request/RequestListener;Lcom/bumptech/glide/request/BaseRequestOptions;Lcom/bumptech/glide/request/RequestCoordinator;Lcom/bumptech/glide/TransitionOptions;Lcom/bumptech/glide/Priority;II)Lcom/bumptech/glide/request/Request;
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
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
            "target",
            "targetListener",
            "requestOptions",
            "requestCoordinator",
            "transitionOptions",
            "priority",
            "overrideWidth",
            "overrideHeight"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/target/Target<",
            "TTranscodeType;>;",
            "Lcom/bumptech/glide/request/RequestListener<",
            "TTranscodeType;>;",
            "Lcom/bumptech/glide/request/BaseRequestOptions<",
            "*>;",
            "Lcom/bumptech/glide/request/RequestCoordinator;",
            "Lcom/bumptech/glide/TransitionOptions<",
            "*-TTranscodeType;>;",
            "Lcom/bumptech/glide/Priority;",
            "II)",
            "Lcom/bumptech/glide/request/Request;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/RequestBuilder;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/bumptech/glide/RequestBuilder;->glideContext:Lcom/bumptech/glide/GlideContext;

    iget-object v2, p0, Lcom/bumptech/glide/RequestBuilder;->model:Ljava/lang/Object;

    iget-object v3, p0, Lcom/bumptech/glide/RequestBuilder;->transcodeClass:Ljava/lang/Class;

    iget-object p0, p0, Lcom/bumptech/glide/RequestBuilder;->requestListeners:Ljava/util/List;

    .line 2
    iget-object v4, v1, Lcom/bumptech/glide/GlideContext;->engine:Lcom/bumptech/glide/load/engine/Engine;

    .line 3
    iget-object p5, p5, Lcom/bumptech/glide/TransitionOptions;->transitionFactory:Lcom/bumptech/glide/request/transition/TransitionFactory;

    .line 4
    sget-object v5, Lcom/bumptech/glide/request/SingleRequest;->POOL:Landroidx/core/util/Pools$Pool;

    .line 5
    check-cast v5, Lcom/bumptech/glide/util/pool/FactoryPools$FactoryPool;

    invoke-virtual {v5}, Lcom/bumptech/glide/util/pool/FactoryPools$FactoryPool;->acquire()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/bumptech/glide/request/SingleRequest;

    if-nez v5, :cond_0

    .line 6
    new-instance v5, Lcom/bumptech/glide/request/SingleRequest;

    invoke-direct {v5}, Lcom/bumptech/glide/request/SingleRequest;-><init>()V

    .line 7
    :cond_0
    iput-object v0, v5, Lcom/bumptech/glide/request/SingleRequest;->context:Landroid/content/Context;

    .line 8
    iput-object v1, v5, Lcom/bumptech/glide/request/SingleRequest;->glideContext:Lcom/bumptech/glide/GlideContext;

    .line 9
    iput-object v2, v5, Lcom/bumptech/glide/request/SingleRequest;->model:Ljava/lang/Object;

    .line 10
    iput-object v3, v5, Lcom/bumptech/glide/request/SingleRequest;->transcodeClass:Ljava/lang/Class;

    .line 11
    iput-object p3, v5, Lcom/bumptech/glide/request/SingleRequest;->requestOptions:Lcom/bumptech/glide/request/BaseRequestOptions;

    .line 12
    iput p7, v5, Lcom/bumptech/glide/request/SingleRequest;->overrideWidth:I

    .line 13
    iput p8, v5, Lcom/bumptech/glide/request/SingleRequest;->overrideHeight:I

    .line 14
    iput-object p6, v5, Lcom/bumptech/glide/request/SingleRequest;->priority:Lcom/bumptech/glide/Priority;

    .line 15
    iput-object p1, v5, Lcom/bumptech/glide/request/SingleRequest;->target:Lcom/bumptech/glide/request/target/Target;

    .line 16
    iput-object p2, v5, Lcom/bumptech/glide/request/SingleRequest;->targetListener:Lcom/bumptech/glide/request/RequestListener;

    .line 17
    iput-object p0, v5, Lcom/bumptech/glide/request/SingleRequest;->requestListeners:Ljava/util/List;

    .line 18
    iput-object p4, v5, Lcom/bumptech/glide/request/SingleRequest;->requestCoordinator:Lcom/bumptech/glide/request/RequestCoordinator;

    .line 19
    iput-object v4, v5, Lcom/bumptech/glide/request/SingleRequest;->engine:Lcom/bumptech/glide/load/engine/Engine;

    .line 20
    iput-object p5, v5, Lcom/bumptech/glide/request/SingleRequest;->animationFactory:Lcom/bumptech/glide/request/transition/TransitionFactory;

    const/4 p0, 0x1

    .line 21
    iput p0, v5, Lcom/bumptech/glide/request/SingleRequest;->status:I

    return-object v5
.end method

.method public submit()Lcom/bumptech/glide/request/FutureTarget;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/bumptech/glide/request/FutureTarget<",
            "TTranscodeType;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/bumptech/glide/request/RequestFutureTarget;

    iget-object v1, p0, Lcom/bumptech/glide/RequestBuilder;->glideContext:Lcom/bumptech/glide/GlideContext;

    .line 2
    iget-object v1, v1, Lcom/bumptech/glide/GlideContext;->mainHandler:Landroid/os/Handler;

    const/high16 v2, -0x80000000

    .line 3
    invoke-direct {v0, v1, v2, v2}, Lcom/bumptech/glide/request/RequestFutureTarget;-><init>(Landroid/os/Handler;II)V

    .line 4
    invoke-static {}, Lcom/bumptech/glide/util/Util;->isOnBackgroundThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 5
    iget-object v1, p0, Lcom/bumptech/glide/RequestBuilder;->glideContext:Lcom/bumptech/glide/GlideContext;

    .line 6
    iget-object v1, v1, Lcom/bumptech/glide/GlideContext;->mainHandler:Landroid/os/Handler;

    .line 7
    new-instance v2, Lcom/bumptech/glide/RequestBuilder$1;

    invoke-direct {v2, p0, v0}, Lcom/bumptech/glide/RequestBuilder$1;-><init>(Lcom/bumptech/glide/RequestBuilder;Lcom/bumptech/glide/request/RequestFutureTarget;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0, v0, v0, p0}, Lcom/bumptech/glide/RequestBuilder;->into(Lcom/bumptech/glide/request/target/Target;Lcom/bumptech/glide/request/RequestListener;Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/request/target/Target;

    :goto_0
    return-object v0
.end method

.method public transition(Lcom/bumptech/glide/TransitionOptions;)Lcom/bumptech/glide/RequestBuilder;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "transitionOptions"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/TransitionOptions<",
            "*-TTranscodeType;>;)",
            "Lcom/bumptech/glide/RequestBuilder<",
            "TTranscodeType;>;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/bumptech/glide/RequestBuilder;->transitionOptions:Lcom/bumptech/glide/TransitionOptions;

    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/bumptech/glide/RequestBuilder;->isDefaultTransitionOptionsSet:Z

    return-object p0
.end method
