.class public abstract Landroidx/dynamicanimation/animation/DynamicAnimation;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/dynamicanimation/animation/AnimationHandler$AnimationFrameCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/dynamicanimation/animation/DynamicAnimation$OnAnimationUpdateListener;,
        Landroidx/dynamicanimation/animation/DynamicAnimation$OnAnimationEndListener;,
        Landroidx/dynamicanimation/animation/DynamicAnimation$MassState;,
        Landroidx/dynamicanimation/animation/DynamicAnimation$ViewProperty;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroidx/dynamicanimation/animation/DynamicAnimation<",
        "TT;>;>",
        "Ljava/lang/Object;",
        "Landroidx/dynamicanimation/animation/AnimationHandler$AnimationFrameCallback;"
    }
.end annotation


# static fields
.field public static final ALPHA:Landroidx/dynamicanimation/animation/DynamicAnimation$ViewProperty;

.field public static final ROTATION:Landroidx/dynamicanimation/animation/DynamicAnimation$ViewProperty;

.field public static final ROTATION_X:Landroidx/dynamicanimation/animation/DynamicAnimation$ViewProperty;

.field public static final ROTATION_Y:Landroidx/dynamicanimation/animation/DynamicAnimation$ViewProperty;

.field public static final SCALE_X:Landroidx/dynamicanimation/animation/DynamicAnimation$ViewProperty;

.field public static final SCALE_Y:Landroidx/dynamicanimation/animation/DynamicAnimation$ViewProperty;


# instance fields
.field public mAnimationHandler:Landroidx/dynamicanimation/animation/AnimationHandler;

.field public final mEndListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/dynamicanimation/animation/DynamicAnimation$OnAnimationEndListener;",
            ">;"
        }
    .end annotation
.end field

.field public mLastFrameTime:J

.field public mMaxValue:F

.field public mMinValue:F

.field public mMinVisibleChange:F

.field public final mProperty:Landroidx/dynamicanimation/animation/FloatPropertyCompat;

.field public mRunning:Z

.field public mStartValueIsSet:Z

.field public final mTarget:Ljava/lang/Object;

.field public final mUpdateListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/dynamicanimation/animation/DynamicAnimation$OnAnimationUpdateListener;",
            ">;"
        }
    .end annotation
.end field

.field public mValue:F

