.class public final synthetic Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/asset/Asset$BitmapReceiver;


# instance fields
.field public final synthetic f$0:Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;

.field public final synthetic f$1:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;Lcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda2;->f$0:Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;

    iput-object p2, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda2;->f$1:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    return-void
.end method


# virtual methods
.method public final onBitmapDecoded(Landroid/graphics/Bitmap;)V
    .locals 2

    iget-object v0, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda2;->f$0:Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;

    iget-object p0, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda2;->f$1:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    if-eqz p1, :cond_0

    .line 1
    sget-object v1, Lcom/android/wallpaper/asset/BitmapCachingAsset;->sCache:Landroid/util/LruCache;

    invoke-virtual {v1, v0, p1}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    :cond_0
    invoke-interface {p0, p1}, Lcom/android/wallpaper/asset/Asset$BitmapReceiver;->onBitmapDecoded(Landroid/graphics/Bitmap;)V

    return-void
.end method
