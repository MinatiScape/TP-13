.class public final Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/systemui/unfold/UnfoldTransitionProgressProvider;
.implements Lcom/android/systemui/unfold/updates/FoldStateProvider$FoldUpdatesListener;
.implements Landroidx/dynamicanimation/animation/DynamicAnimation$OnAnimationEndListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider$AnimationProgressProperty;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPhysicsBasedUnfoldTransitionProgressProvider.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PhysicsBasedUnfoldTransitionProgressProvider.kt\ncom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,208:1\n1819#2,2:209\n1819#2,2:211\n1819#2,2:213\n*E\n*S KotlinDebug\n*F\n+ 1 PhysicsBasedUnfoldTransitionProgressProvider.kt\ncom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider\n*L\n59#1,2:209\n129#1,2:211\n151#1,2:213\n*E\n"
.end annotation


# instance fields
.field private final foldStateProvider:Lcom/android/systemui/unfold/updates/FoldStateProvider;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private isAnimatedCancelRunning:Z

.field private isTransitionRunning:Z

.field private final listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/systemui/unfold/UnfoldTransitionProgressProvider$TransitionProgressListener;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final springAnimation:Landroidx/dynamicanimation/animation/SpringAnimation;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private transitionProgress:F


# direct methods
.method public constructor <init>(Lcom/android/systemui/unfold/updates/FoldStateProvider;)V
    .locals 2
    .param p1    # Lcom/android/systemui/unfold/updates/FoldStateProvider;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const-string v0, "foldStateProvider"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->foldStateProvider:Lcom/android/systemui/unfold/updates/FoldStateProvider;

    .line 3
    new-instance v0, Landroidx/dynamicanimation/animation/SpringAnimation;

    sget-object v1, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider$AnimationProgressProperty;->INSTANCE:Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider$AnimationProgressProperty;

    invoke-direct {v0, p0, v1}, Landroidx/dynamicanimation/animation/SpringAnimation;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/FloatPropertyCompat;)V

    .line 4
    iget-object v1, v0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mEndListeners:Ljava/util/ArrayList;

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 5
    iget-object v1, v0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mEndListeners:Ljava/util/ArrayList;

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 6
    :cond_0
    iput-object v0, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->springAnimation:Landroidx/dynamicanimation/animation/SpringAnimation;

    .line 7
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->listeners:Ljava/util/List;

    .line 8
    invoke-interface {p1, p0}, Lcom/android/systemui/statusbar/policy/CallbackController;->addCallback(Ljava/lang/Object;)V

    .line 9
    invoke-interface {p1}, Lcom/android/systemui/unfold/updates/FoldStateProvider;->start()V

    return-void
.end method

