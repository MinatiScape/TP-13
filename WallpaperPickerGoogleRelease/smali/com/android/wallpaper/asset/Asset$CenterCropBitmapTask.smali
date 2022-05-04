.class public Lcom/android/wallpaper/asset/Asset$CenterCropBitmapTask;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/asset/Asset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CenterCropBitmapTask"
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
.field public mBitmap:Landroid/graphics/Bitmap;

.field public mBitmapReceiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

.field public mImageViewHeight:I

.field public mImageViewWidth:I


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;Landroid/view/View;Lcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/asset/Asset$CenterCropBitmapTask;->mBitmap:Landroid/graphics/Bitmap;

    .line 3
    iput-object p3, p0, Lcom/android/wallpaper/asset/Asset$CenterCropBitmapTask;->mBitmapReceiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    .line 4
    invoke-static {p2}, Lcom/android/wallpaper/asset/Asset;->getViewDimensions(Landroid/view/View;)Landroid/graphics/Point;

    move-result-object p1

    .line 5
    iget p2, p1, Landroid/graphics/Point;->x:I

    iput p2, p0, Lcom/android/wallpaper/asset/Asset$CenterCropBitmapTask;->mImageViewWidth:I

    .line 6
    iget p1, p1, Landroid/graphics/Point;->y:I

    iput p1, p0, Lcom/android/wallpaper/asset/Asset$CenterCropBitmapTask;->mImageViewHeight:I

    return-void
.end method


# virtual methods
.method public doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    check-cast p1, [Ljava/lang/Void;

    .line 2
    iget p1, p0, Lcom/android/wallpaper/asset/Asset$CenterCropBitmapTask;->mImageViewWidth:I

    .line 3
    iget v0, p0, Lcom/android/wallpaper/asset/Asset$CenterCropBitmapTask;->mImageViewHeight:I

    .line 4
    iget-object v1, p0, Lcom/android/wallpaper/asset/Asset$CenterCropBitmapTask;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    .line 5
    iget-object v2, p0, Lcom/android/wallpaper/asset/Asset$CenterCropBitmapTask;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v1, v1

    int-to-float v3, p1

    div-float v3, v1, v3

    int-to-float v2, v2

    int-to-float v4, v0

    div-float v4, v2, v4

    .line 6
    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    .line 7
    iget-object p0, p0, Lcom/android/wallpaper/asset/Asset$CenterCropBitmapTask;->mBitmap:Landroid/graphics/Bitmap;

    div-float/2addr v1, v3

    .line 8
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    div-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    const/4 v3, 0x1

    .line 9
    invoke-static {p0, v1, v2, v3}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 10
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    sub-int/2addr v1, p1

    div-int/lit8 v1, v1, 0x2

    const/4 p1, 0x0

    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 11
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    sub-int/2addr v2, v0

    div-int/lit8 v2, v2, 0x2

    invoke-static {p1, v2}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 12
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    mul-int/lit8 v2, v1, 0x2

    sub-int/2addr v0, v2

    .line 13
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    mul-int/lit8 v3, p1, 0x2

    sub-int/2addr v2, v3

    .line 14
    invoke-static {p0, v1, p1, v0, v2}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/graphics/Bitmap;

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/asset/Asset$CenterCropBitmapTask;->mBitmapReceiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/asset/Asset$BitmapReceiver;->onBitmapDecoded(Landroid/graphics/Bitmap;)V

    return-void
.end method
