.class public Landroidx/constraintlayout/widget/ConstraintLayout;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;,
        Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;
    }
.end annotation


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public mChildrenByIds:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public mConstraintHelpers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/widget/ConstraintHelper;",
            ">;"
        }
    .end annotation
.end field

.field public mConstraintSet:Landroidx/constraintlayout/widget/ConstraintSet;

.field public mConstraintSetId:I

.field public mDesignIds:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public mDirtyHierarchy:Z

.field public mLayoutWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

.field public mMaxHeight:I

.field public mMaxWidth:I

.field public mMeasurer:Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;

.field public mMinHeight:I

.field public mMinWidth:I

.field public mOnMeasureHeightMeasureSpec:I

.field public mOnMeasureWidthMeasureSpec:I

.field public mOptimizationLevel:I

.field public mTempMapIdToWidget:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroidx/constraintlayout/solver/widgets/ConstraintWidget;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 2
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mChildrenByIds:Landroid/util/SparseArray;

    .line 3
    new-instance p1, Ljava/util/ArrayList;

    const/4 v0, 0x4

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    .line 4
    new-instance p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-direct {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    const/4 p1, 0x0

    .line 5
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinWidth:I

    .line 6
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinHeight:I

    const v0, 0x7fffffff

    .line 7
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxWidth:I

    .line 8
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxHeight:I

    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDirtyHierarchy:Z

    const/4 v0, 0x7

    .line 10
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOptimizationLevel:I

    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSet:Landroidx/constraintlayout/widget/ConstraintSet;

    const/4 v1, -0x1

    .line 12
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSetId:I

    .line 13
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDesignIds:Ljava/util/HashMap;

    .line 14
    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    iput-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mTempMapIdToWidget:Landroid/util/SparseArray;

    .line 15
    new-instance v1, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;

    invoke-direct {v1, p0, p0}, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroidx/constraintlayout/widget/ConstraintLayout;)V

    iput-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMeasurer:Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;

    .line 16
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOnMeasureWidthMeasureSpec:I

    .line 17
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOnMeasureHeightMeasureSpec:I

    .line 18
    invoke-virtual {p0, v0, p1, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->init(Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 19
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mChildrenByIds:Landroid/util/SparseArray;

    .line 21
    new-instance p1, Ljava/util/ArrayList;

    const/4 v0, 0x4

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    .line 22
    new-instance p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-direct {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    const/4 p1, 0x0

    .line 23
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinWidth:I

    .line 24
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinHeight:I

    const v0, 0x7fffffff

    .line 25
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxWidth:I

    .line 26
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxHeight:I

    const/4 v0, 0x1

    .line 27
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDirtyHierarchy:Z

    const/4 v0, 0x7

    .line 28
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOptimizationLevel:I

    const/4 v0, 0x0

    .line 29
    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSet:Landroidx/constraintlayout/widget/ConstraintSet;

    const/4 v0, -0x1

    .line 30
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSetId:I

    .line 31
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDesignIds:Ljava/util/HashMap;

    .line 32
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mTempMapIdToWidget:Landroid/util/SparseArray;

    .line 33
    new-instance v0, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;

    invoke-direct {v0, p0, p0}, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroidx/constraintlayout/widget/ConstraintLayout;)V

    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMeasurer:Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;

    .line 34
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOnMeasureWidthMeasureSpec:I

    .line 35
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOnMeasureHeightMeasureSpec:I

    .line 36
    invoke-virtual {p0, p2, p1, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->init(Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 37
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 38
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mChildrenByIds:Landroid/util/SparseArray;

    .line 39
    new-instance p1, Ljava/util/ArrayList;

    const/4 v0, 0x4

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    .line 40
    new-instance p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-direct {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    const/4 p1, 0x0

    .line 41
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinWidth:I

    .line 42
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinHeight:I

    const v0, 0x7fffffff

    .line 43
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxWidth:I

    .line 44
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxHeight:I

    const/4 v0, 0x1

    .line 45
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDirtyHierarchy:Z

    const/4 v0, 0x7

    .line 46
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOptimizationLevel:I

    const/4 v0, 0x0

    .line 47
    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSet:Landroidx/constraintlayout/widget/ConstraintSet;

    const/4 v0, -0x1

    .line 48
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSetId:I

    .line 49
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDesignIds:Ljava/util/HashMap;

    .line 50
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mTempMapIdToWidget:Landroid/util/SparseArray;

    .line 51
    new-instance v0, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;

    invoke-direct {v0, p0, p0}, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroidx/constraintlayout/widget/ConstraintLayout;)V

    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMeasurer:Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;

    .line 52
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOnMeasureWidthMeasureSpec:I

    .line 53
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOnMeasureHeightMeasureSpec:I

    .line 54
    invoke-virtual {p0, p2, p3, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->init(Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 55
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 56
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mChildrenByIds:Landroid/util/SparseArray;

    .line 57
    new-instance p1, Ljava/util/ArrayList;

    const/4 v0, 0x4

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    .line 58
    new-instance p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-direct {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    const/4 p1, 0x0

    .line 59
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinWidth:I

    .line 60
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinHeight:I

    const v0, 0x7fffffff

    .line 61
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxWidth:I

    .line 62
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxHeight:I

    const/4 v0, 0x1

    .line 63
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDirtyHierarchy:Z

    const/4 v0, 0x7

    .line 64
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOptimizationLevel:I

    const/4 v0, 0x0

    .line 65
    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSet:Landroidx/constraintlayout/widget/ConstraintSet;

    const/4 v0, -0x1

    .line 66
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSetId:I

    .line 67
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDesignIds:Ljava/util/HashMap;

    .line 68
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mTempMapIdToWidget:Landroid/util/SparseArray;

    .line 69
    new-instance v0, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;

    invoke-direct {v0, p0, p0}, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroidx/constraintlayout/widget/ConstraintLayout;)V

    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMeasurer:Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;

    .line 70
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOnMeasureWidthMeasureSpec:I

    .line 71
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOnMeasureHeightMeasureSpec:I

    .line 72
    invoke-virtual {p0, p2, p3, p4}, Landroidx/constraintlayout/widget/ConstraintLayout;->init(Landroid/util/AttributeSet;II)V

    return-void
.end method


# virtual methods
.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    return p0
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 20

    move-object/from16 v0, p0

    .line 1
    iget-object v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 2
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_0

    .line 3
    iget-object v4, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/constraintlayout/widget/ConstraintHelper;

    .line 4
    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 5
    :cond_0
    invoke-super/range {p0 .. p1}, Landroid/view/ViewGroup;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 6
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->isInEditMode()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 7
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    .line 8
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v3

    int-to-float v3, v3

    .line 9
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x44870000    # 1080.0f

    const/high16 v6, 0x44f00000    # 1920.0f

    move v7, v2

    :goto_1
    if-ge v7, v1, :cond_3

    .line 10
    invoke-virtual {v0, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 11
    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    move-result v9

    const/16 v10, 0x8

    if-ne v9, v10, :cond_1

    goto/16 :goto_2

    .line 12
    :cond_1
    invoke-virtual {v8}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_2

    .line 13
    instance-of v9, v8, Ljava/lang/String;

    if-eqz v9, :cond_2

    .line 14
    check-cast v8, Ljava/lang/String;

    const-string v9, ","

    .line 15
    invoke-virtual {v8, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 16
    array-length v9, v8

    const/4 v10, 0x4

    if-ne v9, v10, :cond_2

    .line 17
    aget-object v9, v8, v2

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    const/4 v10, 0x1

    .line 18
    aget-object v10, v8, v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    const/4 v11, 0x2

    .line 19
    aget-object v11, v8, v11

    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    const/4 v12, 0x3

    .line 20
    aget-object v8, v8, v12

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    int-to-float v9, v9

    div-float/2addr v9, v5

    mul-float/2addr v9, v3

    float-to-int v9, v9

    int-to-float v10, v10

    div-float/2addr v10, v6

    mul-float/2addr v10, v4

    float-to-int v10, v10

    int-to-float v11, v11

    div-float/2addr v11, v5

    mul-float/2addr v11, v3

    float-to-int v11, v11

    int-to-float v8, v8

    div-float/2addr v8, v6

    mul-float/2addr v8, v4

    float-to-int v8, v8

    .line 21
    new-instance v15, Landroid/graphics/Paint;

    invoke-direct {v15}, Landroid/graphics/Paint;-><init>()V

    const/high16 v12, -0x10000

    .line 22
    invoke-virtual {v15, v12}, Landroid/graphics/Paint;->setColor(I)V

    int-to-float v14, v9

    int-to-float v13, v10

    add-int/2addr v9, v11

    int-to-float v9, v9

    move-object/from16 v12, p1

    move v11, v13

    move v13, v14

    move/from16 v18, v14

    move v14, v11

    move-object/from16 v19, v15

    move v15, v9

    move/from16 v16, v11

    move-object/from16 v17, v19

    .line 23
    invoke-virtual/range {v12 .. v17}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    add-int/2addr v10, v8

    int-to-float v8, v10

    move v13, v9

    move/from16 v16, v8

    .line 24
    invoke-virtual/range {v12 .. v17}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move v14, v8

    move/from16 v15, v18

    .line 25
    invoke-virtual/range {v12 .. v17}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move/from16 v13, v18

    move/from16 v16, v11

    .line 26
    invoke-virtual/range {v12 .. v17}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const v10, -0xff0100

    move-object/from16 v15, v19

    .line 27
    invoke-virtual {v15, v10}, Landroid/graphics/Paint;->setColor(I)V

    move v14, v11

    move-object v10, v15

    move v15, v9

    move/from16 v16, v8

    move-object/from16 v17, v10

    .line 28
    invoke-virtual/range {v12 .. v17}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move v14, v8

    move/from16 v16, v11

    .line 29
    invoke-virtual/range {v12 .. v17}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    :cond_2
    :goto_2
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_1

    :cond_3
    return-void
.end method

.method public forceLayout()V
    .locals 1

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDirtyHierarchy:Z

    .line 2
    invoke-super {p0}, Landroid/view/View;->forceLayout()V

    return-void
.end method

.method public bridge synthetic generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->generateDefaultLayoutParams()Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method public generateDefaultLayoutParams()Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    .locals 1

    .line 2
    new-instance p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    const/4 v0, -0x2

    invoke-direct {p0, v0, v0}, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;-><init>(II)V

    return-object p0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .line 1
    new-instance v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 2
    new-instance p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object p0
.end method

.method public getDesignInformation(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 0

    if-nez p1, :cond_0

    .line 1
    instance-of p1, p2, Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 2
    check-cast p2, Ljava/lang/String;

    .line 3
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDesignIds:Ljava/util/HashMap;

    if-eqz p1, :cond_0

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 4
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDesignIds:Ljava/util/HashMap;

    invoke-virtual {p0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public final getPaddingWidth()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v1

    add-int/2addr v1, v0

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingStart()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingEnd()I

    move-result p0

    add-int/2addr p0, v0

    if-lez p0, :cond_0

    move v1, p0

    :cond_0
    return v1
.end method

.method public getViewById(I)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mChildrenByIds:Landroid/util/SparseArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    return-object p0
.end method

.method public final getViewWidget(Landroid/view/View;)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .locals 0

    if-ne p1, p0, :cond_0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    return-object p0

    :cond_0
    if-nez p1, :cond_1

    const/4 p0, 0x0

    goto :goto_0

    .line 2
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->widget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    :goto_0
    return-object p0
.end method

.method public final init(Landroid/util/AttributeSet;II)V
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    .line 2
    iput-object p0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCompanionWidget:Ljava/lang/Object;

    .line 3
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMeasurer:Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;

    .line 4
    iput-object v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mMeasurer:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measurer;

    .line 5
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mDependencyGraph:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;

    .line 6
    iput-object v1, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->mMeasurer:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measurer;

    .line 7
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mChildrenByIds:Landroid/util/SparseArray;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getId()I

    move-result v1

    invoke-virtual {v0, v1, p0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSet:Landroidx/constraintlayout/widget/ConstraintSet;

    if-eqz p1, :cond_8

    .line 9
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Landroidx/constraintlayout/widget/R$styleable;->ConstraintLayout_Layout:[I

    invoke-virtual {v1, p1, v2, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 10
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result p2

    const/4 p3, 0x0

    move v1, p3

    :goto_0
    if-ge v1, p2, :cond_7

    .line 11
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v2

    const/16 v3, 0x9

    if-ne v2, v3, :cond_0

    .line 12
    iget v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinWidth:I

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinWidth:I

    goto :goto_2

    :cond_0
    const/16 v3, 0xa

    if-ne v2, v3, :cond_1

    .line 13
    iget v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinHeight:I

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinHeight:I

    goto :goto_2

    :cond_1
    const/4 v3, 0x7

    if-ne v2, v3, :cond_2

    .line 14
    iget v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxWidth:I

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxWidth:I

    goto :goto_2

    :cond_2
    const/16 v3, 0x8

    if-ne v2, v3, :cond_3

    .line 15
    iget v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxHeight:I

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxHeight:I

    goto :goto_2

    :cond_3
    const/16 v3, 0x59

    if-ne v2, v3, :cond_4

    .line 16
    iget v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOptimizationLevel:I

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOptimizationLevel:I

    goto :goto_2

    :cond_4
    const/16 v3, 0x26

    if-ne v2, v3, :cond_5

    .line 17
    invoke-virtual {p1, v2, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    if-eqz v2, :cond_6

    .line 18
    :try_start_0
    new-instance v3, Landroidx/constraintlayout/widget/ConstraintLayoutStates;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4, p0, v2}, Landroidx/constraintlayout/widget/ConstraintLayoutStates;-><init>(Landroid/content/Context;Landroidx/constraintlayout/widget/ConstraintLayout;I)V
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_2

    :cond_5
    const/16 v3, 0x12

    if-ne v2, v3, :cond_6

    .line 19
    invoke-virtual {p1, v2, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    .line 20
    :try_start_1
    new-instance v3, Landroidx/constraintlayout/widget/ConstraintSet;

    invoke-direct {v3}, Landroidx/constraintlayout/widget/ConstraintSet;-><init>()V

    iput-object v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSet:Landroidx/constraintlayout/widget/ConstraintSet;

    .line 21
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v4, v2}, Landroidx/constraintlayout/widget/ConstraintSet;->load(Landroid/content/Context;I)V
    :try_end_1
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 22
    :catch_0
    iput-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSet:Landroidx/constraintlayout/widget/ConstraintSet;

    .line 23
    :goto_1
    iput v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSetId:I

    :catch_1
    :cond_6
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 24
    :cond_7
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 25
    :cond_8
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOptimizationLevel:I

    .line 26
    iput p0, p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mOptimizationLevel:I

    return-void
.end method

.method public isRtl()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v1, 0x400000

    and-int/2addr v0, v1

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    if-eqz v0, :cond_1

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getLayoutDirection()I

    move-result p0

    if-ne v2, p0, :cond_1

    move v1, v2

    :cond_1
    return v1
.end method

.method public onLayout(ZIIII)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p1

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isInEditMode()Z

    move-result p2

    const/4 p3, 0x0

    move p4, p3

    :goto_0
    if-ge p4, p1, :cond_3

    .line 3
    invoke-virtual {p0, p4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p5

    .line 4
    invoke-virtual {p5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    .line 5
    iget-object v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->widget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 6
    invoke-virtual {p5}, Landroid/view/View;->getVisibility()I

    move-result v2

    const/16 v3, 0x8

    if-ne v2, v3, :cond_0

    iget-boolean v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->isGuideline:Z

    if-nez v2, :cond_0

    iget-boolean v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->isHelper:Z

    if-nez v2, :cond_0

    if-nez p2, :cond_0

    goto :goto_1

    .line 7
    :cond_0
    iget-boolean v0, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->isInPlaceholder:Z

    if-eqz v0, :cond_1

    goto :goto_1

    .line 8
    :cond_1
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getX()I

    move-result v0

    .line 9
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getY()I

    move-result v2

    .line 10
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v3

    add-int/2addr v3, v0

    .line 11
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v1

    add-int/2addr v1, v2

    .line 12
    invoke-virtual {p5, v0, v2, v3, v1}, Landroid/view/View;->layout(IIII)V

    .line 13
    instance-of v4, p5, Landroidx/constraintlayout/widget/Placeholder;

    if-eqz v4, :cond_2

    .line 14
    check-cast p5, Landroidx/constraintlayout/widget/Placeholder;

    .line 15
    iget-object p5, p5, Landroidx/constraintlayout/widget/Placeholder;->mContent:Landroid/view/View;

    if-eqz p5, :cond_2

    .line 16
    invoke-virtual {p5, p3}, Landroid/view/View;->setVisibility(I)V

    .line 17
    invoke-virtual {p5, v0, v2, v3, v1}, Landroid/view/View;->layout(IIII)V

    :cond_2
    :goto_1
    add-int/lit8 p4, p4, 0x1

    goto :goto_0

    .line 18
    :cond_3
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_4

    :goto_2
    if-ge p3, p1, :cond_4

    .line 19
    iget-object p2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroidx/constraintlayout/widget/ConstraintHelper;

    .line 20
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 p3, p3, 0x1

    goto :goto_2

    :cond_4
    return-void
.end method

.method public onMeasure(II)V
    .locals 26

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    .line 1
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOnMeasureWidthMeasureSpec:I

    .line 2
    iput v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOnMeasureHeightMeasureSpec:I

    .line 3
    iget-object v3, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->isRtl()Z

    move-result v4

    .line 4
    iput-boolean v4, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mIsRtl:Z

    .line 5
    iget-boolean v3, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDirtyHierarchy:Z

    const/4 v4, 0x0

    const/4 v5, 0x4

    const/4 v6, 0x3

    if-eqz v3, :cond_3

    .line 6
    iput-boolean v4, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDirtyHierarchy:Z

    .line 7
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->updateHierarchy()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 8
    iget-object v3, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    .line 9
    iget-object v7, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mBasicMeasureSolver:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;

    .line 10
    iget-object v8, v7, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->clear()V

    .line 11
    iget-object v8, v3, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    move v9, v4

    :goto_0
    if-ge v9, v8, :cond_2

    .line 12
    iget-object v10, v3, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v10, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 13
    invoke-virtual {v10}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHorizontalDimensionBehaviour$enumunboxing$()I

    move-result v11

    if-eq v11, v6, :cond_0

    .line 14
    invoke-virtual {v10}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHorizontalDimensionBehaviour$enumunboxing$()I

    move-result v11

    if-eq v11, v5, :cond_0

    .line 15
    invoke-virtual {v10}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getVerticalDimensionBehaviour$enumunboxing$()I

    move-result v11

    if-eq v11, v6, :cond_0

    .line 16
    invoke-virtual {v10}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getVerticalDimensionBehaviour$enumunboxing$()I

    move-result v11

    if-ne v11, v5, :cond_1

    .line 17
    :cond_0
    iget-object v11, v7, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 18
    :cond_2
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->invalidateGraph()V

    .line 19
    :cond_3
    iget-object v3, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget v7, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOptimizationLevel:I

    .line 20
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v8

    .line 21
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v9

    .line 22
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v10

    .line 23
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v11

    .line 24
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v12

    .line 25
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v13

    add-int/2addr v13, v12

    .line 26
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->getPaddingWidth()I

    move-result v14

    .line 27
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingStart()I

    move-result v15

    .line 28
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingEnd()I

    move-result v16

    if-gtz v15, :cond_5

    if-lez v16, :cond_4

    goto :goto_1

    .line 29
    :cond_4
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v15

    goto :goto_2

    .line 30
    :cond_5
    :goto_1
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->isRtl()Z

    move-result v17

    if-eqz v17, :cond_6

    move/from16 v15, v16

    :cond_6
    :goto_2
    sub-int/2addr v9, v14

    sub-int/2addr v11, v13

    .line 31
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v13

    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v14

    add-int/2addr v14, v13

    .line 32
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->getPaddingWidth()I

    move-result v13

    .line 33
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v16

    const/high16 v5, -0x80000000

    const/high16 v6, 0x40000000    # 2.0f

    if-eq v8, v5, :cond_a

    if-eqz v8, :cond_8

    if-eq v8, v6, :cond_7

    const/4 v4, 0x1

    const/4 v6, 0x0

    goto :goto_4

    .line 34
    :cond_7
    iget v4, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxWidth:I

    sub-int/2addr v4, v13

    invoke-static {v4, v9}, Ljava/lang/Math;->min(II)I

    move-result v4

    const/4 v6, 0x1

    goto :goto_5

    :cond_8
    if-nez v16, :cond_9

    .line 35
    iget v4, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinWidth:I

    const/4 v6, 0x0

    invoke-static {v6, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    goto :goto_3

    :cond_9
    const/4 v6, 0x0

    move v4, v6

    goto :goto_3

    :cond_a
    const/4 v6, 0x0

    if-nez v16, :cond_b

    .line 36
    iget v4, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinWidth:I

    invoke-static {v6, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    goto :goto_3

    :cond_b
    move v4, v9

    :goto_3
    move v6, v4

    const/4 v4, 0x2

    :goto_4
    move/from16 v25, v6

    move v6, v4

    move/from16 v4, v25

    :goto_5
    if-eq v10, v5, :cond_f

    if-eqz v10, :cond_d

    const/high16 v5, 0x40000000    # 2.0f

    if-eq v10, v5, :cond_c

    const/4 v2, 0x0

    goto :goto_6

    .line 37
    :cond_c
    iget v5, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxHeight:I

    sub-int/2addr v5, v14

    invoke-static {v5, v11}, Ljava/lang/Math;->min(II)I

    move-result v5

    move v2, v5

    :goto_6
    const/4 v5, 0x1

    goto :goto_9

    :cond_d
    if-nez v16, :cond_e

    .line 38
    iget v5, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinHeight:I

    const/4 v2, 0x0

    invoke-static {v2, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    goto :goto_7

    :cond_e
    const/4 v2, 0x0

    goto :goto_8

    :cond_f
    const/4 v2, 0x0

    if-nez v16, :cond_10

    .line 39
    iget v5, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinHeight:I

    invoke-static {v2, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    goto :goto_7

    :cond_10
    move v5, v11

    :goto_7
    move v2, v5

    :goto_8
    const/4 v5, 0x2

    .line 40
    :goto_9
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v1

    if-ne v4, v1, :cond_12

    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v1

    if-eq v2, v1, :cond_11

    goto :goto_a

    :cond_11
    move/from16 v16, v11

    const/4 v1, 0x0

    const/4 v11, 0x1

    goto :goto_b

    .line 41
    :cond_12
    :goto_a
    iget-object v1, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mDependencyGraph:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;

    move/from16 v16, v11

    const/4 v11, 0x1

    .line 42
    iput-boolean v11, v1, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->mNeedRedoMeasures:Z

    const/4 v1, 0x0

    .line 43
    :goto_b
    iput v1, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mX:I

    .line 44
    iput v1, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mY:I

    .line 45
    iget v11, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxWidth:I

    sub-int/2addr v11, v13

    move/from16 v22, v9

    .line 46
    iget-object v9, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMaxDimension:[I

    aput v11, v9, v1

    .line 47
    iget v11, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxHeight:I

    sub-int/2addr v11, v14

    const/16 v20, 0x1

    .line 48
    aput v11, v9, v20

    .line 49
    invoke-virtual {v3, v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setMinWidth(I)V

    .line 50
    invoke-virtual {v3, v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setMinHeight(I)V

    .line 51
    iget-object v9, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aput v6, v9, v1

    .line 52
    invoke-virtual {v3, v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setWidth(I)V

    .line 53
    iget-object v1, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aput v5, v1, v20

    .line 54
    invoke-virtual {v3, v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setHeight(I)V

    .line 55
    iget v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinWidth:I

    sub-int/2addr v1, v13

    invoke-virtual {v3, v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setMinWidth(I)V

    .line 56
    iget v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMinHeight:I

    sub-int/2addr v1, v14

    invoke-virtual {v3, v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setMinHeight(I)V

    .line 57
    iput v15, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mPaddingLeft:I

    .line 58
    iput v12, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mPaddingTop:I

    .line 59
    iget-object v1, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mBasicMeasureSolver:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    sget-object v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->BOTTOM:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    sget-object v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->RIGHT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    iget-object v5, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mMeasurer:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measurer;

    .line 61
    iget-object v6, v3, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 62
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v9

    .line 63
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v11

    and-int/lit16 v12, v7, 0x80

    const/16 v13, 0x80

    if-ne v12, v13, :cond_13

    const/4 v12, 0x1

    goto :goto_c

    :cond_13
    const/4 v12, 0x0

    :goto_c
    if-nez v12, :cond_16

    const/16 v13, 0x40

    and-int/2addr v7, v13

    if-ne v7, v13, :cond_14

    const/4 v7, 0x1

    goto :goto_d

    :cond_14
    const/4 v7, 0x0

    :goto_d
    if-eqz v7, :cond_15

    goto :goto_e

    :cond_15
    const/4 v7, 0x0

    goto :goto_f

    :cond_16
    :goto_e
    const/4 v7, 0x1

    :goto_f
    if-eqz v7, :cond_1f

    const/4 v13, 0x0

    :goto_10
    if-ge v13, v6, :cond_1f

    .line 64
    iget-object v14, v3, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v14, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 65
    invoke-virtual {v14}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHorizontalDimensionBehaviour$enumunboxing$()I

    move-result v15

    move/from16 v23, v7

    const/4 v7, 0x3

    if-ne v15, v7, :cond_17

    const/4 v15, 0x1

    goto :goto_11

    :cond_17
    const/4 v15, 0x0

    .line 66
    :goto_11
    invoke-virtual {v14}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getVerticalDimensionBehaviour$enumunboxing$()I

    move-result v0

    if-ne v0, v7, :cond_18

    const/4 v0, 0x1

    goto :goto_12

    :cond_18
    const/4 v0, 0x0

    :goto_12
    if-eqz v15, :cond_19

    if-eqz v0, :cond_19

    .line 67
    iget v0, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mDimensionRatio:F

    const/4 v7, 0x0

    cmpl-float v0, v0, v7

    if-lez v0, :cond_19

    const/4 v0, 0x1

    goto :goto_13

    :cond_19
    const/4 v0, 0x0

    .line 68
    :goto_13
    invoke-virtual {v14}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->isInHorizontalChain()Z

    move-result v7

    if-eqz v7, :cond_1a

    if-eqz v0, :cond_1a

    goto :goto_14

    .line 69
    :cond_1a
    invoke-virtual {v14}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->isInVerticalChain()Z

    move-result v7

    if-eqz v7, :cond_1b

    if-eqz v0, :cond_1b

    goto :goto_14

    .line 70
    :cond_1b
    instance-of v0, v14, Landroidx/constraintlayout/solver/widgets/VirtualLayout;

    if-eqz v0, :cond_1c

    goto :goto_14

    .line 71
    :cond_1c
    invoke-virtual {v14}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->isInHorizontalChain()Z

    move-result v0

    if-nez v0, :cond_1e

    .line 72
    invoke-virtual {v14}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->isInVerticalChain()Z

    move-result v0

    if-eqz v0, :cond_1d

    goto :goto_14

    :cond_1d
    add-int/lit8 v13, v13, 0x1

    move-object/from16 v0, p0

    move/from16 v7, v23

    goto :goto_10

    :cond_1e
    :goto_14
    const/high16 v0, 0x40000000    # 2.0f

    const/16 v23, 0x0

    goto :goto_15

    :cond_1f
    move/from16 v23, v7

    const/high16 v0, 0x40000000    # 2.0f

    :goto_15
    if-ne v8, v0, :cond_20

    if-eq v10, v0, :cond_21

    :cond_20
    if-eqz v12, :cond_22

    :cond_21
    const/4 v0, 0x1

    goto :goto_16

    :cond_22
    const/4 v0, 0x0

    :goto_16
    and-int v0, v23, v0

    if-eqz v0, :cond_41

    .line 73
    iget-object v0, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMaxDimension:[I

    const/4 v7, 0x0

    aget v0, v0, v7

    move/from16 v7, v22

    .line 74
    invoke-static {v0, v7}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 75
    iget-object v7, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMaxDimension:[I

    const/4 v13, 0x1

    aget v7, v7, v13

    move/from16 v13, v16

    .line 76
    invoke-static {v7, v13}, Ljava/lang/Math;->min(II)I

    move-result v7

    const/high16 v13, 0x40000000    # 2.0f

    if-ne v8, v13, :cond_23

    .line 77
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v14

    if-eq v14, v0, :cond_23

    .line 78
    invoke-virtual {v3, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setWidth(I)V

    .line 79
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->invalidateGraph()V

    :cond_23
    if-ne v10, v13, :cond_24

    .line 80
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v0

    if-eq v0, v7, :cond_24

    .line 81
    invoke-virtual {v3, v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setHeight(I)V

    .line 82
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->invalidateGraph()V

    :cond_24
    if-ne v8, v13, :cond_3a

    if-ne v10, v13, :cond_3a

    .line 83
    iget-object v0, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mDependencyGraph:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;

    const/4 v7, 0x1

    and-int/2addr v12, v7

    .line 84
    iget-boolean v7, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->mNeedBuildGraph:Z

    if-nez v7, :cond_26

    iget-boolean v7, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->mNeedRedoMeasures:Z

    if-eqz v7, :cond_25

    goto :goto_17

    :cond_25
    const/4 v14, 0x0

    goto :goto_19

    .line 85
    :cond_26
    :goto_17
    iget-object v7, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget-object v7, v7, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_18
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_27

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    const/4 v14, 0x0

    .line 86
    iput-boolean v14, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->measured:Z

    .line 87
    iget-object v15, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;->reset()V

    .line 88
    iget-object v13, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    invoke-virtual {v13}, Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;->reset()V

    goto :goto_18

    :cond_27
    const/4 v14, 0x0

    .line 89
    iget-object v7, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iput-boolean v14, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->measured:Z

    .line 90
    iget-object v7, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;->reset()V

    .line 91
    iget-object v7, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget-object v7, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;->reset()V

    .line 92
    iput-boolean v14, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->mNeedRedoMeasures:Z

    .line 93
    :goto_19
    iget-object v7, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->mContainer:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-virtual {v0, v7}, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->basicMeasureWidgets(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;)Z

    .line 94
    iget-object v7, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    .line 95
    iput v14, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mX:I

    .line 96
    iput v14, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mY:I

    .line 97
    invoke-virtual {v7, v14}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getDimensionBehaviour$enumunboxing$(I)I

    move-result v7

    .line 98
    iget-object v13, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    const/4 v14, 0x1

    invoke-virtual {v13, v14}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getDimensionBehaviour$enumunboxing$(I)I

    move-result v13

    .line 99
    iget-boolean v14, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->mNeedBuildGraph:Z

    if-eqz v14, :cond_28

    .line 100
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->buildGraph()V

    .line 101
    :cond_28
    iget-object v14, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-virtual {v14}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getX()I

    move-result v14

    .line 102
    iget-object v15, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getY()I

    move-result v15

    move-object/from16 v16, v2

    .line 103
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    invoke-virtual {v2, v14}, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolve(I)V

    .line 104
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    invoke-virtual {v2, v15}, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolve(I)V

    .line 105
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->measureWidgets()V

    const/4 v2, 0x2

    if-eq v7, v2, :cond_2a

    if-ne v13, v2, :cond_29

    goto :goto_1a

    :cond_29
    move-object/from16 v22, v4

    move-object/from16 v23, v5

    goto :goto_1c

    :cond_2a
    :goto_1a
    if-eqz v12, :cond_2c

    .line 106
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->mRuns:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_2c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;

    .line 107
    invoke-virtual/range {v22 .. v22}, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->supportsWrapComputation()Z

    move-result v22

    if-nez v22, :cond_2b

    const/4 v12, 0x0

    :cond_2c
    if-eqz v12, :cond_2d

    const/4 v2, 0x2

    if-ne v7, v2, :cond_2d

    .line 108
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    move-object/from16 v22, v4

    .line 109
    iget-object v4, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    move-object/from16 v23, v5

    const/4 v5, 0x0

    const/16 v19, 0x1

    aput v19, v4, v5

    .line 110
    invoke-virtual {v0, v2, v5}, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->computeWrap(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;I)I

    move-result v4

    invoke-virtual {v2, v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setWidth(I)V

    .line 111
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget-object v4, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;

    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v2

    invoke-virtual {v4, v2}, Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;->resolve(I)V

    goto :goto_1b

    :cond_2d
    move-object/from16 v22, v4

    move-object/from16 v23, v5

    :goto_1b
    if-eqz v12, :cond_2e

    const/4 v2, 0x2

    if-ne v13, v2, :cond_2e

    .line 112
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    .line 113
    iget-object v4, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v5, 0x1

    aput v5, v4, v5

    .line 114
    invoke-virtual {v0, v2, v5}, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->computeWrap(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;I)I

    move-result v4

    invoke-virtual {v2, v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setHeight(I)V

    .line 115
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget-object v4, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;

    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v2

    invoke-virtual {v4, v2}, Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;->resolve(I)V

    .line 116
    :cond_2e
    :goto_1c
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget-object v4, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v5, 0x0

    aget v12, v4, v5

    move/from16 v24, v9

    const/4 v9, 0x1

    if-eq v12, v9, :cond_30

    aget v4, v4, v5

    const/4 v5, 0x4

    if-ne v4, v5, :cond_2f

    goto :goto_1d

    :cond_2f
    const/4 v2, 0x0

    goto :goto_1e

    .line 117
    :cond_30
    :goto_1d
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v2

    add-int/2addr v2, v14

    .line 118
    iget-object v4, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    invoke-virtual {v4, v2}, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolve(I)V

    .line 119
    iget-object v4, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;

    sub-int/2addr v2, v14

    invoke-virtual {v4, v2}, Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;->resolve(I)V

    .line 120
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->measureWidgets()V

    .line 121
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget-object v4, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v5, 0x1

    aget v9, v4, v5

    if-eq v9, v5, :cond_31

    aget v4, v4, v5

    const/4 v5, 0x4

    if-ne v4, v5, :cond_32

    .line 122
    :cond_31
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v2

    add-int/2addr v2, v15

    .line 123
    iget-object v4, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    invoke-virtual {v4, v2}, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolve(I)V

    .line 124
    iget-object v4, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;

    sub-int/2addr v2, v15

    invoke-virtual {v4, v2}, Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;->resolve(I)V

    .line 125
    :cond_32
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->measureWidgets()V

    const/4 v2, 0x1

    .line 126
    :goto_1e
    iget-object v4, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->mRuns:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_34

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;

    .line 127
    iget-object v9, v5, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    iget-object v12, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    if-ne v9, v12, :cond_33

    iget-boolean v9, v5, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->resolved:Z

    if-nez v9, :cond_33

    goto :goto_1f

    .line 128
    :cond_33
    invoke-virtual {v5}, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->applyToWidget()V

    goto :goto_1f

    .line 129
    :cond_34
    iget-object v4, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->mRuns:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_35
    :goto_20
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_39

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;

    if-nez v2, :cond_36

    .line 130
    iget-object v9, v5, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    iget-object v12, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    if-ne v9, v12, :cond_36

    goto :goto_20

    .line 131
    :cond_36
    iget-object v9, v5, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget-boolean v9, v9, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    if-nez v9, :cond_37

    goto :goto_21

    .line 132
    :cond_37
    iget-object v9, v5, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget-boolean v9, v9, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    if-nez v9, :cond_38

    instance-of v9, v5, Landroidx/constraintlayout/solver/widgets/analyzer/GuidelineReference;

    if-nez v9, :cond_38

    goto :goto_21

    .line 133
    :cond_38
    iget-object v9, v5, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;

    iget-boolean v9, v9, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    if-nez v9, :cond_35

    instance-of v9, v5, Landroidx/constraintlayout/solver/widgets/analyzer/ChainRun;

    if-nez v9, :cond_35

    instance-of v5, v5, Landroidx/constraintlayout/solver/widgets/analyzer/GuidelineReference;

    if-nez v5, :cond_35

    :goto_21
    const/4 v2, 0x0

    goto :goto_22

    :cond_39
    const/4 v2, 0x1

    .line 134
    :goto_22
    iget-object v4, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-virtual {v4, v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setHorizontalDimensionBehaviour$enumunboxing$(I)V

    .line 135
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-virtual {v0, v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setVerticalDimensionBehaviour$enumunboxing$(I)V

    move v4, v2

    const/high16 v0, 0x40000000    # 2.0f

    const/4 v2, 0x2

    goto/16 :goto_26

    :cond_3a
    move-object/from16 v16, v2

    move-object/from16 v22, v4

    move-object/from16 v23, v5

    move/from16 v24, v9

    .line 136
    iget-object v0, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mDependencyGraph:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;

    .line 137
    iget-boolean v2, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->mNeedBuildGraph:Z

    if-eqz v2, :cond_3c

    .line 138
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_23
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    const/4 v5, 0x0

    .line 139
    iput-boolean v5, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->measured:Z

    .line 140
    iget-object v7, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    iget-object v9, v7, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;

    iput-boolean v5, v9, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    .line 141
    iput-boolean v5, v7, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->resolved:Z

    .line 142
    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;->reset()V

    .line 143
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    iget-object v7, v4, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;

    iput-boolean v5, v7, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    .line 144
    iput-boolean v5, v4, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->resolved:Z

    .line 145
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;->reset()V

    goto :goto_23

    :cond_3b
    const/4 v5, 0x0

    .line 146
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iput-boolean v5, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->measured:Z

    .line 147
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    iget-object v4, v2, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;

    iput-boolean v5, v4, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    .line 148
    iput-boolean v5, v2, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->resolved:Z

    .line 149
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;->reset()V

    .line 150
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    iget-object v4, v2, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;

    iput-boolean v5, v4, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    .line 151
    iput-boolean v5, v2, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->resolved:Z

    .line 152
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;->reset()V

    .line 153
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->buildGraph()V

    goto :goto_24

    :cond_3c
    const/4 v5, 0x0

    .line 154
    :goto_24
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->mContainer:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-virtual {v0, v2}, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->basicMeasureWidgets(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;)Z

    .line 155
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    .line 156
    iput v5, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mX:I

    .line 157
    iput v5, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mY:I

    .line 158
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    invoke-virtual {v2, v5}, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolve(I)V

    .line 159
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    invoke-virtual {v0, v5}, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolve(I)V

    const/high16 v0, 0x40000000    # 2.0f

    if-ne v8, v0, :cond_3d

    .line 160
    invoke-virtual {v3, v12, v5}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->directMeasureWithOrientation(ZI)Z

    move-result v2

    const/4 v4, 0x1

    and-int/lit8 v20, v2, 0x1

    move v2, v4

    move/from16 v5, v20

    goto :goto_25

    :cond_3d
    const/4 v4, 0x1

    move v5, v4

    const/4 v2, 0x0

    :goto_25
    if-ne v10, v0, :cond_3e

    .line 161
    invoke-virtual {v3, v12, v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->directMeasureWithOrientation(ZI)Z

    move-result v7

    and-int v4, v5, v7

    add-int/lit8 v2, v2, 0x1

    goto :goto_26

    :cond_3e
    move v4, v5

    :goto_26
    if-eqz v4, :cond_43

    if-ne v8, v0, :cond_3f

    const/4 v5, 0x1

    goto :goto_27

    :cond_3f
    const/4 v5, 0x0

    :goto_27
    if-ne v10, v0, :cond_40

    const/4 v0, 0x1

    goto :goto_28

    :cond_40
    const/4 v0, 0x0

    .line 162
    :goto_28
    invoke-virtual {v3, v5, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->updateFromRuns(ZZ)V

    goto :goto_2a

    :cond_41
    move-object/from16 v16, v2

    move-object/from16 v22, v4

    move-object/from16 v23, v5

    move/from16 v24, v9

    .line 163
    iget-object v0, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;->clear()V

    .line 164
    iget-object v0, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;->clear()V

    .line 165
    iget-object v0, v3, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    .line 166
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_29
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_42

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 167
    iget-object v4, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;->clear()V

    .line 168
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;->clear()V

    goto :goto_29

    :cond_42
    const/4 v2, 0x0

    const/4 v4, 0x0

    :cond_43
    :goto_2a
    if-eqz v4, :cond_45

    const/4 v0, 0x2

    if-eq v2, v0, :cond_44

    goto :goto_2c

    :cond_44
    :goto_2b
    move-object/from16 v0, p0

    goto/16 :goto_44

    :cond_45
    :goto_2c
    const/16 v0, 0x8

    if-lez v6, :cond_4e

    .line 169
    iget-object v2, v3, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 170
    iget-object v4, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mMeasurer:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measurer;

    const/4 v5, 0x0

    :goto_2d
    if-ge v5, v2, :cond_4a

    .line 171
    iget-object v7, v3, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 172
    instance-of v8, v7, Landroidx/constraintlayout/solver/widgets/Guideline;

    if-eqz v8, :cond_46

    :goto_2e
    const/4 v12, 0x3

    goto :goto_30

    .line 173
    :cond_46
    iget-object v8, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    iget-object v8, v8, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;

    iget-boolean v8, v8, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    if-eqz v8, :cond_47

    iget-object v8, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    iget-object v8, v8, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;

    iget-boolean v8, v8, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    if-eqz v8, :cond_47

    goto :goto_2e

    :cond_47
    const/4 v8, 0x0

    .line 174
    invoke-virtual {v7, v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getDimensionBehaviour$enumunboxing$(I)I

    move-result v9

    const/4 v8, 0x1

    .line 175
    invoke-virtual {v7, v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getDimensionBehaviour$enumunboxing$(I)I

    move-result v10

    const/4 v12, 0x3

    if-ne v9, v12, :cond_48

    .line 176
    iget v9, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintDefaultWidth:I

    if-eq v9, v8, :cond_48

    if-ne v10, v12, :cond_48

    iget v9, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintDefaultHeight:I

    if-eq v9, v8, :cond_48

    const/4 v8, 0x1

    goto :goto_2f

    :cond_48
    const/4 v8, 0x0

    :goto_2f
    if-eqz v8, :cond_49

    goto :goto_30

    :cond_49
    const/4 v8, 0x0

    .line 177
    invoke-virtual {v1, v4, v7, v8}, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->measure(Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Z)Z

    :goto_30
    add-int/lit8 v5, v5, 0x1

    goto :goto_2d

    .line 178
    :cond_4a
    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;

    .line 179
    iget-object v2, v4, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;->layout:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    const/4 v5, 0x0

    :goto_31
    if-ge v5, v2, :cond_4d

    .line 180
    iget-object v7, v4, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;->layout:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v7, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 181
    instance-of v8, v7, Landroidx/constraintlayout/widget/Placeholder;

    if-eqz v8, :cond_4c

    .line 182
    check-cast v7, Landroidx/constraintlayout/widget/Placeholder;

    .line 183
    iget-object v8, v7, Landroidx/constraintlayout/widget/Placeholder;->mContent:Landroid/view/View;

    if-nez v8, :cond_4b

    goto :goto_32

    .line 184
    :cond_4b
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    check-cast v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    .line 185
    iget-object v7, v7, Landroidx/constraintlayout/widget/Placeholder;->mContent:Landroid/view/View;

    .line 186
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    .line 187
    iget-object v9, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->widget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    const/4 v10, 0x0

    .line 188
    iput v10, v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    .line 189
    iget-object v10, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->widget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    invoke-virtual {v9}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v9

    invoke-virtual {v10, v9}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setWidth(I)V

    .line 190
    iget-object v8, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->widget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    iget-object v9, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->widget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    invoke-virtual {v9}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v9

    invoke-virtual {v8, v9}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setHeight(I)V

    .line 191
    iget-object v7, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->widget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 192
    iput v0, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    :cond_4c
    :goto_32
    add-int/lit8 v5, v5, 0x1

    goto :goto_31

    .line 193
    :cond_4d
    iget-object v2, v4, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;->layout:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 194
    iget-object v2, v2, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    .line 195
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_4e

    const/4 v5, 0x0

    :goto_33
    if-ge v5, v2, :cond_4e

    .line 196
    iget-object v7, v4, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;->layout:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 197
    iget-object v7, v7, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    .line 198
    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/constraintlayout/widget/ConstraintHelper;

    .line 199
    invoke-static {v7}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v5, v5, 0x1

    goto :goto_33

    .line 200
    :cond_4e
    iget v2, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mOptimizationLevel:I

    .line 201
    iget-object v4, v1, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    move/from16 v5, v24

    if-lez v6, :cond_4f

    .line 202
    invoke-virtual {v1, v3, v5, v11}, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->solveLinearSystem(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;II)V

    :cond_4f
    if-lez v4, :cond_69

    .line 203
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHorizontalDimensionBehaviour$enumunboxing$()I

    move-result v6

    const/4 v7, 0x2

    if-ne v6, v7, :cond_50

    const/4 v6, 0x1

    goto :goto_34

    :cond_50
    const/4 v6, 0x0

    .line 204
    :goto_34
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getVerticalDimensionBehaviour$enumunboxing$()I

    move-result v8

    if-ne v8, v7, :cond_51

    const/4 v7, 0x1

    goto :goto_35

    :cond_51
    const/4 v7, 0x0

    .line 205
    :goto_35
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v8

    iget-object v9, v1, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->constraintWidgetContainer:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    .line 206
    iget v9, v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinWidth:I

    .line 207
    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 208
    invoke-virtual {v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v9

    iget-object v10, v1, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->constraintWidgetContainer:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    .line 209
    iget v10, v10, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinHeight:I

    .line 210
    invoke-static {v9, v10}, Ljava/lang/Math;->max(II)I

    move-result v9

    move v10, v8

    move v12, v9

    const/4 v8, 0x0

    const/4 v9, 0x0

    :goto_36
    if-ge v8, v4, :cond_57

    .line 211
    iget-object v13, v1, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    invoke-virtual {v13, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 212
    instance-of v14, v13, Landroidx/constraintlayout/solver/widgets/VirtualLayout;

    if-nez v14, :cond_52

    move/from16 v18, v2

    move-object/from16 v15, v16

    move-object/from16 v14, v22

    move-object/from16 v0, v23

    goto/16 :goto_3b

    .line 213
    :cond_52
    invoke-virtual {v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v14

    .line 214
    invoke-virtual {v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v15

    move/from16 v18, v2

    move-object/from16 v0, v23

    const/4 v2, 0x1

    .line 215
    invoke-virtual {v1, v0, v13, v2}, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->measure(Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Z)Z

    move-result v21

    or-int v2, v9, v21

    .line 216
    invoke-virtual {v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v9

    move/from16 v21, v2

    .line 217
    invoke-virtual {v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v2

    if-eq v9, v14, :cond_54

    .line 218
    invoke-virtual {v13, v9}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setWidth(I)V

    if-eqz v6, :cond_53

    .line 219
    invoke-virtual {v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getRight()I

    move-result v9

    if-le v9, v10, :cond_53

    .line 220
    invoke-virtual {v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getRight()I

    move-result v9

    move-object/from16 v14, v22

    .line 221
    invoke-virtual {v13, v14}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v21

    add-int v9, v21, v9

    .line 222
    invoke-static {v10, v9}, Ljava/lang/Math;->max(II)I

    move-result v10

    goto :goto_37

    :cond_53
    move-object/from16 v14, v22

    :goto_37
    const/16 v21, 0x1

    goto :goto_38

    :cond_54
    move-object/from16 v14, v22

    :goto_38
    if-eq v2, v15, :cond_56

    .line 223
    invoke-virtual {v13, v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setHeight(I)V

    if-eqz v7, :cond_55

    .line 224
    invoke-virtual {v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getBottom()I

    move-result v2

    if-le v2, v12, :cond_55

    .line 225
    invoke-virtual {v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getBottom()I

    move-result v2

    move-object/from16 v15, v16

    .line 226
    invoke-virtual {v13, v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v9

    invoke-virtual {v9}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v9

    add-int/2addr v9, v2

    .line 227
    invoke-static {v12, v9}, Ljava/lang/Math;->max(II)I

    move-result v2

    move v12, v2

    goto :goto_39

    :cond_55
    move-object/from16 v15, v16

    :goto_39
    const/16 v21, 0x1

    goto :goto_3a

    :cond_56
    move-object/from16 v15, v16

    .line 228
    :goto_3a
    check-cast v13, Landroidx/constraintlayout/solver/widgets/VirtualLayout;

    const/4 v2, 0x0

    or-int/lit8 v9, v21, 0x0

    :goto_3b
    add-int/lit8 v8, v8, 0x1

    move-object/from16 v23, v0

    move-object/from16 v22, v14

    move-object/from16 v16, v15

    move/from16 v2, v18

    const/16 v0, 0x8

    goto/16 :goto_36

    :cond_57
    move/from16 v18, v2

    move-object/from16 v15, v16

    move-object/from16 v14, v22

    move-object/from16 v0, v23

    const/4 v2, 0x0

    const/4 v8, 0x2

    :goto_3c
    if-ge v2, v8, :cond_65

    move v13, v12

    move v12, v10

    move v10, v9

    const/4 v9, 0x0

    :goto_3d
    if-ge v9, v4, :cond_63

    .line 229
    iget-object v8, v1, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    move/from16 v16, v4

    .line 230
    instance-of v4, v8, Landroidx/constraintlayout/solver/widgets/Helper;

    if-eqz v4, :cond_58

    instance-of v4, v8, Landroidx/constraintlayout/solver/widgets/VirtualLayout;

    if-eqz v4, :cond_59

    :cond_58
    instance-of v4, v8, Landroidx/constraintlayout/solver/widgets/Guideline;

    if-eqz v4, :cond_5a

    :cond_59
    move/from16 v21, v2

    const/16 v2, 0x8

    goto :goto_3e

    .line 231
    :cond_5a
    iget v4, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    move/from16 v21, v2

    const/16 v2, 0x8

    if-ne v4, v2, :cond_5b

    goto :goto_3e

    .line 232
    :cond_5b
    iget-object v4, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;

    iget-boolean v4, v4, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    if-eqz v4, :cond_5c

    iget-object v4, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;

    iget-boolean v4, v4, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    if-eqz v4, :cond_5c

    goto :goto_3e

    .line 233
    :cond_5c
    instance-of v4, v8, Landroidx/constraintlayout/solver/widgets/VirtualLayout;

    if-eqz v4, :cond_5d

    :goto_3e
    move-object/from16 v23, v0

    move-object/from16 v22, v3

    move/from16 v24, v5

    goto :goto_3f

    .line 234
    :cond_5d
    invoke-virtual {v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v4

    .line 235
    invoke-virtual {v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v2

    move-object/from16 v22, v3

    .line 236
    iget v3, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBaselineDistance:I

    move/from16 v24, v5

    const/4 v5, 0x1

    .line 237
    invoke-virtual {v1, v0, v8, v5}, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->measure(Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Z)Z

    move-result v20

    or-int v10, v10, v20

    .line 238
    invoke-virtual {v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v5

    move-object/from16 v23, v0

    .line 239
    invoke-virtual {v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v0

    if-eq v5, v4, :cond_5f

    .line 240
    invoke-virtual {v8, v5}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setWidth(I)V

    if-eqz v6, :cond_5e

    .line 241
    invoke-virtual {v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getRight()I

    move-result v4

    if-le v4, v12, :cond_5e

    .line 242
    invoke-virtual {v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getRight()I

    move-result v4

    .line 243
    invoke-virtual {v8, v14}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v5

    invoke-virtual {v5}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v5

    add-int/2addr v5, v4

    .line 244
    invoke-static {v12, v5}, Ljava/lang/Math;->max(II)I

    move-result v12

    :cond_5e
    const/4 v10, 0x1

    :cond_5f
    if-eq v0, v2, :cond_61

    .line 245
    invoke-virtual {v8, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setHeight(I)V

    if-eqz v7, :cond_60

    .line 246
    invoke-virtual {v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getBottom()I

    move-result v0

    if-le v0, v13, :cond_60

    .line 247
    invoke-virtual {v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getBottom()I

    move-result v0

    .line 248
    invoke-virtual {v8, v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v2

    add-int/2addr v2, v0

    .line 249
    invoke-static {v13, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    move v13, v0

    :cond_60
    const/4 v10, 0x1

    .line 250
    :cond_61
    iget-boolean v0, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->hasBaseline:Z

    if-eqz v0, :cond_62

    .line 251
    iget v0, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBaselineDistance:I

    if-eq v3, v0, :cond_62

    const/4 v10, 0x1

    :cond_62
    :goto_3f
    add-int/lit8 v9, v9, 0x1

    move/from16 v4, v16

    move/from16 v2, v21

    move-object/from16 v3, v22

    move-object/from16 v0, v23

    move/from16 v5, v24

    const/4 v8, 0x2

    goto/16 :goto_3d

    :cond_63
    move-object/from16 v23, v0

    move/from16 v21, v2

    move-object/from16 v22, v3

    move/from16 v16, v4

    move/from16 v24, v5

    if-eqz v10, :cond_64

    move-object/from16 v0, v22

    move/from16 v2, v24

    .line 252
    invoke-virtual {v1, v0, v2, v11}, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->solveLinearSystem(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;II)V

    const/4 v9, 0x0

    goto :goto_40

    :cond_64
    move-object/from16 v0, v22

    move/from16 v2, v24

    move v9, v10

    :goto_40
    add-int/lit8 v3, v21, 0x1

    move v5, v2

    move v2, v3

    move v10, v12

    move v12, v13

    move/from16 v4, v16

    const/4 v8, 0x2

    move-object v3, v0

    move-object/from16 v0, v23

    goto/16 :goto_3c

    :cond_65
    move-object v0, v3

    move v2, v5

    if-eqz v9, :cond_68

    .line 253
    invoke-virtual {v1, v0, v2, v11}, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->solveLinearSystem(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;II)V

    .line 254
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v3

    if-ge v3, v10, :cond_66

    .line 255
    invoke-virtual {v0, v10}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setWidth(I)V

    const/4 v6, 0x1

    goto :goto_41

    :cond_66
    const/4 v6, 0x0

    .line 256
    :goto_41
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v3

    if-ge v3, v12, :cond_67

    .line 257
    invoke-virtual {v0, v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setHeight(I)V

    const/4 v4, 0x1

    goto :goto_42

    :cond_67
    move v4, v6

    :goto_42
    if-eqz v4, :cond_68

    .line 258
    invoke-virtual {v1, v0, v2, v11}, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->solveLinearSystem(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;II)V

    :cond_68
    move/from16 v1, v18

    goto :goto_43

    :cond_69
    move-object v0, v3

    move v1, v2

    .line 259
    :goto_43
    iput v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mOptimizationLevel:I

    goto/16 :goto_2b

    .line 260
    :goto_44
    iget-object v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v1

    iget-object v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v2

    iget-object v3, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    .line 261
    iget-boolean v4, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mWidthMeasuredTooSmall:Z

    .line 262
    iget-boolean v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mHeightMeasuredTooSmall:Z

    .line 263
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v5

    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v6

    add-int/2addr v6, v5

    .line 264
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->getPaddingWidth()I

    move-result v5

    add-int/2addr v5, v1

    add-int/2addr v2, v6

    move/from16 v1, p1

    const/4 v6, 0x0

    .line 265
    invoke-static {v5, v1, v6}, Landroid/view/ViewGroup;->resolveSizeAndState(III)I

    move-result v1

    move/from16 v5, p2

    .line 266
    invoke-static {v2, v5, v6}, Landroid/view/ViewGroup;->resolveSizeAndState(III)I

    move-result v2

    const v5, 0xffffff

    and-int/2addr v1, v5

    and-int/2addr v2, v5

    .line 267
    iget v5, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxWidth:I

    invoke-static {v5, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 268
    iget v5, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mMaxHeight:I

    invoke-static {v5, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/high16 v5, 0x1000000

    if-eqz v4, :cond_6a

    or-int/2addr v1, v5

    :cond_6a
    if-eqz v3, :cond_6b

    or-int/2addr v2, v5

    .line 269
    :cond_6b
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    return-void
.end method

.method public onViewAdded(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onViewAdded(Landroid/view/View;)V

    .line 2
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->getViewWidget(Landroid/view/View;)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    move-result-object v0

    .line 3
    instance-of v1, p1, Landroidx/constraintlayout/widget/Guideline;

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    .line 4
    instance-of v0, v0, Landroidx/constraintlayout/solver/widgets/Guideline;

    if-nez v0, :cond_0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    .line 6
    new-instance v1, Landroidx/constraintlayout/solver/widgets/Guideline;

    invoke-direct {v1}, Landroidx/constraintlayout/solver/widgets/Guideline;-><init>()V

    iput-object v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->widget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 7
    iput-boolean v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->isGuideline:Z

    .line 8
    check-cast v1, Landroidx/constraintlayout/solver/widgets/Guideline;

    iget v0, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->orientation:I

    invoke-virtual {v1, v0}, Landroidx/constraintlayout/solver/widgets/Guideline;->setOrientation(I)V

    .line 9
    :cond_0
    instance-of v0, p1, Landroidx/constraintlayout/widget/ConstraintHelper;

    if-eqz v0, :cond_1

    .line 10
    move-object v0, p1

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintHelper;

    .line 11
    invoke-virtual {v0}, Landroidx/constraintlayout/widget/ConstraintHelper;->validateParams()V

    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    .line 13
    iput-boolean v2, v1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->isHelper:Z

    .line 14
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 15
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    :cond_1
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mChildrenByIds:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 17
    iput-boolean v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDirtyHierarchy:Z

    return-void
.end method

.method public onViewRemoved(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onViewRemoved(Landroid/view/View;)V

    .line 2
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mChildrenByIds:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->remove(I)V

    .line 3
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->getViewWidget(Landroid/view/View;)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    move-result-object v0

    .line 4
    iget-object v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    .line 5
    iget-object v1, v1, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    const/4 v1, 0x0

    .line 6
    iput-object v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 7
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDirtyHierarchy:Z

    return-void
.end method

.method public removeView(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    return-void
.end method

.method public requestLayout()V
    .locals 1

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDirtyHierarchy:Z

    .line 2
    invoke-super {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public setDesignInformation(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    if-nez p1, :cond_2

    .line 1
    instance-of p1, p2, Ljava/lang/String;

    if-eqz p1, :cond_2

    instance-of p1, p3, Ljava/lang/Integer;

    if-eqz p1, :cond_2

    .line 2
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDesignIds:Ljava/util/HashMap;

    if-nez p1, :cond_0

    .line 3
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDesignIds:Ljava/util/HashMap;

    .line 4
    :cond_0
    check-cast p2, Ljava/lang/String;

    const-string p1, "/"

    .line 5
    invoke-virtual {p2, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_1

    add-int/lit8 p1, p1, 0x1

    .line 6
    invoke-virtual {p2, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    .line 7
    :cond_1
    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 8
    iget-object p0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mDesignIds:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    return-void
.end method

.method public setId(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mChildrenByIds:Landroid/util/SparseArray;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->remove(I)V

    .line 2
    invoke-super {p0, p1}, Landroid/view/View;->setId(I)V

    .line 3
    iget-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->mChildrenByIds:Landroid/util/SparseArray;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getId()I

    move-result v0

    invoke-virtual {p1, v0, p0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-void
.end method

.method public shouldDelayChildPressedState()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final updateHierarchy()Z
    .locals 21

    move-object/from16 v0, p0

    .line 1
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    const/4 v4, 0x1

    if-ge v3, v1, :cond_1

    .line 2
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 3
    invoke-virtual {v5}, Landroid/view/View;->isLayoutRequested()Z

    move-result v5

    if-eqz v5, :cond_0

    move v1, v4

    goto :goto_1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    move v1, v2

    :goto_1
    if-eqz v1, :cond_4a

    .line 4
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->isInEditMode()Z

    move-result v3

    .line 5
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    move v6, v2

    :goto_2
    if-ge v6, v5, :cond_3

    .line 6
    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 7
    invoke-virtual {v0, v7}, Landroidx/constraintlayout/widget/ConstraintLayout;->getViewWidget(Landroid/view/View;)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    move-result-object v7

    if-nez v7, :cond_2

    goto :goto_3

    .line 8
    :cond_2
    invoke-virtual {v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->reset()V

    :goto_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    :cond_3
    const/4 v7, -0x1

    if-eqz v3, :cond_9

    move v8, v2

    :goto_4
    if-ge v8, v5, :cond_9

    .line 9
    invoke-virtual {v0, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    .line 10
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-virtual {v9}, Landroid/view/View;->getId()I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v10

    .line 11
    invoke-virtual {v9}, Landroid/view/View;->getId()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v0, v2, v10, v11}, Landroidx/constraintlayout/widget/ConstraintLayout;->setDesignInformation(ILjava/lang/Object;Ljava/lang/Object;)V

    const/16 v11, 0x2f

    .line 12
    invoke-virtual {v10, v11}, Ljava/lang/String;->indexOf(I)I

    move-result v11

    if-eq v11, v7, :cond_4

    add-int/lit8 v11, v11, 0x1

    .line 13
    invoke-virtual {v10, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    .line 14
    :cond_4
    invoke-virtual {v9}, Landroid/view/View;->getId()I

    move-result v9

    if-nez v9, :cond_5

    .line 15
    iget-object v9, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    goto :goto_5

    .line 16
    :cond_5
    iget-object v11, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mChildrenByIds:Landroid/util/SparseArray;

    invoke-virtual {v11, v9}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/view/View;

    if-nez v11, :cond_6

    .line 17
    invoke-virtual {v0, v9}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v11

    if-eqz v11, :cond_6

    if-eq v11, v0, :cond_6

    .line 18
    invoke-virtual {v11}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v9

    if-ne v9, v0, :cond_6

    .line 19
    invoke-virtual {v0, v11}, Landroidx/constraintlayout/widget/ConstraintLayout;->onViewAdded(Landroid/view/View;)V

    :cond_6
    if-ne v11, v0, :cond_7

    .line 20
    iget-object v9, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    goto :goto_5

    :cond_7
    if-nez v11, :cond_8

    const/4 v9, 0x0

    goto :goto_5

    .line 21
    :cond_8
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    iget-object v9, v9, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->widget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 22
    :goto_5
    iput-object v10, v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mDebugName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    add-int/lit8 v8, v8, 0x1

    goto :goto_4

    .line 23
    :cond_9
    iget v8, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSetId:I

    if-eq v8, v7, :cond_11

    move v8, v2

    :goto_6
    if-ge v8, v5, :cond_11

    .line 24
    invoke-virtual {v0, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    .line 25
    invoke-virtual {v9}, Landroid/view/View;->getId()I

    move-result v10

    iget v11, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSetId:I

    if-ne v10, v11, :cond_10

    instance-of v10, v9, Landroidx/constraintlayout/widget/Constraints;

    if-eqz v10, :cond_10

    .line 26
    check-cast v9, Landroidx/constraintlayout/widget/Constraints;

    .line 27
    iget-object v10, v9, Landroidx/constraintlayout/widget/Constraints;->myConstraintSet:Landroidx/constraintlayout/widget/ConstraintSet;

    if-nez v10, :cond_a

    .line 28
    new-instance v10, Landroidx/constraintlayout/widget/ConstraintSet;

    invoke-direct {v10}, Landroidx/constraintlayout/widget/ConstraintSet;-><init>()V

    iput-object v10, v9, Landroidx/constraintlayout/widget/Constraints;->myConstraintSet:Landroidx/constraintlayout/widget/ConstraintSet;

    .line 29
    :cond_a
    iget-object v10, v9, Landroidx/constraintlayout/widget/Constraints;->myConstraintSet:Landroidx/constraintlayout/widget/ConstraintSet;

    invoke-static {v10}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    invoke-virtual {v9}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v11

    .line 31
    iget-object v12, v10, Landroidx/constraintlayout/widget/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-virtual {v12}, Ljava/util/HashMap;->clear()V

    move v12, v2

    :goto_7
    if-ge v12, v11, :cond_f

    .line 32
    invoke-virtual {v9, v12}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v13

    .line 33
    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v14

    check-cast v14, Landroidx/constraintlayout/widget/Constraints$LayoutParams;

    .line 34
    invoke-virtual {v13}, Landroid/view/View;->getId()I

    move-result v15

    .line 35
    iget-boolean v6, v10, Landroidx/constraintlayout/widget/ConstraintSet;->mForceId:Z

    if-eqz v6, :cond_c

    if-eq v15, v7, :cond_b

    goto :goto_8

    .line 36
    :cond_b
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "All children of ConstraintLayout must have ids to use ConstraintSet"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 37
    :cond_c
    :goto_8
    iget-object v6, v10, Landroidx/constraintlayout/widget/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_d

    .line 38
    iget-object v6, v10, Landroidx/constraintlayout/widget/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    new-instance v2, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;

    invoke-direct {v2}, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;-><init>()V

    invoke-virtual {v6, v7, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    :cond_d
    iget-object v2, v10, Landroidx/constraintlayout/widget/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;

    .line 40
    instance-of v6, v13, Landroidx/constraintlayout/widget/ConstraintHelper;

    if-eqz v6, :cond_e

    .line 41
    check-cast v13, Landroidx/constraintlayout/widget/ConstraintHelper;

    .line 42
    invoke-virtual {v2, v15, v14}, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->fillFromConstraints(ILandroidx/constraintlayout/widget/Constraints$LayoutParams;)V

    .line 43
    instance-of v6, v13, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v6, :cond_e

    .line 44
    iget-object v6, v2, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->layout:Landroidx/constraintlayout/widget/ConstraintSet$Layout;

    iput v4, v6, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->mHelperType:I

    .line 45
    check-cast v13, Landroidx/constraintlayout/widget/Barrier;

    .line 46
    iget v7, v13, Landroidx/constraintlayout/widget/Barrier;->mIndicatedType:I

    .line 47
    iput v7, v6, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->mBarrierDirection:I

    .line 48
    iget-object v7, v13, Landroidx/constraintlayout/widget/ConstraintHelper;->mIds:[I

    iget v4, v13, Landroidx/constraintlayout/widget/ConstraintHelper;->mCount:I

    invoke-static {v7, v4}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v4

    .line 49
    iput-object v4, v6, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->mReferenceIds:[I

    .line 50
    iget-object v4, v2, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->layout:Landroidx/constraintlayout/widget/ConstraintSet$Layout;

    .line 51
    iget-object v6, v13, Landroidx/constraintlayout/widget/Barrier;->mBarrier:Landroidx/constraintlayout/solver/widgets/Barrier;

    .line 52
    iget v6, v6, Landroidx/constraintlayout/solver/widgets/Barrier;->mMargin:I

    .line 53
    iput v6, v4, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->mBarrierMargin:I

    .line 54
    :cond_e
    invoke-virtual {v2, v15, v14}, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->fillFromConstraints(ILandroidx/constraintlayout/widget/Constraints$LayoutParams;)V

    add-int/lit8 v12, v12, 0x1

    const/4 v2, 0x0

    const/4 v4, 0x1

    const/4 v7, -0x1

    goto :goto_7

    .line 55
    :cond_f
    iget-object v2, v9, Landroidx/constraintlayout/widget/Constraints;->myConstraintSet:Landroidx/constraintlayout/widget/ConstraintSet;

    .line 56
    iput-object v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSet:Landroidx/constraintlayout/widget/ConstraintSet;

    :cond_10
    add-int/lit8 v8, v8, 0x1

    const/4 v2, 0x0

    const/4 v4, 0x1

    const/4 v7, -0x1

    goto/16 :goto_6

    .line 57
    :cond_11
    iget-object v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintSet:Landroidx/constraintlayout/widget/ConstraintSet;

    if-eqz v2, :cond_12

    const/4 v4, 0x1

    .line 58
    invoke-virtual {v2, v0, v4}, Landroidx/constraintlayout/widget/ConstraintSet;->applyToInternal(Landroidx/constraintlayout/widget/ConstraintLayout;Z)V

    .line 59
    :cond_12
    iget-object v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    .line 60
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 61
    iget-object v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v4, 0x2

    if-lez v2, :cond_1a

    const/4 v6, 0x0

    :goto_9
    if-ge v6, v2, :cond_1a

    .line 62
    iget-object v7, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mConstraintHelpers:Ljava/util/ArrayList;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/constraintlayout/widget/ConstraintHelper;

    .line 63
    invoke-virtual {v7}, Landroid/view/View;->isInEditMode()Z

    move-result v8

    if-eqz v8, :cond_13

    .line 64
    iget-object v8, v7, Landroidx/constraintlayout/widget/ConstraintHelper;->mReferenceIds:Ljava/lang/String;

    invoke-virtual {v7, v8}, Landroidx/constraintlayout/widget/ConstraintHelper;->setIds(Ljava/lang/String;)V

    .line 65
    :cond_13
    iget-object v8, v7, Landroidx/constraintlayout/widget/ConstraintHelper;->mReferenceIds:Ljava/lang/String;

    if-eqz v8, :cond_14

    .line 66
    invoke-virtual {v7, v8}, Landroidx/constraintlayout/widget/ConstraintHelper;->setIds(Ljava/lang/String;)V

    .line 67
    :cond_14
    iget-object v8, v7, Landroidx/constraintlayout/widget/ConstraintHelper;->mHelperWidget:Landroidx/constraintlayout/solver/widgets/Helper;

    if-nez v8, :cond_15

    goto :goto_b

    .line 68
    :cond_15
    check-cast v8, Landroidx/constraintlayout/solver/widgets/HelperWidget;

    const/4 v9, 0x0

    .line 69
    iput v9, v8, Landroidx/constraintlayout/solver/widgets/HelperWidget;->mWidgetsCount:I

    .line 70
    iget-object v8, v8, Landroidx/constraintlayout/solver/widgets/HelperWidget;->mWidgets:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    const/4 v9, 0x0

    invoke-static {v8, v9}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 v8, 0x0

    .line 71
    :goto_a
    iget v9, v7, Landroidx/constraintlayout/widget/ConstraintHelper;->mCount:I

    if-ge v8, v9, :cond_19

    .line 72
    iget-object v9, v7, Landroidx/constraintlayout/widget/ConstraintHelper;->mIds:[I

    aget v9, v9, v8

    .line 73
    invoke-virtual {v0, v9}, Landroidx/constraintlayout/widget/ConstraintLayout;->getViewById(I)Landroid/view/View;

    move-result-object v10

    if-nez v10, :cond_16

    .line 74
    iget-object v11, v7, Landroidx/constraintlayout/widget/ConstraintHelper;->mMap:Ljava/util/HashMap;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v11, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 75
    invoke-virtual {v7, v0, v9}, Landroidx/constraintlayout/widget/ConstraintHelper;->findId(Landroidx/constraintlayout/widget/ConstraintLayout;Ljava/lang/String;)I

    move-result v11

    if-eqz v11, :cond_16

    .line 76
    iget-object v10, v7, Landroidx/constraintlayout/widget/ConstraintHelper;->mIds:[I

    aput v11, v10, v8

    .line 77
    iget-object v10, v7, Landroidx/constraintlayout/widget/ConstraintHelper;->mMap:Ljava/util/HashMap;

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v10, v12, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    invoke-virtual {v0, v11}, Landroidx/constraintlayout/widget/ConstraintLayout;->getViewById(I)Landroid/view/View;

    move-result-object v10

    :cond_16
    if-eqz v10, :cond_18

    .line 79
    iget-object v9, v7, Landroidx/constraintlayout/widget/ConstraintHelper;->mHelperWidget:Landroidx/constraintlayout/solver/widgets/Helper;

    invoke-virtual {v0, v10}, Landroidx/constraintlayout/widget/ConstraintLayout;->getViewWidget(Landroid/view/View;)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    move-result-object v10

    check-cast v9, Landroidx/constraintlayout/solver/widgets/HelperWidget;

    .line 80
    iget v11, v9, Landroidx/constraintlayout/solver/widgets/HelperWidget;->mWidgetsCount:I

    const/4 v12, 0x1

    add-int/2addr v11, v12

    iget-object v12, v9, Landroidx/constraintlayout/solver/widgets/HelperWidget;->mWidgets:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    array-length v13, v12

    if-le v11, v13, :cond_17

    .line 81
    array-length v11, v12

    mul-int/2addr v11, v4

    invoke-static {v12, v11}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    iput-object v11, v9, Landroidx/constraintlayout/solver/widgets/HelperWidget;->mWidgets:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 82
    :cond_17
    iget-object v11, v9, Landroidx/constraintlayout/solver/widgets/HelperWidget;->mWidgets:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    iget v12, v9, Landroidx/constraintlayout/solver/widgets/HelperWidget;->mWidgetsCount:I

    aput-object v10, v11, v12

    const/4 v10, 0x1

    add-int/2addr v12, v10

    .line 83
    iput v12, v9, Landroidx/constraintlayout/solver/widgets/HelperWidget;->mWidgetsCount:I

    :cond_18
    add-int/lit8 v8, v8, 0x1

    goto :goto_a

    .line 84
    :cond_19
    iget-object v7, v7, Landroidx/constraintlayout/widget/ConstraintHelper;->mHelperWidget:Landroidx/constraintlayout/solver/widgets/Helper;

    iget-object v8, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-interface {v7, v8}, Landroidx/constraintlayout/solver/widgets/Helper;->updateConstraints(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;)V

    :goto_b
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_9

    :cond_1a
    const/4 v2, 0x0

    :goto_c
    if-ge v2, v5, :cond_1d

    .line 85
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 86
    instance-of v7, v6, Landroidx/constraintlayout/widget/Placeholder;

    if-eqz v7, :cond_1b

    .line 87
    check-cast v6, Landroidx/constraintlayout/widget/Placeholder;

    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v7, 0x0

    .line 88
    invoke-virtual {v0, v7}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v8

    iput-object v8, v6, Landroidx/constraintlayout/widget/Placeholder;->mContent:Landroid/view/View;

    if-eqz v8, :cond_1c

    .line 89
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    check-cast v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    const/4 v9, 0x1

    .line 90
    iput-boolean v9, v8, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->isInPlaceholder:Z

    .line 91
    iget-object v8, v6, Landroidx/constraintlayout/widget/Placeholder;->mContent:Landroid/view/View;

    invoke-virtual {v8, v7}, Landroid/view/View;->setVisibility(I)V

    .line 92
    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    goto :goto_d

    :cond_1b
    const/4 v7, 0x0

    :cond_1c
    :goto_d
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    :cond_1d
    const/4 v7, 0x0

    .line 93
    iget-object v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mTempMapIdToWidget:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->clear()V

    .line 94
    iget-object v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mTempMapIdToWidget:Landroid/util/SparseArray;

    iget-object v6, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-virtual {v2, v7, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 95
    iget-object v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mTempMapIdToWidget:Landroid/util/SparseArray;

    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getId()I

    move-result v6

    iget-object v7, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-virtual {v2, v6, v7}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    const/4 v2, 0x0

    :goto_e
    if-ge v2, v5, :cond_1e

    .line 96
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 97
    invoke-virtual {v0, v6}, Landroidx/constraintlayout/widget/ConstraintLayout;->getViewWidget(Landroid/view/View;)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    move-result-object v7

    .line 98
    iget-object v8, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mTempMapIdToWidget:Landroid/util/SparseArray;

    invoke-virtual {v6}, Landroid/view/View;->getId()I

    move-result v6

    invoke-virtual {v8, v6, v7}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    :cond_1e
    const/4 v9, 0x0

    :goto_f
    if-ge v9, v5, :cond_4a

    .line 99
    invoke-virtual {v0, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 100
    invoke-virtual {v0, v2}, Landroidx/constraintlayout/widget/ConstraintLayout;->getViewWidget(Landroid/view/View;)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    move-result-object v6

    if-nez v6, :cond_1f

    goto/16 :goto_11

    .line 101
    :cond_1f
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    .line 102
    iget-object v8, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    .line 103
    iget-object v10, v8, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 104
    iget-object v10, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eqz v10, :cond_20

    .line 105
    check-cast v10, Landroidx/constraintlayout/solver/widgets/WidgetContainer;

    .line 106
    iget-object v10, v10, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    const/4 v10, 0x0

    .line 107
    iput-object v10, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    goto :goto_10

    :cond_20
    const/4 v10, 0x0

    .line 108
    :goto_10
    iput-object v8, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 109
    iget-object v8, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mTempMapIdToWidget:Landroid/util/SparseArray;

    .line 110
    sget-object v13, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->RIGHT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    sget-object v14, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->LEFT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    sget-object v15, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->BOTTOM:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    sget-object v10, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->TOP:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    invoke-virtual {v7}, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->validate()V

    .line 111
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v4

    .line 112
    iput v4, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    .line 113
    iget-boolean v4, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->isInPlaceholder:Z

    if-eqz v4, :cond_21

    const/16 v4, 0x8

    .line 114
    iput v4, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    .line 115
    :cond_21
    iput-object v2, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCompanionWidget:Ljava/lang/Object;

    .line 116
    instance-of v4, v2, Landroidx/constraintlayout/widget/ConstraintHelper;

    if-eqz v4, :cond_22

    .line 117
    check-cast v2, Landroidx/constraintlayout/widget/ConstraintHelper;

    .line 118
    iget-object v4, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mLayoutWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    .line 119
    iget-boolean v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mIsRtl:Z

    .line 120
    invoke-virtual {v2, v6, v4}, Landroidx/constraintlayout/widget/ConstraintHelper;->resolveRtl(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Z)V

    .line 121
    :cond_22
    iget-boolean v2, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->isGuideline:Z

    if-eqz v2, :cond_26

    .line 122
    check-cast v6, Landroidx/constraintlayout/solver/widgets/Guideline;

    .line 123
    iget v2, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->resolvedGuideBegin:I

    .line 124
    iget v4, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->resolvedGuideEnd:I

    .line 125
    iget v7, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->resolvedGuidePercent:F

    const/high16 v8, -0x40800000    # -1.0f

    cmpl-float v10, v7, v8

    if-eqz v10, :cond_23

    if-lez v10, :cond_25

    .line 126
    iput v7, v6, Landroidx/constraintlayout/solver/widgets/Guideline;->mRelativePercent:F

    const/4 v7, -0x1

    .line 127
    iput v7, v6, Landroidx/constraintlayout/solver/widgets/Guideline;->mRelativeBegin:I

    .line 128
    iput v7, v6, Landroidx/constraintlayout/solver/widgets/Guideline;->mRelativeEnd:I

    goto :goto_11

    :cond_23
    const/4 v7, -0x1

    if-eq v2, v7, :cond_24

    if-le v2, v7, :cond_25

    .line 129
    iput v8, v6, Landroidx/constraintlayout/solver/widgets/Guideline;->mRelativePercent:F

    .line 130
    iput v2, v6, Landroidx/constraintlayout/solver/widgets/Guideline;->mRelativeBegin:I

    .line 131
    iput v7, v6, Landroidx/constraintlayout/solver/widgets/Guideline;->mRelativeEnd:I

    goto :goto_11

    :cond_24
    if-eq v4, v7, :cond_25

    if-le v4, v7, :cond_25

    .line 132
    iput v8, v6, Landroidx/constraintlayout/solver/widgets/Guideline;->mRelativePercent:F

    .line 133
    iput v7, v6, Landroidx/constraintlayout/solver/widgets/Guideline;->mRelativeBegin:I

    .line 134
    iput v4, v6, Landroidx/constraintlayout/solver/widgets/Guideline;->mRelativeEnd:I

    :cond_25
    :goto_11
    move/from16 v17, v1

    move/from16 v19, v3

    move/from16 v16, v5

    move/from16 v18, v9

    const/4 v1, 0x2

    const/4 v3, -0x1

    const/4 v4, 0x1

    const/4 v9, 0x0

    goto/16 :goto_1f

    .line 135
    :cond_26
    iget v2, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->resolvedLeftToLeft:I

    .line 136
    iget v4, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->resolvedLeftToRight:I

    .line 137
    iget v11, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->resolvedRightToLeft:I

    .line 138
    iget v12, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->resolvedRightToRight:I

    move/from16 v16, v5

    .line 139
    iget v5, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->resolveGoneLeftMargin:I

    move/from16 v17, v1

    .line 140
    iget v1, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->resolveGoneRightMargin:I

    move/from16 v18, v9

    .line 141
    iget v9, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->resolvedHorizontalBias:F

    move/from16 v19, v3

    .line 142
    iget v3, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->circleConstraint:I

    move/from16 v20, v9

    const/4 v9, -0x1

    if-eq v3, v9, :cond_27

    .line 143
    invoke-virtual {v8, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eqz v1, :cond_33

    .line 144
    iget v2, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->circleAngle:F

    iget v3, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->circleRadius:I

    .line 145
    sget-object v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->CENTER:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 146
    invoke-virtual {v6, v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v5

    .line 147
    invoke-virtual {v1, v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v1

    const/4 v4, 0x0

    const/4 v9, 0x1

    .line 148
    invoke-virtual {v5, v1, v3, v4, v9}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->connect(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;IIZ)Z

    .line 149
    iput v2, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCircleConstraintAngle:F

    goto/16 :goto_16

    :cond_27
    move v3, v9

    const/4 v9, 0x1

    if-eq v2, v3, :cond_28

    .line 150
    invoke-virtual {v8, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eqz v2, :cond_29

    .line 151
    iget v4, v7, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 152
    invoke-virtual {v6, v14}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v3

    .line 153
    invoke-virtual {v2, v14}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v2

    .line 154
    invoke-virtual {v3, v2, v4, v5, v9}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->connect(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;IIZ)Z

    goto :goto_12

    :cond_28
    move v2, v3

    if-eq v4, v2, :cond_2a

    .line 155
    invoke-virtual {v8, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eqz v2, :cond_29

    .line 156
    iget v3, v7, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 157
    invoke-virtual {v6, v14}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v4

    .line 158
    invoke-virtual {v2, v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v2

    .line 159
    invoke-virtual {v4, v2, v3, v5, v9}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->connect(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;IIZ)Z

    :cond_29
    :goto_12
    const/4 v2, -0x1

    :cond_2a
    if-eq v11, v2, :cond_2b

    .line 160
    invoke-virtual {v8, v11}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eqz v3, :cond_2c

    .line 161
    iget v4, v7, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 162
    invoke-virtual {v6, v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v5

    .line 163
    invoke-virtual {v3, v14}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v3

    const/4 v9, 0x1

    .line 164
    invoke-virtual {v5, v3, v4, v1, v9}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->connect(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;IIZ)Z

    goto :goto_13

    :cond_2b
    const/4 v9, 0x1

    if-eq v12, v2, :cond_2c

    .line 165
    invoke-virtual {v8, v12}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eqz v2, :cond_2c

    .line 166
    iget v3, v7, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 167
    invoke-virtual {v6, v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v4

    .line 168
    invoke-virtual {v2, v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v2

    .line 169
    invoke-virtual {v4, v2, v3, v1, v9}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->connect(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;IIZ)Z

    .line 170
    :cond_2c
    :goto_13
    iget v1, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topToTop:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_2d

    .line 171
    invoke-virtual {v8, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eqz v1, :cond_2e

    .line 172
    iget v2, v7, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v3, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneTopMargin:I

    .line 173
    invoke-virtual {v6, v10}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v4

    .line 174
    invoke-virtual {v1, v10}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v1

    const/4 v5, 0x1

    .line 175
    invoke-virtual {v4, v1, v2, v3, v5}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->connect(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;IIZ)Z

    goto :goto_14

    .line 176
    :cond_2d
    iget v1, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topToBottom:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_2e

    .line 177
    invoke-virtual {v8, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eqz v1, :cond_2e

    .line 178
    iget v2, v7, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v3, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneTopMargin:I

    .line 179
    invoke-virtual {v6, v10}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v4

    .line 180
    invoke-virtual {v1, v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v1

    const/4 v5, 0x1

    .line 181
    invoke-virtual {v4, v1, v2, v3, v5}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->connect(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;IIZ)Z

    .line 182
    :cond_2e
    :goto_14
    iget v1, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->bottomToTop:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_2f

    .line 183
    invoke-virtual {v8, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eqz v1, :cond_30

    .line 184
    iget v2, v7, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    iget v3, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneBottomMargin:I

    .line 185
    invoke-virtual {v6, v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v4

    .line 186
    invoke-virtual {v1, v10}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v1

    const/4 v5, 0x1

    .line 187
    invoke-virtual {v4, v1, v2, v3, v5}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->connect(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;IIZ)Z

    goto :goto_15

    .line 188
    :cond_2f
    iget v1, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->bottomToBottom:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_30

    .line 189
    invoke-virtual {v8, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eqz v1, :cond_30

    .line 190
    iget v2, v7, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    iget v3, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->goneBottomMargin:I

    .line 191
    invoke-virtual {v6, v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v4

    .line 192
    invoke-virtual {v1, v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v1

    const/4 v5, 0x1

    .line 193
    invoke-virtual {v4, v1, v2, v3, v5}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->connect(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;IIZ)Z

    .line 194
    :cond_30
    :goto_15
    iget v1, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->baselineToBaseline:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_31

    .line 195
    iget-object v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mChildrenByIds:Landroid/util/SparseArray;

    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 196
    iget v2, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->baselineToBaseline:I

    invoke-virtual {v8, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eqz v2, :cond_31

    if-eqz v1, :cond_31

    .line 197
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    instance-of v3, v3, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    if-eqz v3, :cond_31

    .line 198
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    const/4 v3, 0x1

    .line 199
    iput-boolean v3, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->needsBaseline:Z

    .line 200
    iput-boolean v3, v1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->needsBaseline:Z

    .line 201
    sget-object v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->BASELINE:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    invoke-virtual {v6, v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v5

    .line 202
    invoke-virtual {v2, v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v2

    const/4 v4, -0x1

    const/4 v8, 0x0

    .line 203
    invoke-virtual {v5, v2, v8, v4, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->connect(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;IIZ)Z

    .line 204
    iput-boolean v3, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->hasBaseline:Z

    .line 205
    iget-object v1, v1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->widget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 206
    iput-boolean v3, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->hasBaseline:Z

    .line 207
    invoke-virtual {v6, v10}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->reset()V

    .line 208
    invoke-virtual {v6, v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->reset()V

    :cond_31
    const/4 v1, 0x0

    cmpl-float v2, v20, v1

    if-ltz v2, :cond_32

    move/from16 v2, v20

    .line 209
    iput v2, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHorizontalBiasPercent:F

    .line 210
    :cond_32
    iget v2, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->verticalBias:F

    cmpl-float v3, v2, v1

    if-ltz v3, :cond_33

    .line 211
    iput v2, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVerticalBiasPercent:F

    :cond_33
    :goto_16
    if-eqz v19, :cond_35

    .line 212
    iget v1, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->editorAbsoluteX:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_34

    iget v3, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->editorAbsoluteY:I

    if-eq v3, v2, :cond_35

    .line 213
    :cond_34
    iget v2, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->editorAbsoluteY:I

    .line 214
    iput v1, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mX:I

    .line 215
    iput v2, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mY:I

    .line 216
    :cond_35
    iget-boolean v1, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->horizontalDimensionFixed:Z

    const/4 v2, -0x2

    if-nez v1, :cond_38

    .line 217
    iget v1, v7, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    const/4 v3, -0x1

    if-ne v1, v3, :cond_37

    .line 218
    iget-boolean v1, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->constrainedWidth:Z

    if-eqz v1, :cond_36

    .line 219
    iget-object v1, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v3, 0x3

    const/4 v4, 0x0

    aput v3, v1, v4

    goto :goto_17

    :cond_36
    const/4 v4, 0x0

    .line 220
    iget-object v1, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v3, 0x4

    aput v3, v1, v4

    .line 221
    :goto_17
    invoke-virtual {v6, v14}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v1

    iget v3, v7, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iput v3, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mMargin:I

    .line 222
    invoke-virtual {v6, v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v1

    iget v3, v7, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iput v3, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mMargin:I

    goto :goto_18

    :cond_37
    const/4 v4, 0x0

    .line 223
    iget-object v1, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v3, 0x3

    aput v3, v1, v4

    .line 224
    invoke-virtual {v6, v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setWidth(I)V

    goto :goto_18

    :cond_38
    const/4 v4, 0x0

    .line 225
    iget-object v1, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v3, 0x1

    aput v3, v1, v4

    .line 226
    iget v1, v7, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    invoke-virtual {v6, v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setWidth(I)V

    .line 227
    iget v1, v7, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    if-ne v1, v2, :cond_39

    .line 228
    iget-object v1, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v3, 0x2

    aput v3, v1, v4

    .line 229
    :cond_39
    :goto_18
    iget-boolean v1, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->verticalDimensionFixed:Z

    if-nez v1, :cond_3c

    .line 230
    iget v1, v7, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    const/4 v3, -0x1

    if-ne v1, v3, :cond_3b

    .line 231
    iget-boolean v1, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->constrainedHeight:Z

    if-eqz v1, :cond_3a

    .line 232
    iget-object v1, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v2, 0x3

    const/4 v4, 0x1

    aput v2, v1, v4

    goto :goto_19

    :cond_3a
    const/4 v4, 0x1

    .line 233
    iget-object v1, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v2, 0x4

    aput v2, v1, v4

    .line 234
    :goto_19
    invoke-virtual {v6, v10}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v1

    iget v2, v7, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iput v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mMargin:I

    .line 235
    invoke-virtual {v6, v15}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v1

    iget v2, v7, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    iput v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mMargin:I

    goto :goto_1a

    :cond_3b
    const/4 v4, 0x1

    .line 236
    iget-object v1, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v2, 0x3

    aput v2, v1, v4

    const/4 v1, 0x0

    .line 237
    invoke-virtual {v6, v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setHeight(I)V

    goto :goto_1a

    :cond_3c
    const/4 v3, -0x1

    const/4 v4, 0x1

    .line 238
    iget-object v1, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aput v4, v1, v4

    .line 239
    iget v1, v7, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    invoke-virtual {v6, v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setHeight(I)V

    .line 240
    iget v1, v7, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    if-ne v1, v2, :cond_3d

    .line 241
    iget-object v1, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v2, 0x2

    aput v2, v1, v4

    .line 242
    :cond_3d
    :goto_1a
    iget-object v1, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;

    if-eqz v1, :cond_45

    .line 243
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_3e

    const/4 v2, 0x0

    .line 244
    iput v2, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mDimensionRatio:F

    goto/16 :goto_1e

    .line 245
    :cond_3e
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v4, 0x2c

    .line 246
    invoke-virtual {v1, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-lez v4, :cond_41

    add-int/lit8 v5, v2, -0x1

    if-ge v4, v5, :cond_41

    const/4 v5, 0x0

    .line 247
    invoke-virtual {v1, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    const-string v5, "W"

    .line 248
    invoke-virtual {v8, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3f

    const/4 v5, 0x0

    goto :goto_1b

    :cond_3f
    const-string v5, "H"

    .line 249
    invoke-virtual {v8, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_40

    const/4 v5, 0x1

    goto :goto_1b

    :cond_40
    move v5, v3

    :goto_1b
    add-int/lit8 v9, v4, 0x1

    goto :goto_1c

    :cond_41
    move v5, v3

    const/4 v9, 0x0

    :goto_1c
    const/16 v4, 0x3a

    .line 250
    invoke-virtual {v1, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-ltz v4, :cond_43

    add-int/lit8 v2, v2, -0x1

    if-ge v4, v2, :cond_43

    .line 251
    invoke-virtual {v1, v9, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v4, v4, 0x1

    .line 252
    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 253
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_44

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_44

    .line 254
    :try_start_1
    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    .line 255
    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    const/4 v4, 0x0

    cmpl-float v8, v2, v4

    if-lez v8, :cond_44

    cmpl-float v8, v1, v4

    if-lez v8, :cond_44

    const/4 v4, 0x1

    if-ne v5, v4, :cond_42

    div-float/2addr v1, v2

    .line 256
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    goto :goto_1d

    :cond_42
    div-float/2addr v2, v1

    .line 257
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v1
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1d

    .line 258
    :cond_43
    invoke-virtual {v1, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 259
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_44

    .line 260
    :try_start_2
    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1d

    :catch_1
    :cond_44
    const/4 v1, 0x0

    :goto_1d
    const/4 v2, 0x0

    cmpl-float v4, v1, v2

    if-lez v4, :cond_45

    .line 261
    iput v1, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mDimensionRatio:F

    .line 262
    iput v5, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mDimensionRatioSide:I

    .line 263
    :cond_45
    :goto_1e
    iget v1, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->horizontalWeight:F

    .line 264
    iget-object v2, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWeight:[F

    const/4 v9, 0x0

    aput v1, v2, v9

    .line 265
    iget v1, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->verticalWeight:F

    const/4 v4, 0x1

    .line 266
    aput v1, v2, v4

    .line 267
    iget v1, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->horizontalChainStyle:I

    .line 268
    iput v1, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHorizontalChainStyle:I

    .line 269
    iget v1, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->verticalChainStyle:I

    .line 270
    iput v1, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVerticalChainStyle:I

    .line 271
    iget v1, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintDefaultWidth:I

    iget v2, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintMinWidth:I

    iget v5, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintMaxWidth:I

    iget v8, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintPercentWidth:F

    .line 272
    iput v1, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintDefaultWidth:I

    .line 273
    iput v2, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintMinWidth:I

    const v2, 0x7fffffff

    if-ne v5, v2, :cond_46

    move v5, v9

    .line 274
    :cond_46
    iput v5, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintMaxWidth:I

    .line 275
    iput v8, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintPercentWidth:F

    const/4 v5, 0x0

    cmpl-float v10, v8, v5

    const/high16 v5, 0x3f800000    # 1.0f

    if-lez v10, :cond_47

    cmpg-float v8, v8, v5

    if-gez v8, :cond_47

    if-nez v1, :cond_47

    const/4 v1, 0x2

    .line 276
    iput v1, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintDefaultWidth:I

    .line 277
    :cond_47
    iget v1, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintDefaultHeight:I

    iget v8, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintMinHeight:I

    iget v10, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintMaxHeight:I

    iget v7, v7, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->matchConstraintPercentHeight:F

    .line 278
    iput v1, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintDefaultHeight:I

    .line 279
    iput v8, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintMinHeight:I

    if-ne v10, v2, :cond_48

    move v10, v9

    .line 280
    :cond_48
    iput v10, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintMaxHeight:I

    .line 281
    iput v7, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintPercentHeight:F

    const/4 v2, 0x0

    cmpl-float v2, v7, v2

    if-lez v2, :cond_49

    cmpg-float v2, v7, v5

    if-gez v2, :cond_49

    if-nez v1, :cond_49

    const/4 v1, 0x2

    .line 282
    iput v1, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintDefaultHeight:I

    goto :goto_1f

    :cond_49
    const/4 v1, 0x2

    :goto_1f
    add-int/lit8 v2, v18, 0x1

    move v4, v1

    move v9, v2

    move/from16 v5, v16

    move/from16 v1, v17

    move/from16 v3, v19

    goto/16 :goto_f

    :cond_4a
    move/from16 v17, v1

    return v17
.end method