.field public mVelocity:F


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroidx/dynamicanimation/animation/DynamicAnimation$1;

    const-string v1, "translationX"

    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/DynamicAnimation$1;-><init>(Ljava/lang/String;)V

    .line 2
    new-instance v0, Landroidx/dynamicanimation/animation/DynamicAnimation$2;

    const-string v1, "translationY"

    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/DynamicAnimation$2;-><init>(Ljava/lang/String;)V

    .line 3
    new-instance v0, Landroidx/dynamicanimation/animation/DynamicAnimation$3;

    const-string v1, "translationZ"

    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/DynamicAnimation$3;-><init>(Ljava/lang/String;)V

    .line 4
    new-instance v0, Landroidx/dynamicanimation/animation/DynamicAnimation$4;

    const-string v1, "scaleX"

    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/DynamicAnimation$4;-><init>(Ljava/lang/String;)V

    sput-object v0, Landroidx/dynamicanimation/animation/DynamicAnimation;->SCALE_X:Landroidx/dynamicanimation/animation/DynamicAnimation$ViewProperty;

    .line 5
    new-instance v0, Landroidx/dynamicanimation/animation/DynamicAnimation$5;

    const-string v1, "scaleY"

    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/DynamicAnimation$5;-><init>(Ljava/lang/String;)V

    sput-object v0, Landroidx/dynamicanimation/animation/DynamicAnimation;->SCALE_Y:Landroidx/dynamicanimation/animation/DynamicAnimation$ViewProperty;

    .line 6
    new-instance v0, Landroidx/dynamicanimation/animation/DynamicAnimation$6;

    const-string v1, "rotation"

    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/DynamicAnimation$6;-><init>(Ljava/lang/String;)V

    sput-object v0, Landroidx/dynamicanimation/animation/DynamicAnimation;->ROTATION:Landroidx/dynamicanimation/animation/DynamicAnimation$ViewProperty;

    .line 7
    new-instance v0, Landroidx/dynamicanimation/animation/DynamicAnimation$7;

    const-string v1, "rotationX"

    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/DynamicAnimation$7;-><init>(Ljava/lang/String;)V

    sput-object v0, Landroidx/dynamicanimation/animation/DynamicAnimation;->ROTATION_X:Landroidx/dynamicanimation/animation/DynamicAnimation$ViewProperty;

    .line 8
    new-instance v0, Landroidx/dynamicanimation/animation/DynamicAnimation$8;

    const-string v1, "rotationY"

    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/DynamicAnimation$8;-><init>(Ljava/lang/String;)V

    sput-object v0, Landroidx/dynamicanimation/animation/DynamicAnimation;->ROTATION_Y:Landroidx/dynamicanimation/animation/DynamicAnimation$ViewProperty;

    .line 9
    new-instance v0, Landroidx/dynamicanimation/animation/DynamicAnimation$9;

    const-string v1, "x"

    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/DynamicAnimation$9;-><init>(Ljava/lang/String;)V

    .line 10
    new-instance v0, Landroidx/dynamicanimation/animation/DynamicAnimation$10;

    const-string v1, "y"

    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/DynamicAnimation$10;-><init>(Ljava/lang/String;)V

    .line 11
    new-instance v0, Landroidx/dynamicanimation/animation/DynamicAnimation$11;

    const-string v1, "z"

    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/DynamicAnimation$11;-><init>(Ljava/lang/String;)V

    .line 12
    new-instance v0, Landroidx/dynamicanimation/animation/DynamicAnimation$12;

    const-string v1, "alpha"

    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/DynamicAnimation$12;-><init>(Ljava/lang/String;)V

    sput-object v0, Landroidx/dynamicanimation/animation/DynamicAnimation;->ALPHA:Landroidx/dynamicanimation/animation/DynamicAnimation$ViewProperty;

    .line 13
    new-instance v0, Landroidx/dynamicanimation/animation/DynamicAnimation$13;

    const-string v1, "scrollX"

    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/DynamicAnimation$13;-><init>(Ljava/lang/String;)V

    .line 14
    new-instance v0, Landroidx/dynamicanimation/animation/DynamicAnimation$14;

    const-string v1, "scrollY"

    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/DynamicAnimation$14;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/FloatPropertyCompat;)V
    .locals 2
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
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mVelocity:F

    const v0, 0x7f7fffff    # Float.MAX_VALUE

    .line 3
    iput v0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mValue:F

    const/4 v1, 0x0

    .line 4
    iput-boolean v1, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mStartValueIsSet:Z

    .line 5
    iput-boolean v1, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mRunning:Z

    .line 6
    iput v0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mMaxValue:F

    const v0, -0x800001

    .line 7
    iput v0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mMinValue:F

    const-wide/16 v0, 0x0

    .line 8
    iput-wide v0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mLastFrameTime:J

    .line 9
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mEndListeners:Ljava/util/ArrayList;

    .line 10
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mUpdateListeners:Ljava/util/ArrayList;

    .line 11
    iput-object p1, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mTarget:Ljava/lang/Object;

    .line 12
    iput-object p2, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mProperty:Landroidx/dynamicanimation/animation/FloatPropertyCompat;

    .line 13
    sget-object p1, Landroidx/dynamicanimation/animation/DynamicAnimation;->ROTATION:Landroidx/dynamicanimation/animation/DynamicAnimation$ViewProperty;

    if-eq p2, p1, :cond_4

    sget-object p1, Landroidx/dynamicanimation/animation/DynamicAnimation;->ROTATION_X:Landroidx/dynamicanimation/animation/DynamicAnimation$ViewProperty;

    if-eq p2, p1, :cond_4

    sget-object p1, Landroidx/dynamicanimation/animation/DynamicAnimation;->ROTATION_Y:Landroidx/dynamicanimation/animation/DynamicAnimation$ViewProperty;

    if-ne p2, p1, :cond_0

    goto :goto_1

    .line 14
    :cond_0
    sget-object p1, Landroidx/dynamicanimation/animation/DynamicAnimation;->ALPHA:Landroidx/dynamicanimation/animation/DynamicAnimation$ViewProperty;

    if-ne p2, p1, :cond_1

    const/high16 p1, 0x3b800000    # 0.00390625f

    .line 15
    iput p1, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mMinVisibleChange:F

    goto :goto_2

    .line 16
    :cond_1
    sget-object p1, Landroidx/dynamicanimation/animation/DynamicAnimation;->SCALE_X:Landroidx/dynamicanimation/animation/DynamicAnimation$ViewProperty;

    if-eq p2, p1, :cond_3

    sget-object p1, Landroidx/dynamicanimation/animation/DynamicAnimation;->SCALE_Y:Landroidx/dynamicanimation/animation/DynamicAnimation$ViewProperty;

    if-ne p2, p1, :cond_2

    goto :goto_0

    :cond_2
    const/high16 p1, 0x3f800000    # 1.0f

    .line 17
    iput p1, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mMinVisibleChange:F

    goto :goto_2

    :cond_3
    :goto_0
    const p1, 0x3b03126f    # 0.002f

    .line 18
    iput p1, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mMinVisibleChange:F

    goto :goto_2

    :cond_4
    :goto_1
    const p1, 0x3dcccccd    # 0.1f

    .line 19
    iput p1, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mMinVisibleChange:F

    :goto_2
    return-void
