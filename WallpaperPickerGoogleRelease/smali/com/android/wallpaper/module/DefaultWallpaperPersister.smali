.class public Lcom/android/wallpaper/module/DefaultWallpaperPersister;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/WallpaperPersister;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;
    }
.end annotation


# instance fields
.field public final mAppContext:Landroid/content/Context;

.field public final mDisplayUtils:Lcom/android/wallpaper/util/DisplayUtils;

.field public final mWallpaperChangedNotifier:Lcom/android/wallpaper/module/WallpaperChangedNotifier;

.field public mWallpaperInfoInPreview:Lcom/android/wallpaper/model/WallpaperInfo;

.field public final mWallpaperManager:Landroid/app/WallpaperManager;

.field public final mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

.field public final mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ServiceCast"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mAppContext:Landroid/content/Context;

    .line 3
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    const-string v1, "wallpaper"

    .line 4
    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/WallpaperManager;

    iput-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperManager:Landroid/app/WallpaperManager;

    .line 5
    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/Injector;->getWallpaperManagerCompat(Landroid/content/Context;)Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    move-result-object v1

    iput-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    .line 6
    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v1

    iput-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 7
    invoke-static {}, Lcom/android/wallpaper/module/WallpaperChangedNotifier;->getInstance()Lcom/android/wallpaper/module/WallpaperChangedNotifier;

    move-result-object v1

    iput-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperChangedNotifier:Lcom/android/wallpaper/module/WallpaperChangedNotifier;

    .line 8
    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/Injector;->getDisplayUtils(Landroid/content/Context;)Lcom/android/wallpaper/util/DisplayUtils;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mDisplayUtils:Lcom/android/wallpaper/util/DisplayUtils;

    return-void
.end method


