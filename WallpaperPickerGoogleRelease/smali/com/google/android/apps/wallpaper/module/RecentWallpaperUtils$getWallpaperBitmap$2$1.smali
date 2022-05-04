.class public final Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$getWallpaperBitmap$2$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;


# instance fields
.field public final synthetic $asset:Lcom/android/wallpaper/asset/Asset;

.field public final synthetic $continuation:Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/coroutines/Continuation<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lkotlin/coroutines/Continuation;Lcom/android/wallpaper/asset/Asset;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Landroid/graphics/Bitmap;",
            ">;",
            "Lcom/android/wallpaper/asset/Asset;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$getWallpaperBitmap$2$1;->$continuation:Lkotlin/coroutines/Continuation;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$getWallpaperBitmap$2$1;->$asset:Lcom/android/wallpaper/asset/Asset;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onDimensionsDecoded(Landroid/graphics/Point;)V
    .locals 3
    .param p1    # Landroid/graphics/Point;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    if-nez p1, :cond_0

    .line 1
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$getWallpaperBitmap$2$1;->$continuation:Lkotlin/coroutines/Continuation;

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V

    return-void

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$getWallpaperBitmap$2$1;->$asset:Lcom/android/wallpaper/asset/Asset;

    iget v1, p1, Landroid/graphics/Point;->x:I

    iget p1, p1, Landroid/graphics/Point;->y:I

    new-instance v2, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$getWallpaperBitmap$2$1$1;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$getWallpaperBitmap$2$1;->$continuation:Lkotlin/coroutines/Continuation;

    invoke-direct {v2, p0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$getWallpaperBitmap$2$1$1;-><init>(Lkotlin/coroutines/Continuation;)V

    invoke-virtual {v0, v1, p1, v2}, Lcom/android/wallpaper/asset/Asset;->decodeBitmap(IILcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    return-void
.end method
