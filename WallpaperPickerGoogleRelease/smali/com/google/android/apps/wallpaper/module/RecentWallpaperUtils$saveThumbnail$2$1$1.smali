.class public final Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/asset/Asset$BitmapReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1;->onDimensionsDecoded(Landroid/graphics/Point;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field public final synthetic $context:Landroid/content/Context;

.field public final synthetic $wallpaperId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1$1;->$wallpaperId:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1$1;->$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onBitmapDecoded(Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1    # Landroid/graphics/Bitmap;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    if-nez p1, :cond_0

    .line 1
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1$1;->$wallpaperId:Ljava/lang/String;

    const-string p1, "Couldn\'t decode thumbnail bitmap for "

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->stringPlus(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "RecentWallpaperUtils"

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1$1;->$context:Landroid/content/Context;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1$1;->$wallpaperId:Ljava/lang/String;

    invoke-static {p0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->getWallpaperThumbnailFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0, p1}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->access$storeBitmap(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    return-void
.end method
