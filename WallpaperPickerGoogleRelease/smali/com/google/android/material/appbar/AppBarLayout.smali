.class public Lcom/google/android/material/appbar/AppBarLayout;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Landroidx/coordinatorlayout/widget/CoordinatorLayout$AttachedBehavior;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/appbar/AppBarLayout$ScrollingViewBehavior;,
        Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;,
        Lcom/google/android/material/appbar/AppBarLayout$Behavior;,
        Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;,
        Lcom/google/android/material/appbar/AppBarLayout$OnOffsetChangedListener;,
        Lcom/google/android/material/appbar/AppBarLayout$BaseOnOffsetChangedListener;
    }
.end annotation


# instance fields
.field public currentOffset:I

.field public downPreScrollRange:I

.field public downScrollRange:I

.field public elevationOverlayAnimator:Landroid/animation/ValueAnimator;

.field public haveChildWithInterpolator:Z

.field public lastInsets:Landroidx/core/view/WindowInsetsCompat;

.field public liftOnScroll:Z

.field public liftOnScrollTargetView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public liftOnScrollTargetViewId:I

.field public liftable:Z

.field public lifted:Z

.field public listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/material/appbar/AppBarLayout$BaseOnOffsetChangedListener;",
            ">;"
        }
    .end annotation
.end field

.field public pendingAction:I

.field public statusBarForeground:Landroid/graphics/drawable/Drawable;

