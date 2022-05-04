.class public Lcom/google/common/collect/CompactLinkedHashSet;
.super Lcom/google/common/collect/CompactHashSet;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/CompactHashSet<",
        "TE;>;"
    }
.end annotation


# instance fields
.field public transient firstEntry:I

.field public transient lastEntry:I

.field public transient predecessor:[I

.field public transient successor:[I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/common/collect/CompactHashSet;-><init>()V

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

    .line 2
    invoke-direct {p0, p1}, Lcom/google/common/collect/CompactHashSet;-><init>(I)V

    return-void
.end method


# virtual methods
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
    iget p0, p0, Lcom/google/common/collect/CompactHashSet;->size:I

    if-lt p1, p0, :cond_0

    move p1, p2

    :cond_0
    return p1
.end method

.method public allocArrays()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/google/common/collect/CompactHashSet;->allocArrays()V

    .line 2
    iget-object v0, p0, Lcom/google/common/collect/CompactHashSet;->elements:[Ljava/lang/Object;

    array-length v0, v0

    .line 3
    new-array v1, v0, [I

    iput-object v1, p0, Lcom/google/common/collect/CompactLinkedHashSet;->predecessor:[I

    .line 4
    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/common/collect/CompactLinkedHashSet;->successor:[I

    const/4 v0, -0x1

    .line 5
    invoke-static {v1, v0}, Ljava/util/Arrays;->fill([II)V

    .line 6
    iget-object p0, p0, Lcom/google/common/collect/CompactLinkedHashSet;->successor:[I

    invoke-static {p0, v0}, Ljava/util/Arrays;->fill([II)V

    return-void
.end method

.method public clear()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->needsAllocArrays()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, -0x2

    .line 2
    iput v0, p0, Lcom/google/common/collect/CompactLinkedHashSet;->firstEntry:I

    .line 3
    iput v0, p0, Lcom/google/common/collect/CompactLinkedHashSet;->lastEntry:I

    .line 4
    iget-object v0, p0, Lcom/google/common/collect/CompactLinkedHashSet;->predecessor:[I

    .line 5
    iget v1, p0, Lcom/google/common/collect/CompactHashSet;->size:I

    const/4 v2, 0x0

    const/4 v3, -0x1

    .line 6
    invoke-static {v0, v2, v1, v3}, Ljava/util/Arrays;->fill([IIII)V

    .line 7
    iget-object v0, p0, Lcom/google/common/collect/CompactLinkedHashSet;->successor:[I

    .line 8
    iget v1, p0, Lcom/google/common/collect/CompactHashSet;->size:I

    .line 9
    invoke-static {v0, v2, v1, v3}, Ljava/util/Arrays;->fill([IIII)V

    .line 10
    invoke-super {p0}, Lcom/google/common/collect/CompactHashSet;->clear()V

    return-void
.end method

.method public firstEntryIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/common/collect/CompactLinkedHashSet;->firstEntry:I

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
    iget-object p0, p0, Lcom/google/common/collect/CompactLinkedHashSet;->successor:[I

    aget p0, p0, p1

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
    invoke-super {p0, p1}, Lcom/google/common/collect/CompactHashSet;->init(I)V

    const/4 p1, -0x2

    .line 2
    iput p1, p0, Lcom/google/common/collect/CompactLinkedHashSet;->firstEntry:I

    .line 3
    iput p1, p0, Lcom/google/common/collect/CompactLinkedHashSet;->lastEntry:I

    return-void
.end method

.method public insertEntry(ILjava/lang/Object;I)V
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "entryIndex",
            "object",
            "hash"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;I)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/common/collect/CompactHashSet;->entries:[J

    int-to-long v1, p3

    const/16 p3, 0x20

    shl-long/2addr v1, p3

    const-wide v3, 0xffffffffL

    or-long/2addr v1, v3

    aput-wide v1, v0, p1

    .line 2
    iget-object p3, p0, Lcom/google/common/collect/CompactHashSet;->elements:[Ljava/lang/Object;

    aput-object p2, p3, p1

    .line 3
    iget p2, p0, Lcom/google/common/collect/CompactLinkedHashSet;->lastEntry:I

    invoke-virtual {p0, p2, p1}, Lcom/google/common/collect/CompactLinkedHashSet;->setSucceeds(II)V

    const/4 p2, -0x2

    .line 4
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/CompactLinkedHashSet;->setSucceeds(II)V

    return-void
.end method

.method public moveLastEntry(I)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dstIndex"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/common/collect/CompactHashSet;->size:I

    const/4 v1, -0x1

    add-int/2addr v0, v1

    .line 2
    invoke-super {p0, p1}, Lcom/google/common/collect/CompactHashSet;->moveLastEntry(I)V

    .line 3
    iget-object v2, p0, Lcom/google/common/collect/CompactLinkedHashSet;->predecessor:[I

    aget v2, v2, p1

    .line 4
    iget-object v3, p0, Lcom/google/common/collect/CompactLinkedHashSet;->successor:[I

    aget v3, v3, p1

    .line 5
    invoke-virtual {p0, v2, v3}, Lcom/google/common/collect/CompactLinkedHashSet;->setSucceeds(II)V

    if-ge p1, v0, :cond_0

    .line 6
    iget-object v2, p0, Lcom/google/common/collect/CompactLinkedHashSet;->predecessor:[I

    aget v2, v2, v0

    .line 7
    invoke-virtual {p0, v2, p1}, Lcom/google/common/collect/CompactLinkedHashSet;->setSucceeds(II)V

    .line 8
    iget-object v2, p0, Lcom/google/common/collect/CompactLinkedHashSet;->successor:[I

    aget v2, v2, v0

    .line 9
    invoke-virtual {p0, p1, v2}, Lcom/google/common/collect/CompactLinkedHashSet;->setSucceeds(II)V

    .line 10
    :cond_0
    iget-object p1, p0, Lcom/google/common/collect/CompactLinkedHashSet;->predecessor:[I

    aput v1, p1, v0

    .line 11
    iget-object p0, p0, Lcom/google/common/collect/CompactLinkedHashSet;->successor:[I

    aput v1, p0, v0

    return-void
.end method

.method public resizeEntries(I)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newCapacity"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Lcom/google/common/collect/CompactHashSet;->resizeEntries(I)V

    .line 2
    iget-object v0, p0, Lcom/google/common/collect/CompactLinkedHashSet;->predecessor:[I

    array-length v1, v0

    .line 3
    invoke-static {v0, p1}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/CompactLinkedHashSet;->predecessor:[I

    .line 4
    iget-object v0, p0, Lcom/google/common/collect/CompactLinkedHashSet;->successor:[I

    invoke-static {v0, p1}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/CompactLinkedHashSet;->successor:[I

    if-ge v1, p1, :cond_0

    .line 5
    iget-object v0, p0, Lcom/google/common/collect/CompactLinkedHashSet;->predecessor:[I

    const/4 v2, -0x1

    invoke-static {v0, v1, p1, v2}, Ljava/util/Arrays;->fill([IIII)V

    .line 6
    iget-object p0, p0, Lcom/google/common/collect/CompactLinkedHashSet;->successor:[I

    invoke-static {p0, v1, p1, v2}, Ljava/util/Arrays;->fill([IIII)V

    :cond_0
    return-void
.end method

.method public final setSucceeds(II)V
    .locals 2
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

    const/4 v0, -0x2

    if-ne p1, v0, :cond_0

    .line 1
    iput p2, p0, Lcom/google/common/collect/CompactLinkedHashSet;->firstEntry:I

    goto :goto_0

    .line 2
    :cond_0
    iget-object v1, p0, Lcom/google/common/collect/CompactLinkedHashSet;->successor:[I

    aput p2, v1, p1

    :goto_0
    if-ne p2, v0, :cond_1

    .line 3
    iput p1, p0, Lcom/google/common/collect/CompactLinkedHashSet;->lastEntry:I

    goto :goto_1

    .line 4
    :cond_1
    iget-object p0, p0, Lcom/google/common/collect/CompactLinkedHashSet;->predecessor:[I

    aput p1, p0, p2

    :goto_1
    return-void
.end method

.method public toArray()[Ljava/lang/Object;
    .locals 1

    .line 7
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/google/common/collect/ObjectArrays;->fillArray(Ljava/lang/Iterable;[Ljava/lang/Object;)[Ljava/lang/Object;

    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "a"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet;->size()I

    move-result v0

    .line 2
    array-length v1, p1

    if-ge v1, v0, :cond_0

    .line 3
    invoke-static {p1, v0}, Lcom/google/common/collect/ObjectArrays;->newArray([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    .line 4
    :cond_0
    invoke-static {p0, p1}, Lcom/google/common/collect/ObjectArrays;->fillArray(Ljava/lang/Iterable;[Ljava/lang/Object;)[Ljava/lang/Object;

    .line 5
    array-length p0, p1

    if-le p0, v0, :cond_1

    const/4 p0, 0x0

    .line 6
    aput-object p0, p1, v0

    :cond_1
    return-object p1
.end method
