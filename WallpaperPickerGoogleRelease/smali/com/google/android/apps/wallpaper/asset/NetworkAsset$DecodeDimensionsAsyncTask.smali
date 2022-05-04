.class public Lcom/google/android/apps/wallpaper/asset/NetworkAsset$DecodeDimensionsAsyncTask;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/wallpaper/asset/NetworkAsset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DecodeDimensionsAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Landroid/graphics/Point;",
        ">;"
    }
.end annotation


# instance fields
.field public mFile:Ljava/io/File;

.field public mReceiver:Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;

.field public final synthetic this$0:Lcom/google/android/apps/wallpaper/asset/NetworkAsset;


# direct methods
.method public constructor <init>(Lcom/google/android/apps/wallpaper/asset/NetworkAsset;Ljava/io/File;Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$DecodeDimensionsAsyncTask;->this$0:Lcom/google/android/apps/wallpaper/asset/NetworkAsset;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$DecodeDimensionsAsyncTask;->mFile:Ljava/io/File;

    .line 3
    iput-object p3, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$DecodeDimensionsAsyncTask;->mReceiver:Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;

    return-void
.end method


# virtual methods
.method public doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    check-cast p1, [Ljava/lang/Void;

    const-string p1, "NetworkAsset"

    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$DecodeDimensionsAsyncTask;->mFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "File not found for network asset with URL: "

    .line 3
    invoke-static {v2}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$DecodeDimensionsAsyncTask;->this$0:Lcom/google/android/apps/wallpaper/asset/NetworkAsset;

    .line 4
    iget-object v3, v3, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;->mUri:Landroid/net/Uri;

    .line 5
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v1, v0

    :goto_0
    if-nez v1, :cond_0

    goto :goto_2

    .line 6
    :cond_0
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v3, 0x1

    .line 7
    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 8
    invoke-static {v1, v0, v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 9
    :try_start_1
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    const-string v1, "Unable to close input stream for NetworkAsset with URL: "

    .line 10
    invoke-static {v1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$DecodeDimensionsAsyncTask;->this$0:Lcom/google/android/apps/wallpaper/asset/NetworkAsset;

    .line 11
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;->mUri:Landroid/net/Uri;

    .line 12
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 13
    :goto_1
    new-instance v0, Landroid/graphics/Point;

    iget p0, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget p1, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-direct {v0, p0, p1}, Landroid/graphics/Point;-><init>(II)V

    :goto_2
    return-object v0
.end method

.method public onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/graphics/Point;

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$DecodeDimensionsAsyncTask;->mReceiver:Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;->onDimensionsDecoded(Landroid/graphics/Point;)V

    return-void
.end method
