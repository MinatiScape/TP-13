.class public Lcom/google/android/apps/wallpaper/sync/ArcRemoteDataSyncJobService;
.super Landroid/app/job/JobService;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x18
.end annotation


# static fields
.field public static final THREAD_TIMEOUT_MILLIS:J


# instance fields
.field public mHandler:Landroid/os/Handler;

.field public final mLock:Ljava/lang/Object;

.field public final mThreadCleanupRunnable:Ljava/lang/Runnable;

.field public mWorkerThread:Landroid/os/HandlerThread;


# direct methods
.method public static constructor <clinit>()V
    .locals 4

    .line 1
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x2

    .line 2
    invoke-virtual {v0, v2, v3, v1}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    sput-wide v0, Lcom/google/android/apps/wallpaper/sync/ArcRemoteDataSyncJobService;->THREAD_TIMEOUT_MILLIS:J

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/app/job/JobService;-><init>()V

    .line 2
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/apps/wallpaper/sync/ArcRemoteDataSyncJobService;->mLock:Ljava/lang/Object;

    .line 3
    new-instance v0, Lcom/google/android/apps/wallpaper/sync/ArcRemoteDataSyncJobService$1;

    invoke-direct {v0, p0}, Lcom/google/android/apps/wallpaper/sync/ArcRemoteDataSyncJobService$1;-><init>(Lcom/google/android/apps/wallpaper/sync/ArcRemoteDataSyncJobService;)V

    iput-object v0, p0, Lcom/google/android/apps/wallpaper/sync/ArcRemoteDataSyncJobService;->mThreadCleanupRunnable:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public onStartJob(Landroid/app/job/JobParameters;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/job/JobService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 2
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v1

    .line 3
    invoke-interface {v1, v0}, Lcom/android/wallpaper/module/Injector;->getFormFactorChecker(Landroid/content/Context;)Lcom/android/wallpaper/util/DownloadableUtils;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, v0}, Landroid/app/job/JobService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    return v0
.end method

.method public onStopJob(Landroid/app/job/JobParameters;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/job/JobService;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 2
    new-instance p1, Ljava/io/File;

    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    const-string v1, "temp_syncdata"

    invoke-direct {p1, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 4
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/SecurityException;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ArcRemoteDataSyncJob"

    invoke-static {v0, p1, p0}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    :goto_0
    const/4 p0, 0x1

    return p0
.end method
