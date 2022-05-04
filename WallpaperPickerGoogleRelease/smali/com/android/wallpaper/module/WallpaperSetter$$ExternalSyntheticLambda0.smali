.class public final synthetic Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/android/wallpaper/module/WallpaperSetter;

.field public final synthetic f$1:Lcom/android/wallpaper/model/LiveWallpaperInfo;

.field public final synthetic f$2:Landroid/app/WallpaperColors;

.field public final synthetic f$3:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/module/WallpaperSetter;Lcom/android/wallpaper/model/LiveWallpaperInfo;Landroid/app/WallpaperColors;Landroid/app/Activity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/module/WallpaperSetter;

    iput-object p2, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda0;->f$1:Lcom/android/wallpaper/model/LiveWallpaperInfo;

    iput-object p3, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda0;->f$2:Landroid/app/WallpaperColors;

    iput-object p4, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda0;->f$3:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget-object v0, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/module/WallpaperSetter;

    iget-object v1, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda0;->f$1:Lcom/android/wallpaper/model/LiveWallpaperInfo;

    iget-object v2, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda0;->f$2:Landroid/app/WallpaperColors;

    iget-object p0, p0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda0;->f$3:Landroid/app/Activity;

    .line 1
    iget-object v0, v0, Lcom/android/wallpaper/module/WallpaperSetter;->mPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-virtual {v1}, Lcom/android/wallpaper/model/LiveWallpaperInfo;->getWallpaperId()Ljava/lang/String;

    move-result-object v3

    if-eqz v2, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    invoke-virtual {v1, p0}, Lcom/android/wallpaper/model/LiveWallpaperInfo;->getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object v2

    .line 3
    invoke-virtual {v2, p0}, Lcom/android/wallpaper/asset/Asset;->getLowResBitmap(Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 4
    invoke-static {p0}, Landroid/app/WallpaperColors;->fromBitmap(Landroid/graphics/Bitmap;)Landroid/app/WallpaperColors;

    move-result-object v2

    .line 5
    :goto_0
    invoke-interface {v0, v3, v1, v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->storeLatestHomeWallpaper(Ljava/lang/String;Lcom/android/wallpaper/model/LiveWallpaperInfo;Landroid/app/WallpaperColors;)V

    return-void
.end method
