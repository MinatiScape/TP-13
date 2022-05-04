.class public Landroidx/slice/widget/GridContent$CellContent;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/slice/widget/GridContent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CellContent"
.end annotation


# instance fields
.field public final mCellItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/slice/SliceItem;",
            ">;"
        }
    .end annotation
.end field

.field public mContentDescr:Landroidx/slice/SliceItem;

.field public mContentIntent:Landroidx/slice/SliceItem;

.field public mImage:Landroidx/core/graphics/drawable/IconCompat;

.field public mImageCount:I

.field public mImageMode:I

.field public mOverlayItem:Landroidx/slice/SliceItem;

.field public mPicker:Landroidx/slice/SliceItem;

.field public mTextCount:I

.field public mTitleItem:Landroidx/slice/SliceItem;

.field public mToggleItem:Landroidx/slice/SliceItem;


# direct methods
.method public constructor <init>(Landroidx/slice/SliceItem;)V
    .locals 16
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "cellItem"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 1
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v0, Landroidx/slice/widget/GridContent$CellContent;->mCellItems:Ljava/util/ArrayList;

    const/4 v3, -0x1

    .line 3
    iput v3, v0, Landroidx/slice/widget/GridContent$CellContent;->mImageMode:I

    .line 4
    iget-object v4, v1, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    .line 5
    iget-object v5, v1, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const-string v6, "shortcut"

    invoke-static {v5, v6}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    const-string v8, "image"

    const-string v9, "long"

    const-string v10, "text"

    const-string v11, "content_description"

    if-nez v5, :cond_18

    const-string v5, "slice"

    .line 6
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    const-string v13, "action"

    if-nez v12, :cond_0

    invoke-virtual {v13, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_18

    .line 7
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/slice/Slice;->getItems()Ljava/util/List;

    move-result-object v2

    .line 8
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    const/4 v15, 0x0

    if-eqz v14, :cond_16

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroidx/slice/SliceItem;

    .line 9
    iget-object v3, v14, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    .line 10
    invoke-virtual {v13, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 11
    iget-object v3, v14, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    .line 12
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_15

    .line 13
    :cond_1
    iget-object v3, v14, Landroidx/slice/SliceItem;->mSubType:Ljava/lang/String;

    const-string v7, "date_picker"

    .line 14
    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_15

    .line 15
    iget-object v3, v14, Landroidx/slice/SliceItem;->mSubType:Ljava/lang/String;

    const-string v6, "time_picker"

    .line 16
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_15

    .line 17
    invoke-virtual {v14}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/slice/Slice;->getItems()Ljava/util/List;

    move-result-object v3

    .line 18
    invoke-static {v14, v13}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v5

    if-nez v5, :cond_2

    const/4 v5, 0x2

    const/4 v8, 0x1

    const/4 v15, 0x1

    goto/16 :goto_5

    .line 19
    :cond_2
    invoke-virtual {v5}, Landroidx/slice/SliceItem;->getAction()Landroid/app/PendingIntent;

    .line 20
    invoke-virtual {v5}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object v12

    .line 21
    invoke-static {v12, v8, v15, v15}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/Slice;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v8

    if-eqz v8, :cond_3

    .line 22
    iget-object v12, v8, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    check-cast v12, Landroidx/core/graphics/drawable/IconCompat;

    .line 23
    invoke-static {v8}, Landroidx/slice/core/SliceActionImpl;->parseImageMode(Landroidx/slice/SliceItem;)I

    .line 24
    :cond_3
    invoke-virtual {v5}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object v8

    const-string v12, "title"

    invoke-static {v8, v10, v12, v15}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v8

    if-eqz v8, :cond_4

    .line 25
    invoke-virtual {v8}, Landroidx/slice/SliceItem;->getSanitizedText()Ljava/lang/CharSequence;

    .line 26
    :cond_4
    invoke-virtual {v5}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object v8

    invoke-static {v8, v10, v11}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v8

    if-eqz v8, :cond_5

    .line 27
    iget-object v8, v8, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    check-cast v8, Ljava/lang/CharSequence;

    .line 28
    :cond_5
    iget-object v8, v5, Landroidx/slice/SliceItem;->mSubType:Ljava/lang/String;

    if-nez v8, :cond_6

    const/4 v8, 0x1

    const/4 v15, 0x1

    goto/16 :goto_4

    .line 29
    :cond_6
    invoke-virtual {v8}, Ljava/lang/String;->hashCode()I

    move-result v11

    const v12, -0x33c144ac    # -4.9999184E7f

    if-eq v11, v12, :cond_b

    const v12, 0x2d3f6240

    if-eq v11, v12, :cond_9

    const v6, 0x4a87b63f    # 4447007.5f

    if-eq v11, v6, :cond_7

    goto :goto_1

    :cond_7
    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_8

    goto :goto_1

    :cond_8
    const/4 v6, 0x2

    goto :goto_2

    :cond_9
    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_a

    goto :goto_1

    :cond_a
    const/4 v6, 0x1

    goto :goto_2

    :cond_b
    const-string v6, "toggle"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_c

    :goto_1
    const/4 v6, -0x1

    goto :goto_2

    :cond_c
    const/4 v6, 0x0

    :goto_2
    const-string v7, "millis"

    if-eqz v6, :cond_10

    const/4 v15, 0x1

    if-eq v6, v15, :cond_e

    const/4 v8, 0x2

    if-eq v6, v8, :cond_d

    move v8, v15

    goto :goto_4

    :cond_d
    const/4 v6, 0x3

    .line 30
    invoke-static {v5, v9, v7}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v7

    if-eqz v7, :cond_f

    .line 31
    invoke-virtual {v7}, Landroidx/slice/SliceItem;->getLong()J

    goto :goto_3

    :cond_e
    const/4 v6, 0x4

    .line 32
    invoke-static {v5, v9, v7}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v7

    if-eqz v7, :cond_f

    .line 33
    invoke-virtual {v7}, Landroidx/slice/SliceItem;->getLong()J

    :cond_f
    :goto_3
    move v8, v6

    goto :goto_4

    :cond_10
    const/4 v15, 0x1

    .line 34
    iget-object v6, v5, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const-string v7, "selected"

    invoke-static {v6, v7}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    const/4 v8, 0x2

    .line 35
    :goto_4
    iget-object v6, v14, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const-string v7, "activity"

    invoke-static {v6, v7}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    invoke-virtual {v5}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object v6

    const-string v7, "int"

    const-string v9, "priority"

    invoke-static {v6, v7, v9}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v6

    if-eqz v6, :cond_11

    .line 37
    invoke-virtual {v6}, Landroidx/slice/SliceItem;->getInt()I

    .line 38
    :cond_11
    invoke-virtual {v5}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object v5

    const-string v6, "action_key"

    invoke-static {v5, v10, v6}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v5

    if-eqz v5, :cond_12

    .line 39
    iget-object v5, v5, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    check-cast v5, Ljava/lang/CharSequence;

    .line 40
    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    :cond_12
    const/4 v5, 0x2

    :goto_5
    if-ne v8, v5, :cond_13

    move v6, v15

    goto :goto_6

    :cond_13
    const/4 v6, 0x0

    :goto_6
    if-eqz v6, :cond_14

    .line 41
    iput-object v14, v0, Landroidx/slice/widget/GridContent$CellContent;->mToggleItem:Landroidx/slice/SliceItem;

    goto :goto_7

    :cond_14
    const/4 v5, 0x0

    .line 42
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/slice/SliceItem;

    iput-object v6, v0, Landroidx/slice/widget/GridContent$CellContent;->mContentIntent:Landroidx/slice/SliceItem;

    :goto_7
    move-object v15, v3

    goto :goto_8

    :cond_15
    const/4 v15, 0x1

    const/4 v3, -0x1

    goto/16 :goto_0

    .line 43
    :cond_16
    :goto_8
    invoke-virtual {v13, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_17

    .line 44
    iput-object v1, v0, Landroidx/slice/widget/GridContent$CellContent;->mContentIntent:Landroidx/slice/SliceItem;

    :cond_17
    const/4 v4, 0x0

    .line 45
    iput v4, v0, Landroidx/slice/widget/GridContent$CellContent;->mTextCount:I

    .line 46
    iput v4, v0, Landroidx/slice/widget/GridContent$CellContent;->mImageCount:I

    .line 47
    invoke-virtual {v0, v2}, Landroidx/slice/widget/GridContent$CellContent;->fillCellItems(Ljava/util/List;)V

    .line 48
    iget v1, v0, Landroidx/slice/widget/GridContent$CellContent;->mTextCount:I

    if-nez v1, :cond_1d

    iget v1, v0, Landroidx/slice/widget/GridContent$CellContent;->mImageCount:I

    if-nez v1, :cond_1d

    if-eqz v15, :cond_1d

    .line 49
    invoke-virtual {v0, v15}, Landroidx/slice/widget/GridContent$CellContent;->fillCellItems(Ljava/util/List;)V

    goto :goto_c

    :cond_18
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 50
    iget-object v5, v1, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    .line 51
    iget-object v6, v1, Landroidx/slice/SliceItem;->mSubType:Ljava/lang/String;

    .line 52
    invoke-virtual {v11, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1a

    const-string v6, "keywords"

    const-string v7, "ttl"

    const-string v11, "last_updated"

    filled-new-array {v6, v7, v11}, [Ljava/lang/String;

    move-result-object v6

    .line 53
    invoke-virtual {v1, v6}, Landroidx/slice/SliceItem;->hasAnyHints([Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_19

    goto :goto_9

    :cond_19
    move v15, v4

    goto :goto_a

    :cond_1a
    :goto_9
    move v15, v3

    :goto_a
    if-nez v15, :cond_1c

    .line 54
    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1b

    .line 55
    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1b

    .line 56
    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1c

    :cond_1b
    move v6, v3

    goto :goto_b

    :cond_1c
    move v6, v4

    :goto_b
    if-eqz v6, :cond_1d

    .line 57
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    :cond_1d
    :goto_c
    invoke-virtual/range {p0 .. p0}, Landroidx/slice/widget/GridContent$CellContent;->isValid()Z

    return-void
.end method


# virtual methods
.method public final fillCellItems(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "items"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/slice/SliceItem;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_9

    .line 2
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/slice/SliceItem;

    .line 3
    iget-object v2, v1, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    .line 4
    iget-object v3, p0, Landroidx/slice/widget/GridContent$CellContent;->mPicker:Landroidx/slice/SliceItem;

    if-nez v3, :cond_1

    .line 5
    iget-object v3, v1, Landroidx/slice/SliceItem;->mSubType:Ljava/lang/String;

    const-string v4, "date_picker"

    .line 6
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 7
    iget-object v3, v1, Landroidx/slice/SliceItem;->mSubType:Ljava/lang/String;

    const-string v4, "time_picker"

    .line 8
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 9
    :cond_0
    iput-object v1, p0, Landroidx/slice/widget/GridContent$CellContent;->mPicker:Landroidx/slice/SliceItem;

    goto/16 :goto_1

    .line 10
    :cond_1
    iget-object v3, v1, Landroidx/slice/SliceItem;->mSubType:Ljava/lang/String;

    const-string v4, "content_description"

    .line 11
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 12
    iput-object v1, p0, Landroidx/slice/widget/GridContent$CellContent;->mContentDescr:Landroidx/slice/SliceItem;

    goto :goto_1

    .line 13
    :cond_2
    iget v3, p0, Landroidx/slice/widget/GridContent$CellContent;->mTextCount:I

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-ge v3, v4, :cond_7

    const-string v3, "text"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string v3, "long"

    .line 14
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 15
    :cond_3
    iget-object v2, p0, Landroidx/slice/widget/GridContent$CellContent;->mTitleItem:Landroidx/slice/SliceItem;

    if-eqz v2, :cond_4

    .line 16
    iget-object v2, v2, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const-string v3, "title"

    invoke-static {v2, v3}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    iget-object v2, v1, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    invoke-static {v2, v3}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 17
    :cond_4
    iput-object v1, p0, Landroidx/slice/widget/GridContent$CellContent;->mTitleItem:Landroidx/slice/SliceItem;

    .line 18
    :cond_5
    iget-object v2, v1, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const-string v3, "overlay"

    invoke-static {v2, v3}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 19
    iget-object v2, p0, Landroidx/slice/widget/GridContent$CellContent;->mOverlayItem:Landroidx/slice/SliceItem;

    if-nez v2, :cond_8

    .line 20
    iput-object v1, p0, Landroidx/slice/widget/GridContent$CellContent;->mOverlayItem:Landroidx/slice/SliceItem;

    goto :goto_1

    .line 21
    :cond_6
    iget v2, p0, Landroidx/slice/widget/GridContent$CellContent;->mTextCount:I

    add-int/2addr v2, v5

    iput v2, p0, Landroidx/slice/widget/GridContent$CellContent;->mTextCount:I

    .line 22
    iget-object v2, p0, Landroidx/slice/widget/GridContent$CellContent;->mCellItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 23
    :cond_7
    iget v2, p0, Landroidx/slice/widget/GridContent$CellContent;->mImageCount:I

    if-ge v2, v5, :cond_8

    .line 24
    iget-object v2, v1, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v3, "image"

    .line 25
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 26
    invoke-static {v1}, Landroidx/slice/core/SliceActionImpl;->parseImageMode(Landroidx/slice/SliceItem;)I

    move-result v2

    .line 27
    iput v2, p0, Landroidx/slice/widget/GridContent$CellContent;->mImageMode:I

    .line 28
    iget v2, p0, Landroidx/slice/widget/GridContent$CellContent;->mImageCount:I

    add-int/2addr v2, v5

    iput v2, p0, Landroidx/slice/widget/GridContent$CellContent;->mImageCount:I

    .line 29
    iget-object v2, v1, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    check-cast v2, Landroidx/core/graphics/drawable/IconCompat;

    .line 30
    iput-object v2, p0, Landroidx/slice/widget/GridContent$CellContent;->mImage:Landroidx/core/graphics/drawable/IconCompat;

    .line 31
    iget-object v2, p0, Landroidx/slice/widget/GridContent$CellContent;->mCellItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_8
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    :cond_9
    return-void
.end method

.method public isValid()Z
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/GridContent$CellContent;->mPicker:Landroidx/slice/SliceItem;

    if-nez v0, :cond_1

    iget-object v0, p0, Landroidx/slice/widget/GridContent$CellContent;->mCellItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object p0, p0, Landroidx/slice/widget/GridContent$CellContent;->mCellItems:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    const/4 v0, 0x3

    if-gt p0, v0, :cond_0

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
