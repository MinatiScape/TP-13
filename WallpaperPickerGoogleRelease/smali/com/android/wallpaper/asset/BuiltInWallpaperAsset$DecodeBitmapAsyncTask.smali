.class public Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapAsyncTask;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DecodeBitmapAsyncTask"
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
.field public mHeight:I

.field public mReceiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

.field public mWidth:I

.field public final synthetic this$0:Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;IILcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapAsyncTask;->this$0:Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    iput p2, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapAsyncTask;->mWidth:I

    .line 3
    iput p3, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapAsyncTask;->mHeight:I

    .line 4
    iput-object p4, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapAsyncTask;->mReceiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    return-void
.end method


# virtual methods
.method public doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    check-cast p1, [Ljava/lang/Void;

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapAsyncTask;->this$0:Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;

    .line 3
    iget-object p1, p1, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;->mContext:Landroid/content/Context;

    .line 4
    invoke-static {p1}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object p1

    .line 5
    iget v1, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapAsyncTask;->mWidth:I

    iget v2, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapAsyncTask;->mHeight:I

    const/4 v3, 0x1

    const/high16 v4, 0x3f000000    # 0.5f

    const/high16 v5, 0x3f000000    # 0.5f

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/app/WallpaperManager;->getBuiltInDrawable(IIZFF)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    .line 6
    invoke-virtual {p1}, Landroid/app/WallpaperManager;->forgetLoadedWallpaper()V

    .line 7
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
    iget-object p0, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeBitmapAsyncTask;->mReceiver:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/asset/Asset$BitmapReceiver;->onBitmapDecoded(Landroid/graphics/Bitmap;)V

    return-void
.end method
