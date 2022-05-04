.class public Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static sInstance:Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;


# instance fields
.field public mFifeImageUrlUtil:Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;

    invoke-direct {v0}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;-><init>()V

    iput-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;->mFifeImageUrlUtil:Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;

    return-void
.end method

.method public static getInstance()Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;->sInstance:Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;

    invoke-direct {v0}, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;-><init>()V

    sput-object v0, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;->sInstance:Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;

    .line 3
    :cond_0
    sget-object v0, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;->sInstance:Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;

    return-object v0
.end method


# virtual methods
.method public final calculateAndAddSize(Landroid/content/Context;Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$Options;)I
    .locals 4

    const-string p0, "window"

    .line 1
    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/WindowManager;

    .line 2
    invoke-static {}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getInstance()Lcom/android/wallpaper/util/ScreenSizeCalculator;

    move-result-object p1

    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getScreenSize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object p0

    .line 3
    iget p1, p0, Landroid/graphics/Point;->x:I

    iget p0, p0, Landroid/graphics/Point;->y:I

    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    int-to-float p0, p0

    float-to-double p0, p0

    const-wide/high16 v0, 0x3ff8000000000000L    # 1.5

    mul-double/2addr p0, v0

    double-to-int p0, p0

    const/4 p1, 0x0

    .line 4
    invoke-virtual {p2, p0, p1}, Lcom/google/photos/base/ImageUrlOptionsStringBuilder;->setSize(IZ)Lcom/google/photos/base/ImageUrlOptionsStringBuilder;

    .line 5
    iget-object v0, p2, Lcom/google/photos/base/ImageUrlOptionsStringBuilder;->options:Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    const/16 v1, 0x5a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 6
    sget-object v2, Lcom/google/photos/base/ImageUrlOptionsEnum;->QUALITY_LEVEL:Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v3, "QualityLevel"

    invoke-virtual {v0, v2, v1, v3}, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->setOptionWithReadableError(Lcom/google/photos/base/ImageUrlOptionsEnum;Ljava/lang/Object;Ljava/lang/String;)Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    .line 7
    iget-object p2, p2, Lcom/google/photos/base/ImageUrlOptionsStringBuilder;->options:Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    .line 8
    invoke-virtual {p2, v2, p1}, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->setIsSigned(Lcom/google/photos/base/ImageUrlOptionsEnum;Z)Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    return p0
.end method

