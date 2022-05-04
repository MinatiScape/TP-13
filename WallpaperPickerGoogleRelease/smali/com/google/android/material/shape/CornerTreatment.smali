.class public Lcom/google/android/material/shape/CornerTreatment;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getCornerPath(Lcom/google/android/material/shape/ShapePath;FFF)V
    .locals 0

    const/4 p0, 0x0

    throw p0
.end method

.method public getLiveWallpaperInfo(Landroid/app/WallpaperInfo;)Lcom/android/wallpaper/model/WallpaperInfo;
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/app/WallpaperInfo;->getComponent()Landroid/content/ComponentName;

    move-result-object p0

    .line 2
    sget-object v0, Lwireless/android/learning/acmi/micropaper/frontend/MicropaperFrontend;->MICROPAPER_SERVICE:Landroid/content/ComponentName;

    .line 3
    invoke-virtual {p0, v0}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 4
    new-instance p0, Lcom/google/android/apps/wallpaper/model/MicropaperWallpaperInfo;

    invoke-direct {p0, p1}, Lcom/google/android/apps/wallpaper/model/MicropaperWallpaperInfo;-><init>(Landroid/app/WallpaperInfo;)V

    return-object p0

    .line 5
    :cond_0
    new-instance p0, Lcom/google/android/apps/wallpaper/model/GoogleLiveWallpaperInfo;

    invoke-direct {p0, p1}, Lcom/google/android/apps/wallpaper/model/GoogleLiveWallpaperInfo;-><init>(Landroid/app/WallpaperInfo;)V

    return-object p0
.end method
