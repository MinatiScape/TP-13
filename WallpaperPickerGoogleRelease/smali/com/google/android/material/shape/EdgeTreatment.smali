.class public Lcom/google/android/material/shape/EdgeTreatment;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getEdgePath(FFFLcom/google/android/material/shape/ShapePath;)V
    .locals 0

    const/4 p0, 0x0

    .line 1
    invoke-virtual {p4, p1, p0}, Lcom/google/android/material/shape/ShapePath;->lineTo(FF)V

    return-void
.end method

.method public isHomeStaticWallpaperSet(Landroid/content/Context;)Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p0

    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/Injector;->getWallpaperManagerCompat(Landroid/content/Context;)Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    move-result-object p0

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->getWallpaperFile(I)Landroid/os/ParcelFileDescriptor;

    move-result-object p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-eqz p0, :cond_1

    .line 2
    :try_start_0
    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    const-string v0, "DefaultWallpaperStatusChecker"

    const-string v1, "Unable to close system wallpaper ParcelFileDescriptor"

    .line 3
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    :goto_1
    return p1
.end method

.method public isLockWallpaperSet(Landroid/content/Context;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object p0

    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Landroid/app/WallpaperManager;->getWallpaperId(I)I

    move-result p0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
