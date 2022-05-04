.class public Lcom/google/android/apps/wallpaper/backdrop/JobSchedulerBackdropTaskScheduler;
.super Lcom/google/android/apps/wallpaper/backdrop/BackdropTaskScheduler;
.source "SourceFile"


# static fields
.field public static final ONE_DAY_IN_MILLIS:J

.field public static final ONE_HOUR_IN_MILLIS:J


# instance fields
.field public mAppContext:Landroid/content/Context;

.field public mJobScheduler:Landroid/app/job/JobScheduler;


# direct methods
.method public static constructor <clinit>()V
    .locals 6

    .line 1
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x1

    invoke-virtual {v0, v2, v3, v1}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v4

    sput-wide v4, Lcom/google/android/apps/wallpaper/backdrop/JobSchedulerBackdropTaskScheduler;->ONE_DAY_IN_MILLIS:J

    .line 2
    sget-object v1, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v1}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    sput-wide v0, Lcom/google/android/apps/wallpaper/backdrop/JobSchedulerBackdropTaskScheduler;->ONE_HOUR_IN_MILLIS:J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropTaskScheduler;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/JobSchedulerBackdropTaskScheduler;->mAppContext:Landroid/content/Context;

    const-string v0, "jobscheduler"

    .line 3
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/job/JobScheduler;

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/JobSchedulerBackdropTaskScheduler;->mJobScheduler:Landroid/app/job/JobScheduler;

    return-void
.end method

.method public static mapNetworkPreferenceToRequiredNetworkType(I)I
    .locals 3

    const/4 v0, 0x1

    if-eqz p0, :cond_1

    if-eq p0, v0, :cond_0

    .line 1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported network preference value: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "JSTaskScheduler"

    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_0
    const/4 p0, 0x2

    return p0

    :cond_1
    return v0
.end method


# virtual methods
.method public scheduleOneOffTask(II)V
    .locals 7

    .line 1
    new-instance v0, Landroid/app/job/JobInfo$Builder;

    new-instance v1, Landroid/content/ComponentName;

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/backdrop/JobSchedulerBackdropTaskScheduler;->mAppContext:Landroid/content/Context;

    const-class v3, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService;

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v2, 0x0

    invoke-direct {v0, v2, v1}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long v2, p2

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    .line 2
    invoke-virtual {v1, v2, v3, v4}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Landroid/app/job/JobInfo$Builder;->setMinimumLatency(J)Landroid/app/job/JobInfo$Builder;

    move-result-object v0

    const/4 v2, 0x1

    add-int/2addr p2, v2

    int-to-long v5, p2

    .line 3
    invoke-virtual {v1, v5, v6, v4}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Landroid/app/job/JobInfo$Builder;->setOverrideDeadline(J)Landroid/app/job/JobInfo$Builder;

    move-result-object p2

    .line 4
    invoke-virtual {p2, v2}, Landroid/app/job/JobInfo$Builder;->setPersisted(Z)Landroid/app/job/JobInfo$Builder;

    move-result-object p2

    .line 5
    invoke-static {p1}, Lcom/google/android/apps/wallpaper/backdrop/JobSchedulerBackdropTaskScheduler;->mapNetworkPreferenceToRequiredNetworkType(I)I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    move-result-object p1

    .line 6
    invoke-virtual {p1}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object p1

    .line 7
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/JobSchedulerBackdropTaskScheduler;->mJobScheduler:Landroid/app/job/JobScheduler;

    invoke-virtual {p0, p1}, Landroid/app/job/JobScheduler;->schedule(Landroid/app/job/JobInfo;)I

    move-result p0

    if-nez p0, :cond_0

    .line 8
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Unable to schedule JobScheduler one-off job: "

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "JSTaskScheduler"

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method
