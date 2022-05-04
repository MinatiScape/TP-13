.class public abstract Lcom/android/wallpaper/asset/StreamableAsset;
.super Lcom/android/wallpaper/asset/Asset;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/asset/StreamableAsset$DecodeDimensionsAsyncTask;,
        Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;,
        Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapAsyncTask;,
        Lcom/android/wallpaper/asset/StreamableAsset$StreamReceiver;
    }
.end annotation


# instance fields
.field public mBitmapRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

.field public mDimensions:Landroid/graphics/Point;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/asset/Asset;-><init>()V

    return-void
.end method

.method public static access$100(I)I
    .locals 3

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eq p0, v0, :cond_3

    const/4 v0, 0x3

    if-eq p0, v0, :cond_2

    const/4 v0, 0x6

    if-eq p0, v0, :cond_1

    const/16 v0, 0x8

    if-eq p0, v0, :cond_0

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported EXIF orientation "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "StreamableAsset"

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    const/16 v1, 0x10e

    goto :goto_0

    :cond_1
    const/16 v1, 0x5a

    goto :goto_0

    :cond_2
    const/16 v1, 0xb4

    :cond_3
    :goto_0
    return v1
.end method


# virtual methods
.method public calculateRawDimensions()Landroid/graphics/Point;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/asset/StreamableAsset;->mDimensions:Landroid/graphics/Point;

    if-eqz v0, :cond_0

    return-object v0

    .line 2
    :cond_0
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v1, 0x1

    .line 3
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 4
    invoke-virtual {p0}, Lcom/android/wallpaper/asset/StreamableAsset;->openInputStream()Ljava/io/InputStream;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return-object v2

    .line 5
    :cond_1
    invoke-static {v1, v2, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    const-string v2, "There was an error closing the input stream used to calculate the image\'s raw dimensions"

    .line 6
    invoke-virtual {p0, v1, v2}, Lcom/android/wallpaper/asset/StreamableAsset;->closeInputStream(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 7
    invoke-virtual {p0}, Lcom/android/wallpaper/asset/StreamableAsset;->getExifOrientation()I

    move-result v1

    const/4 v2, 0x6

    if-eq v1, v2, :cond_3

    const/16 v2, 0x8

    if-ne v1, v2, :cond_2

    goto :goto_0

    .line 8
    :cond_2
    new-instance v1, Landroid/graphics/Point;

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-direct {v1, v2, v0}, Landroid/graphics/Point;-><init>(II)V

    iput-object v1, p0, Lcom/android/wallpaper/asset/StreamableAsset;->mDimensions:Landroid/graphics/Point;

    goto :goto_1

    .line 9
    :cond_3
    :goto_0
    new-instance v1, Landroid/graphics/Point;

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    invoke-direct {v1, v2, v0}, Landroid/graphics/Point;-><init>(II)V

    iput-object v1, p0, Lcom/android/wallpaper/asset/StreamableAsset;->mDimensions:Landroid/graphics/Point;

    .line 10
    :goto_1
    iget-object p0, p0, Lcom/android/wallpaper/asset/StreamableAsset;->mDimensions:Landroid/graphics/Point;

    return-object p0
.end method

.method public final closeInputStream(Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p0, "StreamableAsset"

    .line 2
    invoke-static {p0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method public decodeBitmap(IILcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapAsyncTask;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapAsyncTask;-><init>(Lcom/android/wallpaper/asset/StreamableAsset;IILcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    .line 2
    sget-object p0, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Void;

    invoke-virtual {v0, p0, p1}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public decodeBitmapRegion(Landroid/graphics/Rect;IIZLcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
    .locals 8

    .line 1
    new-instance v7, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;

    move-object v0, v7

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapRegionAsyncTask;-><init>(Lcom/android/wallpaper/asset/StreamableAsset;Landroid/graphics/Rect;IIZLcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Void;

    .line 2
    invoke-virtual {v7, p0}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public decodeRawDimensions(Landroid/app/Activity;Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;)V
    .locals 0

    .line 1
    new-instance p1, Lcom/android/wallpaper/asset/StreamableAsset$DecodeDimensionsAsyncTask;

    invoke-direct {p1, p0, p2}, Lcom/android/wallpaper/asset/StreamableAsset$DecodeDimensionsAsyncTask;-><init>(Lcom/android/wallpaper/asset/StreamableAsset;Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;)V

    .line 2
    sget-object p0, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 p2, 0x0

    new-array p2, p2, [Ljava/lang/Void;

    invoke-virtual {p1, p0, p2}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public getExifOrientation()I
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public abstract openInputStream()Ljava/io/InputStream;
.end method
