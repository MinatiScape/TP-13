.class public Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;
.super Landroidx/constraintlayout/solver/widgets/WidgetContainer;
.source "SourceFile"


# instance fields
.field public mBasicMeasureSolver:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;

.field public mDependencyGraph:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;

.field public mHeightMeasuredTooSmall:Z

.field public mHorizontalChainsArray:[Landroidx/constraintlayout/solver/widgets/ChainHead;

.field public mHorizontalChainsSize:I

.field public mIsRtl:Z

.field public mMeasurer:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measurer;

.field public mOptimizationLevel:I

.field public mPaddingLeft:I

.field public mPaddingTop:I

.field public mSystem:Landroidx/constraintlayout/solver/LinearSystem;

.field public mVerticalChainsArray:[Landroidx/constraintlayout/solver/widgets/ChainHead;

.field public mVerticalChainsSize:I

.field public mWidthMeasuredTooSmall:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Landroidx/constraintlayout/solver/widgets/WidgetContainer;-><init>()V

    .line 2
    new-instance v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;

    invoke-direct {v0, p0}, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;)V

    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mBasicMeasureSolver:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;

    .line 3
    new-instance v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;

    invoke-direct {v0, p0}, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;)V

    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mDependencyGraph:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mMeasurer:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measurer;

    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mIsRtl:Z

    .line 6
    new-instance v1, Landroidx/constraintlayout/solver/LinearSystem;

    invoke-direct {v1}, Landroidx/constraintlayout/solver/LinearSystem;-><init>()V

    iput-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroidx/constraintlayout/solver/LinearSystem;

    .line 7
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsSize:I

    .line 8
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsSize:I

    const/4 v1, 0x4

    new-array v2, v1, [Landroidx/constraintlayout/solver/widgets/ChainHead;

    .line 9
    iput-object v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsArray:[Landroidx/constraintlayout/solver/widgets/ChainHead;

    new-array v1, v1, [Landroidx/constraintlayout/solver/widgets/ChainHead;

    .line 10
    iput-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsArray:[Landroidx/constraintlayout/solver/widgets/ChainHead;

    const/4 v1, 0x7

    .line 11
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mOptimizationLevel:I

    .line 12
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mWidthMeasuredTooSmall:Z

    .line 13
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mHeightMeasuredTooSmall:Z

    return-void
.end method


# virtual methods
.method public addChain(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;I)V
    .locals 5

    const/4 v0, 0x1

    if-nez p2, :cond_1

    .line 1
    iget p2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsSize:I

    add-int/2addr p2, v0

    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsArray:[Landroidx/constraintlayout/solver/widgets/ChainHead;

    array-length v2, v1

    if-lt p2, v2, :cond_0

    .line 2
    array-length p2, v1

    mul-int/lit8 p2, p2, 0x2

    .line 3
    invoke-static {v1, p2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Landroidx/constraintlayout/solver/widgets/ChainHead;

    iput-object p2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsArray:[Landroidx/constraintlayout/solver/widgets/ChainHead;

    .line 4
    :cond_0
    iget-object p2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsArray:[Landroidx/constraintlayout/solver/widgets/ChainHead;

    iget v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsSize:I

    new-instance v2, Landroidx/constraintlayout/solver/widgets/ChainHead;

    const/4 v3, 0x0

    .line 5
    iget-boolean v4, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mIsRtl:Z

    .line 6
    invoke-direct {v2, p1, v3, v4}, Landroidx/constraintlayout/solver/widgets/ChainHead;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;IZ)V

    aput-object v2, p2, v1

    add-int/2addr v1, v0

    .line 7
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsSize:I

    goto :goto_0

    :cond_1
    if-ne p2, v0, :cond_3

    .line 8
    iget p2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsSize:I

    add-int/2addr p2, v0

    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsArray:[Landroidx/constraintlayout/solver/widgets/ChainHead;

    array-length v2, v1

    if-lt p2, v2, :cond_2

    .line 9
    array-length p2, v1

    mul-int/lit8 p2, p2, 0x2

    .line 10
    invoke-static {v1, p2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Landroidx/constraintlayout/solver/widgets/ChainHead;

    iput-object p2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsArray:[Landroidx/constraintlayout/solver/widgets/ChainHead;

    .line 11
    :cond_2
    iget-object p2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsArray:[Landroidx/constraintlayout/solver/widgets/ChainHead;

    iget v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsSize:I

    new-instance v2, Landroidx/constraintlayout/solver/widgets/ChainHead;

    .line 12
    iget-boolean v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mIsRtl:Z

    .line 13
    invoke-direct {v2, p1, v0, v3}, Landroidx/constraintlayout/solver/widgets/ChainHead;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;IZ)V

    aput-object v2, p2, v1

    add-int/2addr v1, v0

    .line 14
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsSize:I

    :cond_3
    :goto_0
    return-void
.end method

.method public addChildrenToSolver(Landroidx/constraintlayout/solver/LinearSystem;)Z
    .locals 11

    .line 1
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->addToSolver(Landroidx/constraintlayout/solver/LinearSystem;)V

    .line 2
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_2

    .line 3
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 4
    instance-of v4, v3, Landroidx/constraintlayout/solver/widgets/VirtualLayout;

    if-nez v4, :cond_0

    instance-of v4, v3, Landroidx/constraintlayout/solver/widgets/Guideline;

    if-eqz v4, :cond_1

    .line 5
    :cond_0
    invoke-virtual {v3, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->addToSolver(Landroidx/constraintlayout/solver/LinearSystem;)V

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    move v2, v1

    :goto_1
    const/4 v3, 0x1

    if-ge v2, v0, :cond_c

    .line 6
    iget-object v4, p0, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 7
    instance-of v5, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    const/4 v6, 0x2

    if-eqz v5, :cond_6

    .line 8
    iget-object v5, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aget v7, v5, v1

    .line 9
    aget v8, v5, v3

    if-ne v7, v6, :cond_3

    .line 10
    aput v3, v5, v1

    :cond_3
    if-ne v8, v6, :cond_4

    .line 11
    aput v3, v5, v3

    .line 12
    :cond_4
    invoke-virtual {v4, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->addToSolver(Landroidx/constraintlayout/solver/LinearSystem;)V

    if-ne v7, v6, :cond_5

    .line 13
    invoke-virtual {v4, v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setHorizontalDimensionBehaviour$enumunboxing$(I)V

    :cond_5
    if-ne v8, v6, :cond_b

    .line 14
    invoke-virtual {v4, v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setVerticalDimensionBehaviour$enumunboxing$(I)V

    goto/16 :goto_2

    :cond_6
    const/4 v5, 0x4

    const/4 v7, -0x1

    .line 15
    iput v7, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHorizontalResolution:I

    .line 16
    iput v7, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVerticalResolution:I

    .line 17
    iget-object v7, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aget v7, v7, v1

    if-eq v7, v6, :cond_7

    iget-object v7, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aget v7, v7, v1

    if-ne v7, v5, :cond_7

    .line 18
    iget-object v7, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget v7, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mMargin:I

    .line 19
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v8

    iget-object v9, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget v9, v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mMargin:I

    sub-int/2addr v8, v9

    .line 20
    iget-object v9, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1, v9}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v10

    iput-object v10, v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 21
    iget-object v9, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1, v9}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v10

    iput-object v10, v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 22
    iget-object v9, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v9, v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    invoke-virtual {p1, v9, v7}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;I)V

    .line 23
    iget-object v9, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v9, v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    invoke-virtual {p1, v9, v8}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;I)V

    .line 24
    iput v6, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHorizontalResolution:I

    .line 25
    iput v7, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mX:I

    sub-int/2addr v8, v7

    .line 26
    iput v8, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWidth:I

    .line 27
    iget v7, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinWidth:I

    if-ge v8, v7, :cond_7

    .line 28
    iput v7, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWidth:I

    .line 29
    :cond_7
    iget-object v7, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aget v7, v7, v3

    if-eq v7, v6, :cond_a

    iget-object v7, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aget v3, v7, v3

    if-ne v3, v5, :cond_a

    .line 30
    iget-object v3, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mMargin:I

    .line 31
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v5

    iget-object v7, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget v7, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mMargin:I

    sub-int/2addr v5, v7

    .line 32
    iget-object v7, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1, v7}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v8

    iput-object v8, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 33
    iget-object v7, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1, v7}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v8

    iput-object v8, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 34
    iget-object v7, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v7, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    invoke-virtual {p1, v7, v3}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;I)V

    .line 35
    iget-object v7, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v7, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    invoke-virtual {p1, v7, v5}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;I)V

    .line 36
    iget v7, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBaselineDistance:I

    if-gtz v7, :cond_8

    .line 37
    iget v7, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    const/16 v8, 0x8

    if-ne v7, v8, :cond_9

    .line 38
    :cond_8
    iget-object v7, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBaseline:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1, v7}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v8

    iput-object v8, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 39
    iget-object v7, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBaseline:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v7, v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    iget v8, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBaselineDistance:I

    add-int/2addr v8, v3

    invoke-virtual {p1, v7, v8}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;I)V

    .line 40
    :cond_9
    iput v6, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVerticalResolution:I

    .line 41
    iput v3, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mY:I

    sub-int/2addr v5, v3

    .line 42
    iput v5, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHeight:I

    .line 43
    iget v3, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinHeight:I

    if-ge v5, v3, :cond_a

    .line 44
    iput v3, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHeight:I

    .line 45
    :cond_a
    instance-of v3, v4, Landroidx/constraintlayout/solver/widgets/VirtualLayout;

    if-nez v3, :cond_b

    instance-of v3, v4, Landroidx/constraintlayout/solver/widgets/Guideline;

    if-nez v3, :cond_b

    .line 46
    invoke-virtual {v4, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->addToSolver(Landroidx/constraintlayout/solver/LinearSystem;)V

    :cond_b
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    .line 47
    :cond_c
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsSize:I

    if-lez v0, :cond_d

    .line 48
    invoke-static {p0, p1, v1}, Landroidx/constraintlayout/solver/widgets/Chain;->applyChainConstraints(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;Landroidx/constraintlayout/solver/LinearSystem;I)V

    .line 49
    :cond_d
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsSize:I

    if-lez v0, :cond_e

    .line 50
    invoke-static {p0, p1, v3}, Landroidx/constraintlayout/solver/widgets/Chain;->applyChainConstraints(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;Landroidx/constraintlayout/solver/LinearSystem;I)V

    :cond_e
    return v3
.end method

.method public directMeasureWithOrientation(ZI)Z
    .locals 10

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mDependencyGraph:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;

    const/4 v0, 0x1

    and-int/2addr p1, v0

    .line 2
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getDimensionBehaviour$enumunboxing$(I)I

    move-result v1

    .line 3
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-virtual {v3, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getDimensionBehaviour$enumunboxing$(I)I

    move-result v3

    .line 4
    iget-object v4, p0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getX()I

    move-result v4

    .line 5
    iget-object v5, p0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-virtual {v5}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getY()I

    move-result v5

    if-eqz p1, :cond_4

    const/4 v6, 0x2

    if-eq v1, v6, :cond_0

    if-ne v3, v6, :cond_4

    .line 6
    :cond_0
    iget-object v7, p0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->mRuns:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;

    .line 7
    iget v9, v8, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->orientation:I

    if-ne v9, p2, :cond_1

    .line 8
    invoke-virtual {v8}, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->supportsWrapComputation()Z

    move-result v8

    if-nez v8, :cond_1

    move p1, v2

    :cond_2
    if-nez p2, :cond_3

    if-eqz p1, :cond_4

    if-ne v1, v6, :cond_4

    .line 9
    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    .line 10
    iget-object v6, p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aput v0, v6, v2

    .line 11
    invoke-virtual {p0, p1, v2}, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->computeWrap(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;I)I

    move-result v6

    invoke-virtual {p1, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setWidth(I)V

    .line 12
    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget-object v6, p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;

    invoke-virtual {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result p1

    invoke-virtual {v6, p1}, Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;->resolve(I)V

    goto :goto_0

    :cond_3
    if-eqz p1, :cond_4

    if-ne v3, v6, :cond_4

    .line 13
    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    .line 14
    iget-object v6, p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aput v0, v6, v0

    .line 15
    invoke-virtual {p0, p1, v0}, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->computeWrap(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;I)I

    move-result v6

    invoke-virtual {p1, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setHeight(I)V

    .line 16
    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget-object v6, p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    iget-object v6, v6, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;

    invoke-virtual {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result p1

    invoke-virtual {v6, p1}, Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;->resolve(I)V

    :cond_4
    :goto_0
    const/4 p1, 0x4

    if-nez p2, :cond_6

    .line 17
    iget-object v5, p0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget-object v6, v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aget v7, v6, v2

    if-eq v7, v0, :cond_5

    aget v6, v6, v2

    if-ne v6, p1, :cond_7

    .line 18
    :cond_5
    invoke-virtual {v5}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result p1

    add-int/2addr p1, v4

    .line 19
    iget-object v5, p0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    invoke-virtual {v5, p1}, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolve(I)V

    .line 20
    iget-object v5, p0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;

    sub-int/2addr p1, v4

    invoke-virtual {v5, p1}, Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;->resolve(I)V

    goto :goto_2

    .line 21
    :cond_6
    iget-object v4, p0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget-object v6, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aget v7, v6, v0

    if-eq v7, v0, :cond_8

    aget v6, v6, v0

    if-ne v6, p1, :cond_7

    goto :goto_1

    :cond_7
    move p1, v2

    goto :goto_3

    .line 22
    :cond_8
    :goto_1
    invoke-virtual {v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result p1

    add-int/2addr p1, v5

    .line 23
    iget-object v4, p0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    invoke-virtual {v4, p1}, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolve(I)V

    .line 24
    iget-object v4, p0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    iget-object v4, v4, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;

    sub-int/2addr p1, v5

    invoke-virtual {v4, p1}, Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;->resolve(I)V

    :goto_2
    move p1, v0

    .line 25
    :goto_3
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->measureWidgets()V

    .line 26
    iget-object v4, p0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->mRuns:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_b

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;

    .line 27
    iget v6, v5, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->orientation:I

    if-eq v6, p2, :cond_9

    goto :goto_4

    .line 28
    :cond_9
    iget-object v6, v5, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    iget-object v7, p0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    if-ne v6, v7, :cond_a

    iget-boolean v6, v5, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->resolved:Z

    if-nez v6, :cond_a

    goto :goto_4

    .line 29
    :cond_a
    invoke-virtual {v5}, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->applyToWidget()V

    goto :goto_4

    .line 30
    :cond_b
    iget-object v4, p0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->mRuns:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_c
    :goto_5
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_11

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;

    .line 31
    iget v6, v5, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->orientation:I

    if-eq v6, p2, :cond_d

    goto :goto_5

    :cond_d
    if-nez p1, :cond_e

    .line 32
    iget-object v6, v5, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->widget:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    iget-object v7, p0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    if-ne v6, v7, :cond_e

    goto :goto_5

    .line 33
    :cond_e
    iget-object v6, v5, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget-boolean v6, v6, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    if-nez v6, :cond_f

    goto :goto_6

    .line 34
    :cond_f
    iget-object v6, v5, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget-boolean v6, v6, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    if-nez v6, :cond_10

    goto :goto_6

    .line 35
    :cond_10
    instance-of v6, v5, Landroidx/constraintlayout/solver/widgets/analyzer/ChainRun;

    if-nez v6, :cond_c

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->dimension:Landroidx/constraintlayout/solver/widgets/analyzer/DimensionDependency;

    iget-boolean v5, v5, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    if-nez v5, :cond_c

    :goto_6
    move v0, v2

    .line 36
    :cond_11
    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-virtual {p1, v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setHorizontalDimensionBehaviour$enumunboxing$(I)V

    .line 37
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->container:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-virtual {p0, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setVerticalDimensionBehaviour$enumunboxing$(I)V

    return v0
.end method

.method public invalidateGraph()V
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mDependencyGraph:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph;->mNeedBuildGraph:Z

    return-void
.end method

.method public layout()V
    .locals 18

    move-object/from16 v1, p0

    const/4 v2, 0x0

    .line 1
    iput v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mX:I

    .line 2
    iput v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mY:I

    .line 3
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 4
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 5
    iput-boolean v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mWidthMeasuredTooSmall:Z

    .line 6
    iput-boolean v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mHeightMeasuredTooSmall:Z

    .line 7
    iget v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mOptimizationLevel:I

    and-int/lit8 v5, v0, 0x40

    const/16 v6, 0x40

    const/4 v7, 0x1

    if-ne v5, v6, :cond_0

    move v5, v7

    goto :goto_0

    :cond_0
    move v5, v2

    :goto_0
    if-nez v5, :cond_3

    and-int/lit16 v5, v0, 0x80

    const/16 v6, 0x80

    if-ne v5, v6, :cond_1

    move v5, v7

    goto :goto_1

    :cond_1
    move v5, v2

    :goto_1
    if-eqz v5, :cond_2

    goto :goto_2

    :cond_2
    move v5, v2

    goto :goto_3

    :cond_3
    :goto_2
    move v5, v7

    .line 8
    :goto_3
    iget-object v6, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroidx/constraintlayout/solver/LinearSystem;

    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    iput-boolean v2, v6, Landroidx/constraintlayout/solver/LinearSystem;->newgraphOptimizer:Z

    if-eqz v0, :cond_4

    if-eqz v5, :cond_4

    .line 10
    iput-boolean v7, v6, Landroidx/constraintlayout/solver/LinearSystem;->newgraphOptimizer:Z

    .line 11
    :cond_4
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aget v5, v0, v7

    .line 12
    aget v6, v0, v2

    .line 13
    iget-object v8, v1, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    .line 14
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHorizontalDimensionBehaviour$enumunboxing$()I

    move-result v0

    const/4 v9, 0x2

    if-eq v0, v9, :cond_6

    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getVerticalDimensionBehaviour$enumunboxing$()I

    move-result v0

    if-ne v0, v9, :cond_5

    goto :goto_4

    :cond_5
    move v10, v2

    goto :goto_5

    :cond_6
    :goto_4
    move v10, v7

    .line 15
    :goto_5
    iput v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsSize:I

    .line 16
    iput v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsSize:I

    .line 17
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v11

    move v0, v2

    :goto_6
    if-ge v0, v11, :cond_8

    .line 18
    iget-object v12, v1, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v12, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 19
    instance-of v13, v12, Landroidx/constraintlayout/solver/widgets/WidgetContainer;

    if-eqz v13, :cond_7

    .line 20
    check-cast v12, Landroidx/constraintlayout/solver/widgets/WidgetContainer;

    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->layout()V

    :cond_7
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_8
    move v0, v2

    move v13, v0

    move v12, v7

    :goto_7
    if-eqz v12, :cond_18

    add-int/lit8 v14, v0, 0x1

    .line 21
    :try_start_0
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroidx/constraintlayout/solver/LinearSystem;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/LinearSystem;->reset()V

    .line 22
    iput v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsSize:I

    .line 23
    iput v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsSize:I

    .line 24
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroidx/constraintlayout/solver/LinearSystem;

    invoke-virtual {v1, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->createObjectVariables(Landroidx/constraintlayout/solver/LinearSystem;)V

    move v0, v2

    :goto_8
    if-ge v0, v11, :cond_9

    .line 25
    iget-object v15, v1, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 26
    iget-object v7, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroidx/constraintlayout/solver/LinearSystem;

    invoke-virtual {v15, v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->createObjectVariables(Landroidx/constraintlayout/solver/LinearSystem;)V

    add-int/lit8 v0, v0, 0x1

    const/4 v7, 0x1

    goto :goto_8

    .line 27
    :cond_9
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroidx/constraintlayout/solver/LinearSystem;

    invoke-virtual {v1, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->addChildrenToSolver(Landroidx/constraintlayout/solver/LinearSystem;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 28
    :try_start_1
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroidx/constraintlayout/solver/LinearSystem;

    .line 29
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean v7, v0, Landroidx/constraintlayout/solver/LinearSystem;->newgraphOptimizer:Z

    if-eqz v7, :cond_d

    move v7, v2

    .line 30
    :goto_9
    iget v12, v0, Landroidx/constraintlayout/solver/LinearSystem;->mNumRows:I

    if-ge v7, v12, :cond_b

    .line 31
    iget-object v12, v0, Landroidx/constraintlayout/solver/LinearSystem;->mRows:[Landroidx/constraintlayout/solver/ArrayRow;

    aget-object v12, v12, v7

    .line 32
    iget-boolean v12, v12, Landroidx/constraintlayout/solver/ArrayRow;->isSimpleDefinition:Z

    if-nez v12, :cond_a

    move v7, v2

    goto :goto_a

    :cond_a
    add-int/lit8 v7, v7, 0x1

    goto :goto_9

    :cond_b
    const/4 v7, 0x1

    :goto_a
    if-nez v7, :cond_c

    .line 33
    iget-object v7, v0, Landroidx/constraintlayout/solver/LinearSystem;->mGoal:Landroidx/constraintlayout/solver/LinearSystem$Row;

    invoke-virtual {v0, v7}, Landroidx/constraintlayout/solver/LinearSystem;->minimizeGoal(Landroidx/constraintlayout/solver/LinearSystem$Row;)V

    goto :goto_b

    .line 34
    :cond_c
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/LinearSystem;->computeValues()V

    goto :goto_b

    .line 35
    :cond_d
    iget-object v7, v0, Landroidx/constraintlayout/solver/LinearSystem;->mGoal:Landroidx/constraintlayout/solver/LinearSystem$Row;

    invoke-virtual {v0, v7}, Landroidx/constraintlayout/solver/LinearSystem;->minimizeGoal(Landroidx/constraintlayout/solver/LinearSystem$Row;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :goto_b
    const/4 v12, 0x1

    goto :goto_d

    :catch_0
    move-exception v0

    const/4 v12, 0x1

    goto :goto_c

    :catch_1
    move-exception v0

    .line 36
    :goto_c
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 37
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "EXCEPTION : "

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    :goto_d
    if-eqz v12, :cond_e

    .line 38
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroidx/constraintlayout/solver/LinearSystem;

    sget-object v2, Landroidx/constraintlayout/solver/widgets/Optimizer;->flags:[Z

    const/4 v7, 0x0

    .line 39
    aput-boolean v7, v2, v9

    .line 40
    invoke-virtual {v1, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->updateFromSolver(Landroidx/constraintlayout/solver/LinearSystem;)V

    .line 41
    iget-object v2, v1, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v7, 0x0

    :goto_e
    if-ge v7, v2, :cond_f

    .line 42
    iget-object v12, v1, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v12, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 43
    invoke-virtual {v12, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->updateFromSolver(Landroidx/constraintlayout/solver/LinearSystem;)V

    add-int/lit8 v7, v7, 0x1

    goto :goto_e

    .line 44
    :cond_e
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroidx/constraintlayout/solver/LinearSystem;

    invoke-virtual {v1, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->updateFromSolver(Landroidx/constraintlayout/solver/LinearSystem;)V

    const/4 v0, 0x0

    :goto_f
    if-ge v0, v11, :cond_f

    .line 45
    iget-object v2, v1, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 46
    iget-object v7, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroidx/constraintlayout/solver/LinearSystem;

    invoke-virtual {v2, v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->updateFromSolver(Landroidx/constraintlayout/solver/LinearSystem;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    :cond_f
    if-eqz v10, :cond_12

    const/16 v0, 0x8

    if-ge v14, v0, :cond_12

    .line 47
    sget-object v0, Landroidx/constraintlayout/solver/widgets/Optimizer;->flags:[Z

    aget-boolean v0, v0, v9

    if-eqz v0, :cond_12

    const/4 v0, 0x0

    const/4 v2, 0x0

    const/4 v7, 0x0

    :goto_10
    if-ge v0, v11, :cond_10

    .line 48
    iget-object v12, v1, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v12, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 49
    iget v15, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mX:I

    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v17

    add-int v15, v17, v15

    invoke-static {v2, v15}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 50
    iget v15, v12, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mY:I

    invoke-virtual {v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v12

    add-int/2addr v12, v15

    invoke-static {v7, v12}, Ljava/lang/Math;->max(II)I

    move-result v7

    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 51
    :cond_10
    iget v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinWidth:I

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 52
    iget v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinHeight:I

    invoke-static {v2, v7}, Ljava/lang/Math;->max(II)I

    move-result v2

    if-ne v6, v9, :cond_11

    .line 53
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v7

    if-ge v7, v0, :cond_11

    .line 54
    invoke-virtual {v1, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setWidth(I)V

    .line 55
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v7, 0x0

    aput v9, v0, v7

    const/4 v0, 0x1

    const/4 v13, 0x1

    goto :goto_11

    :cond_11
    const/4 v0, 0x0

    :goto_11
    if-ne v5, v9, :cond_13

    .line 56
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v7

    if-ge v7, v2, :cond_13

    .line 57
    invoke-virtual {v1, v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setHeight(I)V

    .line 58
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v2, 0x1

    aput v9, v0, v2

    const/4 v0, 0x1

    const/4 v13, 0x1

    goto :goto_12

    :cond_12
    const/4 v0, 0x0

    .line 59
    :cond_13
    :goto_12
    iget v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinWidth:I

    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v7

    invoke-static {v2, v7}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 60
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v7

    if-le v2, v7, :cond_14

    .line 61
    invoke-virtual {v1, v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setWidth(I)V

    .line 62
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v2, 0x1

    const/4 v7, 0x0

    aput v2, v0, v7

    move v0, v2

    move/from16 v16, v0

    goto :goto_13

    :cond_14
    const/4 v2, 0x1

    move/from16 v16, v13

    .line 63
    :goto_13
    iget v7, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinHeight:I

    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v12

    invoke-static {v7, v12}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 64
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v12

    if-le v7, v12, :cond_15

    .line 65
    invoke-virtual {v1, v7}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setHeight(I)V

    .line 66
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aput v2, v0, v2

    move v0, v2

    move v7, v0

    goto :goto_14

    :cond_15
    move v7, v0

    move/from16 v0, v16

    :goto_14
    if-nez v0, :cond_17

    .line 67
    iget-object v12, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v13, 0x0

    aget v12, v12, v13

    if-ne v12, v9, :cond_16

    if-lez v3, :cond_16

    .line 68
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v12

    if-le v12, v3, :cond_16

    .line 69
    iput-boolean v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mWidthMeasuredTooSmall:Z

    .line 70
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aput v2, v0, v13

    .line 71
    invoke-virtual {v1, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setWidth(I)V

    move v0, v2

    move v7, v0

    .line 72
    :cond_16
    iget-object v12, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aget v12, v12, v2

    if-ne v12, v9, :cond_17

    if-lez v4, :cond_17

    .line 73
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v12

    if-le v12, v4, :cond_17

    .line 74
    iput-boolean v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mHeightMeasuredTooSmall:Z

    .line 75
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aput v2, v0, v2

    .line 76
    invoke-virtual {v1, v4}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setHeight(I)V

    const/4 v12, 0x1

    const/4 v13, 0x1

    goto :goto_15

    :cond_17
    move v13, v0

    move v12, v7

    :goto_15
    move v0, v14

    const/4 v2, 0x0

    const/4 v7, 0x1

    goto/16 :goto_7

    .line 77
    :cond_18
    iput-object v8, v1, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    if-eqz v13, :cond_19

    .line 78
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v2, 0x0

    aput v6, v0, v2

    const/4 v2, 0x1

    .line 79
    aput v5, v0, v2

    .line 80
    :cond_19
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroidx/constraintlayout/solver/LinearSystem;

    .line 81
    iget-object v0, v0, Landroidx/constraintlayout/solver/LinearSystem;->mCache:Landroidx/constraintlayout/solver/Cache;

    .line 82
    invoke-virtual {v1, v0}, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->resetSolverVariables(Landroidx/constraintlayout/solver/Cache;)V

    return-void
.end method

.method public reset()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroidx/constraintlayout/solver/LinearSystem;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/LinearSystem;->reset()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mPaddingLeft:I

    .line 3
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mPaddingTop:I

    .line 4
    invoke-super {p0}, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->reset()V

    return-void
.end method

.method public updateFromRuns(ZZ)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->updateFromRuns(ZZ)V

    .line 2
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 3
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/WidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 4
    invoke-virtual {v2, p1, p2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->updateFromRuns(ZZ)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
