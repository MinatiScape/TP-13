.class public Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/WallpaperRefresher$RefreshListener;


# instance fields
.field public final synthetic val$appContext:Landroid/content/Context;

.field public final synthetic val$injector:Lcom/android/wallpaper/module/Injector;

.field public final synthetic val$wakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver;Landroid/os/PowerManager$WakeLock;Lcom/android/wallpaper/module/Injector;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver$1;->val$wakeLock:Landroid/os/PowerManager$WakeLock;

    iput-object p3, p0, Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver$1;->val$injector:Lcom/android/wallpaper/module/Injector;

    iput-object p4, p0, Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver$1;->val$appContext:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRefreshed(Lcom/android/wallpaper/model/WallpaperMetadata;Lcom/android/wallpaper/model/WallpaperMetadata;I)V
    .locals 6

    const/4 p1, 0x2

    if-eq p3, p1, :cond_0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver$1;->val$wakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-static {p0}, Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver;->access$000(Landroid/os/PowerManager$WakeLock;)V

    return-void

    .line 2
    :cond_0
    iget-object p1, p0, Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver$1;->val$injector:Lcom/android/wallpaper/module/Injector;

    iget-object p2, p0, Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver$1;->val$appContext:Landroid/content/Context;

    invoke-interface {p1, p2}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object p1

    .line 3
    invoke-interface {p1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getDailyWallpaperEnabledTimestamp()J

    move-result-wide p2

    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-gez v0, :cond_1

    const-string p1, "DailyLoggingAlarm"

    const-string p2, "There\'s no valid daily wallpaper enabled timestamp"

    .line 4
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver$1;->val$wakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-static {p0}, Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver;->access$000(Landroid/os/PowerManager$WakeLock;)V

    return-void

    .line 6
    :cond_1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    const/4 v1, -0x1

    const/4 v2, 0x5

    .line 7
    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->add(II)V

    const/16 v1, 0xb

    const/4 v3, 0x0

    .line 8
    invoke-virtual {v0, v1, v3}, Ljava/util/Calendar;->set(II)V

    const/16 v1, 0xc

    .line 9
    invoke-virtual {v0, v1, v3}, Ljava/util/Calendar;->set(II)V

    .line 10
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v4

    cmp-long p2, p2, v4

    if-lez p2, :cond_2

    .line 11
    iget-object p0, p0, Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver$1;->val$wakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-static {p0}, Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver;->access$000(Landroid/os/PowerManager$WakeLock;)V

    return-void

    .line 12
    :cond_2
    :try_start_0
    invoke-interface {p1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getDailyWallpaperLastRotationStatusTimestamp()J

    move-result-wide p2

    .line 13
    iget-object v1, p0, Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver$1;->val$injector:Lcom/android/wallpaper/module/Injector;

    iget-object v4, p0, Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver$1;->val$appContext:Landroid/content/Context;

    invoke-interface {v1, v4}, Lcom/android/wallpaper/module/Injector;->getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;

    move-result-object v1

    .line 14
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v4

    cmp-long p2, p2, v4

    if-lez p2, :cond_4

    .line 15
    invoke-interface {p1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getDailyWallpaperLastRotationStatus()I

    move-result p2

    .line 16
    invoke-interface {v1, p2}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyWallpaperRotationStatus(I)V

    if-ne v2, p2, :cond_3

    .line 17
    invoke-interface {p1}, Lcom/android/wallpaper/module/WallpaperPreferences;->incrementNumDaysDailyRotationFailed()V

    .line 18
    invoke-interface {p1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getNumDaysDailyRotationFailed()I

    move-result p2

    invoke-interface {v1, p2}, Lcom/android/wallpaper/module/UserEventLogger;->logNumDaysDailyRotationFailed(I)V

    goto :goto_0

    .line 19
    :cond_3
    invoke-interface {p1}, Lcom/android/wallpaper/module/WallpaperPreferences;->resetNumDaysDailyRotationFailed()V

    .line 20
    :goto_0
    invoke-interface {p1}, Lcom/android/wallpaper/module/WallpaperPreferences;->resetNumDaysDailyRotationNotAttempted()V

    goto :goto_1

    .line 21
    :cond_4
    invoke-interface {v1, v3}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyWallpaperRotationStatus(I)V

    .line 22
    invoke-interface {p1}, Lcom/android/wallpaper/module/WallpaperPreferences;->incrementNumDaysDailyRotationNotAttempted()V

    .line 23
    invoke-interface {p1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getNumDaysDailyRotationNotAttempted()I

    move-result p2

    .line 24
    invoke-interface {v1, p2}, Lcom/android/wallpaper/module/UserEventLogger;->logNumDaysDailyRotationNotAttempted(I)V

    .line 25
    invoke-interface {p1}, Lcom/android/wallpaper/module/WallpaperPreferences;->resetNumDaysDailyRotationFailed()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    :goto_1
    iget-object p0, p0, Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver$1;->val$wakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-static {p0}, Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver;->access$000(Landroid/os/PowerManager$WakeLock;)V

    return-void

    :catchall_0
    move-exception p1

    iget-object p0, p0, Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver$1;->val$wakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-static {p0}, Lcom/android/wallpaper/module/DailyLoggingAlarmReceiver;->access$000(Landroid/os/PowerManager$WakeLock;)V

    .line 27
    throw p1
.end method
