.class public Lcom/google/android/apps/wallpaper/module/GoogleAlarmInitializer;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ServiceCast"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-string v0, "wallpaper"

    .line 2
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/WallpaperManager;

    .line 3
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/Injector;->getWallpaperManagerCompat(Landroid/content/Context;)Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    .line 4
    invoke-virtual {p1}, Landroid/app/WallpaperManager;->isWallpaperSupported()Z

    move-result p1

    const-string v0, "GoogleAlarmInitializer"

    if-nez p1, :cond_0

    const-string p0, "Wallpapers are not supported in this context, not attempting to schedule a wallpaper rotation alarm"

    .line 5
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 6
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string p2, "android.intent.action.BOOT_COMPLETED"

    .line 7
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 8
    invoke-static {p0}, Lcom/android/wallpaper/module/DailyLoggingAlarmScheduler;->setAlarm(Landroid/content/Context;)V

    .line 9
    :cond_1
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2

    const-string p2, "android.intent.action.MY_PACKAGE_REPLACED"

    .line 10
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 11
    :cond_2
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p1

    invoke-interface {p1, p0}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object p1

    .line 12
    invoke-interface {p1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getWallpaperPresentationMode()I

    move-result p1

    const/4 p2, 0x2

    if-ne p1, p2, :cond_4

    const-string p1, "Wallpaper rotation is in effect, setting an alarm for Backdrop rotation"

    .line 13
    invoke-static {v0, p1, p0}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 14
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p1

    invoke-interface {p1, p0}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object p1

    .line 15
    invoke-interface {p1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getLastDailyRotationTimestamp()J

    move-result-wide v1

    .line 16
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object p2

    const/16 v3, 0xa

    const/4 v4, 0x0

    .line 17
    invoke-virtual {p2, v3, v4}, Ljava/util/Calendar;->set(II)V

    const/16 v3, 0xc

    .line 18
    invoke-virtual {p2, v3, v4}, Ljava/util/Calendar;->set(II)V

    const/16 v3, 0x9

    .line 19
    invoke-virtual {p2, v3, v4}, Ljava/util/Calendar;->set(II)V

    .line 20
    invoke-virtual {p2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v3

    .line 21
    invoke-interface {p1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getDailyWallpaperEnabledTimestamp()J

    move-result-wide p1

    cmp-long v1, v1, v3

    if-gez v1, :cond_3

    cmp-long p1, p1, v3

    if-gez p1, :cond_3

    const-string p1, "Set immediate alarm to update wallpaper since wallpaper should have been updated overnight but didn\'t."

    .line 22
    invoke-static {v0, p1, p0}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 23
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p1

    invoke-interface {p1, p0}, Lcom/android/wallpaper/module/Injector;->getAlarmManagerWrapper(Landroid/content/Context;)Landroidx/lifecycle/MethodCallsLogger;

    move-result-object p1

    .line 24
    invoke-static {p0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropAlarmScheduler;->createBackdropAlarmReceiverPendingIntent(Landroid/content/Context;)Landroid/app/PendingIntent;

    move-result-object v6

    .line 25
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v0, 0x1

    sget-object p2, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, v1, p2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v4

    const/4 v1, 0x2

    .line 26
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    .line 27
    iget-object p0, p1, Landroidx/lifecycle/MethodCallsLogger;->mCalledMethods:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Landroid/app/AlarmManager;

    invoke-virtual/range {v0 .. v6}, Landroid/app/AlarmManager;->setWindow(IJJLandroid/app/PendingIntent;)V

    goto :goto_0

    :cond_3
    const-string p1, "Set overnight alarm."

    .line 28
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    invoke-static {p0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropAlarmScheduler;->setOvernightAlarm(Landroid/content/Context;)V

    :cond_4
    :goto_0
    return-void
.end method
