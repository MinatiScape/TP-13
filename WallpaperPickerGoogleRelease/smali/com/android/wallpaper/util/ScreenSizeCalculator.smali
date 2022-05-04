.class public Lcom/android/wallpaper/util/ScreenSizeCalculator;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static sInstance:Lcom/android/wallpaper/util/ScreenSizeCalculator;


# instance fields
.field public mLandscapeScreenSize:Landroid/graphics/Point;

.field public mPortraitScreenSize:Landroid/graphics/Point;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/android/wallpaper/util/ScreenSizeCalculator;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/wallpaper/util/ScreenSizeCalculator;->sInstance:Lcom/android/wallpaper/util/ScreenSizeCalculator;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/android/wallpaper/util/ScreenSizeCalculator;

    invoke-direct {v0}, Lcom/android/wallpaper/util/ScreenSizeCalculator;-><init>()V

    sput-object v0, Lcom/android/wallpaper/util/ScreenSizeCalculator;->sInstance:Lcom/android/wallpaper/util/ScreenSizeCalculator;

    .line 3
    :cond_0
    sget-object v0, Lcom/android/wallpaper/util/ScreenSizeCalculator;->sInstance:Lcom/android/wallpaper/util/ScreenSizeCalculator;

    return-object v0
.end method


# virtual methods
.method public final getPortraitScreenSize(Landroid/view/Display;)Landroid/graphics/Point;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/util/ScreenSizeCalculator;->mPortraitScreenSize:Landroid/graphics/Point;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lcom/android/wallpaper/util/ScreenSizeCalculator;->mPortraitScreenSize:Landroid/graphics/Point;

    .line 3
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/util/ScreenSizeCalculator;->mPortraitScreenSize:Landroid/graphics/Point;

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 5
    new-instance p1, Landroid/graphics/Point;

    iget-object p0, p0, Lcom/android/wallpaper/util/ScreenSizeCalculator;->mPortraitScreenSize:Landroid/graphics/Point;

    invoke-direct {p1, p0}, Landroid/graphics/Point;-><init>(Landroid/graphics/Point;)V

    return-object p1
.end method

.method public getScreenAspectRatio(Landroid/content/Context;)F
    .locals 1

    .line 1
    const-class v0, Landroid/view/WindowManager;

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/WindowManager;

    .line 2
    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getScreenSize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object p0

    .line 3
    iget p1, p0, Landroid/graphics/Point;->y:I

    int-to-float p1, p1

    iget p0, p0, Landroid/graphics/Point;->x:I

    int-to-float p0, p0

    div-float/2addr p1, p0

    return p1
.end method

.method public getScreenSize(Landroid/view/Display;)Landroid/graphics/Point;
    .locals 2

    .line 1
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const-string v0, "Unknown device orientation: "

    .line 2
    invoke-static {v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 3
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget v1, v1, Landroid/content/res/Configuration;->orientation:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ScreenSizeCalculator"

    .line 4
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getPortraitScreenSize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object p0

    return-object p0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/util/ScreenSizeCalculator;->mLandscapeScreenSize:Landroid/graphics/Point;

    if-nez v0, :cond_1

    .line 7
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lcom/android/wallpaper/util/ScreenSizeCalculator;->mLandscapeScreenSize:Landroid/graphics/Point;

    .line 8
    :cond_1
    iget-object v0, p0, Lcom/android/wallpaper/util/ScreenSizeCalculator;->mLandscapeScreenSize:Landroid/graphics/Point;

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 10
    new-instance p1, Landroid/graphics/Point;

    iget-object p0, p0, Lcom/android/wallpaper/util/ScreenSizeCalculator;->mLandscapeScreenSize:Landroid/graphics/Point;

    invoke-direct {p1, p0}, Landroid/graphics/Point;-><init>(Landroid/graphics/Point;)V

    return-object p1

    .line 11
    :cond_2
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getPortraitScreenSize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object p0

    return-object p0
.end method
