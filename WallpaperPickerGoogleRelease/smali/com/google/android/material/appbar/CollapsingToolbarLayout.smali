.class public Lcom/google/android/material/appbar/CollapsingToolbarLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/appbar/CollapsingToolbarLayout$OffsetUpdateListener;,
        Lcom/google/android/material/appbar/CollapsingToolbarLayout$LayoutParams;
    }
.end annotation


# instance fields
.field public final collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

.field public collapsingTitleEnabled:Z

.field public contentScrim:Landroid/graphics/drawable/Drawable;

.field public currentOffset:I

.field public drawCollapsingTitle:Z

.field public dummyView:Landroid/view/View;

.field public final elevationOverlayProvider:Lcom/google/android/material/elevation/ElevationOverlayProvider;

.field public expandedMarginBottom:I

.field public expandedMarginEnd:I

.field public expandedMarginStart:I

.field public expandedMarginTop:I

.field public extraMultilineHeight:I

.field public extraMultilineHeightEnabled:Z

.field public forceApplySystemWindowInsetTop:Z

.field public lastInsets:Landroidx/core/view/WindowInsetsCompat;

.field public onOffsetChangedListener:Lcom/google/android/material/appbar/AppBarLayout$OnOffsetChangedListener;

.field public refreshToolbar:Z

.field public scrimAlpha:I

.field public scrimAnimationDuration:J

.field public scrimAnimator:Landroid/animation/ValueAnimator;

.field public scrimVisibleHeightTrigger:I

.field public scrimsAreShown:Z

.field public statusBarScrim:Landroid/graphics/drawable/Drawable;

.field public titleCollapseMode:I

.field public final tmpRect:Landroid/graphics/Rect;

.field public toolbar:Landroid/view/ViewGroup;

.field public toolbarDirectChild:Landroid/view/View;

.field public toolbarId:I

