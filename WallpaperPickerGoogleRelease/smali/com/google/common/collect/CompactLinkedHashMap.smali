.class public Lcom/google/common/collect/CompactLinkedHashMap;
.super Lcom/google/common/collect/CompactHashMap;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/CompactHashMap<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field private final accessOrder:Z

.field public transient firstEntry:I

.field public transient lastEntry:I

.field public transient links:[J


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x3

    .line 1
    invoke-direct {p0, v0}, Lcom/google/common/collect/CompactHashMap;-><init>(I)V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/google/common/collect/CompactLinkedHashMap;->accessOrder:Z

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "expectedSize"
        }
    .end annotation

    .line 3
    invoke-direct {p0, p1}, Lcom/google/common/collect/CompactHashMap;-><init>(I)V

    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Lcom/google/common/collect/CompactLinkedHashMap;->accessOrder:Z

    return-void
.end method


# virtual methods
.method public accessEntry(I)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/google/common/collect/CompactLinkedHashMap;->accessOrder:Z

    if-eqz v0, :cond_0

    .line 2
    iget-object v0, p0, Lcom/google/common/collect/CompactLinkedHashMap;->links:[J

    aget-wide v1, v0, p1

    const/16 v3, 0x20

    ushr-long/2addr v1, v3

    long-to-int v1, v1

    .line 3
    aget-wide v2, v0, p1

    long-to-int v0, v2

    .line 4
    invoke-virtual {p0, v1, v0}, Lcom/google/common/collect/CompactLinkedHashMap;->setSucceeds(II)V

    .line 5
    iget v0, p0, Lcom/google/common/collect/CompactLinkedHashMap;->lastEntry:I

    invoke-virtual {p0, v0, p1}, Lcom/google/common/collect/CompactLinkedHashMap;->setSucceeds(II)V

    const/4 v0, -0x2

    .line 6
    invoke-virtual {p0, p1, v0}, Lcom/google/common/collect/CompactLinkedHashMap;->setSucceeds(II)V

    .line 7
    iget p1, p0, Lcom/google/common/collect/CompactHashMap;->modCount:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/google/common/collect/CompactHashMap;->modCount:I

    :cond_0
    return-void
.end method

.method public adjustAfterRemove(II)I
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "indexBeforeRemove",
            "indexRemoved"
        }
    .end annotation

    .line 1
    iget p0, p0, Lcom/google/common/collect/CompactHashMap;->size:I

    if-lt p1, p0, :cond_0

    move p1, p2

    :cond_0
    return p1
.end method

