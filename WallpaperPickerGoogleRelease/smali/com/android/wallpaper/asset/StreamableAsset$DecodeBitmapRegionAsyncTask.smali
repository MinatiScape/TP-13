.class public Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/asset/StreamableAsset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DecodeBitmapRegionAsyncTask"
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
.field public mCropRect:Landroid/graphics/Rect;

.field public final mIsRtl:Z

.field public final mReceiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

.field public mTargetHeight:I

.field public mTargetWidth:I

.field public final synthetic this$0:Lcom/android/wallpaper/asset/StreamableAsset;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/asset/StreamableAsset;Landroid/graphics/Rect;IIZLcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;->this$0:Lcom/android/wallpaper/asset/StreamableAsset;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;->mCropRect:Landroid/graphics/Rect;

    .line 3
    iput-object p6, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;->mReceiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    .line 4
    iput p3, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;->mTargetWidth:I

    .line 5
    iput p4, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;->mTargetHeight:I

    .line 6
    iput-boolean p5, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;->mIsRtl:Z

    return-void
.end method


# virtual methods
.method public doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 13

    .line 1
    check-cast p1, [Ljava/lang/Void;

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;->this$0:Lcom/android/wallpaper/asset/StreamableAsset;

    invoke-virtual {p1}, Lcom/android/wallpaper/asset/StreamableAsset;->getExifOrientation()I

    move-result p1

    const/16 v0, 0x8

    const/4 v1, 0x6

    if-eq p1, v1, :cond_0

    if-ne p1, v0, :cond_1

    .line 3
    :cond_0
    iget v2, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;->mTargetHeight:I

    .line 4
    iget v3, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;->mTargetWidth:I

    iput v3, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;->mTargetHeight:I

    .line 5
    iput v2, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;->mTargetWidth:I

    .line 6
    :cond_1
    iget-object v2, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;->this$0:Lcom/android/wallpaper/asset/StreamableAsset;

    invoke-virtual {v2}, Lcom/android/wallpaper/asset/StreamableAsset;->calculateRawDimensions()Landroid/graphics/Point;

    move-result-object v2

    .line 7
    iget-object v3, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;->mCropRect:Landroid/graphics/Rect;

    const/4 v4, 0x1

    if-eq p1, v4, :cond_5

    const/4 v5, 0x3

    if-eq p1, v5, :cond_4

    if-eq p1, v1, :cond_3

    if-eq p1, v0, :cond_2

    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unsupported EXIF orientation "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CropRectRotator"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, v3}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    goto :goto_0

    .line 10
    :cond_2
    new-instance v0, Landroid/graphics/Rect;

    iget v1, v2, Landroid/graphics/Point;->y:I

    iget v5, v3, Landroid/graphics/Rect;->bottom:I

    sub-int v5, v1, v5

    iget v6, v3, Landroid/graphics/Rect;->left:I

    iget v7, v3, Landroid/graphics/Rect;->top:I

    sub-int/2addr v1, v7

    iget v3, v3, Landroid/graphics/Rect;->right:I

    invoke-direct {v0, v5, v6, v1, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_0

    .line 11
    :cond_3
    new-instance v0, Landroid/graphics/Rect;

    iget v1, v3, Landroid/graphics/Rect;->top:I

    iget v5, v2, Landroid/graphics/Point;->x:I

    iget v6, v3, Landroid/graphics/Rect;->right:I

    sub-int v6, v5, v6

    iget v7, v3, Landroid/graphics/Rect;->bottom:I

    iget v3, v3, Landroid/graphics/Rect;->left:I

    sub-int/2addr v5, v3

    invoke-direct {v0, v1, v6, v7, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_0

    .line 12
    :cond_4
    new-instance v0, Landroid/graphics/Rect;

    iget v1, v2, Landroid/graphics/Point;->x:I

    iget v5, v3, Landroid/graphics/Rect;->right:I

    sub-int v5, v1, v5

    iget v6, v2, Landroid/graphics/Point;->y:I

    iget v7, v3, Landroid/graphics/Rect;->bottom:I

    sub-int v7, v6, v7

    iget v8, v3, Landroid/graphics/Rect;->left:I

    sub-int/2addr v1, v8

    iget v3, v3, Landroid/graphics/Rect;->top:I

    sub-int/2addr v6, v3

    invoke-direct {v0, v5, v7, v1, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_0

    .line 13
    :cond_5
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, v3}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 14
    :goto_0
    iput-object v0, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;->mCropRect:Landroid/graphics/Rect;

    .line 15
    iget-boolean v1, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;->mIsRtl:Z

    if-eqz v1, :cond_6

    .line 16
    iget v1, v2, Landroid/graphics/Point;->x:I

    iget v2, v0, Landroid/graphics/Rect;->right:I

    sub-int v2, v1, v2

    iget v3, v0, Landroid/graphics/Rect;->top:I

    iget v5, v0, Landroid/graphics/Rect;->left:I

    sub-int/2addr v1, v5

    iget v5, v0, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v0, v2, v3, v1, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 17
    :cond_6
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 18
    iget-object v1, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;->mCropRect:Landroid/graphics/Rect;

    .line 19
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    iget-object v2, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;->mCropRect:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    iget v3, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;->mTargetWidth:I

    iget v5, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;->mTargetHeight:I

    .line 20
    invoke-static {v1, v2, v3, v5}, Landroidx/cardview/R$color;->calculateInSampleSize(IIII)I

    move-result v1

    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 21
    iget-object v1, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;->this$0:Lcom/android/wallpaper/asset/StreamableAsset;

    .line 22
    iget-object v2, v1, Lcom/android/wallpaper/asset/StreamableAsset;->mBitmapRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    const-string v3, "StreamableAsset"

    const/4 v5, 0x0

    if-nez v2, :cond_8

    const-string v2, "Unable to close input stream used to create BitmapRegionDecoder"

    .line 23
    :try_start_0
    invoke-virtual {v1}, Lcom/android/wallpaper/asset/StreamableAsset;->openInputStream()Ljava/io/InputStream;

    move-result-object v6
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v6, :cond_7

    goto :goto_2

    .line 24
    :cond_7
    :try_start_1
    invoke-static {v6, v4}, Landroid/graphics/BitmapRegionDecoder;->newInstance(Ljava/io/InputStream;Z)Landroid/graphics/BitmapRegionDecoder;

    move-result-object v4
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    :catchall_0
    move-exception p0

    move-object v5, v6

    goto :goto_4

    :catch_0
    move-exception v4

    goto :goto_1

    :catchall_1
    move-exception p0

    goto :goto_4

    :catch_1
    move-exception v4

    move-object v6, v5

    :goto_1
    :try_start_2
    const-string v7, "Unable to open BitmapRegionDecoder"

    .line 25
    invoke-static {v3, v7, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_2
    move-object v4, v5

    .line 26
    :goto_3
    invoke-virtual {v1, v6, v2}, Lcom/android/wallpaper/asset/StreamableAsset;->closeInputStream(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 27
    iput-object v4, v1, Lcom/android/wallpaper/asset/StreamableAsset;->mBitmapRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    goto :goto_5

    .line 28
    :goto_4
    invoke-virtual {v1, v5, v2}, Lcom/android/wallpaper/asset/StreamableAsset;->closeInputStream(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 29
    throw p0

    .line 30
    :cond_8
    :goto_5
    iget-object v1, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;->this$0:Lcom/android/wallpaper/asset/StreamableAsset;

    .line 31
    iget-object v1, v1, Lcom/android/wallpaper/asset/StreamableAsset;->mBitmapRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    if-eqz v1, :cond_a

    .line 32
    :try_start_3
    iget-object p0, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;->mCropRect:Landroid/graphics/Rect;

    invoke-virtual {v1, p0, v0}, Landroid/graphics/BitmapRegionDecoder;->decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 33
    invoke-static {p1}, Lcom/android/wallpaper/asset/StreamableAsset;->access$100(I)I

    move-result p0

    if-lez p0, :cond_9

    .line 34
    new-instance v11, Landroid/graphics/Matrix;

    invoke-direct {v11}, Landroid/graphics/Matrix;-><init>()V

    int-to-float p0, p0

    .line 35
    invoke-virtual {v11, p0}, Landroid/graphics/Matrix;->setRotate(F)V

    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 36
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    const/4 v12, 0x0

    .line 37
    invoke-static/range {v6 .. v12}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object p0
    :try_end_3
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_2

    move-object v5, p0

    goto :goto_6

    :cond_9
    move-object v5, v6

    goto :goto_6

    :catch_2
    move-exception p0

    const-string p1, "Illegal argument for decoding bitmap region"

    .line 38
    invoke-static {v3, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_6

    :catch_3
    move-exception p0

    const-string p1, "Out of memory and unable to decode bitmap region"

    .line 39
    invoke-static {v3, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_a
    :goto_6
    return-object v5
.end method

.method public onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/graphics/Bitmap;

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;->mReceiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/asset/Asset$BitmapReceiver;->onBitmapDecoded(Landroid/graphics/Bitmap;)V

    return-void
.end method
