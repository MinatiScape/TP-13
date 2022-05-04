.class public Lcom/android/wallpaper/widget/PageIndicator;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# static fields
.field public static sMethodForceAnimationOnUI:Ljava/lang/reflect/Method;


# instance fields
.field public mAnimating:Z

.field public final mAnimationCallback:Landroid/graphics/drawable/Animatable2$AnimationCallback;

.field public final mPageDotWidth:I

.field public final mPageIndicatorHeight:I

.field public final mPageIndicatorWidth:I

.field public mPosition:I

.field public final mQueuedPositions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/android/wallpaper/widget/PageIndicator;->mQueuedPositions:Ljava/util/ArrayList;

    const/4 p2, -0x1

    .line 3
    iput p2, p0, Lcom/android/wallpaper/widget/PageIndicator;->mPosition:I

    .line 4
    new-instance p2, Lcom/android/wallpaper/widget/PageIndicator$1;

    invoke-direct {p2, p0}, Lcom/android/wallpaper/widget/PageIndicator$1;-><init>(Lcom/android/wallpaper/widget/PageIndicator;)V

    iput-object p2, p0, Lcom/android/wallpaper/widget/PageIndicator;->mAnimationCallback:Landroid/graphics/drawable/Animatable2$AnimationCallback;

    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f070241

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    float-to-int p2, p2

    iput p2, p0, Lcom/android/wallpaper/widget/PageIndicator;->mPageIndicatorWidth:I

    .line 6
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f070240

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Lcom/android/wallpaper/widget/PageIndicator;->mPageIndicatorHeight:I

    int-to-float p1, p2

    const p2, 0x3ecccccd    # 0.4f

    mul-float/2addr p1, p2

    float-to-int p1, p1

    .line 7
    iput p1, p0, Lcom/android/wallpaper/widget/PageIndicator;->mPageDotWidth:I

    return-void
.end method


