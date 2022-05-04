.class public Lcom/android/wallpaper/module/DailyLoggingAlarmScheduler;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static setAlarm(Landroid/content/Context;)V
    .locals 11

    .line 1
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    .line 2
    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/Injector;->getAlarmManagerWrapper(Landroid/content/Context;)Landroidx/lifecycle/MethodCallsLogger;

    move-result-object v1

    .line 3
    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v0

    .line 4
    invoke-interface {v0}, Lcom/android/wallpaper/module/WallpaperPreferences;->getLastDailyLogTimestamp()J

    move-result-wide v2

    .line 5
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 7
    invoke-virtual {v0, v4, v5}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 v6, 0x6

    const/4 v7, -0x1

    .line 8
    invoke-virtual {v0, v6, v7}, Ljava/util/Calendar;->add(II)V

    const-wide/16 v7, -0x1

    cmp-long v7, v2, v7

    const/4 v8, 0x1

    if-eqz v7, :cond_1

    .line 9
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v9

    cmp-long v0, v2, v9

    if-gez v0, :cond_0

    goto :goto_0

    .line 10
    :cond_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 11
    invoke-virtual {v0, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 12
    invoke-virtual {v0, v6, v8}, Ljava/util/Calendar;->add(II)V

    .line 13
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    goto :goto_1

    .line 14
    :cond_1
    :goto_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 15
    invoke-virtual {v0, v4, v5}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/16 v2, 0xc

    .line 16
    invoke-virtual {v0, v2, v8}, Ljava/util/Calendar;->add(II)V

    .line 17
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    :goto_1
    move-wide v6, v2

    .line 18
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v2, 0x0

    const/high16 v3, 0x4000000

    .line 19
    invoke-static {p0, v2, v0, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 20
    iget-object v4, v1, Landroidx/lifecycle/MethodCallsLogger;->mCalledMethods:Ljava/lang/Object;

    check-cast v4, Landroid/app/AlarmManager;

    invoke-virtual {v4, v0}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 21
    new-instance v0, Landroid/content/Intent;

    const-class v4, Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver;

    invoke-direct {v0, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 22
    invoke-static {p0, v2, v0, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v10

    const/4 v5, 0x1

    .line 23
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x18

    sget-object v0, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    .line 24
    invoke-virtual {p0, v2, v3, v0}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v8

    .line 25
    iget-object p0, v1, Landroidx/lifecycle/MethodCallsLogger;->mCalledMethods:Ljava/lang/Object;

    move-object v4, p0

    check-cast v4, Landroid/app/AlarmManager;

    invoke-virtual/range {v4 .. v10}, Landroid/app/AlarmManager;->setInexactRepeating(IJJLandroid/app/PendingIntent;)V

    return-void
.end method
