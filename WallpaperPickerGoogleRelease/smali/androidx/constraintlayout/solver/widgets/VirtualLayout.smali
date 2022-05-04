.class public Landroidx/constraintlayout/solver/widgets/VirtualLayout;
.super Landroidx/constraintlayout/solver/widgets/HelperWidget;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/constraintlayout/solver/widgets/HelperWidget;-><init>()V

    return-void
.end method


# virtual methods
.method public updateConstraints(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;)V
    .locals 1

    const/4 p1, 0x0

    .line 1
    :goto_0
    iget v0, p0, Landroidx/constraintlayout/solver/widgets/HelperWidget;->mWidgetsCount:I

    if-ge p1, v0, :cond_0

    .line 2
    iget-object v0, p0, Landroidx/constraintlayout/solver/widgets/HelperWidget;->mWidgets:[Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    aget-object v0, v0, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
