.class public Lcom/android/wallpaper/util/FullScreenAnimation;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/util/FullScreenAnimation$FullScreenStatusListener;
    }
.end annotation


# instance fields
.field public mBottomActionBarTranslation:F

.field public mCurrentTextColor:I

.field public mDefaultRadius:F

.field public mFullScreenButtonsTranslation:F

.field public mFullScreenStatusListener:Lcom/android/wallpaper/util/FullScreenAnimation$FullScreenStatusListener;

.field public mFullScreenTextColor:I

.field public mIsFullScreen:Z

.field public mIsHomeSelected:Z

.field public mNavigationBarHeight:I

.field public mOffsetY:F

.field public mScale:F

.field public mScaleIsSet:Z

.field public mStatusBarHeight:I

.field public final mTouchForwardingLayout:Lcom/android/wallpaper/picker/TouchForwardingLayout;

.field public final mView:Landroid/view/View;

.field public mWorkspaceHeight:I

.field public final mWorkspaceSurface:Landroid/view/SurfaceView;

.field public mWorkspaceVisibility:Z

.field public mWorkspaceWidth:I


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mIsFullScreen:Z

    .line 3
    iput-boolean v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mScaleIsSet:Z

    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceVisibility:Z

    .line 5
    iput-boolean v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mIsHomeSelected:Z

    .line 6
    iput v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mFullScreenTextColor:I

    .line 7
    iput-object p1, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    const v0, 0x7f0a0272

    .line 8
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/wallpaper/picker/TouchForwardingLayout;

    iput-object v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mTouchForwardingLayout:Lcom/android/wallpaper/picker/TouchForwardingLayout;

    const v0, 0x7f0a029e

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/SurfaceView;

    iput-object v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceSurface:Landroid/view/SurfaceView;

    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x1010036

    .line 11
    invoke-static {p1, v0}, Landroidx/transition/R$id;->getColorAttr(Landroid/content/Context;I)I

    move-result p1

    iput p1, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mCurrentTextColor:I

    return-void
.end method


