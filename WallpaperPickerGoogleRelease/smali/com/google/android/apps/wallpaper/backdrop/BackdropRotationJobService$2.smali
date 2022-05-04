.class public Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;


# instance fields
.field public final synthetic this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService;

.field public final synthetic val$appContext:Landroid/content/Context;

.field public final synthetic val$backdropPreferences:Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;

.field public final synthetic val$params:Landroid/app/job/JobParameters;


# direct methods
.method public constructor <init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService;Landroid/app/job/JobParameters;Landroid/content/Context;Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$2;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$2;->val$params:Landroid/app/job/JobParameters;

    iput-object p3, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$2;->val$appContext:Landroid/content/Context;

    iput-object p4, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$2;->val$backdropPreferences:Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError()V
    .locals 4

    const-string v0, "BackdropRotationJob"

    const-string v1, "Updating the Backdrop wallpaper failed, rescheduling for later."

    .line 1
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$2;->val$appContext:Landroid/content/Context;

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
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$2;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$2;->val$params:Landroid/app/job/JobParameters;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Landroid/app/job/JobService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$2;->val$params:Landroid/app/job/JobParameters;

    invoke-virtual {v0}, Landroid/app/job/JobParameters;->getJobId()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const-string v0, "BackdropRotationJob"

    const-string v1, "Snoozing the Backdrop alarm since this is a periodic task."

    .line 2
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$2;->val$appContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropAlarmScheduler;->snoozeAlarm(Landroid/content/Context;)V

    .line 4
    :cond_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 5
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$2;->val$appContext:Landroid/content/Context;

    invoke-interface {v1, v2}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v1

    .line 6
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    invoke-interface {v1, v2, v3}, Lcom/android/wallpaper/module/WallpaperPreferences;->addDailyRotation(J)V

    .line 7
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$2;->val$appContext:Landroid/content/Context;

    .line 8
    invoke-interface {v1, v2}, Lcom/android/wallpaper/module/Injector;->getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;

    move-result-object v1

    const/16 v2, 0xb

    .line 9
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v0

    invoke-interface {v1, v0}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyWallpaperRotationHour(I)V

    .line 10
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$2;->val$backdropPreferences:Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;

    invoke-virtual {v0, p1}, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->setResumeToken(Ljava/lang/String;)V

    .line 11
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$2;->val$appContext:Landroid/content/Context;

    .line 12
    invoke-interface {p1, v0}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object p1

    .line 13
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    const/4 v2, 0x4

    .line 14
    invoke-interface {p1, v2, v0, v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->setDailyWallpaperRotationStatus(IJ)V

    .line 15
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$2;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$2;->val$params:Landroid/app/job/JobParameters;

    const/4 v0, 0x0

    invoke-virtual {p1, p0, v0}, Landroid/app/job/JobService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    return-void
.end method
