.class public Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setGestureDetector(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

.field public final synthetic val$context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    iput-object p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 2
    iget-boolean v1, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->zoomEnabled:Z

    if-eqz v1, :cond_1

    .line 3
    iget-boolean v1, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    if-eqz v1, :cond_1

    .line 4
    iget-object v1, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-eqz v1, :cond_1

    .line 5
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->val$context:Landroid/content/Context;

    .line 6
    invoke-virtual {v0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setGestureDetector(Landroid/content/Context;)V

    .line 7
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 8
    iget-boolean v1, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleEnabled:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    .line 9
    new-instance v1, Landroid/graphics/PointF;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-direct {v1, v3, v4}, Landroid/graphics/PointF;-><init>(FF)V

    .line 10
    iput-object v1, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    .line 11
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    new-instance v1, Landroid/graphics/PointF;

    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 12
    iget-object v3, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    .line 13
    iget v4, v3, Landroid/graphics/PointF;->x:F

    iget v3, v3, Landroid/graphics/PointF;->y:F

    invoke-direct {v1, v4, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 14
    iput-object v1, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    .line 15
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 16
    iget v1, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 17
    iput v1, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    .line 18
    iput-boolean v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isQuickScaling:Z

    .line 19
    iput-boolean v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    const/high16 v1, -0x40800000    # -1.0f

    .line 20
    iput v1, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastDistance:F

    .line 21
    iget-object v1, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    .line 22
    invoke-virtual {v0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceCoord(Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v1

    .line 23
    iput-object v1, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleSCenter:Landroid/graphics/PointF;

    .line 24
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    new-instance v1, Landroid/graphics/PointF;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-direct {v1, v2, p1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 25
    iput-object v1, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleVStart:Landroid/graphics/PointF;

    .line 26
    iget-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    new-instance v0, Landroid/graphics/PointF;

    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 27
    iget-object v1, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleSCenter:Landroid/graphics/PointF;

    .line 28
    iget v2, v1, Landroid/graphics/PointF;->x:F

    iget v1, v1, Landroid/graphics/PointF;->y:F

    invoke-direct {v0, v2, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 29
    iput-object v0, p1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleVLastPoint:Landroid/graphics/PointF;

    .line 30
    iget-object p0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    const/4 p1, 0x0

    .line 31
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleMoved:Z

    return p1

    .line 32
    :cond_0
    new-instance p0, Landroid/graphics/PointF;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-direct {p0, v1, v3}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-virtual {v0, p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceCoord(Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object p0

    new-instance v1, Landroid/graphics/PointF;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-direct {v1, v3, p1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 33
    invoke-virtual {v0, p0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoom(Landroid/graphics/PointF;Landroid/graphics/PointF;)V

    return v2

    .line 34
    :cond_1
    invoke-virtual {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onDoubleTapEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 2
    iget-boolean v1, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    if-eqz v1, :cond_3

    .line 3
    iget-boolean v1, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    if-eqz v1, :cond_3

    .line 4
    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-eqz v0, :cond_3

    if-eqz p1, :cond_3

    if-eqz p2, :cond_3

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const/high16 v1, 0x42480000    # 50.0f

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    sub-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_3

    :cond_0
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const/high16 v1, 0x43fa0000    # 500.0f

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_1

    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_3

    :cond_1
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 6
    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    if-nez v0, :cond_3

    .line 7
    new-instance p1, Landroid/graphics/PointF;

    iget-object p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 8
    iget-object p2, p2, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    .line 9
    iget v0, p2, Landroid/graphics/PointF;->x:F

    const/high16 v1, 0x3e800000    # 0.25f

    mul-float/2addr p3, v1

    add-float/2addr p3, v0

    iget p2, p2, Landroid/graphics/PointF;->y:F

    mul-float/2addr p4, v1

    add-float/2addr p4, p2

    invoke-direct {p1, p3, p4}, Landroid/graphics/PointF;-><init>(FF)V

    .line 10
    iget-object p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result p2

    div-int/lit8 p2, p2, 0x2

    int-to-float p2, p2

    iget p3, p1, Landroid/graphics/PointF;->x:F

    sub-float/2addr p2, p3

    iget-object p3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 11
    iget p4, p3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    div-float/2addr p2, p4

    .line 12
    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    move-result p3

    div-int/lit8 p3, p3, 0x2

    int-to-float p3, p3

    iget p1, p1, Landroid/graphics/PointF;->y:F

    sub-float/2addr p3, p1

    iget-object p0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 13
    iget p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    div-float/2addr p3, p1

    .line 14
    new-instance p1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;

    new-instance p4, Landroid/graphics/PointF;

    invoke-direct {p4, p2, p3}, Landroid/graphics/PointF;-><init>(FF)V

    const/4 p2, 0x0

    invoke-direct {p1, p0, p4, p2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    .line 15
    sget-object p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_EASING_STYLES:Ljava/util/List;

    const/4 p2, 0x1

    .line 16
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-interface {p0, p3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    .line 17
    iput p2, p1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->easing:I

    const/4 p0, 0x0

    .line 18
    iput-boolean p0, p1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->panLimited:Z

    const/4 p0, 0x3

    .line 19
    iput p0, p1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->origin:I

    .line 20
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->start()V

    return p2

    .line 21
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Unknown easing type: 1"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 22
    :cond_3
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result p0

    return p0
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    const/4 p0, 0x1

    return p0
.end method
