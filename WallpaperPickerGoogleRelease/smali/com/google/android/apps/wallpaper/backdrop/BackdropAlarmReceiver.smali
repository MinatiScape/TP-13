.class public Lcom/google/android/apps/wallpaper/backdrop/BackdropAlarmReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-string p1, "BackdropAlarmReceiver"

    const-string p2, "Backdrop alarm received"

    .line 2
    invoke-static {p1, p2, p0}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 3
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p2

    invoke-interface {p2, p0}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object p2

    .line 4
    invoke-interface {p2}, Lcom/android/wallpaper/module/WallpaperPreferences;->getWallpaperPresentationMode()I

    move-result p2

    const/4 v0, 0x1

    if-ne v0, p2, :cond_0

    const-string p2, "Wallpaper presentation mode has reverted to STATIC, returning early and not setting any future jobs or alarms"

    .line 5
    invoke-static {p1, p2, p0}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    return-void

    .line 6
    :cond_0
    invoke-static {p0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->getInstance(Landroid/content/Context;)Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;

    move-result-object p2

    .line 7
    iget-object p2, p2, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v1, "required_network_state"

    invoke-interface {p2, v1, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p2

    .line 8
    invoke-static {p0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropTaskScheduler;->getInstance(Landroid/content/Context;)Lcom/google/android/apps/wallpaper/backdrop/BackdropTaskScheduler;

    move-result-object v1

    .line 9
    move-object v2, v1

    check-cast v2, Lcom/google/android/apps/wallpaper/backdrop/JobSchedulerBackdropTaskScheduler;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    new-instance v3, Landroid/app/job/JobInfo$Builder;

    new-instance v4, Landroid/content/ComponentName;

    iget-object v5, v2, Lcom/google/android/apps/wallpaper/backdrop/JobSchedulerBackdropTaskScheduler;->mAppContext:Landroid/content/Context;

    const-class v6, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService;

    invoke-direct {v4, v5, v6}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-direct {v3, v0, v4}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    sget-wide v4, Lcom/google/android/apps/wallpaper/backdrop/JobSchedulerBackdropTaskScheduler;->ONE_DAY_IN_MILLIS:J

    sget-wide v6, Lcom/google/android/apps/wallpaper/backdrop/JobSchedulerBackdropTaskScheduler;->ONE_HOUR_IN_MILLIS:J

    .line 11
    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/app/job/JobInfo$Builder;->setPeriodic(JJ)Landroid/app/job/JobInfo$Builder;

    move-result-object v3

    .line 12
    invoke-virtual {v3, v0}, Landroid/app/job/JobInfo$Builder;->setPersisted(Z)Landroid/app/job/JobInfo$Builder;

    move-result-object v3

    .line 13
    invoke-static {p2}, Lcom/google/android/apps/wallpaper/backdrop/JobSchedulerBackdropTaskScheduler;->mapNetworkPreferenceToRequiredNetworkType(I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    move-result-object v3

    .line 14
    invoke-virtual {v3}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object v3

    .line 15
    iget-object v2, v2, Lcom/google/android/apps/wallpaper/backdrop/JobSchedulerBackdropTaskScheduler;->mJobScheduler:Landroid/app/job/JobScheduler;

    invoke-virtual {v2, v3}, Landroid/app/job/JobScheduler;->schedule(Landroid/app/job/JobInfo;)I

    move-result v2

    if-nez v2, :cond_1

    .line 16
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to schedule JobScheduler periodic job: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "JSTaskScheduler"

    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    const/4 v2, 0x3

    .line 17
    invoke-virtual {v1, p2, v2}, Lcom/google/android/apps/wallpaper/backdrop/BackdropTaskScheduler;->scheduleOneOffTask(II)V

    .line 18
    invoke-static {p0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropAlarmScheduler;->setOvernightAlarm(Landroid/content/Context;)V

    const/4 v1, 0x0

    if-eq p2, v0, :cond_2

    move p2, v0

    goto :goto_0

    :cond_2
    move p2, v1

    :goto_0
    const-string v2, "connectivity"

    .line 19
    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    if-nez v2, :cond_3

    move v2, v0

    goto :goto_1

    .line 20
    :cond_3
    invoke-virtual {v2}, Landroid/net/ConnectivityManager;->isActiveNetworkMetered()Z

    move-result v2

    :goto_1
    if-nez p2, :cond_4

    if-nez v2, :cond_5

    :cond_4
    move v1, v0

    :cond_5
    if-nez v1, :cond_6

    const-string p2, "Network conditions not met, persisting this information to SharedPreferences."

    .line 21
    invoke-static {p1, p2, p0}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 22
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p1

    .line 23
    invoke-interface {p1, p0}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object p0

    .line 24
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p1

    .line 25
    invoke-interface {p0, v0, p1, p2}, Lcom/android/wallpaper/module/WallpaperPreferences;->setDailyWallpaperRotationStatus(IJ)V

    :cond_6
    return-void
.end method
