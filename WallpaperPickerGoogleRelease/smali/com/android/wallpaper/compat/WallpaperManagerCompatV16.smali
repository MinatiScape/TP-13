.class public Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static sInstance:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

.field public static final sInstanceLock:Ljava/lang/Object;


# instance fields
.field public mWallpaperManager:Landroid/app/WallpaperManager;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->sInstanceLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ServiceCast"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "wallpaper"

    .line 2
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/WallpaperManager;

    iput-object p1, p0, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->mWallpaperManager:Landroid/app/WallpaperManager;

    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->sInstanceLock:Ljava/lang/Object;

    monitor-enter v0

    .line 2
    :try_start_0
    sget-object v1, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->sInstance:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    if-nez v1, :cond_1

    .line 3
    invoke-static {}, Lcom/android/wallpaper/compat/BuildCompat;->isAtLeastN()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 4
    new-instance v1, Lcom/android/wallpaper/compat/WallpaperManagerCompatVN;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v1, p0}, Lcom/android/wallpaper/compat/WallpaperManagerCompatVN;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->sInstance:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    goto :goto_0

    .line 5
    :cond_0
    new-instance v1, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v1, p0}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->sInstance:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    .line 6
    :cond_1
    :goto_0
    sget-object p0, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->sInstance:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    .line 7
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method


# virtual methods
.method public getDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->mWallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {v0}, Landroid/app/WallpaperManager;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2
    :catch_0
    iget-object p0, p0, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->mWallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {p0}, Landroid/app/WallpaperManager;->getBuiltInDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method public getWallpaperFile(I)Landroid/os/ParcelFileDescriptor;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getWallpaperId(I)I
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "This method should not be called on pre-N versions of Android."

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
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

    invoke-virtual {p0, p1}, Landroid/app/WallpaperManager;->setBitmap(Landroid/graphics/Bitmap;)V

    const/4 p0, 0x1

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

    invoke-virtual {p0, p1}, Landroid/app/WallpaperManager;->setStream(Ljava/io/InputStream;)V

    const/4 p0, 0x1

    return p0
.end method
