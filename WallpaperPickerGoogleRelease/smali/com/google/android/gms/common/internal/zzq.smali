.class public final Lcom/google/android/gms/common/internal/zzq;
.super Lcom/google/android/gms/common/internal/GmsClientSupervisor;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# instance fields
.field public final zza:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;",
            "Lcom/google/android/gms/common/internal/zzr;",
            ">;"
        }
    .end annotation
.end field

.field public final zzb:Landroid/content/Context;

.field public final zzc:Landroid/os/Handler;

.field public final zzd:Lcom/google/android/gms/common/stats/zza;

.field public final zze:J

.field public final zzf:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/common/internal/GmsClientSupervisor;-><init>()V

    .line 2
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/zzq;->zza:Ljava/util/HashMap;

    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/common/internal/zzq;->zzb:Landroid/content/Context;

    .line 4
    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-direct {v0, p1, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/zzq;->zzc:Landroid/os/Handler;

    .line 5
    sget-object p1, Lcom/google/android/gms/common/stats/zza;->zzb:Lcom/google/android/gms/common/stats/zza;

    if-nez p1, :cond_1

    .line 6
    sget-object p1, Lcom/google/android/gms/common/stats/zza;->zza:Ljava/lang/Object;

    monitor-enter p1

    .line 7
    :try_start_0
    sget-object v0, Lcom/google/android/gms/common/stats/zza;->zzb:Lcom/google/android/gms/common/stats/zza;

    if-nez v0, :cond_0

    .line 8
    new-instance v0, Lcom/google/android/gms/common/stats/zza;

    invoke-direct {v0}, Lcom/google/android/gms/common/stats/zza;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/stats/zza;->zzb:Lcom/google/android/gms/common/stats/zza;

    .line 9
    :cond_0
    monitor-exit p1

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 10
    :cond_1
    :goto_0
    sget-object p1, Lcom/google/android/gms/common/stats/zza;->zzb:Lcom/google/android/gms/common/stats/zza;

    .line 11
    iput-object p1, p0, Lcom/google/android/gms/common/internal/zzq;->zzd:Lcom/google/android/gms/common/stats/zza;

    const-wide/16 v0, 0x1388

    .line 12
    iput-wide v0, p0, Lcom/google/android/gms/common/internal/zzq;->zze:J

    const-wide/32 v0, 0x493e0

    .line 13
    iput-wide v0, p0, Lcom/google/android/gms/common/internal/zzq;->zzf:J

    return-void
.end method


# virtual methods
.method public final bindService(Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;Landroid/content/ServiceConnection;Ljava/lang/String;)Z
    .locals 3

    const-string v0, "ServiceConnection must not be null"

    .line 1
    invoke-static {p2, v0}, Landroidx/preference/R$string;->zza(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzq;->zza:Ljava/util/HashMap;

    monitor-enter v0

    .line 3
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzq;->zza:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/common/internal/zzr;

    if-nez v1, :cond_0

    .line 4
    new-instance v1, Lcom/google/android/gms/common/internal/zzr;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/common/internal/zzr;-><init>(Lcom/google/android/gms/common/internal/zzq;Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;)V

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;->getStartServiceIntent()Landroid/content/Intent;

    .line 6
    iget-object v2, v1, Lcom/google/android/gms/common/internal/zzr;->zza:Ljava/util/Set;

    invoke-interface {v2, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 7
    invoke-virtual {v1, p3}, Lcom/google/android/gms/common/internal/zzr;->zza(Ljava/lang/String;)V

    .line 8
    iget-object p0, p0, Lcom/google/android/gms/common/internal/zzq;->zza:Ljava/util/HashMap;

    invoke-virtual {p0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/common/internal/zzq;->zzc:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {p0, v2, p1}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    .line 10
    iget-object p0, v1, Lcom/google/android/gms/common/internal/zzr;->zza:Ljava/util/Set;

    invoke-interface {p0, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    .line 11
    iget-object p0, v1, Lcom/google/android/gms/common/internal/zzr;->zzg:Lcom/google/android/gms/common/internal/zzq;

    .line 12
    iget-object p0, p0, Lcom/google/android/gms/common/internal/zzq;->zzd:Lcom/google/android/gms/common/stats/zza;

    .line 13
    iget-object p0, v1, Lcom/google/android/gms/common/internal/zzr;->zze:Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;

    .line 14
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;->getStartServiceIntent()Landroid/content/Intent;

    .line 15
    iget-object p0, v1, Lcom/google/android/gms/common/internal/zzr;->zza:Ljava/util/Set;

    invoke-interface {p0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 16
    iget p0, v1, Lcom/google/android/gms/common/internal/zzr;->zzb:I

    const/4 p1, 0x1

    if-eq p0, p1, :cond_2

    const/4 p1, 0x2

    if-eq p0, p1, :cond_1

    goto :goto_0

    .line 17
    :cond_1
    invoke-virtual {v1, p3}, Lcom/google/android/gms/common/internal/zzr;->zza(Ljava/lang/String;)V

    goto :goto_0

    .line 18
    :cond_2
    iget-object p0, v1, Lcom/google/android/gms/common/internal/zzr;->zzf:Landroid/content/ComponentName;

    .line 19
    iget-object p1, v1, Lcom/google/android/gms/common/internal/zzr;->zzd:Landroid/os/IBinder;

    .line 20
    invoke-interface {p2, p0, p1}, Landroid/content/ServiceConnection;->onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V

    .line 21
    :goto_0
    iget-boolean p0, v1, Lcom/google/android/gms/common/internal/zzr;->zzc:Z

    .line 22
    monitor-exit v0

    return p0

    .line 23
    :cond_3
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    add-int/lit8 p2, p2, 0x51

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3, p2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string p2, "Trying to bind a GmsServiceConnection that was already connected before.  config="

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :catchall_0
    move-exception p0

    .line 24
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final handleMessage(Landroid/os/Message;)Z
    .locals 6

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_4

    if-eq v0, v2, :cond_0

    return v1

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzq;->zza:Ljava/util/HashMap;

    monitor-enter v0

    .line 3
    :try_start_0
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;

    .line 4
    iget-object p0, p0, Lcom/google/android/gms/common/internal/zzq;->zza:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/common/internal/zzr;

    if-eqz p0, :cond_3

    .line 5
    iget v1, p0, Lcom/google/android/gms/common/internal/zzr;->zzb:I

    const/4 v3, 0x3

    if-ne v1, v3, :cond_3

    const-string v1, "GmsClientSupervisor"

    .line 6
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x2f

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v4, "Timeout waiting for ServiceConnection callback "

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/Exception;

    invoke-direct {v4}, Ljava/lang/Exception;-><init>()V

    invoke-static {v1, v3, v4}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 7
    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzr;->zzf:Landroid/content/ComponentName;

    if-nez v1, :cond_1

    .line 8
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x0

    :cond_1
    if-nez v1, :cond_2

    .line 9
    new-instance v1, Landroid/content/ComponentName;

    .line 10
    iget-object p1, p1, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;->zzb:Ljava/lang/String;

    const-string v3, "unknown"

    .line 11
    invoke-direct {v1, p1, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    :cond_2
    invoke-virtual {p0, v1}, Lcom/google/android/gms/common/internal/zzr;->onServiceDisconnected(Landroid/content/ComponentName;)V

    .line 13
    :cond_3
    monitor-exit v0

    return v2

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 14
    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzq;->zza:Ljava/util/HashMap;

    monitor-enter v0

    .line 15
    :try_start_1
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;

    .line 16
    iget-object v3, p0, Lcom/google/android/gms/common/internal/zzq;->zza:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/common/internal/zzr;

    if-eqz v3, :cond_6

    .line 17
    iget-object v4, v3, Lcom/google/android/gms/common/internal/zzr;->zza:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 18
    iget-boolean v4, v3, Lcom/google/android/gms/common/internal/zzr;->zzc:Z

    if-eqz v4, :cond_5

    .line 19
    iget-object v4, v3, Lcom/google/android/gms/common/internal/zzr;->zzg:Lcom/google/android/gms/common/internal/zzq;

    .line 20
    iget-object v4, v4, Lcom/google/android/gms/common/internal/zzq;->zzc:Landroid/os/Handler;

    .line 21
    iget-object v5, v3, Lcom/google/android/gms/common/internal/zzr;->zze:Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;

    invoke-virtual {v4, v2, v5}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    .line 22
    iget-object v4, v3, Lcom/google/android/gms/common/internal/zzr;->zzg:Lcom/google/android/gms/common/internal/zzq;

    .line 23
    iget-object v5, v4, Lcom/google/android/gms/common/internal/zzq;->zzd:Lcom/google/android/gms/common/stats/zza;

    .line 24
    iget-object v4, v4, Lcom/google/android/gms/common/internal/zzq;->zzb:Landroid/content/Context;

    .line 25
    invoke-virtual {v4, v3}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 26
    iput-boolean v1, v3, Lcom/google/android/gms/common/internal/zzr;->zzc:Z

    const/4 v1, 0x2

    .line 27
    iput v1, v3, Lcom/google/android/gms/common/internal/zzr;->zzb:I

    .line 28
    :cond_5
    iget-object p0, p0, Lcom/google/android/gms/common/internal/zzq;->zza:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    :cond_6
    monitor-exit v0

    return v2

    :catchall_1
    move-exception p0

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw p0
.end method

.method public final unbindService(Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;Landroid/content/ServiceConnection;Ljava/lang/String;)V
    .locals 2

    const-string p3, "ServiceConnection must not be null"

    .line 1
    invoke-static {p2, p3}, Landroidx/preference/R$string;->zza(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    iget-object p3, p0, Lcom/google/android/gms/common/internal/zzq;->zza:Ljava/util/HashMap;

    monitor-enter p3

    .line 3
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzq;->zza:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/internal/zzr;

    if-eqz v0, :cond_2

    .line 4
    iget-object v1, v0, Lcom/google/android/gms/common/internal/zzr;->zza:Ljava/util/Set;

    invoke-interface {v1, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 5
    iget-object v1, v0, Lcom/google/android/gms/common/internal/zzr;->zzg:Lcom/google/android/gms/common/internal/zzq;

    .line 6
    iget-object v1, v1, Lcom/google/android/gms/common/internal/zzq;->zzd:Lcom/google/android/gms/common/stats/zza;

    .line 7
    iget-object v1, v0, Lcom/google/android/gms/common/internal/zzr;->zza:Ljava/util/Set;

    invoke-interface {v1, p2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 8
    iget-object p2, v0, Lcom/google/android/gms/common/internal/zzr;->zza:Ljava/util/Set;

    invoke-interface {p2}, Ljava/util/Set;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 9
    iget-object p2, p0, Lcom/google/android/gms/common/internal/zzq;->zzc:Landroid/os/Handler;

    const/4 v0, 0x0

    invoke-virtual {p2, v0, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    .line 10
    iget-object p2, p0, Lcom/google/android/gms/common/internal/zzq;->zzc:Landroid/os/Handler;

    iget-wide v0, p0, Lcom/google/android/gms/common/internal/zzq;->zze:J

    invoke-virtual {p2, p1, v0, v1}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 11
    :cond_0
    monitor-exit p3

    return-void

    .line 12
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    add-int/lit8 p2, p2, 0x4c

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string p2, "Trying to unbind a GmsServiceConnection  that was not bound before.  config="

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 13
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    add-int/lit8 p2, p2, 0x32

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string p2, "Nonexistent connection status for service config: "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :catchall_0
    move-exception p0

    .line 14
    monitor-exit p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
