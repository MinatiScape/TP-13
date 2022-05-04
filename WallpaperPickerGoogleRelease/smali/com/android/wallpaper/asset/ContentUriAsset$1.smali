.class public Lcom/android/wallpaper/asset/ContentUriAsset$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/asset/ContentUriAsset;->decodeBitmapRegion(Landroid/graphics/Rect;IIZLcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/asset/ContentUriAsset;

.field public final synthetic val$receiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

.field public final synthetic val$rect:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/asset/ContentUriAsset;Lcom/android/wallpaper/asset/Asset$BitmapReceiver;Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/asset/ContentUriAsset$1;->this$0:Lcom/android/wallpaper/asset/ContentUriAsset;

    iput-object p2, p0, Lcom/android/wallpaper/asset/ContentUriAsset$1;->val$receiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    iput-object p3, p0, Lcom/android/wallpaper/asset/ContentUriAsset$1;->val$rect:Landroid/graphics/Rect;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDimensionsDecoded(Landroid/graphics/Point;)V
    .locals 3

    if-nez p1, :cond_0

    const-string p1, "There was an error decoding the asset\'s raw dimensions with content URI: "

    .line 1
    invoke-static {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lcom/android/wallpaper/asset/ContentUriAsset$1;->this$0:Lcom/android/wallpaper/asset/ContentUriAsset;

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
    iget-object p0, p0, Lcom/android/wallpaper/asset/ContentUriAsset$1;->val$receiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Lcom/android/wallpaper/asset/Asset$BitmapReceiver;->onBitmapDecoded(Landroid/graphics/Bitmap;)V

    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/asset/ContentUriAsset$1;->this$0:Lcom/android/wallpaper/asset/ContentUriAsset;

    iget v1, p1, Landroid/graphics/Point;->x:I

    iget p1, p1, Landroid/graphics/Point;->y:I

    new-instance v2, Lcom/android/wallpaper/asset/ContentUriAsset$1$1;

    invoke-direct {v2, p0}, Lcom/android/wallpaper/asset/ContentUriAsset$1$1;-><init>(Lcom/android/wallpaper/asset/ContentUriAsset$1;)V

    invoke-virtual {v0, v1, p1, v2}, Lcom/android/wallpaper/asset/StreamableAsset;->decodeBitmap(IILcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    return-void
.end method
