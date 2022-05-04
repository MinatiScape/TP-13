.class public Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Anim"
.end annotation


# instance fields
.field public duration:J

.field public easing:I

.field public interruptible:Z

.field public listener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;

.field public origin:I

.field public sCenterEnd:Landroid/graphics/PointF;

.field public sCenterEndRequested:Landroid/graphics/PointF;

.field public sCenterStart:Landroid/graphics/PointF;

.field public scaleEnd:F

.field public scaleStart:F

.field public time:J

.field public vFocusEnd:Landroid/graphics/PointF;

.field public vFocusStart:Landroid/graphics/PointF;


# direct methods
.method public constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x1f4

    .line 2
    iput-wide v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->duration:J

    const/4 p1, 0x1

    .line 3
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->interruptible:Z

    const/4 v0, 0x2

    .line 4
    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->easing:I

    .line 5
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->origin:I

    .line 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->time:J

    return-void
.end method