.end method

.method public static removeNullEntries(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "list"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/ArrayList<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_1

    .line 2
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    .line 3
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public doAnimationFrame(J)Z
    .locals 24
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "frameTime"
        }
    .end annotation

    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    .line 1
    iget-wide v3, v0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mLastFrameTime:J

    const-wide/16 v5, 0x0

    cmp-long v5, v3, v5

    const/4 v6, 0x0

    if-nez v5, :cond_0

    .line 2
    iput-wide v1, v0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mLastFrameTime:J

    .line 3
    iget v1, v0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mValue:F

    invoke-virtual {v0, v1}, Landroidx/dynamicanimation/animation/DynamicAnimation;->setPropertyValue(F)V

    return v6

    :cond_0
    sub-long v12, v1, v3

    .line 4
    iput-wide v1, v0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mLastFrameTime:J

    .line 5
    move-object v1, v0

    check-cast v1, Landroidx/dynamicanimation/animation/SpringAnimation;

    const/4 v2, 0x0

    const/4 v3, 0x1

    const v4, 0x7f7fffff    # Float.MAX_VALUE

    .line 6
    iget v5, v1, Landroidx/dynamicanimation/animation/SpringAnimation;->mPendingPosition:F

    cmpl-float v5, v5, v4

    if-eqz v5, :cond_1

    .line 7
    iget-object v14, v1, Landroidx/dynamicanimation/animation/SpringAnimation;->mSpring:Landroidx/dynamicanimation/animation/SpringForce;

    iget v5, v1, Landroidx/dynamicanimation/animation/DynamicAnimation;->mValue:F

    float-to-double v7, v5

    iget v5, v1, Landroidx/dynamicanimation/animation/DynamicAnimation;->mVelocity:F

    float-to-double v9, v5

    const-wide/16 v15, 0x2

    div-long v22, v12, v15

    move-wide v15, v7

    move-wide/from16 v17, v9

    move-wide/from16 v19, v22

    invoke-virtual/range {v14 .. v20}, Landroidx/dynamicanimation/animation/SpringForce;->updateValues(DDJ)Landroidx/dynamicanimation/animation/DynamicAnimation$MassState;

    move-result-object v5

    .line 8
    iget-object v7, v1, Landroidx/dynamicanimation/animation/SpringAnimation;->mSpring:Landroidx/dynamicanimation/animation/SpringForce;

    iget v8, v1, Landroidx/dynamicanimation/animation/SpringAnimation;->mPendingPosition:F

    float-to-double v8, v8

    .line 9
    iput-wide v8, v7, Landroidx/dynamicanimation/animation/SpringForce;->mFinalPosition:D

    .line 10
    iput v4, v1, Landroidx/dynamicanimation/animation/SpringAnimation;->mPendingPosition:F

    .line 11
    iget v4, v5, Landroidx/dynamicanimation/animation/DynamicAnimation$MassState;->mValue:F

    float-to-double v8, v4

    iget v4, v5, Landroidx/dynamicanimation/animation/DynamicAnimation$MassState;->mVelocity:F

    float-to-double v4, v4

    move-object/from16 v17, v7

    move-wide/from16 v18, v8

    move-wide/from16 v20, v4

    invoke-virtual/range {v17 .. v23}, Landroidx/dynamicanimation/animation/SpringForce;->updateValues(DDJ)Landroidx/dynamicanimation/animation/DynamicAnimation$MassState;

    move-result-object v4

    .line 12
    iget v5, v4, Landroidx/dynamicanimation/animation/DynamicAnimation$MassState;->mValue:F

    iput v5, v1, Landroidx/dynamicanimation/animation/DynamicAnimation;->mValue:F

    .line 13
    iget v4, v4, Landroidx/dynamicanimation/animation/DynamicAnimation$MassState;->mVelocity:F

    iput v4, v1, Landroidx/dynamicanimation/animation/DynamicAnimation;->mVelocity:F

    goto :goto_0

    .line 14
    :cond_1
    iget-object v7, v1, Landroidx/dynamicanimation/animation/SpringAnimation;->mSpring:Landroidx/dynamicanimation/animation/SpringForce;

    iget v4, v1, Landroidx/dynamicanimation/animation/DynamicAnimation;->mValue:F

    float-to-double v8, v4

    iget v4, v1, Landroidx/dynamicanimation/animation/DynamicAnimation;->mVelocity:F

    float-to-double v10, v4

    invoke-virtual/range {v7 .. v13}, Landroidx/dynamicanimation/animation/SpringForce;->updateValues(DDJ)Landroidx/dynamicanimation/animation/DynamicAnimation$MassState;

    move-result-object v4

    .line 15
    iget v5, v4, Landroidx/dynamicanimation/animation/DynamicAnimation$MassState;->mValue:F

    iput v5, v1, Landroidx/dynamicanimation/animation/DynamicAnimation;->mValue:F

    .line 16
    iget v4, v4, Landroidx/dynamicanimation/animation/DynamicAnimation$MassState;->mVelocity:F

    iput v4, v1, Landroidx/dynamicanimation/animation/DynamicAnimation;->mVelocity:F

    .line 17
    :goto_0
    iget v4, v1, Landroidx/dynamicanimation/animation/DynamicAnimation;->mValue:F

    iget v5, v1, Landroidx/dynamicanimation/animation/DynamicAnimation;->mMinValue:F

    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    move-result v4

    iput v4, v1, Landroidx/dynamicanimation/animation/DynamicAnimation;->mValue:F

    .line 18
    iget v5, v1, Landroidx/dynamicanimation/animation/DynamicAnimation;->mMaxValue:F

    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    move-result v4

    iput v4, v1, Landroidx/dynamicanimation/animation/DynamicAnimation;->mValue:F

    .line 19
    iget v5, v1, Landroidx/dynamicanimation/animation/DynamicAnimation;->mVelocity:F

    .line 20
    iget-object v7, v1, Landroidx/dynamicanimation/animation/SpringAnimation;->mSpring:Landroidx/dynamicanimation/animation/SpringForce;

    invoke-static {v7}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    float-to-double v8, v5

    iget-wide v10, v7, Landroidx/dynamicanimation/animation/SpringForce;->mVelocityThreshold:D

    cmpg-double v5, v8, v10

    if-gez v5, :cond_2

    .line 22
    iget-wide v8, v7, Landroidx/dynamicanimation/animation/SpringForce;->mFinalPosition:D

    double-to-float v5, v8

    sub-float/2addr v4, v5

    .line 23
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    float-to-double v4, v4

    iget-wide v7, v7, Landroidx/dynamicanimation/animation/SpringForce;->mValueThreshold:D

    cmpg-double v4, v4, v7

    if-gez v4, :cond_2

    move v4, v3

    goto :goto_1

    :cond_2
    move v4, v6

    :goto_1
    if-eqz v4, :cond_3

    .line 24
    iget-object v4, v1, Landroidx/dynamicanimation/animation/SpringAnimation;->mSpring:Landroidx/dynamicanimation/animation/SpringForce;

    .line 25
    iget-wide v4, v4, Landroidx/dynamicanimation/animation/SpringForce;->mFinalPosition:D

    double-to-float v4, v4

    .line 26
    iput v4, v1, Landroidx/dynamicanimation/animation/DynamicAnimation;->mValue:F

    .line 27
    iput v2, v1, Landroidx/dynamicanimation/animation/DynamicAnimation;->mVelocity:F

    goto :goto_2

    :cond_3
    move v3, v6

    .line 28
    :goto_2
    iget v1, v0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mValue:F

    iget v2, v0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mMaxValue:F

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iput v1, v0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mValue:F

    .line 29
    iget v2, v0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mMinValue:F

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iput v1, v0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mValue:F

    .line 30
    invoke-virtual {v0, v1}, Landroidx/dynamicanimation/animation/DynamicAnimation;->setPropertyValue(F)V

    if-eqz v3, :cond_4

    .line 31
    invoke-virtual {v0, v6}, Landroidx/dynamicanimation/animation/DynamicAnimation;->endAnimationInternal(Z)V

    :cond_4
    return v3
