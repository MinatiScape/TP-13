.class public final synthetic Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Lcom/android/wallpaper/module/WallpaperPersister;

.field public final synthetic f$2:Lcom/android/wallpaper/model/WallpaperInfo;

.field public final synthetic f$3:Lcom/android/wallpaper/asset/Asset;

.field public final synthetic f$4:I

.field public final synthetic f$5:Landroid/graphics/Rect;

.field public final synthetic f$6:F


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Lcom/android/wallpaper/module/WallpaperPersister;Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/asset/Asset;ILandroid/graphics/Rect;F)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda3;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda3;->f$1:Lcom/android/wallpaper/module/WallpaperPersister;

    iput-object p3, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda3;->f$2:Lcom/android/wallpaper/model/WallpaperInfo;

    iput-object p4, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda3;->f$3:Lcom/android/wallpaper/asset/Asset;

    iput p5, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda3;->f$4:I

    iput-object p6, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda3;->f$5:Landroid/graphics/Rect;

    iput p7, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda3;->f$6:F

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 13

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda3;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda3;->f$1:Lcom/android/wallpaper/module/WallpaperPersister;

    iget-object v3, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda3;->f$2:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v4, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda3;->f$3:Lcom/android/wallpaper/asset/Asset;

    iget v7, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda3;->f$4:I

    iget-object v5, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda3;->f$5:Landroid/graphics/Rect;

    iget v6, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda3;->f$6:F

    sget p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->$r8$clinit:I

    .line 1
    instance-of p0, v4, Lcom/android/wallpaper/asset/ContentUriAsset;

    if-eqz p0, :cond_0

    .line 2
    move-object p0, v4

    check-cast p0, Lcom/android/wallpaper/asset/ContentUriAsset;

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    .line 3
    :goto_0
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/4 v8, 0x1

    const/4 v9, 0x0

    if-eqz p0, :cond_1

    .line 4
    new-instance v10, Lcom/google/common/util/concurrent/SettableFuture;

    invoke-direct {v10}, Lcom/google/common/util/concurrent/SettableFuture;-><init>()V

    .line 5
    new-instance v11, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda1;

    invoke-direct {v11, v10, v2}, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda1;-><init>(Lcom/google/common/util/concurrent/SettableFuture;Ljava/io/OutputStream;)V

    .line 6
    new-instance v12, Lcom/android/wallpaper/asset/StreamableAsset$1;

    invoke-direct {v12, p0, v11}, Lcom/android/wallpaper/asset/StreamableAsset$1;-><init>(Lcom/android/wallpaper/asset/StreamableAsset;Lcom/android/wallpaper/asset/StreamableAsset$StreamReceiver;)V

    sget-object p0, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v11, v9, [Ljava/lang/Void;

    .line 7
    invoke-virtual {v12, p0, v11}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 8
    :try_start_0
    invoke-virtual {v10}, Lcom/google/common/util/concurrent/AbstractFuture$TrustedFuture;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    move p0, v8

    goto :goto_1

    :catch_0
    move-exception p0

    const-string v10, "MicropaperPreviewFragmentGoogle"

    const-string v11, "Failed to copy asset to local file"

    .line 9
    invoke-static {v10, v11, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move p0, v9

    :goto_1
    if-eqz p0, :cond_1

    goto :goto_2

    :cond_1
    move v8, v9

    .line 10
    :goto_2
    new-instance p0, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    invoke-direct {p0, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 11
    new-instance v9, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$1;

    invoke-direct {v9, v0, v8, v7, p0}, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$1;-><init>(Landroid/app/Activity;ZILjava/io/ByteArrayInputStream;)V

    move-object v2, v1

    check-cast v2, Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    move-object v8, v9

    invoke-virtual/range {v2 .. v8}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->setIndividualWallpaper(Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/asset/Asset;Landroid/graphics/Rect;FILcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V

    return-void
.end method
