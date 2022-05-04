.class public Landroidx/slice/widget/GridContent;
.super Landroidx/slice/widget/SliceContent;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/slice/widget/GridContent$CellContent;
    }
.end annotation


# instance fields
.field public mAllImages:Z

.field public mFirstImage:Landroidx/core/graphics/drawable/IconCompat;

.field public mFirstImageSize:Landroid/graphics/Point;

.field public final mGridContent:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/slice/widget/GridContent$CellContent;",
            ">;"
        }
    .end annotation
.end field

.field public mIsLastIndex:Z

.field public mLargestImageMode:I

.field public mMaxCellLineCount:I

.field public mPrimaryAction:Landroidx/slice/SliceItem;

.field public mSeeMoreItem:Landroidx/slice/SliceItem;

.field public mTitleItem:Landroidx/slice/SliceItem;


# direct methods
.method public constructor <init>(Landroidx/slice/SliceItem;I)V
    .locals 17
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "gridItem",
            "position"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 1
    invoke-direct/range {p0 .. p2}, Landroidx/slice/widget/SliceContent;-><init>(Landroidx/slice/SliceItem;I)V

    .line 2
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v0, Landroidx/slice/widget/GridContent;->mGridContent:Ljava/util/ArrayList;

    const/4 v2, 0x5

    .line 3
    iput v2, v0, Landroidx/slice/widget/GridContent;->mLargestImageMode:I

    const/4 v2, 0x0

    .line 4
    iput-object v2, v0, Landroidx/slice/widget/GridContent;->mFirstImage:Landroidx/core/graphics/drawable/IconCompat;

    .line 5
    iput-object v2, v0, Landroidx/slice/widget/GridContent;->mFirstImageSize:Landroid/graphics/Point;

    const-string v3, "see_more"

    .line 6
    invoke-static {v1, v2, v3, v2}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v4

    iput-object v4, v0, Landroidx/slice/widget/GridContent;->mSeeMoreItem:Landroidx/slice/SliceItem;

    const/4 v5, 0x0

    const-string v6, "slice"

    if-eqz v4, :cond_0

    .line 7
    iget-object v4, v4, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    .line 8
    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 9
    iget-object v4, v0, Landroidx/slice/widget/GridContent;->mSeeMoreItem:Landroidx/slice/SliceItem;

    invoke-virtual {v4}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/slice/Slice;->getItems()Ljava/util/List;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 10
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7

    if-lez v7, :cond_0

    .line 11
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/slice/SliceItem;

    iput-object v4, v0, Landroidx/slice/widget/GridContent;->mSeeMoreItem:Landroidx/slice/SliceItem;

    :cond_0
    const-string v4, "shortcut"

    const-string v7, "title"

    .line 12
    filled-new-array {v4, v7}, [Ljava/lang/String;

    move-result-object v4

    const-string v7, "actions"

    .line 13
    filled-new-array {v7}, [Ljava/lang/String;

    move-result-object v7

    invoke-static {v1, v6, v4, v7}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v4

    iput-object v4, v0, Landroidx/slice/widget/GridContent;->mPrimaryAction:Landroidx/slice/SliceItem;

    const/4 v4, 0x1

    .line 14
    iput-boolean v4, v0, Landroidx/slice/widget/GridContent;->mAllImages:Z

    .line 15
    iget-object v7, v1, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    .line 16
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 17
    invoke-virtual/range {p1 .. p1}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/slice/Slice;->getItems()Ljava/util/List;

    move-result-object v1

    .line 18
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    move v7, v5

    .line 19
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v8

    const-string v9, "content_description"

    if-ge v7, v8, :cond_6

    .line 20
    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroidx/slice/SliceItem;

    .line 21
    invoke-static {v8, v2, v3, v2}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v10

    if-eqz v10, :cond_1

    move v10, v4

    goto :goto_1

    :cond_1
    move v10, v5

    :goto_1
    if-nez v10, :cond_3

    const-string v11, "shortcut"

    const-string v12, "see_more"

    const-string v13, "keywords"

    const-string v14, "ttl"

    const-string v15, "last_updated"

    const-string v16, "overlay"

    .line 22
    filled-new-array/range {v11 .. v16}, [Ljava/lang/String;

    move-result-object v10

    .line 23
    invoke-virtual {v8, v10}, Landroidx/slice/SliceItem;->hasAnyHints([Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    goto :goto_2

    :cond_2
    move v10, v5

    goto :goto_3

    :cond_3
    :goto_2
    move v10, v4

    .line 24
    :goto_3
    iget-object v11, v8, Landroidx/slice/SliceItem;->mSubType:Ljava/lang/String;

    .line 25
    invoke-virtual {v9, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 26
    iput-object v8, v0, Landroidx/slice/widget/SliceContent;->mContentDescr:Landroidx/slice/SliceItem;

    goto :goto_4

    :cond_4
    if-nez v10, :cond_5

    .line 27
    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_5
    :goto_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 28
    :cond_6
    :goto_5
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v5, v1, :cond_9

    .line 29
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/slice/SliceItem;

    .line 30
    iget-object v2, v1, Landroidx/slice/SliceItem;->mSubType:Ljava/lang/String;

    .line 31
    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 32
    new-instance v2, Landroidx/slice/widget/GridContent$CellContent;

    invoke-direct {v2, v1}, Landroidx/slice/widget/GridContent$CellContent;-><init>(Landroidx/slice/SliceItem;)V

    .line 33
    invoke-virtual {v0, v2}, Landroidx/slice/widget/GridContent;->processContent(Landroidx/slice/widget/GridContent$CellContent;)V

    :cond_7
    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    .line 34
    :cond_8
    new-instance v2, Landroidx/slice/widget/GridContent$CellContent;

    invoke-direct {v2, v1}, Landroidx/slice/widget/GridContent$CellContent;-><init>(Landroidx/slice/SliceItem;)V

    .line 35
    invoke-virtual {v0, v2}, Landroidx/slice/widget/GridContent;->processContent(Landroidx/slice/widget/GridContent$CellContent;)V

    .line 36
    :cond_9
    invoke-virtual/range {p0 .. p0}, Landroidx/slice/widget/GridContent;->isValid()Z

    return-void
.end method


# virtual methods
.method public getFirstImageSize(Landroid/content/Context;)Landroid/graphics/Point;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/GridContent;->mFirstImage:Landroidx/core/graphics/drawable/IconCompat;

    if-nez v0, :cond_0

    .line 2
    new-instance p0, Landroid/graphics/Point;

    const/4 p1, -0x1

    invoke-direct {p0, p1, p1}, Landroid/graphics/Point;-><init>(II)V

    return-object p0

    .line 3
    :cond_0
    iget-object v1, p0, Landroidx/slice/widget/GridContent;->mFirstImageSize:Landroid/graphics/Point;

    if-nez v1, :cond_1

    .line 4
    invoke-virtual {v0, p1}, Landroidx/core/graphics/drawable/IconCompat;->checkResource(Landroid/content/Context;)V

    .line 5
    invoke-virtual {v0, p1}, Landroidx/core/graphics/drawable/IconCompat;->toIcon(Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Icon;->loadDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 6
    new-instance v0, Landroid/graphics/Point;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p1

    invoke-direct {v0, v1, p1}, Landroid/graphics/Point;-><init>(II)V

    iput-object v0, p0, Landroidx/slice/widget/GridContent;->mFirstImageSize:Landroid/graphics/Point;

    .line 7
    :cond_1
    iget-object p0, p0, Landroidx/slice/widget/GridContent;->mFirstImageSize:Landroid/graphics/Point;

    return-object p0
.end method

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
    iget p2, p2, Landroidx/slice/widget/SliceViewPolicy;->mMode:I

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p2, v1, :cond_0

    move p2, v1

    goto :goto_0

    :cond_0
    move p2, v0

    .line 3
    :goto_0
    invoke-virtual {p0}, Landroidx/slice/widget/GridContent;->isValid()Z

    move-result v2

    if-nez v2, :cond_1

    goto/16 :goto_7

    .line 4
    :cond_1
    iget v2, p0, Landroidx/slice/widget/GridContent;->mLargestImageMode:I

    .line 5
    iget-boolean v3, p0, Landroidx/slice/widget/GridContent;->mAllImages:Z

    const/4 v4, 0x4

    if-eqz v3, :cond_6

    .line 6
    iget-object v3, p0, Landroidx/slice/widget/GridContent;->mGridContent:Ljava/util/ArrayList;

    .line 7
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v3, v1, :cond_3

    if-eqz p2, :cond_2

    .line 8
    iget p2, p1, Landroidx/slice/widget/SliceStyle;->mGridBigPicMinHeight:I

    goto/16 :goto_5

    .line 9
    :cond_2
    iget p2, p1, Landroidx/slice/widget/SliceStyle;->mGridBigPicMaxHeight:I

    goto/16 :goto_5

    :cond_3
    if-nez v2, :cond_4

    .line 10
    iget p2, p1, Landroidx/slice/widget/SliceStyle;->mGridMinHeight:I

    goto :goto_5

    :cond_4
    if-ne v2, v4, :cond_5

    .line 11
    iget-object p2, p1, Landroidx/slice/widget/SliceStyle;->mContext:Landroid/content/Context;

    invoke-virtual {p0, p2}, Landroidx/slice/widget/GridContent;->getFirstImageSize(Landroid/content/Context;)Landroid/graphics/Point;

    move-result-object p2

    iget p2, p2, Landroid/graphics/Point;->y:I

    goto :goto_5

    .line 12
    :cond_5
    iget p2, p1, Landroidx/slice/widget/SliceStyle;->mGridAllImagesHeight:I

    goto :goto_5

    .line 13
    :cond_6
    iget v3, p0, Landroidx/slice/widget/GridContent;->mMaxCellLineCount:I

    if-le v3, v1, :cond_7

    move v3, v1

    goto :goto_1

    :cond_7
    move v3, v0

    .line 14
    :goto_1
    iget-object v5, p0, Landroidx/slice/widget/GridContent;->mFirstImage:Landroidx/core/graphics/drawable/IconCompat;

    if-eqz v5, :cond_8

    move v5, v1

    goto :goto_2

    :cond_8
    move v5, v0

    :goto_2
    if-eqz v2, :cond_a

    const/4 v6, 0x5

    if-ne v2, v6, :cond_9

    goto :goto_3

    :cond_9
    move v6, v0

    goto :goto_4

    :cond_a
    :goto_3
    move v6, v1

    :goto_4
    if-ne v2, v4, :cond_c

    .line 15
    iget-object p2, p1, Landroidx/slice/widget/SliceStyle;->mContext:Landroid/content/Context;

    invoke-virtual {p0, p2}, Landroidx/slice/widget/GridContent;->getFirstImageSize(Landroid/content/Context;)Landroid/graphics/Point;

    move-result-object p2

    iget p2, p2, Landroid/graphics/Point;->y:I

    if-eqz v3, :cond_b

    const/4 v1, 0x2

    .line 16
    :cond_b
    iget v2, p1, Landroidx/slice/widget/SliceStyle;->mGridRawImageTextHeight:I

    mul-int/2addr v1, v2

    add-int/2addr p2, v1

    goto :goto_5

    :cond_c
    if-eqz v3, :cond_e

    if-nez p2, :cond_e

    if-eqz v5, :cond_d

    .line 17
    iget p2, p1, Landroidx/slice/widget/SliceStyle;->mGridMaxHeight:I

    goto :goto_5

    .line 18
    :cond_d
    iget p2, p1, Landroidx/slice/widget/SliceStyle;->mGridMinHeight:I

    goto :goto_5

    :cond_e
    if-eqz v6, :cond_f

    .line 19
    iget p2, p1, Landroidx/slice/widget/SliceStyle;->mGridMinHeight:I

    goto :goto_5

    .line 20
    :cond_f
    iget p2, p1, Landroidx/slice/widget/SliceStyle;->mGridImageTextHeight:I

    .line 21
    :goto_5
    iget-boolean v1, p0, Landroidx/slice/widget/GridContent;->mAllImages:Z

    if-eqz v1, :cond_10

    .line 22
    iget v2, p0, Landroidx/slice/widget/SliceContent;->mRowIndex:I

    if-nez v2, :cond_10

    .line 23
    iget v2, p1, Landroidx/slice/widget/SliceStyle;->mGridTopPadding:I

    goto :goto_6

    :cond_10
    move v2, v0

    :goto_6
    if-eqz v1, :cond_11

    .line 24
    iget-boolean p0, p0, Landroidx/slice/widget/GridContent;->mIsLastIndex:Z

    if-eqz p0, :cond_11

    .line 25
    iget v0, p1, Landroidx/slice/widget/SliceStyle;->mGridBottomPadding:I

    :cond_11
    add-int/2addr p2, v2

    add-int/2addr v0, p2

    :goto_7
    return v0
.end method

.method public isValid()Z
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/slice/widget/SliceContent;->isValid()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Landroidx/slice/widget/GridContent;->mGridContent:Ljava/util/ArrayList;

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

.method public final processContent(Landroidx/slice/widget/GridContent$CellContent;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "cc"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroidx/slice/widget/GridContent$CellContent;->isValid()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 2
    iget-object v0, p0, Landroidx/slice/widget/GridContent;->mTitleItem:Landroidx/slice/SliceItem;

    if-nez v0, :cond_0

    .line 3
    iget-object v0, p1, Landroidx/slice/widget/GridContent$CellContent;->mTitleItem:Landroidx/slice/SliceItem;

    if-eqz v0, :cond_0

    .line 4
    iput-object v0, p0, Landroidx/slice/widget/GridContent;->mTitleItem:Landroidx/slice/SliceItem;

    .line 5
    :cond_0
    iget-object v0, p0, Landroidx/slice/widget/GridContent;->mGridContent:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 6
    iget-object v0, p1, Landroidx/slice/widget/GridContent$CellContent;->mCellItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    iget-object v0, p1, Landroidx/slice/widget/GridContent$CellContent;->mCellItems:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/slice/SliceItem;

    .line 7
    iget-object v0, v0, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v3, "image"

    .line 8
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    goto :goto_0

    :cond_1
    move v0, v2

    :goto_0
    if-nez v0, :cond_2

    .line 9
    iput-boolean v2, p0, Landroidx/slice/widget/GridContent;->mAllImages:Z

    .line 10
    :cond_2
    iget v0, p0, Landroidx/slice/widget/GridContent;->mMaxCellLineCount:I

    .line 11
    iget v3, p1, Landroidx/slice/widget/GridContent$CellContent;->mTextCount:I

    .line 12
    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Landroidx/slice/widget/GridContent;->mMaxCellLineCount:I

    .line 13
    iget-object v0, p0, Landroidx/slice/widget/GridContent;->mFirstImage:Landroidx/core/graphics/drawable/IconCompat;

    if-nez v0, :cond_4

    .line 14
    iget-object v0, p1, Landroidx/slice/widget/GridContent$CellContent;->mImage:Landroidx/core/graphics/drawable/IconCompat;

    if-eqz v0, :cond_3

    goto :goto_1

    :cond_3
    move v1, v2

    :goto_1
    if-eqz v1, :cond_4

    .line 15
    iput-object v0, p0, Landroidx/slice/widget/GridContent;->mFirstImage:Landroidx/core/graphics/drawable/IconCompat;

    .line 16
    :cond_4
    iget v0, p0, Landroidx/slice/widget/GridContent;->mLargestImageMode:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_5

    .line 17
    iget p1, p1, Landroidx/slice/widget/GridContent$CellContent;->mImageMode:I

    goto :goto_2

    .line 18
    :cond_5
    iget p1, p1, Landroidx/slice/widget/GridContent$CellContent;->mImageMode:I

    .line 19
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    :goto_2
    iput p1, p0, Landroidx/slice/widget/GridContent;->mLargestImageMode:I

    :cond_6
    return-void
.end method
