.class public Landroidx/slice/widget/GridRowView;
.super Landroidx/slice/widget/SliceChildView;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/slice/widget/GridRowView$TimeSetListener;,
        Landroidx/slice/widget/GridRowView$DateSetListener;
    }
.end annotation


# instance fields
.field public final mForeground:Landroid/view/View;

.field public mGridContent:Landroidx/slice/widget/GridContent;

.field public final mGutter:I

.field public final mIconSize:I

.field public final mLargeImageHeight:I

.field public final mLoc:[I

.field public mMaxCellUpdateScheduled:Z

.field public mMaxCells:I

.field public final mMaxCellsUpdater:Landroid/view/ViewTreeObserver$OnPreDrawListener;

.field public mRowCount:I

.field public mRowIndex:I

.field public final mSmallImageMinWidth:I

.field public final mSmallImageSize:I

.field public final mTextPadding:I

.field public final mViewContainer:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Landroidx/slice/widget/GridRowView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "attrs"
        }
    .end annotation

    .line 2
    invoke-direct {p0, p1, p2}, Landroidx/slice/widget/SliceChildView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x2

    new-array p1, p1, [I

    .line 3
    iput-object p1, p0, Landroidx/slice/widget/GridRowView;->mLoc:[I

    const/4 p1, -0x1

    .line 4
    iput p1, p0, Landroidx/slice/widget/GridRowView;->mMaxCells:I

    .line 5
    new-instance p2, Landroidx/slice/widget/GridRowView$2;

    invoke-direct {p2, p0}, Landroidx/slice/widget/GridRowView$2;-><init>(Landroidx/slice/widget/GridRowView;)V

    iput-object p2, p0, Landroidx/slice/widget/GridRowView;->mMaxCellsUpdater:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    .line 7
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroidx/slice/widget/GridRowView;->mViewContainer:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 9
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, p1, p1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/16 v1, 0x10

    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    const v0, 0x7f070048

    .line 11
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Landroidx/slice/widget/GridRowView;->mIconSize:I

    const v0, 0x7f070057

    .line 12
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Landroidx/slice/widget/GridRowView;->mSmallImageSize:I

    const v0, 0x7f070040

    .line 13
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Landroidx/slice/widget/GridRowView;->mLargeImageHeight:I

    const v0, 0x7f07003f

    .line 14
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Landroidx/slice/widget/GridRowView;->mSmallImageMinWidth:I

    const v0, 0x7f07003e

    .line 15
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Landroidx/slice/widget/GridRowView;->mGutter:I

    const v0, 0x7f070047

    .line 16
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Landroidx/slice/widget/GridRowView;->mTextPadding:I

    .line 17
    new-instance p2, Landroid/view/View;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Landroidx/slice/widget/GridRowView;->mForeground:Landroid/view/View;

    .line 18
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, p1, p1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p2, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method


# virtual methods
.method public final addCell(Landroidx/slice/widget/GridContent$CellContent;II)V
    .locals 28
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "cell",
            "index",
            "total"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    .line 1
    invoke-virtual/range {p0 .. p0}, Landroidx/slice/widget/SliceChildView;->getMode()I

    move-result v4

    const/4 v6, 0x1

    if-ne v4, v6, :cond_1

    iget-object v4, v0, Landroidx/slice/widget/GridRowView;->mGridContent:Landroidx/slice/widget/GridContent;

    .line 2
    iget-object v4, v4, Landroidx/slice/widget/GridContent;->mFirstImage:Landroidx/core/graphics/drawable/IconCompat;

    if-eqz v4, :cond_0

    move v4, v6

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    if-eqz v4, :cond_1

    move v4, v6

    goto :goto_1

    :cond_1
    const/4 v4, 0x2

    .line 3
    :goto_1
    new-instance v8, Landroid/widget/LinearLayout;

    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 4
    invoke-virtual {v8, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 5
    invoke-virtual {v8, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 6
    iget-object v9, v1, Landroidx/slice/widget/GridContent$CellContent;->mCellItems:Ljava/util/ArrayList;

    .line 7
    iget-object v10, v1, Landroidx/slice/widget/GridContent$CellContent;->mContentIntent:Landroidx/slice/SliceItem;

    .line 8
    iget-object v11, v1, Landroidx/slice/widget/GridContent$CellContent;->mPicker:Landroidx/slice/SliceItem;

    .line 9
    iget-object v12, v1, Landroidx/slice/widget/GridContent$CellContent;->mToggleItem:Landroidx/slice/SliceItem;

    .line 10
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-ne v13, v6, :cond_2

    move v13, v6

    goto :goto_2

    :cond_2
    const/4 v13, 0x0

    :goto_2
    const-string v14, "title"

    const-string v15, "large"

    const-string v5, "text"

    if-nez v13, :cond_7

    .line 11
    invoke-virtual/range {p0 .. p0}, Landroidx/slice/widget/SliceChildView;->getMode()I

    move-result v7

    if-ne v7, v6, :cond_7

    .line 12
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 13
    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_3
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_4

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v6, v18

    check-cast v6, Landroidx/slice/SliceItem;

    move-object/from16 v18, v10

    .line 14
    iget-object v10, v6, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    .line 15
    invoke-virtual {v5, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 16
    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    move-object/from16 v10, v18

    const/4 v6, 0x1

    goto :goto_3

    :cond_4
    move-object/from16 v18, v10

    .line 17
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 18
    :goto_4
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-le v10, v4, :cond_6

    .line 19
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroidx/slice/SliceItem;

    move-object/from16 v17, v7

    .line 20
    filled-new-array {v14, v15}, [Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v10, v7}, Landroidx/slice/SliceItem;->hasAnyHints([Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_5

    .line 21
    invoke-interface {v6}, Ljava/util/Iterator;->remove()V

    :cond_5
    move-object/from16 v7, v17

    goto :goto_4

    :cond_6
    move-object/from16 v17, v7

    goto :goto_5

    :cond_7
    move-object/from16 v18, v10

    const/4 v7, 0x0

    :goto_5
    move-object/from16 v19, v12

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v6, 0x0

    const/4 v10, 0x0

    const/16 v17, 0x0

    .line 22
    :goto_6
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v12

    move-object/from16 v20, v11

    if-ge v6, v12, :cond_23

    .line 23
    invoke-virtual {v9, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroidx/slice/SliceItem;

    .line 24
    iget-object v11, v12, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    move-object/from16 v22, v9

    .line 25
    invoke-virtual {v0, v3}, Landroidx/slice/widget/GridRowView;->determinePadding(Landroidx/slice/SliceItem;)I

    move-result v9

    if-ge v10, v4, :cond_11

    .line 26
    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    move/from16 v24, v4

    const-string v4, "long"

    if-nez v23, :cond_9

    .line 27
    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_8

    goto :goto_7

    :cond_8
    move-object/from16 v16, v3

    goto/16 :goto_d

    :cond_9
    :goto_7
    if-eqz v7, :cond_a

    .line 28
    invoke-interface {v7, v12}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_a

    move-object/from16 v16, v3

    move-object/from16 v23, v5

    move-object/from16 v25, v7

    move/from16 v27, v10

    move-object/from16 v26, v14

    goto/16 :goto_1c

    .line 29
    :cond_a
    iget-object v11, v12, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    .line 30
    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_b

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_b

    move-object/from16 v16, v3

    move-object/from16 v23, v5

    move-object/from16 v25, v7

    move-object/from16 v26, v14

    const/4 v3, 0x0

    goto/16 :goto_c

    :cond_b
    move-object/from16 v23, v5

    .line 31
    filled-new-array {v15, v14}, [Ljava/lang/String;

    move-result-object v5

    invoke-static {v12, v5}, Landroidx/slice/core/SliceQuery;->hasAnyHints(Landroidx/slice/SliceItem;[Ljava/lang/String;)Z

    move-result v5

    .line 32
    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v21

    move-object/from16 v25, v7

    invoke-static/range {v21 .. v21}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v7

    if-eqz v5, :cond_c

    const v21, 0x7f0d002d

    goto :goto_8

    :cond_c
    const v21, 0x7f0d0029

    :goto_8
    move-object/from16 v16, v3

    move-object/from16 v26, v14

    move/from16 v14, v21

    const/4 v3, 0x0

    invoke-virtual {v7, v14, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 33
    iget-object v14, v0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    if-eqz v14, :cond_f

    iget-object v3, v0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    if-eqz v3, :cond_f

    if-eqz v5, :cond_d

    .line 34
    iget v3, v14, Landroidx/slice/widget/SliceStyle;->mGridTitleSize:I

    goto :goto_9

    .line 35
    :cond_d
    iget v3, v14, Landroidx/slice/widget/SliceStyle;->mGridSubtitleSize:I

    :goto_9
    int-to-float v3, v3

    const/4 v14, 0x0

    .line 36
    invoke-virtual {v7, v14, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    if-eqz v5, :cond_e

    .line 37
    iget-object v3, v0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    invoke-virtual {v3}, Landroidx/slice/widget/RowStyle;->getTitleColor()I

    move-result v3

    goto :goto_a

    :cond_e
    iget-object v3, v0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    invoke-virtual {v3}, Landroidx/slice/widget/RowStyle;->getSubtitleColor()I

    move-result v3

    .line 38
    :goto_a
    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 39
    :cond_f
    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_10

    .line 40
    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v12}, Landroidx/slice/SliceItem;->getLong()J

    move-result-wide v4

    invoke-static {v3, v4, v5}, Landroidx/slice/widget/SliceViewUtil;->getTimestampString(Landroid/content/Context;J)Ljava/lang/CharSequence;

    move-result-object v3

    goto :goto_b

    .line 41
    :cond_10
    invoke-virtual {v12}, Landroidx/slice/SliceItem;->getSanitizedText()Ljava/lang/CharSequence;

    move-result-object v3

    .line 42
    :goto_b
    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    invoke-virtual {v8, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const/4 v3, 0x0

    .line 44
    invoke-virtual {v7, v3, v9, v3, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    const/4 v3, 0x1

    :goto_c
    if-eqz v3, :cond_21

    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_1b

    :cond_11
    move-object/from16 v16, v3

    move/from16 v24, v4

    :goto_d
    move-object/from16 v23, v5

    move-object/from16 v25, v7

    move-object/from16 v26, v14

    const/4 v3, 0x1

    if-ge v2, v3, :cond_21

    .line 45
    iget-object v3, v12, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v4, "image"

    .line 46
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_21

    .line 47
    iget-object v3, v1, Landroidx/slice/widget/GridContent$CellContent;->mOverlayItem:Landroidx/slice/SliceItem;

    .line 48
    iget v5, v0, Landroidx/slice/widget/SliceChildView;->mTintColor:I

    .line 49
    iget-object v7, v12, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    .line 50
    iget-object v9, v0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    if-eqz v9, :cond_13

    .line 51
    iget v9, v9, Landroidx/slice/widget/SliceStyle;->mImageCornerRadius:F

    const/4 v11, 0x0

    cmpl-float v9, v9, v11

    if-lez v9, :cond_12

    const/4 v9, 0x1

    goto :goto_e

    :cond_12
    const/4 v9, 0x0

    :goto_e
    if-eqz v9, :cond_13

    const/4 v9, 0x1

    goto :goto_f

    :cond_13
    const/4 v9, 0x0

    .line 52
    :goto_f
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_20

    .line 53
    iget-object v4, v12, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    check-cast v4, Landroidx/core/graphics/drawable/IconCompat;

    if-nez v4, :cond_14

    goto/16 :goto_19

    .line 54
    :cond_14
    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v4, v7}, Landroidx/core/graphics/drawable/IconCompat;->loadDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-nez v4, :cond_15

    goto/16 :goto_19

    .line 55
    :cond_15
    new-instance v7, Landroid/widget/ImageView;

    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v11

    invoke-direct {v7, v11}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    if-eqz v9, :cond_16

    .line 56
    new-instance v11, Landroidx/slice/CornerDrawable;

    iget-object v14, v0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 57
    iget v14, v14, Landroidx/slice/widget/SliceStyle;->mImageCornerRadius:F

    .line 58
    invoke-direct {v11, v4, v14}, Landroidx/slice/CornerDrawable;-><init>(Landroid/graphics/drawable/Drawable;F)V

    .line 59
    invoke-virtual {v7, v11}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_10

    .line 60
    :cond_16
    invoke-virtual {v7, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 61
    :goto_10
    iget-object v4, v12, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const-string v11, "raw"

    invoke-static {v4, v11}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    const-string v11, "no_tint"

    if-eqz v4, :cond_17

    .line 62
    sget-object v4, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v7, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 63
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v9, v0, Landroidx/slice/widget/GridRowView;->mGridContent:Landroidx/slice/widget/GridContent;

    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v14

    invoke-virtual {v9, v14}, Landroidx/slice/widget/GridContent;->getFirstImageSize(Landroid/content/Context;)Landroid/graphics/Point;

    move-result-object v9

    iget v9, v9, Landroid/graphics/Point;->x:I

    iget-object v14, v0, Landroidx/slice/widget/GridRowView;->mGridContent:Landroidx/slice/widget/GridContent;

    move/from16 v27, v10

    .line 64
    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-virtual {v14, v10}, Landroidx/slice/widget/GridContent;->getFirstImageSize(Landroid/content/Context;)Landroid/graphics/Point;

    move-result-object v10

    iget v10, v10, Landroid/graphics/Point;->y:I

    invoke-direct {v4, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    goto :goto_15

    :cond_17
    move/from16 v27, v10

    .line 65
    iget-object v4, v12, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    invoke-static {v4, v15}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1a

    if-eqz v9, :cond_18

    .line 66
    sget-object v4, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    goto :goto_11

    :cond_18
    sget-object v4, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    :goto_11
    invoke-virtual {v7, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    if-eqz v13, :cond_19

    const/4 v4, -0x1

    goto :goto_12

    .line 67
    :cond_19
    iget v4, v0, Landroidx/slice/widget/GridRowView;->mLargeImageHeight:I

    .line 68
    :goto_12
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v10, -0x1

    invoke-direct {v9, v10, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    move v4, v10

    goto :goto_16

    .line 69
    :cond_1a
    iget-object v4, v12, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    invoke-static {v4, v11}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    const/4 v9, 0x1

    xor-int/2addr v4, v9

    if-nez v4, :cond_1b

    .line 70
    iget v9, v0, Landroidx/slice/widget/GridRowView;->mSmallImageSize:I

    goto :goto_13

    :cond_1b
    iget v9, v0, Landroidx/slice/widget/GridRowView;->mIconSize:I

    :goto_13
    if-eqz v4, :cond_1c

    .line 71
    sget-object v4, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    goto :goto_14

    :cond_1c
    sget-object v4, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    :goto_14
    invoke-virtual {v7, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 72
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v9, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    :goto_15
    move-object v9, v4

    const/4 v4, -0x1

    :goto_16
    if-eq v5, v4, :cond_1d

    .line 73
    iget-object v4, v12, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    invoke-static {v4, v11}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1d

    .line 74
    invoke-virtual {v7, v5}, Landroid/widget/ImageView;->setColorFilter(I)V

    :cond_1d
    if-eqz v3, :cond_1f

    .line 75
    iget-object v4, v0, Landroidx/slice/widget/GridRowView;->mViewContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    iget v5, v0, Landroidx/slice/widget/GridRowView;->mMaxCells:I

    const/4 v10, 0x1

    sub-int/2addr v5, v10

    if-ne v4, v5, :cond_1e

    goto :goto_17

    .line 76
    :cond_1e
    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    const v5, 0x7f0d001e

    const/4 v10, 0x0

    .line 77
    invoke-virtual {v4, v5, v8, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/FrameLayout;

    .line 78
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v11, -0x2

    invoke-direct {v5, v11, v11}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v7, v10, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    const v5, 0x7f0a024c

    .line 79
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 80
    iget-object v3, v3, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    check-cast v3, Ljava/lang/CharSequence;

    .line 81
    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v3, 0x7f0a0268

    .line 82
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 83
    new-instance v5, Landroidx/slice/CornerDrawable;

    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v7

    const v10, 0x7f080048

    sget-object v11, Landroidx/core/content/ContextCompat;->sLock:Ljava/lang/Object;

    .line 84
    invoke-virtual {v7, v10}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 85
    iget-object v10, v0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 86
    iget v10, v10, Landroidx/slice/widget/SliceStyle;->mImageCornerRadius:F

    .line 87
    invoke-direct {v5, v7, v10}, Landroidx/slice/CornerDrawable;-><init>(Landroid/graphics/drawable/Drawable;F)V

    .line 88
    invoke-virtual {v3, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 89
    invoke-virtual {v8, v4, v9}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_18

    .line 90
    :cond_1f
    :goto_17
    invoke-virtual {v8, v7, v9}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :goto_18
    const/4 v3, 0x1

    goto :goto_1a

    :cond_20
    :goto_19
    move/from16 v27, v10

    const/4 v3, 0x0

    :goto_1a
    if-eqz v3, :cond_22

    add-int/lit8 v2, v2, 0x1

    move/from16 v10, v27

    :goto_1b
    move-object v3, v12

    const/16 v17, 0x1

    goto :goto_1d

    :cond_21
    move/from16 v27, v10

    :cond_22
    :goto_1c
    move-object/from16 v3, v16

    move/from16 v10, v27

    :goto_1d
    add-int/lit8 v6, v6, 0x1

    move-object/from16 v11, v20

    move-object/from16 v9, v22

    move-object/from16 v5, v23

    move/from16 v4, v24

    move-object/from16 v7, v25

    move-object/from16 v14, v26

    goto/16 :goto_6

    :cond_23
    move-object/from16 v16, v3

    if-eqz v20, :cond_25

    move-object/from16 v2, v20

    .line 91
    iget-object v3, v2, Landroidx/slice/SliceItem;->mSubType:Ljava/lang/String;

    const-string v4, "date_picker"

    .line 92
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_24

    move-object/from16 v3, v16

    .line 93
    invoke-virtual {v0, v3}, Landroidx/slice/widget/GridRowView;->determinePadding(Landroidx/slice/SliceItem;)I

    move-result v3

    const/4 v4, 0x1

    invoke-virtual {v0, v2, v8, v3, v4}, Landroidx/slice/widget/GridRowView;->addPickerItem(Landroidx/slice/SliceItem;Landroid/view/ViewGroup;IZ)Z

    move-result v17

    goto :goto_1e

    :cond_24
    move-object/from16 v3, v16

    .line 94
    iget-object v4, v2, Landroidx/slice/SliceItem;->mSubType:Ljava/lang/String;

    const-string v5, "time_picker"

    .line 95
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_25

    .line 96
    invoke-virtual {v0, v3}, Landroidx/slice/widget/GridRowView;->determinePadding(Landroidx/slice/SliceItem;)I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v8, v3, v4}, Landroidx/slice/widget/GridRowView;->addPickerItem(Landroidx/slice/SliceItem;Landroid/view/ViewGroup;IZ)Z

    move-result v17

    :cond_25
    :goto_1e
    if-eqz v19, :cond_26

    .line 97
    new-instance v2, Landroidx/slice/widget/SliceActionView;

    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, v0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    invoke-direct {v2, v3, v4}, Landroidx/slice/widget/SliceActionView;-><init>(Landroid/content/Context;Landroidx/slice/widget/RowStyle;)V

    .line 98
    invoke-virtual {v8, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    move-object v9, v2

    const/4 v3, 0x1

    goto :goto_1f

    :cond_26
    move/from16 v3, v17

    const/4 v9, 0x0

    :goto_1f
    if-eqz v3, :cond_2b

    .line 99
    iget-object v1, v1, Landroidx/slice/widget/GridContent$CellContent;->mContentDescr:Landroidx/slice/SliceItem;

    if-eqz v1, :cond_27

    .line 100
    iget-object v1, v1, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    move-object v7, v1

    check-cast v7, Ljava/lang/CharSequence;

    goto :goto_20

    :cond_27
    const/4 v7, 0x0

    :goto_20
    if-eqz v7, :cond_28

    .line 101
    invoke-virtual {v8, v7}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 102
    :cond_28
    iget-object v1, v0, Landroidx/slice/widget/GridRowView;->mViewContainer:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, -0x2

    const/4 v5, 0x0

    invoke-direct {v2, v5, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v8, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    move/from16 v1, p3

    add-int/lit8 v2, v1, -0x1

    move/from16 v3, p2

    if-eq v3, v2, :cond_29

    .line 103
    invoke-virtual {v8}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 104
    iget v4, v0, Landroidx/slice/widget/GridRowView;->mGutter:I

    invoke-virtual {v2, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 105
    invoke-virtual {v8, v2}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_29
    if-eqz v18, :cond_2a

    .line 106
    new-instance v2, Landroidx/slice/widget/EventInfo;

    invoke-virtual/range {p0 .. p0}, Landroidx/slice/widget/SliceChildView;->getMode()I

    move-result v4

    iget v5, v0, Landroidx/slice/widget/GridRowView;->mRowIndex:I

    const/4 v6, 0x1

    invoke-direct {v2, v4, v6, v6, v5}, Landroidx/slice/widget/EventInfo;-><init>(IIII)V

    const/4 v4, 0x2

    .line 107
    invoke-virtual {v2, v4, v3, v1}, Landroidx/slice/widget/EventInfo;->setPosition(III)V

    .line 108
    new-instance v4, Landroid/util/Pair;

    move-object/from16 v5, v18

    invoke-direct {v4, v5, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 109
    invoke-virtual {v8, v4}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 110
    invoke-virtual {v0, v8, v6}, Landroidx/slice/widget/GridRowView;->makeClickable(Landroid/view/View;Z)V

    :cond_2a
    if-eqz v19, :cond_2b

    .line 111
    new-instance v2, Landroidx/slice/widget/EventInfo;

    .line 112
    invoke-virtual/range {p0 .. p0}, Landroidx/slice/widget/SliceChildView;->getMode()I

    move-result v4

    const/4 v5, 0x3

    iget v6, v0, Landroidx/slice/widget/GridRowView;->mRowIndex:I

    const/4 v7, 0x0

    invoke-direct {v2, v4, v7, v5, v6}, Landroidx/slice/widget/EventInfo;-><init>(IIII)V

    .line 113
    new-instance v10, Landroidx/slice/core/SliceActionImpl;

    move-object/from16 v4, v19

    invoke-direct {v10, v4}, Landroidx/slice/core/SliceActionImpl;-><init>(Landroidx/slice/SliceItem;)V

    iget-object v12, v0, Landroidx/slice/widget/SliceChildView;->mObserver:Landroidx/slice/widget/SliceView$OnSliceActionListener;

    iget v13, v0, Landroidx/slice/widget/SliceChildView;->mTintColor:I

    iget-object v14, v0, Landroidx/slice/widget/SliceChildView;->mLoadingListener:Landroidx/slice/widget/SliceActionView$SliceActionLoadingListener;

    move-object v11, v2

    invoke-virtual/range {v9 .. v14}, Landroidx/slice/widget/SliceActionView;->setAction(Landroidx/slice/core/SliceActionImpl;Landroidx/slice/widget/EventInfo;Landroidx/slice/widget/SliceView$OnSliceActionListener;ILandroidx/slice/widget/SliceActionView$SliceActionLoadingListener;)V

    const/4 v0, 0x2

    .line 114
    invoke-virtual {v2, v0, v3, v1}, Landroidx/slice/widget/EventInfo;->setPosition(III)V

    :cond_2b
    return-void
.end method

.method public final addPickerItem(Landroidx/slice/SliceItem;Landroid/view/ViewGroup;IZ)Z
    .locals 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "pickerItem",
            "container",
            "padding",
            "isDatePicker"
        }
    .end annotation

    const-string v0, "long"

    const-string v1, "millis"

    .line 1
    invoke-static {p1, v0, v1}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v0

    const/4 v6, 0x0

    if-nez v0, :cond_0

    return v6

    .line 2
    :cond_0
    invoke-virtual {v0}, Landroidx/slice/SliceItem;->getLong()J

    move-result-wide v0

    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f0d002d

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Landroid/widget/TextView;

    .line 4
    iget-object v2, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    if-eqz v2, :cond_1

    .line 5
    iget v2, v2, Landroidx/slice/widget/SliceStyle;->mGridTitleSize:I

    int-to-float v2, v2

    .line 6
    invoke-virtual {v7, v6, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 7
    iget-object v2, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 8
    iget v2, v2, Landroidx/slice/widget/SliceStyle;->mTitleColor:I

    .line 9
    invoke-virtual {v7, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 10
    :cond_1
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2, v0, v1}, Ljava/util/Date;-><init>(J)V

    const-string v0, "text"

    const-string v1, "title"

    .line 11
    invoke-static {p1, v0, v1, v5}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 12
    iget-object v0, v0, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/CharSequence;

    .line 13
    invoke-virtual {v7, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    :cond_2
    iget v5, p0, Landroidx/slice/widget/GridRowView;->mRowIndex:I

    .line 15
    new-instance v8, Landroidx/slice/widget/GridRowView$1;

    move-object v0, v8

    move-object v1, p0

    move v3, p4

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Landroidx/slice/widget/GridRowView$1;-><init>(Landroidx/slice/widget/GridRowView;Ljava/util/Date;ZLandroidx/slice/SliceItem;I)V

    invoke-virtual {p2, v8}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 v0, 0x1

    .line 16
    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->setClickable(Z)V

    const v1, 0x101045c

    .line 17
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v1}, Landroidx/slice/widget/SliceViewUtil;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/view/ViewGroup;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 18
    invoke-virtual {p2, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 19
    invoke-virtual {v7, v6, p3, v6, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    return v0
.end method

.method public final determinePadding(Landroidx/slice/SliceItem;)I
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "prevItem"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 1
    :cond_0
    iget-object v1, p1, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v2, "image"

    .line 2
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 3
    iget p0, p0, Landroidx/slice/widget/GridRowView;->mTextPadding:I

    return p0

    .line 4
    :cond_1
    iget-object v1, p1, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v2, "text"

    .line 5
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 6
    iget-object p1, p1, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v1, "long"

    .line 7
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    return v0

    .line 8
    :cond_3
    :goto_0
    iget-object p0, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    if-eqz p0, :cond_4

    .line 9
    iget v0, p0, Landroidx/slice/widget/SliceStyle;->mVerticalGridTextPadding:I

    :cond_4
    return v0
.end method

.method public getExtraBottomPadding()I
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->mGridContent:Landroidx/slice/widget/GridContent;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 2
    iget-boolean v0, v0, Landroidx/slice/widget/GridContent;->mAllImages:Z

    if-eqz v0, :cond_1

    .line 3
    iget v0, p0, Landroidx/slice/widget/GridRowView;->mRowIndex:I

    iget v2, p0, Landroidx/slice/widget/GridRowView;->mRowCount:I

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    if-eq v0, v2, :cond_0

    invoke-virtual {p0}, Landroidx/slice/widget/SliceChildView;->getMode()I

    move-result v0

    if-ne v0, v3, :cond_1

    .line 4
    :cond_0
    iget-object p0, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    if-eqz p0, :cond_1

    .line 5
    iget v1, p0, Landroidx/slice/widget/SliceStyle;->mGridBottomPadding:I

    :cond_1
    return v1
.end method

.method public getExtraTopPadding()I
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->mGridContent:Landroidx/slice/widget/GridContent;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    iget-boolean v0, v0, Landroidx/slice/widget/GridContent;->mAllImages:Z

    if-eqz v0, :cond_0

    .line 3
    iget v0, p0, Landroidx/slice/widget/GridRowView;->mRowIndex:I

    if-nez v0, :cond_0

    .line 4
    iget-object p0, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    if-eqz p0, :cond_0

    .line 5
    iget v1, p0, Landroidx/slice/widget/SliceStyle;->mGridTopPadding:I

    :cond_0
    return v1
.end method

.method public getMaxCells()I
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->mGridContent:Landroidx/slice/widget/GridContent;

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Landroidx/slice/widget/GridContent;->isValid()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 2
    :cond_0
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->mGridContent:Landroidx/slice/widget/GridContent;

    .line 3
    iget-object v0, v0, Landroidx/slice/widget/GridContent;->mGridContent:Ljava/util/ArrayList;

    .line 4
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_3

    .line 5
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->mGridContent:Landroidx/slice/widget/GridContent;

    .line 6
    iget v1, v0, Landroidx/slice/widget/GridContent;->mLargestImageMode:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_2

    const/4 v2, 0x4

    if-eq v1, v2, :cond_1

    .line 7
    iget v0, p0, Landroidx/slice/widget/GridRowView;->mSmallImageMinWidth:I

    goto :goto_0

    .line 8
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/slice/widget/GridContent;->getFirstImageSize(Landroid/content/Context;)Landroid/graphics/Point;

    move-result-object v0

    iget v0, v0, Landroid/graphics/Point;->x:I

    goto :goto_0

    .line 9
    :cond_2
    iget v0, p0, Landroidx/slice/widget/GridRowView;->mLargeImageHeight:I

    .line 10
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v1

    iget p0, p0, Landroidx/slice/widget/GridRowView;->mGutter:I

    add-int/2addr v0, p0

    div-int/2addr v1, v0

    :cond_3
    return v1

    :cond_4
    :goto_1
    const/4 p0, -0x1

    return p0
.end method

.method public final makeClickable(Landroid/view/View;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "layout",
            "isClickable"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    move-object v1, p0

    goto :goto_0

    :cond_0
    move-object v1, v0

    .line 1
    :goto_0
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v1, 0x101045c

    if-eqz p2, :cond_1

    .line 2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, v1}, Landroidx/slice/widget/SliceViewUtil;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 3
    :cond_1
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 4
    invoke-virtual {p1, p2}, Landroid/view/View;->setClickable(Z)V

    return-void
.end method

.method public final makeEntireGridClickable(Z)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "isClickable"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->mViewContainer:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    move-object v2, p0

    goto :goto_0

    :cond_0
    move-object v2, v1

    :goto_0
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 2
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->mViewContainer:Landroid/widget/LinearLayout;

    if-eqz p1, :cond_1

    move-object v2, p0

    goto :goto_1

    :cond_1
    move-object v2, v1

    :goto_1
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 3
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->mForeground:Landroid/view/View;

    if-eqz p1, :cond_2

    .line 4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x101030e

    .line 5
    invoke-static {v1, v2}, Landroidx/slice/widget/SliceViewUtil;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 6
    :cond_2
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 7
    iget-object p0, p0, Landroidx/slice/widget/GridRowView;->mViewContainer:Landroid/widget/LinearLayout;

    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setClickable(Z)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "view"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/util/Pair;

    .line 2
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Landroidx/slice/SliceItem;

    .line 3
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p1, Landroidx/slice/widget/EventInfo;

    if-eqz v0, :cond_0

    const-string v1, "action"

    const/4 v2, 0x0

    .line 4
    invoke-static {v0, v1, v2, v2}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 5
    :try_start_0
    invoke-virtual {v0, v2, v2}, Landroidx/slice/SliceItem;->fireActionInternal(Landroid/content/Context;Landroid/content/Intent;)Z

    .line 6
    iget-object p0, p0, Landroidx/slice/widget/SliceChildView;->mObserver:Landroidx/slice/widget/SliceView$OnSliceActionListener;

    if-eqz p0, :cond_0

    .line 7
    invoke-interface {p0, p1, v0}, Landroidx/slice/widget/SliceView$OnSliceActionListener;->onSliceAction(Landroidx/slice/widget/EventInfo;Landroidx/slice/SliceItem;)V
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "GridRowView"

    const-string v0, "PendingIntent for slice cannot be sent"

    .line 8
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "widthMeasureSpec",
            "heightMeasureSpec"
        }
    .end annotation

    .line 1
    iget-object p2, p0, Landroidx/slice/widget/GridRowView;->mGridContent:Landroidx/slice/widget/GridContent;

    iget-object v0, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    iget-object v1, p0, Landroidx/slice/widget/SliceChildView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    invoke-virtual {p2, v0, v1}, Landroidx/slice/widget/GridContent;->getHeight(Landroidx/slice/widget/SliceStyle;Landroidx/slice/widget/SliceViewPolicy;)I

    move-result p2

    iget v0, p0, Landroidx/slice/widget/SliceChildView;->mInsetTop:I

    add-int/2addr p2, v0

    iget v0, p0, Landroidx/slice/widget/SliceChildView;->mInsetBottom:I

    add-int/2addr p2, v0

    const/high16 v0, 0x40000000    # 2.0f

    .line 2
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 3
    iget-object v1, p0, Landroidx/slice/widget/GridRowView;->mViewContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput p2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 4
    invoke-super {p0, p1, v0}, Landroid/widget/FrameLayout;->onMeasure(II)V

    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "view",
            "event"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Landroidx/slice/widget/GridRowView;->mForeground:Landroid/view/View;

    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->mLoc:[I

    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 2
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result p1

    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->mLoc:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    int-to-float v0, v0

    sub-float/2addr p1, v0

    float-to-int p1, p1

    .line 3
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    iget-object v2, p0, Landroidx/slice/widget/GridRowView;->mLoc:[I

    const/4 v3, 0x1

    aget v2, v2, v3

    int-to-float v2, v2

    sub-float/2addr v0, v2

    float-to-int v0, v0

    .line 4
    iget-object v2, p0, Landroidx/slice/widget/GridRowView;->mForeground:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    int-to-float p1, p1

    int-to-float v0, v0

    invoke-virtual {v2, p1, v0}, Landroid/graphics/drawable/Drawable;->setHotspot(FF)V

    .line 5
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    if-nez p1, :cond_0

    .line 6
    iget-object p0, p0, Landroidx/slice/widget/GridRowView;->mForeground:Landroid/view/View;

    invoke-virtual {p0, v3}, Landroid/view/View;->setPressed(Z)V

    goto :goto_0

    :cond_0
    const/4 p2, 0x3

    if-eq p1, p2, :cond_1

    if-eq p1, v3, :cond_1

    const/4 p2, 0x2

    if-ne p1, p2, :cond_2

    .line 7
    :cond_1
    iget-object p0, p0, Landroidx/slice/widget/GridRowView;->mForeground:Landroid/view/View;

    invoke-virtual {p0, v1}, Landroid/view/View;->setPressed(Z)V

    :cond_2
    :goto_0
    return v1
.end method

.method public populateViews()V
    .locals 15

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->mGridContent:Landroidx/slice/widget/GridContent;

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Landroidx/slice/widget/GridContent;->isValid()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_7

    .line 2
    :cond_0
    invoke-virtual {p0}, Landroidx/slice/widget/GridRowView;->scheduleMaxCellsUpdate()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    .line 3
    :cond_1
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->mGridContent:Landroidx/slice/widget/GridContent;

    invoke-virtual {v0}, Landroidx/slice/widget/SliceContent;->getLayoutDir()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 4
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->mGridContent:Landroidx/slice/widget/GridContent;

    invoke-virtual {v0}, Landroidx/slice/widget/SliceContent;->getLayoutDir()I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setLayoutDirection(I)V

    .line 5
    :cond_2
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->mGridContent:Landroidx/slice/widget/GridContent;

    .line 6
    iget-object v0, v0, Landroidx/slice/widget/GridContent;->mPrimaryAction:Landroidx/slice/SliceItem;

    const/4 v2, 0x1

    if-eqz v0, :cond_3

    .line 7
    new-instance v0, Landroidx/slice/widget/EventInfo;

    invoke-virtual {p0}, Landroidx/slice/widget/SliceChildView;->getMode()I

    move-result v3

    const/4 v4, 0x3

    iget v5, p0, Landroidx/slice/widget/GridRowView;->mRowIndex:I

    invoke-direct {v0, v3, v4, v2, v5}, Landroidx/slice/widget/EventInfo;-><init>(IIII)V

    .line 8
    new-instance v3, Landroid/util/Pair;

    iget-object v4, p0, Landroidx/slice/widget/GridRowView;->mGridContent:Landroidx/slice/widget/GridContent;

    .line 9
    iget-object v4, v4, Landroidx/slice/widget/GridContent;->mPrimaryAction:Landroidx/slice/SliceItem;

    .line 10
    invoke-direct {v3, v4, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 11
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->mViewContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 12
    invoke-virtual {p0, v2}, Landroidx/slice/widget/GridRowView;->makeEntireGridClickable(Z)V

    .line 13
    :cond_3
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->mGridContent:Landroidx/slice/widget/GridContent;

    .line 14
    iget-object v0, v0, Landroidx/slice/widget/SliceContent;->mContentDescr:Landroidx/slice/SliceItem;

    if-eqz v0, :cond_4

    .line 15
    iget-object v0, v0, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/CharSequence;

    goto :goto_0

    :cond_4
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_5

    .line 16
    iget-object v3, p0, Landroidx/slice/widget/GridRowView;->mViewContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 17
    :cond_5
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->mGridContent:Landroidx/slice/widget/GridContent;

    .line 18
    iget-object v3, v0, Landroidx/slice/widget/GridContent;->mGridContent:Ljava/util/ArrayList;

    .line 19
    iget v0, v0, Landroidx/slice/widget/GridContent;->mLargestImageMode:I

    const/4 v4, 0x4

    const/4 v5, 0x2

    if-eq v0, v5, :cond_7

    if-ne v0, v4, :cond_6

    goto :goto_1

    .line 20
    :cond_6
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->mViewContainer:Landroid/widget/LinearLayout;

    const/16 v6, 0x10

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    goto :goto_2

    .line 21
    :cond_7
    :goto_1
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->mViewContainer:Landroid/widget/LinearLayout;

    const/16 v6, 0x30

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 22
    :goto_2
    iget v0, p0, Landroidx/slice/widget/GridRowView;->mMaxCells:I

    .line 23
    iget-object v6, p0, Landroidx/slice/widget/GridRowView;->mGridContent:Landroidx/slice/widget/GridContent;

    .line 24
    iget-object v6, v6, Landroidx/slice/widget/GridContent;->mSeeMoreItem:Landroidx/slice/SliceItem;

    const/4 v7, 0x0

    if-eqz v6, :cond_8

    move v6, v2

    goto :goto_3

    :cond_8
    move v6, v7

    :goto_3
    move v8, v7

    .line 25
    :goto_4
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v8, v9, :cond_e

    .line 26
    iget-object v9, p0, Landroidx/slice/widget/GridRowView;->mViewContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v9}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v9

    if-lt v9, v0, :cond_d

    .line 27
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    sub-int/2addr v3, v0

    if-eqz v6, :cond_e

    .line 28
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->mViewContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v6

    sub-int/2addr v6, v2

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 29
    iget-object v6, p0, Landroidx/slice/widget/GridRowView;->mViewContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v0}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 30
    iget-object v6, p0, Landroidx/slice/widget/GridRowView;->mGridContent:Landroidx/slice/widget/GridContent;

    .line 31
    iget-object v6, v6, Landroidx/slice/widget/GridContent;->mSeeMoreItem:Landroidx/slice/SliceItem;

    .line 32
    iget-object v8, p0, Landroidx/slice/widget/GridRowView;->mViewContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v8}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v8

    .line 33
    iget v9, p0, Landroidx/slice/widget/GridRowView;->mMaxCells:I

    .line 34
    iget-object v10, v6, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v11, "slice"

    .line 35
    invoke-virtual {v11, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_9

    .line 36
    iget-object v10, v6, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v11, "action"

    .line 37
    invoke-virtual {v11, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_a

    .line 38
    :cond_9
    invoke-virtual {v6}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object v10

    invoke-virtual {v10}, Landroidx/slice/Slice;->getItems()Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    if-lez v10, :cond_a

    .line 39
    new-instance v0, Landroidx/slice/widget/GridContent$CellContent;

    invoke-direct {v0, v6}, Landroidx/slice/widget/GridContent$CellContent;-><init>(Landroidx/slice/SliceItem;)V

    invoke-virtual {p0, v0, v8, v9}, Landroidx/slice/widget/GridRowView;->addCell(Landroidx/slice/widget/GridContent$CellContent;II)V

    goto/16 :goto_6

    .line 40
    :cond_a
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-static {v10}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v10

    .line 41
    iget-object v11, p0, Landroidx/slice/widget/GridRowView;->mGridContent:Landroidx/slice/widget/GridContent;

    .line 42
    iget-boolean v11, v11, Landroidx/slice/widget/GridContent;->mAllImages:Z

    const v12, 0x7f0a024e

    if-eqz v11, :cond_b

    const v11, 0x7f0d001d

    .line 43
    iget-object v13, p0, Landroidx/slice/widget/GridRowView;->mViewContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v10, v11, v13, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/FrameLayout;

    .line 44
    new-instance v11, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v11, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v10, v0, v7, v11}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 45
    invoke-virtual {v10, v12}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v11, 0x7f0a0193

    .line 46
    invoke-virtual {v10, v11}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v11

    .line 47
    new-instance v12, Landroidx/slice/CornerDrawable;

    .line 48
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v13

    const v14, 0x1010030

    .line 49
    invoke-static {v13, v14}, Landroidx/slice/widget/SliceViewUtil;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v13

    iget-object v14, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 50
    iget v14, v14, Landroidx/slice/widget/SliceStyle;->mImageCornerRadius:F

    .line 51
    invoke-direct {v12, v13, v14}, Landroidx/slice/CornerDrawable;-><init>(Landroid/graphics/drawable/Drawable;F)V

    .line 52
    invoke-virtual {v11, v12}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_5

    :cond_b
    const v0, 0x7f0d001c

    .line 53
    iget-object v11, p0, Landroidx/slice/widget/GridRowView;->mViewContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v10, v0, v11, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Landroid/widget/LinearLayout;

    .line 54
    invoke-virtual {v10, v12}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v11, 0x7f0a024d

    .line 55
    invoke-virtual {v10, v11}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    .line 56
    iget-object v12, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    if-eqz v12, :cond_c

    iget-object v13, p0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    if-eqz v13, :cond_c

    .line 57
    iget v12, v12, Landroidx/slice/widget/SliceStyle;->mGridTitleSize:I

    int-to-float v12, v12

    .line 58
    invoke-virtual {v11, v7, v12}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 59
    iget-object v12, p0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    invoke-virtual {v12}, Landroidx/slice/widget/RowStyle;->getTitleColor()I

    move-result v12

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 60
    :cond_c
    :goto_5
    iget-object v11, p0, Landroidx/slice/widget/GridRowView;->mViewContainer:Landroid/widget/LinearLayout;

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-direct {v12, v7, v1, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v11, v10, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 61
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v11, 0x7f11001c

    new-array v12, v2, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v12, v7

    invoke-virtual {v1, v11, v12}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    new-instance v0, Landroidx/slice/widget/EventInfo;

    invoke-virtual {p0}, Landroidx/slice/widget/SliceChildView;->getMode()I

    move-result v1

    iget v3, p0, Landroidx/slice/widget/GridRowView;->mRowIndex:I

    invoke-direct {v0, v1, v4, v2, v3}, Landroidx/slice/widget/EventInfo;-><init>(IIII)V

    .line 63
    invoke-virtual {v0, v5, v8, v9}, Landroidx/slice/widget/EventInfo;->setPosition(III)V

    .line 64
    new-instance v1, Landroid/util/Pair;

    invoke-direct {v1, v6, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 65
    invoke-virtual {v10, v1}, Landroid/view/ViewGroup;->setTag(Ljava/lang/Object;)V

    .line 66
    invoke-virtual {p0, v10, v2}, Landroidx/slice/widget/GridRowView;->makeClickable(Landroid/view/View;Z)V

    goto :goto_6

    .line 67
    :cond_d
    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroidx/slice/widget/GridContent$CellContent;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    invoke-static {v10, v0}, Ljava/lang/Math;->min(II)I

    move-result v10

    invoke-virtual {p0, v9, v8, v10}, Landroidx/slice/widget/GridRowView;->addCell(Landroidx/slice/widget/GridContent$CellContent;II)V

    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_4

    :cond_e
    :goto_6
    return-void

    .line 68
    :cond_f
    :goto_7
    invoke-virtual {p0}, Landroidx/slice/widget/GridRowView;->resetView()V

    return-void
.end method

.method public resetView()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Landroidx/slice/widget/GridRowView;->mMaxCellUpdateScheduled:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    iput-boolean v1, p0, Landroidx/slice/widget/GridRowView;->mMaxCellUpdateScheduled:Z

    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v2, p0, Landroidx/slice/widget/GridRowView;->mMaxCellsUpdater:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    invoke-virtual {v0, v2}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 4
    :cond_0
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->mViewContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    const/4 v0, 0x2

    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setLayoutDirection(I)V

    .line 6
    invoke-virtual {p0, v1}, Landroidx/slice/widget/GridRowView;->makeEntireGridClickable(Z)V

    return-void
.end method

.method public scheduleMaxCellsUpdate()Z
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->mGridContent:Landroidx/slice/widget/GridContent;

    const/4 v1, 0x1

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroidx/slice/widget/GridContent;->isValid()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v0

    if-nez v0, :cond_1

    .line 3
    iput-boolean v1, p0, Landroidx/slice/widget/GridRowView;->mMaxCellUpdateScheduled:Z

    .line 4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object p0, p0, Landroidx/slice/widget/GridRowView;->mMaxCellsUpdater:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    return v1

    .line 5
    :cond_1
    invoke-virtual {p0}, Landroidx/slice/widget/GridRowView;->getMaxCells()I

    move-result v0

    iput v0, p0, Landroidx/slice/widget/GridRowView;->mMaxCells:I

    const/4 p0, 0x0

    return p0

    :cond_2
    :goto_0
    return v1
.end method

.method public setInsets(IIII)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "l",
            "t",
            "r",
            "b"
        }
    .end annotation

    .line 1
    iput p1, p0, Landroidx/slice/widget/SliceChildView;->mInsetStart:I

    .line 2
    iput p2, p0, Landroidx/slice/widget/SliceChildView;->mInsetTop:I

    .line 3
    iput p3, p0, Landroidx/slice/widget/SliceChildView;->mInsetEnd:I

    .line 4
    iput p4, p0, Landroidx/slice/widget/SliceChildView;->mInsetBottom:I

    .line 5
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->mViewContainer:Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Landroidx/slice/widget/GridRowView;->getExtraTopPadding()I

    move-result v1

    add-int/2addr v1, p2

    invoke-virtual {p0}, Landroidx/slice/widget/GridRowView;->getExtraBottomPadding()I

    move-result p0

    add-int/2addr p0, p4

    invoke-virtual {v0, p1, v1, p3, p0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    return-void
.end method

.method public setSliceItem(Landroidx/slice/widget/SliceContent;ZIILandroidx/slice/widget/SliceView$OnSliceActionListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "slice",
            "isHeader",
            "rowIndex",
            "rowCount",
            "observer"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroidx/slice/widget/GridRowView;->resetView()V

    .line 2
    iput-object p5, p0, Landroidx/slice/widget/SliceChildView;->mObserver:Landroidx/slice/widget/SliceView$OnSliceActionListener;

    .line 3
    iput p3, p0, Landroidx/slice/widget/GridRowView;->mRowIndex:I

    .line 4
    iput p4, p0, Landroidx/slice/widget/GridRowView;->mRowCount:I

    .line 5
    check-cast p1, Landroidx/slice/widget/GridContent;

    iput-object p1, p0, Landroidx/slice/widget/GridRowView;->mGridContent:Landroidx/slice/widget/GridContent;

    .line 6
    invoke-virtual {p0}, Landroidx/slice/widget/GridRowView;->scheduleMaxCellsUpdate()Z

    move-result p1

    if-nez p1, :cond_0

    .line 7
    invoke-virtual {p0}, Landroidx/slice/widget/GridRowView;->populateViews()V

    .line 8
    :cond_0
    iget-object p1, p0, Landroidx/slice/widget/GridRowView;->mViewContainer:Landroid/widget/LinearLayout;

    iget p2, p0, Landroidx/slice/widget/SliceChildView;->mInsetStart:I

    iget p3, p0, Landroidx/slice/widget/SliceChildView;->mInsetTop:I

    invoke-virtual {p0}, Landroidx/slice/widget/GridRowView;->getExtraTopPadding()I

    move-result p4

    add-int/2addr p4, p3

    iget p3, p0, Landroidx/slice/widget/SliceChildView;->mInsetEnd:I

    iget p5, p0, Landroidx/slice/widget/SliceChildView;->mInsetBottom:I

    .line 9
    invoke-virtual {p0}, Landroidx/slice/widget/GridRowView;->getExtraBottomPadding()I

    move-result p0

    add-int/2addr p0, p5

    .line 10
    invoke-virtual {p1, p2, p4, p3, p0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    return-void
.end method

.method public setTint(I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "tintColor"
        }
    .end annotation

    .line 1
    iput p1, p0, Landroidx/slice/widget/SliceChildView;->mTintColor:I

    .line 2
    iget-object p1, p0, Landroidx/slice/widget/GridRowView;->mGridContent:Landroidx/slice/widget/GridContent;

    if-eqz p1, :cond_0

    .line 3
    invoke-virtual {p0}, Landroidx/slice/widget/GridRowView;->resetView()V

    .line 4
    invoke-virtual {p0}, Landroidx/slice/widget/GridRowView;->populateViews()V

    :cond_0
    return-void
.end method
