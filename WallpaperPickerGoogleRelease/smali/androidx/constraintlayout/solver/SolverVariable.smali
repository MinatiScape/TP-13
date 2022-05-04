.class public Landroidx/constraintlayout/solver/SolverVariable;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static uniqueErrorId:I = 0x1


# instance fields
.field public computedValue:F

.field public definitionId:I

.field public goalStrengthVector:[F

.field public id:I

.field public inGoal:Z

.field public mClientEquations:[Landroidx/constraintlayout/solver/ArrayRow;

.field public mClientEquationsCount:I

.field public mType:I

.field public strength:I

.field public strengthVector:[F

.field public usageInRowCount:I


# direct methods
.method public constructor <init>(I)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    .line 3
    iput v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->definitionId:I

    const/4 v0, 0x0

    .line 4
    iput v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->strength:I

    const/16 v1, 0x8

    new-array v2, v1, [F

    .line 5
    iput-object v2, p0, Landroidx/constraintlayout/solver/SolverVariable;->strengthVector:[F

    new-array v2, v1, [F

    .line 6
    iput-object v2, p0, Landroidx/constraintlayout/solver/SolverVariable;->goalStrengthVector:[F

    new-array v1, v1, [Landroidx/constraintlayout/solver/ArrayRow;

    .line 7
    iput-object v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquations:[Landroidx/constraintlayout/solver/ArrayRow;

    .line 8
    iput v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    .line 9
    iput v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->usageInRowCount:I

    .line 10
    iput p1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mType:I

    return-void
.end method


# virtual methods
.method public final addToRow(Landroidx/constraintlayout/solver/ArrayRow;)V
    .locals 3

    const/4 v0, 0x0

    .line 1
    :goto_0
    iget v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    if-ge v0, v1, :cond_1

    .line 2
    iget-object v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquations:[Landroidx/constraintlayout/solver/ArrayRow;

    aget-object v1, v1, v0

    if-ne v1, p1, :cond_0

    return-void

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 3
    :cond_1
    iget-object v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquations:[Landroidx/constraintlayout/solver/ArrayRow;

    array-length v2, v0

    if-lt v1, v2, :cond_2

    .line 4
    array-length v1, v0

    mul-int/lit8 v1, v1, 0x2

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroidx/constraintlayout/solver/ArrayRow;

    iput-object v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquations:[Landroidx/constraintlayout/solver/ArrayRow;

    .line 5
    :cond_2
    iget-object v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquations:[Landroidx/constraintlayout/solver/ArrayRow;

    iget v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    aput-object p1, v0, v1

    add-int/lit8 v1, v1, 0x1

    .line 6
    iput v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    return-void
.end method

.method public final removeFromRow(Landroidx/constraintlayout/solver/ArrayRow;)V
    .locals 4

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    .line 2
    iget-object v2, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquations:[Landroidx/constraintlayout/solver/ArrayRow;

    aget-object v2, v2, v1

    if-ne v2, p1, :cond_1

    :goto_1
    add-int/lit8 p1, v0, -0x1

    if-ge v1, p1, :cond_0

    .line 3
    iget-object p1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquations:[Landroidx/constraintlayout/solver/ArrayRow;

    add-int/lit8 v2, v1, 0x1

    aget-object v3, p1, v2

    aput-object v3, p1, v1

    move v1, v2

    goto :goto_1

    .line 4
    :cond_0
    iget p1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    return-void

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public reset()V
    .locals 2

    const/4 v0, 0x5

    .line 1
    iput v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->mType:I

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->strength:I

    const/4 v1, -0x1

    .line 3
    iput v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    .line 4
    iput v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->definitionId:I

    const/4 v1, 0x0

    .line 5
    iput v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->computedValue:F

    .line 6
    iput v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    .line 7
    iput v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->usageInRowCount:I

    .line 8
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->inGoal:Z

    .line 9
    iget-object p0, p0, Landroidx/constraintlayout/solver/SolverVariable;->goalStrengthVector:[F

    invoke-static {p0, v1}, Ljava/util/Arrays;->fill([FF)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    const-string p0, "null"

    return-object p0
.end method

.method public final updateReferencesWithNewDefinition(Landroidx/constraintlayout/solver/ArrayRow;)V
    .locals 4

    .line 1
    iget v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_0

    .line 2
    iget-object v3, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquations:[Landroidx/constraintlayout/solver/ArrayRow;

    aget-object v3, v3, v2

    invoke-virtual {v3, p1, v1}, Landroidx/constraintlayout/solver/ArrayRow;->updateFromRow(Landroidx/constraintlayout/solver/ArrayRow;Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 3
    :cond_0
    iput v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    return-void
.end method
