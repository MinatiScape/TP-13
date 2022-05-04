.class public final Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "AnimationBuilder"
.end annotation


# instance fields
.field public duration:J

.field public easing:I

.field public interruptible:Z

.field public origin:I

.field public panLimited:Z

.field public final targetSCenter:Landroid/graphics/PointF;

.field public final targetScale:F

.field public final synthetic this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

.field public final vFocus:Landroid/graphics/PointF;


# direct methods
.method public constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FLandroid/graphics/PointF;Landroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V
    .locals 2

    .line 20
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x1f4

    .line 21
    iput-wide v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->duration:J

    const/4 p1, 0x2

    .line 22
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->easing:I

    const/4 p1, 0x1

    .line 23
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->origin:I

    .line 24
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->interruptible:Z

    .line 25
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->panLimited:Z

    .line 26
    iput p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetScale:F

    .line 27
    iput-object p3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetSCenter:Landroid/graphics/PointF;

    .line 28
    iput-object p4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->vFocus:Landroid/graphics/PointF;

    return-void
.end method

.method public constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FLandroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V
    .locals 2

    .line 11
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x1f4

    .line 12
    iput-wide v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->duration:J

    const/4 p1, 0x2

    .line 13
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->easing:I

    const/4 p1, 0x1

    .line 14
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->origin:I

    .line 15
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->interruptible:Z

    .line 16
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->panLimited:Z

    .line 17
    iput p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetScale:F

    .line 18
    iput-object p3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetSCenter:Landroid/graphics/PointF;

    const/4 p1, 0x0

    .line 19
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->vFocus:Landroid/graphics/PointF;

    return-void
.end method

.method public constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x1f4

    .line 2
    iput-wide v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->duration:J

    const/4 p3, 0x2

    .line 3
    iput p3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->easing:I

    const/4 p3, 0x1

    .line 4
    iput p3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->origin:I

    .line 5
    iput-boolean p3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->interruptible:Z

    .line 6
    iput-boolean p3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->panLimited:Z

    .line 7
    iget p1, p1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 8
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetScale:F

    .line 9
    iput-object p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetSCenter:Landroid/graphics/PointF;

    const/4 p1, 0x0

    .line 10
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->vFocus:Landroid/graphics/PointF;

    return-void
.end method


