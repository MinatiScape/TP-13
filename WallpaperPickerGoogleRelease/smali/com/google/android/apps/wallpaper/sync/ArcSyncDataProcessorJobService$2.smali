.class public Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/model/WallpaperRotationInitializer$Listener;


# instance fields
.field public final synthetic this$0:Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;

.field public final synthetic val$appContext:Landroid/content/Context;

.field public final synthetic val$jobParams:Landroid/app/job/JobParameters;

.field public final synthetic val$parcelFd:Landroid/os/ParcelFileDescriptor;

.field public final synthetic val$rotationInitializer:Lcom/android/wallpaper/model/WallpaperRotationInitializer;

.field public final synthetic val$syncTimestamp:J


# direct methods
.method public constructor <init>(Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;Lcom/android/wallpaper/model/WallpaperRotationInitializer;Landroid/content/Context;JLandroid/app/job/JobParameters;Landroid/os/ParcelFileDescriptor;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$2;->this$0:Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$2;->val$rotationInitializer:Lcom/android/wallpaper/model/WallpaperRotationInitializer;

    iput-object p3, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$2;->val$appContext:Landroid/content/Context;

    iput-wide p4, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$2;->val$syncTimestamp:J

    iput-object p6, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$2;->val$jobParams:Landroid/app/job/JobParameters;

    iput-object p7, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$2;->val$parcelFd:Landroid/os/ParcelFileDescriptor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$2;->val$appContext:Landroid/content/Context;

    const-string v1, "ArcSyncDataProcessorJob"

    const-string v2, "Unable to initialize rotation"

    invoke-static {v1, v2, v0}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 2
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$2;->this$0:Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$2;->val$jobParams:Landroid/app/job/JobParameters;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$2;->val$parcelFd:Landroid/os/ParcelFileDescriptor;

    sget-object v2, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->sContentUriQueue:Ljava/util/Queue;

    .line 3
    invoke-virtual {v0, v1, p0}, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->doneProcessingCurrentSyncData(Landroid/app/job/JobParameters;Landroid/os/ParcelFileDescriptor;)V

    return-void
.end method

.method public onFirstWallpaperInRotationSet()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$2;->val$rotationInitializer:Lcom/android/wallpaper/model/WallpaperRotationInitializer;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$2;->val$appContext:Landroid/content/Context;

    invoke-interface {v0, v1}, Lcom/android/wallpaper/model/WallpaperRotationInitializer;->startRotation(Landroid/content/Context;)Z

    .line 2
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    .line 3
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$2;->val$appContext:Landroid/content/Context;

    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v0

    .line 4
    iget-wide v1, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$2;->val$syncTimestamp:J

    invoke-interface {v0, v1, v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLastSyncTimestamp(J)V

    .line 5
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$2;->this$0:Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$2;->val$jobParams:Landroid/app/job/JobParameters;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService$2;->val$parcelFd:Landroid/os/ParcelFileDescriptor;

    sget-object v2, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->sContentUriQueue:Ljava/util/Queue;

    .line 6
    invoke-virtual {v0, v1, p0}, Lcom/google/android/apps/wallpaper/sync/ArcSyncDataProcessorJobService;->doneProcessingCurrentSyncData(Landroid/app/job/JobParameters;Landroid/os/ParcelFileDescriptor;)V

    return-void
.end method
