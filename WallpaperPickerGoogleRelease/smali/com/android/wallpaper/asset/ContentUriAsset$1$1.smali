.class public Lcom/android/wallpaper/asset/ContentUriAsset$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/asset/Asset$BitmapReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/asset/ContentUriAsset$1;->onDimensionsDecoded(Landroid/graphics/Point;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$1:Lcom/android/wallpaper/asset/ContentUriAsset$1;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/asset/ContentUriAsset$1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/asset/ContentUriAsset$1$1;->this$1:Lcom/android/wallpaper/asset/ContentUriAsset$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBitmapDecoded(Landroid/graphics/Bitmap;)V
    .locals 2

    if-nez p1, :cond_0

    const-string p1, "There was an error decoding the asset\'s full bitmap with content URI: "

    .line 1
    invoke-static {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lcom/android/wallpaper/asset/ContentUriAsset$1$1;->this$1:Lcom/android/wallpaper/asset/ContentUriAsset$1;

    iget-object v0, v0, Lcom/android/wallpaper/asset/ContentUriAsset$1;->this$0:Lcom/android/wallpaper/asset/ContentUriAsset;

    .line 2
    iget-object v0, v0, Lcom/android/wallpaper/asset/ContentUriAsset;->mUri:Landroid/net/Uri;

    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ContentUriAsset"

    .line 4
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/asset/ContentUriAsset$1$1;->this$1:Lcom/android/wallpaper/asset/ContentUriAsset$1;

    iget-object p0, p0, Lcom/android/wallpaper/asset/ContentUriAsset$1;->val$receiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Lcom/android/wallpaper/asset/Asset$BitmapReceiver;->onBitmapDecoded(Landroid/graphics/Bitmap;)V

    return-void

    .line 6
    :cond_0
    new-instance v0, Lcom/android/wallpaper/asset/ContentUriAsset$BitmapCropTask;

    iget-object p0, p0, Lcom/android/wallpaper/asset/ContentUriAsset$1$1;->this$1:Lcom/android/wallpaper/asset/ContentUriAsset$1;

    iget-object v1, p0, Lcom/android/wallpaper/asset/ContentUriAsset$1;->val$rect:Landroid/graphics/Rect;

    iget-object p0, p0, Lcom/android/wallpaper/asset/ContentUriAsset$1;->val$receiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    invoke-direct {v0, p1, v1, p0}, Lcom/android/wallpaper/asset/ContentUriAsset$BitmapCropTask;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Lcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Void;

    .line 7
    invoke-virtual {v0, p0}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method
