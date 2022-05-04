.class public final Lcom/android/wallpaper/util/WallpaperCropUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static adjustCropRect(Landroid/content/Context;Landroid/graphics/Rect;Z)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    move-result v0

    int-to-float v0, v0

    .line 2
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    move-result v1

    int-to-float v1, v1

    .line 3
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    .line 4
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    .line 5
    invoke-static {p0}, Lcom/android/systemui/shared/system/WallpaperManagerCompat;->getWallpaperZoomOutMaxScale(Landroid/content/Context;)F

    move-result p0

    if-eqz p2, :cond_0

    goto :goto_0

    :cond_0
    const/high16 p2, 0x3f800000    # 1.0f

    div-float p0, p2, p0

    :goto_0
    const/high16 p2, 0x40000000    # 2.0f

    div-float/2addr v2, p2

    div-float/2addr v2, p0

    sub-float v4, v0, v2

    float-to-int v4, v4

    div-float/2addr v3, p2

    div-float/2addr v3, p0

    sub-float p0, v1, v3

    float-to-int p0, p0

    add-float/2addr v0, v2

    float-to-int p2, v0

    add-float/2addr v1, v3

    float-to-int v0, v1

    .line 6
    invoke-virtual {p1, v4, p0, p2, v0}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method

.method public static calculateCropRect(Landroid/content/Context;FLandroid/graphics/Point;Landroid/graphics/Point;Landroid/graphics/Point;II)Landroid/graphics/Rect;
    .locals 2

    .line 1
    iget v0, p2, Landroid/graphics/Point;->x:I

    int-to-float v0, v0

    mul-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 2
    iget p2, p2, Landroid/graphics/Point;->y:I

    int-to-float p2, p2

    mul-float/2addr p2, p1

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p1

    .line 3
    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    const/4 v1, 0x0

    .line 4
    invoke-virtual {p2, v1, v1, v0, p1}, Landroid/graphics/Rect;->set(IIII)V

    .line 5
    new-instance p1, Landroid/graphics/Rect;

    iget v0, p4, Landroid/graphics/Point;->x:I

    add-int/2addr v0, p5

    iget v1, p4, Landroid/graphics/Point;->y:I

    add-int/2addr v1, p6

    invoke-direct {p1, p5, p6, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 6
    iget p5, p3, Landroid/graphics/Point;->x:I

    iget p6, p4, Landroid/graphics/Point;->x:I

    sub-int/2addr p5, p6

    .line 7
    iget p3, p3, Landroid/graphics/Point;->y:I

    iget p4, p4, Landroid/graphics/Point;->y:I

    sub-int/2addr p3, p4

    int-to-float p3, p3

    const/high16 p4, 0x40000000    # 2.0f

    div-float/2addr p3, p4

    float-to-int p3, p3

    .line 8
    invoke-static {p0}, Lcom/android/wallpaper/util/WallpaperCropUtils;->isRtl(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 9
    iget p0, p1, Landroid/graphics/Rect;->left:I

    sub-int/2addr p0, p5

    iget p4, p2, Landroid/graphics/Rect;->left:I

    invoke-static {p0, p4}, Ljava/lang/Math;->max(II)I

    move-result p0

    iput p0, p1, Landroid/graphics/Rect;->left:I

    goto :goto_0

    .line 10
    :cond_0
    iget p0, p1, Landroid/graphics/Rect;->right:I

    add-int/2addr p0, p5

    iget p4, p2, Landroid/graphics/Rect;->right:I

    invoke-static {p0, p4}, Ljava/lang/Math;->min(II)I

    move-result p0

    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 11
    :goto_0
    iget p0, p1, Landroid/graphics/Rect;->top:I

    iget p4, p2, Landroid/graphics/Rect;->top:I

    sub-int p5, p0, p3

    invoke-static {p4, p5}, Ljava/lang/Math;->max(II)I

    move-result p4

    sub-int/2addr p0, p4

    .line 12
    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    iget p4, p1, Landroid/graphics/Rect;->bottom:I

    add-int/2addr p4, p3

    invoke-static {p2, p4}, Ljava/lang/Math;->min(II)I

    move-result p2

    iget p3, p1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr p2, p3

    .line 13
    invoke-static {p0, p2}, Ljava/lang/Math;->min(II)I

    move-result p0

    .line 14
    iget p2, p1, Landroid/graphics/Rect;->top:I

    sub-int/2addr p2, p0

    iput p2, p1, Landroid/graphics/Rect;->top:I

    .line 15
    iget p2, p1, Landroid/graphics/Rect;->bottom:I

    add-int/2addr p2, p0

    iput p2, p1, Landroid/graphics/Rect;->bottom:I

    return-object p1
.end method

.method public static calculateCropRect(Landroid/content/Context;Landroid/graphics/Point;Landroid/graphics/Point;Landroid/graphics/Point;Landroid/graphics/Rect;F)Landroid/graphics/Rect;
    .locals 8

    .line 16
    iget v0, p4, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    mul-float/2addr v0, p5

    float-to-int v6, v0

    .line 17
    iget p4, p4, Landroid/graphics/Rect;->top:I

    int-to-float p4, p4

    mul-float/2addr p4, p5

    float-to-int v7, p4

    move-object v1, p0

    move v2, p5

    move-object v3, p3

    move-object v4, p2

    move-object v5, p1

    .line 18
    invoke-static/range {v1 .. v7}, Lcom/android/wallpaper/util/WallpaperCropUtils;->calculateCropRect(Landroid/content/Context;FLandroid/graphics/Point;Landroid/graphics/Point;Landroid/graphics/Point;II)Landroid/graphics/Rect;

    move-result-object p0

    return-object p0
.end method

.method public static calculateCropSurfaceSize(Landroid/content/res/Resources;IIII)Landroid/graphics/Point;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget p0, p0, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    const/16 v0, 0x2d0

    if-lt p0, v0, :cond_0

    int-to-float p0, p1

    int-to-float v0, p2

    div-float v0, p0, v0

    const v1, -0x41627629

    mul-float/2addr v0, v1

    const v1, 0x3fd89d8a

    add-float/2addr v0, v1

    mul-float/2addr p0, v0

    float-to-int p0, p0

    goto :goto_0

    :cond_0
    int-to-float p0, p2

    const/high16 v0, 0x40000000    # 2.0f

    mul-float/2addr p0, v0

    float-to-int p0, p0

    .line 2
    invoke-static {p0, p1}, Ljava/lang/Math;->max(II)I

    move-result p0

    :goto_0
    if-ge p3, p4, :cond_1

    goto :goto_1

    :cond_1
    move p1, p2

    .line 3
    :goto_1
    new-instance p2, Landroid/graphics/Point;

    invoke-direct {p2, p0, p1}, Landroid/graphics/Point;-><init>(II)V

    return-object p2
.end method

.method public static calculateMinZoom(Landroid/graphics/Point;Landroid/graphics/Point;)F
    .locals 4

    .line 1
    iget v0, p1, Landroid/graphics/Point;->x:I

    int-to-float v0, v0

    iget p1, p1, Landroid/graphics/Point;->y:I

    int-to-float p1, p1

    div-float v1, v0, p1

    iget v2, p0, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    iget p0, p0, Landroid/graphics/Point;->y:I

    int-to-float p0, p0

    div-float v3, v2, p0

    cmpl-float v1, v1, v3

    if-lez v1, :cond_0

    div-float/2addr v0, v2

    goto :goto_0

    :cond_0
    div-float v0, p1, p0

    :goto_0
    return v0
.end method

.method public static calculateVisibleRect(Landroid/graphics/Point;Landroid/graphics/Point;)Landroid/graphics/Rect;
    .locals 7

    .line 1
    new-instance v0, Landroid/graphics/PointF;

    iget v1, p0, Landroid/graphics/Point;->x:I

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    iget v3, p0, Landroid/graphics/Point;->y:I

    int-to-float v3, v3

    div-float/2addr v3, v2

    invoke-direct {v0, v1, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 2
    iget v1, p1, Landroid/graphics/Point;->x:I

    int-to-float v1, v1

    iget p1, p1, Landroid/graphics/Point;->y:I

    int-to-float p1, p1

    div-float v3, v1, p1

    iget v4, p0, Landroid/graphics/Point;->x:I

    int-to-float v4, v4

    iget v5, p0, Landroid/graphics/Point;->y:I

    int-to-float v5, v5

    div-float v6, v4, v5

    cmpl-float v3, v3, v6

    const/4 v6, 0x0

    if-lez v3, :cond_0

    div-float/2addr v1, v4

    div-float/2addr p1, v1

    .line 3
    new-instance v1, Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/PointF;->y:F

    div-float/2addr p1, v2

    sub-float v2, v0, p1

    float-to-int v2, v2

    iget p0, p0, Landroid/graphics/Point;->x:I

    add-float/2addr v0, p1

    float-to-int p1, v0

    invoke-direct {v1, v6, v2, p0, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v1

    :cond_0
    div-float/2addr p1, v5

    div-float/2addr v1, p1

    .line 4
    new-instance p1, Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/PointF;->x:F

    div-float/2addr v1, v2

    sub-float v2, v0, v1

    float-to-int v2, v2

    add-float/2addr v0, v1

    float-to-int v0, v0

    iget p0, p0, Landroid/graphics/Point;->y:I

    invoke-direct {p1, v2, v6, v0, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object p1
.end method

.method public static fitToSize(Landroid/graphics/Rect;II)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 2
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    int-to-float p1, p1

    .line 3
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result p2

    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-static {p2, v0}, Ljava/lang/Math;->max(II)I

    move-result p2

    int-to-float p2, p2

    div-float/2addr p1, p2

    const/high16 p2, 0x3f800000    # 1.0f

    cmpl-float p2, p1, p2

    if-eqz p2, :cond_1

    .line 4
    iget p2, p0, Landroid/graphics/Rect;->left:I

    int-to-float p2, p2

    mul-float/2addr p2, p1

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p2, v0

    float-to-int p2, p2

    iput p2, p0, Landroid/graphics/Rect;->left:I

    .line 5
    iget p2, p0, Landroid/graphics/Rect;->top:I

    int-to-float p2, p2

    mul-float/2addr p2, p1

    add-float/2addr p2, v0

    float-to-int p2, p2

    iput p2, p0, Landroid/graphics/Rect;->top:I

    .line 6
    iget p2, p0, Landroid/graphics/Rect;->right:I

    int-to-float p2, p2

    mul-float/2addr p2, p1

    add-float/2addr p2, v0

    float-to-int p2, p2

    iput p2, p0, Landroid/graphics/Rect;->right:I

    .line 7
    iget p2, p0, Landroid/graphics/Rect;->bottom:I

    int-to-float p2, p2

    mul-float/2addr p2, p1

    add-float/2addr p2, v0

    float-to-int p1, p2

    iput p1, p0, Landroid/graphics/Rect;->bottom:I

    :cond_1
    return-void
.end method

.method public static getDefaultCropSurfaceSize(Landroid/content/res/Resources;Landroid/view/Display;)Landroid/graphics/Point;
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 2
    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 3
    invoke-virtual {p1, v0, v1}, Landroid/view/Display;->getCurrentSizeRange(Landroid/graphics/Point;Landroid/graphics/Point;)V

    .line 4
    iget v2, v1, Landroid/graphics/Point;->x:I

    iget v1, v1, Landroid/graphics/Point;->y:I

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 5
    iget v1, v0, Landroid/graphics/Point;->x:I

    iget v0, v0, Landroid/graphics/Point;->y:I

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 6
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 7
    invoke-virtual {p1, v0}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 8
    iget v1, v0, Landroid/graphics/Point;->x:I

    iget v2, v0, Landroid/graphics/Point;->y:I

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 9
    iget v2, v0, Landroid/graphics/Point;->x:I

    iget v0, v0, Landroid/graphics/Point;->y:I

    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 10
    invoke-virtual {p1}, Landroid/view/Display;->getWidth()I

    move-result v2

    .line 11
    invoke-virtual {p1}, Landroid/view/Display;->getHeight()I

    move-result p1

    .line 12
    invoke-static {p0, v1, v0, v2, p1}, Lcom/android/wallpaper/util/WallpaperCropUtils;->calculateCropSurfaceSize(Landroid/content/res/Resources;IIII)Landroid/graphics/Point;

    move-result-object p0

    return-object p0
.end method

.method public static isRtl(Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
