.class public Lcom/google/android/apps/wallpaper/asset/GoogleLiveWallpaperThumbAsset$LoadThumbnailTask;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/wallpaper/asset/GoogleLiveWallpaperThumbAsset;
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

.field public final mLayerResolver:Lcom/android/wallpaper/module/DrawableLayerResolver;

.field public final mPackageManager:Landroid/content/pm/PackageManager;

.field public mReceiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/app/WallpaperInfo;Lcom/android/wallpaper/module/DrawableLayerResolver;Lcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/google/android/apps/wallpaper/asset/GoogleLiveWallpaperThumbAsset$LoadThumbnailTask;->mInfo:Landroid/app/WallpaperInfo;

    .line 3
    iput-object p4, p0, Lcom/google/android/apps/wallpaper/asset/GoogleLiveWallpaperThumbAsset$LoadThumbnailTask;->mReceiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    .line 4
    iput-object p3, p0, Lcom/google/android/apps/wallpaper/asset/GoogleLiveWallpaperThumbAsset$LoadThumbnailTask;->mLayerResolver:Lcom/android/wallpaper/module/DrawableLayerResolver;

    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/asset/GoogleLiveWallpaperThumbAsset$LoadThumbnailTask;->mPackageManager:Landroid/content/pm/PackageManager;

    return-void
.end method


# virtual methods
.method public doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    check-cast p1, [Ljava/lang/Void;

    .line 2
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/asset/GoogleLiveWallpaperThumbAsset$LoadThumbnailTask;->mInfo:Landroid/app/WallpaperInfo;

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/asset/GoogleLiveWallpaperThumbAsset$LoadThumbnailTask;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {p1, v0}, Landroid/app/WallpaperInfo;->loadThumbnail(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 3
    instance-of v0, p1, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v0, :cond_0

    .line 4
    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p0

    goto :goto_0

    .line 5
    :cond_0
    instance-of v0, p1, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v0, :cond_1

    .line 6
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/asset/GoogleLiveWallpaperThumbAsset$LoadThumbnailTask;->mLayerResolver:Lcom/android/wallpaper/module/DrawableLayerResolver;

    check-cast p1, Landroid/graphics/drawable/LayerDrawable;

    check-cast p0, Lcom/android/wallpaper/module/DeviceColorLayerResolver;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    sget p0, Lcom/android/wallpaper/module/DeviceColorLayerResolver;->LAYER_INDEX:I

    .line 8
    invoke-virtual {p1}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    move-result p0

    .line 9
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    .line 10
    instance-of p1, p0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz p1, :cond_1

    .line 11
    check-cast p0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p0

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method public onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/graphics/Bitmap;

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/asset/GoogleLiveWallpaperThumbAsset$LoadThumbnailTask;->mReceiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/asset/Asset$BitmapReceiver;->onBitmapDecoded(Landroid/graphics/Bitmap;)V

    return-void
.end method
