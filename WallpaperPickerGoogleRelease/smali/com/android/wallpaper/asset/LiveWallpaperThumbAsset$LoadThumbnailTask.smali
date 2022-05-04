.class public Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset$LoadThumbnailTask;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LoadThumbnailTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field public mInfo:Landroid/app/WallpaperInfo;

.field public final mPackageManager:Landroid/content/pm/PackageManager;

.field public mReceiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/app/WallpaperInfo;Lcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset$LoadThumbnailTask;->mInfo:Landroid/app/WallpaperInfo;

    .line 3
    iput-object p3, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset$LoadThumbnailTask;->mReceiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset$LoadThumbnailTask;->mPackageManager:Landroid/content/pm/PackageManager;

    return-void
.end method


# virtual methods
.method public doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    check-cast p1, [Ljava/lang/Void;

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset$LoadThumbnailTask;->mInfo:Landroid/app/WallpaperInfo;

    iget-object p0, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset$LoadThumbnailTask;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {p1, p0}, Landroid/app/WallpaperInfo;->loadThumbnail(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    .line 3
    instance-of p1, p0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz p1, :cond_0

    .line 4
    check-cast p0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    if-eqz p0, :cond_1

    .line 5
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    if-lez v0, :cond_1

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    if-lez v0, :cond_1

    .line 6
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    .line 7
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 8
    invoke-static {p1, v0, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 9
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 10
    invoke-virtual {v0}, Landroid/graphics/Canvas;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Canvas;->getHeight()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {p0, v3, v3, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 11
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_1
    move-object p0, p1

    :goto_0
    return-object p0
.end method

.method public onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/graphics/Bitmap;

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset$LoadThumbnailTask;->mReceiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/asset/Asset$BitmapReceiver;->onBitmapDecoded(Landroid/graphics/Bitmap;)V

    return-void
.end method
