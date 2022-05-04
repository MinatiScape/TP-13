.class public Lcom/google/common/collect/Iterators$ConcatenatedIterator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Iterators;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ConcatenatedIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public iterator:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "+TT;>;"
        }
    .end annotation
.end field

.field public metaIterators:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Ljava/util/Iterator<",
            "+",
            "Ljava/util/Iterator<",
            "+TT;>;>;>;"
        }
    .end annotation
.end field

.field public toRemove:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "+TT;>;"
        }
    .end annotation
.end field

.field public topMetaIterator:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "+",
            "Ljava/util/Iterator<",
            "+TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Iterator;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "metaIterator"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator<",
            "+",
            "Ljava/util/Iterator<",
            "+TT;>;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    sget-object v0, Lcom/google/common/collect/Iterators$ArrayItr;->EMPTY:Lcom/google/common/collect/AbstractIndexedListIterator;

    .line 3
    iput-object v0, p0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->iterator:Ljava/util/Iterator;

    .line 4
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    iput-object p1, p0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->topMetaIterator:Ljava/util/Iterator;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 3

    .line 1
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->iterator:Ljava/util/Iterator;

    .line 2
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_7

    .line 4
    :goto_1
    iget-object v0, p0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->topMetaIterator:Ljava/util/Iterator;

    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_2

    .line 5
    :cond_1
    iget-object v0, p0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->topMetaIterator:Ljava/util/Iterator;

    goto :goto_3

    .line 6
    :cond_2
    :goto_2
    iget-object v0, p0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->metaIterators:Ljava/util/Deque;

    if-eqz v0, :cond_3

    invoke-interface {v0}, Ljava/util/Deque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    .line 7
    iget-object v0, p0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->metaIterators:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Iterator;

    iput-object v0, p0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->topMetaIterator:Ljava/util/Iterator;

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    .line 8
    :goto_3
    iput-object v0, p0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->topMetaIterator:Ljava/util/Iterator;

    if-nez v0, :cond_4

    const/4 p0, 0x0

    return p0

    .line 9
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Iterator;

    iput-object v0, p0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->iterator:Ljava/util/Iterator;

    .line 10
    instance-of v1, v0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;

    if-eqz v1, :cond_0

    .line 11
    check-cast v0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;

    .line 12
    iget-object v1, v0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->iterator:Ljava/util/Iterator;

    iput-object v1, p0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->iterator:Ljava/util/Iterator;

    .line 13
    iget-object v1, p0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->metaIterators:Ljava/util/Deque;

    if-nez v1, :cond_5

    .line 14
    new-instance v1, Ljava/util/ArrayDeque;

    invoke-direct {v1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v1, p0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->metaIterators:Ljava/util/Deque;

    .line 15
    :cond_5
    iget-object v1, p0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->metaIterators:Ljava/util/Deque;

    iget-object v2, p0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->topMetaIterator:Ljava/util/Iterator;

    invoke-interface {v1, v2}, Ljava/util/Deque;->addFirst(Ljava/lang/Object;)V

    .line 16
    iget-object v1, v0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->metaIterators:Ljava/util/Deque;

    if-eqz v1, :cond_6

    .line 17
    :goto_4
    iget-object v1, v0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->metaIterators:Ljava/util/Deque;

    invoke-interface {v1}, Ljava/util/Deque;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_6

    .line 18
    iget-object v1, p0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->metaIterators:Ljava/util/Deque;

    iget-object v2, v0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->metaIterators:Ljava/util/Deque;

    invoke-interface {v2}, Ljava/util/Deque;->removeLast()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Iterator;

    invoke-interface {v1, v2}, Ljava/util/Deque;->addFirst(Ljava/lang/Object;)V

    goto :goto_4

    .line 19
    :cond_6
    iget-object v0, v0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->topMetaIterator:Ljava/util/Iterator;

    iput-object v0, p0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->topMetaIterator:Ljava/util/Iterator;

    goto :goto_0

    :cond_7
    const/4 p0, 0x1

    return p0
.end method

.method public next()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    iget-object v0, p0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->iterator:Ljava/util/Iterator;

    iput-object v0, p0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->toRemove:Ljava/util/Iterator;

    .line 3
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 4
    :cond_0
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method

.method public remove()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->toRemove:Ljava/util/Iterator;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "no calls to next() since the last call to remove()"

    .line 2
    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 3
    iget-object v0, p0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->toRemove:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lcom/google/common/collect/Iterators$ConcatenatedIterator;->toRemove:Ljava/util/Iterator;

    return-void
.end method