.field public topInsetApplied:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const v0, 0x7f0400bf

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v7, p2

    move/from16 v8, p3

    const v9, 0x7f1202ac

    move-object/from16 v1, p1

    .line 3
    invoke-static {v1, v7, v8, v9}, Lcom/google/android/material/theme/overlay/MaterialThemeOverlay;->wrap(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, v7, v8}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v10, 0x1

    .line 4
    iput-boolean v10, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->refreshToolbar:Z

    .line 5
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->tmpRect:Landroid/graphics/Rect;

    const/4 v11, -0x1

    .line 6
    iput v11, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimVisibleHeightTrigger:I

    const/4 v12, 0x0

    .line 7
    iput v12, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->topInsetApplied:I

    .line 8
    iput v12, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->extraMultilineHeight:I

    .line 9
    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v13

    .line 10
    new-instance v14, Lcom/google/android/material/internal/CollapsingTextHelper;

    invoke-direct {v14, v0}, Lcom/google/android/material/internal/CollapsingTextHelper;-><init>(Landroid/view/View;)V

    iput-object v14, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    .line 11
    sget-object v1, Lcom/google/android/material/animation/AnimationUtils;->DECELERATE_INTERPOLATOR:Landroid/animation/TimeInterpolator;

    .line 12
    iput-object v1, v14, Lcom/google/android/material/internal/CollapsingTextHelper;->textSizeInterpolator:Landroid/animation/TimeInterpolator;

    .line 13
    invoke-virtual {v14, v12}, Lcom/google/android/material/internal/CollapsingTextHelper;->recalculate(Z)V

    .line 14
    iput-boolean v12, v14, Lcom/google/android/material/internal/CollapsingTextHelper;->isRtlTextDirectionHeuristicsEnabled:Z

    .line 15
    new-instance v15, Lcom/google/android/material/elevation/ElevationOverlayProvider;

    invoke-direct {v15, v13}, Lcom/google/android/material/elevation/ElevationOverlayProvider;-><init>(Landroid/content/Context;)V

    iput-object v15, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->elevationOverlayProvider:Lcom/google/android/material/elevation/ElevationOverlayProvider;

    .line 16
    sget-object v6, Lcom/google/android/material/R$styleable;->CollapsingToolbarLayout:[I

    new-array v5, v12, [I

    .line 17
    invoke-static {v13, v7, v8, v9}, Lcom/google/android/material/internal/ThemeEnforcement;->checkCompatibleTheme(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const v16, 0x7f1202ac

    move-object v1, v13

    move-object/from16 v2, p2

    move-object v3, v6

    move/from16 v4, p3

    move-object/from16 v17, v5

    move/from16 v5, v16

    move-object v11, v6

    move-object/from16 v6, v17

    .line 18
    invoke-static/range {v1 .. v6}, Lcom/google/android/material/internal/ThemeEnforcement;->checkTextAppearance(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)V

    .line 19
    invoke-virtual {v13, v7, v11, v8, v9}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    const/4 v2, 0x3

    const v3, 0x800053

    .line 20
    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    .line 21
    invoke-virtual {v14, v2}, Lcom/google/android/material/internal/CollapsingTextHelper;->setExpandedTextGravity(I)V

    const v2, 0x800013

    .line 22
    invoke-virtual {v1, v12, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    .line 23
    invoke-virtual {v14, v2}, Lcom/google/android/material/internal/CollapsingTextHelper;->setCollapsedTextGravity(I)V

    const/4 v2, 0x4

    .line 24
    invoke-virtual {v1, v2, v12}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->expandedMarginBottom:I

    iput v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->expandedMarginEnd:I

    iput v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->expandedMarginTop:I

    iput v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->expandedMarginStart:I

    const/4 v2, 0x7

    .line 25
    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 26
    invoke-virtual {v1, v2, v12}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->expandedMarginStart:I

    :cond_0
    const/4 v2, 0x6

    .line 27
    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 28
    invoke-virtual {v1, v2, v12}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->expandedMarginEnd:I

    :cond_1
    const/16 v2, 0x8

    .line 29
    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 30
    invoke-virtual {v1, v2, v12}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->expandedMarginTop:I

    :cond_2
    const/4 v2, 0x5

    .line 31
    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 32
    invoke-virtual {v1, v2, v12}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->expandedMarginBottom:I

    :cond_3
    const/16 v2, 0x12

    .line 33
    invoke-virtual {v1, v2, v10}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->collapsingTitleEnabled:Z

    const/16 v2, 0x10

    .line 34
    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    .line 35
    invoke-virtual {v14, v2}, Lcom/google/android/material/internal/CollapsingTextHelper;->setText(Ljava/lang/CharSequence;)V

    .line 36
    iget-boolean v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->collapsingTitleEnabled:Z

    const/4 v3, 0x0

    if-eqz v2, :cond_4

    .line 37
    iget-object v2, v14, Lcom/google/android/material/internal/CollapsingTextHelper;->text:Ljava/lang/CharSequence;

    goto :goto_0

    :cond_4
    move-object v2, v3

    .line 38
    :goto_0
    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    const v2, 0x7f1201b3

    .line 39
    invoke-virtual {v14, v2}, Lcom/google/android/material/internal/CollapsingTextHelper;->setExpandedTextAppearance(I)V

    const v2, 0x7f120198

    .line 40
    invoke-virtual {v14, v2}, Lcom/google/android/material/internal/CollapsingTextHelper;->setCollapsedTextAppearance(I)V

    const/16 v2, 0x9

    .line 41
    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 42
    invoke-virtual {v1, v2, v12}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    .line 43
    invoke-virtual {v14, v2}, Lcom/google/android/material/internal/CollapsingTextHelper;->setExpandedTextAppearance(I)V

    .line 44
    :cond_5
    invoke-virtual {v1, v10}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 45
    invoke-virtual {v1, v10, v12}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    .line 46
    invoke-virtual {v14, v2}, Lcom/google/android/material/internal/CollapsingTextHelper;->setCollapsedTextAppearance(I)V

    :cond_6
    const/16 v2, 0xe

    const/4 v4, -0x1

    .line 47
    invoke-virtual {v1, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimVisibleHeightTrigger:I

    const/16 v2, 0xc

    .line 48
    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 49
    invoke-virtual {v1, v2, v10}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    .line 50
    iget v4, v14, Lcom/google/android/material/internal/CollapsingTextHelper;->maxLines:I

    if-eq v2, v4, :cond_7

    .line 51
    iput v2, v14, Lcom/google/android/material/internal/CollapsingTextHelper;->maxLines:I

    .line 52
    invoke-virtual {v14}, Lcom/google/android/material/internal/CollapsingTextHelper;->clearTexture()V

    .line 53
    invoke-virtual {v14, v12}, Lcom/google/android/material/internal/CollapsingTextHelper;->recalculate(Z)V

    :cond_7
    const/16 v2, 0xd

    const/16 v4, 0x258

    .line 54
    invoke-virtual {v1, v2, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    int-to-long v4, v2

    iput-wide v4, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimAnimationDuration:J

    const/4 v2, 0x2

    .line 55
    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->setContentScrim(Landroid/graphics/drawable/Drawable;)V

    const/16 v2, 0xf

    .line 56
    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 57
    iget-object v4, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->statusBarScrim:Landroid/graphics/drawable/Drawable;

    if-eq v4, v2, :cond_d

    if-eqz v4, :cond_8

    .line 58
    invoke-virtual {v4, v3}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    :cond_8
    if-eqz v2, :cond_9

    .line 59
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    :cond_9
    iput-object v3, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->statusBarScrim:Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_c

    .line 60
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 61
    iget-object v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->statusBarScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getDrawableState()[I

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 62
    :cond_a
    iget-object v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->statusBarScrim:Landroid/graphics/drawable/Drawable;

    sget-object v3, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 63
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getLayoutDirection()I

    move-result v3

    .line 64
    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setLayoutDirection(I)Z

    .line 65
    iget-object v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->statusBarScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v3

    if-nez v3, :cond_b

    goto :goto_1

    :cond_b
    move v10, v12

    :goto_1
    invoke-virtual {v2, v10, v12}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 66
    iget-object v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->statusBarScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, v0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 67
    iget-object v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->statusBarScrim:Landroid/graphics/drawable/Drawable;

    iget v3, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimAlpha:I

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 68
    :cond_c
    sget-object v2, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 69
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    :cond_d
    const/16 v2, 0x11

    .line 70
    invoke-virtual {v1, v2, v12}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    .line 71
    iput v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->titleCollapseMode:I

    .line 72
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->isTitleCollapseFadeMode()Z

    move-result v2

    .line 73
    iput-boolean v2, v14, Lcom/google/android/material/internal/CollapsingTextHelper;->fadeModeEnabled:Z

    .line 74
    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    .line 75
    instance-of v4, v3, Lcom/google/android/material/appbar/AppBarLayout;

    if-eqz v4, :cond_e

    .line 76
    check-cast v3, Lcom/google/android/material/appbar/AppBarLayout;

    .line 77
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->isTitleCollapseFadeMode()Z

    move-result v4

    if-eqz v4, :cond_e

    .line 78
    iput-boolean v12, v3, Lcom/google/android/material/appbar/AppBarLayout;->liftOnScroll:Z

    :cond_e
    if-eqz v2, :cond_f

    .line 79
    iget-object v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->contentScrim:Landroid/graphics/drawable/Drawable;

    if-nez v2, :cond_f

    .line 80
    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0700ba

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    .line 81
    iget v3, v15, Lcom/google/android/material/elevation/ElevationOverlayProvider;->colorSurface:I

    invoke-virtual {v15, v3, v2}, Lcom/google/android/material/elevation/ElevationOverlayProvider;->compositeOverlayIfNeeded(IF)I

    move-result v2

    .line 82
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v3, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v3}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->setContentScrim(Landroid/graphics/drawable/Drawable;)V

    :cond_f
    const/16 v2, 0x13

    const/4 v3, -0x1

    .line 83
    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    iput v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->toolbarId:I

    const/16 v2, 0xb

    .line 84
    invoke-virtual {v1, v2, v12}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->forceApplySystemWindowInsetTop:Z

    const/16 v2, 0xa

    .line 85
    invoke-virtual {v1, v2, v12}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->extraMultilineHeightEnabled:Z

    .line 86
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 87
    invoke-virtual {v0, v12}, Landroid/widget/FrameLayout;->setWillNotDraw(Z)V

    .line 88
    new-instance v1, Lcom/google/android/material/appbar/CollapsingToolbarLayout$1;

    invoke-direct {v1, v0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout$1;-><init>(Lcom/google/android/material/appbar/CollapsingToolbarLayout;)V

    sget-object v2, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 89
    invoke-static {v0, v1}, Landroidx/core/view/ViewCompat$Api21Impl;->setOnApplyWindowInsetsListener(Landroid/view/View;Landroidx/core/view/OnApplyWindowInsetsListener;)V

    return-void
.end method

.method public static getHeightWithMargins(Landroid/view/View;)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 2
    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v1, :cond_0

    .line 3
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p0

    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr p0, v1

    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr p0, v0

    return p0

    .line 5
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p0

    return p0
.end method

.method public static getViewOffsetHelper(Landroid/view/View;)Lcom/google/android/material/appbar/ViewOffsetHelper;
    .locals 2

    const v0, 0x7f0a0282

    .line 1
    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/appbar/ViewOffsetHelper;

    if-nez v1, :cond_0

    .line 2
    new-instance v1, Lcom/google/android/material/appbar/ViewOffsetHelper;

    invoke-direct {v1, p0}, Lcom/google/android/material/appbar/ViewOffsetHelper;-><init>(Landroid/view/View;)V

    .line 3
    invoke-virtual {p0, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :cond_0
    return-object v1
.end method


# virtual methods
.method public checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/google/android/material/appbar/CollapsingToolbarLayout$LayoutParams;

    return p0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->ensureToolbar()V

    .line 3
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->toolbar:Landroid/view/ViewGroup;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->contentScrim:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    iget v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimAlpha:I

    if-lez v1, :cond_0

    .line 4
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 5
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->contentScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 6
    :cond_0
    iget-boolean v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->collapsingTitleEnabled:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->drawCollapsingTitle:Z

    if-eqz v0, :cond_2

    .line 7
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->toolbar:Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->contentScrim:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimAlpha:I

    if-lez v0, :cond_1

    .line 8
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->isTitleCollapseFadeMode()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    .line 9
    iget v1, v0, Lcom/google/android/material/internal/CollapsingTextHelper;->expandedFraction:F

    .line 10
    iget v0, v0, Lcom/google/android/material/internal/CollapsingTextHelper;->fadeModeThresholdFraction:F

    cmpg-float v0, v1, v0

    if-gez v0, :cond_1

    .line 11
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    .line 12
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->contentScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    sget-object v2, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;Landroid/graphics/Region$Op;)Z

    .line 13
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    invoke-virtual {v1, p1}, Lcom/google/android/material/internal/CollapsingTextHelper;->draw(Landroid/graphics/Canvas;)V

    .line 14
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    goto :goto_0

    .line 15
    :cond_1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    invoke-virtual {v0, p1}, Lcom/google/android/material/internal/CollapsingTextHelper;->draw(Landroid/graphics/Canvas;)V

    .line 16
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->statusBarScrim:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimAlpha:I

    if-lez v0, :cond_4

    .line 17
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->lastInsets:Landroidx/core/view/WindowInsetsCompat;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroidx/core/view/WindowInsetsCompat;->getSystemWindowInsetTop()I

    move-result v0

    goto :goto_1

    :cond_3
    move v0, v1

    :goto_1
    if-lez v0, :cond_4

    .line 18
    iget-object v2, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->statusBarScrim:Landroid/graphics/drawable/Drawable;

    iget v3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->currentOffset:I

    neg-int v3, v3

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v4

    iget v5, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->currentOffset:I

    sub-int/2addr v0, v5

    invoke-virtual {v2, v1, v3, v4, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 19
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->statusBarScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 20
    iget-object p0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->statusBarScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_4
    return-void
.end method

.method public drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->contentScrim:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_3

    iget v3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimAlpha:I

    if-lez v3, :cond_3

    .line 2
    iget-object v3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->toolbarDirectChild:Landroid/view/View;

    if-eqz v3, :cond_1

    if-ne v3, p0, :cond_0

    goto :goto_0

    :cond_0
    if-ne p2, v3, :cond_2

    goto :goto_1

    :cond_1
    :goto_0
    iget-object v3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->toolbar:Landroid/view/ViewGroup;

    if-ne p2, v3, :cond_2

    :goto_1
    move v3, v1

    goto :goto_2

    :cond_2
    move v3, v2

    :goto_2
    if-eqz v3, :cond_3

    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v4

    invoke-virtual {p0, v0, p2, v3, v4}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->updateContentScrimBounds(Landroid/graphics/drawable/Drawable;Landroid/view/View;II)V

    .line 4
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->contentScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget v3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimAlpha:I

    invoke-virtual {v0, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 5
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->contentScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    move v0, v1

    goto :goto_3

    :cond_3
    move v0, v2

    .line 6
    :goto_3
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result p0

    if-nez p0, :cond_5

    if-eqz v0, :cond_4

    goto :goto_4

    :cond_4
    move v1, v2

    :cond_5
    :goto_4
    return v1
.end method

.method public drawableStateChanged()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->drawableStateChanged()V

    .line 2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getDrawableState()[I

    move-result-object v0

    .line 3
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->statusBarScrim:Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 4
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 5
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result v1

    or-int/2addr v2, v1

    .line 6
    :cond_0
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->contentScrim:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_1

    .line 7
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 8
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result v1

    or-int/2addr v2, v1

    .line 9
    :cond_1
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    if-eqz v1, :cond_2

    .line 10
    invoke-virtual {v1, v0}, Lcom/google/android/material/internal/CollapsingTextHelper;->setState([I)Z

    move-result v0

    or-int/2addr v2, v0

    :cond_2
    if-eqz v2, :cond_3

    .line 11
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    :cond_3
    return-void
.end method

.method public final ensureToolbar()V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->refreshToolbar:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->toolbar:Landroid/view/ViewGroup;

    .line 3
    iput-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->toolbarDirectChild:Landroid/view/View;

    .line 4
    iget v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->toolbarId:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_3

    .line 5
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    iput-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->toolbar:Landroid/view/ViewGroup;

    if-eqz v1, :cond_3

    .line 6
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    :goto_0
    if-eq v3, p0, :cond_2

    if-eqz v3, :cond_2

    .line 7
    instance-of v4, v3, Landroid/view/View;

    if-eqz v4, :cond_1

    .line 8
    move-object v1, v3

    check-cast v1, Landroid/view/View;

    .line 9
    :cond_1
    invoke-interface {v3}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    goto :goto_0

    .line 10
    :cond_2
    iput-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->toolbarDirectChild:Landroid/view/View;

    .line 11
    :cond_3
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->toolbar:Landroid/view/ViewGroup;

    const/4 v3, 0x0

    if-nez v1, :cond_8

    .line 12
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result v1

    move v4, v3

    :goto_1
    if-ge v4, v1, :cond_7

    .line 13
    invoke-virtual {p0, v4}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 14
    instance-of v6, v5, Landroidx/appcompat/widget/Toolbar;

    if-nez v6, :cond_5

    instance-of v6, v5, Landroid/widget/Toolbar;

    if-eqz v6, :cond_4

    goto :goto_2

    :cond_4
    move v6, v3

    goto :goto_3

    :cond_5
    :goto_2
    const/4 v6, 0x1

    :goto_3
    if-eqz v6, :cond_6

    .line 15
    move-object v0, v5

    check-cast v0, Landroid/view/ViewGroup;

    goto :goto_4

    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 16
    :cond_7
    :goto_4
    iput-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->toolbar:Landroid/view/ViewGroup;

    .line 17
    :cond_8
    iget-boolean v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->collapsingTitleEnabled:Z

    if-nez v0, :cond_9

    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->dummyView:Landroid/view/View;

    if-eqz v0, :cond_9

    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 19
    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_9

    .line 20
    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->dummyView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 21
    :cond_9
    iget-boolean v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->collapsingTitleEnabled:Z

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->toolbar:Landroid/view/ViewGroup;

    if-eqz v0, :cond_b

    .line 22
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->dummyView:Landroid/view/View;

    if-nez v0, :cond_a

    .line 23
    new-instance v0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->dummyView:Landroid/view/View;

    .line 24
    :cond_a
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->dummyView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_b

    .line 25
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->toolbar:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->dummyView:Landroid/view/View;

    invoke-virtual {v0, v1, v2, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 26
    :cond_b
    iput-boolean v3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->refreshToolbar:Z

    return-void
.end method

.method public generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .line 1
    new-instance p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout$LayoutParams;

    const/4 v0, -0x1

    invoke-direct {p0, v0, v0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout$LayoutParams;-><init>(II)V

    return-object p0
.end method

.method public generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;
    .locals 1

    .line 2
    new-instance p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout$LayoutParams;

    const/4 v0, -0x1

    invoke-direct {p0, v0, v0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout$LayoutParams;-><init>(II)V

    return-object p0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method public generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 3
    new-instance p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout$LayoutParams;

    invoke-direct {p0, p1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object p0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/FrameLayout$LayoutParams;
    .locals 1

    .line 2
    new-instance v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public final getMaxOffsetForPinChild(Landroid/view/View;)I
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->getViewOffsetHelper(Landroid/view/View;)Lcom/google/android/material/appbar/ViewOffsetHelper;

    move-result-object v0

    .line 2
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/appbar/CollapsingToolbarLayout$LayoutParams;

    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    move-result p0

    .line 4
    iget v0, v0, Lcom/google/android/material/appbar/ViewOffsetHelper;->layoutTop:I

    sub-int/2addr p0, v0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    sub-int/2addr p0, p1

    iget p1, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    sub-int/2addr p0, p1

    return p0
.end method

.method public getScrimVisibleHeightTrigger()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimVisibleHeightTrigger:I

    if-ltz v0, :cond_0

    .line 2
    iget v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->topInsetApplied:I

    add-int/2addr v0, v1

    iget p0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->extraMultilineHeight:I

    add-int/2addr v0, p0

    return v0

    .line 3
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->lastInsets:Landroidx/core/view/WindowInsetsCompat;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroidx/core/view/WindowInsetsCompat;->getSystemWindowInsetTop()I

    move-result v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 4
    :goto_0
    sget-object v1, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getMinimumHeight()I

    move-result v1

    if-lez v1, :cond_2

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v1, v0

    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    move-result p0

    invoke-static {v1, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    return p0

    .line 7
    :cond_2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    move-result p0

    div-int/lit8 p0, p0, 0x3

    return p0
.end method

.method public final isTitleCollapseFadeMode()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->titleCollapseMode:I

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onAttachedToWindow()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 3
    instance-of v1, v0, Lcom/google/android/material/appbar/AppBarLayout;

    if-eqz v1, :cond_4

    .line 4
    check-cast v0, Lcom/google/android/material/appbar/AppBarLayout;

    .line 5
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->isTitleCollapseFadeMode()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    .line 6
    iput-boolean v1, v0, Lcom/google/android/material/appbar/AppBarLayout;->liftOnScroll:Z

    .line 7
    :cond_0
    sget-object v1, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 8
    invoke-virtual {v0}, Landroid/view/View;->getFitsSystemWindows()Z

    move-result v1

    .line 9
    invoke-virtual {p0, v1}, Landroid/view/View;->setFitsSystemWindows(Z)V

    .line 10
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->onOffsetChangedListener:Lcom/google/android/material/appbar/AppBarLayout$OnOffsetChangedListener;

    if-nez v1, :cond_1

    .line 11
    new-instance v1, Lcom/google/android/material/appbar/CollapsingToolbarLayout$OffsetUpdateListener;

    invoke-direct {v1, p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout$OffsetUpdateListener;-><init>(Lcom/google/android/material/appbar/CollapsingToolbarLayout;)V

    iput-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->onOffsetChangedListener:Lcom/google/android/material/appbar/AppBarLayout$OnOffsetChangedListener;

    .line 12
    :cond_1
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->onOffsetChangedListener:Lcom/google/android/material/appbar/AppBarLayout$OnOffsetChangedListener;

    .line 13
    iget-object v2, v0, Lcom/google/android/material/appbar/AppBarLayout;->listeners:Ljava/util/List;

    if-nez v2, :cond_2

    .line 14
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v0, Lcom/google/android/material/appbar/AppBarLayout;->listeners:Ljava/util/List;

    :cond_2
    if-eqz v1, :cond_3

    .line 15
    iget-object v2, v0, Lcom/google/android/material/appbar/AppBarLayout;->listeners:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 16
    iget-object v0, v0, Lcom/google/android/material/appbar/AppBarLayout;->listeners:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->requestApplyInsets()V

    :cond_4
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->onOffsetChangedListener:Lcom/google/android/material/appbar/AppBarLayout$OnOffsetChangedListener;

    if-eqz v1, :cond_0

    instance-of v2, v0, Lcom/google/android/material/appbar/AppBarLayout;

    if-eqz v2, :cond_0

    .line 3
    check-cast v0, Lcom/google/android/material/appbar/AppBarLayout;

    .line 4
    iget-object v0, v0, Lcom/google/android/material/appbar/AppBarLayout;->listeners:Ljava/util/List;

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    .line 5
    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 6
    :cond_0
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 8

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 2
    iget-object p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->lastInsets:Landroidx/core/view/WindowInsetsCompat;

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 3
    invoke-virtual {p1}, Landroidx/core/view/WindowInsetsCompat;->getSystemWindowInsetTop()I

    move-result p1

    .line 4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result v1

    move v2, v0

    :goto_0
    if-ge v2, v1, :cond_1

    .line 5
    invoke-virtual {p0, v2}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 6
    sget-object v4, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 7
    invoke-virtual {v3}, Landroid/view/View;->getFitsSystemWindows()Z

    move-result v4

    if-nez v4, :cond_0

    .line 8
    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v4

    if-ge v4, p1, :cond_0

    .line 9
    invoke-virtual {v3, p1}, Landroid/view/View;->offsetTopAndBottom(I)V

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 10
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result p1

    move v1, v0

    :goto_1
    if-ge v1, p1, :cond_2

    .line 11
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->getViewOffsetHelper(Landroid/view/View;)Lcom/google/android/material/appbar/ViewOffsetHelper;

    move-result-object v2

    .line 12
    iget-object v3, v2, Lcom/google/android/material/appbar/ViewOffsetHelper;->view:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v3

    iput v3, v2, Lcom/google/android/material/appbar/ViewOffsetHelper;->layoutTop:I

    .line 13
    iget-object v3, v2, Lcom/google/android/material/appbar/ViewOffsetHelper;->view:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    move-result v3

    iput v3, v2, Lcom/google/android/material/appbar/ViewOffsetHelper;->layoutLeft:I

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    const/4 v7, 0x0

    move-object v2, p0

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    .line 14
    invoke-virtual/range {v2 .. v7}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->updateTextBounds(IIIIZ)V

    .line 15
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->updateTitleFromToolbarIfNeeded()V

    .line 16
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->updateScrimVisibility()V

    .line 17
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result p1

    :goto_2
    if-ge v0, p1, :cond_3

    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->getViewOffsetHelper(Landroid/view/View;)Lcom/google/android/material/appbar/ViewOffsetHelper;

    move-result-object p2

    invoke-virtual {p2}, Lcom/google/android/material/appbar/ViewOffsetHelper;->applyOffsets()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_3
    return-void
.end method

.method public onMeasure(II)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->ensureToolbar()V

    .line 2
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 3
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p2

    .line 4
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->lastInsets:Landroidx/core/view/WindowInsetsCompat;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/core/view/WindowInsetsCompat;->getSystemWindowInsetTop()I

    move-result v0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    const/high16 v2, 0x40000000    # 2.0f

    if-eqz p2, :cond_1

    .line 5
    iget-boolean p2, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->forceApplySystemWindowInsetTop:Z

    if-eqz p2, :cond_2

    :cond_1
    if-lez v0, :cond_2

    .line 6
    iput v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->topInsetApplied:I

    .line 7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result p2

    add-int/2addr p2, v0

    .line 8
    invoke-static {p2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    .line 9
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 10
    :cond_2
    iget-boolean p2, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->extraMultilineHeightEnabled:Z

    if-eqz p2, :cond_4

    iget-object p2, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    .line 11
    iget p2, p2, Lcom/google/android/material/internal/CollapsingTextHelper;->maxLines:I

    const/4 v0, 0x1

    if-le p2, v0, :cond_4

    .line 12
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->updateTitleFromToolbarIfNeeded()V

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 13
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result v6

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result v7

    const/4 v8, 0x1

    move-object v3, p0

    invoke-virtual/range {v3 .. v8}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->updateTextBounds(IIIIZ)V

    .line 14
    iget-object p2, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    .line 15
    iget-object p2, p2, Lcom/google/android/material/internal/CollapsingTextHelper;->textLayout:Landroid/text/StaticLayout;

    if-eqz p2, :cond_3

    invoke-virtual {p2}, Landroid/text/StaticLayout;->getLineCount()I

    move-result v1

    :cond_3
    if-le v1, v0, :cond_4

    .line 16
    iget-object p2, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    .line 17
    iget-object v3, p2, Lcom/google/android/material/internal/CollapsingTextHelper;->tmpPaint:Landroid/text/TextPaint;

    .line 18
    iget v4, p2, Lcom/google/android/material/internal/CollapsingTextHelper;->expandedTextSize:F

    invoke-virtual {v3, v4}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 19
    iget-object v4, p2, Lcom/google/android/material/internal/CollapsingTextHelper;->expandedTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v3, v4}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 20
    iget v4, p2, Lcom/google/android/material/internal/CollapsingTextHelper;->expandedLetterSpacing:F

    invoke-virtual {v3, v4}, Landroid/text/TextPaint;->setLetterSpacing(F)V

    .line 21
    iget-object v3, p2, Lcom/google/android/material/internal/CollapsingTextHelper;->tmpPaint:Landroid/text/TextPaint;

    invoke-virtual {v3}, Landroid/text/TextPaint;->ascent()F

    move-result v3

    neg-float v3, v3

    iget-object p2, p2, Lcom/google/android/material/internal/CollapsingTextHelper;->tmpPaint:Landroid/text/TextPaint;

    invoke-virtual {p2}, Landroid/text/TextPaint;->descent()F

    move-result p2

    add-float/2addr p2, v3

    .line 22
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    sub-int/2addr v1, v0

    mul-int/2addr v1, p2

    .line 23
    iput v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->extraMultilineHeight:I

    .line 24
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result p2

    iget v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->extraMultilineHeight:I

    add-int/2addr p2, v0

    .line 25
    invoke-static {p2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    .line 26
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 27
    :cond_4
    iget-object p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->toolbar:Landroid/view/ViewGroup;

    if-eqz p1, :cond_7

    .line 28
    iget-object p2, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->toolbarDirectChild:Landroid/view/View;

    if-eqz p2, :cond_6

    if-ne p2, p0, :cond_5

    goto :goto_1

    .line 29
    :cond_5
    invoke-static {p2}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->getHeightWithMargins(Landroid/view/View;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setMinimumHeight(I)V

    goto :goto_2

    .line 30
    :cond_6
    :goto_1
    invoke-static {p1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->getHeightWithMargins(Landroid/view/View;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setMinimumHeight(I)V

    :cond_7
    :goto_2
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    iget-object p3, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->contentScrim:Landroid/graphics/drawable/Drawable;

    if-eqz p3, :cond_0

    .line 3
    iget-object p4, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->toolbar:Landroid/view/ViewGroup;

    invoke-virtual {p0, p3, p4, p1, p2}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->updateContentScrimBounds(Landroid/graphics/drawable/Drawable;Landroid/view/View;II)V

    :cond_0
    return-void
.end method

.method public setContentScrim(Landroid/graphics/drawable/Drawable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->contentScrim:Landroid/graphics/drawable/Drawable;

    if-eq v0, p1, :cond_3

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    :cond_0
    if-eqz p1, :cond_1

    .line 3
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    :cond_1
    iput-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->contentScrim:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_2

    .line 4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    move-result p1

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v0

    .line 5
    iget-object v2, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->toolbar:Landroid/view/ViewGroup;

    invoke-virtual {p0, v1, v2, p1, v0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->updateContentScrimBounds(Landroid/graphics/drawable/Drawable;Landroid/view/View;II)V

    .line 6
    iget-object p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->contentScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 7
    iget-object p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->contentScrim:Landroid/graphics/drawable/Drawable;

    iget v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimAlpha:I

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 8
    :cond_2
    sget-object p1, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    :cond_3
    return-void
.end method

.method public setScrimAlpha(I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimAlpha:I

    if-eq p1, v0, :cond_1

    .line 2
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->contentScrim:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    .line 3
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->toolbar:Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 4
    sget-object v1, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 5
    invoke-virtual {v0}, Landroid/view/View;->postInvalidateOnAnimation()V

    .line 6
    :cond_0
    iput p1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimAlpha:I

    .line 7
    sget-object p1, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    :cond_1
    return-void
.end method

.method public setVisibility(I)V
    .locals 2

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
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->statusBarScrim:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v1

    if-eq v1, p1, :cond_1

    .line 3
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->statusBarScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1, v0}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 4
    :cond_1
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->contentScrim:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v1

    if-eq v1, p1, :cond_2

    .line 5
    iget-object p0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->contentScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1, v0}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    :cond_2
    return-void
.end method

.method public final updateContentScrimBounds(Landroid/graphics/drawable/Drawable;Landroid/view/View;II)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->isTitleCollapseFadeMode()Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p2, :cond_0

    iget-boolean p0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->collapsingTitleEnabled:Z

    if-eqz p0, :cond_0

    .line 2
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    move-result p4

    :cond_0
    const/4 p0, 0x0

    .line 3
    invoke-virtual {p1, p0, p0, p3, p4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    return-void
.end method

.method public final updateScrimVisibility()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->contentScrim:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->statusBarScrim:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 2
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v0

    iget v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->currentOffset:I

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->getScrimVisibleHeightTrigger()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ge v0, v1, :cond_1

    move v0, v2

    goto :goto_0

    :cond_1
    move v0, v3

    .line 3
    :goto_0
    sget-object v1, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->isLaidOut()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isInEditMode()Z

    move-result v1

    if-nez v1, :cond_2

    move v1, v2

    goto :goto_1

    :cond_2
    move v1, v3

    .line 6
    :goto_1
    iget-boolean v4, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimsAreShown:Z

    if-eq v4, v0, :cond_9

    const/16 v4, 0xff

    if-eqz v1, :cond_7

    if-eqz v0, :cond_3

    goto :goto_2

    :cond_3
    move v4, v3

    .line 7
    :goto_2
    invoke-virtual {p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->ensureToolbar()V

    .line 8
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimAnimator:Landroid/animation/ValueAnimator;

    if-nez v1, :cond_5

    .line 9
    new-instance v1, Landroid/animation/ValueAnimator;

    invoke-direct {v1}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimAnimator:Landroid/animation/ValueAnimator;

    .line 10
    iget-wide v5, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimAnimationDuration:J

    invoke-virtual {v1, v5, v6}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 11
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimAnimator:Landroid/animation/ValueAnimator;

    iget v5, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimAlpha:I

    if-le v4, v5, :cond_4

    sget-object v5, Lcom/google/android/material/animation/AnimationUtils;->FAST_OUT_LINEAR_IN_INTERPOLATOR:Landroid/animation/TimeInterpolator;

    goto :goto_3

    :cond_4
    sget-object v5, Lcom/google/android/material/animation/AnimationUtils;->LINEAR_OUT_SLOW_IN_INTERPOLATOR:Landroid/animation/TimeInterpolator;

    :goto_3
    invoke-virtual {v1, v5}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 12
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimAnimator:Landroid/animation/ValueAnimator;

    new-instance v5, Lcom/google/android/material/appbar/CollapsingToolbarLayout$2;

    invoke-direct {v5, p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout$2;-><init>(Lcom/google/android/material/appbar/CollapsingToolbarLayout;)V

    invoke-virtual {v1, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    goto :goto_4

    .line 13
    :cond_5
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 14
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 15
    :cond_6
    :goto_4
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimAnimator:Landroid/animation/ValueAnimator;

    const/4 v5, 0x2

    new-array v5, v5, [I

    iget v6, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimAlpha:I

    aput v6, v5, v3

    aput v4, v5, v2

    invoke-virtual {v1, v5}, Landroid/animation/ValueAnimator;->setIntValues([I)V

    .line 16
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_5

    :cond_7
    if-eqz v0, :cond_8

    move v3, v4

    .line 17
    :cond_8
    invoke-virtual {p0, v3}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->setScrimAlpha(I)V

    .line 18
    :goto_5
    iput-boolean v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->scrimsAreShown:Z

    :cond_9
    return-void
.end method

.method public final updateTextBounds(IIIIZ)V
    .locals 13

    move-object v0, p0

    move/from16 v1, p5

    .line 1
    iget-boolean v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->collapsingTitleEnabled:Z

    if-eqz v2, :cond_c

    iget-object v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->dummyView:Landroid/view/View;

    if-eqz v2, :cond_c

    .line 2
    sget-object v3, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 3
    invoke-virtual {v2}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_0

    .line 4
    iget-object v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->dummyView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-nez v2, :cond_0

    move v2, v4

    goto :goto_0

    :cond_0
    move v2, v3

    :goto_0
    iput-boolean v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->drawCollapsingTitle:Z

    if-nez v2, :cond_1

    if-eqz v1, :cond_c

    .line 5
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutDirection()I

    move-result v2

    if-ne v2, v4, :cond_2

    move v2, v4

    goto :goto_1

    :cond_2
    move v2, v3

    .line 6
    :goto_1
    iget-object v5, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->toolbarDirectChild:Landroid/view/View;

    if-eqz v5, :cond_3

    goto :goto_2

    :cond_3
    iget-object v5, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->toolbar:Landroid/view/ViewGroup;

    .line 7
    :goto_2
    invoke-virtual {p0, v5}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->getMaxOffsetForPinChild(Landroid/view/View;)I

    move-result v5

    .line 8
    iget-object v6, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->dummyView:Landroid/view/View;

    iget-object v7, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->tmpRect:Landroid/graphics/Rect;

    invoke-static {p0, v6, v7}, Lcom/google/android/material/internal/DescendantOffsetUtils;->getDescendantRect(Landroid/view/ViewGroup;Landroid/view/View;Landroid/graphics/Rect;)V

    .line 9
    iget-object v6, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->toolbar:Landroid/view/ViewGroup;

    instance-of v7, v6, Landroidx/appcompat/widget/Toolbar;

    if-eqz v7, :cond_4

    .line 10
    check-cast v6, Landroidx/appcompat/widget/Toolbar;

    .line 11
    iget v3, v6, Landroidx/appcompat/widget/Toolbar;->mTitleMarginStart:I

    .line 12
    iget v7, v6, Landroidx/appcompat/widget/Toolbar;->mTitleMarginEnd:I

    .line 13
    iget v8, v6, Landroidx/appcompat/widget/Toolbar;->mTitleMarginTop:I

    .line 14
    iget v6, v6, Landroidx/appcompat/widget/Toolbar;->mTitleMarginBottom:I

    goto :goto_3

    .line 15
    :cond_4
    instance-of v7, v6, Landroid/widget/Toolbar;

    if-eqz v7, :cond_5

    .line 16
    check-cast v6, Landroid/widget/Toolbar;

    .line 17
    invoke-virtual {v6}, Landroid/widget/Toolbar;->getTitleMarginStart()I

    move-result v3

    .line 18
    invoke-virtual {v6}, Landroid/widget/Toolbar;->getTitleMarginEnd()I

    move-result v7

    .line 19
    invoke-virtual {v6}, Landroid/widget/Toolbar;->getTitleMarginTop()I

    move-result v8

    .line 20
    invoke-virtual {v6}, Landroid/widget/Toolbar;->getTitleMarginBottom()I

    move-result v6

    goto :goto_3

    :cond_5
    move v6, v3

    move v7, v6

    move v8, v7

    .line 21
    :goto_3
    iget-object v9, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    iget-object v10, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->tmpRect:Landroid/graphics/Rect;

    iget v11, v10, Landroid/graphics/Rect;->left:I

    if-eqz v2, :cond_6

    move v12, v7

    goto :goto_4

    :cond_6
    move v12, v3

    :goto_4
    add-int/2addr v11, v12

    iget v12, v10, Landroid/graphics/Rect;->top:I

    add-int/2addr v12, v5

    add-int/2addr v12, v8

    iget v8, v10, Landroid/graphics/Rect;->right:I

    if-eqz v2, :cond_7

    goto :goto_5

    :cond_7
    move v3, v7

    :goto_5
    sub-int/2addr v8, v3

    iget v3, v10, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v3, v5

    sub-int/2addr v3, v6

    .line 22
    iget-object v5, v9, Lcom/google/android/material/internal/CollapsingTextHelper;->collapsedBounds:Landroid/graphics/Rect;

    invoke-static {v5, v11, v12, v8, v3}, Lcom/google/android/material/internal/CollapsingTextHelper;->rectEquals(Landroid/graphics/Rect;IIII)Z

    move-result v5

    if-nez v5, :cond_8

    .line 23
    iget-object v5, v9, Lcom/google/android/material/internal/CollapsingTextHelper;->collapsedBounds:Landroid/graphics/Rect;

    invoke-virtual {v5, v11, v12, v8, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 24
    iput-boolean v4, v9, Lcom/google/android/material/internal/CollapsingTextHelper;->boundsChanged:Z

    .line 25
    invoke-virtual {v9}, Lcom/google/android/material/internal/CollapsingTextHelper;->onBoundsChanged()V

    .line 26
    :cond_8
    iget-object v3, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    if-eqz v2, :cond_9

    iget v5, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->expandedMarginEnd:I

    goto :goto_6

    :cond_9
    iget v5, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->expandedMarginStart:I

    :goto_6
    iget-object v6, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->tmpRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->top:I

    iget v7, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->expandedMarginTop:I

    add-int/2addr v6, v7

    sub-int v7, p3, p1

    if-eqz v2, :cond_a

    iget v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->expandedMarginStart:I

    goto :goto_7

    :cond_a
    iget v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->expandedMarginEnd:I

    :goto_7
    sub-int/2addr v7, v2

    sub-int v2, p4, p2

    iget v8, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->expandedMarginBottom:I

    sub-int/2addr v2, v8

    .line 27
    iget-object v8, v3, Lcom/google/android/material/internal/CollapsingTextHelper;->expandedBounds:Landroid/graphics/Rect;

    invoke-static {v8, v5, v6, v7, v2}, Lcom/google/android/material/internal/CollapsingTextHelper;->rectEquals(Landroid/graphics/Rect;IIII)Z

    move-result v8

    if-nez v8, :cond_b

    .line 28
    iget-object v8, v3, Lcom/google/android/material/internal/CollapsingTextHelper;->expandedBounds:Landroid/graphics/Rect;

    invoke-virtual {v8, v5, v6, v7, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 29
    iput-boolean v4, v3, Lcom/google/android/material/internal/CollapsingTextHelper;->boundsChanged:Z

    .line 30
    invoke-virtual {v3}, Lcom/google/android/material/internal/CollapsingTextHelper;->onBoundsChanged()V

    .line 31
    :cond_b
    iget-object v0, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    invoke-virtual {v0, v1}, Lcom/google/android/material/internal/CollapsingTextHelper;->recalculate(Z)V

    :cond_c
    return-void
.end method

.method public final updateTitleFromToolbarIfNeeded()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->toolbar:Landroid/view/ViewGroup;

    if-eqz v0, :cond_3

    .line 2
    iget-boolean v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->collapsingTitleEnabled:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    .line 3
    iget-object v0, v0, Lcom/google/android/material/internal/CollapsingTextHelper;->text:Ljava/lang/CharSequence;

    .line 4
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 5
    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->toolbar:Landroid/view/ViewGroup;

    .line 6
    instance-of v1, v0, Landroidx/appcompat/widget/Toolbar;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 7
    check-cast v0, Landroidx/appcompat/widget/Toolbar;

    .line 8
    iget-object v0, v0, Landroidx/appcompat/widget/Toolbar;->mTitleText:Ljava/lang/CharSequence;

    goto :goto_0

    .line 9
    :cond_0
    instance-of v1, v0, Landroid/widget/Toolbar;

    if-eqz v1, :cond_1

    .line 10
    check-cast v0, Landroid/widget/Toolbar;

    invoke-virtual {v0}, Landroid/widget/Toolbar;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_0

    :cond_1
    move-object v0, v2

    .line 11
    :goto_0
    iget-object v1, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    invoke-virtual {v1, v0}, Lcom/google/android/material/internal/CollapsingTextHelper;->setText(Ljava/lang/CharSequence;)V

    .line 12
    iget-boolean v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->collapsingTitleEnabled:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->collapsingTextHelper:Lcom/google/android/material/internal/CollapsingTextHelper;

    .line 13
    iget-object v2, v0, Lcom/google/android/material/internal/CollapsingTextHelper;->text:Ljava/lang/CharSequence;

    .line 14
    :cond_2
    invoke-virtual {p0, v2}, Landroid/widget/FrameLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_3
    return-void
.end method

.method public verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->contentScrim:Landroid/graphics/drawable/Drawable;

    if-eq p1, v0, :cond_1

    iget-object p0, p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->statusBarScrim:Landroid/graphics/drawable/Drawable;

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
