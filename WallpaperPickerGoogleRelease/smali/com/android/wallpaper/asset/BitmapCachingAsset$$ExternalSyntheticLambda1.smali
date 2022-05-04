.class public final synthetic Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/asset/Asset$BitmapReceiver;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/asset/Asset;Lcom/android/wallpaper/widget/WallpaperColorsLoader$Callback;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;Lcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onBitmapDecoded(Landroid/graphics/Bitmap;)V
    .locals 4

    iget v0, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda1;->$r8$classId:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object v0, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;

    iget-object p0, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    if-eqz p1, :cond_0

    .line 1
    sget-object v1, Lcom/android/wallpaper/asset/BitmapCachingAsset;->sCache:Landroid/util/LruCache;

    invoke-virtual {v1, v0, p1}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    :cond_0
    invoke-interface {p0, p1}, Lcom/android/wallpaper/asset/Asset$BitmapReceiver;->onBitmapDecoded(Landroid/graphics/Bitmap;)V

    return-void

    .line 3
    :goto_0
    iget-object v0, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/wallpaper/asset/Asset;

    iget-object p0, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/widget/WallpaperColorsLoader$Callback;

    sget-object v1, Lcom/android/wallpaper/widget/WallpaperColorsLoader;->sCache:Landroid/util/LruCache;

    if-eqz p1, :cond_2

    .line 4
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->HARDWARE:Landroid/graphics/Bitmap$Config;

    const/4 v3, 0x0

    if-ne v1, v2, :cond_1

    .line 5
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-virtual {p1, v1, v3}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object p1

    const/4 v3, 0x1

    .line 6
    :cond_1
    invoke-static {p1}, Landroid/app/WallpaperColors;->fromBitmap(Landroid/graphics/Bitmap;)Landroid/app/WallpaperColors;

    move-result-object v1

    .line 7
    sget-object v2, Lcom/android/wallpaper/widget/WallpaperColorsLoader;->sCache:Landroid/util/LruCache;

    invoke-virtual {v2, v0, v1}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    invoke-interface {p0, v1}, Lcom/android/wallpaper/widget/WallpaperColorsLoader$Callback;->onLoaded(Landroid/app/WallpaperColors;)V

    if-eqz v3, :cond_3

    .line 9
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_1

    :cond_2
    const-string p1, "WallpaperColorsLoader"

    const-string v0, "Can\'t get wallpaper colors from a null bitmap, uses null color."

    .line 10
    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    .line 11
    invoke-interface {p0, p1}, Lcom/android/wallpaper/widget/WallpaperColorsLoader$Callback;->onLoaded(Landroid/app/WallpaperColors;)V

    :cond_3
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
