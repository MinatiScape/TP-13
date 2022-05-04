.class public final Lcom/bumptech/glide/GlideBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public animationExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

.field public arrayPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;

.field public bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

.field public connectivityMonitorFactory:Lcom/bumptech/glide/manager/ConnectivityMonitorFactory;

.field public defaultRequestListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/request/RequestListener<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field public defaultRequestOptions:Lcom/bumptech/glide/request/RequestOptions;

.field public final defaultTransitionOptions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/bumptech/glide/TransitionOptions<",
            "**>;>;"
        }
    .end annotation
.end field

.field public diskCacheExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

.field public diskCacheFactory:Lcom/bumptech/glide/load/engine/cache/DiskCache$Factory;

.field public engine:Lcom/bumptech/glide/load/engine/Engine;

.field public memoryCache:Lcom/bumptech/glide/load/engine/cache/MemoryCache;

.field public memorySizeCalculator:Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;

.field public requestManagerFactory:Lcom/bumptech/glide/manager/RequestManagerRetriever$RequestManagerFactory;

.field public sourceExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Landroidx/collection/ArrayMap;

    invoke-direct {v0}, Landroidx/collection/ArrayMap;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/GlideBuilder;->defaultTransitionOptions:Ljava/util/Map;

    .line 3
    new-instance v0, Lcom/bumptech/glide/request/RequestOptions;

    invoke-direct {v0}, Lcom/bumptech/glide/request/RequestOptions;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/GlideBuilder;->defaultRequestOptions:Lcom/bumptech/glide/request/RequestOptions;

    return-void
.end method