.method public createDesktopUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;
    .locals 8

    const-string p0, "window"

    .line 1
    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/WindowManager;

    .line 2
    invoke-static {}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getInstance()Lcom/android/wallpaper/util/ScreenSizeCalculator;

    move-result-object v0

    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getScreenSize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object p0

    .line 3
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 4
    new-instance v1, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;

    invoke-direct {v1}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;-><init>()V

    .line 5
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;->isFifeHostedUri(Landroid/net/Uri;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 6
    new-instance v2, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$Options;

    invoke-direct {v2}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$Options;-><init>()V

    .line 7
    iget v3, p0, Landroid/graphics/Point;->x:I

    .line 8
    iget-object v4, v2, Lcom/google/photos/base/ImageUrlOptionsStringBuilder;->options:Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 9
    sget-object v5, Lcom/google/photos/base/ImageUrlOptionsEnum;->WIDTH:Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v6, "Width"

    invoke-virtual {v4, v5, v3, v6}, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->setOptionWithReadableError(Lcom/google/photos/base/ImageUrlOptionsEnum;Ljava/lang/Object;Ljava/lang/String;)Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    .line 10
    iget-object v3, v2, Lcom/google/photos/base/ImageUrlOptionsStringBuilder;->options:Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    const/4 v4, 0x0

    .line 11
    invoke-virtual {v3, v5, v4}, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->setIsSigned(Lcom/google/photos/base/ImageUrlOptionsEnum;Z)Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    .line 12
    iget v3, p0, Landroid/graphics/Point;->y:I

    .line 13
    iget-object v5, v2, Lcom/google/photos/base/ImageUrlOptionsStringBuilder;->options:Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 14
    sget-object v6, Lcom/google/photos/base/ImageUrlOptionsEnum;->HEIGHT:Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v7, "Height"

    invoke-virtual {v5, v6, v3, v7}, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->setOptionWithReadableError(Lcom/google/photos/base/ImageUrlOptionsEnum;Ljava/lang/Object;Ljava/lang/String;)Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    .line 15
    iget-object v3, v2, Lcom/google/photos/base/ImageUrlOptionsStringBuilder;->options:Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    .line 16
    invoke-virtual {v3, v6, v4}, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->setIsSigned(Lcom/google/photos/base/ImageUrlOptionsEnum;Z)Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    .line 17
    iget-object v3, v2, Lcom/google/photos/base/ImageUrlOptionsStringBuilder;->options:Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 18
    sget-object v6, Lcom/google/photos/base/ImageUrlOptionsEnum;->CENTER_CROP:Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v7, "CenterCrop"

    invoke-virtual {v3, v6, v5, v7}, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->setOptionWithReadableError(Lcom/google/photos/base/ImageUrlOptionsEnum;Ljava/lang/Object;Ljava/lang/String;)Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    .line 19
    iget-object v3, v2, Lcom/google/photos/base/ImageUrlOptionsStringBuilder;->options:Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    .line 20
    invoke-virtual {v3, v6, v4}, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->setIsSigned(Lcom/google/photos/base/ImageUrlOptionsEnum;Z)Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    .line 21
    :try_start_0
    invoke-virtual {v1, v2, v0}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;->mergeOptions(Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$Options;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p0
    :try_end_0
    .catch Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$InvalidUrlException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 22
    :catch_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to merge FIFE URL options for size "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " on URL "

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p2, "FifeImageUrlFactory"

    invoke-static {p2, p0, p1}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    :cond_0
    return-object v0
.end method

.method public createFullSizedUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;
    .locals 3

    .line 1
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;->mFifeImageUrlUtil:Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;

    invoke-virtual {v1, v0}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;->isFifeHostedUri(Landroid/net/Uri;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3
    new-instance v1, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$Options;

    invoke-direct {v1}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$Options;-><init>()V

    .line 4
    invoke-virtual {p0, p1, v1}, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;->calculateAndAddSize(Landroid/content/Context;Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$Options;)I

    move-result v2

    .line 5
    :try_start_0
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;->mFifeImageUrlUtil:Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;

    invoke-virtual {p0, v1, v0}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;->mergeOptions(Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$Options;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p0
    :try_end_0
    .catch Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$InvalidUrlException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 6
    :catch_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Unable to merge FIFE URL options for size "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " on URL "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "FifeImageUrlFactory"

    invoke-static {v0, p0, p1}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 7
    :cond_0
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public createRotatingWallpaperUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;
    .locals 4

    const-string v0, "window"

    .line 1
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    .line 2
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 3
    invoke-static {v1, v0}, Lcom/android/wallpaper/util/WallpaperCropUtils;->getDefaultCropSurfaceSize(Landroid/content/res/Resources;Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object v0

    .line 4
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 5
    new-instance v2, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;

    invoke-direct {v2}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;-><init>()V

    .line 6
    invoke-virtual {v2, v1}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;->isFifeHostedUri(Landroid/net/Uri;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 7
    new-instance v3, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$Options;

    invoke-direct {v3}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$Options;-><init>()V

    .line 8
    invoke-virtual {p0, p1, v3}, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;->calculateAndAddSize(Landroid/content/Context;Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$Options;)I

    .line 9
    :try_start_0
    invoke-virtual {v2, v3, v1}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;->mergeOptions(Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$Options;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p0
    :try_end_0
    .catch Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$InvalidUrlException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 10
    :catch_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to merge FIFE URL options for size "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " on URL "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p2, "FifeImageUrlFactory"

    invoke-static {p2, p0, p1}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    :cond_0
    return-object v1
.end method

.method public createThumbUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;
    .locals 8

    .line 1
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;->mFifeImageUrlUtil:Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;

    invoke-virtual {v1, v0}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;->isFifeHostedUri(Landroid/net/Uri;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3
    new-instance v1, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$Options;

    invoke-direct {v1}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$Options;-><init>()V

    .line 4
    invoke-static {p1}, Lcom/android/wallpaper/util/SizeCalculator;->getSuggestedThumbnailSize(Landroid/content/Context;)Landroid/graphics/Point;

    move-result-object v2

    .line 5
    iget v3, v2, Landroid/graphics/Point;->x:I

    iget v2, v2, Landroid/graphics/Point;->y:I

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    const/4 v3, 0x0

    .line 6
    invoke-virtual {v1, v2, v3}, Lcom/google/photos/base/ImageUrlOptionsStringBuilder;->setSize(IZ)Lcom/google/photos/base/ImageUrlOptionsStringBuilder;

    const/4 v4, 0x1

    .line 7
    iget-object v5, v1, Lcom/google/photos/base/ImageUrlOptionsStringBuilder;->options:Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 8
    sget-object v6, Lcom/google/photos/base/ImageUrlOptionsEnum;->QUALITY_BUCKET:Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v7, "QualityBucket"

    invoke-virtual {v5, v6, v4, v7}, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->setOptionWithReadableError(Lcom/google/photos/base/ImageUrlOptionsEnum;Ljava/lang/Object;Ljava/lang/String;)Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    .line 9
    iget-object v4, v1, Lcom/google/photos/base/ImageUrlOptionsStringBuilder;->options:Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    .line 10
    invoke-virtual {v4, v6, v3}, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->setIsSigned(Lcom/google/photos/base/ImageUrlOptionsEnum;Z)Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    .line 11
    :try_start_0
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;->mFifeImageUrlUtil:Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;

    invoke-virtual {p0, v1, v0}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;->mergeOptions(Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$Options;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p0
    :try_end_0
    .catch Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$InvalidUrlException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 12
    :catch_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Unable to merge FIFE URL options for size "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " on URL "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "FifeImageUrlFactory"

    invoke-static {v0, p0, p1}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 13
    :cond_0
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public createTinyUri(Ljava/lang/String;)Landroid/net/Uri;
    .locals 7

    .line 1
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;->mFifeImageUrlUtil:Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;

    invoke-virtual {v1, v0}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;->isFifeHostedUri(Landroid/net/Uri;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3
    new-instance v1, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$Options;

    invoke-direct {v1}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$Options;-><init>()V

    const/16 v2, 0x32

    const/4 v3, 0x0

    .line 4
    invoke-virtual {v1, v2, v3}, Lcom/google/photos/base/ImageUrlOptionsStringBuilder;->setSize(IZ)Lcom/google/photos/base/ImageUrlOptionsStringBuilder;

    const/4 v2, 0x1

    .line 5
    iget-object v4, v1, Lcom/google/photos/base/ImageUrlOptionsStringBuilder;->options:Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 6
    sget-object v5, Lcom/google/photos/base/ImageUrlOptionsEnum;->QUALITY_BUCKET:Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v6, "QualityBucket"

    invoke-virtual {v4, v5, v2, v6}, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->setOptionWithReadableError(Lcom/google/photos/base/ImageUrlOptionsEnum;Ljava/lang/Object;Ljava/lang/String;)Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    .line 7
    iget-object v2, v1, Lcom/google/photos/base/ImageUrlOptionsStringBuilder;->options:Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    .line 8
    invoke-virtual {v2, v5, v3}, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->setIsSigned(Lcom/google/photos/base/ImageUrlOptionsEnum;Z)Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    .line 9
    :try_start_0
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/FifeImageUrlFactory;->mFifeImageUrlUtil:Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;

    invoke-virtual {p0, v1, v0}, Lcom/google/android/libraries/imageurl/FifeImageUrlUtil;->mergeOptions(Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$Options;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p0
    :try_end_0
    .catch Lcom/google/android/libraries/imageurl/FifeImageUrlUtil$InvalidUrlException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 10
    :catch_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Unable to merge FIFE URL options for size 50 on URL "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "FifeImageUrlFactory"

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    :cond_0
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method
