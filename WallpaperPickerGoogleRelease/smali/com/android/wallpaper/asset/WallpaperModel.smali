.class public Lcom/android/wallpaper/asset/WallpaperModel;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public mWallpaperManager:Landroid/app/WallpaperManager;

.field public mWallpaperSource:I


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p2, p0, Lcom/android/wallpaper/asset/WallpaperModel;->mWallpaperSource:I

    .line 3
    invoke-static {p1}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/asset/WallpaperModel;->mWallpaperManager:Landroid/app/WallpaperManager;

    return-void
.end method
