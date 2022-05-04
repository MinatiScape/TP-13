.class public Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;


# direct methods
.method public constructor <init>(Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$1;->this$0:Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$1;->this$0:Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;

    .line 2
    iget-object v0, v0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->mWorkerThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_1

    .line 3
    invoke-virtual {v0}, Landroid/os/HandlerThread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 4
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$1;->this$0:Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;

    .line 5
    iget-object v0, v0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->mWorkerThread:Landroid/os/HandlerThread;

    .line 6
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    move-result v0

    if-nez v0, :cond_0

    .line 7
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$1;->this$0:Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;

    invoke-virtual {v0}, Landroid/app/job/JobService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "ArcSyncDataProcessorJob"

    const-string v2, "Unable to quit worker thread"

    invoke-static {v1, v2, v0}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$1;->this$0:Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;

    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->mWorkerThread:Landroid/os/HandlerThread;

    .line 10
    iput-object v0, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->mHandler:Landroid/os/Handler;

    :cond_1
    return-void
.end method