# virtual methods
.method public final animateColor(Z)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    const v1, 0x7f0a00c1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eqz p1, :cond_2

    .line 2
    iget p1, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mFullScreenTextColor:I

    if-ne p1, v2, :cond_0

    goto :goto_0

    :cond_0
    if-ne p1, v1, :cond_1

    .line 3
    iget-object p1, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v3, 0x106000c

    invoke-virtual {p1, v3}, Landroid/content/Context;->getColor(I)I

    move-result p1

    goto :goto_1

    .line 4
    :cond_1
    iget-object p1, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v3, 0x106000b

    invoke-virtual {p1, v3}, Landroid/content/Context;->getColor(I)I

    move-result p1

    goto :goto_1

    .line 5
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v3, 0x1010036

    .line 7
    invoke-static {p1, v3}, Landroidx/transition/R$id;->getColorAttr(Landroid/content/Context;I)I

    move-result p1

    .line 8
    :goto_1
    iget v3, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mCurrentTextColor:I

    if-ne p1, v3, :cond_3

    return-void

    .line 9
    :cond_3
    iget-object v3, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    const v4, 0x7f0a026d

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Toolbar;

    .line 10
    invoke-virtual {v3}, Landroid/widget/Toolbar;->getNavigationView()Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageButton;

    new-array v1, v1, [I

    const/4 v4, 0x0

    .line 11
    iget v5, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mCurrentTextColor:I

    aput v5, v1, v4

    aput p1, v1, v2

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofArgb([I)Landroid/animation/ValueAnimator;

    move-result-object v1

    .line 12
    new-instance v2, Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda0;

    invoke-direct {v2, v0, v3}, Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda0;-><init>(Landroid/widget/TextView;Landroid/widget/ImageButton;)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 13
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    .line 14
    iput p1, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mCurrentTextColor:I

    return-void
.end method

.method public ensureToolbarIsCorrectlyColored()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    const v1, 0x7f0a00c1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 2
    iget v1, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mCurrentTextColor:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    const v1, 0x7f0a026d

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Toolbar;

    .line 4
    invoke-virtual {v0}, Landroid/widget/Toolbar;->getNavigationView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    if-eqz v0, :cond_0

    .line 5
    iget p0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mCurrentTextColor:I

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setColorFilter(I)V

    :cond_0
    return-void
.end method

.method public ensureToolbarIsCorrectlyLocated()V
    .locals 3

    .line 1
    new-instance v0, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Lcom/google/android/material/appbar/AppBarLayout$LayoutParams;-><init>(II)V

    .line 2
    iget v1, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mStatusBarHeight:I

    const/4 v2, 0x0

    .line 3
    invoke-virtual {v0, v2, v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 4
    iget-object p0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    const v1, 0x7f0a026d

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public final setViewMargins(IFFZ)V
    .locals 3

    .line 1
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    if-eqz p4, :cond_0

    const/4 v2, -0x2

    goto :goto_0

    :cond_0
    move v2, v1

    .line 2
    :goto_0
    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 3
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    move-result p3

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p2, v1, p3}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    if-eqz p4, :cond_1

    const/16 p2, 0x50

    .line 4
    iput p2, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 5
    :cond_1
    iget-object p0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public setWorkspaceVisibility(Z)V
    .locals 9

    const/4 v0, 0x4

    const v1, 0x7f0a013e

    if-eqz p1, :cond_0

    .line 1
    iget-object v2, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceSurface:Landroid/view/SurfaceView;

    new-instance v3, Landroid/graphics/Rect;

    iget v4, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceHeight:I

    int-to-float v4, v4

    const v5, 0x3e4ccccd    # 0.2f

    mul-float/2addr v4, v5

    .line 2
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    iget v5, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceWidth:I

    iget v6, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceHeight:I

    iget v7, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mFullScreenButtonsTranslation:F

    iget v8, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mScale:F

    div-float/2addr v7, v8

    .line 3
    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    add-int/2addr v7, v6

    const/4 v6, 0x0

    invoke-direct {v3, v6, v4, v5, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 4
    invoke-virtual {v2, v3}, Landroid/view/SurfaceView;->setClipBounds(Landroid/graphics/Rect;)V

    .line 5
    iget-object v2, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 6
    :cond_0
    iget-object v2, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceSurface:Landroid/view/SurfaceView;

    new-instance v3, Landroid/graphics/Rect;

    iget v4, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceWidth:I

    add-int/lit8 v5, v4, -0x1

    iget v6, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceHeight:I

    add-int/lit8 v7, v6, -0x1

    invoke-direct {v3, v5, v7, v4, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v2, v3}, Landroid/view/SurfaceView;->setClipBounds(Landroid/graphics/Rect;)V

    .line 7
    iget-object v2, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 8
    :goto_0
    iget-boolean v2, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mIsHomeSelected:Z

    if-eqz v2, :cond_1

    .line 9
    iget-object v2, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 10
    :cond_1
    iput-boolean p1, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceVisibility:Z

    return-void
.end method

.method public startAnimation(Z)V
    .locals 14

    .line 1
    iget-boolean v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mIsFullScreen:Z

    if-ne p1, v0, :cond_0

    return-void

    .line 2
    :cond_0
    iget-boolean v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mScaleIsSet:Z

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-nez v0, :cond_1

    new-array v0, v1, [I

    .line 3
    iget-object v3, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mTouchForwardingLayout:Lcom/android/wallpaper/picker/TouchForwardingLayout;

    invoke-virtual {v3, v0}, Landroid/widget/FrameLayout;->getLocationInWindow([I)V

    .line 4
    invoke-static {}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getInstance()Lcom/android/wallpaper/util/ScreenSizeCalculator;

    move-result-object v3

    .line 5
    iget-object v4, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getScreenSize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object v3

    .line 6
    iget v4, v3, Landroid/graphics/Point;->x:I

    .line 7
    iget v3, v3, Landroid/graphics/Point;->y:I

    int-to-double v5, v3

    const-wide/high16 v7, 0x4000000000000000L    # 2.0

    div-double/2addr v5, v7

    .line 8
    aget v0, v0, v2

    int-to-double v9, v0

    iget-object v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mTouchForwardingLayout:Lcom/android/wallpaper/picker/TouchForwardingLayout;

    .line 9
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v0

    int-to-double v11, v0

    div-double/2addr v11, v7

    add-double/2addr v11, v9

    sub-double/2addr v5, v11

    double-to-float v0, v5

    iput v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mOffsetY:F

    int-to-float v0, v4

    .line 10
    iget-object v4, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mTouchForwardingLayout:Lcom/android/wallpaper/picker/TouchForwardingLayout;

    .line 11
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v0, v4

    int-to-float v3, v3

    iget-object v4, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mTouchForwardingLayout:Lcom/android/wallpaper/picker/TouchForwardingLayout;

    .line 12
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    .line 13
    invoke-static {v0, v3}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mScale:F

    .line 14
    iget-object v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceSurface:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroidx/cardview/widget/CardView;

    .line 15
    sget-object v3, Landroidx/cardview/widget/CardView;->IMPL:Landroidx/cardview/widget/CardViewImpl;

    iget-object v0, v0, Landroidx/cardview/widget/CardView;->mCardViewDelegate:Landroidx/cardview/widget/CardViewDelegate;

    check-cast v3, Landroidx/cardview/widget/CardViewApi21Impl;

    invoke-virtual {v3, v0}, Landroidx/cardview/widget/CardViewApi21Impl;->getRadius(Landroidx/cardview/widget/CardViewDelegate;)F

    move-result v0

    .line 16
    iput v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mDefaultRadius:F

    .line 17
    iget-object v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceSurface:Landroid/view/SurfaceView;

    invoke-virtual {v0, v2}, Landroid/view/SurfaceView;->setEnableSurfaceClipping(Z)V

    .line 18
    iget-object v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceSurface:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceWidth:I

    .line 19
    iget-object v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceSurface:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceHeight:I

    .line 20
    iget v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mNavigationBarHeight:I

    int-to-float v0, v0

    .line 21
    iget-object v3, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    .line 22
    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f07007b

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    add-float/2addr v3, v0

    iget-object v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    .line 23
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v4, 0x7f07026e

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    add-float/2addr v0, v3

    iput v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mBottomActionBarTranslation:F

    .line 24
    iget v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mNavigationBarHeight:I

    int-to-float v0, v0

    .line 25
    iget-object v3, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    .line 26
    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v5, 0x7f0700f9

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    add-float/2addr v3, v0

    iget-object v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    .line 27
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    add-float/2addr v0, v3

    neg-float v0, v0

    iput v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mFullScreenButtonsTranslation:F

    .line 28
    iput-boolean v2, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mScaleIsSet:Z

    :cond_1
    const/4 v0, 0x0

    if-eqz p1, :cond_2

    .line 29
    iget v3, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mDefaultRadius:F

    goto :goto_0

    :cond_2
    move v3, v0

    :goto_0
    if-eqz p1, :cond_3

    move v4, v0

    goto :goto_1

    .line 30
    :cond_3
    iget v4, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mDefaultRadius:F

    :goto_1
    new-array v5, v1, [F

    const/4 v6, 0x0

    aput v3, v5, v6

    aput v4, v5, v2

    .line 31
    invoke-static {v5}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v3

    .line 32
    new-instance v4, Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda1;

    invoke-direct {v4, p0}, Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/util/FullScreenAnimation;)V

    invoke-virtual {v3, v4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    const v4, 0x3e4ccccd    # 0.2f

    if-eqz p1, :cond_4

    move v9, v0

    goto :goto_2

    :cond_4
    move v9, v4

    :goto_2
    if-eqz p1, :cond_5

    move v10, v4

    goto :goto_3

    :cond_5
    move v10, v0

    :goto_3
    if-eqz p1, :cond_6

    move v11, v0

    goto :goto_4

    .line 33
    :cond_6
    iget v4, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mFullScreenButtonsTranslation:F

    iget v5, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mScale:F

    div-float/2addr v4, v5

    move v11, v4

    :goto_4
    if-eqz p1, :cond_7

    .line 34
    iget v4, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mFullScreenButtonsTranslation:F

    iget v5, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mScale:F

    div-float/2addr v4, v5

    move v12, v4

    goto :goto_5

    :cond_7
    move v12, v0

    :goto_5
    new-array v4, v1, [F

    .line 35
    fill-array-data v4, :array_0

    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v4

    .line 36
    new-instance v5, Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda2;

    move-object v7, v5

    move-object v8, p0

    invoke-direct/range {v7 .. v12}, Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda2;-><init>(Lcom/android/wallpaper/util/FullScreenAnimation;FFFF)V

    invoke-virtual {v4, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    if-eqz p1, :cond_8

    .line 37
    iget v5, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mScale:F

    goto :goto_6

    :cond_8
    const/high16 v5, 0x3f800000    # 1.0f

    :goto_6
    if-eqz p1, :cond_9

    .line 38
    iget v7, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mOffsetY:F

    goto :goto_7

    :cond_9
    move v7, v0

    :goto_7
    if-eqz p1, :cond_a

    .line 39
    iget v8, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mBottomActionBarTranslation:F

    goto :goto_8

    :cond_a
    move v8, v0

    :goto_8
    if-eqz p1, :cond_b

    .line 40
    iget v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mFullScreenButtonsTranslation:F

    .line 41
    :cond_b
    iget-object v9, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    const v10, 0x7f0a01da

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    .line 42
    new-instance v10, Landroid/animation/AnimatorSet;

    invoke-direct {v10}, Landroid/animation/AnimatorSet;-><init>()V

    const/16 v11, 0x8

    new-array v11, v11, [Landroid/animation/Animator;

    new-array v12, v2, [F

    aput v5, v12, v6

    const-string v13, "scaleX"

    .line 43
    invoke-static {v9, v13, v12}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v12

    aput-object v12, v11, v6

    new-array v12, v2, [F

    aput v5, v12, v6

    const-string v5, "scaleY"

    .line 44
    invoke-static {v9, v5, v12}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    aput-object v5, v11, v2

    new-array v5, v2, [F

    aput v7, v5, v6

    const-string v7, "translationY"

    .line 45
    invoke-static {v9, v7, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    aput-object v5, v11, v1

    const/4 v1, 0x3

    iget-object v5, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    const v9, 0x7f0a0077

    .line 46
    invoke-virtual {v5, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    new-array v9, v2, [F

    aput v8, v9, v6

    invoke-static {v5, v7, v9}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    aput-object v5, v11, v1

    iget-object v1, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    const v5, 0x7f0a01f3

    .line 47
    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    new-array v5, v2, [F

    aput v8, v5, v6

    invoke-static {v1, v7, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    const/4 v5, 0x4

    aput-object v1, v11, v5

    const/4 v1, 0x5

    iget-object v8, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    const v9, 0x7f0a0105

    .line 48
    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    new-array v9, v2, [F

    aput v0, v9, v6

    invoke-static {v8, v7, v9}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    aput-object v0, v11, v1

    const/4 v0, 0x6

    aput-object v3, v11, v0

    const/4 v0, 0x7

    aput-object v4, v11, v0

    .line 49
    invoke-virtual {v10, v11}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 50
    new-instance v0, Lcom/android/wallpaper/util/FullScreenAnimation$1;

    invoke-direct {v0, p0, p1}, Lcom/android/wallpaper/util/FullScreenAnimation$1;-><init>(Lcom/android/wallpaper/util/FullScreenAnimation;Z)V

    invoke-virtual {v10, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 51
    invoke-virtual {v10}, Landroid/animation/AnimatorSet;->start()V

    .line 52
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/util/FullScreenAnimation;->animateColor(Z)V

    .line 53
    iput-boolean v2, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceVisibility:Z

    if-eqz p1, :cond_c

    .line 54
    iget-object v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    const v1, 0x7f0a0115

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    const v1, 0x7f110095

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 55
    :cond_c
    iget-object v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    const v1, 0x7f0a013e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    .line 56
    iget-boolean v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mIsHomeSelected:Z

    if-eqz v0, :cond_d

    .line 57
    iget-object v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 58
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 59
    :cond_d
    iput-boolean p1, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mIsFullScreen:Z

    return-void

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
