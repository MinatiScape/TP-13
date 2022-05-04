.class public Landroidx/recyclerview/widget/PagerSnapHelper;
.super Landroidx/recyclerview/widget/SnapHelper;
.source "SourceFile"


# instance fields
.field public mHorizontalHelper:Landroidx/recyclerview/widget/OrientationHelper;

.field public mVerticalHelper:Landroidx/recyclerview/widget/OrientationHelper;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/SnapHelper;-><init>()V

    return-void
.end method


# virtual methods
.method public calculateDistanceToFinalSnap(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;Landroid/view/View;)[I
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "layoutManager",
            "targetView"
        }
    .end annotation

    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->canScrollHorizontally()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 2
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/PagerSnapHelper;->getHorizontalHelper(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)Landroidx/recyclerview/widget/OrientationHelper;

    move-result-object v1

    .line 3
    invoke-virtual {p0, p2, v1}, Landroidx/recyclerview/widget/PagerSnapHelper;->distanceToCenter(Landroid/view/View;Landroidx/recyclerview/widget/OrientationHelper;)I

    move-result v1

    aput v1, v0, v2

    goto :goto_0

    :cond_0
    aput v2, v0, v2

    .line 4
    :goto_0
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->canScrollVertically()Z

    move-result v1

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    .line 5
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/PagerSnapHelper;->getVerticalHelper(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)Landroidx/recyclerview/widget/OrientationHelper;

    move-result-object p1

    .line 6
    invoke-virtual {p0, p2, p1}, Landroidx/recyclerview/widget/PagerSnapHelper;->distanceToCenter(Landroid/view/View;Landroidx/recyclerview/widget/OrientationHelper;)I

    move-result p0

    aput p0, v0, v3

    goto :goto_1

    :cond_1
    aput v2, v0, v3

    :goto_1
    return-object v0
.end method

.method public final distanceToCenter(Landroid/view/View;Landroidx/recyclerview/widget/OrientationHelper;)I
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "targetView",
            "helper"
        }
    .end annotation

    .line 1
    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result p0

    .line 2
    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    add-int/2addr p1, p0

    .line 3
    invoke-virtual {p2}, Landroidx/recyclerview/widget/OrientationHelper;->getStartAfterPadding()I

    move-result p0

    invoke-virtual {p2}, Landroidx/recyclerview/widget/OrientationHelper;->getTotalSpace()I

    move-result p2

    div-int/lit8 p2, p2, 0x2

    add-int/2addr p2, p0

    sub-int/2addr p1, p2

    return p1
.end method

.method public final findCenterView(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;Landroidx/recyclerview/widget/OrientationHelper;)Landroid/view/View;
    .locals 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "layoutManager",
            "helper"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result p0

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 2
    :cond_0
    invoke-virtual {p2}, Landroidx/recyclerview/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v1

    invoke-virtual {p2}, Landroidx/recyclerview/widget/OrientationHelper;->getTotalSpace()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v2, v1

    const v1, 0x7fffffff

    const/4 v3, 0x0

    :goto_0
    if-ge v3, p0, :cond_2

    .line 3
    invoke-virtual {p1, v3}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 4
    invoke-virtual {p2, v4}, Landroidx/recyclerview/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v5

    .line 5
    invoke-virtual {p2, v4}, Landroidx/recyclerview/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    add-int/2addr v6, v5

    sub-int/2addr v6, v2

    .line 6
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v5

    if-ge v5, v1, :cond_1

    move-object v0, v4

    move v1, v5

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method public findSnapView(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)Landroid/view/View;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "layoutManager"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->canScrollVertically()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/PagerSnapHelper;->getVerticalHelper(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)Landroidx/recyclerview/widget/OrientationHelper;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Landroidx/recyclerview/widget/PagerSnapHelper;->findCenterView(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;Landroidx/recyclerview/widget/OrientationHelper;)Landroid/view/View;

    move-result-object p0

    return-object p0

    .line 3
    :cond_0
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->canScrollHorizontally()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 4
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/PagerSnapHelper;->getHorizontalHelper(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)Landroidx/recyclerview/widget/OrientationHelper;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Landroidx/recyclerview/widget/PagerSnapHelper;->findCenterView(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;Landroidx/recyclerview/widget/OrientationHelper;)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final getHorizontalHelper(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)Landroidx/recyclerview/widget/OrientationHelper;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "layoutManager"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/PagerSnapHelper;->mHorizontalHelper:Landroidx/recyclerview/widget/OrientationHelper;

    if-eqz v0, :cond_0

    iget-object v0, v0, Landroidx/recyclerview/widget/OrientationHelper;->mLayoutManager:Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    if-eq v0, p1, :cond_1

    .line 2
    :cond_0
    new-instance v0, Landroidx/recyclerview/widget/OrientationHelper$1;

    invoke-direct {v0, p1}, Landroidx/recyclerview/widget/OrientationHelper$1;-><init>(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 3
    iput-object v0, p0, Landroidx/recyclerview/widget/PagerSnapHelper;->mHorizontalHelper:Landroidx/recyclerview/widget/OrientationHelper;

    .line 4
    :cond_1
    iget-object p0, p0, Landroidx/recyclerview/widget/PagerSnapHelper;->mHorizontalHelper:Landroidx/recyclerview/widget/OrientationHelper;

    return-object p0
.end method

.method public final getVerticalHelper(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)Landroidx/recyclerview/widget/OrientationHelper;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "layoutManager"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/PagerSnapHelper;->mVerticalHelper:Landroidx/recyclerview/widget/OrientationHelper;

    if-eqz v0, :cond_0

    iget-object v0, v0, Landroidx/recyclerview/widget/OrientationHelper;->mLayoutManager:Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    if-eq v0, p1, :cond_1

    .line 2
    :cond_0
    new-instance v0, Landroidx/recyclerview/widget/OrientationHelper$2;

    invoke-direct {v0, p1}, Landroidx/recyclerview/widget/OrientationHelper$2;-><init>(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 3
    iput-object v0, p0, Landroidx/recyclerview/widget/PagerSnapHelper;->mVerticalHelper:Landroidx/recyclerview/widget/OrientationHelper;

    .line 4
    :cond_1
    iget-object p0, p0, Landroidx/recyclerview/widget/PagerSnapHelper;->mVerticalHelper:Landroidx/recyclerview/widget/OrientationHelper;

    return-object p0
.end method
