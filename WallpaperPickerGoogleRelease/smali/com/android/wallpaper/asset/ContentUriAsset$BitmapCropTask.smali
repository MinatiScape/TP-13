.class public Lcom/android/wallpaper/asset/ContentUriAsset$BitmapCropTask;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/asset/ContentUriAsset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BitmapCropTask"
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

.field public mFromBitmap:Landroid/graphics/Bitmap;

.field public mReceiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Lcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/asset/ContentUriAsset$BitmapCropTask;->mFromBitmap:Landroid/graphics/Bitmap;

    .line 3
    iput-object p2, p0, Lcom/android/wallpaper/asset/ContentUriAsset$BitmapCropTask;->mCropRect:Landroid/graphics/Rect;

    .line 4
    iput-object p3, p0, Lcom/android/wallpaper/asset/ContentUriAsset$BitmapCropTask;->mReceiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    return-void
.end method


# virtual methods
.method public doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    check-cast p1, [Ljava/lang/Void;

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/asset/ContentUriAsset$BitmapCropTask;->mFromBitmap:Landroid/graphics/Bitmap;

    if-nez p1, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    .line 3
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/asset/ContentUriAsset$BitmapCropTask;->mCropRect:Landroid/graphics/Rect;

    iget v1, v0, Landroid/graphics/Rect;->left:I

    iget v2, v0, Landroid/graphics/Rect;->top:I

    .line 4
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    iget-object p0, p0, Lcom/android/wallpaper/asset/ContentUriAsset$BitmapCropTask;->mCropRect:Landroid/graphics/Rect;

    .line 5
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result p0

    .line 6
    invoke-static {p1, v1, v2, v0, p0}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method public onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/graphics/Bitmap;

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/asset/ContentUriAsset$BitmapCropTask;->mReceiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/asset/Asset$BitmapReceiver;->onBitmapDecoded(Landroid/graphics/Bitmap;)V

    return-void
.end method
