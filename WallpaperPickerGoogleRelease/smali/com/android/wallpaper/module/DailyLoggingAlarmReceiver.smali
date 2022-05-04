.class public Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static access$000(Landroid/os/PowerManager$WakeLock;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p0}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_0
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    .line 2
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p2

    .line 3
    invoke-interface {p2, p1}, Lcom/android/wallpaper/module/Injector;->getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;

    move-result-object v0

    .line 4
    invoke-interface {p2, p1}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object p2

    .line 5
    invoke-interface {v0}, Lcom/android/wallpaper/module/UserEventLogger;->logNumDailyWallpaperRotationsInLastWeek()V

    .line 6
    invoke-interface {v0}, Lcom/android/wallpaper/module/UserEventLogger;->logNumDailyWallpaperRotationsPreviousDay()V

    .line 7
    invoke-interface {v0}, Lcom/android/wallpaper/module/UserEventLogger;->logWallpaperPresentationMode()V

    .line 8
    invoke-interface {v0}, Lcom/android/wallpaper/module/UserEventLogger;->logSnapshot()V

    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-interface {p2, v0, v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLastDailyLogTimestamp(J)V

    const-string p2, "power"

    .line 10
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/os/PowerManager;

    const/4 v0, 0x1

    const-string v1, "DailyLoggingAlarm"

    .line 11
    invoke-virtual {p2, v0, v1}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object p2

    const-wide/16 v0, 0x2710

    .line 12
    invoke-virtual {p2, v0, v1}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    .line 13
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    .line 14
    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/Injector;->getWallpaperRefresher(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperRefresher;

    move-result-object v1

    new-instance v2, Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver$1;

    invoke-direct {v2, p0, p2, v0, p1}, Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver$1;-><init>(Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver;Landroid/os/PowerManager$WakeLock;Lcom/android/wallpaper/module/Injector;Landroid/content/Context;)V

    check-cast v1, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    invoke-virtual {v1, v2}, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->refresh(Lcom/android/wallpaper/module/WallpaperRefresher$RefreshListener;)V

    .line 15
    sget-object p0, Lcom/android/wallpaper/util/DiskBasedLogger;->DATE_FORMAT:Ljava/text/SimpleDateFormat;

    .line 16
    sget-object p0, Landroid/os/Build;->TYPE:Ljava/lang/String;

    const-string p2, "eng"

    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_0

    const-string p2, "userdebug"

    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    .line 17
    :cond_0
    invoke-static {}, Lcom/android/wallpaper/util/DiskBasedLogger;->getLoggerThreadHandler()Landroid/os/Handler;

    move-result-object p0

    if-nez p0, :cond_1

    const-string p0, "DiskBasedLogger"

    const-string p1, "Something went wrong creating the logger thread handler, quitting this logging operation"

    .line 18
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 19
    :cond_1
    new-instance p2, Lcom/android/wallpaper/util/DiskBasedLogger$$ExternalSyntheticLambda1;

    invoke-direct {p2, p1}, Lcom/android/wallpaper/util/DiskBasedLogger$$ExternalSyntheticLambda1;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_0
    return-void
.end method
