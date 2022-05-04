.class public Lcom/android/wallpaper/widget/WallpaperColorsLoader;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/widget/WallpaperColorsLoader$Callback;
    }
.end annotation


# static fields
.field public static sCache:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Lcom/android/wallpaper/asset/Asset;",
            "Landroid/app/WallpaperColors;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroid/util/LruCache;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Landroid/util/LruCache;-><init>(I)V

    sput-object v0, Lcom/android/wallpaper/widget/WallpaperColorsLoader;->sCache:Landroid/util/LruCache;

    return-void
.end method

.method public static getWallpaperColors(Landroid/content/Context;Lcom/android/wallpaper/asset/Asset;Lcom/android/wallpaper/widget/WallpaperColorsLoader$Callback;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/wallpaper/widget/WallpaperColorsLoader;->sCache:Landroid/util/LruCache;

    invoke-virtual {v0, p1}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/WallpaperColors;

    if-eqz v0, :cond_0

    .line 2
    invoke-interface {p2, v0}, Lcom/android/wallpaper/widget/WallpaperColorsLoader$Callback;->onLoaded(Landroid/app/WallpaperColors;)V

    return-void

    .line 3
    :cond_0
    const-class v0, Landroid/view/WindowManager;

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 4
    invoke-static {}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getInstance()Lcom/android/wallpaper/util/ScreenSizeCalculator;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getScreenSize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object v0

    .line 5
    new-instance v1, Lcom/android/wallpaper/asset/BitmapCachingAsset;

    invoke-direct {v1, p0, p1}, Lcom/android/wallpaper/asset/BitmapCachingAsset;-><init>(Landroid/content/Context;Lcom/android/wallpaper/asset/Asset;)V

    iget p0, v0, Landroid/graphics/Point;->y:I

    div-int/lit8 p0, p0, 0x2

    iget v0, v0, Landroid/graphics/Point;->x:I

    div-int/lit8 v0, v0, 0x2

    new-instance v2, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda1;

    invoke-direct {v2, p1, p2}, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/asset/Asset;Lcom/android/wallpaper/widget/WallpaperColorsLoader$Callback;)V

    invoke-virtual {v1, p0, v0, v2}, Lcom/android/wallpaper/asset/BitmapCachingAsset;->decodeBitmap(IILcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    return-void
.end method
