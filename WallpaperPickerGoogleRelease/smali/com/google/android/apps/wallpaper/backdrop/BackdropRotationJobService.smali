.class public Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService;
.super Landroid/app/job/JobService;
.source "SourceFile"


# static fields
.field public static final synthetic $r8$clinit:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/app/job/JobService;-><init>()V

    return-void
.end method


# virtual methods
.method public onStartJob(Landroid/app/job/JobParameters;)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/job/JobService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 2
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v1

    .line 3
    invoke-interface {v1, v0}, Lcom/android/wallpaper/module/Injector;->getWallpaperRefresher(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperRefresher;

    move-result-object v1

    .line 4
    new-instance v2, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$1;

    invoke-direct {v2, p0, p1, v0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$1;-><init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService;Landroid/app/job/JobParameters;Landroid/content/Context;)V

    check-cast v1, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    invoke-virtual {v1, v2}, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->refresh(Lcom/android/wallpaper/module/WallpaperRefresher$RefreshListener;)V

    const/4 p0, 0x1

    return p0
.end method

.method public onStopJob(Landroid/app/job/JobParameters;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
