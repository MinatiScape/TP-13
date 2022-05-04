.class public Landroidx/slice/widget/ListContent;
.super Landroidx/slice/widget/SliceContent;
.source "SourceFile"


# instance fields
.field public mHeaderContent:Landroidx/slice/widget/RowContent;

.field public mPrimaryAction:Landroidx/slice/core/SliceAction;

.field public mRowItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/slice/widget/SliceContent;",
            ">;"
        }
    .end annotation
.end field

.field public mSeeMoreContent:Landroidx/slice/widget/RowContent;

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
.method public constructor <init>(Landroidx/slice/Slice;)V
    .locals 17
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "slice"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 1
    invoke-direct/range {p0 .. p1}, Landroidx/slice/widget/SliceContent;-><init>(Landroidx/slice/Slice;)V

    .line 2
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v0, Landroidx/slice/widget/ListContent;->mRowItems:Ljava/util/ArrayList;

    .line 3
    iget-object v2, v0, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    if-nez v2, :cond_0

    return-void

    :cond_0
    if-nez v1, :cond_1

    goto/16 :goto_8

    :cond_1
    const-string v2, "slice"

    const-string v3, "actions"

    const/4 v4, 0x0

    .line 4
    invoke-static {v1, v2, v3, v4}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v5

    const-string v6, "shortcut"

    .line 5
    filled-new-array {v3, v6}, [Ljava/lang/String;

    move-result-object v7

    if-eqz v5, :cond_2

    .line 6
    invoke-static {v5, v2, v7, v4}, Landroidx/slice/core/SliceQuery;->findAll(Landroidx/slice/SliceItem;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    goto :goto_0

    :cond_2
    move-object v5, v4

    :goto_0
    const/4 v7, 0x0

    if-eqz v5, :cond_3

    .line 7
    new-instance v8, Ljava/util/ArrayList;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v9

    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    move v9, v7

    .line 8
    :goto_1
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v10

    if-ge v9, v10, :cond_4

    .line 9
    invoke-interface {v5, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroidx/slice/SliceItem;

    .line 10
    new-instance v11, Landroidx/slice/core/SliceActionImpl;

    invoke-direct {v11, v10}, Landroidx/slice/core/SliceActionImpl;-><init>(Landroidx/slice/SliceItem;)V

    invoke-virtual {v8, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    :cond_3
    move-object v8, v4

    .line 11
    :cond_4
    iput-object v8, v0, Landroidx/slice/widget/ListContent;->mSliceActions:Ljava/util/List;

    const-string v9, "list_item"

    const-string v10, "shortcut"

    const-string v11, "actions"

    const-string v12, "keywords"

    const-string v13, "ttl"

    const-string v14, "last_updated"

    const-string v15, "horizontal"

    const-string v16, "selection_option"

    .line 12
    filled-new-array/range {v9 .. v16}, [Ljava/lang/String;

    move-result-object v5

    .line 13
    invoke-static {v1, v2, v4, v5}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/Slice;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v5

    const-string v8, "keywords"

    const-string v9, "see_more"

    const/4 v10, 0x1

    if-eqz v5, :cond_6

    .line 14
    iget-object v11, v5, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    .line 15
    invoke-virtual {v2, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5

    filled-new-array {v3, v8, v9}, [Ljava/lang/String;

    move-result-object v11

    .line 16
    invoke-virtual {v5, v11}, Landroidx/slice/SliceItem;->hasAnyHints([Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_5

    const-string v11, "text"

    .line 17
    invoke-static {v5, v11, v4, v4}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v11

    if-eqz v11, :cond_5

    move v11, v10

    goto :goto_2

    :cond_5
    move v11, v7

    :goto_2
    if-eqz v11, :cond_6

    goto :goto_3

    :cond_6
    move-object v5, v4

    :goto_3
    if-eqz v5, :cond_7

    .line 18
    new-instance v11, Landroidx/slice/widget/RowContent;

    invoke-direct {v11, v5, v7}, Landroidx/slice/widget/RowContent;-><init>(Landroidx/slice/SliceItem;I)V

    iput-object v11, v0, Landroidx/slice/widget/ListContent;->mHeaderContent:Landroidx/slice/widget/RowContent;

    .line 19
    iget-object v5, v0, Landroidx/slice/widget/ListContent;->mRowItems:Ljava/util/ArrayList;

    invoke-virtual {v5, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    :cond_7
    filled-new-array {v9}, [Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v4, v4, v5, v4}, Landroidx/slice/core/SliceQuery;->findTopLevelItem(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v5

    const-string v11, "action"

    if-eqz v5, :cond_8

    .line 21
    iget-object v12, v5, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    .line 22
    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_8

    .line 23
    invoke-virtual {v5}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object v12

    invoke-virtual {v12}, Landroidx/slice/Slice;->getItems()Ljava/util/List;

    move-result-object v12

    .line 24
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v13

    if-ne v13, v10, :cond_9

    invoke-interface {v12, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroidx/slice/SliceItem;

    .line 25
    iget-object v13, v13, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    .line 26
    invoke-virtual {v11, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_9

    .line 27
    invoke-interface {v12, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/slice/SliceItem;

    goto :goto_4

    :cond_8
    move-object v5, v4

    :cond_9
    :goto_4
    if-eqz v5, :cond_a

    .line 28
    new-instance v12, Landroidx/slice/widget/RowContent;

    const/4 v13, -0x1

    invoke-direct {v12, v5, v13}, Landroidx/slice/widget/RowContent;-><init>(Landroidx/slice/SliceItem;I)V

    iput-object v12, v0, Landroidx/slice/widget/ListContent;->mSeeMoreContent:Landroidx/slice/widget/RowContent;

    .line 29
    :cond_a
    invoke-virtual/range {p1 .. p1}, Landroidx/slice/Slice;->getItems()Ljava/util/List;

    move-result-object v1

    move v5, v7

    .line 30
    :goto_5
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v12

    if-ge v5, v12, :cond_f

    .line 31
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroidx/slice/SliceItem;

    .line 32
    iget-object v13, v12, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v14, "ttl"

    const-string v15, "last_updated"

    .line 33
    filled-new-array {v3, v9, v8, v14, v15}, [Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Landroidx/slice/SliceItem;->hasAnyHints([Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_e

    .line 34
    invoke-virtual {v11, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_b

    invoke-virtual {v2, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_e

    .line 35
    :cond_b
    iget-object v13, v0, Landroidx/slice/widget/ListContent;->mHeaderContent:Landroidx/slice/widget/RowContent;

    const-string v14, "list_item"

    if-nez v13, :cond_c

    .line 36
    iget-object v13, v12, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    invoke-static {v13, v14}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_c

    .line 37
    new-instance v13, Landroidx/slice/widget/RowContent;

    invoke-direct {v13, v12, v7}, Landroidx/slice/widget/RowContent;-><init>(Landroidx/slice/SliceItem;I)V

    iput-object v13, v0, Landroidx/slice/widget/ListContent;->mHeaderContent:Landroidx/slice/widget/RowContent;

    .line 38
    iget-object v12, v0, Landroidx/slice/widget/ListContent;->mRowItems:Ljava/util/ArrayList;

    invoke-virtual {v12, v7, v13}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_6

    .line 39
    :cond_c
    iget-object v13, v12, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    invoke-static {v13, v14}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_e

    .line 40
    iget-object v13, v12, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const-string v14, "horizontal"

    invoke-static {v13, v14}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_d

    .line 41
    iget-object v13, v0, Landroidx/slice/widget/ListContent;->mRowItems:Ljava/util/ArrayList;

    new-instance v14, Landroidx/slice/widget/GridContent;

    invoke-direct {v14, v12, v5}, Landroidx/slice/widget/GridContent;-><init>(Landroidx/slice/SliceItem;I)V

    invoke-virtual {v13, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 42
    :cond_d
    iget-object v13, v0, Landroidx/slice/widget/ListContent;->mRowItems:Ljava/util/ArrayList;

    new-instance v14, Landroidx/slice/widget/RowContent;

    invoke-direct {v14, v12, v5}, Landroidx/slice/widget/RowContent;-><init>(Landroidx/slice/SliceItem;I)V

    invoke-virtual {v13, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_e
    :goto_6
    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    .line 43
    :cond_f
    iget-object v1, v0, Landroidx/slice/widget/ListContent;->mHeaderContent:Landroidx/slice/widget/RowContent;

    if-nez v1, :cond_10

    iget-object v1, v0, Landroidx/slice/widget/ListContent;->mRowItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v1, v10, :cond_10

    .line 44
    iget-object v1, v0, Landroidx/slice/widget/ListContent;->mRowItems:Ljava/util/ArrayList;

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/slice/widget/RowContent;

    iput-object v1, v0, Landroidx/slice/widget/ListContent;->mHeaderContent:Landroidx/slice/widget/RowContent;

    .line 45
    iput-boolean v10, v1, Landroidx/slice/widget/RowContent;->mIsHeader:Z

    .line 46
    :cond_10
    iget-object v1, v0, Landroidx/slice/widget/ListContent;->mRowItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_11

    iget-object v1, v0, Landroidx/slice/widget/ListContent;->mRowItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr v2, v10

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Landroidx/slice/widget/GridContent;

    if-eqz v1, :cond_11

    .line 47
    iget-object v1, v0, Landroidx/slice/widget/ListContent;->mRowItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr v2, v10

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/slice/widget/GridContent;

    .line 48
    iput-boolean v10, v1, Landroidx/slice/widget/GridContent;->mIsLastIndex:Z

    .line 49
    :cond_11
    iget-object v1, v0, Landroidx/slice/widget/ListContent;->mHeaderContent:Landroidx/slice/widget/RowContent;

    if-eqz v1, :cond_12

    .line 50
    iget-object v1, v1, Landroidx/slice/widget/RowContent;->mPrimaryAction:Landroidx/slice/SliceItem;

    goto :goto_7

    :cond_12
    move-object v1, v4

    :goto_7
    if-nez v1, :cond_13

    const-string v1, "title"

    .line 51
    filled-new-array {v6, v1}, [Ljava/lang/String;

    move-result-object v1

    .line 52
    iget-object v2, v0, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    invoke-static {v2, v11, v1, v4}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v1

    :cond_13
    if-nez v1, :cond_14

    .line 53
    iget-object v1, v0, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    invoke-static {v1, v11, v4, v4}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v1

    :cond_14
    if-eqz v1, :cond_15

    .line 54
    new-instance v4, Landroidx/slice/core/SliceActionImpl;

    invoke-direct {v4, v1}, Landroidx/slice/core/SliceActionImpl;-><init>(Landroidx/slice/SliceItem;)V

    .line 55
    :cond_15
    iput-object v4, v0, Landroidx/slice/widget/ListContent;->mPrimaryAction:Landroidx/slice/core/SliceAction;

    :goto_8
    return-void
.end method

.method public static getRowType(Landroidx/slice/widget/SliceContent;ZLjava/util/List;)I
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "content",
            "isHeader",
            "actions"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/slice/widget/SliceContent;",
            "Z",
            "Ljava/util/List<",
            "Landroidx/slice/core/SliceAction;",
            ">;)I"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p0, :cond_9

    .line 1
    instance-of v1, p0, Landroidx/slice/widget/GridContent;

    if-eqz v1, :cond_0

    const/4 p0, 0x1

    return p0

    .line 2
    :cond_0
    check-cast p0, Landroidx/slice/widget/RowContent;

    .line 3
    iget-object v1, p0, Landroidx/slice/widget/RowContent;->mPrimaryAction:Landroidx/slice/SliceItem;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 4
    new-instance v2, Landroidx/slice/core/SliceActionImpl;

    invoke-direct {v2, v1}, Landroidx/slice/core/SliceActionImpl;-><init>(Landroidx/slice/SliceItem;)V

    .line 5
    :cond_1
    iget-object v1, p0, Landroidx/slice/widget/RowContent;->mRange:Landroidx/slice/SliceItem;

    if-eqz v1, :cond_3

    .line 6
    iget-object p0, v1, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string p1, "action"

    .line 7
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x4

    goto :goto_0

    :cond_2
    const/4 p0, 0x5

    :goto_0
    return p0

    .line 8
    :cond_3
    iget-object v1, p0, Landroidx/slice/widget/RowContent;->mSelection:Landroidx/slice/SliceItem;

    if-eqz v1, :cond_4

    const/4 p0, 0x6

    return p0

    :cond_4
    const/4 v1, 0x3

    if-eqz v2, :cond_5

    .line 9
    invoke-virtual {v2}, Landroidx/slice/core/SliceActionImpl;->isToggle()Z

    move-result v2

    if-eqz v2, :cond_5

    return v1

    :cond_5
    if-eqz p1, :cond_8

    if-eqz p2, :cond_8

    move p0, v0

    .line 10
    :goto_1
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p1

    if-ge p0, p1, :cond_7

    .line 11
    invoke-interface {p2, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/slice/core/SliceAction;

    invoke-interface {p1}, Landroidx/slice/core/SliceAction;->isToggle()Z

    move-result p1

    if-eqz p1, :cond_6

    return v1

    :cond_6
    add-int/lit8 p0, p0, 0x1

    goto :goto_1

    :cond_7
    return v0

    .line 12
    :cond_8
    iget-object p0, p0, Landroidx/slice/widget/RowContent;->mToggleItems:Ljava/util/ArrayList;

    .line 13
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    if-lez p0, :cond_9

    move v0, v1

    :cond_9
    return v0
.end method


# virtual methods
.method public getHeight(Landroidx/slice/widget/SliceStyle;Landroidx/slice/widget/SliceViewPolicy;)I
    .locals 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "style",
            "policy"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    iget v0, p2, Landroidx/slice/widget/SliceViewPolicy;->mMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 3
    iget-object p0, p0, Landroidx/slice/widget/ListContent;->mHeaderContent:Landroidx/slice/widget/RowContent;

    .line 4
    invoke-virtual {p0, p1, p2}, Landroidx/slice/widget/RowContent;->getHeight(Landroidx/slice/widget/SliceStyle;Landroidx/slice/widget/SliceViewPolicy;)I

    move-result p0

    goto :goto_3

    .line 5
    :cond_0
    iget v0, p2, Landroidx/slice/widget/SliceViewPolicy;->mMaxHeight:I

    .line 6
    iget-boolean v2, p2, Landroidx/slice/widget/SliceViewPolicy;->mScrollable:Z

    .line 7
    iget-object v3, p0, Landroidx/slice/widget/ListContent;->mRowItems:Ljava/util/ArrayList;

    .line 8
    invoke-virtual {p1, v3, p2}, Landroidx/slice/widget/SliceStyle;->getListItemsHeight(Ljava/util/List;Landroidx/slice/widget/SliceViewPolicy;)I

    move-result v3

    if-lez v0, :cond_1

    .line 9
    iget-object v4, p0, Landroidx/slice/widget/ListContent;->mHeaderContent:Landroidx/slice/widget/RowContent;

    .line 10
    invoke-virtual {v4, p1, p2}, Landroidx/slice/widget/RowContent;->getHeight(Landroidx/slice/widget/SliceStyle;Landroidx/slice/widget/SliceViewPolicy;)I

    move-result v4

    .line 11
    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    :cond_1
    if-lez v0, :cond_2

    move v4, v0

    goto :goto_0

    .line 12
    :cond_2
    iget v4, p1, Landroidx/slice/widget/SliceStyle;->mListLargeHeight:I

    :goto_0
    sub-int v5, v3, v4

    .line 13
    iget v6, p1, Landroidx/slice/widget/SliceStyle;->mListMinScrollHeight:I

    if-lt v5, v6, :cond_3

    goto :goto_1

    :cond_3
    const/4 v1, 0x0

    :goto_1
    if-eqz v1, :cond_4

    .line 14
    iget-boolean v1, p1, Landroidx/slice/widget/SliceStyle;->mExpandToAvailableHeight:Z

    if-nez v1, :cond_4

    move v3, v4

    goto :goto_2

    :cond_4
    if-gtz v0, :cond_5

    goto :goto_2

    .line 15
    :cond_5
    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    :goto_2
    if-nez v2, :cond_6

    .line 16
    invoke-virtual {p1, p0, v3, p2}, Landroidx/slice/widget/SliceStyle;->getListItemsForNonScrollingList(Landroidx/slice/widget/ListContent;ILandroidx/slice/widget/SliceViewPolicy;)Landroidx/slice/widget/DisplayedListItems;

    move-result-object p0

    .line 17
    iget-object p0, p0, Landroidx/slice/widget/DisplayedListItems;->mDisplayedItems:Ljava/util/List;

    .line 18
    invoke-virtual {p1, p0, p2}, Landroidx/slice/widget/SliceStyle;->getListItemsHeight(Ljava/util/List;Landroidx/slice/widget/SliceViewPolicy;)I

    move-result p0

    goto :goto_3

    :cond_6
    move p0, v3

    :goto_3
    return p0
.end method

.method public getShortcut(Landroid/content/Context;)Landroidx/slice/core/SliceAction;
    .locals 14
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/ListContent;->mPrimaryAction:Landroidx/slice/core/SliceAction;

    if-eqz v0, :cond_0

    goto/16 :goto_7

    .line 2
    :cond_0
    iget-object v0, p0, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    const/4 v1, 0x0

    if-nez v0, :cond_2

    :cond_1
    :goto_0
    move-object v0, v1

    goto/16 :goto_7

    :cond_2
    const/4 v2, 0x5

    const-string v3, "title"

    const-string v4, "shortcut"

    .line 3
    filled-new-array {v3, v4}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "action"

    .line 4
    invoke-static {v0, v5, v4, v1}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v0

    const-string v4, "text"

    const-string v6, "image"

    if-eqz v0, :cond_3

    .line 5
    invoke-static {v0, v6, v3, v1}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v7

    .line 6
    invoke-static {v0, v4, v1, v1}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v8

    goto :goto_1

    :cond_3
    move-object v7, v1

    move-object v8, v7

    :goto_1
    if-nez v0, :cond_4

    .line 7
    iget-object v0, p0, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    invoke-static {v0, v5, v1, v1}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v0

    :cond_4
    if-nez v7, :cond_5

    .line 8
    iget-object v5, p0, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    invoke-static {v5, v6, v3, v1}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v7

    :cond_5
    if-nez v8, :cond_6

    .line 9
    iget-object v5, p0, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    invoke-static {v5, v4, v3, v1}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v8

    :cond_6
    if-nez v7, :cond_7

    .line 10
    iget-object v3, p0, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    invoke-static {v3, v6, v1, v1}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v7

    :cond_7
    if-nez v8, :cond_8

    .line 11
    iget-object v3, p0, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    invoke-static {v3, v4, v1, v1}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v8

    :cond_8
    if-eqz v7, :cond_9

    .line 12
    invoke-static {v7}, Landroidx/slice/core/SliceActionImpl;->parseImageMode(Landroidx/slice/SliceItem;)I

    move-result v2

    :cond_9
    if-eqz p1, :cond_15

    .line 13
    iget-object p0, p0, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    const-string v3, "slice"

    invoke-static {p0, v3, v1, v1}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object p0

    if-nez p0, :cond_a

    goto :goto_0

    .line 14
    :cond_a
    invoke-virtual {p0}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/slice/Slice;->getUri()Landroid/net/Uri;

    move-result-object p0

    if-eqz v7, :cond_b

    .line 15
    iget-object v3, v7, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    check-cast v3, Landroidx/core/graphics/drawable/IconCompat;

    goto :goto_2

    :cond_b
    move-object v3, v1

    :goto_2
    if-eqz v8, :cond_c

    .line 16
    iget-object v4, v8, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    check-cast v4, Ljava/lang/CharSequence;

    goto :goto_3

    :cond_c
    move-object v4, v1

    :goto_3
    const/high16 v5, 0x4000000

    const/4 v6, 0x0

    .line 17
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    .line 18
    invoke-virtual {p0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8, v6}, Landroid/content/pm/PackageManager;->resolveContentProvider(Ljava/lang/String;I)Landroid/content/pm/ProviderInfo;

    move-result-object v8

    if-eqz v8, :cond_d

    .line 19
    iget-object v8, v8, Landroid/content/pm/ProviderInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    goto :goto_4

    :cond_d
    move-object v8, v1

    :goto_4
    if-eqz v8, :cond_13

    if-nez v3, :cond_11

    .line 20
    invoke-virtual {v7, v8}, Landroid/content/pm/PackageManager;->getApplicationIcon(Landroid/content/pm/ApplicationInfo;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 21
    instance-of v3, v2, Landroid/graphics/drawable/BitmapDrawable;

    const/4 v9, 0x1

    const-string v10, "Bitmap must not be null."

    if-eqz v3, :cond_f

    .line 22
    check-cast v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    sget-object v3, Landroidx/core/graphics/drawable/IconCompat;->EXTRA_TYPE:Ljava/lang/String;

    if-eqz v2, :cond_e

    .line 23
    new-instance v3, Landroidx/core/graphics/drawable/IconCompat;

    invoke-direct {v3, v9}, Landroidx/core/graphics/drawable/IconCompat;-><init>(I)V

    .line 24
    iput-object v2, v3, Landroidx/core/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    goto :goto_5

    .line 25
    :cond_e
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 26
    :cond_f
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v11

    sget-object v12, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v11, v12}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 27
    new-instance v11, Landroid/graphics/Canvas;

    invoke-direct {v11, v3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 28
    invoke-virtual {v11}, Landroid/graphics/Canvas;->getWidth()I

    move-result v12

    invoke-virtual {v11}, Landroid/graphics/Canvas;->getHeight()I

    move-result v13

    invoke-virtual {v2, v6, v6, v12, v13}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 29
    invoke-virtual {v2, v11}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 30
    sget-object v2, Landroidx/core/graphics/drawable/IconCompat;->EXTRA_TYPE:Ljava/lang/String;

    if-eqz v3, :cond_10

    .line 31
    new-instance v2, Landroidx/core/graphics/drawable/IconCompat;

    invoke-direct {v2, v9}, Landroidx/core/graphics/drawable/IconCompat;-><init>(I)V

    .line 32
    iput-object v3, v2, Landroidx/core/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    move-object v3, v2

    :goto_5
    const/4 v2, 0x2

    goto :goto_6

    .line 33
    :cond_10
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_11
    :goto_6
    if-nez v4, :cond_12

    .line 34
    invoke-virtual {v7, v8}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v4

    :cond_12
    if-nez v0, :cond_13

    .line 35
    iget-object v8, v8, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v7

    if-eqz v7, :cond_13

    .line 36
    new-instance v0, Landroidx/slice/SliceItem;

    .line 37
    invoke-static {p1, v6, v7, v5}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v9

    .line 38
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 39
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 40
    new-instance v10, Landroidx/slice/Slice;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v11

    new-array v11, v11, [Ljava/lang/String;

    invoke-virtual {v8, v11}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/String;

    invoke-direct {v10, v7, v8, p0, v1}, Landroidx/slice/Slice;-><init>(Ljava/util/ArrayList;[Ljava/lang/String;Landroid/net/Uri;Landroidx/slice/SliceSpec;)V

    const/4 v12, 0x0

    new-array v13, v6, [Ljava/lang/String;

    const-string v11, "action"

    move-object v8, v0

    .line 41
    invoke-direct/range {v8 .. v13}, Landroidx/slice/SliceItem;-><init>(Landroid/app/PendingIntent;Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    :cond_13
    if-nez v0, :cond_14

    .line 42
    new-instance p0, Landroid/content/Intent;

    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    .line 43
    invoke-static {p1, v6, p0, v5}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v8

    .line 44
    new-instance v0, Landroidx/slice/SliceItem;

    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const-string v10, "action"

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Landroidx/slice/SliceItem;-><init>(Landroid/app/PendingIntent;Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    :cond_14
    if-eqz v4, :cond_1

    if-eqz v3, :cond_1

    .line 45
    new-instance v1, Landroidx/slice/core/SliceActionImpl;

    invoke-virtual {v0}, Landroidx/slice/SliceItem;->getAction()Landroid/app/PendingIntent;

    move-result-object p0

    invoke-direct {v1, p0, v3, v2, v4}, Landroidx/slice/core/SliceActionImpl;-><init>(Landroid/app/PendingIntent;Landroidx/core/graphics/drawable/IconCompat;ILjava/lang/CharSequence;)V

    goto/16 :goto_0

    :cond_15
    if-eqz v7, :cond_1

    if-eqz v0, :cond_1

    if-eqz v8, :cond_1

    .line 46
    new-instance p0, Landroidx/slice/core/SliceActionImpl;

    invoke-virtual {v0}, Landroidx/slice/SliceItem;->getAction()Landroid/app/PendingIntent;

    move-result-object p1

    .line 47
    iget-object v0, v7, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    check-cast v0, Landroidx/core/graphics/drawable/IconCompat;

    .line 48
    iget-object v1, v8, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/CharSequence;

    .line 49
    invoke-direct {p0, p1, v0, v2, v1}, Landroidx/slice/core/SliceActionImpl;-><init>(Landroid/app/PendingIntent;Landroidx/core/graphics/drawable/IconCompat;ILjava/lang/CharSequence;)V

    move-object v0, p0

    :goto_7
    return-object v0
.end method

.method public isValid()Z
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/slice/widget/SliceContent;->isValid()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Landroidx/slice/widget/ListContent;->mRowItems:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
