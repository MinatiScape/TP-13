.class public Landroidx/slice/widget/RowContent;
.super Landroidx/slice/widget/SliceContent;
.source "SourceFile"


# instance fields
.field public final mEndItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/slice/SliceItem;",
            ">;"
        }
    .end annotation
.end field

.field public mIsHeader:Z

.field public mLineCount:I

.field public mPrimaryAction:Landroidx/slice/SliceItem;

.field public mRange:Landroidx/slice/SliceItem;

.field public mSelection:Landroidx/slice/SliceItem;

.field public mShowActionDivider:Z

.field public mShowBottomDivider:Z

.field public mShowTitleItems:Z

.field public mStartItem:Landroidx/slice/SliceItem;

.field public mSubtitleItem:Landroidx/slice/SliceItem;

.field public mSummaryItem:Landroidx/slice/SliceItem;

.field public mTitleItem:Landroidx/slice/SliceItem;

.field public final mToggleItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/slice/core/SliceAction;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/slice/SliceItem;I)V
    .locals 10
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "rowSlice",
            "position"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/slice/widget/SliceContent;-><init>(Landroidx/slice/SliceItem;I)V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/slice/widget/RowContent;->mEndItems:Ljava/util/ArrayList;

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/slice/widget/RowContent;->mToggleItems:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 4
    iput v0, p0, Landroidx/slice/widget/RowContent;->mLineCount:I

    const/4 v1, 0x1

    if-nez p2, :cond_0

    move p2, v1

    goto :goto_0

    :cond_0
    move p2, v0

    .line 5
    :goto_0
    iget-object v2, p1, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const-string v3, "end_of_section"

    invoke-static {v2, v3}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 6
    iput-boolean v1, p0, Landroidx/slice/widget/RowContent;->mShowBottomDivider:Z

    .line 7
    :cond_1
    iput-boolean p2, p0, Landroidx/slice/widget/RowContent;->mIsHeader:Z

    .line 8
    invoke-static {p1}, Landroidx/slice/widget/RowContent;->isValidRow(Landroidx/slice/SliceItem;)Z

    move-result p2

    if-nez p2, :cond_2

    const-string p0, "RowContent"

    const-string p1, "Provided SliceItem is invalid for RowContent"

    .line 9
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_b

    :cond_2
    const-string p2, "title"

    .line 10
    filled-new-array {p2}, [Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v4

    .line 11
    invoke-static {p1, v3, v2, v4}, Landroidx/slice/core/SliceQuery;->findAll(Landroidx/slice/SliceItem;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .line 12
    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    const-string v5, "slice"

    const-string v6, "long"

    const-string v7, "action"

    if-lez v4, :cond_5

    .line 13
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/slice/SliceItem;

    .line 14
    iget-object v4, v4, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    .line 15
    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    const-string v9, "image"

    if-eqz v8, :cond_3

    .line 16
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroidx/slice/SliceItem;

    invoke-static {v8, v9}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v8

    if-nez v8, :cond_4

    .line 17
    :cond_3
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_4

    .line 18
    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_4

    .line 19
    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 20
    :cond_4
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/slice/SliceItem;

    iput-object v2, p0, Landroidx/slice/widget/RowContent;->mStartItem:Landroidx/slice/SliceItem;

    :cond_5
    const-string v2, "shortcut"

    .line 21
    filled-new-array {v2, p2}, [Ljava/lang/String;

    move-result-object v4

    .line 22
    invoke-static {p1, v5, v4, v3}, Landroidx/slice/core/SliceQuery;->findAll(Landroidx/slice/SliceItem;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v8

    .line 23
    invoke-static {p1, v7, v4, v3}, Landroidx/slice/core/SliceQuery;->findAll(Landroidx/slice/SliceItem;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    check-cast v8, Ljava/util/ArrayList;

    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 24
    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 25
    iget-object v3, p1, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    .line 26
    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 27
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/slice/Slice;->getItems()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ne v3, v1, :cond_6

    .line 28
    iput-object p1, p0, Landroidx/slice/widget/RowContent;->mPrimaryAction:Landroidx/slice/SliceItem;

    goto :goto_1

    .line 29
    :cond_6
    iget-object v3, p0, Landroidx/slice/widget/RowContent;->mStartItem:Landroidx/slice/SliceItem;

    if-eqz v3, :cond_7

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-le v3, v1, :cond_7

    .line 30
    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    iget-object v4, p0, Landroidx/slice/widget/RowContent;->mStartItem:Landroidx/slice/SliceItem;

    if-ne v3, v4, :cond_7

    .line 31
    invoke-virtual {v8, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/slice/SliceItem;

    iput-object v3, p0, Landroidx/slice/widget/RowContent;->mPrimaryAction:Landroidx/slice/SliceItem;

    goto :goto_1

    .line 32
    :cond_7
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_8

    .line 33
    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/slice/SliceItem;

    iput-object v3, p0, Landroidx/slice/widget/RowContent;->mPrimaryAction:Landroidx/slice/SliceItem;

    .line 34
    :cond_8
    :goto_1
    invoke-static {p1}, Landroidx/slice/widget/RowContent;->filterInvalidItems(Landroidx/slice/SliceItem;)Ljava/util/ArrayList;

    move-result-object v3

    .line 35
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ne v4, v1, :cond_a

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/slice/SliceItem;

    .line 36
    iget-object v4, v4, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    .line 37
    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_9

    .line 38
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/slice/SliceItem;

    .line 39
    iget-object v4, v4, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    .line 40
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 41
    :cond_9
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/slice/SliceItem;

    filled-new-array {v2, p2}, [Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Landroidx/slice/SliceItem;->hasAnyHints([Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_a

    .line 42
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/slice/SliceItem;

    invoke-static {v2}, Landroidx/slice/widget/RowContent;->isValidRow(Landroidx/slice/SliceItem;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 43
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/slice/SliceItem;

    .line 44
    invoke-static {p1}, Landroidx/slice/widget/RowContent;->filterInvalidItems(Landroidx/slice/SliceItem;)Ljava/util/ArrayList;

    move-result-object v3

    move v2, v1

    goto :goto_2

    :cond_a
    move v2, v0

    .line 45
    :goto_2
    iget-object v4, p1, Landroidx/slice/SliceItem;->mSubType:Ljava/lang/String;

    const-string v5, "range"

    .line 46
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_e

    .line 47
    invoke-static {p1, v7, v5}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v4

    if-eqz v4, :cond_d

    if-eqz v2, :cond_b

    goto :goto_3

    .line 48
    :cond_b
    iget-object v2, p0, Landroidx/slice/widget/RowContent;->mStartItem:Landroidx/slice/SliceItem;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 49
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ne v2, v1, :cond_c

    .line 50
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/slice/SliceItem;

    invoke-static {v2}, Landroidx/slice/widget/RowContent;->isValidRow(Landroidx/slice/SliceItem;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 51
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/slice/SliceItem;

    .line 52
    invoke-static {p1}, Landroidx/slice/widget/RowContent;->filterInvalidItems(Landroidx/slice/SliceItem;)Ljava/util/ArrayList;

    move-result-object v3

    .line 53
    iput-object p1, p0, Landroidx/slice/widget/RowContent;->mRange:Landroidx/slice/SliceItem;

    .line 54
    invoke-virtual {p0}, Landroidx/slice/widget/RowContent;->getInputRangeThumb()Landroidx/slice/SliceItem;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_4

    .line 55
    :cond_c
    invoke-static {p1, v7, v5}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v2

    iput-object v2, p0, Landroidx/slice/widget/RowContent;->mRange:Landroidx/slice/SliceItem;

    .line 56
    invoke-static {v2}, Landroidx/slice/widget/RowContent;->filterInvalidItems(Landroidx/slice/SliceItem;)Ljava/util/ArrayList;

    move-result-object v2

    .line 57
    invoke-virtual {p0}, Landroidx/slice/widget/RowContent;->getInputRangeThumb()Landroidx/slice/SliceItem;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 58
    iget-object v4, p0, Landroidx/slice/widget/RowContent;->mRange:Landroidx/slice/SliceItem;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 59
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_4

    .line 60
    :cond_d
    :goto_3
    iput-object p1, p0, Landroidx/slice/widget/RowContent;->mRange:Landroidx/slice/SliceItem;

    .line 61
    :cond_e
    :goto_4
    iget-object v2, p1, Landroidx/slice/SliceItem;->mSubType:Ljava/lang/String;

    const-string v4, "selection"

    .line 62
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 63
    iput-object p1, p0, Landroidx/slice/widget/RowContent;->mSelection:Landroidx/slice/SliceItem;

    .line 64
    :cond_f
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_1f

    .line 65
    iget-object p1, p0, Landroidx/slice/widget/RowContent;->mStartItem:Landroidx/slice/SliceItem;

    if-eqz p1, :cond_10

    .line 66
    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 67
    :cond_10
    iget-object p1, p0, Landroidx/slice/widget/RowContent;->mPrimaryAction:Landroidx/slice/SliceItem;

    if-eqz p1, :cond_11

    .line 68
    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 69
    :cond_11
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    move v2, v0

    .line 70
    :goto_5
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v2, v4, :cond_17

    .line 71
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/slice/SliceItem;

    .line 72
    iget-object v5, v4, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v8, "text"

    .line 73
    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_15

    .line 74
    iget-object v5, p0, Landroidx/slice/widget/RowContent;->mTitleItem:Landroidx/slice/SliceItem;

    const-string v8, "summary"

    if-eqz v5, :cond_12

    .line 75
    iget-object v5, v5, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    invoke-static {v5, p2}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_13

    .line 76
    :cond_12
    iget-object v5, v4, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    invoke-static {v5, p2}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_13

    iget-object v5, v4, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    invoke-static {v5, v8}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_13

    .line 77
    iput-object v4, p0, Landroidx/slice/widget/RowContent;->mTitleItem:Landroidx/slice/SliceItem;

    goto :goto_6

    .line 78
    :cond_13
    iget-object v5, p0, Landroidx/slice/widget/RowContent;->mSubtitleItem:Landroidx/slice/SliceItem;

    if-nez v5, :cond_14

    .line 79
    iget-object v5, v4, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    invoke-static {v5, v8}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_14

    .line 80
    iput-object v4, p0, Landroidx/slice/widget/RowContent;->mSubtitleItem:Landroidx/slice/SliceItem;

    goto :goto_6

    .line 81
    :cond_14
    iget-object v5, p0, Landroidx/slice/widget/RowContent;->mSummaryItem:Landroidx/slice/SliceItem;

    if-nez v5, :cond_16

    .line 82
    iget-object v5, v4, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    invoke-static {v5, v8}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 83
    iput-object v4, p0, Landroidx/slice/widget/RowContent;->mSummaryItem:Landroidx/slice/SliceItem;

    goto :goto_6

    .line 84
    :cond_15
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_16
    :goto_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 85
    :cond_17
    iget-object p2, p0, Landroidx/slice/widget/RowContent;->mTitleItem:Landroidx/slice/SliceItem;

    invoke-static {p2}, Landroidx/slice/widget/RowContent;->hasText(Landroidx/slice/SliceItem;)Z

    move-result p2

    if-eqz p2, :cond_18

    .line 86
    iget p2, p0, Landroidx/slice/widget/RowContent;->mLineCount:I

    add-int/2addr p2, v1

    iput p2, p0, Landroidx/slice/widget/RowContent;->mLineCount:I

    .line 87
    :cond_18
    iget-object p2, p0, Landroidx/slice/widget/RowContent;->mSubtitleItem:Landroidx/slice/SliceItem;

    invoke-static {p2}, Landroidx/slice/widget/RowContent;->hasText(Landroidx/slice/SliceItem;)Z

    move-result p2

    if-eqz p2, :cond_19

    .line 88
    iget p2, p0, Landroidx/slice/widget/RowContent;->mLineCount:I

    add-int/2addr p2, v1

    iput p2, p0, Landroidx/slice/widget/RowContent;->mLineCount:I

    .line 89
    :cond_19
    iget-object p2, p0, Landroidx/slice/widget/RowContent;->mStartItem:Landroidx/slice/SliceItem;

    if-eqz p2, :cond_1a

    .line 90
    iget-object p2, p2, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    .line 91
    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1a

    move p2, v1

    goto :goto_7

    :cond_1a
    move p2, v0

    :goto_7
    move v2, v0

    .line 92
    :goto_8
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_1f

    .line 93
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/slice/SliceItem;

    .line 94
    invoke-static {v3, v7}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v4

    if-eqz v4, :cond_1b

    move v4, v1

    goto :goto_9

    :cond_1b
    move v4, v0

    .line 95
    :goto_9
    iget-object v5, v3, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    .line 96
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1c

    if-nez p2, :cond_1e

    .line 97
    iget-object p2, p0, Landroidx/slice/widget/RowContent;->mEndItems:Ljava/util/ArrayList;

    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move p2, v1

    goto :goto_a

    :cond_1c
    if-eqz v4, :cond_1d

    .line 98
    new-instance v4, Landroidx/slice/core/SliceActionImpl;

    invoke-direct {v4, v3}, Landroidx/slice/core/SliceActionImpl;-><init>(Landroidx/slice/SliceItem;)V

    .line 99
    invoke-virtual {v4}, Landroidx/slice/core/SliceActionImpl;->isToggle()Z

    move-result v5

    if-eqz v5, :cond_1d

    .line 100
    iget-object v5, p0, Landroidx/slice/widget/RowContent;->mToggleItems:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 101
    :cond_1d
    iget-object v4, p0, Landroidx/slice/widget/RowContent;->mEndItems:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1e
    :goto_a
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 102
    :cond_1f
    invoke-virtual {p0}, Landroidx/slice/widget/RowContent;->isValid()Z

    :goto_b
    return-void
.end method

.method public static filterInvalidItems(Landroidx/slice/SliceItem;)Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "rowSlice"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/slice/SliceItem;",
            ")",
            "Ljava/util/ArrayList<",
            "Landroidx/slice/SliceItem;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2
    invoke-virtual {p0}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/slice/Slice;->getItems()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/slice/SliceItem;

    .line 3
    invoke-static {p0, v2}, Landroidx/slice/widget/RowContent;->isValidRowContent(Landroidx/slice/SliceItem;Landroidx/slice/SliceItem;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 4
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public static hasText(Landroidx/slice/SliceItem;)Z
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "textSlice"
        }
    .end annotation

    if-eqz p0, :cond_1

    .line 1
    iget-object v0, p0, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const-string v1, "partial"

    invoke-static {v0, v1}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2
    iget-object p0, p0, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    check-cast p0, Ljava/lang/CharSequence;

    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_1

    :cond_0
    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isValidRow(Landroidx/slice/SliceItem;)Z
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "rowSlice"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 1
    :cond_0
    iget-object v1, p0, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v2, "slice"

    .line 2
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 3
    iget-object v1, p0, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v2, "action"

    .line 4
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 5
    :cond_1
    invoke-virtual {p0}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/slice/Slice;->getItems()Ljava/util/List;

    move-result-object v1

    .line 6
    iget-object v2, p0, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const-string v3, "see_more"

    invoke-static {v2, v3}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    .line 7
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    return v3

    :cond_2
    move v2, v0

    .line 8
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_4

    .line 9
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/slice/SliceItem;

    invoke-static {p0, v4}, Landroidx/slice/widget/RowContent;->isValidRowContent(Landroidx/slice/SliceItem;Landroidx/slice/SliceItem;)Z

    move-result v4

    if-eqz v4, :cond_3

    return v3

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    return v0
.end method

.method public static isValidRowContent(Landroidx/slice/SliceItem;Landroidx/slice/SliceItem;)Z
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "slice",
            "item"
        }
    .end annotation

    const-string v0, "keywords"

    const-string v1, "ttl"

    const-string v2, "last_updated"

    const-string v3, "horizontal"

    .line 1
    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/slice/SliceItem;->hasAnyHints([Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 2
    iget-object v0, p1, Landroidx/slice/SliceItem;->mSubType:Ljava/lang/String;

    const-string v1, "content_description"

    .line 3
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 4
    iget-object v0, p1, Landroidx/slice/SliceItem;->mSubType:Ljava/lang/String;

    const-string v1, "selection_option_key"

    .line 5
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 6
    iget-object v0, p1, Landroidx/slice/SliceItem;->mSubType:Ljava/lang/String;

    const-string v1, "selection_option_value"

    .line 7
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 8
    :cond_0
    iget-object p1, p1, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v0, "image"

    .line 9
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "text"

    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "long"

    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "action"

    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "input"

    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "slice"

    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "int"

    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 16
    iget-object p0, p0, Landroidx/slice/SliceItem;->mSubType:Ljava/lang/String;

    const-string p1, "range"

    .line 17
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    :cond_1
    const/4 p0, 0x1

    goto :goto_1

    :cond_2
    :goto_0
    const/4 p0, 0x0

    :goto_1
    return p0
.end method


# virtual methods
.method public getHeight(Landroidx/slice/widget/SliceStyle;Landroidx/slice/widget/SliceViewPolicy;)I
    .locals 3
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
    iget v0, p2, Landroidx/slice/widget/SliceViewPolicy;->mMaxSmallHeight:I

    if-lez v0, :cond_0

    goto :goto_0

    .line 3
    :cond_0
    iget v0, p1, Landroidx/slice/widget/SliceStyle;->mRowMaxHeight:I

    .line 4
    :goto_0
    iget-object v1, p0, Landroidx/slice/widget/RowContent;->mRange:Landroidx/slice/SliceItem;

    if-nez v1, :cond_1

    .line 5
    iget-object v2, p0, Landroidx/slice/widget/RowContent;->mSelection:Landroidx/slice/SliceItem;

    if-nez v2, :cond_1

    .line 6
    iget p2, p2, Landroidx/slice/widget/SliceViewPolicy;->mMode:I

    const/4 v2, 0x2

    if-eq p2, v2, :cond_1

    goto :goto_5

    :cond_1
    const/4 p2, 0x1

    if-eqz v1, :cond_6

    .line 7
    iget-boolean v0, p0, Landroidx/slice/widget/RowContent;->mIsHeader:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Landroidx/slice/widget/RowContent;->mShowTitleItems:Z

    if-nez v0, :cond_2

    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    iget-object v0, p0, Landroidx/slice/widget/RowContent;->mStartItem:Landroidx/slice/SliceItem;

    :goto_1
    if-nez v0, :cond_5

    .line 8
    iget p0, p0, Landroidx/slice/widget/RowContent;->mLineCount:I

    if-nez p0, :cond_3

    const/4 p0, 0x0

    goto :goto_2

    :cond_3
    if-le p0, p2, :cond_4

    .line 9
    iget p0, p1, Landroidx/slice/widget/SliceStyle;->mRowTextWithRangeHeight:I

    goto :goto_2

    .line 10
    :cond_4
    iget p0, p1, Landroidx/slice/widget/SliceStyle;->mRowSingleTextWithRangeHeight:I

    .line 11
    :goto_2
    iget p1, p1, Landroidx/slice/widget/SliceStyle;->mRowRangeHeight:I

    goto :goto_4

    .line 12
    :cond_5
    iget v0, p1, Landroidx/slice/widget/SliceStyle;->mRowInlineRangeHeight:I

    goto :goto_5

    .line 13
    :cond_6
    iget-object v1, p0, Landroidx/slice/widget/RowContent;->mSelection:Landroidx/slice/SliceItem;

    if-eqz v1, :cond_8

    .line 14
    iget p0, p0, Landroidx/slice/widget/RowContent;->mLineCount:I

    if-le p0, p2, :cond_7

    .line 15
    iget p0, p1, Landroidx/slice/widget/SliceStyle;->mRowTextWithSelectionHeight:I

    goto :goto_3

    .line 16
    :cond_7
    iget p0, p1, Landroidx/slice/widget/SliceStyle;->mRowSingleTextWithSelectionHeight:I

    .line 17
    :goto_3
    iget p1, p1, Landroidx/slice/widget/SliceStyle;->mRowSelectionHeight:I

    :goto_4
    add-int v0, p0, p1

    goto :goto_5

    .line 18
    :cond_8
    iget v1, p0, Landroidx/slice/widget/RowContent;->mLineCount:I

    if-gt v1, p2, :cond_a

    .line 19
    iget-boolean p0, p0, Landroidx/slice/widget/RowContent;->mIsHeader:Z

    if-eqz p0, :cond_9

    goto :goto_5

    .line 20
    :cond_9
    iget v0, p1, Landroidx/slice/widget/SliceStyle;->mRowMinHeight:I

    :cond_a
    :goto_5
    return v0
.end method

.method public getInputRangeThumb()Landroidx/slice/SliceItem;
    .locals 3

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/RowContent;->mRange:Landroidx/slice/SliceItem;

    if-eqz p0, :cond_1

    .line 2
    invoke-virtual {p0}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/slice/Slice;->getItems()Ljava/util/List;

    move-result-object p0

    const/4 v0, 0x0

    .line 3
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 4
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/slice/SliceItem;

    .line 5
    iget-object v1, v1, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v2, "image"

    .line 6
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 7
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/slice/SliceItem;

    return-object p0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public isDefaultSeeMore()Z
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    .line 2
    iget-object v0, v0, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v1, "action"

    .line 3
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    .line 4
    invoke-virtual {v0}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object v0

    .line 5
    iget-object v0, v0, Landroidx/slice/Slice;->mHints:[Ljava/lang/String;

    const-string v1, "see_more"

    invoke-static {v0, v1}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 6
    iget-object p0, p0, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    .line 7
    invoke-virtual {p0}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/slice/Slice;->getItems()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public isValid()Z
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/slice/widget/SliceContent;->isValid()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroidx/slice/widget/RowContent;->mStartItem:Landroidx/slice/SliceItem;

    if-nez v0, :cond_0

    iget-object v0, p0, Landroidx/slice/widget/RowContent;->mPrimaryAction:Landroidx/slice/SliceItem;

    if-nez v0, :cond_0

    iget-object v0, p0, Landroidx/slice/widget/RowContent;->mTitleItem:Landroidx/slice/SliceItem;

    if-nez v0, :cond_0

    iget-object v0, p0, Landroidx/slice/widget/RowContent;->mSubtitleItem:Landroidx/slice/SliceItem;

    if-nez v0, :cond_0

    iget-object v0, p0, Landroidx/slice/widget/RowContent;->mEndItems:Ljava/util/ArrayList;

    .line 2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gtz v0, :cond_0

    iget-object v0, p0, Landroidx/slice/widget/RowContent;->mRange:Landroidx/slice/SliceItem;

    if-nez v0, :cond_0

    iget-object v0, p0, Landroidx/slice/widget/RowContent;->mSelection:Landroidx/slice/SliceItem;

    if-nez v0, :cond_0

    .line 3
    invoke-virtual {p0}, Landroidx/slice/widget/RowContent;->isDefaultSeeMore()Z

    move-result p0

    if-eqz p0, :cond_1

    :cond_0
    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
