.class public abstract Lcom/google/common/collect/ForwardingConcurrentMap;
.super Lcom/google/common/collect/ForwardingMap;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/ConcurrentMap;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ForwardingMap<",
        "TK;TV;>;",
        "Ljava/util/concurrent/ConcurrentMap<",
        "TK;TV;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/common/collect/ForwardingMap;-><init>()V

    return-void
.end method


# virtual methods
.method public putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "key",
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .line 1
    check-cast p0, Lcom/google/common/collect/MapMakerInternalMap$AbstractSerializationProxy;

    .line 2
    iget-object p0, p0, Lcom/google/common/collect/MapMakerInternalMap$AbstractSerializationProxy;->delegate:Ljava/util/concurrent/ConcurrentMap;

    .line 3
    invoke-interface {p0, p1, p2}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public remove(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "key",
            "value"
        }
    .end annotation

    .line 1
    check-cast p0, Lcom/google/common/collect/MapMakerInternalMap$AbstractSerializationProxy;

    .line 2
    iget-object p0, p0, Lcom/google/common/collect/MapMakerInternalMap$AbstractSerializationProxy;->delegate:Ljava/util/concurrent/ConcurrentMap;

    .line 3
    invoke-interface {p0, p1, p2}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "key",
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .line 1
    check-cast p0, Lcom/google/common/collect/MapMakerInternalMap$AbstractSerializationProxy;

    .line 2
    iget-object p0, p0, Lcom/google/common/collect/MapMakerInternalMap$AbstractSerializationProxy;->delegate:Ljava/util/concurrent/ConcurrentMap;

    .line 3
    invoke-interface {p0, p1, p2}, Ljava/util/concurrent/ConcurrentMap;->replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "key",
            "oldValue",
            "newValue"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;TV;)Z"
        }
    .end annotation

    .line 4
    check-cast p0, Lcom/google/common/collect/MapMakerInternalMap$AbstractSerializationProxy;

    .line 5
    iget-object p0, p0, Lcom/google/common/collect/MapMakerInternalMap$AbstractSerializationProxy;->delegate:Ljava/util/concurrent/ConcurrentMap;

    .line 6
    invoke-interface {p0, p1, p2, p3}, Ljava/util/concurrent/ConcurrentMap;->replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method
