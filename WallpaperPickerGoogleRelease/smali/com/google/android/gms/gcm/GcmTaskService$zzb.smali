.class public final Lcom/google/android/gms/gcm/GcmTaskService$zzb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/gcm/GcmTaskService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "zzb"
.end annotation


# instance fields
.field public final zza:Ljava/lang/String;

.field public final zzc:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field public final zzd:Lcom/google/android/gms/gcm/INetworkTaskCallback;

.field public final zze:Landroid/os/Messenger;

.field public final synthetic zzf:Lcom/google/android/gms/gcm/GcmTaskService;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/gcm/GcmTaskService;Ljava/lang/String;Landroid/os/IBinder;Landroid/os/Bundle;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/os/IBinder;",
            "Landroid/os/Bundle;",
            "Ljava/util/List<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zzf:Lcom/google/android/gms/gcm/GcmTaskService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zza:Ljava/lang/String;

    .line 3
    sget p1, Lcom/google/android/gms/gcm/INetworkTaskCallback$Stub;->$r8$clinit:I

    const/4 p1, 0x0

    if-nez p3, :cond_0

    move-object p2, p1

    goto :goto_0

    :cond_0
    const-string p2, "com.google.android.gms.gcm.INetworkTaskCallback"

    .line 4
    invoke-interface {p3, p2}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object p2

    .line 5
    instance-of p4, p2, Lcom/google/android/gms/gcm/INetworkTaskCallback;

    if-eqz p4, :cond_1

    .line 6
    check-cast p2, Lcom/google/android/gms/gcm/INetworkTaskCallback;

    goto :goto_0

    .line 7
    :cond_1
    new-instance p2, Lcom/google/android/gms/gcm/INetworkTaskCallback$Stub$Proxy;

    invoke-direct {p2, p3}, Lcom/google/android/gms/gcm/INetworkTaskCallback$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    .line 8
    :goto_0
    iput-object p2, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zzd:Lcom/google/android/gms/gcm/INetworkTaskCallback;

    .line 9
    iput-object p5, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zzc:Ljava/util/List;

    .line 10
    iput-object p1, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zze:Landroid/os/Messenger;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/gcm/GcmTaskService;Ljava/lang/String;Landroid/os/Messenger;Landroid/os/Bundle;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/os/Messenger;",
            "Landroid/os/Bundle;",
            "Ljava/util/List<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    .line 11
    iput-object p1, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zzf:Lcom/google/android/gms/gcm/GcmTaskService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p2, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zza:Ljava/lang/String;

    .line 13
    iput-object p3, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zze:Landroid/os/Messenger;

    .line 14
    iput-object p5, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zzc:Ljava/util/List;

    const/4 p1, 0x0

    .line 15
    iput-object p1, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zzd:Lcom/google/android/gms/gcm/INetworkTaskCallback;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 11

    .line 1
    iget-object v4, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zza:Ljava/lang/String;

    .line 2
    iget-object v0, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zzf:Lcom/google/android/gms/gcm/GcmTaskService;

    move-object v1, v0

    check-cast v1, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask;

    .line 3
    invoke-virtual {v1}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    const-string v0, "BackdropRotationTask"

    .line 4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Task run with tag: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v7}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 5
    sget-object v0, Lcom/google/android/apps/wallpaper/backdrop/DefaultGcmNetworkManagerWrapper;->sInstanceLock:Ljava/lang/Object;

    monitor-enter v0

    .line 6
    :try_start_0
    sget-object v2, Lcom/google/android/apps/wallpaper/backdrop/DefaultGcmNetworkManagerWrapper;->sInstance:Lcom/google/android/apps/wallpaper/backdrop/DefaultGcmNetworkManagerWrapper;

    if-nez v2, :cond_0

    .line 7
    new-instance v2, Lcom/google/android/apps/wallpaper/backdrop/DefaultGcmNetworkManagerWrapper;

    invoke-virtual {v7}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/google/android/apps/wallpaper/backdrop/DefaultGcmNetworkManagerWrapper;-><init>(Landroid/content/Context;)V

    sput-object v2, Lcom/google/android/apps/wallpaper/backdrop/DefaultGcmNetworkManagerWrapper;->sInstance:Lcom/google/android/apps/wallpaper/backdrop/DefaultGcmNetworkManagerWrapper;

    .line 8
    :cond_0
    sget-object v3, Lcom/google/android/apps/wallpaper/backdrop/DefaultGcmNetworkManagerWrapper;->sInstance:Lcom/google/android/apps/wallpaper/backdrop/DefaultGcmNetworkManagerWrapper;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    new-instance v5, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$TaskResultCallable;

    const/4 v0, 0x0

    invoke-direct {v5, v0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$TaskResultCallable;-><init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$1;)V

    .line 10
    new-instance v8, Ljava/util/concurrent/FutureTask;

    invoke-direct {v8, v5}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 11
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    .line 12
    invoke-interface {v0, v7}, Lcom/android/wallpaper/module/Injector;->getWallpaperRefresher(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperRefresher;

    move-result-object v9

    .line 13
    new-instance v10, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$2;

    move-object v0, v10

    move-object v2, v7

    move-object v6, v8

    invoke-direct/range {v0 .. v6}, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$2;-><init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask;Landroid/content/Context;Lcom/google/android/apps/wallpaper/backdrop/DefaultGcmNetworkManagerWrapper;Ljava/lang/String;Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$TaskResultCallable;Ljava/util/concurrent/FutureTask;)V

    check-cast v9, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    invoke-virtual {v9, v10}, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;->refresh(Lcom/android/wallpaper/module/WallpaperRefresher$RefreshListener;)V

    const-wide/16 v0, 0x2

    const/4 v2, 0x1

    .line 14
    :try_start_1
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v8, v0, v1, v3}, Ljava/util/concurrent/FutureTask;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "BackdropRotationTask"

    .line 15
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Timed out updating wallpaper with max timeout of 2 minutes: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0, v7}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    goto :goto_0

    :catch_1
    move-exception v0

    const-string v1, "BackdropRotationTask"

    .line 16
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Execution error while updating wallpaper: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0, v7}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    goto :goto_0

    :catch_2
    move-exception v0

    const-string v1, "BackdropRotationTask"

    .line 17
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Interrupted while updating wallpaper: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0, v7}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 18
    :goto_0
    invoke-virtual {p0, v2}, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zza(I)V

    return-void

    :catchall_0
    move-exception p0

    .line 19
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0
.end method

