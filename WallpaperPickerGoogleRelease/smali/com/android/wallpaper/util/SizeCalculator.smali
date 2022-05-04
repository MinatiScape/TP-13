.class public Lcom/android/wallpaper/util/SizeCalculator;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static getActivityWindowWidthPx(Landroid/app/Activity;)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object p0

    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p0

    .line 2
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 3
    invoke-virtual {p0, v0}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 4
    iget p0, v0, Landroid/graphics/Point;->x:I

    return p0
.end method

.method public static getColor(Landroid/content/Context;II)I
    .locals 0

    .line 3
    invoke-static {p0, p1}, Lcom/google/android/material/resources/MaterialAttributes;->resolve(Landroid/content/Context;I)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 4
    iget p0, p0, Landroid/util/TypedValue;->data:I

    return p0

    :cond_0
    return p2
.end method

.method public static getColor(Landroid/view/View;I)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object p0

    .line 2
    invoke-static {v0, p1, p0}, Lcom/google/android/material/resources/MaterialAttributes;->resolveOrThrow(Landroid/content/Context;ILjava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static getFeaturedCategoryTileSize(Landroid/app/Activity;)Landroid/graphics/Point;
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 2
    invoke-static {p0}, Lcom/android/wallpaper/util/SizeCalculator;->getActivityWindowWidthPx(Landroid/app/Activity;)I

    move-result v1

    const/4 v2, 0x2

    .line 3
    invoke-static {p0, v1, v2, v2}, Lcom/android/wallpaper/util/SizeCalculator;->getNumColumns(Landroid/content/Context;III)I

    move-result p0

    const v2, 0x7f070104

    .line 4
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    const v3, 0x7f070087

    .line 5
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 6
    invoke-static {p0, v1, v2, v0}, Lcom/android/wallpaper/util/SizeCalculator;->getSquareTileSize(IIII)Landroid/graphics/Point;

    move-result-object p0

    return-object p0
.end method

.method public static getNumColumns(Landroid/content/Context;III)I
    .locals 2

    const-string v0, "window"

    .line 1
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    .line 2
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 3
    invoke-static {}, Lcom/google/android/gms/internal/zzfit;->getInstance()Lcom/google/android/gms/internal/zzfit;

    move-result-object v1

    .line 4
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {v1, p0, v0}, Lcom/google/android/gms/internal/zzfit;->getDisplayMetrics(Landroid/content/res/Resources;Landroid/view/Display;)Landroid/util/DisplayMetrics;

    move-result-object p0

    int-to-float p1, p1

    .line 5
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr p1, p0

    float-to-int p0, p1

    const/16 p1, 0x2dc

    if-ge p0, p1, :cond_0

    return p2

    :cond_0
    return p3
.end method

.method public static getPreviewCornerRadius(Landroid/app/Activity;I)F
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getInstance()Lcom/android/wallpaper/util/ScreenSizeCalculator;

    move-result-object v0

    .line 2
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    .line 3
    invoke-virtual {v0, v1}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getScreenSize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object v0

    .line 4
    invoke-static {p0}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    move-result p0

    iget v0, v0, Landroid/graphics/Point;->x:I

    int-to-float v0, v0

    int-to-float p1, p1

    div-float/2addr v0, p1

    div-float/2addr p0, v0

    return p0
.end method

.method public static getSquareTileSize(IIII)Landroid/graphics/Point;
    .locals 0

    mul-int/lit8 p2, p2, 0x2

    mul-int/2addr p2, p0

    sub-int/2addr p1, p2

    mul-int/lit8 p3, p3, 0x2

    sub-int/2addr p1, p3

    int-to-float p1, p1

    int-to-float p0, p0

    div-float/2addr p1, p0

    .line 1
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    .line 2
    new-instance p1, Landroid/graphics/Point;

    invoke-direct {p1, p0, p0}, Landroid/graphics/Point;-><init>(II)V

    return-object p1
.end method

.method public static getSuggestedThumbnailSize(Landroid/content/Context;)Landroid/graphics/Point;
    .locals 4

    const-string v0, "window"

    .line 1
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager;

    .line 2
    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    .line 3
    new-instance v2, Landroid/graphics/Point;

    invoke-direct {v2}, Landroid/graphics/Point;-><init>()V

    .line 4
    invoke-virtual {v1, v2}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 5
    iget v1, v2, Landroid/graphics/Point;->x:I

    const/4 v2, 0x3

    const/4 v3, 0x4

    .line 6
    invoke-static {p0, v1, v2, v3}, Lcom/android/wallpaper/util/SizeCalculator;->getNumColumns(Landroid/content/Context;III)I

    move-result v2

    .line 7
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    .line 8
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 9
    invoke-static {}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getInstance()Lcom/android/wallpaper/util/ScreenSizeCalculator;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getScreenSize(Landroid/view/Display;)Landroid/graphics/Point;

    .line 10
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/Injector;->getFormFactorChecker(Landroid/content/Context;)Lcom/android/wallpaper/util/DownloadableUtils;

    move-result-object v0

    .line 11
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f07010e

    .line 13
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    add-int/lit8 v3, v2, 0x1

    mul-int/2addr v3, v0

    sub-int/2addr v1, v3

    int-to-float v0, v1

    int-to-float v1, v2

    div-float/2addr v0, v1

    .line 14
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v1

    const v2, 0x7f070110

    .line 15
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v0, v2

    const v2, 0x7f070111

    .line 16
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    int-to-float p0, p0

    div-float/2addr v0, p0

    .line 17
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p0

    .line 18
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0, v1, p0}, Landroid/graphics/Point;-><init>(II)V

    return-object v0
.end method

.method public static layer(IIF)I
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, p2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p2

    .line 2
    invoke-static {p1, p2}, Landroidx/core/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result p1

    .line 3
    invoke-static {p1, p0}, Landroidx/core/graphics/ColorUtils;->compositeColors(II)I

    move-result p0

    return p0
.end method
