.class public final Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;
.super Lcom/google/common/collect/AbstractNavigableMap;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<C::",
        "Ljava/lang/Comparable<",
        "*>;>",
        "Lcom/google/common/collect/AbstractNavigableMap<",
        "Lcom/google/common/collect/Cut<",
        "TC;>;",
        "Lcom/google/common/collect/Range<",
        "TC;>;>;"
    }
.end annotation


# instance fields
.field public final rangesByLowerBound:Ljava/util/NavigableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/NavigableMap<",
            "Lcom/google/common/collect/Cut<",
            "TC;>;",
            "Lcom/google/common/collect/Range<",
            "TC;>;>;"
        }
    .end annotation
.end field

.field public final upperBoundWindow:Lcom/google/common/collect/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/Range<",
            "Lcom/google/common/collect/Cut<",
            "TC;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/NavigableMap;Lcom/google/common/collect/Range;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "rangesByLowerBound",
            "upperBoundWindow"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/NavigableMap<",
            "Lcom/google/common/collect/Cut<",
            "TC;>;",
            "Lcom/google/common/collect/Range<",
            "TC;>;>;",
            "Lcom/google/common/collect/Range<",
            "Lcom/google/common/collect/Cut<",
            "TC;>;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/google/common/collect/AbstractNavigableMap;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->rangesByLowerBound:Ljava/util/NavigableMap;

    .line 3
    iput-object p2, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->upperBoundWindow:Lcom/google/common/collect/Range;

    return-void
.end method


