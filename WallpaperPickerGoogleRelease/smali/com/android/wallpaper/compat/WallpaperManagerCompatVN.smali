.class public Lcom/android/wallpaper/compat/WallpaperManagerCompatVN;
.super Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public getWallpaperFile(I)Landroid/os/ParcelFileDescriptor;
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->mWallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {p0, p1}, Landroid/app/WallpaperManager;->getWallpaperFile(I)Landroid/os/ParcelFileDescriptor;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "WallpaperMgrCompatVN"

    const-string v0, "Exception on getWallpaperFile"

    .line 2
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method public getWallpaperId(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->mWallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {p0, p1}, Landroid/app/WallpaperManager;->getWallpaperId(I)I

    move-result p0

    return p0
.end method

.method public setBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;ZI)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->mWallpaperManager:Landroid/app/WallpaperManager;

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/app/WallpaperManager;->setBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;ZI)I

    move-result p0

    return p0
.end method

.method public setStream(Ljava/io/InputStream;Landroid/graphics/Rect;ZI)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->mWallpaperManager:Landroid/app/WallpaperManager;

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/app/WallpaperManager;->setStream(Ljava/io/InputStream;Landroid/graphics/Rect;ZI)I

    move-result p0

    return p0
.end method
