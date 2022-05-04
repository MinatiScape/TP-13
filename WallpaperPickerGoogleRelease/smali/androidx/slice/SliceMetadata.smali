.class public Landroidx/slice/SliceMetadata;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public mContext:Landroid/content/Context;

.field public mExpiry:J

.field public mHeaderContent:Landroidx/slice/widget/RowContent;

.field public mLastUpdated:J

.field public mListContent:Landroidx/slice/widget/ListContent;

.field public mPrimaryAction:Landroidx/slice/core/SliceAction;

.field public mSlice:Landroidx/slice/Slice;

.field public mSliceActions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/slice/core/SliceAction;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroidx/slice/Slice;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "slice"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p2, p0, Landroidx/slice/SliceMetadata;->mSlice:Landroidx/slice/Slice;

    .line 3
    iput-object p1, p0, Landroidx/slice/SliceMetadata;->mContext:Landroid/content/Context;

    const-string p1, "long"

    const-string v0, "ttl"

    const/4 v1, 0x0

    .line 4
    invoke-static {p2, p1, v0, v1}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 5
    invoke-virtual {v0}, Landroidx/slice/SliceItem;->getLong()J

    move-result-wide v2

    iput-wide v2, p0, Landroidx/slice/SliceMetadata;->mExpiry:J

    :cond_0
    const-string v0, "last_updated"

    .line 6
    invoke-static {p2, p1, v0, v1}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 7
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->getLong()J

    move-result-wide v0

    iput-wide v0, p0, Landroidx/slice/SliceMetadata;->mLastUpdated:J

    :cond_1
    const-string p1, "bundle"

    const-string v0, "host_extras"

    .line 8
    invoke-static {p2, p1, v0}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 9
    iget-object p1, p1, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    instance-of v0, p1, Landroid/os/Bundle;

    if-eqz v0, :cond_2

    .line 10
    check-cast p1, Landroid/os/Bundle;

    goto :goto_0

    .line 11
    :cond_2
    sget-object p1, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    .line 12
    :goto_0
    new-instance p1, Landroidx/slice/widget/ListContent;

    invoke-direct {p1, p2}, Landroidx/slice/widget/ListContent;-><init>(Landroidx/slice/Slice;)V

    iput-object p1, p0, Landroidx/slice/SliceMetadata;->mListContent:Landroidx/slice/widget/ListContent;

    .line 13
    iget-object p2, p1, Landroidx/slice/widget/ListContent;->mHeaderContent:Landroidx/slice/widget/RowContent;

    .line 14
    iput-object p2, p0, Landroidx/slice/SliceMetadata;->mHeaderContent:Landroidx/slice/widget/RowContent;

    .line 15
    iget-object p1, p1, Landroidx/slice/widget/ListContent;->mSliceActions:Ljava/util/List;

    const/4 v0, 0x1

    invoke-static {p2, v0, p1}, Landroidx/slice/widget/ListContent;->getRowType(Landroidx/slice/widget/SliceContent;ZLjava/util/List;)I

    .line 16
    iget-object p1, p0, Landroidx/slice/SliceMetadata;->mListContent:Landroidx/slice/widget/ListContent;

    iget-object p2, p0, Landroidx/slice/SliceMetadata;->mContext:Landroid/content/Context;

    invoke-virtual {p1, p2}, Landroidx/slice/widget/ListContent;->getShortcut(Landroid/content/Context;)Landroidx/slice/core/SliceAction;

    move-result-object p1

    iput-object p1, p0, Landroidx/slice/SliceMetadata;->mPrimaryAction:Landroidx/slice/core/SliceAction;

    .line 17
    iget-object p1, p0, Landroidx/slice/SliceMetadata;->mListContent:Landroidx/slice/widget/ListContent;

    .line 18
    iget-object p1, p1, Landroidx/slice/widget/ListContent;->mSliceActions:Ljava/util/List;

    .line 19
    iput-object p1, p0, Landroidx/slice/SliceMetadata;->mSliceActions:Ljava/util/List;

    if-nez p1, :cond_5

    .line 20
    iget-object p1, p0, Landroidx/slice/SliceMetadata;->mHeaderContent:Landroidx/slice/widget/RowContent;

    if-eqz p1, :cond_5

    .line 21
    iget-object p1, p1, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    const-string p2, "list_item"

    .line 22
    filled-new-array {p2}, [Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroidx/slice/core/SliceQuery;->hasHints(Landroidx/slice/SliceItem;[Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 23
    iget-object p1, p0, Landroidx/slice/SliceMetadata;->mHeaderContent:Landroidx/slice/widget/RowContent;

    .line 24
    iget-object p1, p1, Landroidx/slice/widget/RowContent;->mEndItems:Ljava/util/ArrayList;

    .line 25
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    const/4 v0, 0x0

    .line 26
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 27
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/slice/SliceItem;

    const-string v2, "action"

    invoke-static {v1, v2}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 28
    new-instance v1, Landroidx/slice/core/SliceActionImpl;

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/slice/SliceItem;

    invoke-direct {v1, v2}, Landroidx/slice/core/SliceActionImpl;-><init>(Landroidx/slice/SliceItem;)V

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 29
    :cond_4
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_5

    .line 30
    iput-object p2, p0, Landroidx/slice/SliceMetadata;->mSliceActions:Ljava/util/List;

    :cond_5
    return-void
.end method


# virtual methods
.method public getLoadingState()I
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/slice/SliceMetadata;->mSlice:Landroidx/slice/Slice;

    const/4 v1, 0x0

    const-string v2, "partial"

    invoke-static {v0, v1, v2, v1}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    .line 2
    :goto_0
    iget-object p0, p0, Landroidx/slice/SliceMetadata;->mListContent:Landroidx/slice/widget/ListContent;

    invoke-virtual {p0}, Landroidx/slice/widget/ListContent;->isValid()Z

    move-result p0

    if-nez p0, :cond_1

    return v2

    :cond_1
    if-eqz v0, :cond_2

    return v1

    :cond_2
    const/4 p0, 0x2

    return p0
.end method

.method public isExpired()Z
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 2
    iget-wide v2, p0, Landroidx/slice/SliceMetadata;->mExpiry:J

    const-wide/16 v4, 0x0

    cmp-long p0, v2, v4

    if-eqz p0, :cond_0

    const-wide/16 v4, -0x1

    cmp-long p0, v2, v4

    if-eqz p0, :cond_0

    cmp-long p0, v0, v2

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