# virtual methods
.method public comparator()Ljava/util/Comparator;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator<",
            "-",
            "Lcom/google/common/collect/Cut<",
            "TC;>;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/google/common/collect/NaturalOrdering;->INSTANCE:Lcom/google/common/collect/NaturalOrdering;

    return-object p0
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->get(Ljava/lang/Object;)Lcom/google/common/collect/Range;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public descendingEntryIterator()Ljava/util/Iterator;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/util/Map$Entry<",
            "Lcom/google/common/collect/Cut<",
            "TC;>;",
            "Lcom/google/common/collect/Range<",
            "TC;>;>;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->upperBoundWindow:Lcom/google/common/collect/Range;

    .line 2
    iget-object v0, v0, Lcom/google/common/collect/Range;->upperBound:Lcom/google/common/collect/Cut;

    .line 3
    sget-object v1, Lcom/google/common/collect/Cut$AboveAll;->INSTANCE:Lcom/google/common/collect/Cut$AboveAll;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq v0, v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    :goto_0
    if-eqz v1, :cond_1

    .line 4
    iget-object v1, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->rangesByLowerBound:Ljava/util/NavigableMap;

    .line 5
    invoke-virtual {v0}, Lcom/google/common/collect/Cut;->endpoint()Ljava/lang/Comparable;

    move-result-object v0

    .line 6
    check-cast v0, Lcom/google/common/collect/Cut;

    invoke-interface {v1, v0, v3}, Ljava/util/NavigableMap;->headMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;

    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/NavigableMap;->descendingMap()Ljava/util/NavigableMap;

    move-result-object v0

    .line 8
    invoke-interface {v0}, Ljava/util/NavigableMap;->values()Ljava/util/Collection;

    move-result-object v0

    goto :goto_1

    .line 9
    :cond_1
    iget-object v0, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->rangesByLowerBound:Ljava/util/NavigableMap;

    invoke-interface {v0}, Ljava/util/NavigableMap;->descendingMap()Ljava/util/NavigableMap;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/NavigableMap;->values()Ljava/util/Collection;

    move-result-object v0

    .line 10
    :goto_1
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 11
    instance-of v1, v0, Lcom/google/common/collect/Iterators$PeekingImpl;

    if-eqz v1, :cond_2

    .line 12
    check-cast v0, Lcom/google/common/collect/Iterators$PeekingImpl;

    goto :goto_2

    .line 13
    :cond_2
    new-instance v1, Lcom/google/common/collect/Iterators$PeekingImpl;

    invoke-direct {v1, v0}, Lcom/google/common/collect/Iterators$PeekingImpl;-><init>(Ljava/util/Iterator;)V

    move-object v0, v1

    .line 14
    :goto_2
    invoke-virtual {v0}, Lcom/google/common/collect/Iterators$PeekingImpl;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->upperBoundWindow:Lcom/google/common/collect/Range;

    iget-object v1, v1, Lcom/google/common/collect/Range;->upperBound:Lcom/google/common/collect/Cut;

    .line 15
    iget-boolean v3, v0, Lcom/google/common/collect/Iterators$PeekingImpl;->hasPeeked:Z

    if-nez v3, :cond_3

    .line 16
    iget-object v3, v0, Lcom/google/common/collect/Iterators$PeekingImpl;->iterator:Ljava/util/Iterator;

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    iput-object v3, v0, Lcom/google/common/collect/Iterators$PeekingImpl;->peekedElement:Ljava/lang/Object;

    .line 17
    iput-boolean v2, v0, Lcom/google/common/collect/Iterators$PeekingImpl;->hasPeeked:Z

    .line 18
    :cond_3
    iget-object v2, v0, Lcom/google/common/collect/Iterators$PeekingImpl;->peekedElement:Ljava/lang/Object;

    .line 19
    check-cast v2, Lcom/google/common/collect/Range;

    iget-object v2, v2, Lcom/google/common/collect/Range;->upperBound:Lcom/google/common/collect/Cut;

    invoke-virtual {v1, v2}, Lcom/google/common/collect/Cut;->isLessThan(Ljava/lang/Comparable;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 20
    invoke-virtual {v0}, Lcom/google/common/collect/Iterators$PeekingImpl;->next()Ljava/lang/Object;

    .line 21
    :cond_4
    new-instance v1, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound$2;

    invoke-direct {v1, p0, v0}, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound$2;-><init>(Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;Lcom/google/common/collect/PeekingIterator;)V

    return-object v1
.end method

.method public entryIterator()Ljava/util/Iterator;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/util/Map$Entry<",
            "Lcom/google/common/collect/Cut<",
            "TC;>;",
            "Lcom/google/common/collect/Range<",
            "TC;>;>;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->upperBoundWindow:Lcom/google/common/collect/Range;

    .line 2
    iget-object v0, v0, Lcom/google/common/collect/Range;->lowerBound:Lcom/google/common/collect/Cut;

    .line 3
    sget-object v1, Lcom/google/common/collect/Cut$BelowAll;->INSTANCE:Lcom/google/common/collect/Cut$BelowAll;

    const/4 v2, 0x1

    if-eq v0, v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-nez v1, :cond_1

    .line 4
    iget-object v0, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->rangesByLowerBound:Ljava/util/NavigableMap;

    invoke-interface {v0}, Ljava/util/NavigableMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    goto :goto_1

    .line 5
    :cond_1
    iget-object v1, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->rangesByLowerBound:Ljava/util/NavigableMap;

    .line 6
    invoke-virtual {v0}, Lcom/google/common/collect/Cut;->endpoint()Ljava/lang/Comparable;

    move-result-object v0

    .line 7
    check-cast v0, Lcom/google/common/collect/Cut;

    invoke-interface {v1, v0}, Ljava/util/NavigableMap;->lowerEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v0

    if-nez v0, :cond_2

    .line 8
    iget-object v0, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->rangesByLowerBound:Ljava/util/NavigableMap;

    invoke-interface {v0}, Ljava/util/NavigableMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    goto :goto_1

    .line 9
    :cond_2
    iget-object v1, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->upperBoundWindow:Lcom/google/common/collect/Range;

    iget-object v1, v1, Lcom/google/common/collect/Range;->lowerBound:Lcom/google/common/collect/Cut;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/common/collect/Range;

    iget-object v3, v3, Lcom/google/common/collect/Range;->upperBound:Lcom/google/common/collect/Cut;

    invoke-virtual {v1, v3}, Lcom/google/common/collect/Cut;->isLessThan(Ljava/lang/Comparable;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 10
    iget-object v1, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->rangesByLowerBound:Ljava/util/NavigableMap;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/Cut;

    invoke-interface {v1, v0, v2}, Ljava/util/NavigableMap;->tailMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/NavigableMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    goto :goto_1

    .line 11
    :cond_3
    iget-object v0, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->rangesByLowerBound:Ljava/util/NavigableMap;

    iget-object v1, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->upperBoundWindow:Lcom/google/common/collect/Range;

    .line 12
    iget-object v1, v1, Lcom/google/common/collect/Range;->lowerBound:Lcom/google/common/collect/Cut;

    invoke-virtual {v1}, Lcom/google/common/collect/Cut;->endpoint()Ljava/lang/Comparable;

    move-result-object v1

    .line 13
    check-cast v1, Lcom/google/common/collect/Cut;

    invoke-interface {v0, v1, v2}, Ljava/util/NavigableMap;->tailMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;

    move-result-object v0

    .line 14
    invoke-interface {v0}, Ljava/util/NavigableMap;->values()Ljava/util/Collection;

    move-result-object v0

    .line 15
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 16
    :goto_1
    new-instance v1, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound$1;

    invoke-direct {v1, p0, v0}, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound$1;-><init>(Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;Ljava/util/Iterator;)V

    return-object v1
.end method

.method public get(Ljava/lang/Object;)Lcom/google/common/collect/Range;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Lcom/google/common/collect/Range<",
            "TC;>;"
        }
    .end annotation

    .line 2
    instance-of v0, p1, Lcom/google/common/collect/Cut;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 3
    :try_start_0
    check-cast p1, Lcom/google/common/collect/Cut;

    .line 4
    iget-object v0, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->upperBoundWindow:Lcom/google/common/collect/Range;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    iget-object v2, v0, Lcom/google/common/collect/Range;->lowerBound:Lcom/google/common/collect/Cut;

    invoke-virtual {v2, p1}, Lcom/google/common/collect/Cut;->isLessThan(Ljava/lang/Comparable;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v0, v0, Lcom/google/common/collect/Range;->upperBound:Lcom/google/common/collect/Cut;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/Cut;->isLessThan(Ljava/lang/Comparable;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    return-object v1

    .line 7
    :cond_1
    iget-object p0, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->rangesByLowerBound:Ljava/util/NavigableMap;

    invoke-interface {p0, p1}, Ljava/util/NavigableMap;->lowerEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object p0

    if-eqz p0, :cond_2

    .line 8
    invoke-interface {p0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/Range;

    iget-object v0, v0, Lcom/google/common/collect/Range;->upperBound:Lcom/google/common/collect/Cut;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/Cut;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 9
    invoke-interface {p0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/collect/Range;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    :cond_2
    return-object v1
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "key"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->get(Ljava/lang/Object;)Lcom/google/common/collect/Range;

    move-result-object p0

    return-object p0
.end method

.method public headMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "toKey",
            "inclusive"
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/common/collect/Cut;

    .line 2
    invoke-static {p2}, Landroidx/constraintlayout/solver/SolverVariable$Type$r8$EnumUnboxingUtility;->com$google$common$collect$BoundType$s$forBoolean(Z)I

    move-result p2

    sget-object v0, Lcom/google/common/collect/Range;->ALL:Lcom/google/common/collect/Range;

    .line 3
    invoke-static {p2}, Landroidx/constraintlayout/solver/SolverVariable$Type$r8$EnumUnboxingUtility;->$enumboxing$ordinal(I)I

    move-result p2

    if-eqz p2, :cond_1

    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    .line 4
    sget-object p2, Lcom/google/common/collect/Cut$BelowAll;->INSTANCE:Lcom/google/common/collect/Cut$BelowAll;

    .line 5
    new-instance v0, Lcom/google/common/collect/Cut$AboveValue;

    invoke-direct {v0, p1}, Lcom/google/common/collect/Cut$AboveValue;-><init>(Ljava/lang/Comparable;)V

    .line 6
    new-instance p1, Lcom/google/common/collect/Range;

    invoke-direct {p1, p2, v0}, Lcom/google/common/collect/Range;-><init>(Lcom/google/common/collect/Cut;Lcom/google/common/collect/Cut;)V

    goto :goto_0

    .line 7
    :cond_0
    new-instance p0, Ljava/lang/AssertionError;

    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    throw p0

    .line 8
    :cond_1
    sget-object p2, Lcom/google/common/collect/Cut$BelowAll;->INSTANCE:Lcom/google/common/collect/Cut$BelowAll;

    .line 9
    new-instance v0, Lcom/google/common/collect/Cut$BelowValue;

    invoke-direct {v0, p1}, Lcom/google/common/collect/Cut$BelowValue;-><init>(Ljava/lang/Comparable;)V

    .line 10
    new-instance p1, Lcom/google/common/collect/Range;

    invoke-direct {p1, p2, v0}, Lcom/google/common/collect/Range;-><init>(Lcom/google/common/collect/Cut;Lcom/google/common/collect/Cut;)V

    .line 11
    :goto_0
    invoke-virtual {p0, p1}, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->subMap(Lcom/google/common/collect/Range;)Ljava/util/NavigableMap;

    move-result-object p0

    return-object p0
.end method

.method public isEmpty()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->upperBoundWindow:Lcom/google/common/collect/Range;

    .line 2
    sget-object v1, Lcom/google/common/collect/Range;->ALL:Lcom/google/common/collect/Range;

    .line 3
    invoke-virtual {v0, v1}, Lcom/google/common/collect/Range;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4
    iget-object p0, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->rangesByLowerBound:Ljava/util/NavigableMap;

    invoke-interface {p0}, Ljava/util/NavigableMap;->isEmpty()Z

    move-result p0

    goto :goto_0

    .line 5
    :cond_0
    invoke-virtual {p0}, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->entryIterator()Ljava/util/Iterator;

    move-result-object p0

    check-cast p0, Lcom/google/common/collect/AbstractIterator;

    invoke-virtual {p0}, Lcom/google/common/collect/AbstractIterator;->hasNext()Z

    move-result p0

    if-nez p0, :cond_1

    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public size()I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->upperBoundWindow:Lcom/google/common/collect/Range;

    .line 2
    sget-object v1, Lcom/google/common/collect/Range;->ALL:Lcom/google/common/collect/Range;

    .line 3
    invoke-virtual {v0, v1}, Lcom/google/common/collect/Range;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4
    iget-object p0, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->rangesByLowerBound:Ljava/util/NavigableMap;

    invoke-interface {p0}, Ljava/util/NavigableMap;->size()I

    move-result p0

    return p0

    .line 5
    :cond_0
    invoke-virtual {p0}, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->entryIterator()Ljava/util/Iterator;

    move-result-object p0

    const-wide/16 v0, 0x0

    .line 6
    :goto_0
    move-object v2, p0

    check-cast v2, Lcom/google/common/collect/AbstractIterator;

    invoke-virtual {v2}, Lcom/google/common/collect/AbstractIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 7
    invoke-virtual {v2}, Lcom/google/common/collect/AbstractIterator;->next()Ljava/lang/Object;

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    goto :goto_0

    .line 8
    :cond_1
    invoke-static {v0, v1}, Lcom/google/common/primitives/Ints;->saturatedCast(J)I

    move-result p0

    return p0
.end method

.method public final subMap(Lcom/google/common/collect/Range;)Ljava/util/NavigableMap;
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "window"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Range<",
            "Lcom/google/common/collect/Cut<",
            "TC;>;>;)",
            "Ljava/util/NavigableMap<",
            "Lcom/google/common/collect/Cut<",
            "TC;>;",
            "Lcom/google/common/collect/Range<",
            "TC;>;>;"
        }
    .end annotation

    .line 11
    iget-object v0, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->upperBoundWindow:Lcom/google/common/collect/Range;

    .line 12
    iget-object v1, p1, Lcom/google/common/collect/Range;->lowerBound:Lcom/google/common/collect/Cut;

    iget-object v2, v0, Lcom/google/common/collect/Range;->upperBound:Lcom/google/common/collect/Cut;

    invoke-virtual {v1, v2}, Lcom/google/common/collect/Cut;->compareTo(Lcom/google/common/collect/Cut;)I

    move-result v1

    if-gtz v1, :cond_0

    iget-object v0, v0, Lcom/google/common/collect/Range;->lowerBound:Lcom/google/common/collect/Cut;

    iget-object v1, p1, Lcom/google/common/collect/Range;->upperBound:Lcom/google/common/collect/Cut;

    .line 13
    invoke-virtual {v0, v1}, Lcom/google/common/collect/Cut;->compareTo(Lcom/google/common/collect/Cut;)I

    move-result v0

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_5

    .line 14
    new-instance v0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;

    iget-object v1, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->rangesByLowerBound:Ljava/util/NavigableMap;

    iget-object p0, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->upperBoundWindow:Lcom/google/common/collect/Range;

    .line 15
    iget-object v2, p1, Lcom/google/common/collect/Range;->lowerBound:Lcom/google/common/collect/Cut;

    iget-object v3, p0, Lcom/google/common/collect/Range;->lowerBound:Lcom/google/common/collect/Cut;

    invoke-virtual {v2, v3}, Lcom/google/common/collect/Cut;->compareTo(Lcom/google/common/collect/Cut;)I

    move-result v2

    .line 16
    iget-object v3, p1, Lcom/google/common/collect/Range;->upperBound:Lcom/google/common/collect/Cut;

    iget-object v4, p0, Lcom/google/common/collect/Range;->upperBound:Lcom/google/common/collect/Cut;

    invoke-virtual {v3, v4}, Lcom/google/common/collect/Cut;->compareTo(Lcom/google/common/collect/Cut;)I

    move-result v3

    if-ltz v2, :cond_1

    if-gtz v3, :cond_1

    goto :goto_3

    :cond_1
    if-gtz v2, :cond_2

    if-ltz v3, :cond_2

    move-object p1, p0

    goto :goto_3

    :cond_2
    if-ltz v2, :cond_3

    .line 17
    iget-object v2, p1, Lcom/google/common/collect/Range;->lowerBound:Lcom/google/common/collect/Cut;

    goto :goto_1

    :cond_3
    iget-object v2, p0, Lcom/google/common/collect/Range;->lowerBound:Lcom/google/common/collect/Cut;

    :goto_1
    if-gtz v3, :cond_4

    .line 18
    iget-object p0, p1, Lcom/google/common/collect/Range;->upperBound:Lcom/google/common/collect/Cut;

    goto :goto_2

    :cond_4
    iget-object p0, p0, Lcom/google/common/collect/Range;->upperBound:Lcom/google/common/collect/Cut;

    .line 19
    :goto_2
    new-instance p1, Lcom/google/common/collect/Range;

    invoke-direct {p1, v2, p0}, Lcom/google/common/collect/Range;-><init>(Lcom/google/common/collect/Cut;Lcom/google/common/collect/Cut;)V

    .line 20
    :goto_3
    invoke-direct {v0, v1, p1}, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;-><init>(Ljava/util/NavigableMap;Lcom/google/common/collect/Range;)V

    return-object v0

    .line 21
    :cond_5
    sget-object p0, Lcom/google/common/collect/ImmutableSortedMap;->NATURAL_EMPTY_MAP:Lcom/google/common/collect/ImmutableSortedMap;

    return-object p0
.end method

.method public subMap(Ljava/lang/Object;ZLjava/lang/Object;Z)Ljava/util/NavigableMap;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x1000,
            0x1000
        }
        names = {
            "fromKey",
            "fromInclusive",
            "toKey",
            "toInclusive"
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/common/collect/Cut;

    check-cast p3, Lcom/google/common/collect/Cut;

    .line 2
    invoke-static {p2}, Landroidx/constraintlayout/solver/SolverVariable$Type$r8$EnumUnboxingUtility;->com$google$common$collect$BoundType$s$forBoolean(Z)I

    move-result p2

    .line 3
    invoke-static {p4}, Landroidx/constraintlayout/solver/SolverVariable$Type$r8$EnumUnboxingUtility;->com$google$common$collect$BoundType$s$forBoolean(Z)I

    move-result p4

    .line 4
    sget-object v0, Lcom/google/common/collect/Range;->ALL:Lcom/google/common/collect/Range;

    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    .line 5
    new-instance p2, Lcom/google/common/collect/Cut$AboveValue;

    invoke-direct {p2, p1}, Lcom/google/common/collect/Cut$AboveValue;-><init>(Ljava/lang/Comparable;)V

    goto :goto_0

    .line 6
    :cond_0
    new-instance p2, Lcom/google/common/collect/Cut$BelowValue;

    invoke-direct {p2, p1}, Lcom/google/common/collect/Cut$BelowValue;-><init>(Ljava/lang/Comparable;)V

    :goto_0
    if-ne p4, v0, :cond_1

    .line 7
    new-instance p1, Lcom/google/common/collect/Cut$BelowValue;

    invoke-direct {p1, p3}, Lcom/google/common/collect/Cut$BelowValue;-><init>(Ljava/lang/Comparable;)V

    goto :goto_1

    .line 8
    :cond_1
    new-instance p1, Lcom/google/common/collect/Cut$AboveValue;

    invoke-direct {p1, p3}, Lcom/google/common/collect/Cut$AboveValue;-><init>(Ljava/lang/Comparable;)V

    .line 9
    :goto_1
    new-instance p3, Lcom/google/common/collect/Range;

    invoke-direct {p3, p2, p1}, Lcom/google/common/collect/Range;-><init>(Lcom/google/common/collect/Cut;Lcom/google/common/collect/Cut;)V

    .line 10
    invoke-virtual {p0, p3}, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->subMap(Lcom/google/common/collect/Range;)Ljava/util/NavigableMap;

    move-result-object p0

    return-object p0
.end method

.method public tailMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "fromKey",
            "inclusive"
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/common/collect/Cut;

    .line 2
    invoke-static {p2}, Landroidx/constraintlayout/solver/SolverVariable$Type$r8$EnumUnboxingUtility;->com$google$common$collect$BoundType$s$forBoolean(Z)I

    move-result p2

    sget-object v0, Lcom/google/common/collect/Range;->ALL:Lcom/google/common/collect/Range;

    .line 3
    invoke-static {p2}, Landroidx/constraintlayout/solver/SolverVariable$Type$r8$EnumUnboxingUtility;->$enumboxing$ordinal(I)I

    move-result p2

    if-eqz p2, :cond_1

    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    .line 4
    new-instance p2, Lcom/google/common/collect/Cut$BelowValue;

    invoke-direct {p2, p1}, Lcom/google/common/collect/Cut$BelowValue;-><init>(Ljava/lang/Comparable;)V

    .line 5
    sget-object p1, Lcom/google/common/collect/Cut$AboveAll;->INSTANCE:Lcom/google/common/collect/Cut$AboveAll;

    .line 6
    new-instance v0, Lcom/google/common/collect/Range;

    invoke-direct {v0, p2, p1}, Lcom/google/common/collect/Range;-><init>(Lcom/google/common/collect/Cut;Lcom/google/common/collect/Cut;)V

    goto :goto_0

    .line 7
    :cond_0
    new-instance p0, Ljava/lang/AssertionError;

    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    throw p0

    .line 8
    :cond_1
    new-instance p2, Lcom/google/common/collect/Cut$AboveValue;

    invoke-direct {p2, p1}, Lcom/google/common/collect/Cut$AboveValue;-><init>(Ljava/lang/Comparable;)V

    .line 9
    sget-object p1, Lcom/google/common/collect/Cut$AboveAll;->INSTANCE:Lcom/google/common/collect/Cut$AboveAll;

    .line 10
    new-instance v0, Lcom/google/common/collect/Range;

    invoke-direct {v0, p2, p1}, Lcom/google/common/collect/Range;-><init>(Lcom/google/common/collect/Cut;Lcom/google/common/collect/Cut;)V

    .line 11
    :goto_0
    invoke-virtual {p0, v0}, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->subMap(Lcom/google/common/collect/Range;)Ljava/util/NavigableMap;

    move-result-object p0

    return-object p0
.end method
