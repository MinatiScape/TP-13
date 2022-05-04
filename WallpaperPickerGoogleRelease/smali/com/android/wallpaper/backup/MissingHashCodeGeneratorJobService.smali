.class public Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService;
.super Landroid/app/job/JobService;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ServiceCast"
    }
.end annotation


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public mWorkerThread:Ljava/lang/Thread;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/app/job/JobService;-><init>()V

    return-void
.end method


# virtual methods
.method public getWorkerThread()Ljava/lang/Thread;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService;->mWorkerThread:Ljava/lang/Thread;

    return-object p0
.end method

.method public onStartJob(Landroid/app/job/JobParameters;)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/app/job/JobService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "wallpaper"

    .line 2
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/WallpaperManager;

    .line 3
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService$1;

    invoke-direct {v3, p0, v0, v1, p1}, Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService$1;-><init>(Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService;Landroid/content/Context;Landroid/app/WallpaperManager;Landroid/app/job/JobParameters;)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v2, p0, Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService;->mWorkerThread:Ljava/lang/Thread;

    .line 4
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    const/4 p0, 0x1

    return p0
.end method

.method public onStopJob(Landroid/app/job/JobParameters;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