# virtual methods
.method public final cropAndSetWallpaperBitmapInRotationStatic(Landroid/graphics/Bitmap;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)I
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    move-object/from16 v0, p0

    .line 1
    new-instance v3, Landroid/graphics/Point;

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-direct {v3, v1, v2}, Landroid/graphics/Point;-><init>(II)V

    .line 2
    iget-object v1, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mAppContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 3
    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mDisplayUtils:Lcom/android/wallpaper/util/DisplayUtils;

    invoke-virtual {v2}, Lcom/android/wallpaper/util/DisplayUtils;->getWallpaperDisplay()Landroid/view/Display;

    move-result-object v2

    .line 4
    invoke-static {v1, v2}, Lcom/android/wallpaper/util/WallpaperCropUtils;->getDefaultCropSurfaceSize(Landroid/content/res/Resources;Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object v4

    .line 5
    invoke-static {}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getInstance()Lcom/android/wallpaper/util/ScreenSizeCalculator;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getScreenSize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object v5

    .line 6
    invoke-static {v3, v5}, Lcom/android/wallpaper/util/WallpaperCropUtils;->calculateMinZoom(Landroid/graphics/Point;Landroid/graphics/Point;)F

    move-result v8

    .line 7
    iget-object v1, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mAppContext:Landroid/content/Context;

    .line 8
    invoke-static {v3, v5}, Lcom/android/wallpaper/util/WallpaperCropUtils;->calculateVisibleRect(Landroid/graphics/Point;Landroid/graphics/Point;)Landroid/graphics/Rect;

    move-result-object v2

    const/4 v6, 0x1

    .line 9
    invoke-static {v1, v2, v6}, Lcom/android/wallpaper/util/WallpaperCropUtils;->adjustCropRect(Landroid/content/Context;Landroid/graphics/Rect;Z)V

    .line 10
    new-instance v1, Landroid/graphics/PointF;

    invoke-virtual {v2}, Landroid/graphics/Rect;->centerX()I

    move-result v6

    int-to-float v6, v6

    .line 11
    invoke-virtual {v2}, Landroid/graphics/Rect;->centerY()I

    move-result v2

    int-to-float v2, v2

    invoke-direct {v1, v6, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 12
    new-instance v2, Landroid/graphics/Point;

    iget v6, v1, Landroid/graphics/PointF;->x:F

    mul-float/2addr v6, v8

    float-to-int v6, v6

    iget v1, v1, Landroid/graphics/PointF;->y:F

    mul-float/2addr v1, v8

    float-to-int v1, v1

    invoke-direct {v2, v6, v1}, Landroid/graphics/Point;-><init>(II)V

    .line 13
    iget v1, v5, Landroid/graphics/Point;->x:I

    div-int/lit8 v1, v1, 0x2

    iget v6, v2, Landroid/graphics/Point;->x:I

    sub-int/2addr v1, v6

    neg-int v1, v1

    const/4 v9, 0x0

    invoke-static {v9, v1}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 14
    iget v1, v5, Landroid/graphics/Point;->y:I

    div-int/lit8 v1, v1, 0x2

    iget v2, v2, Landroid/graphics/Point;->y:I

    sub-int/2addr v1, v2

    neg-int v1, v1

    invoke-static {v9, v1}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 15
    iget-object v1, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mAppContext:Landroid/content/Context;

    move v2, v8

    invoke-static/range {v1 .. v7}, Lcom/android/wallpaper/util/WallpaperCropUtils;->calculateCropRect(Landroid/content/Context;FLandroid/graphics/Point;Landroid/graphics/Point;Landroid/graphics/Point;II)Landroid/graphics/Rect;

    move-result-object v1

    .line 16
    new-instance v2, Landroid/graphics/Rect;

    iget v3, v1, Landroid/graphics/Rect;->left:I

    int-to-float v3, v3

    div-float/2addr v3, v8

    float-to-double v3, v3

    .line 17
    invoke-static {v3, v4}, Ljava/lang/Math;->floor(D)D

    move-result-wide v3

    double-to-int v3, v3

    iget v4, v1, Landroid/graphics/Rect;->top:I

    int-to-float v4, v4

    div-float/2addr v4, v8

    float-to-double v4, v4

    .line 18
    invoke-static {v4, v5}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    double-to-int v4, v4

    iget v5, v1, Landroid/graphics/Rect;->right:I

    int-to-float v5, v5

    div-float/2addr v5, v8

    float-to-double v5, v5

    .line 19
    invoke-static {v5, v6}, Ljava/lang/Math;->floor(D)D

    move-result-wide v5

    double-to-int v5, v5

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v1, v1

    div-float/2addr v1, v8

    float-to-double v6, v1

    .line 20
    invoke-static {v6, v7}, Ljava/lang/Math;->floor(D)D

    move-result-wide v6

    double-to-int v1, v6

    invoke-direct {v2, v3, v4, v5, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 21
    iget v1, v2, Landroid/graphics/Rect;->left:I

    iget v3, v2, Landroid/graphics/Rect;->top:I

    .line 22
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v4

    .line 23
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    move-object/from16 v5, p1

    .line 24
    invoke-static {v5, v1, v3, v4, v2}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v15

    .line 25
    invoke-virtual/range {p0 .. p0}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->getDefaultWhichWallpaper()I

    move-result v1

    .line 26
    invoke-virtual {v0, v15, v9, v1}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->setBitmapToWallpaperManagerCompat(Landroid/graphics/Bitmap;ZI)I

    move-result v1

    if-lez v1, :cond_0

    .line 27
    iget-object v10, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v11

    .line 28
    invoke-static {v15}, Landroid/app/WallpaperColors;->fromBitmap(Landroid/graphics/Bitmap;)Landroid/app/WallpaperColors;

    move-result-object v16

    move-object/from16 v12, p2

    move-object/from16 v13, p3

    move-object/from16 v14, p4

    .line 29
    invoke-interface/range {v10 .. v16}, Lcom/android/wallpaper/module/WallpaperPreferences;->storeLatestHomeWallpaper(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/app/WallpaperColors;)V

    :cond_0
    return v1
.end method

.method public getDefaultWhichWallpaper()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->isSeparateLockScreenWallpaperSet()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x3

    :goto_0
    return p0
.end method

.method public final isSeparateLockScreenWallpaperSet()Z
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->getWallpaperFile(I)Landroid/os/ParcelFileDescriptor;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 v0, 0x1

    .line 3
    :try_start_0
    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v1, "WallpaperPersister"

    const-string v2, "Unable to close PFD for lock wallpaper"

    .line 4
    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onLiveWallpaperSet()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {v0}, Landroid/app/WallpaperManager;->getWallpaperInfo()Landroid/app/WallpaperInfo;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperInfoInPreview:Lcom/android/wallpaper/model/WallpaperInfo;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 3
    invoke-virtual {v1}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperComponent()Landroid/app/WallpaperInfo;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v2

    :goto_0
    if-eqz v0, :cond_2

    if-eqz v1, :cond_2

    .line 4
    invoke-virtual {v0}, Landroid/app/WallpaperInfo;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 5
    invoke-virtual {v1}, Landroid/app/WallpaperInfo;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_1

    .line 6
    :cond_1
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperInfoInPreview:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 7
    invoke-virtual {v0}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperComponent()Landroid/app/WallpaperInfo;

    move-result-object v0

    .line 8
    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->clearHomeWallpaperMetadata()V

    .line 9
    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperInfoInPreview:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v3, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mAppContext:Landroid/content/Context;

    .line 10
    invoke-virtual {v2, v3}, Lcom/android/wallpaper/model/WallpaperInfo;->getAttributions(Landroid/content/Context;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperAttributions(Ljava/util/List;)V

    .line 11
    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 12
    invoke-virtual {v0}, Landroid/app/WallpaperInfo;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 13
    invoke-interface {v1, v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperPackageName(Ljava/lang/String;)V

    .line 14
    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 15
    invoke-virtual {v0}, Landroid/app/WallpaperInfo;->getServiceName()Ljava/lang/String;

    move-result-object v0

    .line 16
    invoke-interface {v1, v0}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperServiceName(Ljava/lang/String;)V

    .line 17
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperInfoInPreview:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mAppContext:Landroid/content/Context;

    .line 18
    invoke-virtual {v1, v2}, Lcom/android/wallpaper/model/WallpaperInfo;->getCollectionId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 19
    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperCollectionId(Ljava/lang/String;)V

    .line 20
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->setWallpaperPresentationMode(I)V

    .line 21
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {p0}, Lcom/android/wallpaper/module/WallpaperPreferences;->clearDailyRotations()V

    return-void

    .line 22
    :cond_2
    :goto_1
    iput-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperInfoInPreview:Lcom/android/wallpaper/model/WallpaperInfo;

    return-void
.end method

.method public saveStaticWallpaperMetadata(Ljava/util/List;Ljava/lang/String;IILjava/lang/String;I)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "II",
            "Ljava/lang/String;",
            "I)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {v0}, Lcom/android/wallpaper/module/WallpaperPreferences;->clearHomeWallpaperMetadata()V

    .line 2
    invoke-virtual {p0}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->isSeparateLockScreenWallpaperSet()Z

    move-result v0

    .line 3
    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {v1, p6}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperManagerId(I)V

    if-nez v0, :cond_0

    .line 4
    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {v1, p6}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLockWallpaperId(I)V

    .line 5
    :cond_0
    iget-object p6, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {p6, p1}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperAttributions(Ljava/util/List;)V

    .line 6
    iget-object p6, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {p6, p2}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperActionUrl(Ljava/lang/String;)V

    .line 7
    iget-object p6, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {p6, p3}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperActionLabelRes(I)V

    .line 8
    iget-object p6, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {p6, p4}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperActionIconRes(I)V

    .line 9
    iget-object p6, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    const/4 v1, 0x0

    invoke-interface {p6, v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperBaseImageUrl(Ljava/lang/String;)V

    .line 10
    iget-object p6, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {p6, p5}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperCollectionId(Ljava/lang/String;)V

    if-nez v0, :cond_1

    .line 11
    iget-object p6, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {p6, p1}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLockWallpaperAttributions(Ljava/util/List;)V

    .line 12
    iget-object p1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {p1, p2}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLockWallpaperActionUrl(Ljava/lang/String;)V

    .line 13
    iget-object p1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {p1, p3}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLockWallpaperActionLabelRes(I)V

    .line 14
    iget-object p1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {p1, p4}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLockWallpaperActionIconRes(I)V

    .line 15
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {p0, p5}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLockWallpaperCollectionId(Ljava/lang/String;)V

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method public setBitmapToWallpaperManagerCompat(Landroid/graphics/Bitmap;ZI)I
    .locals 5

    .line 1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 2
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v2, 0x64

    invoke-virtual {p1, v1, v2, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const-string v4, "WallpaperPersister"

    if-eqz v1, :cond_0

    .line 3
    :try_start_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    .line 4
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {p0, v0, v3, p2, p3}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->setStream(Ljava/io/InputStream;Landroid/graphics/Rect;ZI)I

    move-result p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    const-string p0, "unable to write stream to wallpaper manager"

    .line 5
    invoke-static {v4, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_0
    const-string v0, "unable to compress wallpaper"

    .line 6
    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 7
    :try_start_1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    invoke-virtual {p0, p1, v3, p2, p3}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->setBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;ZI)I

    move-result p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    return p0

    :catch_1
    const-string p0, "unable to set wallpaper"

    .line 8
    invoke-static {v4, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2
.end method

.method public final setIndividualWallpaper(Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Bitmap;ILcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V
    .locals 7

    .line 11
    new-instance v6, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;

    move-object v0, v6

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;-><init>(Lcom/android/wallpaper/module/DefaultWallpaperPersister;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Bitmap;ILcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Void;

    .line 12
    invoke-virtual {v6, p0}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public setIndividualWallpaper(Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/asset/Asset;Landroid/graphics/Rect;FILcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V
    .locals 7

    if-nez p3, :cond_0

    .line 1
    instance-of v0, p2, Lcom/android/wallpaper/asset/StreamableAsset;

    if-eqz v0, :cond_0

    .line 2
    check-cast p2, Lcom/android/wallpaper/asset/StreamableAsset;

    new-instance p3, Lcom/android/wallpaper/module/DefaultWallpaperPersister$1;

    invoke-direct {p3, p0, p6, p1, p5}, Lcom/android/wallpaper/module/DefaultWallpaperPersister$1;-><init>(Lcom/android/wallpaper/module/DefaultWallpaperPersister;Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;Lcom/android/wallpaper/model/WallpaperInfo;I)V

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    new-instance p0, Lcom/android/wallpaper/asset/StreamableAsset$1;

    invoke-direct {p0, p2, p3}, Lcom/android/wallpaper/asset/StreamableAsset$1;-><init>(Lcom/android/wallpaper/asset/StreamableAsset;Lcom/android/wallpaper/asset/StreamableAsset$StreamReceiver;)V

    sget-object p1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 p2, 0x0

    new-array p2, p2, [Ljava/lang/Void;

    .line 4
    invoke-virtual {p0, p1, p2}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void

    :cond_0
    if-nez p3, :cond_1

    .line 5
    iget-object p3, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mAppContext:Landroid/content/Context;

    const-string p4, "window"

    invoke-virtual {p3, p4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/view/WindowManager;

    .line 6
    invoke-interface {p3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p3

    .line 7
    invoke-static {}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getInstance()Lcom/android/wallpaper/util/ScreenSizeCalculator;

    move-result-object p4

    invoke-virtual {p4, p3}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getScreenSize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object p3

    .line 8
    iget p4, p3, Landroid/graphics/Point;->x:I

    iget p3, p3, Landroid/graphics/Point;->y:I

    new-instance v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$2;

    invoke-direct {v0, p0, p6, p1, p5}, Lcom/android/wallpaper/module/DefaultWallpaperPersister$2;-><init>(Lcom/android/wallpaper/module/DefaultWallpaperPersister;Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;Lcom/android/wallpaper/model/WallpaperInfo;I)V

    invoke-virtual {p2, p4, p3, v0}, Lcom/android/wallpaper/asset/Asset;->decodeBitmap(IILcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    return-void

    .line 9
    :cond_1
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/wallpaper/module/Injector;->getBitmapCropper()Lcom/android/wallpaper/module/BitmapCropper;

    move-result-object v0

    const/4 v5, 0x0

    .line 10
    new-instance v6, Lcom/android/wallpaper/module/DefaultWallpaperPersister$3;

    invoke-direct {v6, p0, p1, p5, p6}, Lcom/android/wallpaper/module/DefaultWallpaperPersister$3;-><init>(Lcom/android/wallpaper/module/DefaultWallpaperPersister;Lcom/android/wallpaper/model/WallpaperInfo;ILcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V

    move-object v1, v0

    check-cast v1, Lcom/android/wallpaper/module/DefaultBitmapCropper;

    move-object v2, p2

    move v3, p4

    move-object v4, p3

    invoke-virtual/range {v1 .. v6}, Lcom/android/wallpaper/module/DefaultBitmapCropper;->cropAndScaleBitmap(Lcom/android/wallpaper/asset/Asset;FLandroid/graphics/Rect;ZLcom/android/wallpaper/module/BitmapCropper$Callback;)V

    return-void
.end method

.method public setIndividualWallpaperWithPosition(Landroid/app/Activity;Lcom/android/wallpaper/model/WallpaperInfo;ILcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mAppContext:Landroid/content/Context;

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    .line 2
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 3
    invoke-static {}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getInstance()Lcom/android/wallpaper/util/ScreenSizeCalculator;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getScreenSize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object v8

    .line 4
    invoke-virtual {p2, p1}, Lcom/android/wallpaper/model/WallpaperInfo;->getAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object v0

    .line 5
    new-instance v1, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;

    move-object v2, v1

    move-object v3, p0

    move-object v4, p4

    move v5, p3

    move-object v6, p2

    move-object v7, v0

    invoke-direct/range {v2 .. v8}, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;-><init>(Lcom/android/wallpaper/module/DefaultWallpaperPersister;Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;ILcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/asset/Asset;Landroid/graphics/Point;)V

    invoke-virtual {v0, p1, v1}, Lcom/android/wallpaper/asset/Asset;->decodeRawDimensions(Landroid/app/Activity;Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;)V

    return-void
.end method

.method public setWallpaperInRotation(Landroid/graphics/Bitmap;Ljava/util/List;IILjava/lang/String;Ljava/lang/String;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;II",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2, p5, p6}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->cropAndSetWallpaperBitmapInRotationStatic(Landroid/graphics/Bitmap;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    if-nez v6, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    move-object v0, p0

    move-object v1, p2

    move-object v2, p5

    move v3, p3

    move v4, p4

    move-object v5, p6

    .line 2
    invoke-virtual/range {v0 .. v6}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->saveStaticWallpaperMetadata(Ljava/util/List;Ljava/lang/String;IILjava/lang/String;I)Z

    const/4 p0, 0x1

    :goto_0
    return p0
.end method
