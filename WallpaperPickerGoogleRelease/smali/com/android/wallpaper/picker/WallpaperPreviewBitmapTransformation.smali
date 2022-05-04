.class public Lcom/android/wallpaper/picker/WallpaperPreviewBitmapTransformation;
.super Lcom/bumptech/glide/load/resource/bitmap/BitmapTransformation;
.source "SourceFile"


# instance fields
.field public final mContext:Landroid/content/Context;

.field public mScreenSize:Landroid/graphics/Point;


# direct methods
.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/bumptech/glide/load/resource/bitmap/BitmapTransformation;-><init>()V

    const-string p2, "window"

    .line 2
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/WindowManager;

    .line 3
    invoke-static {}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getInstance()Lcom/android/wallpaper/util/ScreenSizeCalculator;

    move-result-object v0

    invoke-interface {p2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getScreenSize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object p2

    iput-object p2, p0, Lcom/android/wallpaper/picker/WallpaperPreviewBitmapTransformation;->mScreenSize:Landroid/graphics/Point;

    .line 4
    iput-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPreviewBitmapTransformation;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public transform(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 6

    .line 1
    new-instance p1, Landroid/graphics/Point;

    .line 2
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p3

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p4

    invoke-direct {p1, p3, p4}, Landroid/graphics/Point;-><init>(II)V

    iget-object p3, p0, Lcom/android/wallpaper/picker/WallpaperPreviewBitmapTransformation;->mScreenSize:Landroid/graphics/Point;

    .line 3
    invoke-static {p1, p3}, Lcom/android/wallpaper/util/WallpaperCropUtils;->calculateMinZoom(Landroid/graphics/Point;Landroid/graphics/Point;)F

    move-result p1

    .line 4
    new-instance p3, Landroid/graphics/Rect;

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p4

    .line 5
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    const/4 v1, 0x0

    invoke-direct {p3, v1, v1, p4, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 6
    new-instance p4, Landroid/graphics/Point;

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 7
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, p1

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-direct {p4, v0, v2}, Landroid/graphics/Point;-><init>(II)V

    .line 8
    iget-object v0, p0, Lcom/android/wallpaper/picker/WallpaperPreviewBitmapTransformation;->mScreenSize:Landroid/graphics/Point;

    .line 9
    iget v2, v0, Landroid/graphics/Point;->x:I

    iget v3, p4, Landroid/graphics/Point;->x:I

    if-gt v2, v3, :cond_9

    iget v2, v0, Landroid/graphics/Point;->y:I

    iget v3, p4, Landroid/graphics/Point;->y:I

    if-gt v2, v3, :cond_9

    .line 10
    new-instance v2, Landroid/graphics/Point;

    invoke-direct {v2}, Landroid/graphics/Point;-><init>()V

    const/high16 v3, 0x40000000    # 2.0f

    .line 11
    iget v4, p4, Landroid/graphics/Point;->x:I

    iget v5, v0, Landroid/graphics/Point;->x:I

    sub-int/2addr v4, v5

    int-to-float v4, v4

    div-float/2addr v4, v3

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    iput v4, v2, Landroid/graphics/Point;->x:I

    .line 12
    iget p4, p4, Landroid/graphics/Point;->y:I

    iget v0, v0, Landroid/graphics/Point;->y:I

    sub-int/2addr p4, v0

    int-to-float p4, p4

    div-float/2addr p4, v3

    invoke-static {p4}, Ljava/lang/Math;->round(F)I

    move-result p4

    iput p4, v2, Landroid/graphics/Point;->y:I

    .line 13
    iget p4, v2, Landroid/graphics/Point;->x:I

    int-to-float p4, p4

    div-float/2addr p4, p1

    invoke-static {p4}, Ljava/lang/Math;->round(F)I

    move-result p4

    .line 14
    iget v0, v2, Landroid/graphics/Point;->y:I

    int-to-float v0, v0

    div-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 15
    new-instance v2, Landroid/graphics/Rect;

    iget-object v3, p0, Lcom/android/wallpaper/picker/WallpaperPreviewBitmapTransformation;->mScreenSize:Landroid/graphics/Point;

    iget v3, v3, Landroid/graphics/Point;->x:I

    int-to-float v3, v3

    div-float/2addr v3, p1

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    add-int/2addr v3, p4

    iget-object v4, p0, Lcom/android/wallpaper/picker/WallpaperPreviewBitmapTransformation;->mScreenSize:Landroid/graphics/Point;

    iget v4, v4, Landroid/graphics/Point;->y:I

    int-to-float v4, v4

    div-float/2addr v4, p1

    .line 16
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result p1

    add-int/2addr p1, v0

    invoke-direct {v2, p4, v0, v3, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 17
    invoke-virtual {p3, v2}, Landroid/graphics/Rect;->contains(Landroid/graphics/Rect;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    .line 18
    :cond_0
    iget p1, v2, Landroid/graphics/Rect;->left:I

    iget p3, v2, Landroid/graphics/Rect;->top:I

    .line 19
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result p4

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v0

    .line 20
    invoke-static {p2, p1, p3, p4, v0}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object p2

    .line 21
    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPreviewBitmapTransformation;->mContext:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p1

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p3

    .line 22
    invoke-static {p0}, Landroid/renderscript/RenderScript;->create(Landroid/content/Context;)Landroid/renderscript/RenderScript;

    move-result-object p0

    .line 23
    invoke-static {p0}, Landroid/renderscript/Element;->U8_4(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object p4

    .line 24
    invoke-static {p0, p4}, Landroid/renderscript/ScriptIntrinsicBlur;->create(Landroid/renderscript/RenderScript;Landroid/renderscript/Element;)Landroid/renderscript/ScriptIntrinsicBlur;

    move-result-object p4

    const/4 v0, 0x0

    .line 25
    :try_start_0
    new-instance v2, Landroid/graphics/Rect;

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-direct {v2, v1, v1, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 26
    div-int/lit8 p1, p1, 0x5

    div-int/lit8 p3, p3, 0x5

    invoke-static {v2, p1, p3}, Lcom/android/wallpaper/util/WallpaperCropUtils;->fitToSize(Landroid/graphics/Rect;II)V

    .line 27
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result p1

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result p3

    const/4 v2, 0x1

    invoke-static {p2, p1, p3, v2}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 28
    :try_start_1
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object p2

    sget-object p3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    if-eq p2, p3, :cond_1

    .line 29
    invoke-virtual {p1, p3, v1}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object p2
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 30
    :try_start_2
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object p1, p2

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_3

    :catch_0
    move-exception p0

    goto :goto_4

    .line 31
    :cond_1
    :goto_1
    :try_start_3
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p3

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p2, p3, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p2

    .line 32
    sget-object p3, Landroid/renderscript/Allocation$MipmapControl;->MIPMAP_NONE:Landroid/renderscript/Allocation$MipmapControl;

    const/4 v1, 0x2

    invoke-static {p0, p1, p3, v1}, Landroid/renderscript/Allocation;->createFromBitmap(Landroid/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/renderscript/Allocation$MipmapControl;I)Landroid/renderscript/Allocation;

    move-result-object p3
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 33
    :try_start_4
    invoke-static {p0, p2}, Landroid/renderscript/Allocation;->createFromBitmap(Landroid/renderscript/RenderScript;Landroid/graphics/Bitmap;)Landroid/renderscript/Allocation;

    move-result-object p0
    :try_end_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    const/high16 v1, 0x41a00000    # 20.0f

    .line 34
    :try_start_5
    invoke-virtual {p4, v1}, Landroid/renderscript/ScriptIntrinsicBlur;->setRadius(F)V

    .line 35
    invoke-virtual {p4, p3}, Landroid/renderscript/ScriptIntrinsicBlur;->setInput(Landroid/renderscript/Allocation;)V

    .line 36
    invoke-virtual {p4, p0}, Landroid/renderscript/ScriptIntrinsicBlur;->forEach(Landroid/renderscript/Allocation;)V

    .line 37
    invoke-virtual {p0, p2}, Landroid/renderscript/Allocation;->copyTo(Landroid/graphics/Bitmap;)V
    :try_end_5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    if-eqz p3, :cond_2

    .line 38
    invoke-virtual {p3}, Landroid/renderscript/Allocation;->destroy()V

    .line 39
    :cond_2
    invoke-virtual {p0}, Landroid/renderscript/Allocation;->destroy()V

    .line 40
    invoke-virtual {p4}, Landroid/renderscript/ScriptIntrinsicBlur;->destroy()V

    .line 41
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    move-object v0, p2

    goto :goto_6

    :catchall_1
    move-exception p2

    :goto_2
    move-object v0, p3

    goto :goto_7

    :catch_1
    move-exception p2

    goto :goto_5

    :catchall_2
    move-exception p0

    move-object p2, p0

    move-object p0, v0

    goto :goto_2

    :catch_2
    move-exception p2

    move-object p0, v0

    goto :goto_5

    :catchall_3
    move-exception p0

    move-object p2, p1

    :goto_3
    move-object p1, p2

    move-object p2, p0

    move-object p0, v0

    goto :goto_7

    :catch_3
    move-exception p0

    move-object p2, p1

    :goto_4
    move-object p1, p2

    move-object p3, v0

    move-object p2, p0

    move-object p0, p3

    goto :goto_5

    :catchall_4
    move-exception p0

    move-object p2, p0

    move-object p0, v0

    move-object p1, p0

    goto :goto_7

    :catch_4
    move-exception p0

    move-object p2, p0

    move-object p0, v0

    move-object p1, p0

    move-object p3, p1

    :goto_5
    :try_start_6
    const-string v1, "BitmapProcessor"

    const-string v2, "error while blurring bitmap"

    .line 42
    invoke-static {v1, v2, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    if-eqz p3, :cond_3

    .line 43
    invoke-virtual {p3}, Landroid/renderscript/Allocation;->destroy()V

    :cond_3
    if-eqz p0, :cond_4

    .line 44
    invoke-virtual {p0}, Landroid/renderscript/Allocation;->destroy()V

    .line 45
    :cond_4
    invoke-virtual {p4}, Landroid/renderscript/ScriptIntrinsicBlur;->destroy()V

    if-eqz p1, :cond_5

    .line 46
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    :cond_5
    :goto_6
    return-object v0

    :goto_7
    if-eqz v0, :cond_6

    .line 47
    invoke-virtual {v0}, Landroid/renderscript/Allocation;->destroy()V

    :cond_6
    if-eqz p0, :cond_7

    .line 48
    invoke-virtual {p0}, Landroid/renderscript/Allocation;->destroy()V

    .line 49
    :cond_7
    invoke-virtual {p4}, Landroid/renderscript/ScriptIntrinsicBlur;->destroy()V

    if-eqz p1, :cond_8

    .line 50
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 51
    :cond_8
    throw p2

    .line 52
    :cond_9
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Inner rectangle "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, " should be contained completely within the outer rectangle "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, "."

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public updateDiskCacheKey(Ljava/security/MessageDigest;)V
    .locals 0

    const-string p0, "preview"

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/security/MessageDigest;->update([B)V

    return-void
.end method
