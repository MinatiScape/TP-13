.class public Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;
.super Landroid/app/job/JobService;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x18
.end annotation


# static fields
.field public static final THREAD_TIMEOUT_MILLIS:J

.field public static final sContentUriQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


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

    sput-wide v0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->THREAD_TIMEOUT_MILLIS:J

    .line 3
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    sput-object v0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->sContentUriQueue:Ljava/util/Queue;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/app/job/JobService;-><init>()V

    .line 2
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->mLock:Ljava/lang/Object;

    .line 3
    new-instance v0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$1;

    invoke-direct {v0, p0}, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$1;-><init>(Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;)V

    iput-object v0, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->mThreadCleanupRunnable:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final doneProcessingCurrentSyncData(Landroid/app/job/JobParameters;Landroid/os/ParcelFileDescriptor;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/job/JobService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz p2, :cond_0

    .line 2
    :try_start_0
    invoke-virtual {p2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not close parcel fd: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v1, "ArcSyncDataProcessorJob"

    invoke-static {v1, p2, v0}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 4
    :cond_0
    :goto_0
    new-instance p2, Landroid/content/Intent;

    const-string v0, "org.chromium.arc.intent_helper.ACTION_SYNC_SYSTEM_APP_DATA_COMPLETED"

    invoke-direct {p2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 5
    sget-object v0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->sContentUriQueue:Ljava/util/Queue;

    move-object v1, v0

    check-cast v1, Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string v1, "org.chromium.arc.intent_helper"

    .line 6
    invoke-virtual {p2, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "org.chromium.arc.intent_helper.permission.SYNC_SYSTEM_APP_DATA"

    .line 7
    invoke-virtual {p0, p2, v1}, Landroid/app/job/JobService;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 8
    move-object p2, v0

    check-cast p2, Ljava/util/LinkedList;

    invoke-virtual {p2}, Ljava/util/LinkedList;->remove()Ljava/lang/Object;

    .line 9
    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_1

    const/4 p2, 0x0

    .line 10
    invoke-virtual {p0, p1, p2}, Landroid/app/job/JobService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    return-void

    .line 11
    :cond_1
    invoke-virtual {p0, p1}, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->processCurrentSyncData(Landroid/app/job/JobParameters;)V

    return-void
.end method

.method public onStartJob(Landroid/app/job/JobParameters;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->sContentUriQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Landroid/app/job/JobService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    return v0

    .line 3
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->processCurrentSyncData(Landroid/app/job/JobParameters;)V

    const/4 p0, 0x1

    return p0
.end method

.method public onStopJob(Landroid/app/job/JobParameters;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final processCurrentSyncData(Landroid/app/job/JobParameters;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/app/job/JobService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 3
    :try_start_0
    iget-object v2, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->mWorkerThread:Landroid/os/HandlerThread;

    const/4 v3, 0x0

    if-nez v2, :cond_0

    .line 4
    new-instance v2, Landroid/os/HandlerThread;

    const-string v4, "ArcSyncDataProcessorJobServiceThread"

    invoke-direct {v2, v4, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    iput-object v2, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->mWorkerThread:Landroid/os/HandlerThread;

    .line 5
    invoke-virtual {v2}, Landroid/os/HandlerThread;->start()V

    .line 6
    new-instance v2, Landroid/os/Handler;

    iget-object v4, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->mWorkerThread:Landroid/os/HandlerThread;

    invoke-virtual {v4}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-direct {v2, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v2, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->mHandler:Landroid/os/Handler;

    goto :goto_0

    .line 7
    :cond_0
    iget-object v2, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->mHandler:Landroid/os/Handler;

    iget-object v4, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->mThreadCleanupRunnable:Ljava/lang/Runnable;

    invoke-virtual {v2, v4}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 8
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->mThreadCleanupRunnable:Ljava/lang/Runnable;

    sget-wide v4, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->THREAD_TIMEOUT_MILLIS:J

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 10
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->mHandler:Landroid/os/Handler;

    .line 11
    iput-object v1, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->mHandler:Landroid/os/Handler;

    if-nez v1, :cond_1

    const-string v1, "ArcSyncDataProcessorJob"

    const-string v2, "Error fetching worker thread; won\'t sync."

    .line 12
    invoke-static {v1, v2, v0}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 13
    invoke-virtual {p0, p1, v3}, Landroid/app/job/JobService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    return-void

    .line 14
    :cond_1
    new-instance v2, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0, v0, p1}, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda1;-><init>(Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;Landroid/content/Context;Landroid/app/job/JobParameters;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :catchall_0
    move-exception p0

    .line 15
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public final setStreamAsWallpaper(Ljava/io/InputStream;)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/job/JobService;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 2
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    .line 3
    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/Injector;->getWallpaperManagerCompat(Landroid/content/Context;)Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 4
    :try_start_0
    invoke-virtual {v0, p1, v1, v2, v2}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->setStream(Ljava/io/InputStream;Landroid/graphics/Rect;ZI)I

    .line 5
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return v2

    :catch_0
    move-exception p1

    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Couldn\'t set wallpaper: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ArcSyncDataProcessorJob"

    invoke-static {v0, p1, p0}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    const/4 p0, 0x0

    return p0
.end method
