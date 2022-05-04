.class public Lcom/android/customization/widget/GridTileDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# instance fields
.field public final mCols:I

.field public final mPaint:Landroid/graphics/Paint;

.field public final mRows:I

.field public final mScaleMatrix:Landroid/graphics/Matrix;

.field public final mShapePath:Landroid/graphics/Path;

.field public final mTransformedPath:Landroid/graphics/Path;


# direct methods
.method public constructor <init>(IILjava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/android/customization/widget/GridTileDrawable;->mPaint:Landroid/graphics/Paint;

    .line 3
    iput p1, p0, Lcom/android/customization/widget/GridTileDrawable;->mCols:I

    .line 4
    iput p2, p0, Lcom/android/customization/widget/GridTileDrawable;->mRows:I

    .line 5
    invoke-static {p3}, Landroidx/core/graphics/PathParser;->createPathFromPathData(Ljava/lang/String;)Landroid/graphics/Path;

    move-result-object p1

    iput-object p1, p0, Lcom/android/customization/widget/GridTileDrawable;->mShapePath:Landroid/graphics/Path;

    .line 6
    new-instance p2, Landroid/graphics/Path;

    invoke-direct {p2, p1}, Landroid/graphics/Path;-><init>(Landroid/graphics/Path;)V

    iput-object p2, p0, Lcom/android/customization/widget/GridTileDrawable;->mTransformedPath:Landroid/graphics/Path;

    .line 7
    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/android/customization/widget/GridTileDrawable;->mScaleMatrix:Landroid/graphics/Matrix;

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 14

    .line 1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-double v0, v0

    const/4 v2, 0x0

    move v3, v2

    .line 2
    :goto_0
    iget v4, p0, Lcom/android/customization/widget/GridTileDrawable;->mRows:I

    if-ge v3, v4, :cond_1

    move v4, v2

    .line 3
    :goto_1
    iget v5, p0, Lcom/android/customization/widget/GridTileDrawable;->mCols:I

    if-ge v4, v5, :cond_0

    .line 4
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v5

    int-to-double v6, v3

    mul-double/2addr v6, v0

    .line 5
    iget v8, p0, Lcom/android/customization/widget/GridTileDrawable;->mRows:I

    int-to-double v8, v8

    div-double/2addr v6, v8

    const-wide/high16 v8, 0x4018000000000000L    # 6.0

    add-double/2addr v6, v8

    double-to-float v6, v6

    int-to-double v10, v4

    mul-double/2addr v10, v0

    .line 6
    iget v7, p0, Lcom/android/customization/widget/GridTileDrawable;->mCols:I

    int-to-double v12, v7

    div-double/2addr v10, v12

    add-double/2addr v10, v8

    double-to-float v7, v10

    .line 7
    invoke-virtual {p1, v6, v7}, Landroid/graphics/Canvas;->translate(FF)V

    .line 8
    iget-object v6, p0, Lcom/android/customization/widget/GridTileDrawable;->mTransformedPath:Landroid/graphics/Path;

    iget-object v7, p0, Lcom/android/customization/widget/GridTileDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v6, v7}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 9
    invoke-virtual {p1, v5}, Landroid/graphics/Canvas;->restoreToCount(I)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public getOpacity()I
    .locals 0

    const/4 p0, -0x3

    return p0
.end method

.method public onBoundsChange(Landroid/graphics/Rect;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 2
    iget v0, p0, Lcom/android/customization/widget/GridTileDrawable;->mRows:I

    iget v1, p0, Lcom/android/customization/widget/GridTileDrawable;->mCols:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 3
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result p1

    int-to-float p1, p1

    int-to-float v0, v0

    div-float/2addr p1, v0

    const/high16 v0, 0x41400000    # 12.0f

    sub-float/2addr p1, v0

    const/high16 v0, 0x42c80000    # 100.0f

    div-float/2addr p1, v0

    .line 4
    iget-object v0, p0, Lcom/android/customization/widget/GridTileDrawable;->mScaleMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p1}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 5
    iget-object p1, p0, Lcom/android/customization/widget/GridTileDrawable;->mShapePath:Landroid/graphics/Path;

    iget-object v0, p0, Lcom/android/customization/widget/GridTileDrawable;->mScaleMatrix:Landroid/graphics/Matrix;

    iget-object p0, p0, Lcom/android/customization/widget/GridTileDrawable;->mTransformedPath:Landroid/graphics/Path;

    invoke-virtual {p1, v0, p0}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;Landroid/graphics/Path;)V

    return-void
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/customization/widget/GridTileDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/customization/widget/GridTileDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    return-void
.end method
