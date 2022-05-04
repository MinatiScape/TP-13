.class public Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapAsyncTask;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/asset/StreamableAsset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DecodeBitmapAsyncTask"
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
.field public mReceiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

.field public mTargetHeight:I

.field public mTargetWidth:I

.field public final synthetic this$0:Lcom/android/wallpaper/asset/StreamableAsset;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/asset/StreamableAsset;IILcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapAsyncTask;->this$0:Lcom/android/wallpaper/asset/StreamableAsset;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    iput-object p4, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapAsyncTask;->mReceiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    .line 3
    iput p2, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapAsyncTask;->mTargetWidth:I

    .line 4
    iput p3, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapAsyncTask;->mTargetHeight:I

    return-void
.end method


# virtual methods
.method public doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    check-cast p1, [Ljava/lang/Void;

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapAsyncTask;->this$0:Lcom/android/wallpaper/asset/StreamableAsset;

    invoke-virtual {p1}, Lcom/android/wallpaper/asset/StreamableAsset;->getExifOrientation()I

    move-result p1

    const/4 v0, 0x6

    if-eq p1, v0, :cond_0

    const/16 v0, 0x8

    if-ne p1, v0, :cond_1

    .line 3
    :cond_0
    iget v0, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapAsyncTask;->mTargetHeight:I

    .line 4
    iget v1, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapAsyncTask;->mTargetWidth:I

    iput v1, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapAsyncTask;->mTargetHeight:I

    .line 5
    iput v0, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapAsyncTask;->mTargetWidth:I

    .line 6
    :cond_1
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 7
    iget-object v1, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapAsyncTask;->this$0:Lcom/android/wallpaper/asset/StreamableAsset;

    invoke-virtual {v1}, Lcom/android/wallpaper/asset/StreamableAsset;->calculateRawDimensions()Landroid/graphics/Point;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_2

    goto :goto_0

    .line 8
    :cond_2
    iget v3, v1, Landroid/graphics/Point;->x:I

    iget v1, v1, Landroid/graphics/Point;->y:I

    iget v4, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapAsyncTask;->mTargetWidth:I

    iget v5, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapAsyncTask;->mTargetHeight:I

    invoke-static {v3, v1, v4, v5}, Landroidx/cardview/R$color;->calculateInSampleSize(IIII)I

    move-result v1

    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 9
    sget-object v1, Landroid/graphics/Bitmap$Config;->HARDWARE:Landroid/graphics/Bitmap$Config;

    iput-object v1, v0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 10
    iget-object v1, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapAsyncTask;->this$0:Lcom/android/wallpaper/asset/StreamableAsset;

    invoke-virtual {v1}, Lcom/android/wallpaper/asset/StreamableAsset;->openInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 11
    invoke-static {v1, v2, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 12
    iget-object p0, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapAsyncTask;->this$0:Lcom/android/wallpaper/asset/StreamableAsset;

    const-string v0, "Error closing the input stream used to decode the full bitmap"

    .line 13
    invoke-virtual {p0, v1, v0}, Lcom/android/wallpaper/asset/StreamableAsset;->closeInputStream(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 14
    invoke-static {p1}, Lcom/android/wallpaper/asset/StreamableAsset;->access$100(I)I

    move-result p0

    if-lez p0, :cond_3

    .line 15
    new-instance v8, Landroid/graphics/Matrix;

    invoke-direct {v8}, Landroid/graphics/Matrix;-><init>()V

    int-to-float p0, p0

    .line 16
    invoke-virtual {v8, p0}, Landroid/graphics/Matrix;->setRotate(F)V

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 17
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    const/4 v9, 0x0

    .line 18
    invoke-static/range {v3 .. v9}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object p0

    move-object v2, p0

    goto :goto_0

    :cond_3
    move-object v2, v3

    :goto_0
    return-object v2
.end method

.method public onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/graphics/Bitmap;

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/asset/StreamableAsset$DecodeBitmapAsyncTask;->mReceiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/asset/Asset$BitmapReceiver;->onBitmapDecoded(Landroid/graphics/Bitmap;)V

    return-void
.end method
