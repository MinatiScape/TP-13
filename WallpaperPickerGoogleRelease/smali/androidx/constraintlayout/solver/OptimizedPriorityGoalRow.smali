.class public Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;
.super Landroidx/constraintlayout/solver/ArrayRow;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow$GoalVariableAccessor;
    }
.end annotation


# instance fields
.field public accessor:Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow$GoalVariableAccessor;

.field public arrayGoals:[Landroidx/constraintlayout/solver/SolverVariable;

.field public mCache:Landroidx/constraintlayout/solver/Cache;

.field public numGoals:I

.field public sortArray:[Landroidx/constraintlayout/solver/SolverVariable;


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/solver/Cache;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/solver/ArrayRow;-><init>(Landroidx/constraintlayout/solver/Cache;)V

    const/16 v0, 0x80

    new-array v1, v0, [Landroidx/constraintlayout/solver/SolverVariable;

    .line 2
    iput-object v1, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->arrayGoals:[Landroidx/constraintlayout/solver/SolverVariable;

    new-array v0, v0, [Landroidx/constraintlayout/solver/SolverVariable;

    .line 3
    iput-object v0, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->sortArray:[Landroidx/constraintlayout/solver/SolverVariable;

    const/4 v0, 0x0

    .line 4
    iput v0, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->numGoals:I

    .line 5
    new-instance v0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow$GoalVariableAccessor;

    invoke-direct {v0, p0, p0}, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow$GoalVariableAccessor;-><init>(Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;)V

    iput-object v0, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->accessor:Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow$GoalVariableAccessor;

    .line 6
    iput-object p1, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->mCache:Landroidx/constraintlayout/solver/Cache;

    return-void
.end method


# virtual methods
.method public addError(Landroidx/constraintlayout/solver/SolverVariable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->accessor:Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow$GoalVariableAccessor;

    .line 2
    iput-object p1, v0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow$GoalVariableAccessor;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 3
    iget-object v0, p1, Landroidx/constraintlayout/solver/SolverVariable;->goalStrengthVector:[F

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([FF)V

    .line 4
    iget-object v0, p1, Landroidx/constraintlayout/solver/SolverVariable;->goalStrengthVector:[F

    iget v1, p1, Landroidx/constraintlayout/solver/SolverVariable;->strength:I

    const/high16 v2, 0x3f800000    # 1.0f

    aput v2, v0, v1

    .line 5
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->addToGoal(Landroidx/constraintlayout/solver/SolverVariable;)V

    return-void
.end method

.method public final addToGoal(Landroidx/constraintlayout/solver/SolverVariable;)V
    .locals 5

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->numGoals:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iget-object v2, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->arrayGoals:[Landroidx/constraintlayout/solver/SolverVariable;

    array-length v3, v2

    if-le v0, v3, :cond_0

    .line 2
    array-length v0, v2

    mul-int/lit8 v0, v0, 0x2

    invoke-static {v2, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroidx/constraintlayout/solver/SolverVariable;

    iput-object v0, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->arrayGoals:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 3
    array-length v2, v0

    mul-int/lit8 v2, v2, 0x2

    invoke-static {v0, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroidx/constraintlayout/solver/SolverVariable;

    iput-object v0, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->sortArray:[Landroidx/constraintlayout/solver/SolverVariable;

    .line 4
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->arrayGoals:[Landroidx/constraintlayout/solver/SolverVariable;

    iget v2, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->numGoals:I

    aput-object p1, v0, v2

    add-int/2addr v2, v1

    .line 5
    iput v2, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->numGoals:I

    if-le v2, v1, :cond_2

    sub-int/2addr v2, v1

    .line 6
    aget-object v0, v0, v2

    iget v0, v0, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    iget v2, p1, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    if-le v0, v2, :cond_2

    const/4 v0, 0x0

    move v2, v0

    .line 7
    :goto_0
    iget v3, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->numGoals:I

    if-ge v2, v3, :cond_1

    .line 8
    iget-object v3, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->sortArray:[Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v4, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->arrayGoals:[Landroidx/constraintlayout/solver/SolverVariable;

    aget-object v4, v4, v2

    aput-object v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 9
    :cond_1
    iget-object v2, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->sortArray:[Landroidx/constraintlayout/solver/SolverVariable;

    new-instance v4, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow$1;

    invoke-direct {v4, p0}, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow$1;-><init>(Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;)V

    invoke-static {v2, v0, v3, v4}, Ljava/util/Arrays;->sort([Ljava/lang/Object;IILjava/util/Comparator;)V

    .line 10
    :goto_1
    iget v2, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->numGoals:I

    if-ge v0, v2, :cond_2

    .line 11
    iget-object v2, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->arrayGoals:[Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v3, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->sortArray:[Landroidx/constraintlayout/solver/SolverVariable;

    aget-object v3, v3, v0

    aput-object v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 12
    :cond_2
    iput-boolean v1, p1, Landroidx/constraintlayout/solver/SolverVariable;->inGoal:Z

    .line 13
    invoke-virtual {p1, p0}, Landroidx/constraintlayout/solver/SolverVariable;->addToRow(Landroidx/constraintlayout/solver/ArrayRow;)V

    return-void
.end method

.method public clear()V
    .locals 1

    const/4 v0, 0x0

    .line 1
    iput v0, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->numGoals:I

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    return-void
.end method

.method public getPivotCandidate(Landroidx/constraintlayout/solver/LinearSystem;[Z)Landroidx/constraintlayout/solver/SolverVariable;
    .locals 10

    const/4 p1, -0x1

    const/4 v0, 0x0

    move v2, p1

    move v1, v0

    .line 1
    :goto_0
    iget v3, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->numGoals:I

    if-ge v1, v3, :cond_8

    .line 2
    iget-object v3, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->arrayGoals:[Landroidx/constraintlayout/solver/SolverVariable;

    aget-object v4, v3, v1

    .line 3
    iget v5, v4, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    aget-boolean v5, p2, v5

    if-eqz v5, :cond_0

    goto :goto_7

    .line 4
    :cond_0
    iget-object v5, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->accessor:Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow$GoalVariableAccessor;

    .line 5
    iput-object v4, v5, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow$GoalVariableAccessor;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    const/4 v4, 0x7

    const/4 v6, 0x1

    if-ne v2, p1, :cond_4

    :goto_1
    if-ltz v4, :cond_3

    .line 6
    iget-object v3, v5, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow$GoalVariableAccessor;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v3, v3, Landroidx/constraintlayout/solver/SolverVariable;->goalStrengthVector:[F

    aget v3, v3, v4

    const/4 v7, 0x0

    cmpl-float v8, v3, v7

    if-lez v8, :cond_1

    goto :goto_2

    :cond_1
    cmpg-float v3, v3, v7

    if-gez v3, :cond_2

    goto :goto_3

    :cond_2
    add-int/lit8 v4, v4, -0x1

    goto :goto_1

    :cond_3
    :goto_2
    move v6, v0

    :goto_3
    if-eqz v6, :cond_7

    goto :goto_6

    .line 7
    :cond_4
    aget-object v3, v3, v2

    :goto_4
    if-ltz v4, :cond_6

    .line 8
    iget-object v7, v3, Landroidx/constraintlayout/solver/SolverVariable;->goalStrengthVector:[F

    aget v7, v7, v4

    .line 9
    iget-object v8, v5, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow$GoalVariableAccessor;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v8, v8, Landroidx/constraintlayout/solver/SolverVariable;->goalStrengthVector:[F

    aget v8, v8, v4

    cmpl-float v9, v8, v7

    if-nez v9, :cond_5

    add-int/lit8 v4, v4, -0x1

    goto :goto_4

    :cond_5
    cmpg-float v3, v8, v7

    if-gez v3, :cond_6

    goto :goto_5

    :cond_6
    move v6, v0

    :goto_5
    if-eqz v6, :cond_7

    :goto_6
    move v2, v1

    :cond_7
    :goto_7
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_8
    if-ne v2, p1, :cond_9

    const/4 p0, 0x0

    return-object p0

    .line 10
    :cond_9
    iget-object p0, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->arrayGoals:[Landroidx/constraintlayout/solver/SolverVariable;

    aget-object p0, p0, v2

    return-object p0
.end method

.method public final removeGoal(Landroidx/constraintlayout/solver/SolverVariable;)V
    .locals 5

    const/4 v0, 0x0

    move v1, v0

    .line 1
    :goto_0
    iget v2, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->numGoals:I

    if-ge v1, v2, :cond_2

    .line 2
    iget-object v2, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->arrayGoals:[Landroidx/constraintlayout/solver/SolverVariable;

    aget-object v2, v2, v1

    if-ne v2, p1, :cond_1

    .line 3
    :goto_1
    iget v2, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->numGoals:I

    add-int/lit8 v3, v2, -0x1

    if-ge v1, v3, :cond_0

    .line 4
    iget-object v2, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->arrayGoals:[Landroidx/constraintlayout/solver/SolverVariable;

    add-int/lit8 v3, v1, 0x1

    aget-object v4, v2, v3

    aput-object v4, v2, v1

    move v1, v3

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, -0x1

    .line 5
    iput v2, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->numGoals:I

    .line 6
    iput-boolean v0, p1, Landroidx/constraintlayout/solver/SolverVariable;->inGoal:Z

    return-void

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " goal -> ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ") : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 2
    :goto_0
    iget v2, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->numGoals:I

    if-ge v1, v2, :cond_0

    .line 3
    iget-object v2, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->arrayGoals:[Landroidx/constraintlayout/solver/SolverVariable;

    aget-object v2, v2, v1

    .line 4
    iget-object v3, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->accessor:Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow$GoalVariableAccessor;

    .line 5
    iput-object v2, v3, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow$GoalVariableAccessor;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 6
    invoke-static {v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->accessor:Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow$GoalVariableAccessor;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public updateFromRow(Landroidx/constraintlayout/solver/ArrayRow;Z)V
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 1
    iget-object v2, v1, Landroidx/constraintlayout/solver/ArrayRow;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    if-nez v2, :cond_0

    return-void

    .line 2
    :cond_0
    iget-object v3, v1, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    .line 3
    iget v4, v3, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    .line 4
    iget v3, v3, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    :goto_0
    const/4 v5, -0x1

    if-eq v4, v5, :cond_9

    if-lez v3, :cond_9

    .line 5
    iget-object v5, v1, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    .line 6
    iget-object v6, v5, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v6, v6, v4

    .line 7
    iget-object v5, v5, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget v5, v5, v4

    .line 8
    iget-object v7, v0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->mCache:Landroidx/constraintlayout/solver/Cache;

    iget-object v7, v7, Landroidx/constraintlayout/solver/Cache;->mIndexedVariables:Ljava/lang/Object;

    check-cast v7, [Landroidx/constraintlayout/solver/SolverVariable;

    aget-object v6, v7, v6

    .line 9
    iget-object v7, v0, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->accessor:Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow$GoalVariableAccessor;

    .line 10
    iput-object v6, v7, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow$GoalVariableAccessor;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 11
    iget-boolean v8, v6, Landroidx/constraintlayout/solver/SolverVariable;->inGoal:Z

    const v9, 0x38d1b717    # 1.0E-4f

    const/16 v10, 0x8

    const/4 v11, 0x0

    const/4 v13, 0x1

    if-eqz v8, :cond_4

    const/4 v8, 0x0

    :goto_1
    if-ge v8, v10, :cond_2

    .line 12
    iget-object v14, v7, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow$GoalVariableAccessor;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v14, v14, Landroidx/constraintlayout/solver/SolverVariable;->goalStrengthVector:[F

    aget v15, v14, v8

    iget-object v12, v2, Landroidx/constraintlayout/solver/SolverVariable;->goalStrengthVector:[F

    aget v12, v12, v8

    mul-float/2addr v12, v5

    add-float/2addr v12, v15

    aput v12, v14, v8

    .line 13
    aget v12, v14, v8

    .line 14
    invoke-static {v12}, Ljava/lang/Math;->abs(F)F

    move-result v12

    cmpg-float v12, v12, v9

    if-gez v12, :cond_1

    .line 15
    iget-object v12, v7, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow$GoalVariableAccessor;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v12, v12, Landroidx/constraintlayout/solver/SolverVariable;->goalStrengthVector:[F

    aput v11, v12, v8

    goto :goto_2

    :cond_1
    const/4 v13, 0x0

    :goto_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    :cond_2
    if-eqz v13, :cond_3

    .line 16
    iget-object v8, v7, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow$GoalVariableAccessor;->this$0:Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;

    iget-object v7, v7, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow$GoalVariableAccessor;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    .line 17
    invoke-virtual {v8, v7}, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->removeGoal(Landroidx/constraintlayout/solver/SolverVariable;)V

    :cond_3
    const/4 v12, 0x0

    goto :goto_5

    :cond_4
    const/4 v12, 0x0

    :goto_3
    if-ge v12, v10, :cond_7

    .line 18
    iget-object v8, v2, Landroidx/constraintlayout/solver/SolverVariable;->goalStrengthVector:[F

    aget v8, v8, v12

    cmpl-float v14, v8, v11

    if-eqz v14, :cond_6

    mul-float/2addr v8, v5

    .line 19
    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v14

    cmpg-float v14, v14, v9

    if-gez v14, :cond_5

    move v8, v11

    .line 20
    :cond_5
    iget-object v14, v7, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow$GoalVariableAccessor;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v14, v14, Landroidx/constraintlayout/solver/SolverVariable;->goalStrengthVector:[F

    aput v8, v14, v12

    goto :goto_4

    .line 21
    :cond_6
    iget-object v8, v7, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow$GoalVariableAccessor;->variable:Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v8, v8, Landroidx/constraintlayout/solver/SolverVariable;->goalStrengthVector:[F

    aput v11, v8, v12

    :goto_4
    add-int/lit8 v12, v12, 0x1

    goto :goto_3

    :cond_7
    move v12, v13

    :goto_5
    if-eqz v12, :cond_8

    .line 22
    invoke-virtual {v0, v6}, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->addToGoal(Landroidx/constraintlayout/solver/SolverVariable;)V

    .line 23
    :cond_8
    iget v6, v0, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    iget v7, v1, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    mul-float/2addr v7, v5

    add-float/2addr v7, v6

    iput v7, v0, Landroidx/constraintlayout/solver/ArrayRow;->constantValue:F

    .line 24
    iget-object v5, v1, Landroidx/constraintlayout/solver/ArrayRow;->variables:Landroidx/constraintlayout/solver/ArrayLinkedVariables;

    .line 25
    iget-object v5, v5, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v4, v5, v4

    goto/16 :goto_0

    .line 26
    :cond_9
    invoke-virtual {v0, v2}, Landroidx/constraintlayout/solver/OptimizedPriorityGoalRow;->removeGoal(Landroidx/constraintlayout/solver/SolverVariable;)V

    return-void
.end method
