.class public final synthetic Lcom/android/wallpaper/model/WallpaperSectionController$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory$WallpaperInfoCallback;


# instance fields
.field public final synthetic f$0:Lcom/android/wallpaper/model/WallpaperSectionController;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/model/WallpaperSectionController;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/model/WallpaperSectionController;

    return-void
.end method


# virtual methods
.method public final onWallpaperInfoCreated(Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/model/WallpaperInfo;I)V
    .locals 1

    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperSectionController$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/model/WallpaperSectionController;

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/model/WallpaperSectionController;->isActivityAlive()Z

    move-result p3

    if-nez p3, :cond_0

    goto :goto_1

    .line 2
    :cond_0
    iput-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomePreviewWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

    if-nez p2, :cond_1

    move-object p3, p1

    goto :goto_0

    :cond_1
    move-object p3, p2

    .line 3
    :goto_0
    iput-object p3, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockPreviewWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 4
    iget-object p3, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mAppContext:Landroid/content/Context;

    invoke-virtual {p1, p3}, Lcom/android/wallpaper/model/WallpaperInfo;->computePlaceholderColor(Landroid/content/Context;)Ljava/util/concurrent/Future;

    if-eqz p2, :cond_2

    .line 5
    iget-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mAppContext:Landroid/content/Context;

    invoke-virtual {p2, p1}, Lcom/android/wallpaper/model/WallpaperInfo;->computePlaceholderColor(Landroid/content/Context;)Ljava/util/concurrent/Future;

    .line 6
    :cond_2
    iget-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomePreviewWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

    const/4 p3, 0x1

    invoke-virtual {p0, p1, p3}, Lcom/android/wallpaper/model/WallpaperSectionController;->updatePreview(Lcom/android/wallpaper/model/WallpaperInfo;Z)V

    .line 7
    iget-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockPreviewWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/wallpaper/model/WallpaperSectionController;->updatePreview(Lcom/android/wallpaper/model/WallpaperInfo;Z)V

    .line 8
    iget-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mAppContext:Landroid/content/Context;

    invoke-static {p1}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object p1

    .line 9
    invoke-virtual {p1, p3}, Landroid/app/WallpaperManager;->getWallpaperColors(I)Landroid/app/WallpaperColors;

    move-result-object p3

    .line 10
    invoke-virtual {p0, p3}, Lcom/android/wallpaper/model/WallpaperSectionController;->onHomeWallpaperColorsChanged(Landroid/app/WallpaperColors;)V

    if-eqz p2, :cond_3

    const/4 p2, 0x2

    .line 11
    invoke-virtual {p1, p2}, Landroid/app/WallpaperManager;->getWallpaperColors(I)Landroid/app/WallpaperColors;

    move-result-object p3

    .line 12
    :cond_3
    invoke-virtual {p0, p3}, Lcom/android/wallpaper/model/WallpaperSectionController;->onLockWallpaperColorsChanged(Landroid/app/WallpaperColors;)V

    :goto_1
    return-void
.end method