.end method

.method public final endAnimationInternal(Z)V
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "canceled"
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    iput-boolean v0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mRunning:Z

    .line 2
    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/DynamicAnimation;->getAnimationHandler()Landroidx/dynamicanimation/animation/AnimationHandler;

    move-result-object v1

    .line 3
    iget-object v2, v1, Landroidx/dynamicanimation/animation/AnimationHandler;->mDelayedCallbackStartTime:Landroidx/collection/SimpleArrayMap;

    invoke-virtual {v2, p0}, Landroidx/collection/SimpleArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    iget-object v2, v1, Landroidx/dynamicanimation/animation/AnimationHandler;->mAnimationCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    if-ltz v2, :cond_0

    .line 5
    iget-object v3, v1, Landroidx/dynamicanimation/animation/AnimationHandler;->mAnimationCallbacks:Ljava/util/ArrayList;

    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    const/4 v2, 0x1

    .line 6
    iput-boolean v2, v1, Landroidx/dynamicanimation/animation/AnimationHandler;->mListDirty:Z

    :cond_0
    const-wide/16 v1, 0x0

    .line 7
    iput-wide v1, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mLastFrameTime:J

    .line 8
    iput-boolean v0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mStartValueIsSet:Z

    .line 9
    :goto_0
    iget-object v1, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mEndListeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 10
    iget-object v1, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mEndListeners:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 11
    iget-object v1, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mEndListeners:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/dynamicanimation/animation/DynamicAnimation$OnAnimationEndListener;

    iget v2, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mValue:F

    iget v3, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mVelocity:F

    invoke-interface {v1, p0, p1, v2, v3}, Landroidx/dynamicanimation/animation/DynamicAnimation$OnAnimationEndListener;->onAnimationEnd(Landroidx/dynamicanimation/animation/DynamicAnimation;ZFF)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 12
    :cond_2
    iget-object p0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mEndListeners:Ljava/util/ArrayList;

    invoke-static {p0}, Landroidx/dynamicanimation/animation/DynamicAnimation;->removeNullEntries(Ljava/util/ArrayList;)V

    return-void