.method public allocArrays()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/google/common/collect/CompactHashMap;->allocArrays()V

    .line 2
    iget-object v0, p0, Lcom/google/common/collect/CompactHashMap;->keys:[Ljava/lang/Object;

    array-length v0, v0

    .line 3
    new-array v0, v0, [J

    iput-object v0, p0, Lcom/google/common/collect/CompactLinkedHashMap;->links:[J

    const-wide/16 v1, -0x1

    .line 4
    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->fill([JJ)V

    return-void
.end method

.method public clear()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->needsAllocArrays()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, -0x2

    .line 2
    iput v0, p0, Lcom/google/common/collect/CompactLinkedHashMap;->firstEntry:I

    .line 3
    iput v0, p0, Lcom/google/common/collect/CompactLinkedHashMap;->lastEntry:I

    .line 4
    iget-object v0, p0, Lcom/google/common/collect/CompactLinkedHashMap;->links:[J

    const/4 v1, 0x0

    .line 5
    iget v2, p0, Lcom/google/common/collect/CompactHashMap;->size:I

    const-wide/16 v3, -0x1

    .line 6
    invoke-static {v0, v1, v2, v3, v4}, Ljava/util/Arrays;->fill([JIIJ)V

    .line 7
    invoke-super {p0}, Lcom/google/common/collect/CompactHashMap;->clear()V

    return-void
.end method

.method public firstEntryIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/common/collect/CompactLinkedHashMap;->firstEntry:I

    return p0
.end method

.method public final getPredecessor(I)I
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entry"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/common/collect/CompactLinkedHashMap;->links:[J

    aget-wide p0, p0, p1

    const/16 v0, 0x20

    ushr-long/2addr p0, v0

    long-to-int p0, p0

    return p0
.end method

.method public getSuccessor(I)I
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entry"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/common/collect/CompactLinkedHashMap;->links:[J

    aget-wide p0, p0, p1

    long-to-int p0, p0

    return p0
.end method

.method public init(I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "expectedSize"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Lcom/google/common/collect/CompactHashMap;->init(I)V

    const/4 p1, -0x2

    .line 2
    iput p1, p0, Lcom/google/common/collect/CompactLinkedHashMap;->firstEntry:I

    .line 3
    iput p1, p0, Lcom/google/common/collect/CompactLinkedHashMap;->lastEntry:I

    return-void
.end method

.method public insertEntry(ILjava/lang/Object;Ljava/lang/Object;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "entryIndex",
            "key",
            "value",
            "hash"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITK;TV;I)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/google/common/collect/CompactHashMap;->insertEntry(ILjava/lang/Object;Ljava/lang/Object;I)V

    .line 2
    iget p2, p0, Lcom/google/common/collect/CompactLinkedHashMap;->lastEntry:I

    invoke-virtual {p0, p2, p1}, Lcom/google/common/collect/CompactLinkedHashMap;->setSucceeds(II)V

    const/4 p2, -0x2

    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/CompactLinkedHashMap;->setSucceeds(II)V

    return-void
.end method

.method public moveLastEntry(I)V
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dstIndex"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/common/collect/CompactHashMap;->size:I

    add-int/lit8 v0, v0, -0x1

    .line 2
    invoke-super {p0, p1}, Lcom/google/common/collect/CompactHashMap;->moveLastEntry(I)V

    .line 3
    iget-object v1, p0, Lcom/google/common/collect/CompactLinkedHashMap;->links:[J

    aget-wide v2, v1, p1

    const/16 v4, 0x20

    ushr-long/2addr v2, v4

    long-to-int v2, v2

    .line 4
    aget-wide v3, v1, p1

    long-to-int v1, v3

    .line 5
    invoke-virtual {p0, v2, v1}, Lcom/google/common/collect/CompactLinkedHashMap;->setSucceeds(II)V

    if-ge p1, v0, :cond_0

    .line 6
    invoke-virtual {p0, v0}, Lcom/google/common/collect/CompactLinkedHashMap;->getPredecessor(I)I

    move-result v1

    invoke-virtual {p0, v1, p1}, Lcom/google/common/collect/CompactLinkedHashMap;->setSucceeds(II)V

    .line 7
    invoke-virtual {p0, v0}, Lcom/google/common/collect/CompactLinkedHashMap;->getSuccessor(I)I

    move-result v1

    invoke-virtual {p0, p1, v1}, Lcom/google/common/collect/CompactLinkedHashMap;->setSucceeds(II)V

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/google/common/collect/CompactLinkedHashMap;->links:[J

    const-wide/16 v1, -0x1

    aput-wide v1, p0, v0

    return-void
.end method

.method public resizeEntries(I)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newCapacity"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Lcom/google/common/collect/CompactHashMap;->resizeEntries(I)V

    .line 2
    iget-object v0, p0, Lcom/google/common/collect/CompactLinkedHashMap;->links:[J

    array-length v1, v0

    .line 3
    invoke-static {v0, p1}, Ljava/util/Arrays;->copyOf([JI)[J

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/CompactLinkedHashMap;->links:[J

    if-ge v1, p1, :cond_0

    const-wide/16 v2, -0x1

    .line 4
    invoke-static {v0, v1, p1, v2, v3}, Ljava/util/Arrays;->fill([JIIJ)V

    :cond_0
    return-void
.end method

.method public final setSucceeds(II)V
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "pred",
            "succ"
        }
    .end annotation

    const-wide v0, 0xffffffffL

    const/4 v2, -0x2

    if-ne p1, v2, :cond_0

    .line 1
    iput p2, p0, Lcom/google/common/collect/CompactLinkedHashMap;->firstEntry:I

    goto :goto_0

    .line 2
    :cond_0
    iget-object v3, p0, Lcom/google/common/collect/CompactLinkedHashMap;->links:[J

    aget-wide v4, v3, p1

    const-wide v6, -0x100000000L

    and-long/2addr v4, v6

    int-to-long v6, p2

    and-long/2addr v6, v0

    or-long/2addr v4, v6

    aput-wide v4, v3, p1

    :goto_0
    if-ne p2, v2, :cond_1

    .line 3
    iput p1, p0, Lcom/google/common/collect/CompactLinkedHashMap;->lastEntry:I

    goto :goto_1

    .line 4
    :cond_1
    iget-object p0, p0, Lcom/google/common/collect/CompactLinkedHashMap;->links:[J

    aget-wide v2, p0, p2

    and-long/2addr v0, v2

    int-to-long v2, p1

    const/16 p1, 0x20

    shl-long/2addr v2, p1

    or-long/2addr v0, v2

    aput-wide v0, p0, p2

    :goto_1
    return-void
.end method