# virtual methods
.method public start()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 2
    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    if-eqz v0, :cond_0

    .line 3
    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->listener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;

    if-eqz v0, :cond_0

    .line 4
    :try_start_0
    invoke-interface {v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;->onInterruptedByNewAnim()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 5
    sget-object v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_ORIENTATIONS:Ljava/util/List;

    const-string v1, "SubsamplingScaleImageView"

    const-string v2, "Error thrown by animation listener"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 6
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v2}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v2}, Landroid/view/View;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v1, v0

    .line 7
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v3}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    sub-int/2addr v2, v3

    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v3}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    sub-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v2, v0

    .line 8
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    iget v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetScale:F

    .line 9
    invoke-virtual {v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale()F

    move-result v4

    invoke-static {v4, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 10
    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxScale:F

    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 11
    iget-boolean v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->panLimited:Z

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetSCenter:Landroid/graphics/PointF;

    iget v5, v4, Landroid/graphics/PointF;->x:F

    iget v4, v4, Landroid/graphics/PointF;->y:F

    new-instance v6, Landroid/graphics/PointF;

    invoke-direct {v6}, Landroid/graphics/PointF;-><init>()V

    .line 12
    invoke-virtual {v3, v5, v4, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateForSCenter(FFF)Landroid/graphics/PointF;

    move-result-object v4

    .line 13
    invoke-virtual {v3}, Landroid/view/View;->getPaddingLeft()I

    move-result v5

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v7

    invoke-virtual {v3}, Landroid/view/View;->getPaddingRight()I

    move-result v8

    sub-int/2addr v7, v8

    invoke-virtual {v3}, Landroid/view/View;->getPaddingLeft()I

    move-result v8

    sub-int/2addr v7, v8

    div-int/lit8 v7, v7, 0x2

    add-int/2addr v7, v5

    .line 14
    invoke-virtual {v3}, Landroid/view/View;->getPaddingTop()I

    move-result v5

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v8

    invoke-virtual {v3}, Landroid/view/View;->getPaddingBottom()I

    move-result v9

    sub-int/2addr v8, v9

    invoke-virtual {v3}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    sub-int/2addr v8, v3

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v8, v5

    int-to-float v3, v7

    .line 15
    iget v5, v4, Landroid/graphics/PointF;->x:F

    sub-float/2addr v3, v5

    div-float/2addr v3, v0

    int-to-float v5, v8

    .line 16
    iget v4, v4, Landroid/graphics/PointF;->y:F

    sub-float/2addr v5, v4

    div-float/2addr v5, v0

    .line 17
    invoke-virtual {v6, v3, v5}, Landroid/graphics/PointF;->set(FF)V

    goto :goto_1

    .line 18
    :cond_1
    iget-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetSCenter:Landroid/graphics/PointF;

    .line 19
    :goto_1
    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    new-instance v4, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    .line 20
    iput-object v4, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 21
    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 22
    iget-object v4, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 23
    iget v3, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 24
    iput v3, v4, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->scaleStart:F

    .line 25
    iput v0, v4, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->scaleEnd:F

    .line 26
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 27
    iput-wide v7, v4, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->time:J

    .line 28
    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 29
    iget-object v4, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 30
    iput-object v6, v4, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterEndRequested:Landroid/graphics/PointF;

    .line 31
    invoke-virtual {v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getCenter()Landroid/graphics/PointF;

    move-result-object v3

    .line 32
    iput-object v3, v4, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterStart:Landroid/graphics/PointF;

    .line 33
    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 34
    iget-object v4, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 35
    iput-object v6, v4, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterEnd:Landroid/graphics/PointF;

    .line 36
    invoke-virtual {v3, v6}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewCoord(Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v3

    .line 37
    iput-object v3, v4, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusStart:Landroid/graphics/PointF;

    .line 38
    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 39
    iget-object v3, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 40
    new-instance v4, Landroid/graphics/PointF;

    int-to-float v1, v1

    int-to-float v2, v2

    invoke-direct {v4, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 41
    iput-object v4, v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusEnd:Landroid/graphics/PointF;

    .line 42
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 43
    iget-object v1, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 44
    iget-wide v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->duration:J

    .line 45
    iput-wide v2, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->duration:J

    .line 46
    iget-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->interruptible:Z

    .line 47
    iput-boolean v2, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->interruptible:Z

    .line 48
    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->easing:I

    .line 49
    iput v2, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->easing:I

    .line 50
    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->origin:I

    .line 51
    iput v2, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->origin:I

    .line 52
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 53
    iput-wide v2, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->time:J

    .line 54
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 55
    iget-object v1, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 56
    iput-object v5, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->listener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;

    .line 57
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->vFocus:Landroid/graphics/PointF;

    if-eqz v2, :cond_2

    .line 58
    iget v3, v2, Landroid/graphics/PointF;->x:F

    .line 59
    iget-object v1, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterStart:Landroid/graphics/PointF;

    .line 60
    iget v4, v1, Landroid/graphics/PointF;->x:F

    mul-float/2addr v4, v0

    sub-float/2addr v3, v4

    .line 61
    iget v2, v2, Landroid/graphics/PointF;->y:F

    iget v1, v1, Landroid/graphics/PointF;->y:F

    mul-float/2addr v1, v0

    sub-float/2addr v2, v1

    .line 62
    new-instance v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    new-instance v4, Landroid/graphics/PointF;

    invoke-direct {v4, v3, v2}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-direct {v1, v0, v4, v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;-><init>(FLandroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    .line 63
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    const/4 v5, 0x1

    .line 64
    invoke-virtual {v0, v5, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(ZLcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)V

    .line 65
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 66
    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 67
    new-instance v1, Landroid/graphics/PointF;

    iget-object v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->vFocus:Landroid/graphics/PointF;

    iget v6, v5, Landroid/graphics/PointF;->x:F

    .line 68
    iget v7, v4, Landroid/graphics/PointF;->x:F

    sub-float/2addr v7, v3

    add-float/2addr v7, v6

    iget v3, v5, Landroid/graphics/PointF;->y:F

    .line 69
    iget v4, v4, Landroid/graphics/PointF;->y:F

    sub-float/2addr v4, v2

    add-float/2addr v4, v3

    invoke-direct {v1, v7, v4}, Landroid/graphics/PointF;-><init>(FF)V

    .line 70
    iput-object v1, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusEnd:Landroid/graphics/PointF;

    .line 71
    :cond_2
    iget-object p0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method
