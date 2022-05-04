.class public Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/module/DefaultWallpaperPersister;->setIndividualWallpaperWithPosition(Landroid/app/Activity;Lcom/android/wallpaper/model/WallpaperInfo;ILcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

.field public final synthetic val$asset:Lcom/android/wallpaper/asset/Asset;

.field public final synthetic val$callback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

.field public final synthetic val$screenSize:Landroid/graphics/Point;

.field public final synthetic val$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

.field public final synthetic val$wallpaperPosition:I


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/module/DefaultWallpaperPersister;Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;ILcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/asset/Asset;Landroid/graphics/Point;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    iput-object p2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->val$callback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    iput p3, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->val$wallpaperPosition:I

    iput-object p4, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->val$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iput-object p5, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->val$asset:Lcom/android/wallpaper/asset/Asset;

    iput-object p6, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->val$screenSize:Landroid/graphics/Point;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDimensionsDecoded(Landroid/graphics/Point;)V
    .locals 10

    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->val$callback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    invoke-interface {p0, v0}, Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;->onError(Ljava/lang/Throwable;)V

    return-void

    .line 2
    :cond_0
    iget v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->val$wallpaperPosition:I

    const/4 v2, 0x2

    if-eqz v1, :cond_3

    const/4 v3, 0x1

    if-eq v1, v3, :cond_2

    if-eq v1, v2, :cond_1

    const-string p1, "Unsupported wallpaper position option specified: "

    .line 3
    invoke-static {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->val$wallpaperPosition:I

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "WallpaperPersister"

    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 4
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->val$callback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    invoke-interface {p0, v0}, Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 5
    :cond_1
    iget-object p1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->val$asset:Lcom/android/wallpaper/asset/Asset;

    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->val$screenSize:Landroid/graphics/Point;

    iget v1, v0, Landroid/graphics/Point;->x:I

    iget v0, v0, Landroid/graphics/Point;->y:I

    new-instance v2, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4$1;

    invoke-direct {v2, p0}, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4$1;-><init>(Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;)V

    invoke-virtual {p1, v1, v0, v2}, Lcom/android/wallpaper/asset/Asset;->decodeBitmap(IILcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    goto/16 :goto_0

    .line 6
    :cond_2
    iget-object v3, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    iget-object v4, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->val$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v5, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->val$asset:Lcom/android/wallpaper/asset/Asset;

    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->val$screenSize:Landroid/graphics/Point;

    iget-object v9, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->val$callback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    .line 7
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    iget p0, v0, Landroid/graphics/Point;->x:I

    int-to-float p0, p0

    iget v1, p1, Landroid/graphics/Point;->x:I

    int-to-float v1, v1

    div-float/2addr p0, v1

    iget v1, v0, Landroid/graphics/Point;->y:I

    int-to-float v1, v1

    iget v6, p1, Landroid/graphics/Point;->y:I

    int-to-float v6, v6

    div-float/2addr v1, v6

    invoke-static {p0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v7

    .line 9
    iget p0, p1, Landroid/graphics/Point;->x:I

    int-to-float p0, p0

    mul-float/2addr p0, v7

    float-to-int p0, p0

    .line 10
    iget p1, p1, Landroid/graphics/Point;->y:I

    int-to-float p1, p1

    mul-float/2addr p1, v7

    float-to-int p1, p1

    .line 11
    new-instance v6, Landroid/graphics/Rect;

    iget v1, v0, Landroid/graphics/Point;->x:I

    sub-int v1, p0, v1

    div-int/2addr v1, v2

    iget v0, v0, Landroid/graphics/Point;->y:I

    sub-int v0, p1, v0

    div-int/2addr v0, v2

    sub-int/2addr p0, v1

    sub-int/2addr p1, v0

    invoke-direct {v6, v1, v0, p0, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    const/4 v8, 0x2

    .line 12
    invoke-virtual/range {v3 .. v9}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->setIndividualWallpaper(Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/asset/Asset;Landroid/graphics/Rect;FILcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V

    goto :goto_0

    .line 13
    :cond_3
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->val$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v3, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->val$asset:Lcom/android/wallpaper/asset/Asset;

    iget-object v4, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->val$screenSize:Landroid/graphics/Point;

    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->val$callback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    .line 14
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    iget v5, p1, Landroid/graphics/Point;->x:I

    iget v6, v4, Landroid/graphics/Point;->x:I

    if-lt v5, v6, :cond_4

    iget v6, p1, Landroid/graphics/Point;->y:I

    iget v7, v4, Landroid/graphics/Point;->y:I

    if-lt v6, v7, :cond_4

    .line 16
    new-instance v5, Landroid/graphics/Rect;

    iget v6, p1, Landroid/graphics/Point;->x:I

    iget v7, v4, Landroid/graphics/Point;->x:I

    sub-int v7, v6, v7

    div-int/2addr v7, v2

    iget p1, p1, Landroid/graphics/Point;->y:I

    iget v8, v4, Landroid/graphics/Point;->y:I

    sub-int v8, p1, v8

    div-int/2addr v8, v2

    sub-int/2addr v6, v7

    sub-int/2addr p1, v8

    invoke-direct {v5, v7, v8, v6, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 17
    iget p1, v4, Landroid/graphics/Point;->x:I

    iget v6, v4, Landroid/graphics/Point;->y:I

    const/4 v7, 0x0

    new-instance v8, Lcom/android/wallpaper/module/DefaultWallpaperPersister$$ExternalSyntheticLambda0;

    invoke-direct {v8, v0, v1, p0}, Lcom/android/wallpaper/module/DefaultWallpaperPersister$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/module/DefaultWallpaperPersister;Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V

    move-object v4, v5

    move v5, p1

    invoke-virtual/range {v3 .. v8}, Lcom/android/wallpaper/asset/Asset;->decodeBitmapRegion(Landroid/graphics/Rect;IIZLcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    goto :goto_0

    .line 18
    :cond_4
    iget p1, p1, Landroid/graphics/Point;->y:I

    new-instance v2, Lcom/android/wallpaper/module/DefaultWallpaperPersister$5;

    invoke-direct {v2, v0, p0, v1, v4}, Lcom/android/wallpaper/module/DefaultWallpaperPersister$5;-><init>(Lcom/android/wallpaper/module/DefaultWallpaperPersister;Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Point;)V

    invoke-virtual {v3, v5, p1, v2}, Lcom/android/wallpaper/asset/Asset;->decodeBitmap(IILcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    :goto_0
    return-void
.end method