.field public tmpStatesArray:[I

.field public totalScrollRange:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/appbar/AppBarLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const v0, 0x7f040034

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/appbar/AppBarLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 15

    move-object v0, p0

    move-object/from16 v7, p2

    move/from16 v8, p3

    const v1, 0x7f1202a9

    move-object/from16 v2, p1

    .line 3
    invoke-static {v2, v7, v8, v1}, Lcom/google/android/material/theme/overlay/MaterialThemeOverlay;->wrap(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    move-result-object v1

    invoke-direct {p0, v1, v7, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v9, -0x1

    .line 4
    iput v9, v0, Lcom/google/android/material/appbar/AppBarLayout;->totalScrollRange:I

    .line 5
    iput v9, v0, Lcom/google/android/material/appbar/AppBarLayout;->downPreScrollRange:I

    .line 6
    iput v9, v0, Lcom/google/android/material/appbar/AppBarLayout;->downScrollRange:I

    const/4 v10, 0x0

    .line 7
    iput v10, v0, Lcom/google/android/material/appbar/AppBarLayout;->pendingAction:I

    .line 8
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v11

    const/4 v12, 0x1

    .line 9
    invoke-virtual {p0, v12}, Lcom/google/android/material/appbar/AppBarLayout;->setOrientation(I)V

    .line 10
    sget-object v1, Landroid/view/ViewOutlineProvider;->BOUNDS:Landroid/view/ViewOutlineProvider;

    invoke-virtual {p0, v1}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    const v5, 0x7f1202a9

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v13

    .line 12
    sget-object v3, Lcom/google/android/material/appbar/ViewUtilsLollipop;->STATE_LIST_ANIM_ATTRS:[I

    new-array v6, v10, [I

    move-object v1, v13

    move-object/from16 v2, p2

    move/from16 v4, p3

    .line 13
    invoke-static/range {v1 .. v6}, Lcom/google/android/material/internal/ThemeEnforcement;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 14
    :try_start_0
    invoke-virtual {v1, v10}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 15
    invoke-virtual {v1, v10, v10}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    invoke-static {v13, v2}, Landroid/animation/AnimatorInflater;->loadStateListAnimator(Landroid/content/Context;I)Landroid/animation/StateListAnimator;

    move-result-object v2

    .line 16
    invoke-virtual {p0, v2}, Landroid/view/View;->setStateListAnimator(Landroid/animation/StateListAnimator;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    :cond_0
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 18
    sget-object v3, Lcom/google/android/material/R$styleable;->AppBarLayout:[I

    const v5, 0x7f1202a9

    new-array v6, v10, [I

    move-object v1, v11

    move-object/from16 v2, p2

    move/from16 v4, p3

    .line 19
    invoke-static/range {v1 .. v6}, Lcom/google/android/material/internal/ThemeEnforcement;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 20
    invoke-virtual {v1, v10}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    sget-object v3, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 21
    invoke-virtual {p0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 22
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    instance-of v2, v2, Landroid/graphics/drawable/ColorDrawable;

    if-eqz v2, :cond_1

    .line 23
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/ColorDrawable;

    .line 24
    new-instance v3, Lcom/google/android/material/shape/MaterialShapeDrawable;

    invoke-direct {v3}, Lcom/google/android/material/shape/MaterialShapeDrawable;-><init>()V

    .line 25
    invoke-virtual {v2}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result v2

    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setFillColor(Landroid/content/res/ColorStateList;)V

    .line 26
    iget-object v2, v3, Lcom/google/android/material/shape/MaterialShapeDrawable;->drawableState:Lcom/google/android/material/shape/MaterialShapeDrawable$MaterialShapeDrawableState;

    new-instance v4, Lcom/google/android/material/elevation/ElevationOverlayProvider;

    invoke-direct {v4, v11}, Lcom/google/android/material/elevation/ElevationOverlayProvider;-><init>(Landroid/content/Context;)V

    iput-object v4, v2, Lcom/google/android/material/shape/MaterialShapeDrawable$MaterialShapeDrawableState;->elevationOverlayProvider:Lcom/google/android/material/elevation/ElevationOverlayProvider;

    .line 27
    invoke-virtual {v3}, Lcom/google/android/material/shape/MaterialShapeDrawable;->updateZ()V

    .line 28
    invoke-virtual {p0, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_1
    const/4 v2, 0x4

    .line 29
    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 30
    invoke-virtual {v1, v2, v10}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    .line 31
    invoke-virtual {p0, v2, v10, v10}, Lcom/google/android/material/appbar/AppBarLayout;->setExpanded(ZZZ)V

    :cond_2
    const/4 v2, 0x3

    .line 32
    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 33
    invoke-virtual {v1, v2, v10}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    int-to-float v3, v3

    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0b0002

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v4

    .line 35
    new-instance v5, Landroid/animation/StateListAnimator;

    invoke-direct {v5}, Landroid/animation/StateListAnimator;-><init>()V

    new-array v2, v2, [I

    fill-array-data v2, :array_0

    const v6, 0x101000e

    new-array v7, v12, [F

    const/4 v8, 0x0

    aput v8, v7, v10

    const-string v11, "elevation"

    .line 36
    invoke-static {p0, v11, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v7

    int-to-long v13, v4

    invoke-virtual {v7, v13, v14}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v4

    .line 37
    invoke-virtual {v5, v2, v4}, Landroid/animation/StateListAnimator;->addState([ILandroid/animation/Animator;)V

    new-array v2, v12, [I

    aput v6, v2, v10

    new-array v4, v12, [F

    aput v3, v4, v10

    .line 38
    invoke-static {p0, v11, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-virtual {v3, v13, v14}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v3

    .line 39
    invoke-virtual {v5, v2, v3}, Landroid/animation/StateListAnimator;->addState([ILandroid/animation/Animator;)V

    new-array v2, v10, [I

    new-array v3, v12, [F

    aput v8, v3, v10

    .line 40
    invoke-static {p0, v11, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    const-wide/16 v6, 0x0

    invoke-virtual {v3, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v3

    invoke-virtual {v5, v2, v3}, Landroid/animation/StateListAnimator;->addState([ILandroid/animation/Animator;)V

    .line 41
    invoke-virtual {p0, v5}, Landroid/view/View;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    :cond_3
    const/4 v2, 0x2

    .line 42
    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 43
    invoke-virtual {v1, v2, v10}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    .line 44
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->setKeyboardNavigationCluster(Z)V

    .line 45
    :cond_4
    invoke-virtual {v1, v12}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 46
    invoke-virtual {v1, v12, v10}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    .line 47
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->setTouchscreenBlocksFocus(Z)V

    :cond_5
    const/4 v2, 0x5

    .line 48
    invoke-virtual {v1, v2, v10}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, v0, Lcom/google/android/material/appbar/AppBarLayout;->liftOnScroll:Z

    const/4 v2, 0x6

    .line 49
    invoke-virtual {v1, v2, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    iput v2, v0, Lcom/google/android/material/appbar/AppBarLayout;->liftOnScrollTargetViewId:I

    const/4 v2, 0x7

    .line 50
    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 51
    iget-object v3, v0, Lcom/google/android/material/appbar/AppBarLayout;->statusBarForeground:Landroid/graphics/drawable/Drawable;

    if-eq v3, v2, :cond_b

    const/4 v4, 0x0

    if-eqz v3, :cond_6

    .line 52
    invoke-virtual {v3, v4}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    :cond_6
    if-eqz v2, :cond_7

    .line 53
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    :cond_7
    iput-object v4, v0, Lcom/google/android/material/appbar/AppBarLayout;->statusBarForeground:Landroid/graphics/drawable/Drawable;

    if-eqz v4, :cond_a

    .line 54
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 55
    iget-object v2, v0, Lcom/google/android/material/appbar/AppBarLayout;->statusBarForeground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getDrawableState()[I

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 56
    :cond_8
    iget-object v2, v0, Lcom/google/android/material/appbar/AppBarLayout;->statusBarForeground:Landroid/graphics/drawable/Drawable;

    .line 57
    invoke-virtual {p0}, Landroid/view/View;->getLayoutDirection()I

    move-result v3

    .line 58
    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setLayoutDirection(I)Z

    .line 59
    iget-object v2, v0, Lcom/google/android/material/appbar/AppBarLayout;->statusBarForeground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v3

    if-nez v3, :cond_9

    goto :goto_0

    :cond_9
    move v12, v10

    :goto_0
    invoke-virtual {v2, v12, v10}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 60
    iget-object v2, v0, Lcom/google/android/material/appbar/AppBarLayout;->statusBarForeground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 61
    :cond_a
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->updateWillNotDraw()V

    .line 62
    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    .line 63
    :cond_b
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 64
    new-instance v1, Lcom/google/android/material/appbar/AppBarLayout$1;

    invoke-direct {v1, p0}, Lcom/google/android/material/appbar/AppBarLayout$1;-><init>(Lcom/google/android/material/appbar/AppBarLayout;)V

    .line 65
    invoke-static {p0, v1}, Landroidx/core/view/ViewCompat$Api21Impl;->setOnApplyWindowInsetsListener(Landroid/view/View;Landroidx/core/view/OnApplyWindowInsetsListener;)V

    return-void

    :catchall_0
    move-exception v0

    .line 66
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 67
    throw v0

    nop

    :array_0
    .array-data 4
        0x101000e
        0x7f040341
        -0x7f040342
    .end array-data
.end method


# virtual methods
.method public checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    return p0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 2
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->statusBarForeground:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->getTopInset()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 3
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    const/4 v1, 0x0

    .line 4
    iget v2, p0, Lcom/google/android/material/appbar/AppBarLayout;->currentOffset:I

    neg-int v2, v2

    int-to-float v2, v2

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 5
    iget-object p0, p0, Lcom/google/android/material/appbar/AppBarLayout;->statusBarForeground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 6
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_1
    return-void
.end method

.method public drawableStateChanged()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->drawableStateChanged()V

    .line 2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getDrawableState()[I

    move-result-object v0

    .line 3
    iget-object v1, p0, Lcom/google/android/material/appbar/AppBarLayout;->statusBarForeground:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_0

    .line 4
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 5
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    return-void
.end method

.method public generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 2

    .line 1
    new-instance p0, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-direct {p0, v0, v1}, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;-><init>(II)V

    return-object p0
.end method

.method public generateDefaultLayoutParams()Landroid/widget/LinearLayout$LayoutParams;
    .locals 2

    .line 2
    new-instance p0, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-direct {p0, v0, v1}, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;-><init>(II)V

    return-object p0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .line 3
    new-instance v0, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/AppBarLayout;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/LinearLayout$LayoutParams;
    .locals 1

    .line 4
    new-instance v0, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/widget/LinearLayout$LayoutParams;
    .locals 0

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/AppBarLayout;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method public generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;
    .locals 0

    .line 5
    instance-of p0, p1, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz p0, :cond_0

    .line 6
    new-instance p0, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, p1}, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;-><init>(Landroid/widget/LinearLayout$LayoutParams;)V

    return-object p0

    .line 7
    :cond_0
    instance-of p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz p0, :cond_1

    .line 8
    new-instance p0, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {p0, p1}, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    return-object p0

    .line 9
    :cond_1
    new-instance p0, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    invoke-direct {p0, p1}, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object p0
.end method

.method public getBehavior()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior<",
            "Lcom/google/android/material/appbar/AppBarLayout;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/google/android/material/appbar/AppBarLayout$Behavior;

    invoke-direct {p0}, Lcom/google/android/material/appbar/AppBarLayout$Behavior;-><init>()V

    return-object p0
.end method

.method public getDownNestedPreScrollRange()I
    .locals 9

    .line 1
    iget v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->downPreScrollRange:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    return v0

    .line 2
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ltz v0, :cond_6

    .line 3
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 4
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    .line 5
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    .line 6
    iget v6, v4, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;->scrollFlags:I

    and-int/lit8 v7, v6, 0x5

    const/4 v8, 0x5

    if-ne v7, v8, :cond_4

    .line 7
    iget v7, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    iget v4, v4, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v7, v4

    and-int/lit8 v4, v6, 0x8

    if-eqz v4, :cond_1

    .line 8
    sget-object v4, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 9
    invoke-virtual {v3}, Landroid/view/View;->getMinimumHeight()I

    move-result v4

    add-int/2addr v7, v4

    goto :goto_1

    :cond_1
    and-int/lit8 v4, v6, 0x2

    if-eqz v4, :cond_2

    .line 10
    sget-object v4, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 11
    invoke-virtual {v3}, Landroid/view/View;->getMinimumHeight()I

    move-result v4

    sub-int v4, v5, v4

    add-int/2addr v7, v4

    goto :goto_1

    :cond_2
    add-int/2addr v7, v5

    :goto_1
    if-nez v0, :cond_3

    .line 12
    sget-object v4, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 13
    invoke-virtual {v3}, Landroid/view/View;->getFitsSystemWindows()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 14
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->getTopInset()I

    move-result v3

    sub-int/2addr v5, v3

    invoke-static {v7, v5}, Ljava/lang/Math;->min(II)I

    move-result v7

    :cond_3
    add-int/2addr v2, v7

    goto :goto_2

    :cond_4
    if-lez v2, :cond_5

    goto :goto_3

    :cond_5
    :goto_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 15
    :cond_6
    :goto_3
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->downPreScrollRange:I

    return v0
.end method

.method public getDownNestedScrollRange()I
    .locals 9

    .line 1
    iget v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->downScrollRange:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    return v0

    .line 2
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    :goto_0
    if-ge v2, v0, :cond_2

    .line 3
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 4
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    .line 5
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v6

    .line 6
    iget v7, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    iget v8, v5, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v7, v8

    add-int/2addr v7, v6

    .line 7
    iget v5, v5, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;->scrollFlags:I

    and-int/lit8 v6, v5, 0x1

    if-eqz v6, :cond_2

    add-int/2addr v3, v7

    and-int/lit8 v5, v5, 0x2

    if-eqz v5, :cond_1

    .line 8
    sget-object v0, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 9
    invoke-virtual {v4}, Landroid/view/View;->getMinimumHeight()I

    move-result v0

    sub-int/2addr v3, v0

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 10
    :cond_2
    :goto_1
    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->downScrollRange:I

    return v0
.end method

.method public final getMinimumHeightForVisibleOverlappingContent()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->getTopInset()I

    move-result v0

    .line 2
    sget-object v1, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getMinimumHeight()I

    move-result v1

    if-eqz v1, :cond_0

    :goto_0
    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v1, v0

    return v1

    .line 4
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    const/4 v2, 0x1

    if-lt v1, v2, :cond_1

    sub-int/2addr v1, v2

    .line 5
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 6
    invoke-virtual {v1}, Landroid/view/View;->getMinimumHeight()I

    move-result v1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    if-eqz v1, :cond_2

    goto :goto_0

    .line 7
    :cond_2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getHeight()I

    move-result p0

    div-int/lit8 p0, p0, 0x3

    return p0
.end method

.method public final getTopInset()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/appbar/AppBarLayout;->lastInsets:Landroidx/core/view/WindowInsetsCompat;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat;->getSystemWindowInsetTop()I

    move-result p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public final getTotalScrollRange()I
    .locals 9

    .line 1
    iget v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->totalScrollRange:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    return v0

    .line 2
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    :goto_0
    if-ge v2, v0, :cond_3

    .line 3
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 4
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    .line 5
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v6

    .line 6
    iget v7, v5, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;->scrollFlags:I

    and-int/lit8 v8, v7, 0x1

    if-eqz v8, :cond_3

    .line 7
    iget v8, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    add-int/2addr v6, v8

    iget v5, v5, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v6, v5

    add-int/2addr v6, v3

    if-nez v2, :cond_1

    .line 8
    sget-object v3, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 9
    invoke-virtual {v4}, Landroid/view/View;->getFitsSystemWindows()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 10
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->getTopInset()I

    move-result v3

    sub-int/2addr v6, v3

    :cond_1
    move v3, v6

    and-int/lit8 v5, v7, 0x2

    if-eqz v5, :cond_2

    .line 11
    sget-object v0, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 12
    invoke-virtual {v4}, Landroid/view/View;->getMinimumHeight()I

    move-result v0

    sub-int/2addr v3, v0

    goto :goto_1

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 13
    :cond_3
    :goto_1
    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->totalScrollRange:I

    return v0
.end method

.method public onAttachedToWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 3
    instance-of v1, v0, Lcom/google/android/material/shape/MaterialShapeDrawable;

    if-eqz v1, :cond_0

    .line 4
    check-cast v0, Lcom/google/android/material/shape/MaterialShapeDrawable;

    invoke-static {p0, v0}, Landroidx/recyclerview/R$attr;->setParentAbsoluteElevation(Landroid/view/View;Lcom/google/android/material/shape/MaterialShapeDrawable;)V

    :cond_0
    return-void
.end method

.method public onCreateDrawableState(I)[I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->tmpStatesArray:[I

    if-nez v0, :cond_0

    const/4 v0, 0x4

    new-array v0, v0, [I

    .line 2
    iput-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->tmpStatesArray:[I

    .line 3
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->tmpStatesArray:[I

    .line 4
    array-length v1, v0

    add-int/2addr p1, v1

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onCreateDrawableState(I)[I

    move-result-object p1

    const/4 v1, 0x0

    .line 5
    iget-boolean v2, p0, Lcom/google/android/material/appbar/AppBarLayout;->liftable:Z

    if-eqz v2, :cond_1

    const v3, 0x7f040341

    goto :goto_0

    :cond_1
    const v3, -0x7f040341

    :goto_0
    aput v3, v0, v1

    const/4 v1, 0x1

    if-eqz v2, :cond_2

    .line 6
    iget-boolean v3, p0, Lcom/google/android/material/appbar/AppBarLayout;->lifted:Z

    if-eqz v3, :cond_2

    const v3, 0x7f040342

    goto :goto_1

    :cond_2
    const v3, -0x7f040342

    :goto_1
    aput v3, v0, v1

    const/4 v1, 0x2

    if-eqz v2, :cond_3

    const v3, 0x7f04033f

    goto :goto_2

    :cond_3
    const v3, -0x7f04033f

    .line 7
    :goto_2
    aput v3, v0, v1

    const/4 v1, 0x3

    if-eqz v2, :cond_4

    .line 8
    iget-boolean p0, p0, Lcom/google/android/material/appbar/AppBarLayout;->lifted:Z

    if-eqz p0, :cond_4

    const p0, 0x7f04033e

    goto :goto_3

    :cond_4
    const p0, -0x7f04033e

    :goto_3
    aput p0, v0, v1

    .line 9
    invoke-static {p1, v0}, Landroid/widget/LinearLayout;->mergeDrawableStates([I[I)[I

    move-result-object p0

    return-object p0
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 2
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->liftOnScrollTargetView:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    :cond_0
    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->liftOnScrollTargetView:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 1

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 2
    sget-object p1, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getFitsSystemWindows()Z

    move-result p1

    const/4 p2, 0x1

    if-eqz p1, :cond_0

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->shouldOffsetFirstChild()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 5
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->getTopInset()I

    move-result p1

    .line 6
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p3

    sub-int/2addr p3, p2

    :goto_0
    if-ltz p3, :cond_0

    .line 7
    invoke-virtual {p0, p3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p4

    .line 8
    invoke-virtual {p4, p1}, Landroid/view/View;->offsetTopAndBottom(I)V

    add-int/lit8 p3, p3, -0x1

    goto :goto_0

    :cond_0
    const/4 p1, -0x1

    .line 9
    iput p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->totalScrollRange:I

    .line 10
    iput p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->downPreScrollRange:I

    .line 11
    iput p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->downScrollRange:I

    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->haveChildWithInterpolator:Z

    .line 13
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p3

    move p4, p1

    :goto_1
    if-ge p4, p3, :cond_2

    .line 14
    invoke-virtual {p0, p4}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p5

    .line 15
    invoke-virtual {p5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p5

    check-cast p5, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    .line 16
    iget-object p5, p5, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;->scrollInterpolator:Landroid/view/animation/Interpolator;

    if-eqz p5, :cond_1

    .line 17
    iput-boolean p2, p0, Lcom/google/android/material/appbar/AppBarLayout;->haveChildWithInterpolator:Z

    goto :goto_2

    :cond_1
    add-int/lit8 p4, p4, 0x1

    goto :goto_1

    .line 18
    :cond_2
    :goto_2
    iget-object p3, p0, Lcom/google/android/material/appbar/AppBarLayout;->statusBarForeground:Landroid/graphics/drawable/Drawable;

    if-eqz p3, :cond_3

    .line 19
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWidth()I

    move-result p4

    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->getTopInset()I

    move-result p5

    invoke-virtual {p3, p1, p1, p4, p5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 20
    :cond_3
    iget-boolean p3, p0, Lcom/google/android/material/appbar/AppBarLayout;->liftOnScroll:Z

    if-nez p3, :cond_8

    .line 21
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p3

    move p4, p1

    :goto_3
    if-ge p4, p3, :cond_6

    .line 22
    invoke-virtual {p0, p4}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p5

    invoke-virtual {p5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p5

    check-cast p5, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    .line 23
    iget p5, p5, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;->scrollFlags:I

    and-int/lit8 v0, p5, 0x1

    if-ne v0, p2, :cond_4

    and-int/lit8 p5, p5, 0xa

    if-eqz p5, :cond_4

    move p5, p2

    goto :goto_4

    :cond_4
    move p5, p1

    :goto_4
    if-eqz p5, :cond_5

    move p3, p2

    goto :goto_5

    :cond_5
    add-int/lit8 p4, p4, 0x1

    goto :goto_3

    :cond_6
    move p3, p1

    :goto_5
    if-eqz p3, :cond_7

    goto :goto_6

    :cond_7
    move p2, p1

    .line 24
    :cond_8
    :goto_6
    iget-boolean p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->liftable:Z

    if-eq p1, p2, :cond_9

    .line 25
    iput-boolean p2, p0, Lcom/google/android/material/appbar/AppBarLayout;->liftable:Z

    .line 26
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->refreshDrawableState()V

    :cond_9
    return-void
.end method

.method public onMeasure(II)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 2
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p1

    const/high16 v0, 0x40000000    # 2.0f

    if-eq p1, v0, :cond_2

    .line 3
    sget-object v0, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getFitsSystemWindows()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 5
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->shouldOffsetFirstChild()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 6
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    move-result v0

    const/high16 v1, -0x80000000

    if-eq p1, v1, :cond_1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->getTopInset()I

    move-result p1

    add-int/2addr v0, p1

    goto :goto_0

    .line 8
    :cond_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    move-result p1

    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->getTopInset()I

    move-result v0

    add-int/2addr v0, p1

    const/4 p1, 0x0

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    .line 9
    invoke-static {v0, p1, p2}, Landroidx/core/math/MathUtils;->clamp(III)I

    move-result v0

    .line 10
    :goto_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    move-result p1

    invoke-virtual {p0, p1, v0}, Landroid/widget/LinearLayout;->setMeasuredDimension(II)V

    :cond_2
    const/4 p1, -0x1

    .line 11
    iput p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->totalScrollRange:I

    .line 12
    iput p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->downPreScrollRange:I

    .line 13
    iput p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->downScrollRange:I

    return-void
.end method

.method public onOffsetChanged(I)V
    .locals 3

    .line 1
    iput p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->currentOffset:I

    .line 2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->willNotDraw()Z

    move-result v0

    if-nez v0, :cond_0

    .line 3
    sget-object v0, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    .line 5
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->listeners:Ljava/util/List;

    if-eqz v0, :cond_2

    const/4 v1, 0x0

    .line 6
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    if-ge v1, v0, :cond_2

    .line 7
    iget-object v2, p0, Lcom/google/android/material/appbar/AppBarLayout;->listeners:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/appbar/AppBarLayout$BaseOnOffsetChangedListener;

    if-eqz v2, :cond_1

    .line 8
    invoke-interface {v2, p0, p1}, Lcom/google/android/material/appbar/AppBarLayout$BaseOnOffsetChangedListener;->onOffsetChanged(Lcom/google/android/material/appbar/AppBarLayout;I)V

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public setElevation(F)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setElevation(F)V

    .line 2
    invoke-static {p0, p1}, Landroidx/recyclerview/R$attr;->setElevation(Landroid/view/View;F)V

    return-void
.end method

.method public final setExpanded(ZZZ)V
    .locals 1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x2

    :goto_0
    const/4 v0, 0x0

    if-eqz p2, :cond_1

    const/4 p2, 0x4

    goto :goto_1

    :cond_1
    move p2, v0

    :goto_1
    or-int/2addr p1, p2

    if-eqz p3, :cond_2

    const/16 v0, 0x8

    :cond_2
    or-int/2addr p1, v0

    .line 1
    iput p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->pendingAction:I

    .line 2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestLayout()V

    return-void
.end method

.method public setLiftedState(Z)Z
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->lifted:Z

    const/4 v1, 0x0

    if-eq v0, p1, :cond_4

    .line 2
    iput-boolean p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->lifted:Z

    .line 3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->refreshDrawableState()V

    .line 4
    iget-boolean v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->liftOnScroll:Z

    const/4 v2, 0x1

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/google/android/material/shape/MaterialShapeDrawable;

    if-eqz v0, :cond_3

    .line 5
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/shape/MaterialShapeDrawable;

    .line 6
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0700ba

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    const/4 v4, 0x0

    if-eqz p1, :cond_0

    move v5, v4

    goto :goto_0

    :cond_0
    move v5, v3

    :goto_0
    if-eqz p1, :cond_1

    goto :goto_1

    :cond_1
    move v3, v4

    .line 7
    :goto_1
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->elevationOverlayAnimator:Landroid/animation/ValueAnimator;

    if-eqz p1, :cond_2

    .line 8
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_2
    const/4 p1, 0x2

    new-array p1, p1, [F

    aput v5, p1, v1

    aput v3, p1, v2

    .line 9
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->elevationOverlayAnimator:Landroid/animation/ValueAnimator;

    .line 10
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v3, 0x7f0b0002

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-long v3, v1

    .line 11
    invoke-virtual {p1, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 12
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->elevationOverlayAnimator:Landroid/animation/ValueAnimator;

    sget-object v1, Lcom/google/android/material/animation/AnimationUtils;->LINEAR_INTERPOLATOR:Landroid/animation/TimeInterpolator;

    invoke-virtual {p1, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 13
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->elevationOverlayAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/google/android/material/appbar/AppBarLayout$2;

    invoke-direct {v1, p0, v0}, Lcom/google/android/material/appbar/AppBarLayout$2;-><init>(Lcom/google/android/material/appbar/AppBarLayout;Lcom/google/android/material/shape/MaterialShapeDrawable;)V

    invoke-virtual {p1, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 14
    iget-object p0, p0, Lcom/google/android/material/appbar/AppBarLayout;->elevationOverlayAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    :cond_3
    return v2

    :cond_4
    return v1
.end method

.method public setOrientation(I)V
    .locals 1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    return-void

    .line 2
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "AppBarLayout is always vertical and does not support horizontal orientation"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public setVisibility(I)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    const/4 v0, 0x0

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    move p1, v0

    .line 2
    :goto_0
    iget-object p0, p0, Lcom/google/android/material/appbar/AppBarLayout;->statusBarForeground:Landroid/graphics/drawable/Drawable;

    if-eqz p0, :cond_1

    .line 3
    invoke-virtual {p0, p1, v0}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    :cond_1
    return-void
.end method

.method public shouldLift(Landroid/view/View;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->liftOnScrollTargetView:Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-nez v0, :cond_2

    iget v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->liftOnScrollTargetViewId:I

    if-eq v0, v2, :cond_2

    if-eqz p1, :cond_0

    .line 2
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    if-nez v0, :cond_1

    .line 3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    instance-of v3, v3, Landroid/view/ViewGroup;

    if-eqz v3, :cond_1

    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget v3, p0, Lcom/google/android/material/appbar/AppBarLayout;->liftOnScrollTargetViewId:I

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    :cond_1
    if-eqz v0, :cond_2

    .line 5
    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v3, p0, Lcom/google/android/material/appbar/AppBarLayout;->liftOnScrollTargetView:Ljava/lang/ref/WeakReference;

    .line 6
    :cond_2
    iget-object p0, p0, Lcom/google/android/material/appbar/AppBarLayout;->liftOnScrollTargetView:Ljava/lang/ref/WeakReference;

    if-eqz p0, :cond_3

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v1, p0

    check-cast v1, Landroid/view/View;

    :cond_3
    if-nez v1, :cond_4

    goto :goto_1

    :cond_4
    move-object p1, v1

    :goto_1
    if-eqz p1, :cond_6

    .line 7
    invoke-virtual {p1, v2}, Landroid/view/View;->canScrollVertically(I)Z

    move-result p0

    if-nez p0, :cond_5

    invoke-virtual {p1}, Landroid/view/View;->getScrollY()I

    move-result p0

    if-lez p0, :cond_6

    :cond_5
    const/4 p0, 0x1

    goto :goto_2

    :cond_6
    const/4 p0, 0x0

    :goto_2
    return p0
.end method

.method public final shouldOffsetFirstChild()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_0

    .line 2
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v2, 0x8

    if-eq v0, v2, :cond_0

    sget-object v0, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getFitsSystemWindows()Z

    move-result p0

    if-nez p0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public final updateWillNotDraw()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->statusBarForeground:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->getTopInset()I

    move-result v0

    if-lez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    xor-int/2addr v0, v1

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setWillNotDraw(Z)V

    return-void
.end method

.method public verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object p0, p0, Lcom/google/android/material/appbar/AppBarLayout;->statusBarForeground:Landroid/graphics/drawable/Drawable;

    if-ne p1, p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method
