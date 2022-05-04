.class public Landroidx/constraintlayout/solver/Cache;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public arrayRowPool:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/constraintlayout/solver/Pools$SimplePool;"
        }
    .end annotation
.end field

.field public goalVariablePool:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/constraintlayout/solver/Pools$SimplePool;"
        }
    .end annotation
.end field

.field public mIndexedVariables:Ljava/lang/Object;

.field public solverVariablePool:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/constraintlayout/solver/Pools$SimplePool;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance p1, Landroidx/constraintlayout/solver/Pools$SimplePool;

    const/16 v0, 0x100

    invoke-direct {p1, v0}, Landroidx/constraintlayout/solver/Pools$SimplePool;-><init>(I)V

    iput-object p1, p0, Landroidx/constraintlayout/solver/Cache;->arrayRowPool:Ljava/lang/Object;

    .line 3
    new-instance p1, Landroidx/constraintlayout/solver/Pools$SimplePool;

    invoke-direct {p1, v0}, Landroidx/constraintlayout/solver/Pools$SimplePool;-><init>(I)V

    iput-object p1, p0, Landroidx/constraintlayout/solver/Cache;->solverVariablePool:Ljava/lang/Object;

    const/16 p1, 0x20

    new-array p1, p1, [Landroidx/constraintlayout/solver/SolverVariable;

    .line 4
    iput-object p1, p0, Landroidx/constraintlayout/solver/Cache;->mIndexedVariables:Ljava/lang/Object;

    .line 5
    new-instance p1, Landroidx/constraintlayout/solver/Pools$SimplePool;

    const/16 v0, 0x40

    invoke-direct {p1, v0}, Landroidx/constraintlayout/solver/Pools$SimplePool;-><init>(I)V

    iput-object p1, p0, Landroidx/constraintlayout/solver/Cache;->goalVariablePool:Ljava/lang/Object;

    return-void

    .line 6
    :cond_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    new-instance p1, Landroidx/collection/ArrayMap;

    invoke-direct {p1}, Landroidx/collection/ArrayMap;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/solver/Cache;->arrayRowPool:Ljava/lang/Object;

    .line 8
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/solver/Cache;->solverVariablePool:Ljava/lang/Object;

    .line 9
    new-instance p1, Landroidx/collection/LongSparseArray;

    invoke-direct {p1}, Landroidx/collection/LongSparseArray;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/solver/Cache;->goalVariablePool:Ljava/lang/Object;

    .line 10
    new-instance p1, Landroidx/collection/ArrayMap;

    invoke-direct {p1}, Landroidx/collection/ArrayMap;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/solver/Cache;->mIndexedVariables:Ljava/lang/Object;

    return-void

    .line 11
    :cond_1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance p1, Landroidx/core/util/Pools$SimplePool;

    const/16 v0, 0xa

    invoke-direct {p1, v0}, Landroidx/core/util/Pools$SimplePool;-><init>(I)V

    iput-object p1, p0, Landroidx/constraintlayout/solver/Cache;->arrayRowPool:Ljava/lang/Object;

    .line 13
    new-instance p1, Landroidx/collection/SimpleArrayMap;

    invoke-direct {p1}, Landroidx/collection/SimpleArrayMap;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/solver/Cache;->solverVariablePool:Ljava/lang/Object;

    .line 14
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/solver/Cache;->goalVariablePool:Ljava/lang/Object;

    .line 15
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/solver/Cache;->mIndexedVariables:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public addNode(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/Cache;->solverVariablePool:Ljava/lang/Object;

    check-cast v0, Landroidx/collection/SimpleArrayMap;

    .line 2
    invoke-virtual {v0, p1}, Landroidx/collection/SimpleArrayMap;->indexOfKey(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    .line 3
    iget-object p0, p0, Landroidx/constraintlayout/solver/Cache;->solverVariablePool:Ljava/lang/Object;

    check-cast p0, Landroidx/collection/SimpleArrayMap;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroidx/collection/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-void
.end method

.method public dfs(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/HashSet;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/util/ArrayList<",
            "TT;>;",
            "Ljava/util/HashSet<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 2
    :cond_0
    invoke-virtual {p3, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 3
    invoke-virtual {p3, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 4
    iget-object v0, p0, Landroidx/constraintlayout/solver/Cache;->solverVariablePool:Ljava/lang/Object;

    check-cast v0, Landroidx/collection/SimpleArrayMap;

    const/4 v1, 0x0

    .line 5
    invoke-virtual {v0, p1, v1}, Landroidx/collection/SimpleArrayMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 6
    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_0
    if-ge v1, v2, :cond_1

    .line 8
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v3, p2, p3}, Landroidx/constraintlayout/solver/Cache;->dfs(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/HashSet;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 9
    :cond_1
    invoke-virtual {p3, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 10
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    .line 11
    :cond_2
    new-instance p0, Ljava/lang/RuntimeException;

    const-string p1, "This graph contains cyclic dependencies"

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public getEmptyList()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/Cache;->arrayRowPool:Ljava/lang/Object;

    check-cast p0, Landroidx/core/util/Pools$Pool;

    invoke-interface {p0}, Landroidx/core/util/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/ArrayList;

    if-nez p0, :cond_0

    .line 2
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    :cond_0
    return-object p0
.end method

.method public poolList(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 2
    iget-object p0, p0, Landroidx/constraintlayout/solver/Cache;->arrayRowPool:Ljava/lang/Object;

    check-cast p0, Landroidx/core/util/Pools$Pool;

    invoke-interface {p0, p1}, Landroidx/core/util/Pools$Pool;->release(Ljava/lang/Object;)Z

    return-void
.end method
