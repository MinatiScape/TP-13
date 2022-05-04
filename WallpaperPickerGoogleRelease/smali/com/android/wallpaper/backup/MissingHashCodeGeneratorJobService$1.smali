.class public Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService;->onStartJob(Landroid/app/job/JobParameters;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService;

.field public final synthetic val$context:Landroid/content/Context;

.field public final synthetic val$jobParameters:Landroid/app/job/JobParameters;

.field public final synthetic val$wallpaperManager:Landroid/app/WallpaperManager;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService;Landroid/content/Context;Landroid/app/WallpaperManager;Landroid/app/job/JobParameters;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService$1;->this$0:Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService;

    iput-object p2, p0, Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService$1;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService$1;->val$wallpaperManager:Landroid/app/WallpaperManager;

    iput-object p4, p0, Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService$1;->val$jobParameters:Landroid/app/job/JobParameters;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    const-string v0, "IO exception when closing input stream for lock screen wallpaper."

    .line 1
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v1

    .line 2
    iget-object v2, p0, Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService$1;->val$context:Landroid/content/Context;

    invoke-interface {v1, v2}, Lcom/android/wallpaper/module/Injector;->getWallpaperManagerCompat(Landroid/content/Context;)Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    move-result-object v2

    .line 3
    iget-object v3, p0, Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService$1;->val$context:Landroid/content/Context;

    invoke-interface {v1, v3}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v1

    .line 4
    iget-object v3, p0, Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService$1;->val$wallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {v3}, Landroid/app/WallpaperManager;->getWallpaperInfo()Landroid/app/WallpaperInfo;

    move-result-object v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_0

    move v3, v4

    goto :goto_0

    :cond_0
    move v3, v5

    :goto_0
    const-wide/16 v6, 0x0

    const-string v8, "MissingHashCodeGenerato"

    if-nez v3, :cond_2

    .line 5
    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperHashCode()J

    move-result-wide v9

    cmp-long v3, v9, v6

    if-nez v3, :cond_2

    .line 6
    iget-object v3, p0, Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService$1;->val$wallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {v3}, Landroid/app/WallpaperManager;->forgetLoadedWallpaper()V

    .line 7
    invoke-virtual {v2}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    if-nez v3, :cond_1

    .line 8
    iget-object v0, p0, Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService$1;->val$context:Landroid/content/Context;

    const-string v1, "WallpaperManager#getDrawable returned null and there\'s no live wallpaper set"

    invoke-static {v8, v1, v0}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 9
    iget-object v0, p0, Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService$1;->this$0:Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService;

    iget-object p0, p0, Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService$1;->val$jobParameters:Landroid/app/job/JobParameters;

    invoke-virtual {v0, p0, v5}, Landroid/app/job/JobService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    return-void

    .line 10
    :cond_1
    check-cast v3, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    .line 11
    invoke-static {v3}, Landroidx/cardview/R$color;->generateHashCode(Landroid/graphics/Bitmap;)J

    move-result-wide v9

    .line 12
    invoke-interface {v1, v9, v10}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperHashCode(J)V

    .line 13
    :cond_2
    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getLockWallpaperHashCode()J

    move-result-wide v9

    cmp-long v3, v9, v6

    if-nez v3, :cond_8

    const/4 v3, 0x2

    .line 14
    invoke-virtual {v2, v3}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->getWallpaperFile(I)Landroid/os/ParcelFileDescriptor;

    move-result-object v2

    if-eqz v2, :cond_3

    goto :goto_1

    :cond_3
    move v4, v5

    :goto_1
    const/4 v3, 0x0

    if-nez v4, :cond_4

    .line 15
    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperHashCode()J

    move-result-wide v6

    .line 16
    invoke-interface {v1, v6, v7}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLockWallpaperHashCode(J)V

    .line 17
    iget-object v0, p0, Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService$1;->this$0:Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService;

    .line 18
    iput-object v3, v0, Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService;->mWorkerThread:Ljava/lang/Thread;

    .line 19
    iget-object p0, p0, Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService$1;->val$jobParameters:Landroid/app/job/JobParameters;

    invoke-virtual {v0, p0, v5}, Landroid/app/job/JobService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    return-void

    .line 20
    :cond_4
    :try_start_0
    new-instance v4, Ljava/io/FileInputStream;

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    :try_start_1
    invoke-static {v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v6
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 22
    :try_start_2
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 23
    :goto_2
    :try_start_3
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_5

    :catch_0
    move-exception v2

    goto :goto_4

    :catch_1
    move-exception v2

    goto :goto_3

    :catch_2
    move-exception v2

    move-object v6, v3

    goto :goto_3

    :catchall_0
    move-exception p0

    goto :goto_6

    :catch_3
    move-exception v2

    move-object v4, v3

    move-object v6, v4

    :goto_3
    :try_start_4
    const-string v7, "IO exception when closing the file descriptor."

    .line 24
    invoke-static {v8, v7, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v4, :cond_5

    goto :goto_2

    .line 25
    :goto_4
    invoke-static {v8, v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_5
    :goto_5
    if-eqz v6, :cond_6

    .line 26
    invoke-static {v6}, Landroidx/cardview/R$color;->generateHashCode(Landroid/graphics/Bitmap;)J

    move-result-wide v6

    invoke-interface {v1, v6, v7}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLockWallpaperHashCode(J)V

    .line 27
    :cond_6
    iget-object v0, p0, Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService$1;->this$0:Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService;

    .line 28
    iput-object v3, v0, Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService;->mWorkerThread:Ljava/lang/Thread;

    .line 29
    iget-object p0, p0, Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService$1;->val$jobParameters:Landroid/app/job/JobParameters;

    invoke-virtual {v0, p0, v5}, Landroid/app/job/JobService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    goto :goto_8

    :catchall_1
    move-exception p0

    move-object v3, v4

    :goto_6
    if-eqz v3, :cond_7

    .line 30
    :try_start_5
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_7

    :catch_4
    move-exception v1

    .line 31
    invoke-static {v8, v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 32
    :cond_7
    :goto_7
    throw p0

    :cond_8
    :goto_8
    return-void
.end method
