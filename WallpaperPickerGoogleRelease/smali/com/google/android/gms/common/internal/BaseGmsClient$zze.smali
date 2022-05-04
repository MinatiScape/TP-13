.class public final Lcom/google/android/gms/common/internal/BaseGmsClient$zze;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/BaseGmsClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "zze"
.end annotation


# instance fields
.field public final zza:I

.field public final synthetic zzb:Lcom/google/android/gms/common/internal/BaseGmsClient;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/internal/BaseGmsClient;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;->zzb:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;->zza:I

    return-void
.end method


# virtual methods
.method public final onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 4

    const/4 p1, 0x0

    if-nez p2, :cond_2

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;->zzb:Lcom/google/android/gms/common/internal/BaseGmsClient;

    .line 2
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzm:Ljava/lang/Object;

    monitor-enter v0

    .line 3
    :try_start_0
    iget p2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzs:I

    const/4 v1, 0x3

    const/4 v2, 0x1

    if-ne p2, v1, :cond_0

    move p1, v2

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_1

    const/4 p1, 0x5

    .line 4
    iput-boolean v2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzy:Z

    goto :goto_0

    :cond_1
    const/4 p1, 0x4

    .line 5
    :goto_0
    iget-object p2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza:Landroid/os/Handler;

    iget-object p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mDisconnectCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p0

    const/16 v0, 0x10

    invoke-virtual {p2, p1, p0, v0}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void

    :catchall_0
    move-exception p0

    .line 6
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    .line 7
    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;->zzb:Lcom/google/android/gms/common/internal/BaseGmsClient;

    .line 8
    iget-object v0, v0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzn:Ljava/lang/Object;

    .line 9
    monitor-enter v0

    .line 10
    :try_start_2
    iget-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;->zzb:Lcom/google/android/gms/common/internal/BaseGmsClient;

    const-string v2, "com.google.android.gms.common.internal.IGmsServiceBroker"

    .line 11
    invoke-interface {p2, v2}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 12
    instance-of v3, v2, Lcom/google/android/gms/common/internal/IGmsServiceBroker;

    if-eqz v3, :cond_3

    .line 13
    check-cast v2, Lcom/google/android/gms/common/internal/IGmsServiceBroker;

    goto :goto_1

    .line 14
    :cond_3
    new-instance v2, Lcom/google/android/gms/common/internal/zzad;

    invoke-direct {v2, p2}, Lcom/google/android/gms/common/internal/zzad;-><init>(Landroid/os/IBinder;)V

    .line 15
    :goto_1
    iput-object v2, v1, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzo:Lcom/google/android/gms/common/internal/IGmsServiceBroker;

    .line 16
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 17
    iget-object p2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;->zzb:Lcom/google/android/gms/common/internal/BaseGmsClient;

    iget p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;->zza:I

    .line 18
    iget-object v0, p2, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/common/internal/BaseGmsClient$zzh;

    invoke-direct {v1, p2, p1}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzh;-><init>(Lcom/google/android/gms/common/internal/BaseGmsClient;I)V

    const/4 p1, 0x7

    const/4 p2, -0x1

    .line 19
    invoke-virtual {v0, p1, p0, p2, v1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void

    :catchall_1
    move-exception p0

    .line 21
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p0
.end method

.method public final onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;->zzb:Lcom/google/android/gms/common/internal/BaseGmsClient;

    .line 2
    iget-object p1, p1, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzn:Ljava/lang/Object;

    .line 3
    monitor-enter p1

    .line 4
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;->zzb:Lcom/google/android/gms/common/internal/BaseGmsClient;

    const/4 v1, 0x0

    .line 5
    iput-object v1, v0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzo:Lcom/google/android/gms/common/internal/IGmsServiceBroker;

    .line 6
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    iget-object p1, v0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza:Landroid/os/Handler;

    const/4 v0, 0x6

    iget p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;->zza:I

    const/4 v1, 0x1

    .line 8
    invoke-virtual {p1, v0, p0, v1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void

    :catchall_0
    move-exception p0

    .line 10
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method
