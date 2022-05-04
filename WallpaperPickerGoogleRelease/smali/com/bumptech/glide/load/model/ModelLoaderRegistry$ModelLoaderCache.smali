.class public Lcom/bumptech/glide/load/model/ModelLoaderRegistry$ModelLoaderCache;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/model/ModelLoaderRegistry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ModelLoaderCache"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/model/ModelLoaderRegistry$ModelLoaderCache$Entry;
    }
.end annotation


# instance fields
.field public final cachedModelLoaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/bumptech/glide/load/model/ModelLoaderRegistry$ModelLoaderCache$Entry<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/model/ModelLoaderRegistry$ModelLoaderCache;->cachedModelLoaders:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public put(Ljava/lang/Class;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "modelClass",
            "loaders"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Model:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TModel;>;",
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/model/ModelLoader<",
            "TModel;*>;>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/model/ModelLoaderRegistry$ModelLoaderCache;->cachedModelLoaders:Ljava/util/Map;

    new-instance v0, Lcom/bumptech/glide/load/model/ModelLoaderRegistry$ModelLoaderCache$Entry;

    invoke-direct {v0, p2}, Lcom/bumptech/glide/load/model/ModelLoaderRegistry$ModelLoaderCache$Entry;-><init>(Ljava/util/List;)V

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/bumptech/glide/load/model/ModelLoaderRegistry$ModelLoaderCache$Entry;

    if-nez p0, :cond_0

    return-void

    .line 2
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    add-int/lit8 p2, p2, 0x22

    const-string v0, "Already cached loaders for model: "

    invoke-static {p2, v0, p1}, Lcom/bumptech/glide/Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
