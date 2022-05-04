.class public Lcom/android/wallpaper/widget/WallpaperThumbnailView;
.super Landroid/widget/ImageView;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 2
    sget-object p1, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 3
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 4
    sget-object p1, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    return-void
.end method


# virtual methods
.method public onLayout(ZIIII)V
    .locals 3

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 2
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-nez p1, :cond_0

    goto :goto_1

    .line 3
    :cond_0
    invoke-virtual {p0}, Landroid/widget/ImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object p1

    .line 4
    invoke-virtual {p0}, Landroid/widget/ImageView;->getWidth()I

    move-result p2

    invoke-virtual {p0}, Landroid/widget/ImageView;->getPaddingLeft()I

    move-result p3

    sub-int/2addr p2, p3

    invoke-virtual {p0}, Landroid/widget/ImageView;->getPaddingRight()I

    move-result p3

    sub-int/2addr p2, p3

    .line 5
    invoke-virtual {p0}, Landroid/widget/ImageView;->getHeight()I

    move-result p3

    invoke-virtual {p0}, Landroid/widget/ImageView;->getPaddingTop()I

    move-result p4

    sub-int/2addr p3, p4

    invoke-virtual {p0}, Landroid/widget/ImageView;->getPaddingBottom()I

    move-result p4

    sub-int/2addr p3, p4

    .line 6
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p4

    invoke-virtual {p4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p4

    .line 7
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p5

    invoke-virtual {p5}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p5

    mul-int v0, p4, p3

    mul-int v1, p5, p2

    if-le v0, v1, :cond_1

    int-to-float v0, p3

    int-to-float v1, p5

    goto :goto_0

    :cond_1
    int-to-float v0, p2

    int-to-float v1, p4

    :goto_0
    div-float/2addr v0, v1

    .line 8
    invoke-virtual {p1, v0, v0}, Landroid/graphics/Matrix;->setScale(FF)V

    int-to-float p5, p5

    mul-float/2addr p5, v0

    int-to-float p3, p3

    cmpl-float v1, p5, p3

    const/4 v2, 0x0

    if-lez v1, :cond_2

    sub-float/2addr p5, p3

    const/high16 p3, 0x40000000    # 2.0f

    div-float/2addr p5, p3

    neg-float p3, p5

    .line 9
    invoke-virtual {p1, v2, p3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 10
    :cond_2
    invoke-virtual {p0}, Landroid/widget/ImageView;->getLayoutDirection()I

    move-result p3

    const/4 p5, 0x1

    if-ne p3, p5, :cond_3

    int-to-float p3, p4

    mul-float/2addr p3, v0

    int-to-float p2, p2

    sub-float/2addr p3, p2

    neg-float p2, p3

    .line 11
    invoke-virtual {p1, p2, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 12
    :cond_3
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 13
    invoke-virtual {p0}, Landroid/widget/ImageView;->invalidate()V

    :goto_1
    return-void
.end method
