.class public Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapRegionAsyncTask;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DecodeBitmapRegionAsyncTask"
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
.field public mReceiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

.field public mRect:Landroid/graphics/Rect;

.field public final synthetic this$0:Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;Landroid/graphics/Rect;Lcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapRegionAsyncTask;->this$0:Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapRegionAsyncTask;->mRect:Landroid/graphics/Rect;

    .line 3
    iput-object p3, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapRegionAsyncTask;->mReceiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    return-void
.end method


# virtual methods
.method public doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11

    .line 1
    check-cast p1, [Ljava/lang/Void;

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapRegionAsyncTask;->this$0:Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;

    invoke-static {p1}, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;->access$100(Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;)Landroid/graphics/Point;

    move-result-object p1

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapRegionAsyncTask;->mRect:Landroid/graphics/Rect;

    .line 4
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 5
    iget v2, p1, Landroid/graphics/Point;->x:I

    iget v3, v0, Landroid/graphics/Rect;->right:I

    sub-int/2addr v2, v3

    add-int v3, v1, v2

    const/high16 v4, 0x3f000000    # 0.5f

    if-nez v3, :cond_0

    move v9, v4

    goto :goto_0

    :cond_0
    int-to-float v1, v1

    int-to-float v2, v2

    add-float/2addr v2, v1

    div-float/2addr v1, v2

    move v9, v1

    .line 6
    :goto_0
    iget v1, v0, Landroid/graphics/Rect;->top:I

    .line 7
    iget p1, p1, Landroid/graphics/Point;->y:I

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr p1, v0

    add-int v0, v1, p1

    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    int-to-float v0, v1

    int-to-float p1, p1

    add-float/2addr p1, v0

    div-float v4, v0, p1

    :goto_1
    move v10, v4

    .line 8
    iget-object p1, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapRegionAsyncTask;->this$0:Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;

    .line 9
    iget-object p1, p1, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;->mContext:Landroid/content/Context;

    .line 10
    invoke-static {p1}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v5

    iget-object p1, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapRegionAsyncTask;->mRect:Landroid/graphics/Rect;

    .line 11
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v6

    iget-object p0, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapRegionAsyncTask;->mRect:Landroid/graphics/Rect;

    .line 12
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result v7

    const/4 v8, 0x0

    .line 13
    invoke-virtual/range {v5 .. v10}, Landroid/app/WallpaperManager;->getBuiltInDrawable(IIZFF)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    .line 14
    check-cast p0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/graphics/Bitmap;

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapRegionAsyncTask;->mReceiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/asset/Asset$BitmapReceiver;->onBitmapDecoded(Landroid/graphics/Bitmap;)V

    return-void
.end method
