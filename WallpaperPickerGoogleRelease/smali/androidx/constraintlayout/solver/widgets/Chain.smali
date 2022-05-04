.class public Landroidx/constraintlayout/solver/widgets/Chain;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static applyChainConstraints(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;Landroidx/constraintlayout/solver/LinearSystem;I)V
    .locals 39

    move-object/from16 v0, p0

    move-object/from16 v10, p1

    const/4 v11, 0x2

    if-nez p2, :cond_0

    .line 1
    iget v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsSize:I

    .line 2
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsArray:[Landroidx/constraintlayout/solver/widgets/ChainHead;

    move v13, v1

    move-object v14, v2

    const/4 v15, 0x0

    goto :goto_0

    .line 3
    :cond_0
    iget v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsSize:I

    .line 4
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsArray:[Landroidx/constraintlayout/solver/widgets/ChainHead;

    move v13, v1

    move-object v14, v2

    move v15, v11

    :goto_0
    const/4 v9, 0x0

    :goto_1
    if-ge v9, v13, :cond_6c

    .line 5
    aget-object v1, v14, v9

    .line 6
    iget-boolean v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mDefined:Z

    const/16 v16, 0x0

    const/4 v3, 0x3

    const/16 v8, 0x8

    const/4 v5, 0x1

    if-nez v2, :cond_18

    .line 7
    iget v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mOrientation:I

    mul-int/2addr v2, v11

    .line 8
    iget-object v6, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mFirst:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    move-object v7, v6

    const/16 v17, 0x0

    :goto_2
    if-nez v17, :cond_13

    .line 9
    iget v12, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsCount:I

    add-int/2addr v12, v5

    iput v12, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsCount:I

    .line 10
    iget-object v12, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mNextChainWidget:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    iget v4, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mOrientation:I

    aput-object v16, v12, v4

    .line 11
    iget-object v12, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListNextMatchConstraintsWidget:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    aput-object v16, v12, v4

    .line 12
    iget v12, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    if-eq v12, v8, :cond_e

    .line 13
    iget v12, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mVisibleWidgets:I

    add-int/2addr v12, v5

    iput v12, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mVisibleWidgets:I

    .line 14
    invoke-virtual {v6, v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getDimensionBehaviour$enumunboxing$(I)I

    move-result v4

    if-eq v4, v3, :cond_3

    .line 15
    iget v4, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mTotalSize:I

    iget v12, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mOrientation:I

    if-nez v12, :cond_1

    .line 16
    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v12

    goto :goto_3

    :cond_1
    if-ne v12, v5, :cond_2

    .line 17
    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v12

    goto :goto_3

    :cond_2
    const/4 v12, 0x0

    :goto_3
    add-int/2addr v4, v12

    .line 18
    iput v4, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mTotalSize:I

    .line 19
    :cond_3
    iget v4, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mTotalSize:I

    iget-object v12, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v12, v12, v2

    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v12

    add-int/2addr v12, v4

    iput v12, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mTotalSize:I

    .line 20
    iget-object v4, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v20, v2, 0x1

    aget-object v4, v4, v20

    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    add-int/2addr v4, v12

    iput v4, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mTotalSize:I

    .line 21
    iget v4, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mTotalMargins:I

    iget-object v12, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v12, v12, v2

    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v12

    add-int/2addr v12, v4

    iput v12, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mTotalMargins:I

    .line 22
    iget-object v4, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v4, v4, v20

    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    add-int/2addr v4, v12

    iput v4, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mTotalMargins:I

    .line 23
    iget-object v4, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mFirstVisibleWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-nez v4, :cond_4

    .line 24
    iput-object v6, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mFirstVisibleWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 25
    :cond_4
    iput-object v6, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mLastVisibleWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 26
    iget-object v4, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    iget v12, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mOrientation:I

    aget v8, v4, v12

    if-ne v8, v3, :cond_e

    .line 27
    iget-object v8, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedMatchConstraintDefault:[I

    aget v21, v8, v12

    if-eqz v21, :cond_5

    aget v5, v8, v12

    if-eq v5, v3, :cond_5

    aget v5, v8, v12

    if-ne v5, v11, :cond_e

    .line 28
    :cond_5
    iget v5, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsMatchCount:I

    const/16 v21, 0x1

    add-int/lit8 v5, v5, 0x1

    iput v5, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsMatchCount:I

    .line 29
    iget-object v5, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWeight:[F

    aget v22, v5, v12

    const/16 v19, 0x0

    cmpl-float v23, v22, v19

    if-lez v23, :cond_6

    .line 30
    iget v11, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mTotalWeight:F

    aget v5, v5, v12

    add-float/2addr v11, v5

    iput v11, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mTotalWeight:F

    .line 31
    :cond_6
    iget v5, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    const/16 v11, 0x8

    if-eq v5, v11, :cond_8

    .line 32
    aget v4, v4, v12

    if-ne v4, v3, :cond_8

    aget v4, v8, v12

    if-eqz v4, :cond_7

    aget v4, v8, v12

    if-ne v4, v3, :cond_8

    :cond_7
    const/4 v4, 0x1

    goto :goto_4

    :cond_8
    const/4 v4, 0x0

    :goto_4
    if-eqz v4, :cond_b

    const/4 v4, 0x0

    cmpg-float v5, v22, v4

    if-gez v5, :cond_9

    const/4 v4, 0x1

    .line 33
    iput-boolean v4, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHasUndefinedWeights:Z

    goto :goto_5

    :cond_9
    const/4 v4, 0x1

    .line 34
    iput-boolean v4, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHasDefinedWeights:Z

    .line 35
    :goto_5
    iget-object v4, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWeightedMatchConstraintsWidgets:Ljava/util/ArrayList;

    if-nez v4, :cond_a

    .line 36
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWeightedMatchConstraintsWidgets:Ljava/util/ArrayList;

    .line 37
    :cond_a
    iget-object v4, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWeightedMatchConstraintsWidgets:Ljava/util/ArrayList;

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    :cond_b
    iget-object v4, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mFirstMatchConstraintWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-nez v4, :cond_c

    .line 39
    iput-object v6, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mFirstMatchConstraintWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 40
    :cond_c
    iget-object v4, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mLastMatchConstraintWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eqz v4, :cond_d

    .line 41
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListNextMatchConstraintsWidget:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    iget v5, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mOrientation:I

    aput-object v6, v4, v5

    .line 42
    :cond_d
    iput-object v6, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mLastMatchConstraintWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    :cond_e
    if-eq v7, v6, :cond_f

    .line 43
    iget-object v4, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mNextChainWidget:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    iget v5, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mOrientation:I

    aput-object v6, v4, v5

    .line 44
    :cond_f
    iget-object v4, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v5, v2, 0x1

    aget-object v4, v4, v5

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v4, :cond_10

    .line 45
    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 46
    iget-object v5, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v7, v5, v2

    iget-object v7, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v7, :cond_10

    aget-object v5, v5, v2

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eq v5, v6, :cond_11

    :cond_10
    move-object/from16 v4, v16

    :cond_11
    if-eqz v4, :cond_12

    goto :goto_6

    :cond_12
    move-object v4, v6

    const/16 v17, 0x1

    :goto_6
    move-object v7, v6

    const/4 v5, 0x1

    const/16 v8, 0x8

    const/4 v11, 0x2

    move-object v6, v4

    goto/16 :goto_2

    .line 47
    :cond_13
    iget-object v4, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mFirstVisibleWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eqz v4, :cond_14

    .line 48
    iget v5, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mTotalSize:I

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v4, v4, v2

    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    sub-int/2addr v5, v4

    iput v5, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mTotalSize:I

    .line 49
    :cond_14
    iget-object v4, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mLastVisibleWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eqz v4, :cond_15

    .line 50
    iget v5, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mTotalSize:I

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v2, v2, 0x1

    aget-object v2, v4, v2

    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v2

    sub-int/2addr v5, v2

    iput v5, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mTotalSize:I

    .line 51
    :cond_15
    iput-object v6, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mLast:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 52
    iget v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mOrientation:I

    if-nez v2, :cond_16

    iget-boolean v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mIsRtl:Z

    if-eqz v2, :cond_16

    .line 53
    iput-object v6, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHead:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    goto :goto_7

    .line 54
    :cond_16
    iget-object v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mFirst:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    iput-object v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHead:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 55
    :goto_7
    iget-boolean v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHasDefinedWeights:Z

    if-eqz v2, :cond_17

    iget-boolean v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHasUndefinedWeights:Z

    if-eqz v2, :cond_17

    const/4 v2, 0x1

    goto :goto_8

    :cond_17
    const/4 v2, 0x0

    :goto_8
    iput-boolean v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHasComplexMatchWeights:Z

    const/4 v2, 0x1

    goto :goto_9

    :cond_18
    move v2, v5

    .line 56
    :goto_9
    iput-boolean v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mDefined:Z

    .line 57
    iget-object v11, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mFirst:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 58
    iget-object v12, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mLast:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 59
    iget-object v8, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mFirstVisibleWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 60
    iget-object v7, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mLastVisibleWidget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 61
    iget-object v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHead:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 62
    iget v4, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mTotalWeight:F

    .line 63
    iget-object v5, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aget v5, v5, p2

    const/4 v6, 0x2

    if-ne v5, v6, :cond_19

    const/4 v5, 0x1

    goto :goto_a

    :cond_19
    const/4 v5, 0x0

    :goto_a
    if-nez p2, :cond_1c

    .line 64
    iget v3, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHorizontalChainStyle:I

    const/4 v6, 0x1

    if-nez v3, :cond_1a

    const/16 v21, 0x1

    goto :goto_b

    :cond_1a
    const/16 v21, 0x0

    :goto_b
    if-ne v3, v6, :cond_1b

    move/from16 v22, v6

    const/4 v6, 0x2

    goto :goto_c

    :cond_1b
    const/4 v6, 0x2

    const/16 v22, 0x0

    :goto_c
    move/from16 v23, v21

    if-ne v3, v6, :cond_1f

    goto :goto_f

    .line 65
    :cond_1c
    iget v3, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVerticalChainStyle:I

    const/4 v6, 0x1

    if-nez v3, :cond_1d

    const/16 v23, 0x1

    goto :goto_d

    :cond_1d
    const/16 v23, 0x0

    :goto_d
    if-ne v3, v6, :cond_1e

    const/4 v6, 0x2

    const/16 v22, 0x1

    goto :goto_e

    :cond_1e
    const/4 v6, 0x2

    const/16 v22, 0x0

    :goto_e
    if-ne v3, v6, :cond_1f

    :goto_f
    const/4 v3, 0x1

    goto :goto_10

    :cond_1f
    const/4 v3, 0x0

    :goto_10
    move/from16 v25, v4

    move-object v6, v11

    const/16 v24, 0x0

    :goto_11
    if-nez v24, :cond_2c

    .line 66
    iget-object v4, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v4, v4, v15

    if-eqz v3, :cond_20

    const/16 v29, 0x1

    goto :goto_12

    :cond_20
    const/16 v29, 0x4

    .line 67
    :goto_12
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v30

    move/from16 v31, v9

    .line 68
    iget-object v9, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aget v9, v9, p2

    move/from16 v32, v13

    const/4 v13, 0x3

    if-ne v9, v13, :cond_21

    iget-object v9, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedMatchConstraintDefault:[I

    aget v9, v9, p2

    if-nez v9, :cond_21

    const/4 v9, 0x1

    goto :goto_13

    :cond_21
    const/4 v9, 0x0

    .line 69
    :goto_13
    iget-object v13, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v13, :cond_22

    if-eq v6, v11, :cond_22

    .line 70
    invoke-virtual {v13}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v13

    add-int v30, v13, v30

    :cond_22
    move/from16 v13, v30

    if-eqz v3, :cond_23

    if-eq v6, v11, :cond_23

    if-eq v6, v8, :cond_23

    move-object/from16 v30, v14

    const/16 v29, 0x5

    goto :goto_14

    :cond_23
    move-object/from16 v30, v14

    .line 71
    :goto_14
    iget-object v14, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v14, :cond_26

    if-ne v6, v8, :cond_24

    move-object/from16 v33, v2

    .line 72
    iget-object v2, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v14, v14, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    move-object/from16 v34, v11

    const/4 v11, 0x6

    invoke-virtual {v10, v2, v14, v13, v11}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_15

    :cond_24
    move-object/from16 v33, v2

    move-object/from16 v34, v11

    .line 73
    iget-object v2, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v11, v14, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    const/4 v14, 0x7

    invoke-virtual {v10, v2, v11, v13, v14}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    :goto_15
    if-eqz v9, :cond_25

    if-nez v3, :cond_25

    const/4 v2, 0x5

    goto :goto_16

    :cond_25
    move/from16 v2, v29

    .line 74
    :goto_16
    iget-object v9, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    invoke-virtual {v10, v9, v4, v13, v2}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    goto :goto_17

    :cond_26
    move-object/from16 v33, v2

    move-object/from16 v34, v11

    :goto_17
    if-eqz v5, :cond_28

    .line 75
    iget v2, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    const/16 v4, 0x8

    if-eq v2, v4, :cond_27

    .line 76
    iget-object v2, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aget v2, v2, p2

    const/4 v4, 0x3

    if-ne v2, v4, :cond_27

    .line 77
    iget-object v2, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v4, v15, 0x1

    aget-object v4, v2, v4

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    aget-object v2, v2, v15

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    const/4 v9, 0x5

    const/4 v11, 0x0

    invoke-virtual {v10, v4, v2, v11, v9}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_18

    :cond_27
    const/4 v11, 0x0

    .line 78
    :goto_18
    iget-object v2, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v2, v2, v15

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v4, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v4, v4, v15

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    const/4 v9, 0x7

    invoke-virtual {v10, v2, v4, v11, v9}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 79
    :cond_28
    iget-object v2, v6, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v4, v15, 0x1

    aget-object v2, v2, v4

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v2, :cond_29

    .line 80
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 81
    iget-object v4, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v9, v4, v15

    iget-object v9, v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v9, :cond_29

    aget-object v4, v4, v15

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eq v4, v6, :cond_2a

    :cond_29
    move-object/from16 v2, v16

    :cond_2a
    if-eqz v2, :cond_2b

    move-object v6, v2

    goto :goto_19

    :cond_2b
    const/16 v24, 0x1

    :goto_19
    move-object/from16 v14, v30

    move/from16 v9, v31

    move/from16 v13, v32

    move-object/from16 v2, v33

    move-object/from16 v11, v34

    goto/16 :goto_11

    :cond_2c
    move-object/from16 v33, v2

    move/from16 v31, v9

    move-object/from16 v34, v11

    move/from16 v32, v13

    move-object/from16 v30, v14

    if-eqz v7, :cond_30

    .line 82
    iget-object v2, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v4, v15, 0x1

    aget-object v2, v2, v4

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v2, :cond_30

    .line 83
    iget-object v2, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v2, v2, v4

    .line 84
    iget-object v6, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aget v6, v6, p2

    const/4 v9, 0x3

    if-ne v6, v9, :cond_2d

    iget-object v6, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedMatchConstraintDefault:[I

    aget v6, v6, p2

    if-nez v6, :cond_2d

    const/4 v6, 0x1

    goto :goto_1a

    :cond_2d
    const/4 v6, 0x0

    :goto_1a
    if-eqz v6, :cond_2e

    if-nez v3, :cond_2e

    .line 85
    iget-object v6, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v9, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-ne v9, v0, :cond_2e

    .line 86
    iget-object v9, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v11

    neg-int v11, v11

    const/4 v13, 0x5

    invoke-virtual {v10, v9, v6, v11, v13}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    goto :goto_1b

    :cond_2e
    const/4 v13, 0x5

    if-eqz v3, :cond_2f

    .line 87
    iget-object v6, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v9, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-ne v9, v0, :cond_2f

    .line 88
    iget-object v9, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v11

    neg-int v11, v11

    const/4 v14, 0x4

    invoke-virtual {v10, v9, v6, v11, v14}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    .line 89
    :cond_2f
    :goto_1b
    iget-object v6, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v9, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v4, v9, v4

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 90
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v2

    neg-int v2, v2

    const/4 v9, 0x6

    .line 91
    invoke-virtual {v10, v6, v4, v2, v9}, Landroidx/constraintlayout/solver/LinearSystem;->addLowerThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_1c

    :cond_30
    const/4 v13, 0x5

    :goto_1c
    if-eqz v5, :cond_31

    .line 92
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v4, v15, 0x1

    aget-object v2, v2, v4

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v5, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v6, v5, v4

    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    aget-object v4, v5, v4

    .line 93
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    const/4 v5, 0x7

    .line 94
    invoke-virtual {v10, v2, v6, v4, v5}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 95
    :cond_31
    iget-object v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWeightedMatchConstraintsWidgets:Ljava/util/ArrayList;

    if-eqz v2, :cond_3b

    .line 96
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x1

    if-le v4, v5, :cond_3b

    .line 97
    iget-boolean v6, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHasUndefinedWeights:Z

    if-eqz v6, :cond_32

    iget-boolean v6, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHasComplexMatchWeights:Z

    if-nez v6, :cond_32

    .line 98
    iget v6, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsMatchCount:I

    int-to-float v6, v6

    goto :goto_1d

    :cond_32
    move/from16 v6, v25

    :goto_1d
    move-object/from16 v14, v16

    const/4 v9, 0x0

    const/4 v11, 0x0

    :goto_1e
    if-ge v11, v4, :cond_3b

    .line 99
    invoke-virtual {v2, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v5, v17

    check-cast v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 100
    iget-object v13, v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWeight:[F

    aget v13, v13, p2

    const/16 v17, 0x0

    cmpg-float v24, v13, v17

    if-gez v24, :cond_34

    .line 101
    iget-boolean v13, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mHasComplexMatchWeights:Z

    if-eqz v13, :cond_33

    .line 102
    iget-object v0, v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v5, v15, 0x1

    aget-object v5, v0, v5

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    aget-object v0, v0, v15

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    move-object/from16 v17, v2

    const/4 v2, 0x0

    const/4 v13, 0x4

    invoke-virtual {v10, v5, v0, v2, v13}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    move/from16 v24, v13

    const/4 v5, 0x7

    move v13, v2

    goto :goto_20

    :cond_33
    move-object/from16 v17, v2

    const/4 v2, 0x0

    const/high16 v13, 0x3f800000    # 1.0f

    const/16 v24, 0x4

    goto :goto_1f

    :cond_34
    move-object/from16 v17, v2

    const/16 v24, 0x4

    const/4 v2, 0x0

    :goto_1f
    cmpl-float v25, v13, v2

    if-nez v25, :cond_35

    .line 103
    iget-object v0, v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v2, v15, 0x1

    aget-object v2, v0, v2

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    aget-object v0, v0, v15

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    const/4 v5, 0x7

    const/4 v13, 0x0

    invoke-virtual {v10, v2, v0, v13, v5}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    :goto_20
    move-object/from16 v36, v1

    move/from16 v35, v4

    move/from16 v18, v5

    move/from16 v25, v6

    move/from16 v26, v13

    const/16 v19, 0x0

    goto/16 :goto_25

    :cond_35
    const/16 v18, 0x7

    const/16 v26, 0x0

    if-eqz v14, :cond_3a

    .line 104
    iget-object v2, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v14, v2, v15

    iget-object v14, v14, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    add-int/lit8 v28, v15, 0x1

    .line 105
    aget-object v2, v2, v28

    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 106
    iget-object v0, v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move/from16 v35, v4

    aget-object v4, v0, v15

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 107
    aget-object v0, v0, v28

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    move-object/from16 v28, v5

    .line 108
    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/solver/LinearSystem;->createRow()Landroidx/constraintlayout/solver/ArrayRow;

    move-result-object v5

    move-object/from16 v36, v1

    const/4 v1, 0x0

    .line 109
    iput v1, v5, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    cmpl-float v19, v6, v1

    const/high16 v1, -0x40800000    # -1.0f

    if-eqz v19, :cond_39

    cmpl-float v19, v9, v13

    if-nez v19, :cond_36

    goto :goto_22

    :cond_36
    const/16 v19, 0x0

    cmpl-float v37, v9, v19

    if-nez v37, :cond_37

    .line 110
    iget-object v0, v5, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v0, v14, v4}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 111
    iget-object v0, v5, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {v0, v2, v1}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    goto :goto_21

    :cond_37
    const/high16 v1, 0x3f800000    # 1.0f

    if-nez v25, :cond_38

    .line 112
    iget-object v2, v5, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {v2, v4, v1}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 113
    iget-object v1, v5, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    const/high16 v2, -0x40800000    # -1.0f

    invoke-virtual {v1, v0, v2}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    :goto_21
    move/from16 v25, v6

    goto :goto_23

    :cond_38
    div-float/2addr v9, v6

    div-float v25, v13, v6

    div-float v9, v9, v25

    move/from16 v25, v6

    .line 114
    iget-object v6, v5, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {v6, v14, v1}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 115
    iget-object v1, v5, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    const/high16 v6, -0x40800000    # -1.0f

    invoke-virtual {v1, v2, v6}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 116
    iget-object v1, v5, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {v1, v0, v9}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 117
    iget-object v0, v5, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    neg-float v1, v9

    invoke-virtual {v0, v4, v1}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    goto :goto_23

    :cond_39
    :goto_22
    move/from16 v25, v6

    const/16 v19, 0x0

    move v6, v1

    const/high16 v1, 0x3f800000    # 1.0f

    .line 118
    iget-object v9, v5, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {v9, v14, v1}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 119
    iget-object v9, v5, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {v9, v2, v6}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 120
    iget-object v2, v5, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {v2, v0, v1}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 121
    iget-object v0, v5, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {v0, v4, v6}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 122
    :goto_23
    invoke-virtual {v10, v5}, Landroidx/constraintlayout/solver/LinearSystem;->addConstraint(Landroidx/constraintlayout/solver/ArrayRow;)V

    goto :goto_24

    :cond_3a
    move-object/from16 v36, v1

    move/from16 v35, v4

    move-object/from16 v28, v5

    move/from16 v25, v6

    const/16 v19, 0x0

    :goto_24
    move v9, v13

    move-object/from16 v14, v28

    :goto_25
    add-int/lit8 v11, v11, 0x1

    const/4 v5, 0x1

    const/4 v13, 0x5

    move-object/from16 v0, p0

    move-object/from16 v2, v17

    move/from16 v6, v25

    move/from16 v4, v35

    move-object/from16 v1, v36

    goto/16 :goto_1e

    :cond_3b
    move-object/from16 v36, v1

    const/16 v18, 0x7

    const/16 v24, 0x4

    const/16 v26, 0x0

    if-eqz v8, :cond_42

    if-eq v8, v7, :cond_3c

    if-eqz v3, :cond_42

    :cond_3c
    move-object/from16 v0, v34

    .line 123
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v0, v0, v15

    .line 124
    iget-object v1, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v2, v15, 0x1

    aget-object v1, v1, v2

    .line 125
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v0, :cond_3d

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    move-object v3, v0

    goto :goto_26

    :cond_3d
    move-object/from16 v3, v16

    .line 126
    :goto_26
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v0, :cond_3e

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    move-object v6, v0

    goto :goto_27

    :cond_3e
    move-object/from16 v6, v16

    .line 127
    :goto_27
    iget-object v0, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v0, v0, v15

    .line 128
    iget-object v1, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v1, v1, v2

    if-eqz v3, :cond_40

    if-eqz v6, :cond_40

    if-nez p2, :cond_3f

    move-object/from16 v2, v33

    .line 129
    iget v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHorizontalBiasPercent:F

    goto :goto_28

    :cond_3f
    move-object/from16 v2, v33

    .line 130
    iget v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVerticalBiasPercent:F

    :goto_28
    move v5, v2

    .line 131
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    .line 132
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v9

    .line 133
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    const/4 v11, 0x5

    move-object/from16 v1, p1

    const/4 v13, 0x2

    move-object v14, v7

    move-object v7, v0

    move-object v0, v8

    move v8, v9

    move/from16 v17, v31

    move v9, v11

    invoke-virtual/range {v1 .. v9}, Landroidx/constraintlayout/solver/LinearSystem;->addCentering(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_29

    :cond_40
    move-object v14, v7

    move-object v0, v8

    move/from16 v17, v31

    const/4 v13, 0x2

    :goto_29
    move-object v11, v0

    :cond_41
    move-object v0, v10

    goto/16 :goto_44

    :cond_42
    move-object v14, v7

    move-object v11, v8

    move/from16 v17, v31

    move-object/from16 v0, v34

    const/4 v13, 0x2

    if-eqz v23, :cond_54

    if-eqz v11, :cond_54

    move-object/from16 v1, v36

    .line 134
    iget v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsMatchCount:I

    if-lez v2, :cond_43

    iget v1, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsCount:I

    if-ne v1, v2, :cond_43

    const/16 v21, 0x1

    goto :goto_2a

    :cond_43
    move/from16 v21, v26

    :goto_2a
    move-object v8, v11

    move-object v9, v8

    :goto_2b
    if-eqz v9, :cond_41

    .line 135
    iget-object v1, v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mNextChainWidget:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    aget-object v1, v1, p2

    move-object v7, v1

    :goto_2c
    if-eqz v7, :cond_44

    .line 136
    iget v1, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    const/16 v6, 0x8

    if-ne v1, v6, :cond_45

    .line 137
    iget-object v1, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mNextChainWidget:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    aget-object v7, v1, p2

    goto :goto_2c

    :cond_44
    const/16 v6, 0x8

    :cond_45
    if-nez v7, :cond_47

    if-ne v9, v14, :cond_46

    goto :goto_2d

    :cond_46
    move-object/from16 v20, v7

    move-object/from16 v19, v8

    move-object v13, v9

    move/from16 v27, v18

    const/16 v18, 0x5

    goto/16 :goto_35

    .line 138
    :cond_47
    :goto_2d
    iget-object v1, v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v1, v1, v15

    .line 139
    iget-object v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 140
    iget-object v3, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v3, :cond_48

    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_2e

    :cond_48
    move-object/from16 v3, v16

    :goto_2e
    if-eq v8, v9, :cond_49

    .line 141
    iget-object v3, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v4, v15, 0x1

    aget-object v3, v3, v4

    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_2f

    :cond_49
    if-ne v9, v11, :cond_4b

    if-ne v8, v9, :cond_4b

    .line 142
    iget-object v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v4, v3, v15

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v4, :cond_4a

    aget-object v3, v3, v15

    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_2f

    :cond_4a
    move-object/from16 v3, v16

    .line 143
    :cond_4b
    :goto_2f
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v1

    .line 144
    iget-object v4, v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v5, v15, 0x1

    aget-object v4, v4, v5

    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    if-eqz v7, :cond_4c

    .line 145
    iget-object v6, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v6, v6, v15

    .line 146
    iget-object v13, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    move-object/from16 v19, v6

    .line 147
    iget-object v6, v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v6, v6, v5

    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    :goto_30
    move-object/from16 v38, v19

    move-object/from16 v19, v6

    move-object/from16 v6, v38

    goto :goto_32

    .line 148
    :cond_4c
    iget-object v6, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v6, v6, v5

    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v6, :cond_4d

    .line 149
    iget-object v13, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    move-object/from16 v19, v6

    goto :goto_31

    :cond_4d
    move-object/from16 v19, v6

    move-object/from16 v13, v16

    .line 150
    :goto_31
    iget-object v6, v9, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v6, v6, v5

    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_30

    :goto_32
    if-eqz v6, :cond_4e

    .line 151
    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v6

    add-int/2addr v4, v6

    :cond_4e
    if-eqz v8, :cond_4f

    .line 152
    iget-object v6, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v6, v6, v5

    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v6

    add-int/2addr v1, v6

    :cond_4f
    if-eqz v2, :cond_46

    if-eqz v3, :cond_46

    if-eqz v13, :cond_46

    if-eqz v19, :cond_46

    if-ne v9, v11, :cond_50

    .line 153
    iget-object v1, v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v1, v1, v15

    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v1

    :cond_50
    move v6, v1

    if-ne v9, v14, :cond_51

    .line 154
    iget-object v1, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v1, v1, v5

    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v1

    move/from16 v24, v1

    goto :goto_33

    :cond_51
    move/from16 v24, v4

    :goto_33
    if-eqz v21, :cond_52

    move/from16 v25, v18

    goto :goto_34

    :cond_52
    const/16 v25, 0x5

    :goto_34
    const/high16 v5, 0x3f000000    # 0.5f

    move-object/from16 v1, p1

    move/from16 v27, v18

    const/16 v18, 0x5

    move v4, v6

    const/16 v20, 0x8

    move-object v6, v13

    move-object v13, v7

    move-object/from16 v7, v19

    move-object/from16 v19, v8

    move/from16 v8, v24

    move-object/from16 v20, v13

    move-object v13, v9

    move/from16 v9, v25

    .line 155
    invoke-virtual/range {v1 .. v9}, Landroidx/constraintlayout/solver/LinearSystem;->addCentering(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 156
    :goto_35
    iget v1, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    const/16 v9, 0x8

    if-eq v1, v9, :cond_53

    move-object v8, v13

    goto :goto_36

    :cond_53
    move-object/from16 v8, v19

    :goto_36
    move-object/from16 v9, v20

    move/from16 v18, v27

    const/4 v13, 0x2

    goto/16 :goto_2b

    :cond_54
    move/from16 v27, v18

    move-object/from16 v1, v36

    const/16 v9, 0x8

    if-eqz v22, :cond_41

    if-eqz v11, :cond_41

    .line 157
    iget v2, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsMatchCount:I

    if-lez v2, :cond_55

    iget v1, v1, Landroidx/constraintlayout/solver/widgets/ChainHead;->mWidgetsCount:I

    if-ne v1, v2, :cond_55

    const/16 v21, 0x1

    goto :goto_37

    :cond_55
    move/from16 v21, v26

    :goto_37
    move-object v8, v11

    move-object v13, v8

    :goto_38
    if-eqz v13, :cond_60

    .line 158
    iget-object v1, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mNextChainWidget:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    aget-object v1, v1, p2

    :goto_39
    if-eqz v1, :cond_56

    .line 159
    iget v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    if-ne v2, v9, :cond_56

    .line 160
    iget-object v1, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mNextChainWidget:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    aget-object v1, v1, p2

    goto :goto_39

    :cond_56
    if-eq v13, v11, :cond_5e

    if-eq v13, v14, :cond_5e

    if-eqz v1, :cond_5e

    if-ne v1, v14, :cond_57

    move-object/from16 v7, v16

    goto :goto_3a

    :cond_57
    move-object v7, v1

    .line 161
    :goto_3a
    iget-object v1, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v1, v1, v15

    .line 162
    iget-object v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 163
    iget-object v3, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v4, v15, 0x1

    aget-object v3, v3, v4

    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 164
    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v1

    .line 165
    iget-object v5, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v5, v5, v4

    invoke-virtual {v5}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v5

    if-eqz v7, :cond_59

    .line 166
    iget-object v6, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v6, v6, v15

    .line 167
    iget-object v9, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    move-object/from16 v18, v7

    .line 168
    iget-object v7, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v7, :cond_58

    iget-object v7, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_3c

    :cond_58
    move-object/from16 v7, v16

    goto :goto_3c

    :cond_59
    move-object/from16 v18, v7

    .line 169
    iget-object v6, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v6, v6, v15

    if-eqz v6, :cond_5a

    .line 170
    iget-object v7, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_3b

    :cond_5a
    move-object/from16 v7, v16

    .line 171
    :goto_3b
    iget-object v9, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v9, v9, v4

    iget-object v9, v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    move-object/from16 v38, v9

    move-object v9, v7

    move-object/from16 v7, v38

    :goto_3c
    if-eqz v6, :cond_5b

    .line 172
    invoke-virtual {v6}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v6

    add-int/2addr v6, v5

    move/from16 v19, v6

    goto :goto_3d

    :cond_5b
    move/from16 v19, v5

    .line 173
    :goto_3d
    iget-object v5, v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v4, v5, v4

    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    add-int/2addr v4, v1

    if-eqz v21, :cond_5c

    move/from16 v20, v27

    goto :goto_3e

    :cond_5c
    move/from16 v20, v24

    :goto_3e
    if-eqz v2, :cond_5d

    if-eqz v3, :cond_5d

    if-eqz v9, :cond_5d

    if-eqz v7, :cond_5d

    const/high16 v5, 0x3f000000    # 0.5f

    move-object/from16 v1, p1

    move/from16 v6, v24

    move-object v6, v9

    move-object/from16 v24, v8

    move/from16 v8, v19

    const/16 v10, 0x8

    move/from16 v9, v20

    .line 174
    invoke-virtual/range {v1 .. v9}, Landroidx/constraintlayout/solver/LinearSystem;->addCentering(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_3f

    :cond_5d
    move-object/from16 v24, v8

    const/16 v10, 0x8

    :goto_3f
    move-object/from16 v8, v18

    goto :goto_40

    :cond_5e
    move-object/from16 v24, v8

    move v10, v9

    move-object v8, v1

    .line 175
    :goto_40
    iget v1, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    if-eq v1, v10, :cond_5f

    goto :goto_41

    :cond_5f
    move-object/from16 v13, v24

    :goto_41
    move v9, v10

    const/16 v24, 0x4

    move-object/from16 v10, p1

    move-object/from16 v38, v13

    move-object v13, v8

    move-object/from16 v8, v38

    goto/16 :goto_38

    .line 176
    :cond_60
    iget-object v1, v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v1, v1, v15

    .line 177
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v0, v0, v15

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 178
    iget-object v2, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v3, v15, 0x1

    aget-object v10, v2, v3

    .line 179
    iget-object v2, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v2, v2, v3

    iget-object v13, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v0, :cond_63

    if-eq v11, v14, :cond_61

    .line 180
    iget-object v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v1

    move-object/from16 v9, p1

    const/4 v8, 0x4

    invoke-virtual {v9, v2, v0, v1, v8}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    goto :goto_42

    :cond_61
    move-object/from16 v9, p1

    const/4 v8, 0x4

    if-eqz v13, :cond_62

    .line 181
    iget-object v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    const/high16 v5, 0x3f000000    # 0.5f

    iget-object v6, v10, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v7, v13, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 182
    invoke-virtual {v10}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v0

    const/16 v18, 0x4

    move-object/from16 v1, p1

    move v8, v0

    move-object v0, v9

    move/from16 v9, v18

    .line 183
    invoke-virtual/range {v1 .. v9}, Landroidx/constraintlayout/solver/LinearSystem;->addCentering(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_43

    :cond_62
    :goto_42
    move-object v0, v9

    goto :goto_43

    :cond_63
    move-object/from16 v0, p1

    :goto_43
    if-eqz v13, :cond_64

    if-eq v11, v14, :cond_64

    .line 184
    iget-object v1, v10, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v2, v13, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    invoke-virtual {v10}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    neg-int v3, v3

    const/4 v4, 0x4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    :cond_64
    :goto_44
    if-nez v23, :cond_65

    if-eqz v22, :cond_6b

    :cond_65
    if-eqz v11, :cond_6b

    .line 185
    iget-object v1, v11, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v2, v1, v15

    .line 186
    iget-object v3, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    add-int/lit8 v4, v15, 0x1

    aget-object v3, v3, v4

    .line 187
    iget-object v5, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v5, :cond_66

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_45

    :cond_66
    move-object/from16 v5, v16

    .line 188
    :goto_45
    iget-object v6, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v6, :cond_67

    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    goto :goto_46

    :cond_67
    move-object/from16 v6, v16

    :goto_46
    if-eq v12, v14, :cond_69

    .line 189
    iget-object v6, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v6, v6, v4

    .line 190
    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v6, :cond_68

    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    move-object/from16 v16, v6

    :cond_68
    move-object/from16 v6, v16

    :cond_69
    if-ne v11, v14, :cond_6a

    .line 191
    aget-object v2, v1, v15

    .line 192
    aget-object v3, v1, v4

    :cond_6a
    if-eqz v5, :cond_6b

    if-eqz v6, :cond_6b

    const/high16 v7, 0x3f000000    # 0.5f

    .line 193
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v8

    .line 194
    iget-object v1, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v1, v1, v4

    invoke-virtual {v1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v9

    .line 195
    iget-object v2, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v10, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    const/4 v11, 0x5

    move-object/from16 v1, p1

    move-object v3, v5

    move v4, v8

    move v5, v7

    move-object v7, v10

    move v8, v9

    move v9, v11

    invoke-virtual/range {v1 .. v9}, Landroidx/constraintlayout/solver/LinearSystem;->addCentering(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    :cond_6b
    add-int/lit8 v9, v17, 0x1

    move-object v10, v0

    move-object/from16 v14, v30

    move/from16 v13, v32

    const/4 v11, 0x2

    move-object/from16 v0, p0

    goto/16 :goto_1

    :cond_6c
    return-void
.end method
