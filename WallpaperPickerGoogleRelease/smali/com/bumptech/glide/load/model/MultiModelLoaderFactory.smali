.class public Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$EmptyModelLoader;,
        Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Factory;,
        Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Entry;
    }
.end annotation


# static fields
.field public static final DEFAULT_FACTORY:Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Factory;

.field public static final EMPTY_MODEL_LOADER:Lcom/bumptech/glide/load/model/ModelLoader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/model/ModelLoader<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final alreadyUsedEntries:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Entry<",
            "**>;>;"
        }
    .end annotation
.end field

.field public final entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Entry<",
            "**>;>;"
        }
    .end annotation
.end field

.field public final factory:Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Factory;

.field public final throwableListPool:Landroidx/core/util/Pools$Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Pools$Pool<",
            "Ljava/util/List<",
            "Ljava/lang/Throwable;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Factory;

    invoke-direct {v0}, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Factory;-><init>()V

    sput-object v0, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;->DEFAULT_FACTORY:Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Factory;

    .line 2
    new-instance v0, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$EmptyModelLoader;

    invoke-direct {v0}, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$EmptyModelLoader;-><init>()V

    sput-object v0, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;->EMPTY_MODEL_LOADER:Lcom/bumptech/glide/load/model/ModelLoader;

    return-void
.end method

.method public constructor <init>(Landroidx/core/util/Pools$Pool;Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Factory;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "throwableListPool",
            "factory"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/core/util/Pools$Pool<",
            "Ljava/util/List<",
            "Ljava/lang/Throwable;",
            ">;>;",
            "Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Factory;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;->entries:Ljava/util/List;

    .line 3
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;->alreadyUsedEntries:Ljava/util/Set;

    .line 4
    iput-object p1, p0, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;->throwableListPool:Landroidx/core/util/Pools$Pool;

    .line 5
    iput-object p2, p0, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;->factory:Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Factory;

    return-void
.end method


# virtual methods
.method public final build(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Entry;)Lcom/bumptech/glide/load/model/ModelLoader;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Model:",
            "Ljava/lang/Object;",
            "Data:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Entry<",
            "**>;)",
            "Lcom/bumptech/glide/load/model/ModelLoader<",
            "TModel;TData;>;"
        }
    .end annotation

    .line 31
    iget-object p1, p1, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Entry;->factory:Lcom/bumptech/glide/load/model/ModelLoaderFactory;

    invoke-interface {p1, p0}, Lcom/bumptech/glide/load/model/ModelLoaderFactory;->build(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;

    move-result-object p0

    const-string p1, "Argument must not be null"

    .line 32
    invoke-static {p0, p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    return-object p0
.end method

.method public declared-synchronized build(Ljava/lang/Class;Ljava/lang/Class;)Lcom/bumptech/glide/load/model/ModelLoader;
    .locals 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "modelClass",
            "dataClass"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Model:",
            "Ljava/lang/Object;",
            "Data:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TModel;>;",
            "Ljava/lang/Class<",
            "TData;>;)",
            "Lcom/bumptech/glide/load/model/ModelLoader<",
            "TModel;TData;>;"
        }
    .end annotation

    monitor-enter p0

    .line 13
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    iget-object v1, p0, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;->entries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    move v4, v2

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Entry;

    .line 15
    iget-object v6, p0, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;->alreadyUsedEntries:Ljava/util/Set;

    invoke-interface {v6, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    move v4, v3

    goto :goto_0

    .line 16
    :cond_1
    iget-object v6, v5, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Entry;->modelClass:Ljava/lang/Class;

    invoke-virtual {v6, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 17
    iget-object v6, v5, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Entry;->dataClass:Ljava/lang/Class;

    invoke-virtual {v6, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_2

    move v6, v3

    goto :goto_1

    :cond_2
    move v6, v2

    :goto_1
    if-eqz v6, :cond_0

    .line 18
    iget-object v6, p0, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;->alreadyUsedEntries:Ljava/util/Set;

    invoke-interface {v6, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 19
    invoke-virtual {p0, v5}, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;->build(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Entry;)Lcom/bumptech/glide/load/model/ModelLoader;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    iget-object v6, p0, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;->alreadyUsedEntries:Ljava/util/Set;

    invoke-interface {v6, v5}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 21
    :cond_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-le v1, v3, :cond_4

    .line 22
    iget-object p1, p0, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;->factory:Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Factory;

    iget-object p2, p0, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;->throwableListPool:Landroidx/core/util/Pools$Pool;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    new-instance p1, Lcom/bumptech/glide/load/model/MultiModelLoader;

    invoke-direct {p1, v0, p2}, Lcom/bumptech/glide/load/model/MultiModelLoader;-><init>(Ljava/util/List;Landroidx/core/util/Pools$Pool;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    monitor-exit p0

    return-object p1

    .line 25
    :cond_4
    :try_start_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ne v1, v3, :cond_5

    .line 26
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/load/model/ModelLoader;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    :cond_5
    if-eqz v4, :cond_6

    .line 27
    :try_start_2
    sget-object p1, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;->EMPTY_MODEL_LOADER:Lcom/bumptech/glide/load/model/ModelLoader;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object p1

    .line 28
    :cond_6
    :try_start_3
    new-instance v0, Lcom/bumptech/glide/Registry$NoModelLoaderAvailableException;

    invoke-direct {v0, p1, p2}, Lcom/bumptech/glide/Registry$NoModelLoaderAvailableException;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception p1

    .line 29
    :try_start_4
    iget-object p2, p0, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;->alreadyUsedEntries:Ljava/util/Set;

    invoke-interface {p2}, Ljava/util/Set;->clear()V

    .line 30
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized build(Ljava/lang/Class;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "modelClass"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Model:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TModel;>;)",
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/model/ModelLoader<",
            "TModel;*>;>;"
        }
    .end annotation

    monitor-enter p0

    .line 1
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2
    iget-object v1, p0, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;->entries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Entry;

    .line 3
    iget-object v3, p0, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;->alreadyUsedEntries:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    .line 4
    :cond_1
    iget-object v3, v2, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Entry;->modelClass:Ljava/lang/Class;

    invoke-virtual {v3, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 5
    iget-object v3, p0, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;->alreadyUsedEntries:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 6
    iget-object v3, v2, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Entry;->factory:Lcom/bumptech/glide/load/model/ModelLoaderFactory;

    invoke-interface {v3, p0}, Lcom/bumptech/glide/load/model/ModelLoaderFactory;->build(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;

    move-result-object v3

    const-string v4, "Argument must not be null"

    .line 7
    invoke-static {v3, v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    iget-object v3, p0, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;->alreadyUsedEntries:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 10
    :cond_2
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    .line 11
    :try_start_1
    iget-object v0, p0, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;->alreadyUsedEntries:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 12
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getDataClasses(Ljava/lang/Class;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "modelClass"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/util/List<",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation

    monitor-enter p0

    .line 1
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2
    iget-object v1, p0, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;->entries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Entry;

    .line 3
    iget-object v3, v2, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Entry;->dataClass:Ljava/lang/Class;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 4
    iget-object v3, v2, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Entry;->modelClass:Ljava/lang/Class;

    invoke-virtual {v3, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 5
    iget-object v2, v2, Lcom/bumptech/glide/load/model/MultiModelLoaderFactory$Entry;->dataClass:Ljava/lang/Class;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 6
    :cond_1
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
