.class public Lcom/bumptech/glide/GlideContext;
.super Landroid/content/ContextWrapper;
.source "SourceFile"


# static fields
.field public static final DEFAULT_TRANSITION_OPTIONS:Lcom/bumptech/glide/TransitionOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/TransitionOptions<",
            "**>;"
        }
    .end annotation
.end field


# instance fields
.field public final arrayPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;

.field public final defaultRequestListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/request/RequestListener<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field public final defaultRequestOptions:Lcom/bumptech/glide/request/RequestOptions;

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

.field public final engine:Lcom/bumptech/glide/load/engine/Engine;

.field public final imageViewTargetFactory:Lcom/bumptech/glide/request/target/ImageViewTargetFactory;

.field public final logLevel:I

.field public final mainHandler:Landroid/os/Handler;

.field public final registry:Lcom/bumptech/glide/Registry;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/bumptech/glide/GenericTransitionOptions;

    invoke-direct {v0}, Lcom/bumptech/glide/GenericTransitionOptions;-><init>()V

    sput-object v0, Lcom/bumptech/glide/GlideContext;->DEFAULT_TRANSITION_OPTIONS:Lcom/bumptech/glide/TransitionOptions;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;Lcom/bumptech/glide/Registry;Lcom/bumptech/glide/request/target/ImageViewTargetFactory;Lcom/bumptech/glide/request/RequestOptions;Ljava/util/Map;Ljava/util/List;Lcom/bumptech/glide/load/engine/Engine;I)V
    .locals 0
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
            0x0
        }
        names = {
            "context",
            "arrayPool",
            "registry",
            "imageViewTargetFactory",
            "defaultRequestOptions",
            "defaultTransitionOptions",
            "defaultRequestListeners",
            "engine",
            "logLevel"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;",
            "Lcom/bumptech/glide/Registry;",
            "Lcom/bumptech/glide/request/target/ImageViewTargetFactory;",
            "Lcom/bumptech/glide/request/RequestOptions;",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/bumptech/glide/TransitionOptions<",
            "**>;>;",
            "Ljava/util/List<",
            "Lcom/bumptech/glide/request/RequestListener<",
            "Ljava/lang/Object;",
            ">;>;",
            "Lcom/bumptech/glide/load/engine/Engine;",
            "I)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/content/ContextWrapper;-><init>(Landroid/content/Context;)V

    .line 2
    iput-object p2, p0, Lcom/bumptech/glide/GlideContext;->arrayPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;

    .line 3
    iput-object p3, p0, Lcom/bumptech/glide/GlideContext;->registry:Lcom/bumptech/glide/Registry;

    .line 4
    iput-object p4, p0, Lcom/bumptech/glide/GlideContext;->imageViewTargetFactory:Lcom/bumptech/glide/request/target/ImageViewTargetFactory;

    .line 5
    iput-object p5, p0, Lcom/bumptech/glide/GlideContext;->defaultRequestOptions:Lcom/bumptech/glide/request/RequestOptions;

    .line 6
    iput-object p7, p0, Lcom/bumptech/glide/GlideContext;->defaultRequestListeners:Ljava/util/List;

    .line 7
    iput-object p6, p0, Lcom/bumptech/glide/GlideContext;->defaultTransitionOptions:Ljava/util/Map;

    .line 8
    iput-object p8, p0, Lcom/bumptech/glide/GlideContext;->engine:Lcom/bumptech/glide/load/engine/Engine;

    .line 9
    iput p9, p0, Lcom/bumptech/glide/GlideContext;->logLevel:I

    .line 10
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/bumptech/glide/GlideContext;->mainHandler:Landroid/os/Handler;

    return-void
.end method
