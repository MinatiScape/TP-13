.class public abstract Lcom/google/android/gms/gcm/GcmTaskService;
.super Landroid/app/Service;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/gcm/GcmTaskService$zzb;,
        Lcom/google/android/gms/gcm/GcmTaskService$zza;
    }
.end annotation


# instance fields
.field public final zza:Ljava/lang/Object;

.field public zzb:I

.field public zzc:Ljava/util/concurrent/ExecutorService;

.field public zzd:Landroid/os/Messenger;

.field public zze:Landroid/content/ComponentName;

.field public zzf:Landroidx/viewpager2/widget/FakeDrag;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 2
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/gcm/GcmTaskService;->zza:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1

    if-eqz p1, :cond_1

    .line 1
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "com.google.android.gms.gcm.ACTION_TASK_READY"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/gcm/GcmTaskService;->zzd:Landroid/os/Messenger;

    invoke-virtual {p0}, Landroid/os/Messenger;->getBinder()Landroid/os/IBinder;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public onCreate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 2
    invoke-static {p0}, Landroidx/viewpager2/widget/FakeDrag;->getInstance(Landroid/content/Context;)Landroidx/viewpager2/widget/FakeDrag;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/gcm/GcmTaskService;->zzf:Landroidx/viewpager2/widget/FakeDrag;

    .line 3
    new-instance v0, Lcom/google/android/gms/gcm/zzb;

    invoke-direct {v0}, Lcom/google/android/gms/gcm/zzb;-><init>()V

    const/4 v1, 0x2

    invoke-static {v1, v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    .line 4
    iput-object v0, p0, Lcom/google/android/gms/gcm/GcmTaskService;->zzc:Ljava/util/concurrent/ExecutorService;

    .line 5
    new-instance v0, Landroid/os/Messenger;

    new-instance v1, Lcom/google/android/gms/gcm/GcmTaskService$zza;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/google/android/gms/gcm/GcmTaskService$zza;-><init>(Lcom/google/android/gms/gcm/GcmTaskService;Landroid/os/Looper;)V

    invoke-direct {v0, v1}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/google/android/gms/gcm/GcmTaskService;->zzd:Landroid/os/Messenger;

    .line 6
    new-instance v0, Landroid/content/ComponentName;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/google/android/gms/gcm/GcmTaskService;->zze:Landroid/content/ComponentName;

    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 2
    iget-object p0, p0, Lcom/google/android/gms/gcm/GcmTaskService;->zzc:Ljava/util/concurrent/ExecutorService;

    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    move-result-object p0

    .line 3
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 4
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    const/16 v0, 0x4f

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v0, "Shutting down, but not all tasks are finished executing. Remaining: "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "GcmTaskService"

    .line 5
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 9

    const/4 p2, 0x2

    if-nez p1, :cond_0

    .line 1
    invoke-virtual {p0, p3}, Lcom/google/android/gms/gcm/GcmTaskService;->zza(I)V

    return p2

    .line 2
    :cond_0
    :try_start_0
    const-class v0, Lcom/google/android/gms/gcm/PendingCallback;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setExtrasClassLoader(Ljava/lang/ClassLoader;)V

    .line 3
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.google.android.gms.gcm.ACTION_TASK_READY"

    .line 4
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v2, "GcmTaskService"

    if-eqz v1, :cond_3

    :try_start_1
    const-string v0, "tag"

    .line 5
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v0, "callback"

    .line 6
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    const-string v1, "extras"

    .line 7
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v7

    const-string v1, "triggered_uris"

    .line 8
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v8

    .line 9
    instance-of p1, v0, Lcom/google/android/gms/gcm/PendingCallback;

    if-nez p1, :cond_1

    .line 10
    invoke-virtual {p0}, Landroid/app/Service;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x2f

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v0, v1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": Could not process request, invalid callback."

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 11
    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    invoke-virtual {p0, p3}, Lcom/google/android/gms/gcm/GcmTaskService;->zza(I)V

    return p2

    .line 13
    :cond_1
    :try_start_2
    invoke-virtual {p0, v5}, Lcom/google/android/gms/gcm/GcmTaskService;->zza(Ljava/lang/String;)Z

    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz p1, :cond_2

    .line 14
    invoke-virtual {p0, p3}, Lcom/google/android/gms/gcm/GcmTaskService;->zza(I)V

    return p2

    .line 15
    :cond_2
    :try_start_3
    check-cast v0, Lcom/google/android/gms/gcm/PendingCallback;

    .line 16
    iget-object v6, v0, Lcom/google/android/gms/gcm/PendingCallback;->zza:Landroid/os/IBinder;

    .line 17
    new-instance p1, Lcom/google/android/gms/gcm/GcmTaskService$zzb;

    move-object v3, p1

    move-object v4, p0

    invoke-direct/range {v3 .. v8}, Lcom/google/android/gms/gcm/GcmTaskService$zzb;-><init>(Lcom/google/android/gms/gcm/GcmTaskService;Ljava/lang/String;Landroid/os/IBinder;Landroid/os/Bundle;Ljava/util/List;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 18
    :try_start_4
    iget-object v0, p0, Lcom/google/android/gms/gcm/GcmTaskService;->zzc:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_4
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_5
    const-string v1, "Executor is shutdown. onDestroy was called but main looper had an unprocessed start task message. The task will be retried with backoff delay."

    .line 19
    invoke-static {v2, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 v0, 0x1

    .line 20
    invoke-virtual {p1, v0}, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zza(I)V

    goto :goto_0

    :cond_3
    const-string p1, "com.google.android.gms.gcm.SERVICE_ACTION_INITIALIZE"

    .line 21
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    .line 22
    :cond_4
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    add-int/lit8 p1, p1, 0x25

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string p1, "Unknown action received "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ", terminating"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 23
    :goto_0
    invoke-virtual {p0, p3}, Lcom/google/android/gms/gcm/GcmTaskService;->zza(I)V

    return p2

    :catchall_0
    move-exception p1

    .line 24
    invoke-virtual {p0, p3}, Lcom/google/android/gms/gcm/GcmTaskService;->zza(I)V

    throw p1
.end method

.method public final zza(I)V
    .locals 2

    .line 6
    iget-object v0, p0, Lcom/google/android/gms/gcm/GcmTaskService;->zza:Ljava/lang/Object;

    monitor-enter v0

    .line 7
    :try_start_0
    iput p1, p0, Lcom/google/android/gms/gcm/GcmTaskService;->zzb:I

    .line 8
    iget-object p1, p0, Lcom/google/android/gms/gcm/GcmTaskService;->zzf:Landroidx/viewpager2/widget/FakeDrag;

    iget-object v1, p0, Lcom/google/android/gms/gcm/GcmTaskService;->zze:Landroid/content/ComponentName;

    invoke-virtual {v1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroidx/viewpager2/widget/FakeDrag;->zzb(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 9
    iget p1, p0, Lcom/google/android/gms/gcm/GcmTaskService;->zzb:I

    invoke-virtual {p0, p1}, Landroid/app/Service;->stopSelf(I)V

    .line 10
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final zza(Ljava/lang/String;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/gcm/GcmTaskService;->zza:Ljava/lang/Object;

    monitor-enter v0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/gcm/GcmTaskService;->zzf:Landroidx/viewpager2/widget/FakeDrag;

    iget-object v2, p0, Lcom/google/android/gms/gcm/GcmTaskService;->zze:Landroid/content/ComponentName;

    invoke-virtual {v2}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Landroidx/viewpager2/widget/FakeDrag;->zza(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_0

    const-string v2, "GcmTaskService"

    .line 3
    invoke-virtual {p0}, Landroid/app/Service;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x2c

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " "

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ": Task already running, won\'t start another"

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 4
    :cond_0
    monitor-exit v0

    return v1

    :catchall_0
    move-exception p0

    .line 5
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
