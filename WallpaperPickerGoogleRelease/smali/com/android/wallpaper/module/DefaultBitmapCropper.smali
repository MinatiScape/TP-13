.class public Lcom/android/wallpaper/module/DefaultBitmapCropper;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/BitmapCropper;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/module/DefaultBitmapCropper$ScaleBitmapTask;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cropAndScaleBitmap(Lcom/android/wallpaper/asset/Asset;FLandroid/graphics/Rect;ZLcom/android/wallpaper/module/BitmapCropper$Callback;)V
    .locals 6

    .line 1
    new-instance v1, Landroid/graphics/Rect;

    iget v0, p3, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    div-float/2addr v0, p2

    .line 2
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iget v2, p3, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    div-float/2addr v2, p2

    .line 3
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iget v3, p3, Landroid/graphics/Rect;->right:I

    int-to-float v3, v3

    div-float/2addr v3, p2

    .line 4
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    iget v4, p3, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v4

    div-float/2addr v4, p2

    .line 5
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result p2

    invoke-direct {v1, v0, v2, v3, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 6
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    move-result v3

    new-instance v5, Lcom/android/wallpaper/module/DefaultBitmapCropper$1;

    invoke-direct {v5, p0, p3, p5}, Lcom/android/wallpaper/module/DefaultBitmapCropper$1;-><init>(Lcom/android/wallpaper/module/DefaultBitmapCropper;Landroid/graphics/Rect;Lcom/android/wallpaper/module/BitmapCropper$Callback;)V

    move-object v0, p1

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/android/wallpaper/asset/Asset;->decodeBitmapRegion(Landroid/graphics/Rect;IIZLcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    return-void
.end method
