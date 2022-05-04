.class public final Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field public final synthetic $context:Landroid/content/Context;

.field public final synthetic $dimen:Landroid/graphics/Point;

.field public final synthetic $thumbAsset:Lcom/android/wallpaper/asset/Asset;

.field public final synthetic $thumbRect:Lkotlin/jvm/internal/Ref$ObjectRef;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/internal/Ref$ObjectRef<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic $wallpaperId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lkotlin/jvm/internal/Ref$ObjectRef;Landroid/graphics/Point;Lcom/android/wallpaper/asset/Asset;Ljava/lang/String;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/internal/Ref$ObjectRef<",
            "Landroid/graphics/Rect;",
            ">;",
            "Landroid/graphics/Point;",
            "Lcom/android/wallpaper/asset/Asset;",
            "Ljava/lang/String;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1;->$thumbRect:Lkotlin/jvm/internal/Ref$ObjectRef;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1;->$dimen:Landroid/graphics/Point;

    iput-object p3, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1;->$thumbAsset:Lcom/android/wallpaper/asset/Asset;

    iput-object p4, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1;->$wallpaperId:Ljava/lang/String;

    iput-object p5, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1;->$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onDimensionsDecoded(Landroid/graphics/Point;)V
    .locals 4
    .param p1    # Landroid/graphics/Point;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1;->$thumbRect:Lkotlin/jvm/internal/Ref$ObjectRef;

    new-instance v1, Landroid/graphics/Rect;

    const/4 v2, 0x0

    if-nez p1, :cond_0

    move-object v3, v2

    goto :goto_0

    :cond_0
    iget v3, p1, Landroid/graphics/Point;->x:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    :goto_0
    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1;->$dimen:Landroid/graphics/Point;

    iget v3, v3, Landroid/graphics/Point;->x:I

    goto :goto_1

    :cond_1
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    :goto_1
    if-nez p1, :cond_2

    goto :goto_2

    :cond_2
    iget p1, p1, Landroid/graphics/Point;->y:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    :goto_2
    if-nez v2, :cond_3

    iget-object p1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1;->$dimen:Landroid/graphics/Point;

    iget p1, p1, Landroid/graphics/Point;->y:I

    goto :goto_3

    :cond_3
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result p1

    :goto_3
    const/4 v2, 0x0

    invoke-direct {v1, v2, v2, v3, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v1, v0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 2
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1;->$thumbRect:Lkotlin/jvm/internal/Ref$ObjectRef;

    iget-object p1, p1, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast p1, Landroid/graphics/Rect;

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1;->$dimen:Landroid/graphics/Point;

    iget v1, v0, Landroid/graphics/Point;->x:I

    iget v0, v0, Landroid/graphics/Point;->y:I

    invoke-static {p1, v1, v0}, Lcom/android/wallpaper/util/WallpaperCropUtils;->fitToSize(Landroid/graphics/Rect;II)V

    .line 3
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1;->$thumbAsset:Lcom/android/wallpaper/asset/Asset;

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1;->$thumbRect:Lkotlin/jvm/internal/Ref$ObjectRef;

    iget-object v0, v0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1;->$thumbRect:Lkotlin/jvm/internal/Ref$ObjectRef;

    iget-object v1, v1, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    new-instance v2, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1$1;

    iget-object v3, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1;->$wallpaperId:Ljava/lang/String;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1;->$context:Landroid/content/Context;

    invoke-direct {v2, v3, p0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1$1;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    invoke-virtual {p1, v0, v1, v2}, Lcom/android/wallpaper/asset/Asset;->decodeBitmap(IILcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    return-void
.end method
