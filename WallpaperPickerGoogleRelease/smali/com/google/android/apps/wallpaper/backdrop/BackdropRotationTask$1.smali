.class public Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;


# instance fields
.field public final synthetic val$appContext:Landroid/content/Context;

.field public final synthetic val$backdropPreferences:Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;

.field public final synthetic val$tag:Ljava/lang/String;

.field public final synthetic val$taskResultCallable:Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$TaskResultCallable;

.field public final synthetic val$taskResultFuture:Ljava/util/concurrent/FutureTask;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$TaskResultCallable;Ljava/util/concurrent/FutureTask;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$1;->val$appContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$1;->val$tag:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$1;->val$backdropPreferences:Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;

    iput-object p4, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$1;->val$taskResultCallable:Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$TaskResultCallable;

    iput-object p5, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$1;->val$taskResultFuture:Ljava/util/concurrent/FutureTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$1;->val$appContext:Landroid/content/Context;

    const-string v1, "BackdropRotationTask"

    const-string v2, "Fetching and setting the next wallpaper failed."

    invoke-static {v1, v2, v0}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 2
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$1;->val$appContext:Landroid/content/Context;

    .line 3
    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v0

    .line 4
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v1

    const/4 v3, 0x5

    .line 5
    invoke-interface {v0, v3, v1, v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->setDailyWallpaperRotationStatus(IJ)V

    .line 6
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$1;->val$taskResultCallable:Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$TaskResultCallable;

    const/4 v1, 0x1

    iput v1, v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$TaskResultCallable;->taskResult:I

    .line 7
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$1;->val$taskResultFuture:Ljava/util/concurrent/FutureTask;

    invoke-virtual {p0}, Ljava/util/concurrent/FutureTask;->run()V

    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .locals 4

    const-string v0, "Fetching and setting the next wallpaper succeeded with resumeToken: "

    .line 1
    invoke-static {v0, p1}, Landroidx/appcompat/view/SupportMenuInflater$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$1;->val$appContext:Landroid/content/Context;

    const-string v2, "BackdropRotationTask"

    invoke-static {v2, v0, v1}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 2
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$1;->val$tag:Ljava/lang/String;

    const-string v1, "backdrop_rotation_task_periodic"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$1;->val$appContext:Landroid/content/Context;

    const-string v1, "Snoozing the Backdrop alarm since this is a periodic task."

    invoke-static {v2, v1, v0}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 4
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$1;->val$appContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropAlarmScheduler;->snoozeAlarm(Landroid/content/Context;)V

    .line 5
    :cond_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 6
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$1;->val$appContext:Landroid/content/Context;

    invoke-interface {v1, v2}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v1

    .line 7
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    invoke-interface {v1, v2, v3}, Lcom/android/wallpaper/module/WallpaperPreferences;->addDailyRotation(J)V

    .line 8
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$1;->val$appContext:Landroid/content/Context;

    invoke-interface {v1, v2}, Lcom/android/wallpaper/module/Injector;->getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;

    move-result-object v1

    const/16 v2, 0xb

    .line 9
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v0

    invoke-interface {v1, v0}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyWallpaperRotationHour(I)V

    .line 10
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$1;->val$appContext:Landroid/content/Context;

    .line 11
    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v0

    .line 12
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v1

    const/4 v3, 0x3

    .line 13
    invoke-interface {v0, v3, v1, v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->setDailyWallpaperRotationStatus(IJ)V

    .line 14
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$1;->val$backdropPreferences:Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;

    invoke-virtual {v0, p1}, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->setResumeToken(Ljava/lang/String;)V

    .line 15
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$1;->val$taskResultCallable:Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$TaskResultCallable;

    const/4 v0, 0x0

    iput v0, p1, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$TaskResultCallable;->taskResult:I

    .line 16
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$1;->val$taskResultFuture:Ljava/util/concurrent/FutureTask;

    invoke-virtual {p0}, Ljava/util/concurrent/FutureTask;->run()V

    return-void
.end method
