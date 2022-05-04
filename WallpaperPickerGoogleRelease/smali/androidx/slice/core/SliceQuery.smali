.class public Landroidx/slice/core/SliceQuery;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static checkFormat(Landroidx/slice/SliceItem;Ljava/lang/String;)Z
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "item",
            "format"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 1
    iget-object p0, p0, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    .line 2
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method public static checkSubtype(Landroidx/slice/SliceItem;Ljava/lang/String;)Z
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "item",
            "subtype"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 1
    iget-object p0, p0, Landroidx/slice/SliceItem;->mSubType:Ljava/lang/String;

    .line 2
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method public static find(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "s",
            "format",
            "hints",
            "nonHints"
        }
    .end annotation

    const/4 p3, 0x1

    new-array p3, p3, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p2, p3, v0

    const/4 p2, 0x0

    filled-new-array {p2}, [Ljava/lang/String;

    move-result-object p2

    .line 1
    invoke-static {p0, p1, p3, p2}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/Slice;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object p0

    return-object p0
.end method

.method public static find(Landroidx/slice/Slice;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroidx/slice/SliceItem;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x10,
            0x10,
            0x10
        }
        names = {
            "s",
            "format",
            "hints",
            "nonHints"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 16
    :cond_0
    new-instance v1, Ljava/util/ArrayDeque;

    invoke-direct {v1}, Ljava/util/ArrayDeque;-><init>()V

    .line 17
    iget-object p0, p0, Landroidx/slice/Slice;->mItems:[Landroidx/slice/SliceItem;

    .line 18
    invoke-static {v1, p0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 19
    :cond_1
    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_5

    .line 20
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/slice/SliceItem;

    .line 21
    invoke-static {p0, p1}, Landroidx/slice/core/SliceQuery;->checkFormat(Landroidx/slice/SliceItem;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 22
    invoke-static {p0, p2}, Landroidx/slice/core/SliceQuery;->hasHints(Landroidx/slice/SliceItem;[Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {p0, p3}, Landroidx/slice/core/SliceQuery;->hasAnyHints(Landroidx/slice/SliceItem;[Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const/4 v2, 0x1

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    :goto_1
    if-eqz v2, :cond_3

    move-object v0, p0

    goto :goto_2

    .line 23
    :cond_3
    iget-object v2, p0, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v3, "slice"

    .line 24
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 25
    iget-object v2, p0, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v3, "action"

    .line 26
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 27
    :cond_4
    invoke-virtual {p0}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object p0

    .line 28
    iget-object p0, p0, Landroidx/slice/Slice;->mItems:[Landroidx/slice/SliceItem;

    .line 29
    invoke-static {v1, p0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    goto :goto_0

    :cond_5
    :goto_2
    return-object v0
.end method

.method public static find(Landroidx/slice/SliceItem;Ljava/lang/String;)Landroidx/slice/SliceItem;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "s",
            "format"
        }
    .end annotation

    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0, v0}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object p0

    return-object p0
.end method

.method public static find(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "s",
            "format",
            "hints",
            "nonHints"
        }
    .end annotation

    const/4 p3, 0x1

    new-array p3, p3, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p2, p3, v0

    const/4 p2, 0x0

    filled-new-array {p2}, [Ljava/lang/String;

    move-result-object p2

    .line 3
    invoke-static {p0, p1, p3, p2}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object p0

    return-object p0
.end method

.method public static find(Landroidx/slice/SliceItem;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroidx/slice/SliceItem;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x10,
            0x10,
            0x10
        }
        names = {
            "s",
            "format",
            "hints",
            "nonHints"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 4
    :cond_0
    invoke-static {p0}, Landroidx/slice/core/SliceQuery;->toQueue(Landroidx/slice/SliceItem;)Ljava/util/Deque;

    move-result-object p0

    .line 5
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Deque;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_5

    .line 6
    invoke-interface {p0}, Ljava/util/Deque;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/slice/SliceItem;

    .line 7
    invoke-static {v1, p1}, Landroidx/slice/core/SliceQuery;->checkFormat(Landroidx/slice/SliceItem;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 8
    invoke-static {v1, p2}, Landroidx/slice/core/SliceQuery;->hasHints(Landroidx/slice/SliceItem;[Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {v1, p3}, Landroidx/slice/core/SliceQuery;->hasAnyHints(Landroidx/slice/SliceItem;[Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const/4 v2, 0x1

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    :goto_1
    if-eqz v2, :cond_3

    move-object v0, v1

    goto :goto_2

    .line 9
    :cond_3
    iget-object v2, v1, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v3, "slice"

    .line 10
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 11
    iget-object v2, v1, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v3, "action"

    .line 12
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 13
    :cond_4
    invoke-virtual {v1}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object v1

    .line 14
    iget-object v1, v1, Landroidx/slice/Slice;->mItems:[Landroidx/slice/SliceItem;

    .line 15
    invoke-static {p0, v1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    goto :goto_0

    :cond_5
    :goto_2
    return-object v0
.end method

.method public static findAll(Landroidx/slice/SliceItem;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x10,
            0x10,
            0x10
        }
        names = {
            "s",
            "format",
            "hints",
            "nonHints"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/slice/SliceItem;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Landroidx/slice/SliceItem;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2
    invoke-static {p0}, Landroidx/slice/core/SliceQuery;->toQueue(Landroidx/slice/SliceItem;)Ljava/util/Deque;

    move-result-object p0

    .line 3
    :cond_0
    :goto_0
    move-object v1, p0

    check-cast v1, Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_4

    .line 4
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/slice/SliceItem;

    .line 5
    invoke-static {v1, p1}, Landroidx/slice/core/SliceQuery;->checkFormat(Landroidx/slice/SliceItem;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 6
    invoke-static {v1, p2}, Landroidx/slice/core/SliceQuery;->hasHints(Landroidx/slice/SliceItem;[Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-static {v1, p3}, Landroidx/slice/core/SliceQuery;->hasAnyHints(Landroidx/slice/SliceItem;[Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    if-eqz v2, :cond_2

    .line 7
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 8
    :cond_2
    iget-object v2, v1, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v3, "slice"

    .line 9
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 10
    iget-object v2, v1, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v3, "action"

    .line 11
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 12
    :cond_3
    invoke-virtual {v1}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object v1

    .line 13
    iget-object v1, v1, Landroidx/slice/Slice;->mItems:[Landroidx/slice/SliceItem;

    .line 14
    invoke-static {p0, v1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    goto :goto_0

    :cond_4
    return-object v0
.end method

.method public static findSubtype(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x10,
            0x10
        }
        names = {
            "s",
            "format",
            "subtype"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 12
    :cond_0
    new-instance v1, Ljava/util/ArrayDeque;

    invoke-direct {v1}, Ljava/util/ArrayDeque;-><init>()V

    .line 13
    iget-object p0, p0, Landroidx/slice/Slice;->mItems:[Landroidx/slice/SliceItem;

    .line 14
    invoke-static {v1, p0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 15
    :cond_1
    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_5

    .line 16
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/slice/SliceItem;

    .line 17
    invoke-static {p0, p1}, Landroidx/slice/core/SliceQuery;->checkFormat(Landroidx/slice/SliceItem;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {p0, p2}, Landroidx/slice/core/SliceQuery;->checkSubtype(Landroidx/slice/SliceItem;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v2, 0x1

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    :goto_1
    if-eqz v2, :cond_3

    move-object v0, p0

    goto :goto_2

    .line 18
    :cond_3
    iget-object v2, p0, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v3, "slice"

    .line 19
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 20
    iget-object v2, p0, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v3, "action"

    .line 21
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 22
    :cond_4
    invoke-virtual {p0}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object p0

    .line 23
    iget-object p0, p0, Landroidx/slice/Slice;->mItems:[Landroidx/slice/SliceItem;

    .line 24
    invoke-static {v1, p0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    goto :goto_0

    :cond_5
    :goto_2
    return-object v0
.end method

.method public static findSubtype(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x10,
            0x10
        }
        names = {
            "s",
            "format",
            "subtype"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 1
    :cond_0
    invoke-static {p0}, Landroidx/slice/core/SliceQuery;->toQueue(Landroidx/slice/SliceItem;)Ljava/util/Deque;

    move-result-object p0

    .line 2
    :cond_1
    :goto_0
    move-object v1, p0

    check-cast v1, Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5

    .line 3
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/slice/SliceItem;

    .line 4
    invoke-static {v1, p1}, Landroidx/slice/core/SliceQuery;->checkFormat(Landroidx/slice/SliceItem;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {v1, p2}, Landroidx/slice/core/SliceQuery;->checkSubtype(Landroidx/slice/SliceItem;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v2, 0x1

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    :goto_1
    if-eqz v2, :cond_3

    move-object v0, v1

    goto :goto_2

    .line 5
    :cond_3
    iget-object v2, v1, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v3, "slice"

    .line 6
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 7
    iget-object v2, v1, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v3, "action"

    .line 8
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 9
    :cond_4
    invoke-virtual {v1}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object v1

    .line 10
    iget-object v1, v1, Landroidx/slice/Slice;->mItems:[Landroidx/slice/SliceItem;

    .line 11
    invoke-static {p0, v1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    goto :goto_0

    :cond_5
    :goto_2
    return-object v0
.end method

.method public static findTopLevelItem(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroidx/slice/SliceItem;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x10,
            0x10,
            0x10,
            0x10
        }
        names = {
            "s",
            "format",
            "subtype",
            "hints",
            "nonHints"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/slice/Slice;->mItems:[Landroidx/slice/SliceItem;

    const/4 p4, 0x0

    .line 2
    :goto_0
    array-length v0, p0

    const/4 v1, 0x0

    if-ge p4, v0, :cond_1

    .line 3
    aget-object v0, p0, p4

    .line 4
    invoke-static {v0, p1}, Landroidx/slice/core/SliceQuery;->checkFormat(Landroidx/slice/SliceItem;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 5
    invoke-static {v0, p2}, Landroidx/slice/core/SliceQuery;->checkSubtype(Landroidx/slice/SliceItem;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 6
    invoke-static {v0, p3}, Landroidx/slice/core/SliceQuery;->hasHints(Landroidx/slice/SliceItem;[Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 7
    invoke-static {v0, v1}, Landroidx/slice/core/SliceQuery;->hasAnyHints(Landroidx/slice/SliceItem;[Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    return-object v0

    :cond_0
    add-int/lit8 p4, p4, 0x1

    goto :goto_0

    :cond_1
    return-object v1
.end method

.method public static varargs hasAnyHints(Landroidx/slice/SliceItem;[Ljava/lang/String;)Z
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "item",
            "hints"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 1
    :cond_0
    array-length v1, p1

    move v2, v0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v3, p1, v2

    .line 2
    invoke-virtual {p0, v3}, Landroidx/slice/SliceItem;->hasHint(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return v0
.end method

.method public static varargs hasHints(Landroidx/slice/SliceItem;[Ljava/lang/String;)Z
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "item",
            "hints"
        }
    .end annotation

    const/4 v0, 0x1

    if-nez p1, :cond_0

    return v0

    .line 1
    :cond_0
    array-length v1, p1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_2

    aget-object v4, p1, v3

    .line 2
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    invoke-virtual {p0, v4}, Landroidx/slice/SliceItem;->hasHint(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    return v2

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return v0
.end method

.method public static toQueue(Landroidx/slice/SliceItem;)Ljava/util/Deque;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "item"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/slice/SliceItem;",
            ")",
            "Ljava/util/Deque<",
            "Landroidx/slice/SliceItem;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 2
    invoke-virtual {v0, p0}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