# virtual methods
.method public final forceAnimationOnUI(Landroid/graphics/drawable/AnimatedVectorDrawable;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/android/wallpaper/widget/PageIndicator;->sMethodForceAnimationOnUI:Ljava/lang/reflect/Method;

    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 2
    const-class p0, Landroid/graphics/drawable/AnimatedVectorDrawable;

    new-array v1, v0, [Ljava/lang/Class;

    const-string v2, "forceAnimationOnUI"

    invoke-virtual {p0, v2, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    sput-object p0, Lcom/android/wallpaper/widget/PageIndicator;->sMethodForceAnimationOnUI:Ljava/lang/reflect/Method;

    .line 3
    :cond_0
    sget-object p0, Lcom/android/wallpaper/widget/PageIndicator;->sMethodForceAnimationOnUI:Ljava/lang/reflect/Method;

    if-eqz p0, :cond_1

    new-array v0, v0, [Ljava/lang/Object;

    .line 4
    invoke-virtual {p0, p1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-void
.end method

.method public final getAlpha(Z)F
    .locals 0

    if-eqz p1, :cond_0

    const/high16 p0, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_0
    const p0, 0x3ed70a3d    # 0.42f

    :goto_0
    return p0
.end method

.method public final getTransition(ZZZ)I
    .locals 0

    if-eqz p3, :cond_3

    if-eqz p1, :cond_1

    if-eqz p2, :cond_0

    const p0, 0x7f0800c9

    return p0

    :cond_0
    const p0, 0x7f0800cb

    return p0

    :cond_1
    if-eqz p2, :cond_2

    const p0, 0x7f0800c7

    return p0

    :cond_2
    const p0, 0x7f0800cd

    return p0

    :cond_3
    if-eqz p1, :cond_5

    if-eqz p2, :cond_4

    const p0, 0x7f0800e1

    return p0

    :cond_4
    const p0, 0x7f0800df

    return p0

    :cond_5
    if-eqz p2, :cond_6

    const p0, 0x7f0800e3

    return p0

    :cond_6
    const p0, 0x7f0800dd

    return p0
.end method

.method public onLayout(ZIIII)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    const/4 p2, 0x0

    move p3, p2

    :goto_0
    if-ge p3, p1, :cond_1

    .line 2
    iget p4, p0, Lcom/android/wallpaper/widget/PageIndicator;->mPageIndicatorWidth:I

    iget p5, p0, Lcom/android/wallpaper/widget/PageIndicator;->mPageDotWidth:I

    sub-int/2addr p4, p5

    mul-int/2addr p4, p3

    .line 3
    invoke-virtual {p0, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p5

    iget v0, p0, Lcom/android/wallpaper/widget/PageIndicator;->mPageIndicatorWidth:I

    add-int/2addr v0, p4

    iget v1, p0, Lcom/android/wallpaper/widget/PageIndicator;->mPageIndicatorHeight:I

    invoke-virtual {p5, p4, p2, v0, v1}, Landroid/view/View;->layout(IIII)V

    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public onMeasure(II)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 2
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    return-void

    .line 3
    :cond_0
    iget p1, p0, Lcom/android/wallpaper/widget/PageIndicator;->mPageIndicatorWidth:I

    const/high16 p2, 0x40000000    # 2.0f

    invoke-static {p1, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    .line 4
    iget v1, p0, Lcom/android/wallpaper/widget/PageIndicator;->mPageIndicatorHeight:I

    invoke-static {v1, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 5
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Landroid/view/View;->measure(II)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 6
    :cond_1
    iget p1, p0, Lcom/android/wallpaper/widget/PageIndicator;->mPageIndicatorWidth:I

    iget p2, p0, Lcom/android/wallpaper/widget/PageIndicator;->mPageDotWidth:I

    sub-int/2addr p1, p2

    add-int/lit8 v0, v0, -0x1

    mul-int/2addr v0, p1

    add-int/2addr v0, p2

    .line 7
    iget p1, p0, Lcom/android/wallpaper/widget/PageIndicator;->mPageIndicatorHeight:I

    invoke-virtual {p0, v0, p1}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    return-void
.end method

.method public final playAnimation(Landroid/widget/ImageView;I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    .line 2
    instance-of v0, p2, Landroid/graphics/drawable/AnimatedVectorDrawable;

    if-nez v0, :cond_0

    return-void

    .line 3
    :cond_0
    check-cast p2, Landroid/graphics/drawable/AnimatedVectorDrawable;

    .line 4
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 5
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/android/wallpaper/widget/PageIndicator;->forceAnimationOnUI(Landroid/graphics/drawable/AnimatedVectorDrawable;)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "PageIndicator"

    const-string v1, "Catch an exception in playAnimation"

    .line 6
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 7
    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/widget/PageIndicator;->mAnimationCallback:Landroid/graphics/drawable/Animatable2$AnimationCallback;

    invoke-virtual {p2, p0}, Landroid/graphics/drawable/AnimatedVectorDrawable;->registerAnimationCallback(Landroid/graphics/drawable/Animatable2$AnimationCallback;)V

    .line 8
    invoke-virtual {p2}, Landroid/graphics/drawable/AnimatedVectorDrawable;->start()V

    return-void
.end method

.method public final setIndex(I)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    .line 2
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    const/4 v4, 0x0

    .line 3
    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setTranslationX(F)V

    const v4, 0x7f0800c6

    .line 4
    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    if-ne v2, p1, :cond_0

    const/4 v4, 0x1

    goto :goto_1

    :cond_0
    move v4, v1

    .line 5
    :goto_1
    invoke-virtual {p0, v4}, Lcom/android/wallpaper/widget/PageIndicator;->getAlpha(Z)F

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setAlpha(F)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public setLocation(F)V
    .locals 6

    float-to-int v0, p1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    add-int/lit8 v3, v0, 0x1

    .line 2
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v5, 0x1

    aput-object v3, v2, v5

    const v3, 0x7f110030

    .line 3
    invoke-virtual {v1, v3, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setContentDescription(Ljava/lang/CharSequence;)V

    shl-int/lit8 v1, v0, 0x1

    int-to-float v0, v0

    cmpl-float p1, p1, v0

    if-eqz p1, :cond_0

    move v4, v5

    :cond_0
    or-int p1, v1, v4

    .line 4
    iget v0, p0, Lcom/android/wallpaper/widget/PageIndicator;->mPosition:I

    .line 5
    iget-object v1, p0, Lcom/android/wallpaper/widget/PageIndicator;->mQueuedPositions:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-eqz v1, :cond_1

    .line 6
    iget-object v0, p0, Lcom/android/wallpaper/widget/PageIndicator;->mQueuedPositions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr v1, v5

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :cond_1
    if-ne p1, v0, :cond_2

    return-void

    .line 7
    :cond_2
    iget-boolean v0, p0, Lcom/android/wallpaper/widget/PageIndicator;->mAnimating:Z

    if-eqz v0, :cond_3

    .line 8
    iget-object p0, p0, Lcom/android/wallpaper/widget/PageIndicator;->mQueuedPositions:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    .line 9
    :cond_3
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/widget/PageIndicator;->setPosition(I)V

    return-void
.end method

.method public final setPosition(I)V
    .locals 8

    .line 1
    iget v0, p0, Lcom/android/wallpaper/widget/PageIndicator;->mPosition:I

    if-ltz v0, :cond_5

    sub-int/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_5

    .line 2
    iget v0, p0, Lcom/android/wallpaper/widget/PageIndicator;->mPosition:I

    shr-int/lit8 v2, v0, 0x1

    shr-int/lit8 v3, p1, 0x1

    .line 3
    invoke-virtual {p0, v2}, Lcom/android/wallpaper/widget/PageIndicator;->setIndex(I)V

    and-int/lit8 v4, v0, 0x1

    const/4 v5, 0x0

    if-eqz v4, :cond_0

    move v4, v1

    goto :goto_0

    :cond_0
    move v4, v5

    :goto_0
    if-eqz v4, :cond_1

    if-le v0, p1, :cond_2

    goto :goto_1

    :cond_1
    if-ge v0, p1, :cond_2

    :goto_1
    move v0, v1

    goto :goto_2

    :cond_2
    move v0, v5

    .line 4
    :goto_2
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 5
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    if-ne v2, v6, :cond_3

    add-int/lit8 v2, v2, 0x1

    .line 6
    :cond_3
    invoke-virtual {p0, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 7
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    if-eqz v3, :cond_6

    if-nez v2, :cond_4

    goto :goto_3

    .line 8
    :cond_4
    invoke-virtual {v3}, Landroid/widget/ImageView;->getX()F

    move-result v6

    invoke-virtual {v2}, Landroid/widget/ImageView;->getX()F

    move-result v7

    sub-float/2addr v6, v7

    invoke-virtual {v2, v6}, Landroid/widget/ImageView;->setTranslationX(F)V

    .line 9
    invoke-virtual {p0, v4, v0, v5}, Lcom/android/wallpaper/widget/PageIndicator;->getTransition(ZZZ)I

    move-result v6

    invoke-virtual {p0, v3, v6}, Lcom/android/wallpaper/widget/PageIndicator;->playAnimation(Landroid/widget/ImageView;I)V

    .line 10
    invoke-virtual {p0, v5}, Lcom/android/wallpaper/widget/PageIndicator;->getAlpha(Z)F

    move-result v5

    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 11
    invoke-virtual {p0, v4, v0, v1}, Lcom/android/wallpaper/widget/PageIndicator;->getTransition(ZZZ)I

    move-result v0

    invoke-virtual {p0, v2, v0}, Lcom/android/wallpaper/widget/PageIndicator;->playAnimation(Landroid/widget/ImageView;I)V

    .line 12
    invoke-virtual {p0, v1}, Lcom/android/wallpaper/widget/PageIndicator;->getAlpha(Z)F

    move-result v0

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 13
    iput-boolean v1, p0, Lcom/android/wallpaper/widget/PageIndicator;->mAnimating:Z

    goto :goto_3

    :cond_5
    shr-int/lit8 v0, p1, 0x1

    .line 14
    invoke-virtual {p0, v0}, Lcom/android/wallpaper/widget/PageIndicator;->setIndex(I)V

    .line 15
    :cond_6
    :goto_3
    iput p1, p0, Lcom/android/wallpaper/widget/PageIndicator;->mPosition:I

    return-void
.end method
