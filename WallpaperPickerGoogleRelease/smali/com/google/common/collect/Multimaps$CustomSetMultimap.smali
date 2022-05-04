.class public Lcom/google/common/collect/Multimaps$CustomSetMultimap;
.super Lcom/google/common/collect/AbstractSetMultimap;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/AbstractSetMultimap<",
        "TK;TV;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J


# instance fields
.field public transient factory:Lcom/google/common/base/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Supplier<",
            "+",
            "Ljava/util/Set<",
            "TV;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Map;Lcom/google/common/base/Supplier;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "map",
            "factory"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "TK;",
            "Ljava/util/Collection<",
            "TV;>;>;",
            "Lcom/google/common/base/Supplier<",
            "+",
            "Ljava/util/Set<",
            "TV;>;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/google/common/collect/AbstractSetMultimap;-><init>(Ljava/util/Map;)V

    .line 2
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iput-object p2, p0, Lcom/google/common/collect/Multimaps$CustomSetMultimap;->factory:Lcom/google/common/base/Supplier;

    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "stream"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 2
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/base/Supplier;

    iput-object v0, p0, Lcom/google/common/collect/Multimaps$CustomSetMultimap;->factory:Lcom/google/common/base/Supplier;

    .line 3
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    .line 4
    invoke-virtual {p0, p1}, Lcom/google/common/collect/AbstractMapBasedMultimap;->setMap(Ljava/util/Map;)V

    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "stream"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 2
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$CustomSetMultimap;->factory:Lcom/google/common/base/Supplier;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 3
    iget-object p0, p0, Lcom/google/common/collect/AbstractMapBasedMultimap;->map:Ljava/util/Map;

    .line 4
    invoke-virtual {p1, p0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public createAsMap()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "TK;",
            "Ljava/util/Collection<",
            "TV;>;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/common/collect/AbstractMapBasedMultimap;->map:Ljava/util/Map;

    instance-of v1, v0, Ljava/util/NavigableMap;

    if-eqz v1, :cond_0

    .line 2
    new-instance v0, Lcom/google/common/collect/AbstractMapBasedMultimap$NavigableAsMap;

    iget-object v1, p0, Lcom/google/common/collect/AbstractMapBasedMultimap;->map:Ljava/util/Map;

    check-cast v1, Ljava/util/NavigableMap;

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/AbstractMapBasedMultimap$NavigableAsMap;-><init>(Lcom/google/common/collect/AbstractMapBasedMultimap;Ljava/util/NavigableMap;)V

    goto :goto_0

    .line 3
    :cond_0
    instance-of v0, v0, Ljava/util/SortedMap;

    if-eqz v0, :cond_1

    .line 4
    new-instance v0, Lcom/google/common/collect/AbstractMapBasedMultimap$SortedAsMap;

    iget-object v1, p0, Lcom/google/common/collect/AbstractMapBasedMultimap;->map:Ljava/util/Map;

    check-cast v1, Ljava/util/SortedMap;

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/AbstractMapBasedMultimap$SortedAsMap;-><init>(Lcom/google/common/collect/AbstractMapBasedMultimap;Ljava/util/SortedMap;)V

    goto :goto_0

    .line 5
    :cond_1
    new-instance v0, Lcom/google/common/collect/AbstractMapBasedMultimap$AsMap;

    iget-object v1, p0, Lcom/google/common/collect/AbstractMapBasedMultimap;->map:Ljava/util/Map;

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/AbstractMapBasedMultimap$AsMap;-><init>(Lcom/google/common/collect/AbstractMapBasedMultimap;Ljava/util/Map;)V

    :goto_0
    return-object v0
.end method

.method public createCollection()Ljava/util/Collection;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/common/collect/Multimaps$CustomSetMultimap;->factory:Lcom/google/common/base/Supplier;

    invoke-interface {p0}, Lcom/google/common/base/Supplier;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Set;

    return-object p0
.end method

.method public createKeySet()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "TK;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/common/collect/AbstractMapBasedMultimap;->map:Ljava/util/Map;

    instance-of v1, v0, Ljava/util/NavigableMap;

    if-eqz v1, :cond_0

    .line 2
    new-instance v0, Lcom/google/common/collect/AbstractMapBasedMultimap$NavigableKeySet;

    iget-object v1, p0, Lcom/google/common/collect/AbstractMapBasedMultimap;->map:Ljava/util/Map;

    check-cast v1, Ljava/util/NavigableMap;

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/AbstractMapBasedMultimap$NavigableKeySet;-><init>(Lcom/google/common/collect/AbstractMapBasedMultimap;Ljava/util/NavigableMap;)V

    goto :goto_0

    .line 3
    :cond_0
    instance-of v0, v0, Ljava/util/SortedMap;

    if-eqz v0, :cond_1

    .line 4
    new-instance v0, Lcom/google/common/collect/AbstractMapBasedMultimap$SortedKeySet;

    iget-object v1, p0, Lcom/google/common/collect/AbstractMapBasedMultimap;->map:Ljava/util/Map;

    check-cast v1, Ljava/util/SortedMap;

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/AbstractMapBasedMultimap$SortedKeySet;-><init>(Lcom/google/common/collect/AbstractMapBasedMultimap;Ljava/util/SortedMap;)V

    goto :goto_0

    .line 5
    :cond_1
    new-instance v0, Lcom/google/common/collect/AbstractMapBasedMultimap$KeySet;

    iget-object v1, p0, Lcom/google/common/collect/AbstractMapBasedMultimap;->map:Ljava/util/Map;

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/AbstractMapBasedMultimap$KeySet;-><init>(Lcom/google/common/collect/AbstractMapBasedMultimap;Ljava/util/Map;)V

    :goto_0
    return-object v0
.end method

.method public unmodifiableCollectionSubclass(Ljava/util/Collection;)Ljava/util/Collection;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "collection"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection<",
            "TE;>;)",
            "Ljava/util/Collection<",
            "TE;>;"
        }
    .end annotation

    .line 1
    instance-of p0, p1, Ljava/util/NavigableSet;

    if-eqz p0, :cond_0

    .line 2
    check-cast p1, Ljava/util/NavigableSet;

    invoke-static {p1}, Lcom/google/common/collect/Sets;->unmodifiableNavigableSet(Ljava/util/NavigableSet;)Ljava/util/NavigableSet;

    move-result-object p0

    return-object p0

    .line 3
    :cond_0
    instance-of p0, p1, Ljava/util/SortedSet;

    if-eqz p0, :cond_1

    .line 4
    check-cast p1, Ljava/util/SortedSet;

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableSortedSet(Ljava/util/SortedSet;)Ljava/util/SortedSet;

    move-result-object p0

    return-object p0

    .line 5
    :cond_1
    check-cast p1, Ljava/util/Set;

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public wrapCollection(Ljava/lang/Object;Ljava/util/Collection;)Ljava/util/Collection;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "key",
            "collection"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/util/Collection<",
            "TV;>;)",
            "Ljava/util/Collection<",
            "TV;>;"
        }
    .end annotation

    .line 1
    instance-of v0, p2, Ljava/util/NavigableSet;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    new-instance v0, Lcom/google/common/collect/AbstractMapBasedMultimap$WrappedNavigableSet;

    check-cast p2, Ljava/util/NavigableSet;

    invoke-direct {v0, p0, p1, p2, v1}, Lcom/google/common/collect/AbstractMapBasedMultimap$WrappedNavigableSet;-><init>(Lcom/google/common/collect/AbstractMapBasedMultimap;Ljava/lang/Object;Ljava/util/NavigableSet;Lcom/google/common/collect/AbstractMapBasedMultimap$WrappedCollection;)V

    return-object v0

    .line 3
    :cond_0
    instance-of v0, p2, Ljava/util/SortedSet;

    if-eqz v0, :cond_1

    .line 4
    new-instance v0, Lcom/google/common/collect/AbstractMapBasedMultimap$WrappedSortedSet;

    check-cast p2, Ljava/util/SortedSet;

    invoke-direct {v0, p0, p1, p2, v1}, Lcom/google/common/collect/AbstractMapBasedMultimap$WrappedSortedSet;-><init>(Lcom/google/common/collect/AbstractMapBasedMultimap;Ljava/lang/Object;Ljava/util/SortedSet;Lcom/google/common/collect/AbstractMapBasedMultimap$WrappedCollection;)V

    return-object v0

    .line 5
    :cond_1
    new-instance v0, Lcom/google/common/collect/AbstractMapBasedMultimap$WrappedSet;

    check-cast p2, Ljava/util/Set;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/common/collect/AbstractMapBasedMultimap$WrappedSet;-><init>(Lcom/google/common/collect/AbstractMapBasedMultimap;Ljava/lang/Object;Ljava/util/Set;)V

    return-object v0
.end method
