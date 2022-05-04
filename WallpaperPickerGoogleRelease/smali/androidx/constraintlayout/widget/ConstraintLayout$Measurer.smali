.class public Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measurer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/widget/ConstraintLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Measurer"
.end annotation


# instance fields
.field public layout:Landroidx/constraintlayout/widget/ConstraintLayout;


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroidx/constraintlayout/widget/ConstraintLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;->layout:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-void
.end method


# virtual methods
.method public final measure(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;)V
    .locals 17
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongCall"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    if-nez v1, :cond_0

    return-void

    .line 1
    :cond_0
    iget v3, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    const/16 v4, 0x8

    const/4 v5, 0x0

    if-ne v3, v4, :cond_1

    .line 2
    iput v5, v2, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->measuredWidth:I

    .line 3
    iput v5, v2, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->measuredHeight:I

    .line 4
    iput v5, v2, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->measuredBaseline:I

    return-void

    .line 5
    :cond_1
    iget v3, v2, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->horizontalBehavior:I

    .line 6
    iget v4, v2, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->verticalBehavior:I

    .line 7
    iget v6, v2, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->horizontalDimension:I

    .line 8
    iget v7, v2, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->verticalDimension:I

    .line 9
    iget-object v8, v0, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;->layout:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v8}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v8

    iget-object v9, v0, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;->layout:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v9}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v9

    add-int/2addr v9, v8

    .line 10
    iget-object v8, v0, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;->layout:Landroidx/constraintlayout/widget/ConstraintLayout;

    sget v10, Landroidx/constraintlayout/widget/ConstraintLayout;->$r8$clinit:I

    .line 11
    invoke-virtual {v8}, Landroidx/constraintlayout/widget/ConstraintLayout;->getPaddingWidth()I

    move-result v8

    .line 12
    invoke-static {v3}, Landroidx/constraintlayout/solver/SolverVariable$Type$r8$EnumUnboxingUtility;->$enumboxing$ordinal(I)I

    move-result v10

    const/4 v11, 0x2

    const/4 v12, -0x1

    const/4 v13, 0x3

    const/4 v14, -0x2

    const/4 v15, 0x1

    if-eqz v10, :cond_a

    if-eq v10, v15, :cond_9

    if-eq v10, v11, :cond_5

    if-eq v10, v13, :cond_2

    move v6, v5

    move v8, v6

    goto :goto_4

    .line 13
    :cond_2
    iget-object v6, v0, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;->layout:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 14
    iget v6, v6, Landroidx/constraintlayout/widget/ConstraintLayout;->mOnMeasureWidthMeasureSpec:I

    .line 15
    iget-object v10, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v10, :cond_3

    .line 16
    iget v10, v10, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mMargin:I

    add-int/2addr v10, v5

    goto :goto_0

    :cond_3
    move v10, v5

    .line 17
    :goto_0
    iget-object v13, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v13, :cond_4

    .line 18
    iget v13, v13, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mMargin:I

    add-int/2addr v10, v13

    :cond_4
    add-int/2addr v8, v10

    .line 19
    invoke-static {v6, v8, v12}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v6

    goto :goto_3

    .line 20
    :cond_5
    iget-object v6, v0, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;->layout:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 21
    iget v6, v6, Landroidx/constraintlayout/widget/ConstraintLayout;->mOnMeasureWidthMeasureSpec:I

    .line 22
    invoke-static {v6, v8, v14}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v6

    .line 23
    iget v8, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintDefaultWidth:I

    if-ne v8, v15, :cond_6

    move v8, v15

    goto :goto_1

    :cond_6
    move v8, v5

    .line 24
    :goto_1
    iget-boolean v10, v2, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->useDeprecated:Z

    if-eqz v10, :cond_8

    if-eqz v8, :cond_7

    if-eqz v8, :cond_8

    iget-object v8, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->wrapMeasure:[I

    aget v8, v8, v5

    .line 25
    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v10

    if-eq v8, v10, :cond_8

    .line 26
    :cond_7
    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v6

    const/high16 v10, 0x40000000    # 2.0f

    invoke-static {v6, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    goto :goto_3

    :cond_8
    const/high16 v10, 0x40000000    # 2.0f

    goto :goto_2

    :cond_9
    const/high16 v10, 0x40000000    # 2.0f

    .line 27
    iget-object v6, v0, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;->layout:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 28
    iget v6, v6, Landroidx/constraintlayout/widget/ConstraintLayout;->mOnMeasureWidthMeasureSpec:I

    .line 29
    invoke-static {v6, v8, v14}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v6

    :goto_2
    move v8, v15

    goto :goto_4

    :cond_a
    const/high16 v10, 0x40000000    # 2.0f

    .line 30
    invoke-static {v6, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    :goto_3
    move v8, v5

    .line 31
    :goto_4
    invoke-static {v4}, Landroidx/constraintlayout/solver/SolverVariable$Type$r8$EnumUnboxingUtility;->$enumboxing$ordinal(I)I

    move-result v10

    if-eqz v10, :cond_13

    if-eq v10, v15, :cond_12

    if-eq v10, v11, :cond_e

    const/4 v7, 0x3

    if-eq v10, v7, :cond_b

    move v0, v5

    move v9, v7

    move v7, v0

    goto/16 :goto_a

    .line 32
    :cond_b
    iget-object v0, v0, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;->layout:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 33
    iget v0, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOnMeasureHeightMeasureSpec:I

    .line 34
    iget-object v7, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v7, :cond_c

    .line 35
    iget-object v7, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget v7, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mMargin:I

    add-int/2addr v7, v5

    goto :goto_5

    :cond_c
    move v7, v5

    .line 36
    :goto_5
    iget-object v10, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v10, :cond_d

    .line 37
    iget-object v10, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget v10, v10, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mMargin:I

    add-int/2addr v7, v10

    :cond_d
    add-int/2addr v9, v7

    .line 38
    invoke-static {v0, v9, v12}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v0

    goto :goto_8

    .line 39
    :cond_e
    iget-object v0, v0, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;->layout:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 40
    iget v0, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOnMeasureHeightMeasureSpec:I

    .line 41
    invoke-static {v0, v9, v14}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v0

    .line 42
    iget v7, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintDefaultHeight:I

    if-ne v7, v15, :cond_f

    move v7, v15

    goto :goto_6

    :cond_f
    move v7, v5

    .line 43
    :goto_6
    iget-boolean v9, v2, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->useDeprecated:Z

    if-eqz v9, :cond_11

    if-eqz v7, :cond_10

    if-eqz v7, :cond_11

    iget-object v7, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->wrapMeasure:[I

    aget v7, v7, v15

    .line 44
    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v9

    if-eq v7, v9, :cond_11

    .line 45
    :cond_10
    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v0

    const/high16 v10, 0x40000000    # 2.0f

    invoke-static {v0, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    goto :goto_8

    :cond_11
    const/high16 v10, 0x40000000    # 2.0f

    goto :goto_7

    :cond_12
    const/high16 v10, 0x40000000    # 2.0f

    .line 46
    iget-object v0, v0, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;->layout:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 47
    iget v0, v0, Landroidx/constraintlayout/widget/ConstraintLayout;->mOnMeasureHeightMeasureSpec:I

    .line 48
    invoke-static {v0, v9, v14}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v0

    :goto_7
    move v7, v15

    goto :goto_9

    :cond_13
    const/high16 v10, 0x40000000    # 2.0f

    .line 49
    invoke-static {v7, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    :goto_8
    move v7, v5

    :goto_9
    const/4 v9, 0x3

    :goto_a
    if-ne v3, v9, :cond_14

    move v10, v15

    goto :goto_b

    :cond_14
    move v10, v5

    :goto_b
    if-ne v4, v9, :cond_15

    move v9, v15

    goto :goto_c

    :cond_15
    move v9, v5

    :goto_c
    const/4 v11, 0x4

    if-eq v4, v11, :cond_17

    if-ne v4, v15, :cond_16

    goto :goto_d

    :cond_16
    move v4, v5

    goto :goto_e

    :cond_17
    :goto_d
    move v4, v15

    :goto_e
    if-eq v3, v11, :cond_19

    if-ne v3, v15, :cond_18

    goto :goto_f

    :cond_18
    move v3, v5

    goto :goto_10

    :cond_19
    :goto_f
    move v3, v15

    :goto_10
    const/4 v11, 0x0

    if-eqz v10, :cond_1a

    .line 50
    iget v13, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mDimensionRatio:F

    cmpl-float v13, v13, v11

    if-lez v13, :cond_1a

    move v13, v15

    goto :goto_11

    :cond_1a
    move v13, v5

    :goto_11
    if-eqz v9, :cond_1b

    .line 51
    iget v14, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mDimensionRatio:F

    cmpl-float v11, v14, v11

    if-lez v11, :cond_1b

    move v11, v15

    goto :goto_12

    :cond_1b
    move v11, v5

    .line 52
    :goto_12
    iget-object v14, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCompanionWidget:Ljava/lang/Object;

    .line 53
    check-cast v14, Landroid/view/View;

    .line 54
    invoke-virtual {v14}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v16

    move-object/from16 v12, v16

    check-cast v12, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    .line 55
    iget-boolean v15, v2, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->useDeprecated:Z

    if-nez v15, :cond_1d

    if-eqz v10, :cond_1d

    iget v10, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintDefaultWidth:I

    if-nez v10, :cond_1d

    if-eqz v9, :cond_1d

    iget v9, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintDefaultHeight:I

    if-eqz v9, :cond_1c

    goto :goto_13

    :cond_1c
    move v7, v5

    move v8, v7

    move v15, v8

    goto/16 :goto_18

    .line 56
    :cond_1d
    :goto_13
    instance-of v9, v14, Landroidx/constraintlayout/widget/VirtualLayout;

    if-eqz v9, :cond_1e

    instance-of v9, v1, Landroidx/constraintlayout/solver/widgets/VirtualLayout;

    if-eqz v9, :cond_1e

    .line 57
    move-object v9, v1

    check-cast v9, Landroidx/constraintlayout/solver/widgets/VirtualLayout;

    .line 58
    move-object v9, v14

    check-cast v9, Landroidx/constraintlayout/widget/VirtualLayout;

    goto :goto_14

    .line 59
    :cond_1e
    invoke-virtual {v14, v6, v0}, Landroid/view/View;->measure(II)V

    .line 60
    :goto_14
    invoke-virtual {v14}, Landroid/view/View;->getMeasuredWidth()I

    move-result v9

    .line 61
    invoke-virtual {v14}, Landroid/view/View;->getMeasuredHeight()I

    move-result v10

    .line 62
    invoke-virtual {v14}, Landroid/view/View;->getBaseline()I

    move-result v15

    if-eqz v8, :cond_1f

    .line 63
    iget-object v8, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->wrapMeasure:[I

    aput v9, v8, v5

    :cond_1f
    if-eqz v7, :cond_20

    .line 64
    iget-object v7, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->wrapMeasure:[I

    const/4 v8, 0x1

    aput v10, v7, v8

    .line 65
    :cond_20
    iget v7, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintMinWidth:I

    if-lez v7, :cond_21

    .line 66
    invoke-static {v7, v9}, Ljava/lang/Math;->max(II)I

    move-result v7

    goto :goto_15

    :cond_21
    move v7, v9

    .line 67
    :goto_15
    iget v8, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintMaxWidth:I

    if-lez v8, :cond_22

    .line 68
    invoke-static {v8, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 69
    :cond_22
    iget v8, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintMinHeight:I

    if-lez v8, :cond_23

    .line 70
    invoke-static {v8, v10}, Ljava/lang/Math;->max(II)I

    move-result v8

    goto :goto_16

    :cond_23
    move v8, v10

    .line 71
    :goto_16
    iget v5, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintMaxHeight:I

    if-lez v5, :cond_24

    .line 72
    invoke-static {v5, v8}, Ljava/lang/Math;->min(II)I

    move-result v8

    :cond_24
    const/high16 v5, 0x3f000000    # 0.5f

    if-eqz v13, :cond_25

    if-eqz v4, :cond_25

    .line 73
    iget v3, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mDimensionRatio:F

    int-to-float v4, v8

    mul-float/2addr v4, v3

    add-float/2addr v4, v5

    float-to-int v7, v4

    goto :goto_17

    :cond_25
    if-eqz v11, :cond_26

    if-eqz v3, :cond_26

    .line 74
    iget v3, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mDimensionRatio:F

    int-to-float v4, v7

    div-float/2addr v4, v3

    add-float/2addr v4, v5

    float-to-int v8, v4

    :cond_26
    :goto_17
    if-ne v9, v7, :cond_27

    if-eq v10, v8, :cond_2a

    :cond_27
    const/high16 v3, 0x40000000    # 2.0f

    if-eq v9, v7, :cond_28

    .line 75
    invoke-static {v7, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    :cond_28
    if-eq v10, v8, :cond_29

    .line 76
    invoke-static {v8, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 77
    :cond_29
    invoke-virtual {v14, v6, v0}, Landroid/view/View;->measure(II)V

    .line 78
    invoke-virtual {v14}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    .line 79
    invoke-virtual {v14}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    .line 80
    invoke-virtual {v14}, Landroid/view/View;->getBaseline()I

    move-result v15

    :cond_2a
    :goto_18
    const/4 v0, -0x1

    if-eq v15, v0, :cond_2b

    const/4 v0, 0x1

    goto :goto_19

    :cond_2b
    const/4 v0, 0x0

    .line 81
    :goto_19
    iget v3, v2, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->horizontalDimension:I

    if-ne v7, v3, :cond_2d

    iget v3, v2, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->verticalDimension:I

    if-eq v8, v3, :cond_2c

    goto :goto_1a

    :cond_2c
    const/4 v5, 0x0

    goto :goto_1b

    :cond_2d
    :goto_1a
    const/4 v5, 0x1

    :goto_1b
    iput-boolean v5, v2, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->measuredNeedsSolverPass:Z

    .line 82
    iget-boolean v3, v12, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->needsBaseline:Z

    if-eqz v3, :cond_2e

    const/4 v0, 0x1

    :cond_2e
    if-eqz v0, :cond_2f

    const/4 v3, -0x1

    if-eq v15, v3, :cond_2f

    .line 83
    iget v1, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBaselineDistance:I

    if-eq v1, v15, :cond_2f

    const/4 v1, 0x1

    .line 84
    iput-boolean v1, v2, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->measuredNeedsSolverPass:Z

    .line 85
    :cond_2f
    iput v7, v2, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->measuredWidth:I

    .line 86
    iput v8, v2, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->measuredHeight:I

    .line 87
    iput-boolean v0, v2, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->measuredHasBaseline:Z

    .line 88
    iput v15, v2, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->measuredBaseline:I

    return-void
.end method
