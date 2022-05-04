.class public final Landroidx/dynamicanimation/animation/SpringAnimation;
.super Landroidx/dynamicanimation/animation/DynamicAnimation;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/dynamicanimation/animation/DynamicAnimation<",
        "Landroidx/dynamicanimation/animation/SpringAnimation;",
        ">;"
    }
.end annotation


# instance fields
.field public mPendingPosition:F

.field public mSpring:Landroidx/dynamicanimation/animation/SpringForce;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/FloatPropertyCompat;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "object",
            "property"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(TK;",
            "Landroidx/dynamicanimation/animation/FloatPropertyCompat<",
            "TK;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/dynamicanimation/animation/DynamicAnimation;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/FloatPropertyCompat;)V

    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Landroidx/dynamicanimation/animation/SpringAnimation;->mSpring:Landroidx/dynamicanimation/animation/SpringForce;

    const p1, 0x7f7fffff    # Float.MAX_VALUE

    .line 3
    iput p1, p0, Landroidx/dynamicanimation/animation/SpringAnimation;->mPendingPosition:F

    return-void
.end method


# virtual methods
.method public animateToFinalPosition(F)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "finalPosition"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mRunning:Z

    if-eqz v0, :cond_0

    .line 2
    iput p1, p0, Landroidx/dynamicanimation/animation/SpringAnimation;->mPendingPosition:F

    goto :goto_0

    .line 3
    :cond_0
    iget-object v0, p0, Landroidx/dynamicanimation/animation/SpringAnimation;->mSpring:Landroidx/dynamicanimation/animation/SpringForce;

    if-nez v0, :cond_1

    .line 4
    new-instance v0, Landroidx/dynamicanimation/animation/SpringForce;

    invoke-direct {v0, p1}, Landroidx/dynamicanimation/animation/SpringForce;-><init>(F)V

    iput-object v0, p0, Landroidx/dynamicanimation/animation/SpringAnimation;->mSpring:Landroidx/dynamicanimation/animation/SpringForce;

    .line 5
    :cond_1
    iget-object v0, p0, Landroidx/dynamicanimation/animation/SpringAnimation;->mSpring:Landroidx/dynamicanimation/animation/SpringForce;

    float-to-double v1, p1

    .line 6
    iput-wide v1, v0, Landroidx/dynamicanimation/animation/SpringForce;->mFinalPosition:D

    .line 7
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/SpringAnimation;->start()V

    :goto_0
    return-void
.end method

.method public start()V
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/dynamicanimation/animation/SpringAnimation;->mSpring:Landroidx/dynamicanimation/animation/SpringForce;

    if-eqz v0, :cond_7

    .line 2
    iget-wide v1, v0, Landroidx/dynamicanimation/animation/SpringForce;->mFinalPosition:D

    double-to-float v1, v1

    float-to-double v1, v1

    .line 3
    iget v3, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mMaxValue:F

    float-to-double v3, v3

    cmpl-double v3, v1, v3

    if-gtz v3, :cond_6

    .line 4
    iget v3, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mMinValue:F

    float-to-double v3, v3

    cmpg-double v1, v1, v3

    if-ltz v1, :cond_5

    .line 5
    iget v1, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mMinVisibleChange:F

    const/high16 v2, 0x3f400000    # 0.75f

    mul-float/2addr v1, v2

    float-to-double v1, v1

    .line 6
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    invoke-static {v1, v2}, Ljava/lang/Math;->abs(D)D

    move-result-wide v1

    iput-wide v1, v0, Landroidx/dynamicanimation/animation/SpringForce;->mValueThreshold:D

    const-wide v3, 0x404f400000000000L    # 62.5

    mul-double/2addr v1, v3

    .line 8
    iput-wide v1, v0, Landroidx/dynamicanimation/animation/SpringForce;->mVelocityThreshold:D

    .line 9
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/DynamicAnimation;->getAnimationHandler()Landroidx/dynamicanimation/animation/AnimationHandler;

    move-result-object v0

    .line 10
    iget-object v0, v0, Landroidx/dynamicanimation/animation/AnimationHandler;->mScheduler:Landroidx/dynamicanimation/animation/AnimationHandler$FrameCallbackScheduler;

    invoke-interface {v0}, Landroidx/dynamicanimation/animation/AnimationHandler$FrameCallbackScheduler;->isCurrentThread()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 11
    iget-boolean v0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mRunning:Z

    if-nez v0, :cond_3

    if-nez v0, :cond_3

    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mRunning:Z

    .line 13
    iget-boolean v0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mStartValueIsSet:Z

    if-nez v0, :cond_0

    .line 14
    iget-object v0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mProperty:Landroidx/dynamicanimation/animation/FloatPropertyCompat;

    iget-object v1, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mTarget:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Landroidx/dynamicanimation/animation/FloatPropertyCompat;->getValue(Ljava/lang/Object;)F

    move-result v0

    .line 15
    iput v0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mValue:F

    .line 16
    :cond_0
    iget v0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mValue:F

    iget v1, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mMaxValue:F

    cmpl-float v1, v0, v1

    if-gtz v1, :cond_2

    iget v1, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mMinValue:F

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_2

    .line 17
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/DynamicAnimation;->getAnimationHandler()Landroidx/dynamicanimation/animation/AnimationHandler;

    move-result-object v0

    .line 18
    iget-object v1, v0, Landroidx/dynamicanimation/animation/AnimationHandler;->mAnimationCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 19
    iget-object v1, v0, Landroidx/dynamicanimation/animation/AnimationHandler;->mScheduler:Landroidx/dynamicanimation/animation/AnimationHandler$FrameCallbackScheduler;

    iget-object v2, v0, Landroidx/dynamicanimation/animation/AnimationHandler;->mRunnable:Ljava/lang/Runnable;

    invoke-interface {v1, v2}, Landroidx/dynamicanimation/animation/AnimationHandler$FrameCallbackScheduler;->postFrameCallback(Ljava/lang/Runnable;)V

    .line 20
    :cond_1
    iget-object v1, v0, Landroidx/dynamicanimation/animation/AnimationHandler;->mAnimationCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 21
    iget-object v0, v0, Landroidx/dynamicanimation/animation/AnimationHandler;->mAnimationCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 22
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Starting value need to be in between min value and max value"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3
    :goto_0
    return-void

    .line 23
    :cond_4
    new-instance p0, Landroid/util/AndroidRuntimeException;

    const-string v0, "Animations may only be started on the same thread as the animation handler"

    invoke-direct {p0, v0}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 24
    :cond_5
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Final position of the spring cannot be less than the min value."

    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 25
    :cond_6
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Final position of the spring cannot be greater than the max value."

    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 26
    :cond_7
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Incomplete SpringAnimation: Either final position or a spring force needs to be set."

    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