.end method

.method public getAnimationHandler()Landroidx/dynamicanimation/animation/AnimationHandler;
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mAnimationHandler:Landroidx/dynamicanimation/animation/AnimationHandler;

    if-nez v0, :cond_1

    .line 2
    sget-object v0, Landroidx/dynamicanimation/animation/AnimationHandler;->sAnimatorHandler:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    .line 3
    new-instance v1, Landroidx/dynamicanimation/animation/AnimationHandler;

    .line 4
    new-instance v2, Landroidx/dynamicanimation/animation/AnimationHandler$FrameCallbackScheduler16;

    invoke-direct {v2}, Landroidx/dynamicanimation/animation/AnimationHandler$FrameCallbackScheduler16;-><init>()V

    .line 5
    invoke-direct {v1, v2}, Landroidx/dynamicanimation/animation/AnimationHandler;-><init>(Landroidx/dynamicanimation/animation/AnimationHandler$FrameCallbackScheduler;)V

    .line 6
    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 7
    :cond_0
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/dynamicanimation/animation/AnimationHandler;

    .line 8
    iput-object v0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mAnimationHandler:Landroidx/dynamicanimation/animation/AnimationHandler;

    .line 9
    :cond_1
    iget-object p0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mAnimationHandler:Landroidx/dynamicanimation/animation/AnimationHandler;

    return-object p0
.end method

.method public setPropertyValue(F)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mProperty:Landroidx/dynamicanimation/animation/FloatPropertyCompat;

    iget-object v1, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mTarget:Ljava/lang/Object;

    invoke-virtual {v0, v1, p1}, Landroidx/dynamicanimation/animation/FloatPropertyCompat;->setValue(Ljava/lang/Object;F)V

    const/4 p1, 0x0

    .line 2
    :goto_0
    iget-object v0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mUpdateListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_1

    .line 3
    iget-object v0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mUpdateListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 4
    iget-object v0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mUpdateListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/dynamicanimation/animation/DynamicAnimation$OnAnimationUpdateListener;

    iget v1, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mValue:F

    iget v2, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mVelocity:F

    invoke-interface {v0, p0, v1, v2}, Landroidx/dynamicanimation/animation/DynamicAnimation$OnAnimationUpdateListener;->onAnimationUpdate(Landroidx/dynamicanimation/animation/DynamicAnimation;FF)V

    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 5
    :cond_1
    iget-object p0, p0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mUpdateListeners:Ljava/util/ArrayList;

    invoke-static {p0}, Landroidx/dynamicanimation/animation/DynamicAnimation;->removeNullEntries(Ljava/util/ArrayList;)V

    return-void
.end method
