.class public Lcom/android/wallpaper/module/DefaultBitmapCropper$ScaleBitmapTask;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/module/DefaultBitmapCropper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ScaleBitmapTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field public mBitmap:Landroid/graphics/Bitmap;

.field public final mCallback:Lcom/android/wallpaper/module/BitmapCropper$Callback;

.field public final mCropRect:Landroid/graphics/Rect;

.field public mThrowable:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Lcom/android/wallpaper/module/BitmapCropper$Callback;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultBitmapCropper$ScaleBitmapTask;->mBitmap:Landroid/graphics/Bitmap;

    .line 3
    iput-object p2, p0, Lcom/android/wallpaper/module/DefaultBitmapCropper$ScaleBitmapTask;->mCropRect:Landroid/graphics/Rect;

    .line 4
    iput-object p3, p0, Lcom/android/wallpaper/module/DefaultBitmapCropper$ScaleBitmapTask;->mCallback:Lcom/android/wallpaper/module/BitmapCropper$Callback;

    return-void
.end method


# virtual methods
.method public doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    check-cast p1, [Ljava/lang/Void;

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/module/DefaultBitmapCropper$ScaleBitmapTask;->mBitmap:Landroid/graphics/Bitmap;

    if-nez p1, :cond_0

    .line 3
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 4
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultBitmapCropper$ScaleBitmapTask;->mCropRect:Landroid/graphics/Rect;

    .line 5
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultBitmapCropper$ScaleBitmapTask;->mCropRect:Landroid/graphics/Rect;

    .line 6
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    const/4 v2, 0x1

    .line 7
    invoke-static {p1, v0, v1, v2}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultBitmapCropper$ScaleBitmapTask;->mBitmap:Landroid/graphics/Bitmap;

    .line 8
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "DefaultBitmapCropper"

    const-string v1, "Not enough memory to fit the final cropped and scaled bitmap to size"

    .line 9
    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 10
    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultBitmapCropper$ScaleBitmapTask;->mThrowable:Ljava/lang/Throwable;

    .line 11
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_0
    return-object p0
.end method

.method public onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Boolean;

    .line 2
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 3
    iget-object p1, p0, Lcom/android/wallpaper/module/DefaultBitmapCropper$ScaleBitmapTask;->mCallback:Lcom/android/wallpaper/module/BitmapCropper$Callback;

    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultBitmapCropper$ScaleBitmapTask;->mBitmap:Landroid/graphics/Bitmap;

    invoke-interface {p1, p0}, Lcom/android/wallpaper/module/BitmapCropper$Callback;->onBitmapCropped(Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 4
    :cond_0
    iget-object p1, p0, Lcom/android/wallpaper/module/DefaultBitmapCropper$ScaleBitmapTask;->mCallback:Lcom/android/wallpaper/module/BitmapCropper$Callback;

    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultBitmapCropper$ScaleBitmapTask;->mThrowable:Ljava/lang/Throwable;

    invoke-interface {p1, p0}, Lcom/android/wallpaper/module/BitmapCropper$Callback;->onError(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method
