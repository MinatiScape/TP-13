.class public Lcom/android/wallpaper/module/DefaultWallpaperRefresher;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/WallpaperRefresher;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ServiceCast"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;
    }
.end annotation


# instance fields
.field public final mAppContext:Landroid/content/Context;

.field public final mWallpaperManager:Landroid/app/WallpaperManager;

.field public final mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

.field public final mWallpaperStatusChecker:Lcom/google/android/material/shape/EdgeTreatment;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mAppContext:Landroid/content/Context;

    .line 3
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v1

    .line 4
    invoke-interface {v1, v0}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 5
    invoke-interface {v1}, Lcom/android/wallpaper/module/Injector;->getWallpaperStatusChecker()Lcom/google/android/material/shape/EdgeTreatment;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperStatusChecker:Lcom/google/android/material/shape/EdgeTreatment;

    const-string v0, "wallpaper"

    .line 6
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/WallpaperManager;

    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->mWallpaperManager:Landroid/app/WallpaperManager;

    return-void
.end method


# virtual methods
.method public refresh(Lcom/android/wallpaper/module/WallpaperRefresher$RefreshListener;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;

    invoke-direct {v0, p0, p1}, Lcom/android/wallpaper/module/DefaultWallpaperRefresher$GetWallpaperMetadataAsyncTask;-><init>(Lcom/android/wallpaper/module/DefaultWallpaperRefresher;Lcom/android/wallpaper/module/WallpaperRefresher$RefreshListener;)V

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Void;

    .line 2
    invoke-virtual {v0, p0}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method
