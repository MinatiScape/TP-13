.class public Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeDimensionsAsyncTask;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DecodeDimensionsAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Landroid/graphics/Point;",
        ">;"
    }
.end annotation


# instance fields
.field public mReceiver:Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;

.field public final synthetic this$0:Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeDimensionsAsyncTask;->this$0:Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeDimensionsAsyncTask;->mReceiver:Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;

    return-void
.end method


# virtual methods
.method public doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, [Ljava/lang/Void;

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeDimensionsAsyncTask;->this$0:Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;

    invoke-static {p0}, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;->access$100(Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;)Landroid/graphics/Point;

    move-result-object p0

    return-object p0
.end method

.method public onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/graphics/Point;

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset$DecodeDimensionsAsyncTask;->mReceiver:Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;->onDimensionsDecoded(Landroid/graphics/Point;)V

    return-void
.end method