.method public final zza(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zzf:Lcom/google/android/gms/gcm/GcmTaskService;

    .line 2
    iget-object v0, v0, Lcom/google/android/gms/gcm/GcmTaskService;->zza:Ljava/lang/Object;

    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zzf:Lcom/google/android/gms/gcm/GcmTaskService;

    .line 5
    iget-object v2, v1, Lcom/google/android/gms/gcm/GcmTaskService;->zzf:Landroidx/viewpager2/widget/FakeDrag;

    .line 6
    iget-object v3, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zza:Ljava/lang/String;

    .line 7
    iget-object v1, v1, Lcom/google/android/gms/gcm/GcmTaskService;->zze:Landroid/content/ComponentName;

    .line 8
    invoke-virtual {v1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v3, v1}, Landroidx/viewpager2/widget/FakeDrag;->zzc(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    .line 9
    :try_start_1
    iget-object p1, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zzf:Lcom/google/android/gms/gcm/GcmTaskService;

    .line 10
    iget-object v1, p1, Lcom/google/android/gms/gcm/GcmTaskService;->zzf:Landroidx/viewpager2/widget/FakeDrag;

    .line 11
    iget-object v2, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zza:Ljava/lang/String;

    .line 12
    iget-object p1, p1, Lcom/google/android/gms/gcm/GcmTaskService;->zze:Landroid/content/ComponentName;

    .line 13
    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, v2, p1}, Landroidx/viewpager2/widget/FakeDrag;->zzb(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    invoke-virtual {p0}, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zza()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zzf:Lcom/google/android/gms/gcm/GcmTaskService;

    .line 15
    iget-object v1, p1, Lcom/google/android/gms/gcm/GcmTaskService;->zzf:Landroidx/viewpager2/widget/FakeDrag;

    .line 16
    iget-object p1, p1, Lcom/google/android/gms/gcm/GcmTaskService;->zze:Landroid/content/ComponentName;

    .line 17
    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroidx/viewpager2/widget/FakeDrag;->zzb(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 18
    iget-object p0, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zzf:Lcom/google/android/gms/gcm/GcmTaskService;

    .line 19
    iget p1, p0, Lcom/google/android/gms/gcm/GcmTaskService;->zzb:I

    .line 20
    invoke-virtual {p0, p1}, Landroid/app/Service;->stopSelf(I)V

    :cond_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-void

    .line 21
    :cond_1
    :try_start_2
    invoke-virtual {p0}, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zza()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 22
    iget-object v1, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zze:Landroid/os/Messenger;

    .line 23
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v2

    const/4 v3, 0x3

    .line 24
    iput v3, v2, Landroid/os/Message;->what:I

    .line 25
    iput p1, v2, Landroid/os/Message;->arg1:I

    .line 26
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string v3, "component"

    .line 27
    iget-object v4, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zzf:Lcom/google/android/gms/gcm/GcmTaskService;

    .line 28
    iget-object v4, v4, Lcom/google/android/gms/gcm/GcmTaskService;->zze:Landroid/content/ComponentName;

    .line 29
    invoke-virtual {p1, v3, v4}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v3, "tag"

    .line 30
    iget-object v4, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zza:Ljava/lang/String;

    invoke-virtual {p1, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    invoke-virtual {v2, p1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 32
    invoke-virtual {v1, v2}, Landroid/os/Messenger;->send(Landroid/os/Message;)V

    goto :goto_0

    .line 33
    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zzd:Lcom/google/android/gms/gcm/INetworkTaskCallback;

    invoke-interface {v1, p1}, Lcom/google/android/gms/gcm/INetworkTaskCallback;->taskFinished(I)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    :goto_0
    :try_start_3
    iget-object p1, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zzf:Lcom/google/android/gms/gcm/GcmTaskService;

    .line 35
    iget-object v1, p1, Lcom/google/android/gms/gcm/GcmTaskService;->zzf:Landroidx/viewpager2/widget/FakeDrag;

    .line 36
    iget-object v2, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zza:Ljava/lang/String;

    .line 37
    iget-object p1, p1, Lcom/google/android/gms/gcm/GcmTaskService;->zze:Landroid/content/ComponentName;

    .line 38
    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, v2, p1}, Landroidx/viewpager2/widget/FakeDrag;->zzb(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    invoke-virtual {p0}, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zza()Z

    move-result p1

    if-nez p1, :cond_4

    iget-object p1, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zzf:Lcom/google/android/gms/gcm/GcmTaskService;

    .line 40
    iget-object v1, p1, Lcom/google/android/gms/gcm/GcmTaskService;->zzf:Landroidx/viewpager2/widget/FakeDrag;

    .line 41
    iget-object p1, p1, Lcom/google/android/gms/gcm/GcmTaskService;->zze:Landroid/content/ComponentName;

    .line 42
    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroidx/viewpager2/widget/FakeDrag;->zzb(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_4

    .line 43
    iget-object p0, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zzf:Lcom/google/android/gms/gcm/GcmTaskService;

    .line 44
    iget p1, p0, Lcom/google/android/gms/gcm/GcmTaskService;->zzb:I

    .line 45
    invoke-virtual {p0, p1}, Landroid/app/Service;->stopSelf(I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_3

    :catch_0
    :try_start_4
    const-string p1, "GcmTaskService"

    const-string v1, "Error reporting result of operation to scheduler for "

    .line 46
    iget-object v2, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zza:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_3
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object v1, v2

    :goto_1
    invoke-static {p1, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 47
    :try_start_5
    iget-object p1, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zzf:Lcom/google/android/gms/gcm/GcmTaskService;

    .line 48
    iget-object v1, p1, Lcom/google/android/gms/gcm/GcmTaskService;->zzf:Landroidx/viewpager2/widget/FakeDrag;

    .line 49
    iget-object v2, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zza:Ljava/lang/String;

    .line 50
    iget-object p1, p1, Lcom/google/android/gms/gcm/GcmTaskService;->zze:Landroid/content/ComponentName;

    .line 51
    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, v2, p1}, Landroidx/viewpager2/widget/FakeDrag;->zzb(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    invoke-virtual {p0}, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zza()Z

    move-result p1

    if-nez p1, :cond_4

    iget-object p1, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zzf:Lcom/google/android/gms/gcm/GcmTaskService;

    .line 53
    iget-object v1, p1, Lcom/google/android/gms/gcm/GcmTaskService;->zzf:Landroidx/viewpager2/widget/FakeDrag;

    .line 54
    iget-object p1, p1, Lcom/google/android/gms/gcm/GcmTaskService;->zze:Landroid/content/ComponentName;

    .line 55
    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroidx/viewpager2/widget/FakeDrag;->zzb(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_4

    .line 56
    iget-object p0, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zzf:Lcom/google/android/gms/gcm/GcmTaskService;

    .line 57
    iget p1, p0, Lcom/google/android/gms/gcm/GcmTaskService;->zzb:I

    .line 58
    invoke-virtual {p0, p1}, Landroid/app/Service;->stopSelf(I)V

    .line 59
    :cond_4
    :goto_2
    monitor-exit v0

    return-void

    .line 60
    :goto_3
    iget-object v1, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zzf:Lcom/google/android/gms/gcm/GcmTaskService;

    .line 61
    iget-object v2, v1, Lcom/google/android/gms/gcm/GcmTaskService;->zzf:Landroidx/viewpager2/widget/FakeDrag;

    .line 62
    iget-object v3, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zza:Ljava/lang/String;

    .line 63
    iget-object v1, v1, Lcom/google/android/gms/gcm/GcmTaskService;->zze:Landroid/content/ComponentName;

    .line 64
    invoke-virtual {v1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v3, v1}, Landroidx/viewpager2/widget/FakeDrag;->zzb(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    invoke-virtual {p0}, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zza()Z

    move-result v1

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zzf:Lcom/google/android/gms/gcm/GcmTaskService;

    .line 66
    iget-object v2, v1, Lcom/google/android/gms/gcm/GcmTaskService;->zzf:Landroidx/viewpager2/widget/FakeDrag;

    .line 67
    iget-object v1, v1, Lcom/google/android/gms/gcm/GcmTaskService;->zze:Landroid/content/ComponentName;

    .line 68
    invoke-virtual {v1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroidx/viewpager2/widget/FakeDrag;->zzb(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 69
    iget-object p0, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zzf:Lcom/google/android/gms/gcm/GcmTaskService;

    .line 70
    iget v1, p0, Lcom/google/android/gms/gcm/GcmTaskService;->zzb:I

    .line 71
    invoke-virtual {p0, v1}, Landroid/app/Service;->stopSelf(I)V

    :cond_5
    throw p1

    :catchall_1
    move-exception p0

    .line 72
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw p0
.end method

.method public final zza()Z
    .locals 0

    .line 73
    iget-object p0, p0, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zze:Landroid/os/Messenger;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
