.class public Landroidx/constraintlayout/solver/LinearSystem;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/solver/LinearSystem$Row;
    }
.end annotation


# static fields
.field public static POOL_SIZE:I = 0x3e8


# instance fields
.field public TABLE_SIZE:I

.field public mAlreadyTestedCandidates:[Z

.field public final mCache:Landroidx/constraintlayout/solver/Cache;

.field public mGoal:Landroidx/constraintlayout/solver/LinearSystem$Row;

.field public mMaxColumns:I

.field public mMaxRows:I

.field public mNumColumns:I

.field public mNumRows:I

.field public mPoolVariables:[Landroidx/constraintlayout/solver/SolverVariable;

.field public mPoolVariablesCount:I

.field public mRows:[Landroidx/constraintlayout/solver/ArrayRow;

.field public final mTempGoal:Landroidx/constraintlayout/solver/LinearSystem$Row;

.field public mVariablesID:I

.field public newgraphOptimizer:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Landroidx/constraintlayout/solver/LinearSystem;->mVariablesID:I

    const/16 v1, 0x20

    .line 3
    iput v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->TABLE_SIZE:I

    .line 4
    iput v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mMaxColumns:I

    const/4 v2, 0x0

    .line 5
    iput-object v2, p0, Landroidx/constraintlayout/solver/LinearSystem;->mRows:[Landroidx/constraintlayout/solver/ArrayRow;

    .line 6
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/LinearSystem;->newgraphOptimizer:Z

    new-array v2, v1, [Z

    .line 7
    iput-object v2, p0, Landroidx/constraintlayout/solver/LinearSystem;->mAlreadyTestedCandidates:[Z

    const/4 v2, 0x1

    .line 8
    iput v2, p0, Landroidx/constraintlayout/solver/LinearSystem;->mNumColumns:I

    .line 9
    iput v0, p0, Landroidx/constraintlayout/solver/LinearSystem;->mNumRows:I

    .line 10
    iput v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mMaxRows:I

    .line 11
    sget v2, Landroidx/constraintlayout/solver/LinearSystem;->POOL_SIZE:I

    new-array v2, v2, [Landroidx/constraintlayout/solver/SolverVariable;

    iput-object v2, p0, Landroidx/constraintlayout/solver/LinearSystem;->mPoolVariables:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 12
    iput v0, p0, Landroidx/constraintlayout/solver/LinearSystem;->mPoolVariablesCount:I

    new-array v1, v1, [Landroidx/constraintlayout/solver/ArrayRow;

    .line 13
    iput-object v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mRows:[Landroidx/constraintlayout/solver/ArrayRow;

    .line 14
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/LinearSystem;->releaseRows()V

    .line 15
    new-instance v1, Landroidx/constraintlayout/solver/Cache;

    invoke-direct {v1, v0}, Landroidx/constraintlayout/solver/Cache;-><init>(I)V

    iput-object v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mCache:Landroidx/constraintlayout/solver/Cache;

    .line 16
    new-instance v0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;

    invoke-direct {v0, v1}, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;-><init>(Landroidx/constraintlayout/solver/Cache;)V

    iput-object v0, p0, Landroidx/constraintlayout/solver/LinearSystem;->mGoal:Landroidx/constraintlayout/solver/LinearSystem$Row;

    .line 17
    new-instance v0, Landroidx/constraintlayout/solver/ArrayRow;

    invoke-direct {v0, v1}, Landroidx/constraintlayout/solver/ArrayRow;-><init>(Landroidx/constraintlayout/solver/Cache;)V

    iput-object v0, p0, Landroidx/constraintlayout/solver/LinearSystem;->mTempGoal:Landroidx/constraintlayout/solver/LinearSystem$Row;

    return-void
.end method


# virtual methods
.method public final acquireSolverVariable$enumunboxing$(ILjava/lang/String;)Landroidx/constraintlayout/solver/SolverVariable;
    .locals 2

    .line 1
    iget-object p2, p0, Landroidx/constraintlayout/solver/LinearSystem;->mCache:Landroidx/constraintlayout/solver/Cache;

    iget-object p2, p2, Landroidx/constraintlayout/solver/Cache;->solverVariablePool:Ljava/lang/Object;

    check-cast p2, Landroidx/constraintlayout/solver/Pools$SimplePool;

    invoke-virtual {p2}, Landroidx/constraintlayout/solver/Pools$SimplePool;->acquire()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroidx/constraintlayout/solver/SolverVariable;

    if-nez p2, :cond_0

    .line 2
    new-instance p2, Landroidx/constraintlayout/solver/SolverVariable;

    invoke-direct {p2, p1}, Landroidx/constraintlayout/solver/SolverVariable;-><init>(I)V

    .line 3
    iput p1, p2, Landroidx/constraintlayout/solver/SolverVariable;->mType:I

    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p2}, Landroidx/constraintlayout/solver/SolverVariable;->reset()V

    .line 5
    iput p1, p2, Landroidx/constraintlayout/solver/SolverVariable;->mType:I

    .line 6
    :goto_0
    iget p1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mPoolVariablesCount:I

    sget v0, Landroidx/constraintlayout/solver/LinearSystem;->POOL_SIZE:I

    if-lt p1, v0, :cond_1

    mul-int/lit8 v0, v0, 0x2

    .line 7
    sput v0, Landroidx/constraintlayout/solver/LinearSystem;->POOL_SIZE:I

    .line 8
    iget-object p1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mPoolVariables:[Landroidx/constraintlayout/solver/SolverVariable;

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Landroidx/constraintlayout/solver/SolverVariable;

    iput-object p1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mPoolVariables:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 9
    :cond_1
    iget-object p1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mPoolVariables:[Landroidx/constraintlayout/solver/SolverVariable;

    iget v0, p0, Landroidx/constraintlayout/solver/LinearSystem;->mPoolVariablesCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mPoolVariablesCount:I

    aput-object p2, p1, v0

    return-object p2
.end method

.method public addCentering(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;IFLandroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/LinearSystem;->createRow()Landroidx/constraintlayout/solver/ArrayRow;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    if-ne p2, p5, :cond_0

    .line 2
    iget-object p3, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {p3, p1, v1}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 3
    iget-object p1, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {p1, p6, v1}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 4
    iget-object p1, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    const/high16 p3, -0x40000000    # -2.0f

    invoke-virtual {p1, p2, p3}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    goto/16 :goto_0

    :cond_0
    const/high16 v2, 0x3f000000    # 0.5f

    cmpl-float v2, p4, v2

    const/high16 v3, -0x40800000    # -1.0f

    if-nez v2, :cond_2

    .line 5
    iget-object p4, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {p4, p1, v1}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 6
    iget-object p1, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {p1, p2, v3}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 7
    iget-object p1, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {p1, p5, v3}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 8
    iget-object p1, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {p1, p6, v1}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    if-gtz p3, :cond_1

    if-lez p7, :cond_6

    :cond_1
    neg-int p1, p3

    add-int/2addr p1, p7

    int-to-float p1, p1

    .line 9
    iput p1, v0, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    cmpg-float v2, p4, v2

    if-gtz v2, :cond_3

    .line 10
    iget-object p4, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {p4, p1, v3}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 11
    iget-object p1, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {p1, p2, v1}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    int-to-float p1, p3

    .line 12
    iput p1, v0, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    goto :goto_0

    :cond_3
    cmpl-float v2, p4, v1

    if-ltz v2, :cond_4

    .line 13
    iget-object p1, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {p1, p6, v3}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 14
    iget-object p1, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {p1, p5, v1}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    neg-int p1, p7

    int-to-float p1, p1

    .line 15
    iput p1, v0, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    goto :goto_0

    .line 16
    :cond_4
    iget-object v2, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    sub-float v4, v1, p4

    mul-float v5, v4, v1

    invoke-virtual {v2, p1, v5}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 17
    iget-object p1, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    mul-float v2, v4, v3

    invoke-virtual {p1, p2, v2}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 18
    iget-object p1, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    mul-float/2addr v3, p4

    invoke-virtual {p1, p5, v3}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 19
    iget-object p1, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    mul-float/2addr v1, p4

    invoke-virtual {p1, p6, v1}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    if-gtz p3, :cond_5

    if-lez p7, :cond_6

    :cond_5
    neg-int p1, p3

    int-to-float p1, p1

    mul-float/2addr p1, v4

    int-to-float p2, p7

    mul-float/2addr p2, p4

    add-float/2addr p2, p1

    .line 20
    iput p2, v0, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    :cond_6
    :goto_0
    const/4 p1, 0x7

    if-eq p8, p1, :cond_7

    .line 21
    invoke-virtual {v0, p0, p8}, Landroidx/constraintlayout/solver/ArrayRow;->addError(Landroidx/constraintlayout/solver/LinearSystem;I)Landroidx/constraintlayout/solver/ArrayRow;

    .line 22
    :cond_7
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addConstraint(Landroidx/constraintlayout/solver/ArrayRow;)V

    return-void
.end method

.method public addConstraint(Landroidx/constraintlayout/solver/ArrayRow;)V
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 1
    iget v2, v0, Landroidx/constraintlayout/solver/LinearSystem;->mNumRows:I

    const/4 v3, 0x1

    add-int/2addr v2, v3

    iget v4, v0, Landroidx/constraintlayout/solver/LinearSystem;->mMaxRows:I

    if-ge v2, v4, :cond_0

    iget v2, v0, Landroidx/constraintlayout/solver/LinearSystem;->mNumColumns:I

    add-int/2addr v2, v3

    iget v4, v0, Landroidx/constraintlayout/solver/LinearSystem;->mMaxColumns:I

    if-lt v2, v4, :cond_1

    .line 2
    :cond_0
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/solver/LinearSystem;->increaseTableSize()V

    .line 3
    :cond_1
    iget-boolean v2, v1, Landroidx/constraintlayout/solver/ArrayRow;->isSimpleDefinition:Z

    if-nez v2, :cond_1f

    .line 4
    iget v2, v0, Landroidx/constraintlayout/solver/LinearSystem;->mNumRows:I

    const v5, 0x3a83126f    # 0.001f

    const/4 v6, 0x0

    const/4 v7, -0x1

    if-lez v2, :cond_6

    .line 5
    iget-object v2, v1, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    iget-object v8, v0, Landroidx/constraintlayout/solver/LinearSystem;->mRows:[Landroidx/constraintlayout/solver/ArrayRow;

    .line 6
    iget v9, v2, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    :goto_0
    const/4 v10, 0x0

    :goto_1
    if-eq v9, v7, :cond_5

    .line 7
    iget v11, v2, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v10, v11, :cond_5

    .line 8
    iget-object v11, v2, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mCache:Landroidx/constraintlayout/solver/Cache;

    iget-object v11, v11, Landroidx/constraintlayout/solver/Cache;->mIndexedVariables:Ljava/lang/Object;

    check-cast v11, [Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v12, v2, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v12, v12, v9

    aget-object v11, v11, v12

    .line 9
    iget v12, v11, Landroidx/constraintlayout/solver/SolverVariable;->definitionId:I

    if-eq v12, v7, :cond_4

    .line 10
    iget-object v10, v2, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget v9, v10, v9

    .line 11
    invoke-virtual {v2, v11, v3}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->remove(Landroidx/constraintlayout/solver/SolverVariable;Z)F

    .line 12
    iget v10, v11, Landroidx/constraintlayout/solver/SolverVariable;->definitionId:I

    aget-object v10, v8, v10

    .line 13
    iget-boolean v11, v10, Landroidx/constraintlayout/solver/ArrayRow;->isSimpleDefinition:Z

    if-nez v11, :cond_2

    .line 14
    iget-object v11, v10, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    .line 15
    iget v12, v11, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    const/4 v13, 0x0

    :goto_2
    if-eq v12, v7, :cond_2

    .line 16
    iget v14, v11, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v13, v14, :cond_2

    .line 17
    iget-object v14, v2, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mCache:Landroidx/constraintlayout/solver/Cache;

    iget-object v14, v14, Landroidx/constraintlayout/solver/Cache;->mIndexedVariables:Ljava/lang/Object;

    check-cast v14, [Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v15, v11, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v15, v15, v12

    aget-object v14, v14, v15

    .line 18
    iget-object v15, v11, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget v15, v15, v12

    mul-float/2addr v15, v9

    .line 19
    invoke-virtual {v2, v14, v15, v3}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->add(Landroidx/constraintlayout/solver/SolverVariable;FZ)V

    .line 20
    iget-object v14, v11, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v12, v14, v12

    add-int/lit8 v13, v13, 0x1

    goto :goto_2

    .line 21
    :cond_2
    iget v11, v1, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    iget v12, v10, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    mul-float/2addr v12, v9

    add-float/2addr v12, v11

    iput v12, v1, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    .line 22
    invoke-static {v12}, Ljava/lang/Math;->abs(F)F

    move-result v9

    cmpg-float v9, v9, v5

    if-gez v9, :cond_3

    .line 23
    iput v6, v1, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    .line 24
    :cond_3
    iget-object v9, v10, Landroidx/constraintlayout/solver/ArrayRow;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    invoke-virtual {v9, v1}, Landroidx/constraintlayout/solver/SolverVariable;->removeFromRow(Landroidx/constraintlayout/solver/ArrayRow;)V

    .line 25
    iget v9, v2, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    goto :goto_0

    .line 26
    :cond_4
    iget-object v11, v2, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v9, v11, v9

    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 27
    :cond_5
    iget-object v2, v1, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    iget v2, v2, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    if-nez v2, :cond_6

    .line 28
    iput-boolean v3, v1, Landroidx/constraintlayout/solver/ArrayRow;->isSimpleDefinition:Z

    .line 29
    :cond_6
    iget-object v2, v1, Landroidx/constraintlayout/solver/ArrayRow;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    if-nez v2, :cond_7

    iget v2, v1, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    cmpl-float v2, v2, v6

    if-nez v2, :cond_7

    iget-object v2, v1, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    iget v2, v2, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    if-nez v2, :cond_7

    move v2, v3

    goto :goto_3

    :cond_7
    const/4 v2, 0x0

    :goto_3
    if-eqz v2, :cond_8

    return-void

    .line 30
    :cond_8
    iget v2, v1, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    cmpg-float v8, v2, v6

    if-gez v8, :cond_9

    const/high16 v8, -0x40800000    # -1.0f

    mul-float/2addr v2, v8

    .line 31
    iput v2, v1, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    .line 32
    iget-object v2, v1, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    .line 33
    iget v9, v2, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    const/4 v10, 0x0

    :goto_4
    if-eq v9, v7, :cond_9

    .line 34
    iget v11, v2, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v10, v11, :cond_9

    .line 35
    iget-object v11, v2, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget v12, v11, v9

    mul-float/2addr v12, v8

    aput v12, v11, v9

    .line 36
    iget-object v11, v2, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v9, v11, v9

    add-int/lit8 v10, v10, 0x1

    goto :goto_4

    .line 37
    :cond_9
    iget-object v2, v1, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    .line 38
    iget v8, v2, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    move v13, v6

    move v15, v13

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v14, 0x0

    const/16 v16, 0x0

    :goto_5
    if-eq v8, v7, :cond_12

    .line 39
    iget v4, v2, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v10, v4, :cond_12

    .line 40
    iget-object v4, v2, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget v17, v4, v8

    .line 41
    iget-object v7, v2, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mCache:Landroidx/constraintlayout/solver/Cache;

    iget-object v7, v7, Landroidx/constraintlayout/solver/Cache;->mIndexedVariables:Ljava/lang/Object;

    check-cast v7, [Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v9, v2, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v9, v9, v8

    aget-object v7, v7, v9

    cmpg-float v9, v17, v6

    if-gez v9, :cond_a

    const v9, -0x457ced91    # -0.001f

    cmpl-float v9, v17, v9

    if-lez v9, :cond_b

    .line 42
    aput v6, v4, v8

    .line 43
    iget-object v4, v2, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mRow:Landroidx/constraintlayout/solver/ArrayRow;

    invoke-virtual {v7, v4}, Landroidx/constraintlayout/solver/SolverVariable;->removeFromRow(Landroidx/constraintlayout/solver/ArrayRow;)V

    goto :goto_6

    :cond_a
    cmpg-float v9, v17, v5

    if-gez v9, :cond_b

    .line 44
    aput v6, v4, v8

    .line 45
    iget-object v4, v2, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mRow:Landroidx/constraintlayout/solver/ArrayRow;

    invoke-virtual {v7, v4}, Landroidx/constraintlayout/solver/SolverVariable;->removeFromRow(Landroidx/constraintlayout/solver/ArrayRow;)V

    :goto_6
    move/from16 v17, v6

    :cond_b
    cmpl-float v4, v17, v6

    if-eqz v4, :cond_11

    .line 46
    iget v4, v7, Landroidx/constraintlayout/solver/SolverVariable;->mType:I

    if-ne v4, v3, :cond_e

    if-nez v12, :cond_c

    .line 47
    invoke-virtual {v2, v7}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->isNew(Landroidx/constraintlayout/solver/SolverVariable;)Z

    move-result v4

    goto :goto_7

    :cond_c
    cmpl-float v4, v13, v17

    if-lez v4, :cond_d

    .line 48
    invoke-virtual {v2, v7}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->isNew(Landroidx/constraintlayout/solver/SolverVariable;)Z

    move-result v4

    :goto_7
    move v14, v4

    goto :goto_8

    :cond_d
    if-nez v14, :cond_11

    .line 49
    invoke-virtual {v2, v7}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->isNew(Landroidx/constraintlayout/solver/SolverVariable;)Z

    move-result v4

    if-eqz v4, :cond_11

    move v14, v3

    :goto_8
    move-object v12, v7

    move/from16 v13, v17

    goto :goto_b

    :cond_e
    if-nez v12, :cond_11

    cmpg-float v4, v17, v6

    if-gez v4, :cond_11

    if-nez v11, :cond_f

    .line 50
    invoke-virtual {v2, v7}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->isNew(Landroidx/constraintlayout/solver/SolverVariable;)Z

    move-result v4

    goto :goto_9

    :cond_f
    cmpl-float v4, v15, v17

    if-lez v4, :cond_10

    .line 51
    invoke-virtual {v2, v7}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->isNew(Landroidx/constraintlayout/solver/SolverVariable;)Z

    move-result v4

    :goto_9
    move/from16 v16, v4

    goto :goto_a

    :cond_10
    if-nez v16, :cond_11

    .line 52
    invoke-virtual {v2, v7}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->isNew(Landroidx/constraintlayout/solver/SolverVariable;)Z

    move-result v4

    if-eqz v4, :cond_11

    move/from16 v16, v3

    :goto_a
    move-object v11, v7

    move/from16 v15, v17

    .line 53
    :cond_11
    :goto_b
    iget-object v4, v2, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v8, v4, v8

    add-int/lit8 v10, v10, 0x1

    const/4 v7, -0x1

    goto/16 :goto_5

    :cond_12
    if-eqz v12, :cond_13

    move-object v11, v12

    :cond_13
    if-nez v11, :cond_14

    move v2, v3

    goto :goto_c

    .line 54
    :cond_14
    invoke-virtual {v1, v11}, Landroidx/constraintlayout/solver/ArrayRow;->pivot(Landroidx/constraintlayout/solver/SolverVariable;)V

    const/4 v2, 0x0

    .line 55
    :goto_c
    iget-object v4, v1, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    iget v4, v4, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    if-nez v4, :cond_15

    .line 56
    iput-boolean v3, v1, Landroidx/constraintlayout/solver/ArrayRow;->isSimpleDefinition:Z

    :cond_15
    if-eqz v2, :cond_1b

    .line 57
    iget v2, v0, Landroidx/constraintlayout/solver/LinearSystem;->mNumColumns:I

    add-int/2addr v2, v3

    iget v4, v0, Landroidx/constraintlayout/solver/LinearSystem;->mMaxColumns:I

    if-lt v2, v4, :cond_16

    .line 58
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/solver/LinearSystem;->increaseTableSize()V

    :cond_16
    const/4 v2, 0x3

    const/4 v4, 0x0

    .line 59
    invoke-virtual {v0, v2, v4}, Landroidx/constraintlayout/solver/LinearSystem;->acquireSolverVariable$enumunboxing$(ILjava/lang/String;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v2

    .line 60
    iget v4, v0, Landroidx/constraintlayout/solver/LinearSystem;->mVariablesID:I

    add-int/2addr v4, v3

    iput v4, v0, Landroidx/constraintlayout/solver/LinearSystem;->mVariablesID:I

    .line 61
    iget v5, v0, Landroidx/constraintlayout/solver/LinearSystem;->mNumColumns:I

    add-int/2addr v5, v3

    iput v5, v0, Landroidx/constraintlayout/solver/LinearSystem;->mNumColumns:I

    .line 62
    iput v4, v2, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    .line 63
    iget-object v5, v0, Landroidx/constraintlayout/solver/LinearSystem;->mCache:Landroidx/constraintlayout/solver/Cache;

    iget-object v5, v5, Landroidx/constraintlayout/solver/Cache;->mIndexedVariables:Ljava/lang/Object;

    check-cast v5, [Landroidx/constraintlayout/solver/SolverVariable;

    aput-object v2, v5, v4

    .line 64
    iput-object v2, v1, Landroidx/constraintlayout/solver/ArrayRow;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 65
    invoke-virtual/range {p0 .. p1}, Landroidx/constraintlayout/solver/LinearSystem;->addRow(Landroidx/constraintlayout/solver/ArrayRow;)V

    .line 66
    iget-object v4, v0, Landroidx/constraintlayout/solver/LinearSystem;->mTempGoal:Landroidx/constraintlayout/solver/LinearSystem$Row;

    check-cast v4, Landroidx/constraintlayout/solver/ArrayRow;

    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v5, 0x0

    .line 67
    iput-object v5, v4, Landroidx/constraintlayout/solver/ArrayRow;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 68
    iget-object v5, v4, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {v5}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->clear()V

    const/4 v5, 0x0

    .line 69
    :goto_d
    iget-object v7, v1, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    iget v8, v7, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v5, v8, :cond_17

    .line 70
    invoke-virtual {v7, v5}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->getVariable(I)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v7

    .line 71
    iget-object v8, v1, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {v8, v5}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->getVariableValue(I)F

    move-result v8

    .line 72
    iget-object v9, v4, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {v9, v7, v8, v3}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->add(Landroidx/constraintlayout/solver/SolverVariable;FZ)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_d

    .line 73
    :cond_17
    iget-object v4, v0, Landroidx/constraintlayout/solver/LinearSystem;->mTempGoal:Landroidx/constraintlayout/solver/LinearSystem$Row;

    invoke-virtual {v0, v4}, Landroidx/constraintlayout/solver/LinearSystem;->optimize(Landroidx/constraintlayout/solver/LinearSystem$Row;)I

    .line 74
    iget v4, v2, Landroidx/constraintlayout/solver/SolverVariable;->definitionId:I

    const/4 v5, -0x1

    if-ne v4, v5, :cond_1a

    .line 75
    iget-object v4, v1, Landroidx/constraintlayout/solver/ArrayRow;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    if-ne v4, v2, :cond_18

    .line 76
    iget-object v4, v1, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    const/4 v5, 0x0

    invoke-virtual {v4, v5, v2}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->getPivotCandidate([ZLandroidx/constraintlayout/solver/SolverVariable;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v2

    if-eqz v2, :cond_18

    .line 77
    invoke-virtual {v1, v2}, Landroidx/constraintlayout/solver/ArrayRow;->pivot(Landroidx/constraintlayout/solver/SolverVariable;)V

    .line 78
    :cond_18
    iget-boolean v2, v1, Landroidx/constraintlayout/solver/ArrayRow;->isSimpleDefinition:Z

    if-nez v2, :cond_19

    .line 79
    iget-object v2, v1, Landroidx/constraintlayout/solver/ArrayRow;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    invoke-virtual {v2, v1}, Landroidx/constraintlayout/solver/SolverVariable;->updateReferencesWithNewDefinition(Landroidx/constraintlayout/solver/ArrayRow;)V

    .line 80
    :cond_19
    iget v2, v0, Landroidx/constraintlayout/solver/LinearSystem;->mNumRows:I

    sub-int/2addr v2, v3

    iput v2, v0, Landroidx/constraintlayout/solver/LinearSystem;->mNumRows:I

    :cond_1a
    move v2, v3

    goto :goto_e

    :cond_1b
    const/4 v2, 0x0

    .line 81
    :goto_e
    iget-object v4, v1, Landroidx/constraintlayout/solver/ArrayRow;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    if-eqz v4, :cond_1c

    iget v4, v4, Landroidx/constraintlayout/solver/SolverVariable;->mType:I

    if-eq v4, v3, :cond_1d

    iget v4, v1, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    cmpg-float v4, v4, v6

    if-ltz v4, :cond_1c

    goto :goto_f

    :cond_1c
    const/4 v3, 0x0

    :cond_1d
    :goto_f
    if-nez v3, :cond_1e

    return-void

    :cond_1e
    move v4, v2

    goto :goto_10

    :cond_1f
    const/4 v4, 0x0

    :goto_10
    if-nez v4, :cond_20

    .line 82
    invoke-virtual/range {p0 .. p1}, Landroidx/constraintlayout/solver/LinearSystem;->addRow(Landroidx/constraintlayout/solver/ArrayRow;)V

    :cond_20
    return-void
.end method

.method public addEquality(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)Landroidx/constraintlayout/solver/ArrayRow;
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/LinearSystem;->createRow()Landroidx/constraintlayout/solver/ArrayRow;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz p3, :cond_1

    if-gez p3, :cond_0

    mul-int/lit8 p3, p3, -0x1

    const/4 v1, 0x1

    :cond_0
    int-to-float p3, p3

    .line 2
    iput p3, v0, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    :cond_1
    const/high16 p3, -0x40800000    # -1.0f

    const/high16 v2, 0x3f800000    # 1.0f

    if-nez v1, :cond_2

    .line 3
    iget-object v1, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {v1, p1, p3}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 4
    iget-object p1, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {p1, p2, v2}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    goto :goto_0

    .line 5
    :cond_2
    iget-object v1, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {v1, p1, v2}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 6
    iget-object p1, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {p1, p2, p3}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    :goto_0
    const/4 p1, 0x7

    if-eq p4, p1, :cond_3

    .line 7
    invoke-virtual {v0, p0, p4}, Landroidx/constraintlayout/solver/ArrayRow;->addError(Landroidx/constraintlayout/solver/LinearSystem;I)Landroidx/constraintlayout/solver/ArrayRow;

    .line 8
    :cond_3
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addConstraint(Landroidx/constraintlayout/solver/ArrayRow;)V

    return-object v0
.end method

.method public addEquality(Landroidx/constraintlayout/solver/SolverVariable;I)V
    .locals 4

    .line 9
    iget v0, p1, Landroidx/constraintlayout/solver/SolverVariable;->definitionId:I

    const/4 v1, 0x1

    const/4 v2, -0x1

    if-eq v0, v2, :cond_3

    .line 10
    iget-object v3, p0, Landroidx/constraintlayout/solver/LinearSystem;->mRows:[Landroidx/constraintlayout/solver/ArrayRow;

    aget-object v0, v3, v0

    .line 11
    iget-boolean v3, v0, Landroidx/constraintlayout/solver/ArrayRow;->isSimpleDefinition:Z

    if-eqz v3, :cond_0

    int-to-float p0, p2

    .line 12
    iput p0, v0, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    goto :goto_1

    .line 13
    :cond_0
    iget-object v3, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    iget v3, v3, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    if-nez v3, :cond_1

    .line 14
    iput-boolean v1, v0, Landroidx/constraintlayout/solver/ArrayRow;->isSimpleDefinition:Z

    int-to-float p0, p2

    .line 15
    iput p0, v0, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    goto :goto_1

    .line 16
    :cond_1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/LinearSystem;->createRow()Landroidx/constraintlayout/solver/ArrayRow;

    move-result-object v0

    if-gez p2, :cond_2

    mul-int/2addr p2, v2

    int-to-float p2, p2

    .line 17
    iput p2, v0, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    .line 18
    iget-object p2, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {p2, p1, v1}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    goto :goto_0

    :cond_2
    int-to-float p2, p2

    .line 19
    iput p2, v0, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    .line 20
    iget-object p2, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    const/high16 v1, -0x40800000    # -1.0f

    invoke-virtual {p2, p1, v1}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 21
    :goto_0
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addConstraint(Landroidx/constraintlayout/solver/ArrayRow;)V

    goto :goto_1

    .line 22
    :cond_3
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/LinearSystem;->createRow()Landroidx/constraintlayout/solver/ArrayRow;

    move-result-object v0

    .line 23
    iput-object p1, v0, Landroidx/constraintlayout/solver/ArrayRow;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    int-to-float p2, p2

    .line 24
    iput p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->computedValue:F

    .line 25
    iput p2, v0, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    .line 26
    iput-boolean v1, v0, Landroidx/constraintlayout/solver/ArrayRow;->isSimpleDefinition:Z

    .line 27
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addConstraint(Landroidx/constraintlayout/solver/ArrayRow;)V

    :goto_1
    return-void
.end method

.method public addGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/LinearSystem;->createRow()Landroidx/constraintlayout/solver/ArrayRow;

    move-result-object v0

    .line 2
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/LinearSystem;->createSlackVariable()Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v1

    const/4 v2, 0x0

    .line 3
    iput v2, v1, Landroidx/constraintlayout/solver/SolverVariable;->strength:I

    .line 4
    invoke-virtual {v0, p1, p2, v1, p3}, Landroidx/constraintlayout/solver/ArrayRow;->createRowGreaterThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;I)Landroidx/constraintlayout/solver/ArrayRow;

    const/4 p1, 0x7

    if-eq p4, p1, :cond_0

    .line 5
    iget-object p1, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {p1, v1}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->get(Landroidx/constraintlayout/solver/SolverVariable;)F

    move-result p1

    const/high16 p2, -0x40800000    # -1.0f

    mul-float/2addr p1, p2

    float-to-int p1, p1

    const/4 p2, 0x0

    .line 6
    invoke-virtual {p0, p4, p2}, Landroidx/constraintlayout/solver/LinearSystem;->createErrorVariable(ILjava/lang/String;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object p2

    .line 7
    iget-object p3, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    int-to-float p1, p1

    invoke-virtual {p3, p2, p1}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 8
    :cond_0
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addConstraint(Landroidx/constraintlayout/solver/ArrayRow;)V

    return-void
.end method

.method public addLowerThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;II)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/LinearSystem;->createRow()Landroidx/constraintlayout/solver/ArrayRow;

    move-result-object v0

    .line 2
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/LinearSystem;->createSlackVariable()Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v1

    const/4 v2, 0x0

    .line 3
    iput v2, v1, Landroidx/constraintlayout/solver/SolverVariable;->strength:I

    .line 4
    invoke-virtual {v0, p1, p2, v1, p3}, Landroidx/constraintlayout/solver/ArrayRow;->createRowLowerThan(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;I)Landroidx/constraintlayout/solver/ArrayRow;

    const/4 p1, 0x7

    if-eq p4, p1, :cond_0

    .line 5
    iget-object p1, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {p1, v1}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->get(Landroidx/constraintlayout/solver/SolverVariable;)F

    move-result p1

    const/high16 p2, -0x40800000    # -1.0f

    mul-float/2addr p1, p2

    float-to-int p1, p1

    const/4 p2, 0x0

    .line 6
    invoke-virtual {p0, p4, p2}, Landroidx/constraintlayout/solver/LinearSystem;->createErrorVariable(ILjava/lang/String;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object p2

    .line 7
    iget-object p3, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    int-to-float p1, p1

    invoke-virtual {p3, p2, p1}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->put(Landroidx/constraintlayout/solver/SolverVariable;F)V

    .line 8
    :cond_0
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/solver/LinearSystem;->addConstraint(Landroidx/constraintlayout/solver/ArrayRow;)V

    return-void
.end method

.method public addRatio(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;FI)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/LinearSystem;->createRow()Landroidx/constraintlayout/solver/ArrayRow;

    move-result-object v6

    move-object v0, v6

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    .line 2
    invoke-virtual/range {v0 .. v5}, Landroidx/constraintlayout/solver/ArrayRow;->createRowDimensionRatio(Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;Landroidx/constraintlayout/solver/SolverVariable;F)Landroidx/constraintlayout/solver/ArrayRow;

    const/4 p1, 0x7

    if-eq p6, p1, :cond_0

    .line 3
    invoke-virtual {v6, p0, p6}, Landroidx/constraintlayout/solver/ArrayRow;->addError(Landroidx/constraintlayout/solver/LinearSystem;I)Landroidx/constraintlayout/solver/ArrayRow;

    .line 4
    :cond_0
    invoke-virtual {p0, v6}, Landroidx/constraintlayout/solver/LinearSystem;->addConstraint(Landroidx/constraintlayout/solver/ArrayRow;)V

    return-void
.end method

.method public final addRow(Landroidx/constraintlayout/solver/ArrayRow;)V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/LinearSystem;->mRows:[Landroidx/constraintlayout/solver/ArrayRow;

    iget v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mNumRows:I

    aget-object v2, v0, v1

    if-eqz v2, :cond_0

    .line 2
    iget-object v2, p0, Landroidx/constraintlayout/solver/LinearSystem;->mCache:Landroidx/constraintlayout/solver/Cache;

    iget-object v2, v2, Landroidx/constraintlayout/solver/Cache;->arrayRowPool:Ljava/lang/Object;

    check-cast v2, Landroidx/constraintlayout/solver/Pools$SimplePool;

    aget-object v0, v0, v1

    invoke-virtual {v2, v0}, Landroidx/constraintlayout/solver/Pools$SimplePool;->release(Ljava/lang/Object;)Z

    .line 3
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/solver/LinearSystem;->mRows:[Landroidx/constraintlayout/solver/ArrayRow;

    iget v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mNumRows:I

    aput-object p1, v0, v1

    .line 4
    iget-object v0, p1, Landroidx/constraintlayout/solver/ArrayRow;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    iput v1, v0, Landroidx/constraintlayout/solver/SolverVariable;->definitionId:I

    add-int/lit8 v1, v1, 0x1

    .line 5
    iput v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mNumRows:I

    .line 6
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/solver/SolverVariable;->updateReferencesWithNewDefinition(Landroidx/constraintlayout/solver/ArrayRow;)V

    return-void
.end method

.method public final computeValues()V
    .locals 3

    const/4 v0, 0x0

    .line 1
    :goto_0
    iget v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mNumRows:I

    if-ge v0, v1, :cond_0

    .line 2
    iget-object v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mRows:[Landroidx/constraintlayout/solver/ArrayRow;

    aget-object v1, v1, v0

    .line 3
    iget-object v2, v1, Landroidx/constraintlayout/solver/ArrayRow;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    iget v1, v1, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    iput v1, v2, Landroidx/constraintlayout/solver/SolverVariable;->computedValue:F

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public createErrorVariable(ILjava/lang/String;)Landroidx/constraintlayout/solver/SolverVariable;
    .locals 2

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/LinearSystem;->mNumColumns:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mMaxColumns:I

    if-lt v0, v1, :cond_0

    .line 2
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/LinearSystem;->increaseTableSize()V

    :cond_0
    const/4 v0, 0x4

    .line 3
    invoke-virtual {p0, v0, p2}, Landroidx/constraintlayout/solver/LinearSystem;->acquireSolverVariable$enumunboxing$(ILjava/lang/String;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object p2

    .line 4
    iget v0, p0, Landroidx/constraintlayout/solver/LinearSystem;->mVariablesID:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroidx/constraintlayout/solver/LinearSystem;->mVariablesID:I

    .line 5
    iget v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mNumColumns:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mNumColumns:I

    .line 6
    iput v0, p2, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    .line 7
    iput p1, p2, Landroidx/constraintlayout/solver/SolverVariable;->strength:I

    .line 8
    iget-object p1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mCache:Landroidx/constraintlayout/solver/Cache;

    iget-object p1, p1, Landroidx/constraintlayout/solver/Cache;->mIndexedVariables:Ljava/lang/Object;

    check-cast p1, [Landroidx/constraintlayout/solver/SolverVariable;

    aput-object p2, p1, v0

    .line 9
    iget-object p0, p0, Landroidx/constraintlayout/solver/LinearSystem;->mGoal:Landroidx/constraintlayout/solver/LinearSystem$Row;

    invoke-interface {p0, p2}, Landroidx/constraintlayout/solver/LinearSystem$Row;->addError(Landroidx/constraintlayout/solver/SolverVariable;)V

    return-object p2
.end method

.method public createObjectVariable(Ljava/lang/Object;)Landroidx/constraintlayout/solver/SolverVariable;
    .locals 4

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 1
    :cond_0
    iget v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mNumColumns:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iget v3, p0, Landroidx/constraintlayout/solver/LinearSystem;->mMaxColumns:I

    if-lt v1, v3, :cond_1

    .line 2
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/LinearSystem;->increaseTableSize()V

    .line 3
    :cond_1
    instance-of v1, p1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    if-eqz v1, :cond_5

    .line 4
    check-cast p1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 5
    iget-object v0, p1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    if-nez v0, :cond_2

    .line 6
    invoke-virtual {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->resetSolverVariable()V

    .line 7
    iget-object p1, p1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    move-object v0, p1

    .line 8
    :cond_2
    iget p1, v0, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    const/4 v1, -0x1

    if-eq p1, v1, :cond_3

    iget v3, p0, Landroidx/constraintlayout/solver/LinearSystem;->mVariablesID:I

    if-gt p1, v3, :cond_3

    iget-object v3, p0, Landroidx/constraintlayout/solver/LinearSystem;->mCache:Landroidx/constraintlayout/solver/Cache;

    iget-object v3, v3, Landroidx/constraintlayout/solver/Cache;->mIndexedVariables:Ljava/lang/Object;

    check-cast v3, [Landroidx/constraintlayout/solver/SolverVariable;

    aget-object v3, v3, p1

    if-nez v3, :cond_5

    :cond_3
    if-eq p1, v1, :cond_4

    .line 9
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/SolverVariable;->reset()V

    .line 10
    :cond_4
    iget p1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mVariablesID:I

    add-int/2addr p1, v2

    iput p1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mVariablesID:I

    .line 11
    iget v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mNumColumns:I

    add-int/2addr v1, v2

    iput v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mNumColumns:I

    .line 12
    iput p1, v0, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    .line 13
    iput v2, v0, Landroidx/constraintlayout/solver/SolverVariable;->mType:I

    .line 14
    iget-object p0, p0, Landroidx/constraintlayout/solver/LinearSystem;->mCache:Landroidx/constraintlayout/solver/Cache;

    iget-object p0, p0, Landroidx/constraintlayout/solver/Cache;->mIndexedVariables:Ljava/lang/Object;

    check-cast p0, [Landroidx/constraintlayout/solver/SolverVariable;

    aput-object v0, p0, p1

    :cond_5
    return-object v0
.end method

.method public createRow()Landroidx/constraintlayout/solver/ArrayRow;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/LinearSystem;->mCache:Landroidx/constraintlayout/solver/Cache;

    iget-object v0, v0, Landroidx/constraintlayout/solver/Cache;->arrayRowPool:Ljava/lang/Object;

    check-cast v0, Landroidx/constraintlayout/solver/Pools$SimplePool;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/Pools$SimplePool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/solver/ArrayRow;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Landroidx/constraintlayout/solver/ArrayRow;

    iget-object p0, p0, Landroidx/constraintlayout/solver/LinearSystem;->mCache:Landroidx/constraintlayout/solver/Cache;

    invoke-direct {v0, p0}, Landroidx/constraintlayout/solver/ArrayRow;-><init>(Landroidx/constraintlayout/solver/Cache;)V

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    .line 3
    iput-object p0, v0, Landroidx/constraintlayout/solver/ArrayRow;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 4
    iget-object p0, v0, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {p0}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->clear()V

    const/4 p0, 0x0

    .line 5
    iput p0, v0, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    const/4 p0, 0x0

    .line 6
    iput-boolean p0, v0, Landroidx/constraintlayout/solver/ArrayRow;->isSimpleDefinition:Z

    .line 7
    :goto_0
    sget p0, Landroidx/constraintlayout/solver/SolverVariable;->uniqueErrorId:I

    add-int/lit8 p0, p0, 0x1

    sput p0, Landroidx/constraintlayout/solver/SolverVariable;->uniqueErrorId:I

    return-object v0
.end method

.method public createSlackVariable()Landroidx/constraintlayout/solver/SolverVariable;
    .locals 3

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/LinearSystem;->mNumColumns:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mMaxColumns:I

    if-lt v0, v1, :cond_0

    .line 2
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/LinearSystem;->increaseTableSize()V

    :cond_0
    const/4 v0, 0x3

    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v0, v1}, Landroidx/constraintlayout/solver/LinearSystem;->acquireSolverVariable$enumunboxing$(ILjava/lang/String;)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v0

    .line 4
    iget v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mVariablesID:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mVariablesID:I

    .line 5
    iget v2, p0, Landroidx/constraintlayout/solver/LinearSystem;->mNumColumns:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Landroidx/constraintlayout/solver/LinearSystem;->mNumColumns:I

    .line 6
    iput v1, v0, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    .line 7
    iget-object p0, p0, Landroidx/constraintlayout/solver/LinearSystem;->mCache:Landroidx/constraintlayout/solver/Cache;

    iget-object p0, p0, Landroidx/constraintlayout/solver/Cache;->mIndexedVariables:Ljava/lang/Object;

    check-cast p0, [Landroidx/constraintlayout/solver/SolverVariable;

    aput-object v0, p0, v1

    return-object v0
.end method

.method public getObjectVariableValue(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;

    .line 2
    iget-object p0, p1, Landroidx/constraintlayout/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroidx/constraintlayout/solver/SolverVariable;

    if-eqz p0, :cond_0

    .line 3
    iget p0, p0, Landroidx/constraintlayout/solver/SolverVariable;->computedValue:F

    const/high16 p1, 0x3f000000    # 0.5f

    add-float/2addr p0, p1

    float-to-int p0, p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final increaseTableSize()V
    .locals 3

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/LinearSystem;->TABLE_SIZE:I

    mul-int/lit8 v0, v0, 0x2

    iput v0, p0, Landroidx/constraintlayout/solver/LinearSystem;->TABLE_SIZE:I

    .line 2
    iget-object v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mRows:[Landroidx/constraintlayout/solver/ArrayRow;

    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroidx/constraintlayout/solver/ArrayRow;

    iput-object v0, p0, Landroidx/constraintlayout/solver/LinearSystem;->mRows:[Landroidx/constraintlayout/solver/ArrayRow;

    .line 3
    iget-object v0, p0, Landroidx/constraintlayout/solver/LinearSystem;->mCache:Landroidx/constraintlayout/solver/Cache;

    iget-object v1, v0, Landroidx/constraintlayout/solver/Cache;->mIndexedVariables:Ljava/lang/Object;

    check-cast v1, [Landroidx/constraintlayout/solver/SolverVariable;

    iget v2, p0, Landroidx/constraintlayout/solver/LinearSystem;->TABLE_SIZE:I

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroidx/constraintlayout/solver/SolverVariable;

    iput-object v1, v0, Landroidx/constraintlayout/solver/Cache;->mIndexedVariables:Ljava/lang/Object;

    .line 4
    iget v0, p0, Landroidx/constraintlayout/solver/LinearSystem;->TABLE_SIZE:I

    new-array v1, v0, [Z

    iput-object v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mAlreadyTestedCandidates:[Z

    .line 5
    iput v0, p0, Landroidx/constraintlayout/solver/LinearSystem;->mMaxColumns:I

    .line 6
    iput v0, p0, Landroidx/constraintlayout/solver/LinearSystem;->mMaxRows:I

    return-void
.end method

.method public minimizeGoal(Landroidx/constraintlayout/solver/LinearSystem$Row;)V
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    move-object/from16 v0, p0

    const/4 v2, 0x0

    .line 1
    :goto_0
    iget v3, v0, Landroidx/constraintlayout/solver/LinearSystem;->mNumRows:I

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ge v2, v3, :cond_2

    .line 2
    iget-object v3, v0, Landroidx/constraintlayout/solver/LinearSystem;->mRows:[Landroidx/constraintlayout/solver/ArrayRow;

    aget-object v6, v3, v2

    iget-object v6, v6, Landroidx/constraintlayout/solver/ArrayRow;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 3
    iget v6, v6, Landroidx/constraintlayout/solver/SolverVariable;->mType:I

    if-ne v6, v5, :cond_0

    goto :goto_1

    .line 4
    :cond_0
    aget-object v3, v3, v2

    iget v3, v3, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    cmpg-float v3, v3, v4

    if-gez v3, :cond_1

    move v2, v5

    goto :goto_2

    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    :goto_2
    if-eqz v2, :cond_e

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_3
    if-nez v2, :cond_e

    add-int/2addr v3, v5

    const v6, 0x7f7fffff    # Float.MAX_VALUE

    const/4 v7, -0x1

    move v9, v7

    move v10, v9

    const/4 v8, 0x0

    const/4 v11, 0x0

    .line 5
    :goto_4
    iget v12, v0, Landroidx/constraintlayout/solver/LinearSystem;->mNumRows:I

    if-ge v8, v12, :cond_b

    .line 6
    iget-object v12, v0, Landroidx/constraintlayout/solver/LinearSystem;->mRows:[Landroidx/constraintlayout/solver/ArrayRow;

    aget-object v12, v12, v8

    .line 7
    iget-object v13, v12, Landroidx/constraintlayout/solver/ArrayRow;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 8
    iget v13, v13, Landroidx/constraintlayout/solver/SolverVariable;->mType:I

    if-ne v13, v5, :cond_3

    goto :goto_8

    .line 9
    :cond_3
    iget-boolean v13, v12, Landroidx/constraintlayout/solver/ArrayRow;->isSimpleDefinition:Z

    if-eqz v13, :cond_4

    goto :goto_8

    .line 10
    :cond_4
    iget v13, v12, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    cmpg-float v13, v13, v4

    if-gez v13, :cond_a

    move v13, v5

    .line 11
    :goto_5
    iget v14, v0, Landroidx/constraintlayout/solver/LinearSystem;->mNumColumns:I

    if-ge v13, v14, :cond_a

    .line 12
    iget-object v14, v0, Landroidx/constraintlayout/solver/LinearSystem;->mCache:Landroidx/constraintlayout/solver/Cache;

    iget-object v14, v14, Landroidx/constraintlayout/solver/Cache;->mIndexedVariables:Ljava/lang/Object;

    check-cast v14, [Landroidx/constraintlayout/solver/SolverVariable;

    aget-object v14, v14, v13

    .line 13
    iget-object v15, v12, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {v15, v14}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->get(Landroidx/constraintlayout/solver/SolverVariable;)F

    move-result v15

    cmpg-float v16, v15, v4

    if-gtz v16, :cond_5

    goto :goto_7

    :cond_5
    const/4 v1, 0x0

    :goto_6
    const/16 v4, 0x8

    if-ge v1, v4, :cond_9

    .line 14
    iget-object v4, v14, Landroidx/constraintlayout/solver/SolverVariable;->strengthVector:[F

    aget v4, v4, v1

    div-float/2addr v4, v15

    cmpg-float v17, v4, v6

    if-gez v17, :cond_6

    if-eq v1, v11, :cond_7

    :cond_6
    if-le v1, v11, :cond_8

    :cond_7
    move v11, v1

    move v6, v4

    move v9, v8

    move v10, v13

    :cond_8
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_9
    :goto_7
    add-int/lit8 v13, v13, 0x1

    const/4 v4, 0x0

    goto :goto_5

    :cond_a
    :goto_8
    add-int/lit8 v8, v8, 0x1

    const/4 v4, 0x0

    goto :goto_4

    :cond_b
    if-eq v9, v7, :cond_c

    .line 15
    iget-object v1, v0, Landroidx/constraintlayout/solver/LinearSystem;->mRows:[Landroidx/constraintlayout/solver/ArrayRow;

    aget-object v1, v1, v9

    .line 16
    iget-object v4, v1, Landroidx/constraintlayout/solver/ArrayRow;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    iput v7, v4, Landroidx/constraintlayout/solver/SolverVariable;->definitionId:I

    .line 17
    iget-object v4, v0, Landroidx/constraintlayout/solver/LinearSystem;->mCache:Landroidx/constraintlayout/solver/Cache;

    iget-object v4, v4, Landroidx/constraintlayout/solver/Cache;->mIndexedVariables:Ljava/lang/Object;

    check-cast v4, [Landroidx/constraintlayout/solver/SolverVariable;

    aget-object v4, v4, v10

    invoke-virtual {v1, v4}, Landroidx/constraintlayout/solver/ArrayRow;->pivot(Landroidx/constraintlayout/solver/SolverVariable;)V

    .line 18
    iget-object v4, v1, Landroidx/constraintlayout/solver/ArrayRow;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    iput v9, v4, Landroidx/constraintlayout/solver/SolverVariable;->definitionId:I

    .line 19
    invoke-virtual {v4, v1}, Landroidx/constraintlayout/solver/SolverVariable;->updateReferencesWithNewDefinition(Landroidx/constraintlayout/solver/ArrayRow;)V

    goto :goto_9

    :cond_c
    move v2, v5

    .line 20
    :goto_9
    iget v1, v0, Landroidx/constraintlayout/solver/LinearSystem;->mNumColumns:I

    div-int/lit8 v1, v1, 0x2

    if-le v3, v1, :cond_d

    move v2, v5

    :cond_d
    const/4 v4, 0x0

    goto/16 :goto_3

    .line 21
    :cond_e
    invoke-virtual/range {p0 .. p1}, Landroidx/constraintlayout/solver/LinearSystem;->optimize(Landroidx/constraintlayout/solver/LinearSystem$Row;)I

    .line 22
    invoke-virtual/range {p0 .. p0}, Landroidx/constraintlayout/solver/LinearSystem;->computeValues()V

    return-void
.end method

.method public final optimize(Landroidx/constraintlayout/solver/LinearSystem$Row;)I
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/4 v2, 0x0

    move v3, v2

    .line 1
    :goto_0
    iget v4, v0, Landroidx/constraintlayout/solver/LinearSystem;->mNumColumns:I

    if-ge v3, v4, :cond_0

    .line 2
    iget-object v4, v0, Landroidx/constraintlayout/solver/LinearSystem;->mAlreadyTestedCandidates:[Z

    aput-boolean v2, v4, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    move v3, v2

    move v4, v3

    :goto_1
    if-nez v3, :cond_e

    add-int/lit8 v4, v4, 0x1

    .line 3
    iget v5, v0, Landroidx/constraintlayout/solver/LinearSystem;->mNumColumns:I

    mul-int/lit8 v5, v5, 0x2

    if-lt v4, v5, :cond_1

    return v4

    .line 4
    :cond_1
    move-object v5, v1

    check-cast v5, Landroidx/constraintlayout/solver/ArrayRow;

    .line 5
    iget-object v5, v5, Landroidx/constraintlayout/solver/ArrayRow;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    const/4 v6, 0x1

    if-eqz v5, :cond_2

    .line 6
    iget-object v7, v0, Landroidx/constraintlayout/solver/LinearSystem;->mAlreadyTestedCandidates:[Z

    iget v5, v5, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    aput-boolean v6, v7, v5

    .line 7
    :cond_2
    iget-object v5, v0, Landroidx/constraintlayout/solver/LinearSystem;->mAlreadyTestedCandidates:[Z

    invoke-interface {v1, v0, v5}, Landroidx/constraintlayout/solver/LinearSystem$Row;->getPivotCandidate(Landroidx/constraintlayout/solver/LinearSystem;[Z)Landroidx/constraintlayout/solver/SolverVariable;

    move-result-object v5

    if-eqz v5, :cond_4

    .line 8
    iget-object v7, v0, Landroidx/constraintlayout/solver/LinearSystem;->mAlreadyTestedCandidates:[Z

    iget v8, v5, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    aget-boolean v9, v7, v8

    if-eqz v9, :cond_3

    return v4

    .line 9
    :cond_3
    aput-boolean v6, v7, v8

    :cond_4
    if-eqz v5, :cond_c

    const v7, 0x7f7fffff    # Float.MAX_VALUE

    const/4 v8, -0x1

    move v9, v2

    move v10, v8

    .line 10
    :goto_2
    iget v11, v0, Landroidx/constraintlayout/solver/LinearSystem;->mNumRows:I

    if-ge v9, v11, :cond_b

    .line 11
    iget-object v11, v0, Landroidx/constraintlayout/solver/LinearSystem;->mRows:[Landroidx/constraintlayout/solver/ArrayRow;

    aget-object v11, v11, v9

    .line 12
    iget-object v12, v11, Landroidx/constraintlayout/solver/ArrayRow;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 13
    iget v12, v12, Landroidx/constraintlayout/solver/SolverVariable;->mType:I

    if-ne v12, v6, :cond_5

    goto :goto_6

    .line 14
    :cond_5
    iget-boolean v12, v11, Landroidx/constraintlayout/solver/ArrayRow;->isSimpleDefinition:Z

    if-eqz v12, :cond_6

    goto :goto_6

    .line 15
    :cond_6
    iget-object v12, v11, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    .line 16
    iget v13, v12, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    if-ne v13, v8, :cond_7

    goto :goto_4

    :cond_7
    move v14, v2

    :goto_3
    if-eq v13, v8, :cond_9

    .line 17
    iget v15, v12, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v14, v15, :cond_9

    .line 18
    iget-object v15, v12, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v15, v15, v13

    iget v2, v5, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    if-ne v15, v2, :cond_8

    move v2, v6

    goto :goto_5

    .line 19
    :cond_8
    iget-object v2, v12, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v13, v2, v13

    add-int/lit8 v14, v14, 0x1

    const/4 v2, 0x0

    goto :goto_3

    :cond_9
    :goto_4
    const/4 v2, 0x0

    :goto_5
    if-eqz v2, :cond_a

    .line 20
    iget-object v2, v11, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    invoke-virtual {v2, v5}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->get(Landroidx/constraintlayout/solver/SolverVariable;)F

    move-result v2

    const/4 v12, 0x0

    cmpg-float v12, v2, v12

    if-gez v12, :cond_a

    .line 21
    iget v11, v11, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    neg-float v11, v11

    div-float/2addr v11, v2

    cmpg-float v2, v11, v7

    if-gez v2, :cond_a

    move v10, v9

    move v7, v11

    :cond_a
    :goto_6
    add-int/lit8 v9, v9, 0x1

    const/4 v2, 0x0

    goto :goto_2

    :cond_b
    if-le v10, v8, :cond_d

    .line 22
    iget-object v2, v0, Landroidx/constraintlayout/solver/LinearSystem;->mRows:[Landroidx/constraintlayout/solver/ArrayRow;

    aget-object v2, v2, v10

    .line 23
    iget-object v6, v2, Landroidx/constraintlayout/solver/ArrayRow;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    iput v8, v6, Landroidx/constraintlayout/solver/SolverVariable;->definitionId:I

    .line 24
    invoke-virtual {v2, v5}, Landroidx/constraintlayout/solver/ArrayRow;->pivot(Landroidx/constraintlayout/solver/SolverVariable;)V

    .line 25
    iget-object v5, v2, Landroidx/constraintlayout/solver/ArrayRow;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    iput v10, v5, Landroidx/constraintlayout/solver/SolverVariable;->definitionId:I

    .line 26
    invoke-virtual {v5, v2}, Landroidx/constraintlayout/solver/SolverVariable;->updateReferencesWithNewDefinition(Landroidx/constraintlayout/solver/ArrayRow;)V

    goto :goto_7

    :cond_c
    move v3, v6

    :cond_d
    :goto_7
    const/4 v2, 0x0

    goto/16 :goto_1

    :cond_e
    return v4
.end method

.method public final releaseRows()V
    .locals 3

    const/4 v0, 0x0

    .line 1
    :goto_0
    iget-object v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mRows:[Landroidx/constraintlayout/solver/ArrayRow;

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 2
    aget-object v1, v1, v0

    if-eqz v1, :cond_0

    .line 3
    iget-object v2, p0, Landroidx/constraintlayout/solver/LinearSystem;->mCache:Landroidx/constraintlayout/solver/Cache;

    iget-object v2, v2, Landroidx/constraintlayout/solver/Cache;->arrayRowPool:Ljava/lang/Object;

    check-cast v2, Landroidx/constraintlayout/solver/Pools$SimplePool;

    invoke-virtual {v2, v1}, Landroidx/constraintlayout/solver/Pools$SimplePool;->release(Ljava/lang/Object;)Z

    .line 4
    :cond_0
    iget-object v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mRows:[Landroidx/constraintlayout/solver/ArrayRow;

    const/4 v2, 0x0

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public reset()V
    .locals 9

    const/4 v0, 0x0

    move v1, v0

    .line 1
    :goto_0
    iget-object v2, p0, Landroidx/constraintlayout/solver/LinearSystem;->mCache:Landroidx/constraintlayout/solver/Cache;

    iget-object v3, v2, Landroidx/constraintlayout/solver/Cache;->mIndexedVariables:Ljava/lang/Object;

    move-object v4, v3

    check-cast v4, [Landroidx/constraintlayout/solver/SolverVariable;

    array-length v4, v4

    if-ge v1, v4, :cond_1

    .line 2
    check-cast v3, [Landroidx/constraintlayout/solver/SolverVariable;

    aget-object v2, v3, v1

    if-eqz v2, :cond_0

    .line 3
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/SolverVariable;->reset()V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 4
    :cond_1
    iget-object v1, v2, Landroidx/constraintlayout/solver/Cache;->solverVariablePool:Ljava/lang/Object;

    check-cast v1, Landroidx/constraintlayout/solver/Pools$SimplePool;

    iget-object v2, p0, Landroidx/constraintlayout/solver/LinearSystem;->mPoolVariables:[Landroidx/constraintlayout/solver/SolverVariable;

    iget v3, p0, Landroidx/constraintlayout/solver/LinearSystem;->mPoolVariablesCount:I

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    array-length v4, v2

    if-le v3, v4, :cond_2

    .line 6
    array-length v3, v2

    :cond_2
    move v4, v0

    :goto_1
    if-ge v4, v3, :cond_4

    .line 7
    aget-object v5, v2, v4

    .line 8
    iget v6, v1, Landroidx/constraintlayout/solver/Pools$SimplePool;->mPoolSize:I

    iget-object v7, v1, Landroidx/constraintlayout/solver/Pools$SimplePool;->mPool:[Ljava/lang/Object;

    array-length v8, v7

    if-ge v6, v8, :cond_3

    .line 9
    aput-object v5, v7, v6

    add-int/lit8 v6, v6, 0x1

    .line 10
    iput v6, v1, Landroidx/constraintlayout/solver/Pools$SimplePool;->mPoolSize:I

    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 11
    :cond_4
    iput v0, p0, Landroidx/constraintlayout/solver/LinearSystem;->mPoolVariablesCount:I

    .line 12
    iget-object v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mCache:Landroidx/constraintlayout/solver/Cache;

    iget-object v1, v1, Landroidx/constraintlayout/solver/Cache;->mIndexedVariables:Ljava/lang/Object;

    check-cast v1, [Landroidx/constraintlayout/solver/SolverVariable;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 13
    iput v0, p0, Landroidx/constraintlayout/solver/LinearSystem;->mVariablesID:I

    .line 14
    iget-object v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mGoal:Landroidx/constraintlayout/solver/LinearSystem$Row;

    invoke-interface {v1}, Landroidx/constraintlayout/solver/LinearSystem$Row;->clear()V

    const/4 v1, 0x1

    .line 15
    iput v1, p0, Landroidx/constraintlayout/solver/LinearSystem;->mNumColumns:I

    move v1, v0

    .line 16
    :goto_2
    iget v2, p0, Landroidx/constraintlayout/solver/LinearSystem;->mNumRows:I

    if-ge v1, v2, :cond_5

    .line 17
    iget-object v2, p0, Landroidx/constraintlayout/solver/LinearSystem;->mRows:[Landroidx/constraintlayout/solver/ArrayRow;

    aget-object v2, v2, v1

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 18
    :cond_5
    invoke-virtual {p0}, Landroidx/constraintlayout/solver/LinearSystem;->releaseRows()V

    .line 19
    iput v0, p0, Landroidx/constraintlayout/solver/LinearSystem;->mNumRows:I

    return-void
.end method
