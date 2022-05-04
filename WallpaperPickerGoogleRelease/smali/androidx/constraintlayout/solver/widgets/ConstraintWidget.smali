.class public Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public hasBaseline:Z

.field public horizontalChainRun:Landroidx/constraintlayout/solver/widgets/analyzer/ChainRun;

.field public horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

.field public isTerminalWidget:[Z

.field public mAnchors:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;",
            ">;"
        }
    .end annotation
.end field

.field public mBaseline:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

.field public mBaselineDistance:I

.field public mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

.field public mCenter:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

.field public mCenterX:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

.field public mCenterY:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

.field public mCircleConstraintAngle:F

.field public mCompanionWidget:Ljava/lang/Object;

.field public mDebugName:Ljava/lang/String;

.field public mDimensionRatio:F

.field public mDimensionRatioSide:I

.field public mHeight:I

.field public mHorizontalBiasPercent:F

.field public mHorizontalChainStyle:I

.field public mHorizontalResolution:I

.field public mLeft:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

.field public mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

.field public mListDimensionBehaviors:[I

.field public mListNextMatchConstraintsWidget:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

.field public mMatchConstraintDefaultHeight:I

.field public mMatchConstraintDefaultWidth:I

.field public mMatchConstraintMaxHeight:I

.field public mMatchConstraintMaxWidth:I

.field public mMatchConstraintMinHeight:I

.field public mMatchConstraintMinWidth:I

.field public mMatchConstraintPercentHeight:F

.field public mMatchConstraintPercentWidth:F

.field public mMaxDimension:[I

.field public mMinHeight:I

.field public mMinWidth:I

.field public mNextChainWidget:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

.field public mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

.field public mResolvedDimensionRatio:F

.field public mResolvedDimensionRatioSide:I

.field public mResolvedMatchConstraintDefault:[I

.field public mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

.field public mTop:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

.field public mVerticalBiasPercent:F

.field public mVerticalChainStyle:I

.field public mVerticalResolution:I

.field public mVisibility:I

.field public mWeight:[F

.field public mWidth:I

.field public mX:I

.field public mY:I

.field public measured:Z

.field public verticalChainRun:Landroidx/constraintlayout/solver/widgets/analyzer/ChainRun;

.field public verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

.field public wrapMeasure:[I


# direct methods
.method public constructor <init>()V
    .locals 11

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->measured:Z

    .line 3
    new-instance v1, Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    invoke-direct {v1, p0}, Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;)V

    iput-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    .line 4
    new-instance v1, Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    invoke-direct {v1, p0}, Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;)V

    iput-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    const/4 v1, 0x2

    new-array v2, v1, [Z

    .line 5
    fill-array-data v2, :array_0

    iput-object v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->isTerminalWidget:[Z

    new-array v2, v1, [I

    .line 6
    fill-array-data v2, :array_1

    iput-object v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->wrapMeasure:[I

    const/4 v2, -0x1

    .line 7
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHorizontalResolution:I

    .line 8
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVerticalResolution:I

    .line 9
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintDefaultWidth:I

    .line 10
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintDefaultHeight:I

    new-array v3, v1, [I

    .line 11
    iput-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedMatchConstraintDefault:[I

    .line 12
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintMinWidth:I

    .line 13
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintMaxWidth:I

    const/high16 v3, 0x3f800000    # 1.0f

    .line 14
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintPercentWidth:F

    .line 15
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintMinHeight:I

    .line 16
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintMaxHeight:I

    .line 17
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintPercentHeight:F

    .line 18
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatioSide:I

    .line 19
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatio:F

    new-array v3, v1, [I

    .line 20
    fill-array-data v3, :array_2

    iput-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMaxDimension:[I

    const/4 v3, 0x0

    .line 21
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCircleConstraintAngle:F

    .line 22
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->hasBaseline:Z

    .line 23
    new-instance v4, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    sget-object v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->LEFT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    invoke-direct {v4, p0, v5}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)V

    iput-object v4, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 24
    new-instance v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    sget-object v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->TOP:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    invoke-direct {v5, p0, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)V

    iput-object v5, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 25
    new-instance v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    sget-object v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->RIGHT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    invoke-direct {v6, p0, v7}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)V

    iput-object v6, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 26
    new-instance v7, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    sget-object v8, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->BOTTOM:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    invoke-direct {v7, p0, v8}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)V

    iput-object v7, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 27
    new-instance v8, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    sget-object v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->BASELINE:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    invoke-direct {v8, p0, v9}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)V

    iput-object v8, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBaseline:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 28
    new-instance v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    sget-object v10, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->CENTER_X:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    invoke-direct {v9, p0, v10}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)V

    iput-object v9, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCenterX:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 29
    new-instance v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    sget-object v10, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->CENTER_Y:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    invoke-direct {v9, p0, v10}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)V

    iput-object v9, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCenterY:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 30
    new-instance v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    sget-object v10, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->CENTER:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    invoke-direct {v9, p0, v10}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;-><init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)V

    iput-object v9, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCenter:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    const/4 v10, 0x6

    new-array v10, v10, [Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aput-object v4, v10, v0

    const/4 v4, 0x1

    aput-object v6, v10, v4

    aput-object v5, v10, v1

    const/4 v5, 0x3

    aput-object v7, v10, v5

    const/4 v5, 0x4

    aput-object v8, v10, v5

    const/4 v5, 0x5

    aput-object v9, v10, v5

    .line 31
    iput-object v10, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 32
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mAnchors:Ljava/util/ArrayList;

    new-array v6, v1, [I

    fill-array-data v6, :array_3

    .line 33
    iput-object v6, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v6, 0x0

    .line 34
    iput-object v6, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 35
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWidth:I

    .line 36
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHeight:I

    .line 37
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mDimensionRatio:F

    .line 38
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mDimensionRatioSide:I

    .line 39
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mX:I

    .line 40
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mY:I

    .line 41
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBaselineDistance:I

    const/high16 v2, 0x3f000000    # 0.5f

    .line 42
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHorizontalBiasPercent:F

    .line 43
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVerticalBiasPercent:F

    .line 44
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    .line 45
    iput-object v6, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mDebugName:Ljava/lang/String;

    .line 46
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHorizontalChainStyle:I

    .line 47
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVerticalChainStyle:I

    new-array v2, v1, [F

    .line 48
    fill-array-data v2, :array_4

    iput-object v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWeight:[F

    new-array v2, v1, [Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    aput-object v6, v2, v0

    aput-object v6, v2, v4

    .line 49
    iput-object v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListNextMatchConstraintsWidget:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    new-array v1, v1, [Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    aput-object v6, v1, v0

    aput-object v6, v1, v4

    .line 50
    iput-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mNextChainWidget:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 51
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mAnchors:Ljava/util/ArrayList;

    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mAnchors:Ljava/util/ArrayList;

    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mAnchors:Ljava/util/ArrayList;

    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mAnchors:Ljava/util/ArrayList;

    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCenterX:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mAnchors:Ljava/util/ArrayList;

    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCenterY:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 57
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mAnchors:Ljava/util/ArrayList;

    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCenter:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mAnchors:Ljava/util/ArrayList;

    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBaseline:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :array_0
    .array-data 1
        0x1t
        0x1t
    .end array-data

    nop

    :array_1
    .array-data 4
        0x0
        0x0
    .end array-data

    :array_2
    .array-data 4
        0x7fffffff
        0x7fffffff
    .end array-data

    :array_3
    .array-data 4
        0x1
        0x1
    .end array-data

    :array_4
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
    .end array-data
.end method


# virtual methods
.method public addToSolver(Landroidx/constraintlayout/solver/LinearSystem;)V
    .locals 43

    move-object/from16 v13, p0

    move-object/from16 v9, p1

    .line 1
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v9, v0}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v7

    .line 2
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v9, v0}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v6

    .line 3
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v9, v0}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v4

    .line 4
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v9, v0}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v3

    .line 5
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBaseline:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v9, v0}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v1

    .line 6
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget-boolean v5, v2, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    const/4 v15, 0x2

    const/4 v14, 0x7

    const/4 v12, 0x1

    const/4 v11, 0x0

    if-eqz v5, :cond_4

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget-boolean v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    if-eqz v0, :cond_4

    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    iget-object v5, v0, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget-boolean v5, v5, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    if-eqz v5, :cond_4

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget-boolean v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    if-eqz v0, :cond_4

    .line 7
    iget v0, v2, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->value:I

    invoke-virtual {v9, v7, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;I)V

    .line 8
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->value:I

    invoke-virtual {v9, v6, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;I)V

    .line 9
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->value:I

    invoke-virtual {v9, v4, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;I)V

    .line 10
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->value:I

    invoke-virtual {v9, v3, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;I)V

    .line 11
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;->baseline:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->value:I

    invoke-virtual {v9, v1, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;I)V

    .line 12
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eqz v0, :cond_3

    .line 13
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aget v1, v0, v11

    if-ne v1, v15, :cond_0

    move v1, v12

    goto :goto_0

    :cond_0
    move v1, v11

    .line 14
    :goto_0
    aget v0, v0, v12

    if-ne v0, v15, :cond_1

    move v0, v12

    goto :goto_1

    :cond_1
    move v0, v11

    :goto_1
    if-eqz v1, :cond_2

    .line 15
    iget-object v1, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->isTerminalWidget:[Z

    aget-boolean v1, v1, v11

    if-eqz v1, :cond_2

    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->isInHorizontalChain()Z

    move-result v1

    if-nez v1, :cond_2

    .line 16
    iget-object v1, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    iget-object v1, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v9, v1}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v1

    .line 17
    invoke-virtual {v9, v1, v6, v11, v14}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    :cond_2
    if-eqz v0, :cond_3

    .line 18
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->isTerminalWidget:[Z

    aget-boolean v0, v0, v12

    if-eqz v0, :cond_3

    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->isInVerticalChain()Z

    move-result v0

    if-nez v0, :cond_3

    .line 19
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v9, v0}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v0

    .line 20
    invoke-virtual {v9, v0, v3, v11, v14}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    :cond_3
    return-void

    .line 21
    :cond_4
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    const/16 v2, 0x8

    if-eqz v0, :cond_b

    .line 22
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aget v5, v0, v11

    if-ne v5, v15, :cond_5

    move v5, v12

    goto :goto_2

    :cond_5
    move v5, v11

    .line 23
    :goto_2
    aget v0, v0, v12

    if-ne v0, v15, :cond_6

    move v0, v12

    goto :goto_3

    :cond_6
    move v0, v11

    .line 24
    :goto_3
    invoke-virtual {v13, v11}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->isChainHead(I)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 25
    iget-object v8, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    check-cast v8, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-virtual {v8, v13, v11}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->addChain(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;I)V

    move v8, v12

    goto :goto_4

    .line 26
    :cond_7
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->isInHorizontalChain()Z

    move-result v8

    .line 27
    :goto_4
    invoke-virtual {v13, v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->isChainHead(I)Z

    move-result v10

    if-eqz v10, :cond_8

    .line 28
    iget-object v10, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    check-cast v10, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-virtual {v10, v13, v12}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->addChain(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;I)V

    move v10, v12

    goto :goto_5

    .line 29
    :cond_8
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->isInVerticalChain()Z

    move-result v10

    :goto_5
    if-nez v8, :cond_9

    if-eqz v5, :cond_9

    .line 30
    iget v14, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    if-eq v14, v2, :cond_9

    iget-object v14, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v14, v14, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-nez v14, :cond_9

    iget-object v14, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v14, v14, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-nez v14, :cond_9

    .line 31
    iget-object v14, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    iget-object v14, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v9, v14}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v14

    .line 32
    invoke-virtual {v9, v14, v6, v11, v12}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    :cond_9
    if-nez v10, :cond_a

    if-eqz v0, :cond_a

    .line 33
    iget v14, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    if-eq v14, v2, :cond_a

    iget-object v14, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v14, v14, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-nez v14, :cond_a

    iget-object v14, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v14, v14, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-nez v14, :cond_a

    iget-object v14, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBaseline:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-nez v14, :cond_a

    .line 34
    iget-object v14, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    iget-object v14, v14, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v9, v14}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v14

    .line 35
    invoke-virtual {v9, v14, v3, v11, v12}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    :cond_a
    move/from16 v26, v0

    move/from16 v27, v5

    move/from16 v29, v8

    move/from16 v28, v10

    goto :goto_6

    :cond_b
    move/from16 v26, v11

    move/from16 v27, v26

    move/from16 v28, v27

    move/from16 v29, v28

    .line 36
    :goto_6
    iget v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWidth:I

    .line 37
    iget v5, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinWidth:I

    if-ge v0, v5, :cond_c

    goto :goto_7

    :cond_c
    move v5, v0

    .line 38
    :goto_7
    iget v8, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHeight:I

    .line 39
    iget v10, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinHeight:I

    if-ge v8, v10, :cond_d

    goto :goto_8

    :cond_d
    move v10, v8

    .line 40
    :goto_8
    iget-object v14, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aget v15, v14, v11

    const/4 v11, 0x3

    if-eq v15, v11, :cond_e

    move v15, v12

    goto :goto_9

    :cond_e
    const/4 v15, 0x0

    .line 41
    :goto_9
    aget v2, v14, v12

    if-eq v2, v11, :cond_f

    move v2, v12

    goto :goto_a

    :cond_f
    const/4 v2, 0x0

    .line 42
    :goto_a
    iget v12, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mDimensionRatioSide:I

    iput v12, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatioSide:I

    .line 43
    iget v11, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mDimensionRatio:F

    iput v11, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatio:F

    move-object/from16 v25, v1

    .line 44
    iget v1, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintDefaultWidth:I

    move-object/from16 v30, v3

    .line 45
    iget v3, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintDefaultHeight:I

    const/16 v22, 0x0

    cmpl-float v22, v11, v22

    const/16 v23, 0x4

    move-object/from16 v31, v4

    if-lez v22, :cond_24

    .line 46
    iget v4, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    move/from16 v22, v10

    const/16 v10, 0x8

    if-eq v4, v10, :cond_23

    const/4 v4, 0x0

    .line 47
    aget v10, v14, v4

    const/4 v4, 0x3

    if-ne v10, v4, :cond_10

    if-nez v1, :cond_10

    move v1, v4

    :cond_10
    move/from16 v24, v5

    const/4 v10, 0x1

    .line 48
    aget v5, v14, v10

    if-ne v5, v4, :cond_11

    if-nez v3, :cond_11

    move v3, v4

    :cond_11
    const/4 v5, 0x0

    .line 49
    aget v10, v14, v5

    const/high16 v33, 0x3f800000    # 1.0f

    if-ne v10, v4, :cond_1d

    const/4 v10, 0x1

    aget v5, v14, v10

    if-ne v5, v4, :cond_1c

    if-ne v1, v4, :cond_1c

    if-ne v3, v4, :cond_1c

    const/4 v4, -0x1

    if-ne v12, v4, :cond_13

    if-eqz v15, :cond_12

    if-nez v2, :cond_12

    const/4 v0, 0x0

    .line 50
    iput v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatioSide:I

    goto :goto_b

    :cond_12
    if-nez v15, :cond_13

    if-eqz v2, :cond_13

    const/4 v0, 0x1

    .line 51
    iput v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatioSide:I

    if-ne v12, v4, :cond_13

    div-float v0, v33, v11

    .line 52
    iput v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatio:F

    .line 53
    :cond_13
    :goto_b
    iget v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatioSide:I

    if-nez v0, :cond_15

    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_14

    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->isConnected()Z

    move-result v0

    if-nez v0, :cond_15

    :cond_14
    const/4 v0, 0x1

    .line 54
    iput v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatioSide:I

    goto :goto_c

    :cond_15
    const/4 v0, 0x1

    .line 55
    iget v2, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatioSide:I

    if-ne v2, v0, :cond_17

    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_16

    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->isConnected()Z

    move-result v0

    if-nez v0, :cond_17

    :cond_16
    const/4 v0, 0x0

    .line 56
    iput v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatioSide:I

    .line 57
    :cond_17
    :goto_c
    iget v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatioSide:I

    const/4 v2, -0x1

    if-ne v0, v2, :cond_1a

    .line 58
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 59
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->isConnected()Z

    move-result v0

    if-nez v0, :cond_1a

    .line 60
    :cond_18
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_19

    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_19

    const/4 v0, 0x0

    .line 61
    iput v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatioSide:I

    goto :goto_d

    .line 62
    :cond_19
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_1a

    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 63
    iget v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatio:F

    div-float v0, v33, v0

    iput v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatio:F

    const/4 v0, 0x1

    .line 64
    iput v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatioSide:I

    .line 65
    :cond_1a
    :goto_d
    iget v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatioSide:I

    const/4 v2, -0x1

    if-ne v0, v2, :cond_21

    .line 66
    iget v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintMinWidth:I

    if-lez v0, :cond_1b

    iget v2, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintMinHeight:I

    if-nez v2, :cond_1b

    const/4 v2, 0x0

    .line 67
    iput v2, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatioSide:I

    goto :goto_f

    :cond_1b
    if-nez v0, :cond_21

    .line 68
    iget v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintMinHeight:I

    if-lez v0, :cond_21

    .line 69
    iget v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatio:F

    div-float v0, v33, v0

    iput v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatio:F

    const/4 v0, 0x1

    .line 70
    iput v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatioSide:I

    goto :goto_f

    :cond_1c
    const/4 v2, 0x0

    goto :goto_e

    :cond_1d
    move v2, v5

    .line 71
    :goto_e
    aget v4, v14, v2

    const/4 v5, 0x3

    if-ne v4, v5, :cond_1f

    if-ne v1, v5, :cond_1f

    .line 72
    iput v2, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatioSide:I

    int-to-float v0, v8

    mul-float/2addr v11, v0

    float-to-int v0, v11

    const/4 v2, 0x1

    .line 73
    aget v4, v14, v2

    if-eq v4, v5, :cond_1e

    move v5, v0

    move/from16 v35, v3

    move/from16 v34, v22

    move/from16 v36, v23

    goto :goto_12

    :cond_1e
    move v5, v0

    move/from16 v36, v1

    move/from16 v33, v2

    move/from16 v35, v3

    move/from16 v34, v22

    goto :goto_13

    :cond_1f
    const/4 v2, 0x1

    .line 74
    aget v4, v14, v2

    if-ne v4, v5, :cond_21

    if-ne v3, v5, :cond_21

    .line 75
    iput v2, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatioSide:I

    const/4 v2, -0x1

    if-ne v12, v2, :cond_20

    div-float v2, v33, v11

    .line 76
    iput v2, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatio:F

    .line 77
    :cond_20
    iget v2, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatio:F

    int-to-float v0, v0

    mul-float/2addr v2, v0

    float-to-int v10, v2

    const/4 v0, 0x0

    .line 78
    aget v2, v14, v0

    const/4 v0, 0x3

    if-eq v2, v0, :cond_22

    move/from16 v36, v1

    move/from16 v34, v10

    move/from16 v35, v23

    goto :goto_11

    :cond_21
    :goto_f
    move/from16 v10, v22

    :cond_22
    move/from16 v36, v1

    move/from16 v35, v3

    move/from16 v34, v10

    move/from16 v5, v24

    const/16 v33, 0x1

    goto :goto_13

    :cond_23
    move/from16 v24, v5

    goto :goto_10

    :cond_24
    move/from16 v24, v5

    move/from16 v22, v10

    :goto_10
    move/from16 v36, v1

    move/from16 v35, v3

    move/from16 v34, v22

    :goto_11
    move/from16 v5, v24

    :goto_12
    const/16 v33, 0x0

    .line 79
    :goto_13
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedMatchConstraintDefault:[I

    const/4 v1, 0x0

    aput v36, v0, v1

    const/4 v1, 0x1

    .line 80
    aput v35, v0, v1

    if-eqz v33, :cond_26

    .line 81
    iget v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatioSide:I

    const/4 v4, -0x1

    if-eqz v0, :cond_25

    if-ne v0, v4, :cond_27

    :cond_25
    const/16 v21, 0x1

    goto :goto_14

    :cond_26
    const/4 v4, -0x1

    :cond_27
    const/16 v21, 0x0

    .line 82
    :goto_14
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    const/4 v1, 0x2

    if-ne v0, v1, :cond_28

    instance-of v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    if-eqz v0, :cond_28

    const/16 v32, 0x1

    goto :goto_15

    :cond_28
    const/16 v32, 0x0

    :goto_15
    if-eqz v32, :cond_29

    const/16 v37, 0x0

    goto :goto_16

    :cond_29
    move/from16 v37, v5

    .line 83
    :goto_16
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCenter:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->isConnected()Z

    move-result v0

    const/4 v1, 0x1

    xor-int/lit8 v38, v0, 0x1

    .line 84
    iget v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHorizontalResolution:I

    const/16 v39, 0x0

    const/4 v2, 0x2

    if-eq v0, v2, :cond_2f

    .line 85
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    iget-object v3, v0, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget-boolean v5, v3, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    if-eqz v5, :cond_2c

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget-boolean v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    if-nez v0, :cond_2a

    goto :goto_18

    .line 86
    :cond_2a
    iget v0, v3, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->value:I

    invoke-virtual {v9, v7, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;I)V

    .line 87
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->value:I

    invoke-virtual {v9, v6, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;I)V

    .line 88
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eqz v0, :cond_2b

    if-eqz v27, :cond_2b

    .line 89
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->isTerminalWidget:[Z

    const/4 v3, 0x0

    aget-boolean v0, v0, v3

    if-eqz v0, :cond_2b

    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->isInHorizontalChain()Z

    move-result v0

    if-nez v0, :cond_2b

    .line 90
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v9, v0}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v0

    const/4 v14, 0x7

    .line 91
    invoke-virtual {v9, v0, v6, v3, v14}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_17

    :cond_2b
    const/4 v14, 0x7

    :goto_17
    move-object/from16 v40, v25

    move-object/from16 v41, v30

    move-object/from16 v42, v31

    move-object/from16 v30, v6

    move-object/from16 v31, v7

    goto/16 :goto_1c

    :cond_2c
    :goto_18
    const/4 v14, 0x7

    .line 92
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eqz v0, :cond_2d

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v9, v0}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v0

    move-object/from16 v17, v0

    goto :goto_19

    :cond_2d
    move-object/from16 v17, v39

    .line 93
    :goto_19
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eqz v0, :cond_2e

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v9, v0}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v0

    move-object/from16 v20, v0

    goto :goto_1a

    :cond_2e
    move-object/from16 v20, v39

    .line 94
    :goto_1a
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->isTerminalWidget:[Z

    const/4 v3, 0x0

    aget-boolean v5, v0, v3

    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aget v8, v0, v3

    iget-object v10, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    const/16 v0, 0x8

    iget-object v11, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget v12, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mX:I

    iget v15, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinWidth:I

    move v14, v15

    iget-object v15, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMaxDimension:[I

    aget v15, v15, v3

    iget v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHorizontalBiasPercent:F

    move/from16 v16, v0

    iget v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintMinWidth:I

    move/from16 v22, v0

    iget v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintMaxWidth:I

    move/from16 v23, v0

    iget v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintPercentWidth:F

    move/from16 v24, v0

    const/4 v0, 0x1

    move v2, v0

    move-object/from16 v0, p0

    move-object/from16 v40, v25

    move-object/from16 v1, p1

    move-object/from16 v41, v30

    move/from16 v3, v27

    move-object/from16 v42, v31

    move/from16 v4, v26

    move-object/from16 v30, v6

    move-object/from16 v6, v20

    move-object/from16 v31, v7

    move-object/from16 v7, v17

    move/from16 v9, v32

    move/from16 v13, v37

    move/from16 v17, v21

    move/from16 v18, v29

    move/from16 v19, v28

    move/from16 v20, v36

    move/from16 v21, v35

    move/from16 v25, v38

    invoke-virtual/range {v0 .. v25}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->applyConstraints$enumunboxing$(Landroidx/constraintlayout/solver/LinearSystem;ZZZZLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IZLandroidx/constraintlayout/solver/widgets/ConstraintAnchor;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;IIIIFZZZIIIIFZ)V

    goto :goto_1b

    :cond_2f
    move-object/from16 v40, v25

    move-object/from16 v41, v30

    move-object/from16 v42, v31

    move-object/from16 v30, v6

    move-object/from16 v31, v7

    :goto_1b
    move-object/from16 v13, p0

    .line 95
    :goto_1c
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    iget-object v1, v0, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget-boolean v2, v1, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    if-eqz v2, :cond_32

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget-boolean v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    if-eqz v0, :cond_32

    .line 96
    iget v0, v1, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->value:I

    move-object/from16 v9, p1

    move-object/from16 v7, v42

    invoke-virtual {v9, v7, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;I)V

    .line 97
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->value:I

    move-object/from16 v6, v41

    invoke-virtual {v9, v6, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;I)V

    .line 98
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;->baseline:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->value:I

    move-object/from16 v1, v40

    invoke-virtual {v9, v1, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;I)V

    .line 99
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eqz v0, :cond_31

    if-nez v28, :cond_31

    if-eqz v26, :cond_31

    .line 100
    iget-object v2, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->isTerminalWidget:[Z

    const/4 v4, 0x1

    aget-boolean v2, v2, v4

    if-eqz v2, :cond_30

    .line 101
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v9, v0}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v0

    const/4 v2, 0x7

    const/4 v3, 0x0

    .line 102
    invoke-virtual {v9, v0, v6, v3, v2}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_1d

    :cond_30
    const/4 v2, 0x7

    const/4 v3, 0x0

    goto :goto_1d

    :cond_31
    const/4 v2, 0x7

    const/4 v3, 0x0

    const/4 v4, 0x1

    :goto_1d
    move v12, v3

    goto :goto_1e

    :cond_32
    move-object/from16 v9, p1

    move-object/from16 v1, v40

    move-object/from16 v6, v41

    move-object/from16 v7, v42

    const/4 v2, 0x7

    const/4 v3, 0x0

    const/4 v4, 0x1

    move v12, v4

    .line 103
    :goto_1e
    iget v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVerticalResolution:I

    const/4 v5, 0x2

    if-ne v0, v5, :cond_33

    move v11, v3

    goto :goto_1f

    :cond_33
    move v11, v12

    :goto_1f
    if-eqz v11, :cond_3e

    .line 104
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aget v0, v0, v4

    if-ne v0, v5, :cond_34

    instance-of v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    if-eqz v0, :cond_34

    move/from16 v17, v4

    goto :goto_20

    :cond_34
    move/from16 v17, v3

    :goto_20
    if-eqz v17, :cond_35

    move/from16 v34, v3

    :cond_35
    if-eqz v33, :cond_37

    .line 105
    iget v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatioSide:I

    if-eq v0, v4, :cond_36

    const/4 v5, -0x1

    if-ne v0, v5, :cond_37

    :cond_36
    move/from16 v18, v4

    goto :goto_21

    :cond_37
    move/from16 v18, v3

    .line 106
    :goto_21
    iget-object v0, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eqz v0, :cond_38

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v9, v0}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v0

    goto :goto_22

    :cond_38
    move-object/from16 v0, v39

    .line 107
    :goto_22
    iget-object v5, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eqz v5, :cond_39

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v9, v5}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v5

    move-object/from16 v39, v5

    .line 108
    :cond_39
    iget v5, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBaselineDistance:I

    if-gtz v5, :cond_3a

    iget v8, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    const/16 v10, 0x8

    if-ne v8, v10, :cond_3d

    goto :goto_23

    :cond_3a
    const/16 v10, 0x8

    .line 109
    :goto_23
    invoke-virtual {v9, v1, v7, v5, v2}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    .line 110
    iget-object v5, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBaseline:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v5, :cond_3c

    .line 111
    invoke-virtual {v9, v5}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v5

    .line 112
    invoke-virtual {v9, v1, v5, v3, v2}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    if-eqz v26, :cond_3b

    .line 113
    iget-object v1, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v9, v1}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v1

    const/4 v2, 0x5

    .line 114
    invoke-virtual {v9, v0, v1, v3, v2}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    :cond_3b
    move/from16 v25, v3

    goto :goto_24

    .line 115
    :cond_3c
    iget v5, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    if-ne v5, v10, :cond_3d

    .line 116
    invoke-virtual {v9, v1, v7, v3, v2}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    :cond_3d
    move/from16 v25, v38

    :goto_24
    const/4 v2, 0x0

    .line 117
    iget-object v1, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->isTerminalWidget:[Z

    aget-boolean v5, v1, v4

    iget-object v1, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aget v8, v1, v4

    iget-object v10, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v11, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget v12, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mY:I

    iget v14, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinHeight:I

    iget-object v1, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMaxDimension:[I

    aget v15, v1, v4

    iget v1, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVerticalBiasPercent:F

    move/from16 v16, v1

    iget v1, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintMinHeight:I

    move/from16 v22, v1

    iget v1, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintMaxHeight:I

    move/from16 v23, v1

    iget v1, v13, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintPercentHeight:F

    move/from16 v24, v1

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v3, v26

    move/from16 v4, v27

    move-object/from16 v26, v6

    move-object/from16 v6, v39

    move-object/from16 v27, v7

    move-object/from16 v7, v19

    move/from16 v9, v17

    move/from16 v13, v34

    move/from16 v17, v18

    move/from16 v18, v28

    move/from16 v19, v29

    move/from16 v20, v35

    move/from16 v21, v36

    invoke-virtual/range {v0 .. v25}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->applyConstraints$enumunboxing$(Landroidx/constraintlayout/solver/LinearSystem;ZZZZLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IZLandroidx/constraintlayout/solver/widgets/ConstraintAnchor;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;IIIIFZZZIIIIFZ)V

    goto :goto_25

    :cond_3e
    move-object/from16 v26, v6

    move-object/from16 v27, v7

    :goto_25
    if-eqz v33, :cond_40

    const/4 v6, 0x7

    move-object/from16 v7, p0

    .line 118
    iget v0, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatioSide:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3f

    .line 119
    iget v5, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatio:F

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    move-object/from16 v2, v27

    move-object/from16 v3, v30

    move-object/from16 v4, v31

    invoke-virtual/range {v0 .. v6}, Landroidx/constraintlayout/solver/LinearSystem;->addRatio(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;FI)V

    goto :goto_26

    .line 120
    :cond_3f
    iget v5, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatio:F

    const/4 v6, 0x7

    move-object/from16 v0, p1

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    move-object/from16 v3, v26

    move-object/from16 v4, v27

    invoke-virtual/range {v0 .. v6}, Landroidx/constraintlayout/solver/LinearSystem;->addRatio(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;FI)V

    goto :goto_26

    :cond_40
    move-object/from16 v7, p0

    .line 121
    :goto_26
    iget-object v0, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCenter:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_41

    .line 122
    iget-object v0, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCenter:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 123
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 124
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 125
    iget v1, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCircleConstraintAngle:F

    const/high16 v2, 0x42b40000    # 90.0f

    add-float/2addr v1, v2

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v1

    double-to-float v1, v1

    iget-object v2, v7, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCenter:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v2}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v2

    .line 126
    sget-object v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->LEFT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    invoke-virtual {v7, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v4

    move-object/from16 v5, p1

    invoke-virtual {v5, v4}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v4

    .line 127
    sget-object v6, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->TOP:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    invoke-virtual {v7, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v8

    invoke-virtual {v5, v8}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v10

    .line 128
    sget-object v8, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->RIGHT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    invoke-virtual {v7, v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v9

    invoke-virtual {v5, v9}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v15

    .line 129
    sget-object v9, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->BOTTOM:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    invoke-virtual {v7, v9}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v11

    .line 130
    invoke-virtual {v0, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v3

    invoke-virtual {v5, v3}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v3

    .line 131
    invoke-virtual {v0, v6}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v12

    .line 132
    invoke-virtual {v0, v8}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v16

    .line 133
    invoke-virtual {v0, v9}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v0

    invoke-virtual {v5, v0}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v13

    .line 134
    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/solver/LinearSystem;->createRow()Landroidx/constraintlayout/solver/ArrayRow;

    move-result-object v0

    float-to-double v6, v1

    .line 135
    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v8

    int-to-double v1, v2

    mul-double/2addr v8, v1

    double-to-float v14, v8

    move-object v9, v0

    .line 136
    invoke-virtual/range {v9 .. v14}, Landroidx/constraintlayout/solver/ArrayRow;->createRowWithAngle(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;F)Landroidx/constraintlayout/solver/ArrayRow;

    .line 137
    invoke-virtual {v5, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addConstraint(Landroidx/constraintlayout/solver/ArrayRow;)V

    .line 138
    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/solver/LinearSystem;->createRow()Landroidx/constraintlayout/solver/ArrayRow;

    move-result-object v0

    .line 139
    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v6

    mul-double/2addr v6, v1

    double-to-float v11, v6

    move-object v6, v0

    move-object v7, v4

    move-object v8, v15

    move-object v9, v3

    move-object/from16 v10, v16

    .line 140
    invoke-virtual/range {v6 .. v11}, Landroidx/constraintlayout/solver/ArrayRow;->createRowWithAngle(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;F)Landroidx/constraintlayout/solver/ArrayRow;

    .line 141
    invoke-virtual {v5, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addConstraint(Landroidx/constraintlayout/solver/ArrayRow;)V

    :cond_41
    return-void
.end method

.method public allowedInBarrier()Z
    .locals 1

    .line 1
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    const/16 v0, 0x8

    if-eq p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public final applyConstraints$enumunboxing$(Landroidx/constraintlayout/solver/LinearSystem;ZZZZLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IZLandroidx/constraintlayout/solver/widgets/ConstraintAnchor;Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;IIIIFZZZIIIIFZ)V
    .locals 25

    move-object/from16 v0, p0

    move-object/from16 v9, p1

    move-object/from16 v10, p6

    move-object/from16 v11, p7

    move-object/from16 v12, p10

    move-object/from16 v13, p11

    move/from16 v14, p14

    move/from16 v1, p15

    move/from16 v2, p21

    move/from16 v3, p22

    move/from16 v4, p23

    .line 1
    sget-object v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->BOTTOM:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    invoke-virtual {v9, v12}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v8

    .line 2
    invoke-virtual {v9, v13}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v7

    .line 3
    iget-object v6, v12, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 4
    invoke-virtual {v9, v6}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v6

    .line 5
    iget-object v15, v13, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 6
    invoke-virtual {v9, v15}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v15

    .line 7
    invoke-virtual/range {p10 .. p10}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->isConnected()Z

    move-result v21

    .line 8
    invoke-virtual/range {p11 .. p11}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->isConnected()Z

    move-result v22

    move-object/from16 v16, v15

    .line 9
    iget-object v15, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCenter:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v15}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->isConnected()Z

    move-result v23

    if-eqz v22, :cond_0

    add-int/lit8 v15, v21, 0x1

    goto :goto_0

    :cond_0
    move/from16 v15, v21

    :goto_0
    if-eqz v23, :cond_1

    add-int/lit8 v15, v15, 0x1

    :cond_1
    if-eqz p17, :cond_2

    const/4 v11, 0x3

    goto :goto_1

    :cond_2
    move/from16 v11, p20

    .line 10
    :goto_1
    invoke-static/range {p8 .. p8}, Landroidx/constraintlayout/solver/SolverVariable$Type$r8$EnumUnboxingUtility;->$enumboxing$ordinal(I)I

    move-result v2

    const/4 v13, 0x1

    if-eqz v2, :cond_5

    if-eq v2, v13, :cond_5

    const/4 v13, 0x2

    if-eq v2, v13, :cond_3

    goto :goto_2

    :cond_3
    const/4 v2, 0x4

    if-ne v11, v2, :cond_4

    goto :goto_3

    :cond_4
    const/4 v13, 0x1

    goto :goto_4

    :cond_5
    :goto_2
    const/4 v2, 0x4

    :goto_3
    const/4 v13, 0x0

    .line 11
    :goto_4
    iget v2, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    const/16 v10, 0x8

    if-ne v2, v10, :cond_6

    const/4 v2, 0x0

    const/4 v13, 0x0

    goto :goto_5

    :cond_6
    move/from16 v2, p13

    :goto_5
    if-eqz p25, :cond_8

    if-nez v21, :cond_7

    if-nez v22, :cond_7

    if-nez v23, :cond_7

    move/from16 v10, p12

    .line 12
    invoke-virtual {v9, v8, v10}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;I)V

    goto :goto_6

    :cond_7
    if-eqz v21, :cond_8

    if-nez v22, :cond_8

    .line 13
    invoke-virtual/range {p10 .. p10}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v10

    const/4 v0, 0x7

    invoke-virtual {v9, v8, v6, v10, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    goto :goto_7

    :cond_8
    :goto_6
    const/4 v0, 0x7

    :goto_7
    if-nez v13, :cond_b

    if-eqz p9, :cond_a

    const/4 v5, 0x3

    const/4 v10, 0x0

    .line 14
    invoke-virtual {v9, v7, v8, v10, v5}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    if-lez v14, :cond_9

    .line 15
    invoke-virtual {v9, v7, v8, v14, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    :cond_9
    const v2, 0x7fffffff

    if-ge v1, v2, :cond_18

    .line 16
    invoke-virtual {v9, v7, v8, v1, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addLowerThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto/16 :goto_b

    :cond_a
    const/4 v10, 0x0

    .line 17
    invoke-virtual {v9, v7, v8, v2, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    goto/16 :goto_b

    :cond_b
    const/4 v0, 0x2

    const/4 v10, 0x0

    if-eq v15, v0, :cond_e

    if-nez p17, :cond_e

    const/4 v0, 0x1

    if-eq v11, v0, :cond_c

    if-nez v11, :cond_e

    .line 18
    :cond_c
    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    if-lez v4, :cond_d

    .line 19
    invoke-static {v4, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    :cond_d
    const/4 v1, 0x7

    .line 20
    invoke-virtual {v9, v7, v8, v0, v1}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    move v13, v10

    goto :goto_b

    :cond_e
    const/4 v0, -0x2

    if-ne v3, v0, :cond_f

    move v3, v2

    :cond_f
    if-ne v4, v0, :cond_10

    move v4, v2

    :cond_10
    if-lez v2, :cond_11

    const/4 v0, 0x1

    if-eq v11, v0, :cond_11

    move v2, v10

    :cond_11
    if-lez v3, :cond_12

    const/4 v0, 0x7

    .line 21
    invoke-virtual {v9, v7, v8, v3, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 22
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    :cond_12
    if-lez v4, :cond_15

    if-eqz p3, :cond_13

    const/4 v0, 0x1

    if-ne v11, v0, :cond_13

    move v0, v10

    goto :goto_8

    :cond_13
    const/4 v0, 0x1

    :goto_8
    if-eqz v0, :cond_14

    const/4 v0, 0x7

    .line 23
    invoke-virtual {v9, v7, v8, v4, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addLowerThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_9

    :cond_14
    const/4 v0, 0x7

    .line 24
    :goto_9
    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    goto :goto_a

    :cond_15
    const/4 v0, 0x7

    :goto_a
    const/4 v1, 0x1

    if-ne v11, v1, :cond_19

    if-eqz p3, :cond_16

    .line 25
    invoke-virtual {v9, v7, v8, v2, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    goto :goto_b

    :cond_16
    if-eqz p18, :cond_17

    const/4 v1, 0x5

    .line 26
    invoke-virtual {v9, v7, v8, v2, v1}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    .line 27
    invoke-virtual {v9, v7, v8, v2, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addLowerThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_b

    :cond_17
    const/4 v1, 0x5

    .line 28
    invoke-virtual {v9, v7, v8, v2, v1}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    .line 29
    invoke-virtual {v9, v7, v8, v2, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addLowerThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    :cond_18
    :goto_b
    const/4 v0, 0x2

    move-object/from16 v1, p0

    move/from16 v17, v13

    move-object/from16 v5, v16

    move/from16 v13, p5

    move/from16 v16, v3

    goto/16 :goto_e

    :cond_19
    const/4 v0, 0x2

    if-ne v11, v0, :cond_1c

    .line 30
    iget-object v1, v12, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mType:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    .line 31
    sget-object v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->TOP:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    if-eq v1, v2, :cond_1b

    if-ne v1, v5, :cond_1a

    goto :goto_c

    :cond_1a
    move-object/from16 v1, p0

    .line 32
    iget-object v2, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    sget-object v5, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->LEFT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    invoke-virtual {v2, v5}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v2

    invoke-virtual {v9, v2}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v2

    .line 33
    iget-object v5, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    sget-object v13, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;->RIGHT:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;

    invoke-virtual {v5, v13}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v5

    invoke-virtual {v9, v5}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v5

    goto :goto_d

    :cond_1b
    :goto_c
    move-object/from16 v1, p0

    .line 34
    iget-object v13, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    invoke-virtual {v13, v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v2

    invoke-virtual {v9, v2}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v2

    .line 35
    iget-object v13, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    invoke-virtual {v13, v5}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    move-result-object v5

    invoke-virtual {v9, v5}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v5

    :goto_d
    move-object/from16 v19, v2

    move-object/from16 v18, v5

    .line 36
    invoke-virtual/range {p1 .. p1}, Landroidx/constraintlayout/solver/LinearSystem;->createRow()Landroidx/constraintlayout/solver/ArrayRow;

    move-result-object v2

    move v13, v15

    move-object/from16 v5, v16

    move-object v15, v2

    move-object/from16 v16, v7

    move-object/from16 v17, v8

    move/from16 v20, p24

    invoke-virtual/range {v15 .. v20}, Landroidx/constraintlayout/solver/ArrayRow;->createRowDimensionRatio(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;F)Landroidx/constraintlayout/solver/ArrayRow;

    invoke-virtual {v9, v2}, Landroidx/constraintlayout/solver/LinearSystem;->addConstraint(Landroidx/constraintlayout/solver/ArrayRow;)V

    move/from16 v16, v3

    move/from16 v17, v10

    move v15, v13

    move/from16 v13, p5

    goto :goto_e

    :cond_1c
    move-object/from16 v1, p0

    move-object/from16 v5, v16

    move/from16 v16, v3

    move/from16 v17, v13

    const/4 v13, 0x1

    :goto_e
    if-eqz p25, :cond_4a

    if-eqz p18, :cond_1d

    move-object/from16 v3, p6

    move v5, v0

    move-object v2, v7

    move-object v12, v8

    move/from16 p5, v13

    const/4 v4, 0x3

    move-object/from16 v0, p7

    goto/16 :goto_25

    :cond_1d
    if-nez v21, :cond_1e

    if-nez v22, :cond_1e

    if-nez v23, :cond_1e

    goto/16 :goto_22

    :cond_1e
    if-eqz v21, :cond_1f

    if-nez v22, :cond_1f

    goto/16 :goto_22

    :cond_1f
    if-nez v21, :cond_20

    if-eqz v22, :cond_20

    .line 37
    invoke-virtual/range {p11 .. p11}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v0

    neg-int v0, v0

    const/4 v1, 0x7

    invoke-virtual {v9, v7, v5, v0, v1}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    if-eqz p3, :cond_46

    move-object/from16 v15, p6

    const/4 v0, 0x5

    .line 38
    invoke-virtual {v9, v8, v15, v10, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto/16 :goto_22

    :cond_20
    move-object/from16 v15, p6

    if-eqz v21, :cond_46

    if-eqz v22, :cond_46

    .line 39
    iget-object v2, v12, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v3, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    move-object/from16 v2, p11

    .line 40
    iget-object v10, v2, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v10, v10, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 41
    iget-object v0, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eqz v17, :cond_31

    if-nez v11, :cond_24

    if-nez v4, :cond_21

    if-nez v16, :cond_21

    const/16 p0, 0x7

    const/4 v4, 0x7

    const/16 v18, 0x0

    const/16 v19, 0x1

    goto :goto_f

    :cond_21
    const/16 p0, 0x5

    const/4 v4, 0x5

    const/16 v18, 0x1

    const/16 v19, 0x0

    .line 42
    :goto_f
    instance-of v1, v3, Landroidx/constraintlayout/solver/widgets/Barrier;

    if-nez v1, :cond_22

    instance-of v1, v10, Landroidx/constraintlayout/solver/widgets/Barrier;

    if-eqz v1, :cond_23

    :cond_22
    const/4 v4, 0x4

    :cond_23
    move v1, v4

    move/from16 v2, v18

    move/from16 v20, v19

    const/4 v4, 0x0

    const/16 v19, 0x5

    move/from16 v18, p0

    goto/16 :goto_19

    :cond_24
    const/4 v2, 0x1

    if-ne v11, v2, :cond_25

    const/4 v1, 0x7

    const/4 v2, 0x1

    const/4 v4, 0x1

    goto/16 :goto_18

    :cond_25
    const/4 v2, 0x3

    if-ne v11, v2, :cond_30

    .line 43
    iget v1, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatioSide:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_28

    if-eqz p19, :cond_27

    if-eqz p3, :cond_26

    :goto_10
    const/4 v1, 0x7

    const/4 v2, 0x5

    goto :goto_15

    :cond_26
    const/4 v1, 0x7

    const/4 v2, 0x5

    const/4 v4, 0x4

    goto :goto_16

    :cond_27
    const/4 v1, 0x7

    const/4 v2, 0x5

    const/4 v4, 0x7

    goto :goto_16

    :cond_28
    if-eqz p17, :cond_2c

    move/from16 v1, p21

    const/4 v2, 0x2

    if-eq v1, v2, :cond_2a

    const/4 v2, 0x1

    if-ne v1, v2, :cond_29

    goto :goto_11

    :cond_29
    const/4 v1, 0x0

    goto :goto_12

    :cond_2a
    :goto_11
    const/4 v1, 0x1

    :goto_12
    if-nez v1, :cond_2b

    goto :goto_10

    :cond_2b
    const/4 v1, 0x5

    goto :goto_13

    :cond_2c
    if-lez v4, :cond_2d

    const/4 v1, 0x5

    goto :goto_14

    :cond_2d
    if-nez v4, :cond_2f

    if-nez v16, :cond_2f

    if-nez p19, :cond_2e

    const/4 v1, 0x7

    goto :goto_14

    :cond_2e
    if-eq v3, v0, :cond_2b

    if-eq v10, v0, :cond_2b

    const/4 v1, 0x4

    :goto_13
    const/4 v2, 0x4

    goto :goto_15

    :cond_2f
    const/4 v1, 0x4

    :goto_14
    move v2, v1

    const/4 v1, 0x5

    :goto_15
    const/4 v4, 0x5

    :goto_16
    move/from16 v18, v1

    move v1, v2

    move/from16 v19, v4

    const/4 v2, 0x1

    const/4 v4, 0x1

    const/16 v20, 0x1

    goto :goto_19

    :cond_30
    const/4 v1, 0x0

    const/4 v2, 0x0

    goto :goto_17

    :cond_31
    const/4 v1, 0x1

    const/4 v2, 0x1

    :goto_17
    move v4, v1

    const/4 v1, 0x5

    :goto_18
    move/from16 v18, v1

    const/4 v1, 0x4

    const/16 v19, 0x5

    const/16 v20, 0x0

    :goto_19
    if-eqz v4, :cond_32

    if-ne v6, v5, :cond_32

    if-eq v3, v0, :cond_32

    const/16 v21, 0x0

    const/16 v24, 0x0

    goto :goto_1a

    :cond_32
    move/from16 v21, v4

    const/16 v24, 0x1

    :goto_1a
    if-eqz v2, :cond_33

    .line 44
    invoke-virtual/range {p10 .. p10}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    .line 45
    invoke-virtual/range {p11 .. p11}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v22

    move-object v2, v0

    move-object/from16 v0, p1

    move v12, v1

    move-object v1, v8

    move/from16 p5, v13

    move-object v13, v2

    move-object v2, v6

    move/from16 v23, v11

    move-object v11, v3

    move v3, v4

    move/from16 v4, p16

    move-object/from16 p0, v5

    move-object v14, v6

    move-object v6, v7

    move-object v15, v7

    move/from16 v7, v22

    move/from16 v22, v12

    move-object v12, v8

    move/from16 v8, v19

    .line 46
    invoke-virtual/range {v0 .. v8}, Landroidx/constraintlayout/solver/LinearSystem;->addCentering(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_1b

    :cond_33
    move/from16 v22, v1

    move-object/from16 p0, v5

    move-object v14, v6

    move-object v15, v7

    move-object v12, v8

    move/from16 v23, v11

    move/from16 p5, v13

    move-object v13, v0

    move-object v11, v3

    :goto_1b
    const/4 v0, 0x6

    if-eqz v21, :cond_36

    move-object/from16 v1, p0

    if-eqz p3, :cond_35

    if-eq v14, v1, :cond_35

    if-nez v17, :cond_35

    .line 47
    instance-of v2, v11, Landroidx/constraintlayout/solver/widgets/Barrier;

    if-nez v2, :cond_34

    instance-of v2, v10, Landroidx/constraintlayout/solver/widgets/Barrier;

    if-eqz v2, :cond_35

    :cond_34
    move v2, v0

    goto :goto_1c

    :cond_35
    move/from16 v2, v18

    .line 48
    :goto_1c
    invoke-virtual/range {p10 .. p10}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    invoke-virtual {v9, v12, v14, v3, v2}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    .line 49
    invoke-virtual/range {p11 .. p11}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    neg-int v3, v3

    invoke-virtual {v9, v15, v1, v3, v2}, Landroidx/constraintlayout/solver/LinearSystem;->addLowerThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_1d

    :cond_36
    move-object/from16 v1, p0

    move/from16 v2, v18

    :goto_1d
    if-eqz v24, :cond_41

    if-eqz v20, :cond_3f

    if-eqz p19, :cond_37

    if-eqz p4, :cond_3f

    :cond_37
    if-eq v11, v13, :cond_39

    if-ne v10, v13, :cond_38

    goto :goto_1e

    :cond_38
    move/from16 v0, v22

    .line 50
    :cond_39
    :goto_1e
    instance-of v3, v11, Landroidx/constraintlayout/solver/widgets/Guideline;

    if-nez v3, :cond_3a

    instance-of v3, v10, Landroidx/constraintlayout/solver/widgets/Guideline;

    if-eqz v3, :cond_3b

    :cond_3a
    const/4 v0, 0x5

    .line 51
    :cond_3b
    instance-of v3, v11, Landroidx/constraintlayout/solver/widgets/Barrier;

    if-nez v3, :cond_3c

    instance-of v3, v10, Landroidx/constraintlayout/solver/widgets/Barrier;

    if-eqz v3, :cond_3d

    :cond_3c
    const/4 v0, 0x5

    :cond_3d
    move/from16 v4, v22

    if-eqz p19, :cond_3e

    const/4 v0, 0x5

    .line 52
    :cond_3e
    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_1f

    :cond_3f
    move/from16 v4, v22

    move v0, v4

    :goto_1f
    if-eqz p3, :cond_40

    .line 53
    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 54
    :cond_40
    invoke-virtual/range {p10 .. p10}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v2

    invoke-virtual {v9, v12, v14, v2, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    .line 55
    invoke-virtual/range {p11 .. p11}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v2

    neg-int v2, v2

    invoke-virtual {v9, v15, v1, v2, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;

    :cond_41
    if-eqz p3, :cond_43

    move-object/from16 v0, p6

    move-object v2, v15

    if-ne v0, v14, :cond_42

    .line 56
    invoke-virtual/range {p10 .. p10}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v10

    goto :goto_20

    :cond_42
    const/4 v10, 0x0

    :goto_20
    if-eq v14, v0, :cond_44

    const/4 v3, 0x5

    .line 57
    invoke-virtual {v9, v12, v0, v10, v3}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_21

    :cond_43
    move-object v2, v15

    :cond_44
    :goto_21
    if-eqz p3, :cond_47

    if-eqz v17, :cond_47

    if-nez p14, :cond_47

    if-nez v16, :cond_47

    if-eqz v17, :cond_45

    move/from16 v11, v23

    const/4 v0, 0x3

    if-ne v11, v0, :cond_45

    const/4 v0, 0x7

    const/4 v3, 0x0

    .line 58
    invoke-virtual {v9, v2, v12, v3, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_23

    :cond_45
    const/4 v3, 0x0

    const/4 v0, 0x5

    .line 59
    invoke-virtual {v9, v2, v12, v3, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    goto :goto_23

    :cond_46
    :goto_22
    move-object v1, v5

    move-object v2, v7

    move/from16 p5, v13

    :cond_47
    :goto_23
    if-eqz p3, :cond_49

    if-eqz p5, :cond_49

    move-object/from16 v0, p11

    .line 60
    iget-object v3, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v3, :cond_48

    .line 61
    invoke-virtual/range {p11 .. p11}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v10

    move-object/from16 v0, p7

    goto :goto_24

    :cond_48
    move-object/from16 v0, p7

    const/4 v10, 0x0

    :goto_24
    if-eq v1, v0, :cond_49

    const/4 v1, 0x5

    .line 62
    invoke-virtual {v9, v0, v2, v10, v1}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    :cond_49
    return-void

    :cond_4a
    move-object/from16 v3, p6

    move-object/from16 v0, p7

    move-object v2, v7

    move-object v12, v8

    move/from16 p5, v13

    const/4 v4, 0x3

    const/4 v5, 0x2

    :goto_25
    if-ge v15, v5, :cond_4f

    if-eqz p3, :cond_4f

    if-eqz p5, :cond_4f

    const/4 v5, 0x7

    const/4 v6, 0x0

    .line 63
    invoke-virtual {v9, v12, v3, v6, v5}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    if-nez p2, :cond_4c

    .line 64
    iget-object v3, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBaseline:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-nez v3, :cond_4b

    goto :goto_26

    :cond_4b
    const/4 v10, 0x0

    goto :goto_27

    :cond_4c
    :goto_26
    const/4 v10, 0x1

    :goto_27
    if-nez p2, :cond_4e

    .line 65
    iget-object v1, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBaseline:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v1, :cond_4e

    .line 66
    iget-object v1, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    .line 67
    iget v3, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mDimensionRatio:F

    const/4 v5, 0x0

    cmpl-float v3, v3, v5

    if-eqz v3, :cond_4d

    iget-object v1, v1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v3, 0x0

    aget v5, v1, v3

    if-ne v5, v4, :cond_4d

    const/4 v3, 0x1

    aget v1, v1, v3

    if-ne v1, v4, :cond_4d

    move v13, v3

    goto :goto_28

    :cond_4d
    const/4 v13, 0x0

    goto :goto_28

    :cond_4e
    move v13, v10

    :goto_28
    if-eqz v13, :cond_4f

    const/4 v1, 0x7

    const/4 v3, 0x0

    .line 68
    invoke-virtual {v9, v0, v2, v3, v1}, Landroidx/constraintlayout/solver/LinearSystem;->addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V

    :cond_4f
    return-void
.end method

.method public createObjectVariables(Landroidx/constraintlayout/solver/LinearSystem;)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1, v0}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 2
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1, v0}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 3
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1, v0}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 4
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1, v0}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    .line 5
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBaselineDistance:I

    if-lez v0, :cond_0

    .line 6
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBaseline:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1, p0}, Landroidx/constraintlayout/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;

    :cond_0
    return-void
.end method

.method public getAnchor(Landroidx/constraintlayout/solver/widgets/ConstraintAnchor$Type;)Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 2
    new-instance p0, Ljava/lang/AssertionError;

    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p0

    :pswitch_0
    const/4 p0, 0x0

    return-object p0

    .line 3
    :pswitch_1
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCenterY:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    return-object p0

    .line 4
    :pswitch_2
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCenterX:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    return-object p0

    .line 5
    :pswitch_3
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCenter:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    return-object p0

    .line 6
    :pswitch_4
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBaseline:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    return-object p0

    .line 7
    :pswitch_5
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    return-object p0

    .line 8
    :pswitch_6
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    return-object p0

    .line 9
    :pswitch_7
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    return-object p0

    .line 10
    :pswitch_8
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public getBottom()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getY()I

    move-result v0

    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHeight:I

    add-int/2addr v0, p0

    return v0
.end method

.method public getDimensionBehaviour$enumunboxing$(I)I
    .locals 1

    if-nez p1, :cond_0

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHorizontalDimensionBehaviour$enumunboxing$()I

    move-result p0

    return p0

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 2
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getVerticalDimensionBehaviour$enumunboxing$()I

    move-result p0

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public getHeight()I
    .locals 2

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    const/4 p0, 0x0

    return p0

    .line 2
    :cond_0
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHeight:I

    return p0
.end method

.method public getHorizontalDimensionBehaviour$enumunboxing$()I
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v0, 0x0

    aget p0, p0, v0

    return p0
.end method

.method public getNextChainMember(I)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .locals 1

    if-nez p1, :cond_0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz p1, :cond_1

    iget-object v0, p1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-ne v0, p0, :cond_1

    .line 2
    iget-object p0, p1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    return-object p0

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 3
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz p1, :cond_1

    iget-object v0, p1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-ne v0, p0, :cond_1

    .line 4
    iget-object p0, p1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    return-object p0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public getPreviousChainMember(I)Landroidx/constraintlayout/solver/widgets/ConstraintWidget;
    .locals 1

    if-nez p1, :cond_0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz p1, :cond_1

    iget-object v0, p1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-ne v0, p0, :cond_1

    .line 2
    iget-object p0, p1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    return-object p0

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 3
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz p1, :cond_1

    iget-object v0, p1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-ne v0, p0, :cond_1

    .line 4
    iget-object p0, p1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mOwner:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    return-object p0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public getRight()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getX()I

    move-result v0

    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWidth:I

    add-int/2addr v0, p0

    return v0
.end method

.method public getVerticalDimensionBehaviour$enumunboxing$()I
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v0, 0x1

    aget p0, p0, v0

    return p0
.end method

.method public getWidth()I
    .locals 2

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    const/4 p0, 0x0

    return p0

    .line 2
    :cond_0
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWidth:I

    return p0
.end method

.method public getX()I
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eqz v0, :cond_0

    instance-of v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    if-eqz v1, :cond_0

    .line 2
    check-cast v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mPaddingLeft:I

    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mX:I

    add-int/2addr v0, p0

    return v0

    .line 3
    :cond_0
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mX:I

    return p0
.end method

.method public getY()I
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    if-eqz v0, :cond_0

    instance-of v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    if-eqz v1, :cond_0

    .line 2
    check-cast v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    iget v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->mPaddingTop:I

    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mY:I

    add-int/2addr v0, p0

    return v0

    .line 3
    :cond_0
    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mY:I

    return p0
.end method

.method public final isChainHead(I)Z
    .locals 3

    mul-int/lit8 p1, p1, 0x2

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListAnchors:[Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v0, p0, p1

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    aget-object v0, p0, p1

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object v2, p0, p1

    if-eq v0, v2, :cond_0

    add-int/2addr p1, v1

    aget-object v0, p0, p1

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v0, :cond_0

    aget-object v0, p0, p1

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    aget-object p0, p0, p1

    if-ne v0, p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isInHorizontalChain()Z
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v1, :cond_0

    iget-object v1, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eq v1, v0, :cond_1

    :cond_0
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v0, :cond_2

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-ne v0, p0, :cond_2

    :cond_1
    const/4 p0, 0x1

    return p0

    :cond_2
    const/4 p0, 0x0

    return p0
.end method

.method public isInVerticalChain()Z
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v1, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v1, :cond_0

    iget-object v1, v1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eq v1, v0, :cond_1

    :cond_0
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v0, :cond_2

    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mTarget:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-ne v0, p0, :cond_2

    :cond_1
    const/4 p0, 0x1

    return p0

    :cond_2
    const/4 p0, 0x0

    return p0
.end method

.method public reset()V
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->reset()V

    .line 2
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->reset()V

    .line 3
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->reset()V

    .line 4
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->reset()V

    .line 5
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBaseline:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->reset()V

    .line 6
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCenterX:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->reset()V

    .line 7
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCenterY:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->reset()V

    .line 8
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCenter:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->reset()V

    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mParent:Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    const/4 v1, 0x0

    .line 10
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCircleConstraintAngle:F

    const/4 v2, 0x0

    .line 11
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWidth:I

    .line 12
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHeight:I

    .line 13
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mDimensionRatio:F

    const/4 v1, -0x1

    .line 14
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mDimensionRatioSide:I

    .line 15
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mX:I

    .line 16
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mY:I

    .line 17
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBaselineDistance:I

    .line 18
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinWidth:I

    .line 19
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinHeight:I

    const/high16 v3, 0x3f000000    # 0.5f

    .line 20
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHorizontalBiasPercent:F

    .line 21
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVerticalBiasPercent:F

    .line 22
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v4, 0x1

    aput v4, v3, v2

    .line 23
    aput v4, v3, v4

    .line 24
    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCompanionWidget:Ljava/lang/Object;

    .line 25
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    .line 26
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHorizontalChainStyle:I

    .line 27
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVerticalChainStyle:I

    .line 28
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWeight:[F

    const/high16 v3, -0x40800000    # -1.0f

    aput v3, v0, v2

    .line 29
    aput v3, v0, v4

    .line 30
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHorizontalResolution:I

    .line 31
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVerticalResolution:I

    .line 32
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMaxDimension:[I

    const v3, 0x7fffffff

    aput v3, v0, v2

    .line 33
    aput v3, v0, v4

    .line 34
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintDefaultWidth:I

    .line 35
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintDefaultHeight:I

    const/high16 v0, 0x3f800000    # 1.0f

    .line 36
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintPercentWidth:F

    .line 37
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintPercentHeight:F

    .line 38
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintMaxWidth:I

    .line 39
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintMaxHeight:I

    .line 40
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintMinWidth:I

    .line 41
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMatchConstraintMinHeight:I

    .line 42
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatioSide:I

    .line 43
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedDimensionRatio:F

    .line 44
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->isTerminalWidget:[Z

    aput-boolean v4, p0, v2

    .line 45
    aput-boolean v4, p0, v4

    return-void
.end method

.method public resetSolverVariables(Landroidx/constraintlayout/solver/Cache;)V
    .locals 0

    .line 1
    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->resetSolverVariable()V

    .line 2
    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->resetSolverVariable()V

    .line 3
    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->resetSolverVariable()V

    .line 4
    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->resetSolverVariable()V

    .line 5
    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBaseline:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->resetSolverVariable()V

    .line 6
    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCenter:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->resetSolverVariable()V

    .line 7
    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCenterX:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->resetSolverVariable()V

    .line 8
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mCenterY:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->resetSolverVariable()V

    return-void
.end method

.method public setHeight(I)V
    .locals 1

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHeight:I

    .line 2
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinHeight:I

    if-ge p1, v0, :cond_0

    .line 3
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHeight:I

    :cond_0
    return-void
.end method

.method public setHorizontalDimensionBehaviour$enumunboxing$(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v0, 0x0

    aput p1, p0, v0

    return-void
.end method

.method public setMinHeight(I)V
    .locals 0

    if-gez p1, :cond_0

    const/4 p1, 0x0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinHeight:I

    goto :goto_0

    .line 2
    :cond_0
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinHeight:I

    :goto_0
    return-void
.end method

.method public setMinWidth(I)V
    .locals 0

    if-gez p1, :cond_0

    const/4 p1, 0x0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinWidth:I

    goto :goto_0

    .line 2
    :cond_0
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinWidth:I

    :goto_0
    return-void
.end method

.method public setVerticalDimensionBehaviour$enumunboxing$(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    const/4 v0, 0x1

    aput p1, p0, v0

    return-void
.end method

.method public setWidth(I)V
    .locals 1

    .line 1
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWidth:I

    .line 2
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinWidth:I

    if-ge p1, v0, :cond_0

    .line 3
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWidth:I

    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    const-string v0, ""

    .line 1
    invoke-static {v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mDebugName:Ljava/lang/String;

    if-eqz v2, :cond_0

    const-string v0, "id: "

    invoke-static {v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mDebugName:Ljava/lang/String;

    const-string v3, " "

    invoke-static {v0, v2, v3}, Landroid/support/v4/app/FragmentTabHost$SavedState$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "("

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mX:I

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mY:I

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ") - ("

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWidth:I

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " x "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHeight:I

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public updateFromRuns(ZZ)V
    .locals 7

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    .line 2
    iget-boolean v1, v0, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->resolved:Z

    and-int/2addr p1, v1

    .line 3
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    .line 4
    iget-boolean v2, v1, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->resolved:Z

    and-int/2addr p2, v2

    .line 5
    iget-object v2, v0, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget v2, v2, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->value:I

    .line 6
    iget-object v3, v1, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget v3, v3, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->value:I

    .line 7
    iget-object v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget v0, v0, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->value:I

    .line 8
    iget-object v1, v1, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget v1, v1, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->value:I

    sub-int v4, v0, v2

    sub-int v5, v1, v3

    const/4 v6, 0x0

    if-ltz v4, :cond_0

    if-ltz v5, :cond_0

    const/high16 v4, -0x80000000

    if-eq v2, v4, :cond_0

    const v5, 0x7fffffff

    if-eq v2, v5, :cond_0

    if-eq v3, v4, :cond_0

    if-eq v3, v5, :cond_0

    if-eq v0, v4, :cond_0

    if-eq v0, v5, :cond_0

    if-eq v1, v4, :cond_0

    if-ne v1, v5, :cond_1

    :cond_0
    move v0, v6

    move v1, v0

    move v2, v1

    move v3, v2

    :cond_1
    sub-int/2addr v0, v2

    sub-int/2addr v1, v3

    if-eqz p1, :cond_2

    .line 9
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mX:I

    :cond_2
    if-eqz p2, :cond_3

    .line 10
    iput v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mY:I

    .line 11
    :cond_3
    iget v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    const/16 v3, 0x8

    if-ne v2, v3, :cond_4

    .line 12
    iput v6, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWidth:I

    .line 13
    iput v6, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHeight:I

    return-void

    :cond_4
    const/4 v2, 0x1

    if-eqz p1, :cond_6

    .line 14
    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aget p1, p1, v6

    if-ne p1, v2, :cond_5

    iget p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWidth:I

    if-ge v0, p1, :cond_5

    move v0, p1

    .line 15
    :cond_5
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWidth:I

    .line 16
    iget p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinWidth:I

    if-ge v0, p1, :cond_6

    .line 17
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWidth:I

    :cond_6
    if-eqz p2, :cond_8

    .line 18
    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aget p1, p1, v2

    if-ne p1, v2, :cond_7

    iget p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHeight:I

    if-ge v1, p1, :cond_7

    move v1, p1

    .line 19
    :cond_7
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHeight:I

    .line 20
    iget p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinHeight:I

    if-ge v1, p1, :cond_8

    .line 21
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHeight:I

    :cond_8
    return-void
.end method

.method public updateFromSolver(Landroidx/constraintlayout/solver/LinearSystem;)V
    .locals 6

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mLeft:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1, v0}, Landroidx/constraintlayout/solver/LinearSystem;->getObjectVariableValue(Ljava/lang/Object;)I

    move-result v0

    .line 2
    iget-object v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mTop:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1, v1}, Landroidx/constraintlayout/solver/LinearSystem;->getObjectVariableValue(Ljava/lang/Object;)I

    move-result v1

    .line 3
    iget-object v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mRight:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1, v2}, Landroidx/constraintlayout/solver/LinearSystem;->getObjectVariableValue(Ljava/lang/Object;)I

    move-result v2

    .line 4
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBottom:Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1, v3}, Landroidx/constraintlayout/solver/LinearSystem;->getObjectVariableValue(Ljava/lang/Object;)I

    move-result p1

    .line 5
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->horizontalRun:Landroidx/constraintlayout/solver/widgets/analyzer/HorizontalWidgetRun;

    iget-object v4, v3, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget-boolean v5, v4, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    if-eqz v5, :cond_0

    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget-boolean v5, v3, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    if-eqz v5, :cond_0

    .line 6
    iget v0, v4, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->value:I

    .line 7
    iget v2, v3, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->value:I

    .line 8
    :cond_0
    iget-object v3, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->verticalRun:Landroidx/constraintlayout/solver/widgets/analyzer/VerticalWidgetRun;

    iget-object v4, v3, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->start:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget-boolean v5, v4, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    if-eqz v5, :cond_1

    iget-object v3, v3, Landroidx/constraintlayout/solver/widgets/analyzer/WidgetRun;->end:Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;

    iget-boolean v5, v3, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->resolved:Z

    if-eqz v5, :cond_1

    .line 9
    iget v1, v4, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->value:I

    .line 10
    iget p1, v3, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyNode;->value:I

    :cond_1
    sub-int v3, v2, v0

    sub-int v4, p1, v1

    const/4 v5, 0x0

    if-ltz v3, :cond_2

    if-ltz v4, :cond_2

    const/high16 v3, -0x80000000

    if-eq v0, v3, :cond_2

    const v4, 0x7fffffff

    if-eq v0, v4, :cond_2

    if-eq v1, v3, :cond_2

    if-eq v1, v4, :cond_2

    if-eq v2, v3, :cond_2

    if-eq v2, v4, :cond_2

    if-eq p1, v3, :cond_2

    if-ne p1, v4, :cond_3

    :cond_2
    move p1, v5

    move v0, p1

    move v1, v0

    move v2, v1

    :cond_3
    sub-int/2addr v2, v0

    sub-int/2addr p1, v1

    .line 11
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mX:I

    .line 12
    iput v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mY:I

    .line 13
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mVisibility:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_4

    .line 14
    iput v5, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWidth:I

    .line 15
    iput v5, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHeight:I

    goto :goto_0

    .line 16
    :cond_4
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[I

    aget v1, v0, v5

    const/4 v3, 0x1

    if-ne v1, v3, :cond_5

    iget v1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWidth:I

    if-ge v2, v1, :cond_5

    move v2, v1

    .line 17
    :cond_5
    aget v0, v0, v3

    if-ne v0, v3, :cond_6

    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHeight:I

    if-ge p1, v0, :cond_6

    move p1, v0

    .line 18
    :cond_6
    iput v2, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWidth:I

    .line 19
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHeight:I

    .line 20
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinHeight:I

    if-ge p1, v0, :cond_7

    .line 21
    iput v0, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHeight:I

    .line 22
    :cond_7
    iget p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinWidth:I

    if-ge v2, p1, :cond_8

    .line 23
    iput p1, p0, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWidth:I

    :cond_8
    :goto_0
    return-void
.end method
