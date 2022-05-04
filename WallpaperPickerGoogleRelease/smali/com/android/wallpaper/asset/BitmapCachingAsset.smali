.class public Lcom/android/wallpaper/asset/BitmapCachingAsset;
.super Lcom/android/wallpaper/asset/Asset;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;
    }
.end annotation


# static fields
.field public static sCache:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final mIsLowRam:Z

.field public final mOriginalAsset:Lcom/android/wallpaper/asset/Asset;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/wallpaper/asset/BitmapCachingAsset$1;

    const/high16 v1, 0x6400000

    invoke-direct {v0, v1}, Lcom/android/wallpaper/asset/BitmapCachingAsset$1;-><init>(I)V

    sput-object v0, Lcom/android/wallpaper/asset/BitmapCachingAsset;->sCache:Landroid/util/LruCache;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/wallpaper/asset/Asset;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/asset/Asset;-><init>()V

    .line 2
    instance-of v0, p2, Lcom/android/wallpaper/asset/BitmapCachingAsset;

    if-eqz v0, :cond_0

    .line 3
    check-cast p2, Lcom/android/wallpaper/asset/BitmapCachingAsset;

    iget-object p2, p2, Lcom/android/wallpaper/asset/BitmapCachingAsset;->mOriginalAsset:Lcom/android/wallpaper/asset/Asset;

    :cond_0
    iput-object p2, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset;->mOriginalAsset:Lcom/android/wallpaper/asset/Asset;

    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const-string p2, "activity"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/ActivityManager;

    .line 5
    invoke-virtual {p1}, Landroid/app/ActivityManager;->isLowRamDevice()Z

    move-result p1

    .line 6
    iput-boolean p1, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset;->mIsLowRam:Z

    return-void
.end method


# virtual methods
.method public decodeBitmap(IILcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset;->mIsLowRam:Z

    if-eqz v0, :cond_0

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset;->mOriginalAsset:Lcom/android/wallpaper/asset/Asset;

    new-instance v0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda0;

    invoke-direct {v0, p3}, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    invoke-virtual {p0, p1, p2, v0}, Lcom/android/wallpaper/asset/Asset;->decodeBitmap(IILcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    return-void

    .line 3
    :cond_0
    new-instance v0, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;

    iget-object v1, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset;->mOriginalAsset:Lcom/android/wallpaper/asset/Asset;

    invoke-direct {v0, v1, p1, p2}, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;-><init>(Lcom/android/wallpaper/asset/Asset;II)V

    .line 4
    sget-object v1, Lcom/android/wallpaper/asset/BitmapCachingAsset;->sCache:Landroid/util/LruCache;

    invoke-virtual {v1, v0}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    if-eqz v1, :cond_1

    .line 5
    invoke-interface {p3, v1}, Lcom/android/wallpaper/asset/Asset$BitmapReceiver;->onBitmapDecoded(Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 6
    :cond_1
    iget-object p0, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset;->mOriginalAsset:Lcom/android/wallpaper/asset/Asset;

    new-instance v1, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda2;

    invoke-direct {v1, v0, p3}, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda2;-><init>(Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;Lcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    invoke-virtual {p0, p1, p2, v1}, Lcom/android/wallpaper/asset/Asset;->decodeBitmap(IILcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    :goto_0
    return-void
.end method

.method public decodeBitmapRegion(Landroid/graphics/Rect;IIZLcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset;->mIsLowRam:Z

    if-eqz v0, :cond_0

    .line 2
    iget-object v1, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset;->mOriginalAsset:Lcom/android/wallpaper/asset/Asset;

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move-object v6, p5

    invoke-virtual/range {v1 .. v6}, Lcom/android/wallpaper/asset/Asset;->decodeBitmapRegion(Landroid/graphics/Rect;IIZLcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    return-void

    .line 3
    :cond_0
    new-instance v0, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;

    iget-object v3, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset;->mOriginalAsset:Lcom/android/wallpaper/asset/Asset;

    move-object v2, v0

    move v4, p2

    move v5, p3

    move v6, p4

    move-object v7, p1

    invoke-direct/range {v2 .. v7}, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;-><init>(Lcom/android/wallpaper/asset/Asset;IIZLandroid/graphics/Rect;)V

    .line 4
    sget-object v1, Lcom/android/wallpaper/asset/BitmapCachingAsset;->sCache:Landroid/util/LruCache;

    invoke-virtual {v1, v0}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    if-eqz v1, :cond_1

    .line 5
    invoke-interface {p5, v1}, Lcom/android/wallpaper/asset/Asset$BitmapReceiver;->onBitmapDecoded(Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 6
    :cond_1
    iget-object v2, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset;->mOriginalAsset:Lcom/android/wallpaper/asset/Asset;

    new-instance v7, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda1;

    invoke-direct {v7, v0, p5}, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;Lcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-virtual/range {v2 .. v7}, Lcom/android/wallpaper/asset/Asset;->decodeBitmapRegion(Landroid/graphics/Rect;IIZLcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    :goto_0
    return-void
.end method

.method public decodeRawDimensions(Landroid/app/Activity;Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset;->mOriginalAsset:Lcom/android/wallpaper/asset/Asset;

    invoke-virtual {p0, p1, p2}, Lcom/android/wallpaper/asset/Asset;->decodeRawDimensions(Landroid/app/Activity;Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;)V

    return-void
.end method

.method public loadPreviewImage(Landroid/app/Activity;Landroid/widget/ImageView;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset;->mOriginalAsset:Lcom/android/wallpaper/asset/Asset;

    invoke-virtual {p0, p1, p2, p3}, Lcom/android/wallpaper/asset/Asset;->loadPreviewImage(Landroid/app/Activity;Landroid/widget/ImageView;I)V

    return-void
.end method
