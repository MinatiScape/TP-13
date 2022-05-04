.class public final synthetic Lcom/android/wallpaper/model/WallpaperInfo$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic f$0:Lcom/android/wallpaper/model/WallpaperInfo;

.field public final synthetic f$1:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/model/WallpaperInfo;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/model/WallpaperInfo$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/model/WallpaperInfo;

    iput-object p2, p0, Lcom/android/wallpaper/model/WallpaperInfo$$ExternalSyntheticLambda0;->f$1:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperInfo$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperInfo$$ExternalSyntheticLambda0;->f$1:Landroid/content/Context;

    sget-object v1, Lcom/android/wallpaper/model/WallpaperInfo;->sExecutor:Ljava/util/concurrent/ExecutorService;

    .line 1
    monitor-enter v0

    .line 2
    :try_start_0
    iget v1, v0, Lcom/android/wallpaper/model/WallpaperInfo;->mPlaceholderColor:I

    if-eqz v1, :cond_0

    .line 3
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    monitor-exit v0

    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {v0, p0}, Lcom/android/wallpaper/model/WallpaperInfo;->getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object v1

    .line 5
    invoke-virtual {v1, p0}, Lcom/android/wallpaper/asset/Asset;->getLowResBitmap(Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object p0

    if-nez p0, :cond_1

    const/4 p0, 0x0

    .line 6
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    monitor-exit v0

    goto :goto_0

    .line 7
    :cond_1
    invoke-static {p0}, Landroid/app/WallpaperColors;->fromBitmap(Landroid/graphics/Bitmap;)Landroid/app/WallpaperColors;

    move-result-object p0

    .line 8
    invoke-virtual {p0}, Landroid/app/WallpaperColors;->getPrimaryColor()Landroid/graphics/Color;

    move-result-object p0

    invoke-virtual {p0}, Landroid/graphics/Color;->toArgb()I

    move-result p0

    iput p0, v0, Lcom/android/wallpaper/model/WallpaperInfo;->mPlaceholderColor:I

    .line 9
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    monitor-exit v0

    :goto_0
    return-object p0

    :catchall_0
    move-exception p0

    .line 10
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