.method public static final synthetic access$getTransitionProgress$p(Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->transitionProgress:F

    return p0
.end method

.method public static final synthetic access$setTransitionProgress(Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->setTransitionProgress(F)V

    return-void
.end method

.method private final cancelTransition(FZ)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->isTransitionRunning:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    if-eqz p2, :cond_0

    .line 2
    iput-boolean v1, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->isAnimatedCancelRunning:Z

    .line 3
    iget-object p0, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->springAnimation:Landroidx/dynamicanimation/animation/SpringAnimation;

    invoke-virtual {p0, p1}, Landroidx/dynamicanimation/animation/SpringAnimation;->animateToFinalPosition(F)V

    goto :goto_2

    .line 4
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->setTransitionProgress(F)V

    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->isAnimatedCancelRunning:Z

    .line 6
    iput-boolean p1, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->isTransitionRunning:Z

    .line 7
    iget-object p1, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->springAnimation:Landroidx/dynamicanimation/animation/SpringAnimation;

    .line 8
    invoke-virtual {p1}, Landroidx/dynamicanimation/animation/DynamicAnimation;->getAnimationHandler()Landroidx/dynamicanimation/animation/AnimationHandler;

    move-result-object p2

    .line 9
    iget-object p2, p2, Landroidx/dynamicanimation/animation/AnimationHandler;->mScheduler:Landroidx/dynamicanimation/animation/AnimationHandler$FrameCallbackScheduler;

    invoke-interface {p2}, Landroidx/dynamicanimation/animation/AnimationHandler$FrameCallbackScheduler;->isCurrentThread()Z

    move-result p2

    if-eqz p2, :cond_5

    .line 10
    iget-boolean p2, p1, Landroidx/dynamicanimation/animation/DynamicAnimation;->mRunning:Z

    if-eqz p2, :cond_1

    .line 11
    invoke-virtual {p1, v1}, Landroidx/dynamicanimation/animation/DynamicAnimation;->endAnimationInternal(Z)V

    .line 12
    :cond_1
    iget p2, p1, Landroidx/dynamicanimation/animation/SpringAnimation;->mPendingPosition:F

    const v0, 0x7f7fffff    # Float.MAX_VALUE

    cmpl-float v1, p2, v0

    if-eqz v1, :cond_3

    .line 13
    iget-object v1, p1, Landroidx/dynamicanimation/animation/SpringAnimation;->mSpring:Landroidx/dynamicanimation/animation/SpringForce;

    if-nez v1, :cond_2

    .line 14
    new-instance v1, Landroidx/dynamicanimation/animation/SpringForce;

    invoke-direct {v1, p2}, Landroidx/dynamicanimation/animation/SpringForce;-><init>(F)V

    iput-object v1, p1, Landroidx/dynamicanimation/animation/SpringAnimation;->mSpring:Landroidx/dynamicanimation/animation/SpringForce;

    goto :goto_0

    :cond_2
    float-to-double v2, p2

    .line 15
    iput-wide v2, v1, Landroidx/dynamicanimation/animation/SpringForce;->mFinalPosition:D

    .line 16
    :goto_0
    iput v0, p1, Landroidx/dynamicanimation/animation/SpringAnimation;->mPendingPosition:F

    .line 17
    :cond_3
    iget-object p0, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->listeners:Ljava/util/List;

    .line 18
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/systemui/unfold/UnfoldTransitionProgressProvider$TransitionProgressListener;

    .line 19
    invoke-interface {p1}, Lcom/android/systemui/unfold/UnfoldTransitionProgressProvider$TransitionProgressListener;->onTransitionFinished()V

    goto :goto_1

    :cond_4
    const-string p0, "PhysicsBasedUnfoldTransitionProgressProvider"

    const-string p1, "onTransitionFinished"

    .line 20
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_2
    return-void

    .line 21
    :cond_5
    new-instance p0, Landroid/util/AndroidRuntimeException;

    const-string p1, "Animations may only be canceled from the same thread as the animation handler"

    invoke-direct {p0, p1}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private final onStartTransition()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->listeners:Ljava/util/List;

    .line 2
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/systemui/unfold/UnfoldTransitionProgressProvider$TransitionProgressListener;

    .line 3
    invoke-interface {v1}, Lcom/android/systemui/unfold/UnfoldTransitionProgressProvider$TransitionProgressListener;->onTransitionStarted()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->isTransitionRunning:Z

    const-string p0, "PhysicsBasedUnfoldTransitionProgressProvider"

    const-string v0, "onTransitionStarted"

    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private final setTransitionProgress(F)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->isTransitionRunning:Z

    if-eqz v0, :cond_0

    .line 2
    iget-object v0, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->listeners:Ljava/util/List;

    .line 3
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/systemui/unfold/UnfoldTransitionProgressProvider$TransitionProgressListener;

    .line 4
    invoke-interface {v1, p1}, Lcom/android/systemui/unfold/UnfoldTransitionProgressProvider$TransitionProgressListener;->onTransitionProgress(F)V

    goto :goto_0

    .line 5
    :cond_0
    iput p1, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->transitionProgress:F

    return-void
.end method

.method private final startTransition(F)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->isTransitionRunning:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->onStartTransition()V

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->springAnimation:Landroidx/dynamicanimation/animation/SpringAnimation;

    .line 3
    new-instance v1, Landroidx/dynamicanimation/animation/SpringForce;

    invoke-direct {v1}, Landroidx/dynamicanimation/animation/SpringForce;-><init>()V

    float-to-double v2, p1

    .line 4
    iput-wide v2, v1, Landroidx/dynamicanimation/animation/SpringForce;->mFinalPosition:D

    const/high16 v2, 0x3f800000    # 1.0f

    float-to-double v3, v2

    .line 5
    iput-wide v3, v1, Landroidx/dynamicanimation/animation/SpringForce;->mDampingRatio:D

    const/4 v3, 0x0

    .line 6
    iput-boolean v3, v1, Landroidx/dynamicanimation/animation/SpringForce;->mInitialized:Z

    const/high16 v4, 0x43480000    # 200.0f

    float-to-double v4, v4

    .line 7
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    iput-wide v4, v1, Landroidx/dynamicanimation/animation/SpringForce;->mNaturalFreq:D

    .line 8
    iput-boolean v3, v1, Landroidx/dynamicanimation/animation/SpringForce;->mInitialized:Z

    .line 9
    iput-object v1, v0, Landroidx/dynamicanimation/animation/SpringAnimation;->mSpring:Landroidx/dynamicanimation/animation/SpringForce;

    const v1, 0x3a83126f    # 0.001f

    .line 10
    iput v1, v0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mMinVisibleChange:F

    .line 11
    iput p1, v0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mValue:F

    const/4 p1, 0x1

    .line 12
    iput-boolean p1, v0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mStartValueIsSet:Z

    const/4 p1, 0x0

    .line 13
    iput p1, v0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mMinValue:F

    .line 14
    iput v2, v0, Landroidx/dynamicanimation/animation/DynamicAnimation;->mMaxValue:F

    .line 15
    iget-object p0, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->springAnimation:Landroidx/dynamicanimation/animation/SpringAnimation;

    invoke-virtual {p0}, Landroidx/dynamicanimation/animation/SpringAnimation;->start()V

    return-void
.end method


# virtual methods
.method public addCallback(Lcom/android/systemui/unfold/UnfoldTransitionProgressProvider$TransitionProgressListener;)V
    .locals 1
    .param p1    # Lcom/android/systemui/unfold/UnfoldTransitionProgressProvider$TransitionProgressListener;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const-string v0, "listener"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    iget-object p0, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->listeners:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public bridge synthetic addCallback(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/systemui/unfold/UnfoldTransitionProgressProvider$TransitionProgressListener;

    invoke-virtual {p0, p1}, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->addCallback(Lcom/android/systemui/unfold/UnfoldTransitionProgressProvider$TransitionProgressListener;)V

    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->foldStateProvider:Lcom/android/systemui/unfold/updates/FoldStateProvider;

    invoke-interface {p0}, Lcom/android/systemui/unfold/updates/FoldStateProvider;->stop()V

    return-void
.end method

.method public onAnimationEnd(Landroidx/dynamicanimation/animation/DynamicAnimation;ZFF)V
    .locals 0
    .param p1    # Landroidx/dynamicanimation/animation/DynamicAnimation;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/dynamicanimation/animation/DynamicAnimation<",
            "+",
            "Landroidx/dynamicanimation/animation/DynamicAnimation<",
            "*>;>;ZFF)V"
        }
    .end annotation

    const-string p2, "animation"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    iget-boolean p1, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->isAnimatedCancelRunning:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    .line 2
    invoke-direct {p0, p3, p1}, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->cancelTransition(FZ)V

    :cond_0
    return-void
.end method

.method public onFoldUpdate(I)V
    .locals 4

    const/4 v0, 0x2

    const/high16 v1, 0x3f800000    # 1.0f

    if-eq p1, v0, :cond_3

    const/4 v0, 0x3

    const/4 v2, 0x1

    if-eq p1, v0, :cond_2

    const/4 v0, 0x4

    const/4 v3, 0x0

    if-eq p1, v0, :cond_1

    const/4 v0, 0x6

    if-eq p1, v0, :cond_2

    const/4 v0, 0x7

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v3, v0}, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->cancelTransition(FZ)V

    goto :goto_0

    .line 2
    :cond_1
    invoke-direct {p0, v3}, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->startTransition(F)V

    .line 3
    iget-object v0, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->foldStateProvider:Lcom/android/systemui/unfold/updates/FoldStateProvider;

    invoke-interface {v0}, Lcom/android/systemui/unfold/updates/FoldStateProvider;->isFullyOpened()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 4
    invoke-direct {p0, v1, v2}, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->cancelTransition(FZ)V

    goto :goto_0

    .line 5
    :cond_2
    iget-boolean v0, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->isTransitionRunning:Z

    if-eqz v0, :cond_4

    .line 6
    invoke-direct {p0, v1, v2}, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->cancelTransition(FZ)V

    goto :goto_0

    .line 7
    :cond_3
    iget-boolean v0, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->isTransitionRunning:Z

    if-nez v0, :cond_4

    .line 8
    invoke-direct {p0, v1}, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->startTransition(F)V

    .line 9
    :cond_4
    :goto_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const-string p1, "onFoldUpdate = "

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->stringPlus(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "PhysicsBasedUnfoldTransitionProgressProvider"

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onHingeAngleUpdate(F)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->isTransitionRunning:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->isAnimatedCancelRunning:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/high16 v0, 0x43250000    # 165.0f

    div-float/2addr p1, v0

    .line 2
    invoke-static {p1}, Landroid/util/MathUtils;->saturate(F)F

    move-result p1

    .line 3
    iget-object p0, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->springAnimation:Landroidx/dynamicanimation/animation/SpringAnimation;

    invoke-virtual {p0, p1}, Landroidx/dynamicanimation/animation/SpringAnimation;->animateToFinalPosition(F)V

    :cond_1
    :goto_0
    return-void
.end method

.method public removeCallback(Lcom/android/systemui/unfold/UnfoldTransitionProgressProvider$TransitionProgressListener;)V
    .locals 1
    .param p1    # Lcom/android/systemui/unfold/UnfoldTransitionProgressProvider$TransitionProgressListener;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const-string v0, "listener"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    iget-object p0, p0, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->listeners:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public bridge synthetic removeCallback(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/systemui/unfold/UnfoldTransitionProgressProvider$TransitionProgressListener;

    invoke-virtual {p0, p1}, Lcom/android/systemui/unfold/progress/PhysicsBasedUnfoldTransitionProgressProvider;->removeCallback(Lcom/android/systemui/unfold/UnfoldTransitionProgressProvider$TransitionProgressListener;)V

    return-void
.end method
