.class public final Lcom/google/android/gms/common/internal/zzr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ServiceConnection;


# instance fields
.field public final zza:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroid/content/ServiceConnection;",
            ">;"
        }
    .end annotation
.end field

.field public zzb:I

.field public zzc:Z

.field public zzd:Landroid/os/IBinder;

.field public final zze:Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;

.field public zzf:Landroid/content/ComponentName;

.field public final synthetic zzg:Lcom/google/android/gms/common/internal/zzq;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/internal/zzq;Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/internal/zzr;->zzg:Lcom/google/android/gms/common/internal/zzq;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/google/android/gms/common/internal/zzr;->zze:Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;

    .line 3
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/common/internal/zzr;->zza:Ljava/util/Set;

    const/4 p1, 0x2

    .line 4
    iput p1, p0, Lcom/google/android/gms/common/internal/zzr;->zzb:I

    return-void
.end method


# virtual methods
.method public final onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzr;->zzg:Lcom/google/android/gms/common/internal/zzq;

    .line 2
    iget-object v0, v0, Lcom/google/android/gms/common/internal/zzq;->zza:Ljava/util/HashMap;

    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzr;->zzg:Lcom/google/android/gms/common/internal/zzq;

    .line 5
    iget-object v1, v1, Lcom/google/android/gms/common/internal/zzq;->zzc:Landroid/os/Handler;

    .line 6
    iget-object v2, p0, Lcom/google/android/gms/common/internal/zzr;->zze:Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;

    const/4 v3, 0x1

    invoke-virtual {v1, v3, v2}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    .line 7
    iput-object p2, p0, Lcom/google/android/gms/common/internal/zzr;->zzd:Landroid/os/IBinder;

    .line 8
    iput-object p1, p0, Lcom/google/android/gms/common/internal/zzr;->zzf:Landroid/content/ComponentName;

    .line 9
    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzr;->zza:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/ServiceConnection;

    .line 10
    invoke-interface {v2, p1, p2}, Landroid/content/ServiceConnection;->onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V

    goto :goto_0

    .line 11
    :cond_0
    iput v3, p0, Lcom/google/android/gms/common/internal/zzr;->zzb:I

    .line 12
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzr;->zzg:Lcom/google/android/gms/common/internal/zzq;

    .line 2
    iget-object v0, v0, Lcom/google/android/gms/common/internal/zzq;->zza:Ljava/util/HashMap;

    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzr;->zzg:Lcom/google/android/gms/common/internal/zzq;

    .line 5
    iget-object v1, v1, Lcom/google/android/gms/common/internal/zzq;->zzc:Landroid/os/Handler;

    const/4 v2, 0x1

    .line 6
    iget-object v3, p0, Lcom/google/android/gms/common/internal/zzr;->zze:Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;

    invoke-virtual {v1, v2, v3}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    const/4 v1, 0x0

    .line 7
    iput-object v1, p0, Lcom/google/android/gms/common/internal/zzr;->zzd:Landroid/os/IBinder;

    .line 8
    iput-object p1, p0, Lcom/google/android/gms/common/internal/zzr;->zzf:Landroid/content/ComponentName;

    .line 9
    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzr;->zza:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/ServiceConnection;

    .line 10
    invoke-interface {v2, p1}, Landroid/content/ServiceConnection;->onServiceDisconnected(Landroid/content/ComponentName;)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x2

    .line 11
    iput p1, p0, Lcom/google/android/gms/common/internal/zzr;->zzb:I

    .line 12
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final zza(Ljava/lang/String;)V
    .locals 6

    const/4 p1, 0x3

    .line 1
    iput p1, p0, Lcom/google/android/gms/common/internal/zzr;->zzb:I

    .line 2
    iget-object p1, p0, Lcom/google/android/gms/common/internal/zzr;->zzg:Lcom/google/android/gms/common/internal/zzq;

    .line 3
    iget-object v0, p1, Lcom/google/android/gms/common/internal/zzq;->zzd:Lcom/google/android/gms/common/stats/zza;

    .line 4
    iget-object p1, p1, Lcom/google/android/gms/common/internal/zzq;->zzb:Landroid/content/Context;

    .line 5
    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzr;->zze:Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;

    .line 6
    invoke-virtual {v1}, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;->getStartServiceIntent()Landroid/content/Intent;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/common/internal/zzr;->zze:Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;

    .line 7
    iget v2, v2, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;->zzd:I

    .line 8
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    invoke-virtual {v1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v0, :cond_0

    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const-string v5, "com.google.android.gms"

    .line 11
    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    :try_start_0
    invoke-static {p1}, Lcom/google/android/gms/internal/zzbmk;->zza(Landroid/content/Context;)Lcom/google/android/gms/internal/zzbmj;

    move-result-object v5

    .line 13
    iget-object v5, v5, Lcom/google/android/gms/internal/zzbmj;->zza:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    invoke-virtual {v5, v0, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 14
    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    const/high16 v5, 0x200000

    and-int/2addr v0, v5

    if-eqz v0, :cond_1

    move v0, v4

    goto :goto_1

    :catch_0
    :cond_1
    :goto_0
    move v0, v3

    :goto_1
    if-eqz v0, :cond_2

    const-string p1, "ConnectionTracker"

    const-string v0, "Attempted to bind to a service in a STOPPED package."

    .line 15
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 16
    :cond_2
    invoke-virtual {p1, v1, p0, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v3

    .line 17
    :goto_2
    iput-boolean v3, p0, Lcom/google/android/gms/common/internal/zzr;->zzc:Z

    if-eqz v3, :cond_3

    .line 18
    iget-object p1, p0, Lcom/google/android/gms/common/internal/zzr;->zzg:Lcom/google/android/gms/common/internal/zzq;

    .line 19
    iget-object p1, p1, Lcom/google/android/gms/common/internal/zzq;->zzc:Landroid/os/Handler;

    .line 20
    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzr;->zze:Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;

    invoke-virtual {p1, v4, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    .line 21
    iget-object p0, p0, Lcom/google/android/gms/common/internal/zzr;->zzg:Lcom/google/android/gms/common/internal/zzq;

    .line 22
    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzq;->zzc:Landroid/os/Handler;

    .line 23
    iget-wide v1, p0, Lcom/google/android/gms/common/internal/zzq;->zzf:J

    .line 24
    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    return-void

    :cond_3
    const/4 p1, 0x2

    .line 25
    iput p1, p0, Lcom/google/android/gms/common/internal/zzr;->zzb:I

    .line 26
    :try_start_1
    iget-object p1, p0, Lcom/google/android/gms/common/internal/zzr;->zzg:Lcom/google/android/gms/common/internal/zzq;

    .line 27
    iget-object v0, p1, Lcom/google/android/gms/common/internal/zzq;->zzd:Lcom/google/android/gms/common/stats/zza;

    .line 28
    iget-object p1, p1, Lcom/google/android/gms/common/internal/zzq;->zzb:Landroid/content/Context;

    .line 29
    invoke-virtual {p1, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    return-void
.end method
