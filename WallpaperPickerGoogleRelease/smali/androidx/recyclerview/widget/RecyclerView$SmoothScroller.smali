.class public abstract Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/RecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "SmoothScroller"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$ScrollVectorProvider;,
        Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$Action;
    }
.end annotation


# instance fields
.field public mLayoutManager:Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

.field public mPendingInitialRun:Z

.field public mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

.field public final mRecyclingAction:Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$Action;

.field public mRunning:Z

.field public mStarted:Z

.field public mTargetPosition:I

.field public mTargetView:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mTargetPosition:I

    .line 3
    new-instance v0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$Action;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$Action;-><init>(II)V

    iput-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mRecyclingAction:Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$Action;

    return-void
.end method


# virtual methods
.method public computeScrollVectorForPosition(I)Landroid/graphics/PointF;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "targetPosition"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mLayoutManager:Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 2
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$ScrollVectorProvider;

    if-eqz v0, :cond_0

    .line 3
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$ScrollVectorProvider;

    .line 4
    invoke-interface {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$ScrollVectorProvider;->computeScrollVectorForPosition(I)Landroid/graphics/PointF;

    move-result-object p0

    return-object p0

    :cond_0
    const-string p0, "You should override computeScrollVectorForPosition when the LayoutManager does not implement "

    .line 5
    invoke-static {p0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-class p1, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$ScrollVectorProvider;

    .line 6
    invoke-virtual {p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "RecyclerView"

    .line 7
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return-object p0
.end method

.method public onAnimation(II)V
    .locals 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dx",
            "dy"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    iget v1, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mTargetPosition:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    if-nez v0, :cond_1

    .line 3
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->stop()V

    .line 4
    :cond_1
    iget-boolean v1, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mPendingInitialRun:Z

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz v1, :cond_3

    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mTargetView:Landroid/view/View;

    if-nez v1, :cond_3

    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mLayoutManager:Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    if-eqz v1, :cond_3

    .line 5
    iget v1, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mTargetPosition:I

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->computeScrollVectorForPosition(I)Landroid/graphics/PointF;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 6
    iget v4, v1, Landroid/graphics/PointF;->x:F

    cmpl-float v5, v4, v3

    if-nez v5, :cond_2

    iget v5, v1, Landroid/graphics/PointF;->y:F

    cmpl-float v5, v5, v3

    if-eqz v5, :cond_3

    .line 7
    :cond_2
    invoke-static {v4}, Ljava/lang/Math;->signum(F)F

    move-result v4

    float-to-int v4, v4

    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 8
    invoke-static {v1}, Ljava/lang/Math;->signum(F)F

    move-result v1

    float-to-int v1, v1

    .line 9
    invoke-virtual {v0, v4, v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->scrollStep(II[I)V

    :cond_3
    const/4 v1, 0x0

    .line 10
    iput-boolean v1, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mPendingInitialRun:Z

    .line 11
    iget-object v4, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mTargetView:Landroid/view/View;

    if-eqz v4, :cond_5

    .line 12
    iget-object v5, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v5, v4}, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I

    move-result v4

    .line 13
    iget v5, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mTargetPosition:I

    if-ne v4, v5, :cond_4

    .line 14
    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mTargetView:Landroid/view/View;

    iget-object v4, v0, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    iget-object v5, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mRecyclingAction:Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$Action;

    invoke-virtual {p0, v2, v4, v5}, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->onTargetFound(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$State;Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$Action;)V

    .line 15
    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mRecyclingAction:Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$Action;

    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$Action;->runIfNecessary(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 16
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->stop()V

    goto :goto_0

    :cond_4
    const-string v4, "RecyclerView"

    const-string v5, "Passed over target position while smooth scrolling."

    .line 17
    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    iput-object v2, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mTargetView:Landroid/view/View;

    .line 19
    :cond_5
    :goto_0
    iget-boolean v2, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mRunning:Z

    if-eqz v2, :cond_d

    .line 20
    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mRecyclingAction:Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$Action;

    move-object v4, p0

    check-cast v4, Landroidx/recyclerview/widget/LinearSmoothScroller;

    .line 21
    iget-object v5, v4, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v5, v5, Landroidx/recyclerview/widget/RecyclerView;->mLayout:Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    invoke-virtual {v5}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result v5

    if-nez v5, :cond_6

    .line 22
    invoke-virtual {v4}, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->stop()V

    goto/16 :goto_2

    .line 23
    :cond_6
    iget v5, v4, Landroidx/recyclerview/widget/LinearSmoothScroller;->mInterimTargetDx:I

    sub-int p1, v5, p1

    mul-int/2addr v5, p1

    if-gtz v5, :cond_7

    move p1, v1

    :cond_7
    iput p1, v4, Landroidx/recyclerview/widget/LinearSmoothScroller;->mInterimTargetDx:I

    .line 24
    iget v5, v4, Landroidx/recyclerview/widget/LinearSmoothScroller;->mInterimTargetDy:I

    sub-int p2, v5, p2

    mul-int/2addr v5, p2

    if-gtz v5, :cond_8

    move p2, v1

    :cond_8
    iput p2, v4, Landroidx/recyclerview/widget/LinearSmoothScroller;->mInterimTargetDy:I

    if-nez p1, :cond_b

    if-nez p2, :cond_b

    .line 25
    iget p1, v4, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mTargetPosition:I

    .line 26
    invoke-virtual {v4, p1}, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->computeScrollVectorForPosition(I)Landroid/graphics/PointF;

    move-result-object p1

    if-eqz p1, :cond_a

    .line 27
    iget p2, p1, Landroid/graphics/PointF;->x:F

    cmpl-float v5, p2, v3

    if-nez v5, :cond_9

    iget v5, p1, Landroid/graphics/PointF;->y:F

    cmpl-float v3, v5, v3

    if-nez v3, :cond_9

    goto :goto_1

    :cond_9
    mul-float/2addr p2, p2

    .line 28
    iget v3, p1, Landroid/graphics/PointF;->y:F

    mul-float/2addr v3, v3

    add-float/2addr v3, p2

    float-to-double v5, v3

    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v5

    double-to-float p2, v5

    .line 29
    iget v3, p1, Landroid/graphics/PointF;->x:F

    div-float/2addr v3, p2

    iput v3, p1, Landroid/graphics/PointF;->x:F

    .line 30
    iget v5, p1, Landroid/graphics/PointF;->y:F

    div-float/2addr v5, p2

    iput v5, p1, Landroid/graphics/PointF;->y:F

    .line 31
    iput-object p1, v4, Landroidx/recyclerview/widget/LinearSmoothScroller;->mTargetVector:Landroid/graphics/PointF;

    const p1, 0x461c4000    # 10000.0f

    mul-float/2addr v3, p1

    float-to-int p2, v3

    .line 32
    iput p2, v4, Landroidx/recyclerview/widget/LinearSmoothScroller;->mInterimTargetDx:I

    mul-float/2addr v5, p1

    float-to-int p1, v5

    .line 33
    iput p1, v4, Landroidx/recyclerview/widget/LinearSmoothScroller;->mInterimTargetDy:I

    const/16 p1, 0x2710

    .line 34
    invoke-virtual {v4, p1}, Landroidx/recyclerview/widget/LinearSmoothScroller;->calculateTimeForScrolling(I)I

    move-result p1

    .line 35
    iget p2, v4, Landroidx/recyclerview/widget/LinearSmoothScroller;->mInterimTargetDx:I

    int-to-float p2, p2

    const v3, 0x3f99999a    # 1.2f

    mul-float/2addr p2, v3

    float-to-int p2, p2

    iget v5, v4, Landroidx/recyclerview/widget/LinearSmoothScroller;->mInterimTargetDy:I

    int-to-float v5, v5

    mul-float/2addr v5, v3

    float-to-int v5, v5

    int-to-float p1, p1

    mul-float/2addr p1, v3

    float-to-int p1, p1

    iget-object v3, v4, Landroidx/recyclerview/widget/LinearSmoothScroller;->mLinearInterpolator:Landroid/view/animation/LinearInterpolator;

    invoke-virtual {v2, p2, v5, p1, v3}, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$Action;->update(IIILandroid/view/animation/Interpolator;)V

    goto :goto_2

    .line 36
    :cond_a
    :goto_1
    iget p1, v4, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mTargetPosition:I

    .line 37
    iput p1, v2, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$Action;->mJumpToPosition:I

    .line 38
    invoke-virtual {v4}, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->stop()V

    .line 39
    :cond_b
    :goto_2
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mRecyclingAction:Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$Action;

    .line 40
    iget p2, p1, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$Action;->mJumpToPosition:I

    const/4 v2, 0x1

    if-ltz p2, :cond_c

    move v1, v2

    .line 41
    :cond_c
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$Action;->runIfNecessary(Landroidx/recyclerview/widget/RecyclerView;)V

    if-eqz v1, :cond_d

    .line 42
    iget-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mRunning:Z

    if-eqz p1, :cond_d

    .line 43
    iput-boolean v2, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mPendingInitialRun:Z

    .line 44
    iget-object p0, v0, Landroidx/recyclerview/widget/RecyclerView;->mViewFlinger:Landroidx/recyclerview/widget/RecyclerView$ViewFlinger;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$ViewFlinger;->postOnAnimation()V

    :cond_d
    return-void
.end method

.method public abstract onTargetFound(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$State;Landroidx/recyclerview/widget/RecyclerView$SmoothScroller$Action;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "targetView",
            "state",
            "action"
        }
    .end annotation
.end method

.method public final stop()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mRunning:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mRunning:Z

    .line 3
    move-object v1, p0

    check-cast v1, Landroidx/recyclerview/widget/LinearSmoothScroller;

    .line 4
    iput v0, v1, Landroidx/recyclerview/widget/LinearSmoothScroller;->mInterimTargetDy:I

    iput v0, v1, Landroidx/recyclerview/widget/LinearSmoothScroller;->mInterimTargetDx:I

    const/4 v2, 0x0

    .line 5
    iput-object v2, v1, Landroidx/recyclerview/widget/LinearSmoothScroller;->mTargetVector:Landroid/graphics/PointF;

    .line 6
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    const/4 v3, -0x1

    iput v3, v1, Landroidx/recyclerview/widget/RecyclerView$State;->mTargetPosition:I

    .line 7
    iput-object v2, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mTargetView:Landroid/view/View;

    .line 8
    iput v3, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mTargetPosition:I

    .line 9
    iput-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mPendingInitialRun:Z

    .line 10
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mLayoutManager:Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 11
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->mSmoothScroller:Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;

    if-ne v1, p0, :cond_1

    .line 12
    iput-object v2, v0, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->mSmoothScroller:Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;

    .line 13
    :cond_1
    iput-object v2, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mLayoutManager:Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 14
    iput-object v2, p0, Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    return-void
.end method
