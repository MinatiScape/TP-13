.class public final synthetic Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnApplyWindowInsetsListener;


# instance fields
.field public final synthetic f$0:Lcom/android/wallpaper/picker/PreviewFragment;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/PreviewFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/picker/PreviewFragment;

    return-void
.end method


# virtual methods
.method public final onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 8

    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/picker/PreviewFragment;

    sget-object v0, Lcom/android/wallpaper/picker/PreviewFragment;->ALPHA_OUT:Landroid/view/animation/Interpolator;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    .line 2
    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    const/4 v2, 0x0

    .line 3
    invoke-virtual {p1, v0, v2, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mFullScreenAnimation:Lcom/android/wallpaper/util/FullScreenAnimation;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    invoke-static {}, Landroid/view/WindowInsets$Type;->systemBars()I

    move-result v1

    .line 6
    invoke-virtual {p2, v1}, Landroid/view/WindowInsets;->getInsetsIgnoringVisibility(I)Landroid/graphics/Insets;

    move-result-object v1

    .line 7
    iget v3, v1, Landroid/graphics/Insets;->top:I

    iput v3, v0, Lcom/android/wallpaper/util/FullScreenAnimation;->mStatusBarHeight:I

    .line 8
    iget v1, v1, Landroid/graphics/Insets;->bottom:I

    iput v1, v0, Lcom/android/wallpaper/util/FullScreenAnimation;->mNavigationBarHeight:I

    .line 9
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mFullScreenAnimation:Lcom/android/wallpaper/util/FullScreenAnimation;

    .line 10
    iget v1, v0, Lcom/android/wallpaper/util/FullScreenAnimation;->mStatusBarHeight:I

    const v3, 0x7f040003

    .line 11
    iget-object v4, v0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v4

    const/4 v5, 0x1

    new-array v6, v5, [I

    aput v3, v6, v2

    invoke-virtual {v4, v6}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v3

    .line 12
    invoke-virtual {v3, v2, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    .line 13
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    add-int/2addr v4, v1

    int-to-float v1, v4

    .line 14
    iget v3, v0, Lcom/android/wallpaper/util/FullScreenAnimation;->mNavigationBarHeight:I

    int-to-float v3, v3

    .line 15
    iget-object v4, v0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    .line 16
    invoke-virtual {v4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v6, 0x7f07007b

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v4

    add-float/2addr v4, v3

    iget-object v3, v0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    .line 17
    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v7, 0x7f07026e

    invoke-virtual {v3, v7}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    add-float/2addr v3, v4

    const v4, 0x7f0a01da

    .line 18
    invoke-virtual {v0, v4, v1, v3, v2}, Lcom/android/wallpaper/util/FullScreenAnimation;->setViewMargins(IFFZ)V

    const v1, 0x7f0a0076

    .line 19
    iget v3, v0, Lcom/android/wallpaper/util/FullScreenAnimation;->mNavigationBarHeight:I

    int-to-float v3, v3

    const/4 v4, 0x0

    .line 20
    invoke-virtual {v0, v1, v4, v3, v2}, Lcom/android/wallpaper/util/FullScreenAnimation;->setViewMargins(IFFZ)V

    const v1, 0x7f0a01f3

    .line 21
    iget v2, v0, Lcom/android/wallpaper/util/FullScreenAnimation;->mNavigationBarHeight:I

    int-to-float v2, v2

    .line 22
    iget-object v3, v0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    .line 23
    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    add-float/2addr v3, v2

    .line 24
    invoke-virtual {v0, v1, v4, v3, v5}, Lcom/android/wallpaper/util/FullScreenAnimation;->setViewMargins(IFFZ)V

    .line 25
    invoke-virtual {v0}, Lcom/android/wallpaper/util/FullScreenAnimation;->ensureToolbarIsCorrectlyLocated()V

    const v0, 0x7f0a01b3

    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 27
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mFullScreenAnimation:Lcom/android/wallpaper/util/FullScreenAnimation;

    .line 28
    iget p0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mStatusBarHeight:I

    .line 29
    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    .line 30
    invoke-virtual {p1, v0, p0, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 31
    invoke-virtual {p2}, Landroid/view/WindowInsets;->consumeSystemWindowInsets()Landroid/view/WindowInsets;

    move-result-object p0

    return-object p0
.end method
