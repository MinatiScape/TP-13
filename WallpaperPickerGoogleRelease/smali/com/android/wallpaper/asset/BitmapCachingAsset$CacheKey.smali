.class public Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/asset/BitmapCachingAsset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CacheKey"
.end annotation


# instance fields
.field public final mAsset:Lcom/android/wallpaper/asset/Asset;

.field public final mHeight:I

.field public final mRect:Landroid/graphics/Rect;

.field public final mRtl:Z

.field public final mWidth:I


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/asset/Asset;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;->mAsset:Lcom/android/wallpaper/asset/Asset;

    .line 3
    iput p2, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;->mWidth:I

    .line 4
    iput p3, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;->mHeight:I

    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;->mRtl:Z

    const/4 p1, 0x0

    .line 6
    iput-object p1, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;->mRect:Landroid/graphics/Rect;

    return-void
.end method

.method public constructor <init>(Lcom/android/wallpaper/asset/Asset;IIZLandroid/graphics/Rect;)V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    iput-object p1, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;->mAsset:Lcom/android/wallpaper/asset/Asset;

    .line 9
    iput p2, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;->mWidth:I

    .line 10
    iput p3, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;->mHeight:I

    .line 11
    iput-boolean p4, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;->mRtl:Z

    .line 12
    iput-object p5, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;->mRect:Landroid/graphics/Rect;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;->mAsset:Lcom/android/wallpaper/asset/Asset;

    check-cast p1, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;

    iget-object v1, p1, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;->mAsset:Lcom/android/wallpaper/asset/Asset;

    .line 2
    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p1, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;->mWidth:I

    iget v1, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;->mWidth:I

    if-ne v0, v1, :cond_0

    iget v0, p1, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;->mHeight:I

    iget v1, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;->mHeight:I

    if-ne v0, v1, :cond_0

    iget-boolean v0, p1, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;->mRtl:Z

    iget-boolean v1, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;->mRtl:Z

    if-ne v0, v1, :cond_0

    iget-object p0, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;->mRect:Landroid/graphics/Rect;

    iget-object p1, p1, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;->mRect:Landroid/graphics/Rect;

    .line 3
    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public hashCode()I
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    .line 1
    iget-object v1, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;->mAsset:Lcom/android/wallpaper/asset/Asset;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget v1, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;->mWidth:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget p0, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$CacheKey;->mHeight:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 v1, 0x2

    aput-object p0, v0, v1

    invoke-static {v0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
