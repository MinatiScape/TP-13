.class public Landroidx/constraintlayout/solver/ArrayLinkedVariables;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public ROW_SIZE:I

.field public currentSize:I

.field public mArrayIndices:[I

.field public mArrayNextIndices:[I

.field public mArrayValues:[F

.field public final mCache:Landroidx/constraintlayout/solver/Cache;

.field public mDidFillOnce:Z

.field public mHead:I

.field public mLast:I

.field public final mRow:Landroidx/constraintlayout/solver/ArrayRow;


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/solver/ArrayRow;Landroidx/constraintlayout/solver/Cache;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    const/16 v1, 0x8

    .line 3
    iput v1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->ROW_SIZE:I

    new-array v2, v1, [I

    .line 4
    iput-object v2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    new-array v2, v1, [I

    .line 5
    iput-object v2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    new-array v1, v1, [F

    .line 6
    iput-object v1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayValues:[F

    const/4 v1, -0x1

    .line 7
    iput v1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    .line 8
    iput v1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mLast:I

    .line 9
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    .line 10
    iput-object p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mRow:Landroidx/constraintlayout/solver/ArrayRow;

    .line 11
    iput-object p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mCache:Landroidx/constraintlayout/solver/Cache;

    return-void
.end method


# virtual methods
.method public final add(Landroidx/constraintlayout/solver/SolverVariable;FZ)V
    .locals 10

    .line 1
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v1, 0x3a83126f    # 0.001f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    return-void

    .line 2
    :cond_0
    iget v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    const/4 v2, 0x0

    const/4 v3, -0x1

    const/4 v4, 0x1

    if-ne v0, v3, :cond_2

    .line 3
    iput v2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    .line 4
    iget-object p3, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayValues:[F

    aput p2, p3, v2

    .line 5
    iget-object p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    iget p3, p1, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    aput p3, p2, v2

    .line 6
    iget-object p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aput v3, p2, v2

    .line 7
    iget p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->usageInRowCount:I

    add-int/2addr p2, v4

    iput p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->usageInRowCount:I

    .line 8
    iget-object p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mRow:Landroidx/constraintlayout/solver/ArrayRow;

    invoke-virtual {p1, p2}, Landroidx/constraintlayout/solver/SolverVariable;->addToRow(Landroidx/constraintlayout/solver/ArrayRow;)V

    .line 9
    iget p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    add-int/2addr p1, v4

    iput p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    .line 10
    iget-boolean p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    if-nez p1, :cond_1

    .line 11
    iget p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mLast:I

    add-int/2addr p1, v4

    iput p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mLast:I

    .line 12
    iget-object p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length p3, p2

    if-lt p1, p3, :cond_1

    .line 13
    iput-boolean v4, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    .line 14
    array-length p1, p2

    sub-int/2addr p1, v4

    iput p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mLast:I

    :cond_1
    return-void

    :cond_2
    move v5, v2

    move v6, v3

    :goto_0
    if-eq v0, v3, :cond_a

    .line 15
    iget v7, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v5, v7, :cond_a

    .line 16
    iget-object v7, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v8, v7, v0

    .line 17
    iget v9, p1, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    if-ne v8, v9, :cond_8

    .line 18
    iget-object v2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget v3, v2, v0

    add-float/2addr v3, p2

    aput v3, v2, v0

    .line 19
    aget p2, v2, v0

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    cmpg-float p2, p2, v1

    const/4 v1, 0x0

    if-gez p2, :cond_3

    .line 20
    iget-object p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayValues:[F

    aput v1, p2, v0

    .line 21
    :cond_3
    iget-object p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget p2, p2, v0

    cmpl-float p2, p2, v1

    if-nez p2, :cond_7

    .line 22
    iget p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    if-ne v0, p2, :cond_4

    .line 23
    iget-object p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget p2, p2, v0

    iput p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    goto :goto_1

    .line 24
    :cond_4
    iget-object p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v1, p2, v0

    aput v1, p2, v6

    :goto_1
    if-eqz p3, :cond_5

    .line 25
    iget-object p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mRow:Landroidx/constraintlayout/solver/ArrayRow;

    invoke-virtual {p1, p2}, Landroidx/constraintlayout/solver/SolverVariable;->removeFromRow(Landroidx/constraintlayout/solver/ArrayRow;)V

    .line 26
    :cond_5
    iget-boolean p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    if-eqz p2, :cond_6

    .line 27
    iput v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mLast:I

    .line 28
    :cond_6
    iget p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->usageInRowCount:I

    sub-int/2addr p2, v4

    iput p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->usageInRowCount:I

    .line 29
    iget p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    sub-int/2addr p1, v4

    iput p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    :cond_7
    return-void

    .line 30
    :cond_8
    aget v7, v7, v0

    if-ge v7, v9, :cond_9

    move v6, v0

    .line 31
    :cond_9
    iget-object v7, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v0, v7, v0

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 32
    :cond_a
    iget p3, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mLast:I

    add-int/lit8 v0, p3, 0x1

    .line 33
    iget-boolean v1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    if-eqz v1, :cond_c

    .line 34
    iget-object v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v1, v0, p3

    if-ne v1, v3, :cond_b

    goto :goto_2

    .line 35
    :cond_b
    array-length p3, v0

    goto :goto_2

    :cond_c
    move p3, v0

    .line 36
    :goto_2
    iget-object v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length v1, v0

    if-lt p3, v1, :cond_e

    .line 37
    iget v1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    array-length v0, v0

    if-ge v1, v0, :cond_e

    move v0, v2

    .line 38
    :goto_3
    iget-object v1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length v5, v1

    if-ge v0, v5, :cond_e

    .line 39
    aget v1, v1, v0

    if-ne v1, v3, :cond_d

    move p3, v0

    goto :goto_4

    :cond_d
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 40
    :cond_e
    :goto_4
    iget-object v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length v1, v0

    if-lt p3, v1, :cond_f

    .line 41
    array-length p3, v0

    .line 42
    iget v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->ROW_SIZE:I

    mul-int/lit8 v0, v0, 0x2

    iput v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->ROW_SIZE:I

    .line 43
    iput-boolean v2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    add-int/lit8 v1, p3, -0x1

    .line 44
    iput v1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mLast:I

    .line 45
    iget-object v1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayValues:[F

    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object v0

    iput-object v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayValues:[F

    .line 46
    iget-object v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    iget v1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->ROW_SIZE:I

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    iput-object v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    .line 47
    iget-object v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    iget v1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->ROW_SIZE:I

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    iput-object v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    .line 48
    :cond_f
    iget-object v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    iget v1, p1, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    aput v1, v0, p3

    .line 49
    iget-object v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayValues:[F

    aput p2, v0, p3

    if-eq v6, v3, :cond_10

    .line 50
    iget-object p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v0, p2, v6

    aput v0, p2, p3

    .line 51
    aput p3, p2, v6

    goto :goto_5

    .line 52
    :cond_10
    iget-object p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    iget v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    aput v0, p2, p3

    .line 53
    iput p3, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    .line 54
    :goto_5
    iget p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->usageInRowCount:I

    add-int/2addr p2, v4

    iput p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->usageInRowCount:I

    .line 55
    iget-object p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mRow:Landroidx/constraintlayout/solver/ArrayRow;

    invoke-virtual {p1, p2}, Landroidx/constraintlayout/solver/SolverVariable;->addToRow(Landroidx/constraintlayout/solver/ArrayRow;)V

    .line 56
    iget p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    add-int/2addr p1, v4

    iput p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    .line 57
    iget-boolean p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    if-nez p1, :cond_11

    .line 58
    iget p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mLast:I

    add-int/2addr p1, v4

    iput p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mLast:I

    .line 59
    :cond_11
    iget p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mLast:I

    iget-object p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length p3, p2

    if-lt p1, p3, :cond_12

    .line 60
    iput-boolean v4, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    .line 61
    array-length p1, p2

    sub-int/2addr p1, v4

    iput p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mLast:I

    :cond_12
    return-void
.end method

.method public final clear()V
    .locals 5

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/4 v3, -0x1

    if-eq v0, v3, :cond_1

    .line 2
    iget v4, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v2, v4, :cond_1

    .line 3
    iget-object v3, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mCache:Landroidx/constraintlayout/solver/Cache;

    iget-object v3, v3, Landroidx/constraintlayout/solver/Cache;->mIndexedVariables:Ljava/lang/Object;

    check-cast v3, [Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v4, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v4, v4, v0

    aget-object v3, v3, v4

    if-eqz v3, :cond_0

    .line 4
    iget-object v4, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mRow:Landroidx/constraintlayout/solver/ArrayRow;

    invoke-virtual {v3, v4}, Landroidx/constraintlayout/solver/SolverVariable;->removeFromRow(Landroidx/constraintlayout/solver/ArrayRow;)V

    .line 5
    :cond_0
    iget-object v3, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v0, v3, v0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 6
    :cond_1
    iput v3, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    .line 7
    iput v3, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mLast:I

    .line 8
    iput-boolean v1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    .line 9
    iput v1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    return-void
.end method

.method public final get(Landroidx/constraintlayout/solver/SolverVariable;)F
    .locals 4

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    const/4 v1, 0x0

    :goto_0
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    .line 2
    iget v2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v1, v2, :cond_1

    .line 3
    iget-object v2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v2, v2, v0

    iget v3, p1, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    if-ne v2, v3, :cond_0

    .line 4
    iget-object p0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget p0, p0, v0

    return p0

    .line 5
    :cond_0
    iget-object v2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v0, v2, v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public getPivotCandidate([ZLandroidx/constraintlayout/solver/SolverVariable;)Landroidx/constraintlayout/solver/SolverVariable;
    .locals 9

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move v4, v1

    :goto_0
    const/4 v5, -0x1

    if-eq v0, v5, :cond_3

    .line 2
    iget v5, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v2, v5, :cond_3

    .line 3
    iget-object v5, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget v5, v5, v0

    cmpg-float v6, v5, v1

    if-gez v6, :cond_2

    .line 4
    iget-object v6, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mCache:Landroidx/constraintlayout/solver/Cache;

    iget-object v6, v6, Landroidx/constraintlayout/solver/Cache;->mIndexedVariables:Ljava/lang/Object;

    check-cast v6, [Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v7, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v7, v7, v0

    aget-object v6, v6, v7

    if-eqz p1, :cond_0

    .line 5
    iget v7, v6, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    aget-boolean v7, p1, v7

    if-nez v7, :cond_2

    :cond_0
    if-eq v6, p2, :cond_2

    .line 6
    iget v7, v6, Landroidx/constraintlayout/solver/SolverVariable;->mType:I

    const/4 v8, 0x3

    if-eq v7, v8, :cond_1

    const/4 v8, 0x4

    if-ne v7, v8, :cond_2

    :cond_1
    cmpg-float v7, v5, v4

    if-gez v7, :cond_2

    move v4, v5

    move-object v3, v6

    .line 7
    :cond_2
    iget-object v5, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v0, v5, v0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    return-object v3
.end method

.method public final getVariable(I)Landroidx/constraintlayout/solver/SolverVariable;
    .locals 3

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    const/4 v1, 0x0

    :goto_0
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    .line 2
    iget v2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v1, v2, :cond_1

    if-ne v1, p1, :cond_0

    .line 3
    iget-object p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mCache:Landroidx/constraintlayout/solver/Cache;

    iget-object p1, p1, Landroidx/constraintlayout/solver/Cache;->mIndexedVariables:Ljava/lang/Object;

    check-cast p1, [Landroidx/constraintlayout/solver/SolverVariable;

    iget-object p0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget p0, p0, v0

    aget-object p0, p1, p0

    return-object p0

    .line 4
    :cond_0
    iget-object v2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v0, v2, v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final getVariableValue(I)F
    .locals 3

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    const/4 v1, 0x0

    :goto_0
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    .line 2
    iget v2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v1, v2, :cond_1

    if-ne v1, p1, :cond_0

    .line 3
    iget-object p0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget p0, p0, v0

    return p0

    .line 4
    :cond_0
    iget-object v2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v0, v2, v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public final isNew(Landroidx/constraintlayout/solver/SolverVariable;)Z
    .locals 0

    .line 1
    iget p0, p1, Landroidx/constraintlayout/solver/SolverVariable;->usageInRowCount:I

    const/4 p1, 0x1

    if-gt p0, p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final put(Landroidx/constraintlayout/solver/SolverVariable;F)V
    .locals 9

    const/4 v0, 0x0

    cmpl-float v0, p2, v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 1
    invoke-virtual {p0, p1, v1}, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->remove(Landroidx/constraintlayout/solver/SolverVariable;Z)F

    return-void

    .line 2
    :cond_0
    iget v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    const/4 v2, 0x0

    const/4 v3, -0x1

    if-ne v0, v3, :cond_2

    .line 3
    iput v2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    .line 4
    iget-object v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayValues:[F

    aput p2, v0, v2

    .line 5
    iget-object p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    iget v0, p1, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    aput v0, p2, v2

    .line 6
    iget-object p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aput v3, p2, v2

    .line 7
    iget p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->usageInRowCount:I

    add-int/2addr p2, v1

    iput p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->usageInRowCount:I

    .line 8
    iget-object p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mRow:Landroidx/constraintlayout/solver/ArrayRow;

    invoke-virtual {p1, p2}, Landroidx/constraintlayout/solver/SolverVariable;->addToRow(Landroidx/constraintlayout/solver/ArrayRow;)V

    .line 9
    iget p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    add-int/2addr p1, v1

    iput p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    .line 10
    iget-boolean p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    if-nez p1, :cond_1

    .line 11
    iget p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mLast:I

    add-int/2addr p1, v1

    iput p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mLast:I

    .line 12
    iget-object p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length v0, p2

    if-lt p1, v0, :cond_1

    .line 13
    iput-boolean v1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    .line 14
    array-length p1, p2

    sub-int/2addr p1, v1

    iput p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mLast:I

    :cond_1
    return-void

    :cond_2
    move v4, v2

    move v5, v3

    :goto_0
    if-eq v0, v3, :cond_5

    .line 15
    iget v6, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v4, v6, :cond_5

    .line 16
    iget-object v6, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v7, v6, v0

    iget v8, p1, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    if-ne v7, v8, :cond_3

    .line 17
    iget-object p0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayValues:[F

    aput p2, p0, v0

    return-void

    .line 18
    :cond_3
    aget v6, v6, v0

    if-ge v6, v8, :cond_4

    move v5, v0

    .line 19
    :cond_4
    iget-object v6, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v0, v6, v0

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 20
    :cond_5
    iget v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mLast:I

    add-int/lit8 v4, v0, 0x1

    .line 21
    iget-boolean v6, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    if-eqz v6, :cond_7

    .line 22
    iget-object v4, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v6, v4, v0

    if-ne v6, v3, :cond_6

    goto :goto_1

    .line 23
    :cond_6
    array-length v0, v4

    goto :goto_1

    :cond_7
    move v0, v4

    .line 24
    :goto_1
    iget-object v4, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length v6, v4

    if-lt v0, v6, :cond_9

    .line 25
    iget v6, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    array-length v4, v4

    if-ge v6, v4, :cond_9

    move v4, v2

    .line 26
    :goto_2
    iget-object v6, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length v7, v6

    if-ge v4, v7, :cond_9

    .line 27
    aget v6, v6, v4

    if-ne v6, v3, :cond_8

    move v0, v4

    goto :goto_3

    :cond_8
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 28
    :cond_9
    :goto_3
    iget-object v4, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length v6, v4

    if-lt v0, v6, :cond_a

    .line 29
    array-length v0, v4

    .line 30
    iget v4, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->ROW_SIZE:I

    mul-int/lit8 v4, v4, 0x2

    iput v4, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->ROW_SIZE:I

    .line 31
    iput-boolean v2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    add-int/lit8 v2, v0, -0x1

    .line 32
    iput v2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mLast:I

    .line 33
    iget-object v2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayValues:[F

    invoke-static {v2, v4}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object v2

    iput-object v2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayValues:[F

    .line 34
    iget-object v2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    iget v4, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->ROW_SIZE:I

    invoke-static {v2, v4}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v2

    iput-object v2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    .line 35
    iget-object v2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    iget v4, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->ROW_SIZE:I

    invoke-static {v2, v4}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v2

    iput-object v2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    .line 36
    :cond_a
    iget-object v2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    iget v4, p1, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    aput v4, v2, v0

    .line 37
    iget-object v2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayValues:[F

    aput p2, v2, v0

    if-eq v5, v3, :cond_b

    .line 38
    iget-object p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v2, p2, v5

    aput v2, p2, v0

    .line 39
    aput v0, p2, v5

    goto :goto_4

    .line 40
    :cond_b
    iget-object p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    iget v2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    aput v2, p2, v0

    .line 41
    iput v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    .line 42
    :goto_4
    iget p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->usageInRowCount:I

    add-int/2addr p2, v1

    iput p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->usageInRowCount:I

    .line 43
    iget-object p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mRow:Landroidx/constraintlayout/solver/ArrayRow;

    invoke-virtual {p1, p2}, Landroidx/constraintlayout/solver/SolverVariable;->addToRow(Landroidx/constraintlayout/solver/ArrayRow;)V

    .line 44
    iget p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    add-int/2addr p1, v1

    iput p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    .line 45
    iget-boolean p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    if-nez p2, :cond_c

    .line 46
    iget p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mLast:I

    add-int/2addr p2, v1

    iput p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mLast:I

    .line 47
    :cond_c
    iget-object p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length v0, p2

    if-lt p1, v0, :cond_d

    .line 48
    iput-boolean v1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    .line 49
    :cond_d
    iget p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mLast:I

    array-length v0, p2

    if-lt p1, v0, :cond_e

    .line 50
    iput-boolean v1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    .line 51
    array-length p1, p2

    sub-int/2addr p1, v1

    iput p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mLast:I

    :cond_e
    return-void
.end method

.method public final remove(Landroidx/constraintlayout/solver/SolverVariable;Z)F
    .locals 8

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    return v1

    :cond_0
    const/4 v3, 0x0

    move v4, v2

    :goto_0
    if-eq v0, v2, :cond_5

    .line 2
    iget v5, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v3, v5, :cond_5

    .line 3
    iget-object v5, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v5, v5, v0

    .line 4
    iget v6, p1, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    if-ne v5, v6, :cond_4

    .line 5
    iget v1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    if-ne v0, v1, :cond_1

    .line 6
    iget-object v1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v1, v1, v0

    iput v1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    goto :goto_1

    .line 7
    :cond_1
    iget-object v1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v3, v1, v0

    aput v3, v1, v4

    :goto_1
    if-eqz p2, :cond_2

    .line 8
    iget-object p2, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mRow:Landroidx/constraintlayout/solver/ArrayRow;

    invoke-virtual {p1, p2}, Landroidx/constraintlayout/solver/SolverVariable;->removeFromRow(Landroidx/constraintlayout/solver/ArrayRow;)V

    .line 9
    :cond_2
    iget p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->usageInRowCount:I

    add-int/2addr p2, v2

    iput p2, p1, Landroidx/constraintlayout/solver/SolverVariable;->usageInRowCount:I

    .line 10
    iget p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    add-int/2addr p1, v2

    iput p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    .line 11
    iget-object p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aput v2, p1, v0

    .line 12
    iget-boolean p1, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    if-eqz p1, :cond_3

    .line 13
    iput v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mLast:I

    .line 14
    :cond_3
    iget-object p0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget p0, p0, v0

    return p0

    .line 15
    :cond_4
    iget-object v4, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v4, v4, v0

    add-int/lit8 v3, v3, 0x1

    move v7, v4

    move v4, v0

    move v0, v7

    goto :goto_0

    :cond_5
    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mHead:I

    const-string v1, ""

    const/4 v2, 0x0

    :goto_0
    const/4 v3, -0x1

    if-eq v0, v3, :cond_0

    .line 2
    iget v3, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v2, v3, :cond_0

    const-string v3, " -> "

    .line 3
    invoke-static {v1, v3}, Landroidx/appcompat/view/SupportMenuInflater$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 4
    invoke-static {v1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget v3, v3, v0

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " : "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 5
    invoke-static {v1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mCache:Landroidx/constraintlayout/solver/Cache;

    iget-object v3, v3, Landroidx/constraintlayout/solver/Cache;->mIndexedVariables:Ljava/lang/Object;

    check-cast v3, [Landroidx/constraintlayout/solver/SolverVariable;

    iget-object v4, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v4, v4, v0

    aget-object v3, v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 6
    iget-object v3, p0, Landroidx/constraintlayout/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v0, v3, v0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method
