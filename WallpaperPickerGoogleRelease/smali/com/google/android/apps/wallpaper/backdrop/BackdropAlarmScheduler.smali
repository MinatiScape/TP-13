.class public Lcom/google/android/apps/wallpaper/backdrop/BackdropAlarmScheduler;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static createBackdropAlarmReceiverPendingIntent(Landroid/content/Context;)Landroid/app/PendingIntent;
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/google/android/apps/wallpaper/backdrop/BackdropAlarmReceiver;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v1, 0x0

    const/high16 v2, 0x4000000

    .line 2
    invoke-static {p0, v1, v0, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    return-object p0
.end method

.method public static setOvernightAlarm(Landroid/content/Context;)V
    .locals 14

    .line 1
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/Injector;->getAlarmManagerWrapper(Landroid/content/Context;)Landroidx/lifecycle/MethodCallsLogger;

    move-result-object v0

    .line 2
    invoke-static {p0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropAlarmScheduler;->createBackdropAlarmReceiverPendingIntent(Landroid/content/Context;)Landroid/app/PendingIntent;

    move-result-object v7

    .line 3
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 4
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    .line 5
    invoke-virtual {v2, v1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    const/4 v3, 0x5

    const/4 v4, 0x1

    .line 6
    invoke-virtual {v2, v3, v4}, Ljava/util/Calendar;->add(II)V

    const/16 v5, 0x9

    const/4 v6, 0x0

    .line 7
    invoke-virtual {v2, v5, v6}, Ljava/util/Calendar;->set(II)V

    const/16 v8, 0xa

    const/4 v9, 0x2

    .line 8
    invoke-virtual {v2, v8, v9}, Ljava/util/Calendar;->set(II)V

    const/16 v9, 0xc

    .line 9
    invoke-virtual {v2, v9, v6}, Ljava/util/Calendar;->set(II)V

    .line 10
    invoke-virtual {v2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v10

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v12

    sub-long/2addr v10, v12

    .line 11
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    .line 12
    invoke-virtual {v2, v1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 13
    invoke-virtual {v2, v3, v4}, Ljava/util/Calendar;->add(II)V

    .line 14
    invoke-virtual {v2, v5, v6}, Ljava/util/Calendar;->set(II)V

    const/4 v12, 0x3

    .line 15
    invoke-virtual {v2, v8, v12}, Ljava/util/Calendar;->set(II)V

    const/16 v12, 0x1e

    .line 16
    invoke-virtual {v2, v9, v12}, Ljava/util/Calendar;->set(II)V

    .line 17
    invoke-virtual {v2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v12

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    sub-long/2addr v12, v1

    .line 18
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v1

    sub-long/2addr v12, v10

    long-to-double v12, v12

    mul-double/2addr v1, v12

    double-to-long v1, v1

    add-long/2addr v10, v1

    .line 19
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 20
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    .line 21
    invoke-virtual {v2, v1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 22
    invoke-virtual {v2, v3, v4}, Ljava/util/Calendar;->add(II)V

    .line 23
    invoke-virtual {v2, v5, v6}, Ljava/util/Calendar;->set(II)V

    .line 24
    invoke-virtual {v2, v8, v3}, Ljava/util/Calendar;->set(II)V

    .line 25
    invoke-virtual {v2, v9, v6}, Ljava/util/Calendar;->set(II)V

    .line 26
    invoke-virtual {v2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    sub-long/2addr v2, v4

    sub-long v5, v2, v10

    .line 27
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Setting a new alarm to run "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, "ms from now"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "BackdropAlarmScheduler"

    invoke-static {v2, v1, p0}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 28
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    add-long v3, v1, v10

    .line 29
    iget-object p0, v0, Landroidx/lifecycle/MethodCallsLogger;->mCalledMethods:Ljava/lang/Object;

    move-object v1, p0

    check-cast v1, Landroid/app/AlarmManager;

    const/4 v2, 0x2

    invoke-virtual/range {v1 .. v7}, Landroid/app/AlarmManager;->setWindow(IJJLandroid/app/PendingIntent;)V

    return-void
.end method

.method public static snoozeAlarm(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/Injector;->getAlarmManagerWrapper(Landroid/content/Context;)Landroidx/lifecycle/MethodCallsLogger;

    move-result-object v0

    .line 2
    invoke-static {p0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropAlarmScheduler;->createBackdropAlarmReceiverPendingIntent(Landroid/content/Context;)Landroid/app/PendingIntent;

    move-result-object v1

    .line 3
    iget-object v0, v0, Landroidx/lifecycle/MethodCallsLogger;->mCalledMethods:Ljava/lang/Object;

    check-cast v0, Landroid/app/AlarmManager;

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 4
    invoke-static {p0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropAlarmScheduler;->setOvernightAlarm(Landroid/content/Context;)V

    return-void
.end method
