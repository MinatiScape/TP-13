.class public final synthetic Lcom/google/android/apps/wallpaper/picker/WallpapersApplication$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# instance fields
.field public final synthetic f$0:Lcom/google/android/apps/wallpaper/picker/WallpapersApplication;

.field public final synthetic f$1:Lcom/android/wallpaper/module/Injector;

.field public final synthetic f$2:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/apps/wallpaper/picker/WallpapersApplication;Lcom/android/wallpaper/module/Injector;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/picker/WallpapersApplication$$ExternalSyntheticLambda0;->f$0:Lcom/google/android/apps/wallpaper/picker/WallpapersApplication;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/picker/WallpapersApplication$$ExternalSyntheticLambda0;->f$1:Lcom/android/wallpaper/module/Injector;

    iput-object p3, p0, Lcom/google/android/apps/wallpaper/picker/WallpapersApplication$$ExternalSyntheticLambda0;->f$2:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 6

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/picker/WallpapersApplication$$ExternalSyntheticLambda0;->f$0:Lcom/google/android/apps/wallpaper/picker/WallpapersApplication;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/picker/WallpapersApplication$$ExternalSyntheticLambda0;->f$1:Lcom/android/wallpaper/module/Injector;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/picker/WallpapersApplication$$ExternalSyntheticLambda0;->f$2:Landroid/content/Context;

    sget v2, Lcom/google/android/apps/wallpaper/picker/WallpapersApplication;->$r8$clinit:I

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1
    invoke-interface {v1, p0}, Lcom/android/wallpaper/module/Injector;->getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;

    move-result-object v2

    .line 2
    invoke-interface {v1, p0}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object p0

    .line 3
    invoke-static {p2}, Landroidx/lifecycle/runtime/R$id;->isOOM(Ljava/lang/Throwable;)Z

    move-result v1

    .line 4
    invoke-interface {p0}, Lcom/android/wallpaper/module/WallpaperPreferences;->getPendingWallpaperSetStatus()I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne v3, v5, :cond_0

    .line 5
    invoke-interface {v2, v5}, Lcom/android/wallpaper/module/UserEventLogger;->logWallpaperSetResult(I)V

    .line 6
    invoke-interface {v2, v1}, Lcom/android/wallpaper/module/UserEventLogger;->logWallpaperSetFailureReason(I)V

    .line 7
    invoke-interface {p0, v4}, Lcom/android/wallpaper/module/WallpaperPreferences;->setPendingWallpaperSetStatusSync(I)V

    .line 8
    :cond_0
    invoke-interface {p0}, Lcom/android/wallpaper/module/WallpaperPreferences;->getPendingDailyWallpaperUpdateStatus()I

    move-result v3

    if-ne v3, v5, :cond_1

    const/4 v3, 0x4

    .line 9
    invoke-interface {v2, v3}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyWallpaperSetNextWallpaperResult(I)V

    .line 10
    invoke-interface {v2, v1}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyWallpaperSetNextWallpaperCrash(I)V

    .line 11
    invoke-interface {p0, v4}, Lcom/android/wallpaper/module/WallpaperPreferences;->setPendingDailyWallpaperUpdateStatusSync(I)V

    .line 12
    :cond_1
    iget-object p0, v0, Lcom/google/android/apps/wallpaper/picker/WallpapersApplication;->mWrappedHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {p0, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    return-void
.end method
