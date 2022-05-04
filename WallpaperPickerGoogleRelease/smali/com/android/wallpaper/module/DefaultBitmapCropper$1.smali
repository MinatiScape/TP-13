.class public Lcom/android/wallpaper/module/DefaultBitmapCropper$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/asset/Asset$BitmapReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/module/DefaultBitmapCropper;->cropAndScaleBitmap(Lcom/android/wallpaper/asset/Asset;FLandroid/graphics/Rect;ZLcom/android/wallpaper/module/BitmapCropper$Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic val$callback:Lcom/android/wallpaper/module/BitmapCropper$Callback;

.field public final synthetic val$cropRect:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/module/DefaultBitmapCropper;Landroid/graphics/Rect;Lcom/android/wallpaper/module/BitmapCropper$Callback;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/wallpaper/module/DefaultBitmapCropper$1;->val$cropRect:Landroid/graphics/Rect;

    iput-object p3, p0, Lcom/android/wallpaper/module/DefaultBitmapCropper$1;->val$callback:Lcom/android/wallpaper/module/BitmapCropper$Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBitmapDecoded(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/wallpaper/module/DefaultBitmapCropper$ScaleBitmapTask;

    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultBitmapCropper$1;->val$cropRect:Landroid/graphics/Rect;

    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultBitmapCropper$1;->val$callback:Lcom/android/wallpaper/module/BitmapCropper$Callback;

    invoke-direct {v0, p1, v1, p0}, Lcom/android/wallpaper/module/DefaultBitmapCropper$ScaleBitmapTask;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Lcom/android/wallpaper/module/BitmapCropper$Callback;)V

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Void;

    .line 2
    invoke-virtual {v0, p0}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method
