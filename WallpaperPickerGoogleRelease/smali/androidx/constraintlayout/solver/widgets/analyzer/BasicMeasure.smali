.class public Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;,
        Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measurer;
    }
.end annotation


# instance fields
.field public constraintWidgetContainer:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

.field public mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

.field public final mVariableDimensionsWidgets:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/solver/widgets/ConstraintWidget;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mVariableDimensionsWidgets:Ljava/util/ArrayList;

    .line 3
    new-instance v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    invoke-direct {v0}, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    .line 4
    iput-object p1, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->constraintWidgetContainer:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    return-void
.end method


# virtual methods
.method public final measure(Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measurer;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Z)Z
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    invoke-virtual {p2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHorizontalDimensionBehaviour$enumunboxing$()I

    move-result v1

    iput v1, v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->horizontalBehavior:I

    .line 2
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    invoke-virtual {p2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getVerticalDimensionBehaviour$enumunboxing$()I

    move-result v1

    iput v1, v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->verticalBehavior:I

    .line 3
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    invoke-virtual {p2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v1

    iput v1, v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->horizontalDimension:I

    .line 4
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    invoke-virtual {p2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v1

    iput v1, v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->verticalDimension:I

    .line 5
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->measuredNeedsSolverPass:Z

    .line 6
    iput-boolean p3, v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->useDeprecated:Z

    .line 7
    iget p3, v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->horizontalBehavior:I

    const/4 v2, 0x1

    const/4 v3, 0x3

    if-ne p3, v3, :cond_0

    move p3, v2

    goto :goto_0

    :cond_0
    move p3, v1

    .line 8
    :goto_0
    iget v4, v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->verticalBehavior:I

    if-ne v4, v3, :cond_1

    move v3, v2

    goto :goto_1

    :cond_1
    move v3, v1

    :goto_1
    const/4 v4, 0x0

    if-eqz p3, :cond_2

    .line 9
    iget p3, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mDimensionRatio:F

    cmpl-float p3, p3, v4

    if-lez p3, :cond_2

    move p3, v2

    goto :goto_2

    :cond_2
    move p3, v1

    :goto_2
    if-eqz v3, :cond_3

    .line 10
    iget v3, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mDimensionRatio:F

    cmpl-float v3, v3, v4

    if-lez v3, :cond_3

    move v3, v2

    goto :goto_3

    :cond_3
    move v3, v1

    :goto_3
    const/4 v4, 0x4

    if-eqz p3, :cond_4

    .line 11
    iget-object p3, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedMatchConstraintDefault:[I

    aget p3, p3, v1

    if-ne p3, v4, :cond_4

    .line 12
    iput v2, v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->horizontalBehavior:I

    :cond_4
    if-eqz v3, :cond_5

    .line 13
    iget-object p3, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mResolvedMatchConstraintDefault:[I

    aget p3, p3, v2

    if-ne p3, v4, :cond_5

    .line 14
    iput v2, v0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->verticalBehavior:I

    .line 15
    :cond_5
    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;

    invoke-virtual {p1, p2, v0}, Landroidx/constraintlayout/widget/ConstraintLayout$Measurer;->measure(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;)V

    .line 16
    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    iget p1, p1, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->measuredWidth:I

    invoke-virtual {p2, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setWidth(I)V

    .line 17
    iget-object p1, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    iget p1, p1, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->measuredHeight:I

    invoke-virtual {p2, p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setHeight(I)V

    .line 18
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->mMeasure:Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;

    iget-boolean p1, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->measuredHasBaseline:Z

    .line 19
    iput-boolean p1, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->hasBaseline:Z

    .line 20
    iget p1, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->measuredBaseline:I

    .line 21
    iput p1, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mBaselineDistance:I

    if-lez p1, :cond_6

    goto :goto_4

    :cond_6
    move v2, v1

    .line 22
    :goto_4
    iput-boolean v2, p2, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->hasBaseline:Z

    .line 23
    iput-boolean v1, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->useDeprecated:Z

    .line 24
    iget-boolean p0, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure$Measure;->measuredNeedsSolverPass:Z

    return p0
.end method

.method public final solveLinearSystem(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;II)V
    .locals 3

    .line 1
    iget v0, p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinWidth:I

    .line 2
    iget v1, p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinHeight:I

    const/4 v2, 0x0

    .line 3
    invoke-virtual {p1, v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setMinWidth(I)V

    .line 4
    invoke-virtual {p1, v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setMinHeight(I)V

    .line 5
    iput p2, p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWidth:I

    .line 6
    iget v2, p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinWidth:I

    if-ge p2, v2, :cond_0

    .line 7
    iput v2, p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mWidth:I

    .line 8
    :cond_0
    iput p3, p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHeight:I

    .line 9
    iget p2, p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mMinHeight:I

    if-ge p3, p2, :cond_1

    .line 10
    iput p2, p1, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->mHeight:I

    .line 11
    :cond_1
    invoke-virtual {p1, v0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setMinWidth(I)V

    .line 12
    invoke-virtual {p1, v1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setMinHeight(I)V

    .line 13
    iget-object p0, p0, Landroidx/constraintlayout/solver/widgets/analyzer/BasicMeasure;->constraintWidgetContainer:Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;

    invoke-virtual {p0}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->layout()V

    return-void
.end method
