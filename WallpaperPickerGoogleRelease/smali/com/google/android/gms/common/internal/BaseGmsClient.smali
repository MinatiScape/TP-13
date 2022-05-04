.class public abstract Lcom/google/android/gms/common/internal/BaseGmsClient;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/internal/BaseGmsClient$zzd;,
        Lcom/google/android/gms/common/internal/BaseGmsClient$zza;,
        Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;,
        Lcom/google/android/gms/common/internal/BaseGmsClient$zzh;,
        Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;,
        Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;,
        Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;,
        Lcom/google/android/gms/common/internal/BaseGmsClient$SignOutCallbacks;,
        Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;,
        Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;,
        Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;,
        Lcom/google/android/gms/common/internal/BaseGmsClient$zze;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Landroid/os/IInterface;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public mConnectionProgressReportCallbacks:Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;

.field public mDisconnectCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final zza:Landroid/os/Handler;

.field public zzc:I

.field public zzd:J

.field public zze:J

.field public zzf:I

.field public zzg:J

.field public zzh:Lcom/google/android/gms/common/internal/zzu;

.field public final zzi:Landroid/content/Context;

.field public final zzk:Lcom/google/android/gms/common/internal/GmsClientSupervisor;

.field public final zzm:Ljava/lang/Object;

.field public final zzn:Ljava/lang/Object;

.field public zzo:Lcom/google/android/gms/common/internal/IGmsServiceBroker;

.field public zzp:Landroid/os/IInterface;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public final zzq:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/android/gms/common/internal/BaseGmsClient$zzc<",
            "*>;>;"
        }
    .end annotation
.end field

.field public zzr:Lcom/google/android/gms/common/internal/BaseGmsClient$zze;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/internal/BaseGmsClient$zze;"
        }
    .end annotation
.end field

.field public zzs:I

.field public final zzt:Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;

.field public final zzu:Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;

.field public final zzv:I

.field public final zzw:Ljava/lang/String;

.field public zzx:Lcom/google/android/gms/common/ConnectionResult;

.field public zzy:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/GmsClientSupervisor;Lcom/google/android/gms/common/GoogleApiAvailabilityLight;ILcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzm:Ljava/lang/Object;

    .line 3
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzn:Ljava/lang/Object;

    .line 4
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzq:Ljava/util/ArrayList;

    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzs:I

    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzx:Lcom/google/android/gms/common/ConnectionResult;

    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzy:Z

    .line 8
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mDisconnectCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const-string v0, "Context must not be null"

    .line 9
    invoke-static {p1, v0}, Landroidx/preference/R$string;->zza(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzi:Landroid/content/Context;

    const-string p1, "Looper must not be null"

    .line 10
    invoke-static {p2, p1}, Landroidx/preference/R$string;->zza(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "Supervisor must not be null"

    .line 11
    invoke-static {p3, p1}, Landroidx/preference/R$string;->zza(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p3, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzk:Lcom/google/android/gms/common/internal/GmsClientSupervisor;

    const-string p1, "API availability must not be null"

    .line 12
    invoke-static {p4, p1}, Landroidx/preference/R$string;->zza(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    new-instance p1, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;

    invoke-direct {p1, p0, p2}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;-><init>(Lcom/google/android/gms/common/internal/BaseGmsClient;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza:Landroid/os/Handler;

    .line 14
    iput p5, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzv:I

    .line 15
    iput-object p6, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzt:Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;

    .line 16
    iput-object p7, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzu:Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;

    .line 17
    iput-object p8, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzw:Ljava/lang/String;

    return-void
.end method

.method public static zza(Lcom/google/android/gms/common/internal/BaseGmsClient;IILandroid/os/IInterface;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzm:Ljava/lang/Object;

    monitor-enter v0

    .line 2
    :try_start_0
    iget v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzs:I

    if-eq v1, p1, :cond_0

    const/4 p0, 0x0

    .line 3
    monitor-exit v0

    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p0, p2, p3}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzb(ILandroid/os/IInterface;)V

    const/4 p0, 0x1

    .line 5
    monitor-exit v0

    :goto_0
    return p0

    :catchall_0
    move-exception p0

    .line 6
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method


# virtual methods
.method public connect(Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;)V
    .locals 1

    const-string v0, "Connection progress callbacks cannot be null."

    .line 1
    invoke-static {p1, v0}, Landroidx/preference/R$string;->zza(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p1, Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;

    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mConnectionProgressReportCallbacks:Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;

    const/4 p1, 0x2

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzb(ILandroid/os/IInterface;)V

    return-void
.end method

.method public disconnect()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mDisconnectCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 2
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzq:Ljava/util/ArrayList;

    monitor-enter v0

    .line 3
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzq:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    const/4 v3, 0x0

    if-ge v2, v1, :cond_0

    .line 4
    iget-object v4, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzq:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;

    .line 5
    monitor-enter v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 6
    :try_start_1
    iput-object v3, v4, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zza:Ljava/lang/Object;

    .line 7
    monitor-exit v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw p0

    .line 8
    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzq:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 9
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 10
    iget-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzn:Ljava/lang/Object;

    monitor-enter v1

    .line 11
    :try_start_3
    iput-object v3, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzo:Lcom/google/android/gms/common/internal/IGmsServiceBroker;

    .line 12
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    const/4 v0, 0x1

    .line 13
    invoke-virtual {p0, v0, v3}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzb(ILandroid/os/IInterface;)V

    return-void

    :catchall_1
    move-exception p0

    .line 14
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw p0

    :catchall_2
    move-exception p0

    .line 15
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw p0
.end method

.method public getRemoteService(Lcom/google/android/gms/common/internal/IAccountAccessor;Ljava/util/Set;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/internal/IAccountAccessor;",
            "Ljava/util/Set<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzb()Landroid/os/Bundle;

    move-result-object v0

    .line 2
    new-instance v1, Lcom/google/android/gms/common/internal/GetServiceRequest;

    iget v2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzv:I

    invoke-direct {v1, v2}, Lcom/google/android/gms/common/internal/GetServiceRequest;-><init>(I)V

    iget-object v2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzi:Landroid/content/Context;

    .line 3
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 4
    iput-object v2, v1, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzd:Ljava/lang/String;

    .line 5
    iput-object v0, v1, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzg:Landroid/os/Bundle;

    if-eqz p2, :cond_0

    .line 6
    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result v0

    new-array v0, v0, [Lcom/google/android/gms/common/api/Scope;

    invoke-interface {p2, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Lcom/google/android/gms/common/api/Scope;

    iput-object p2, v1, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzf:[Lcom/google/android/gms/common/api/Scope;

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->requiresSignIn()Z

    move-result p2

    if-eqz p2, :cond_2

    .line 8
    move-object p2, p0

    check-cast p2, Lcom/google/android/gms/common/internal/zzl;

    .line 9
    iget-object p2, p2, Lcom/google/android/gms/common/internal/zzl;->zze:Landroid/accounts/Account;

    if-eqz p2, :cond_1

    goto :goto_0

    .line 10
    :cond_1
    new-instance p2, Landroid/accounts/Account;

    const-string v0, "<<default account>>"

    const-string v2, "com.google"

    invoke-direct {p2, v0, v2}, Landroid/accounts/Account;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    :goto_0
    iput-object p2, v1, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzh:Landroid/accounts/Account;

    if-eqz p1, :cond_2

    .line 12
    invoke-interface {p1}, Landroid/os/IInterface;->asBinder()Landroid/os/IBinder;

    move-result-object p1

    iput-object p1, v1, Lcom/google/android/gms/common/internal/GetServiceRequest;->zze:Landroid/os/IBinder;

    :cond_2
    const/4 p1, 0x0

    new-array p1, p1, [Lcom/google/android/gms/common/Feature;

    .line 13
    iput-object p1, v1, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzi:[Lcom/google/android/gms/common/Feature;

    const/4 p1, 0x1

    .line 14
    :try_start_0
    iget-object p2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzn:Ljava/lang/Object;

    monitor-enter p2
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzo:Lcom/google/android/gms/common/internal/IGmsServiceBroker;

    if-eqz v0, :cond_3

    .line 16
    new-instance v2, Lcom/google/android/gms/common/internal/BaseGmsClient$zzd;

    iget-object v3, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mDisconnectCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    invoke-direct {v2, p0, v3}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzd;-><init>(Lcom/google/android/gms/common/internal/BaseGmsClient;I)V

    invoke-interface {v0, v2, v1}, Lcom/google/android/gms/common/internal/IGmsServiceBroker;->getService(Lcom/google/android/gms/common/internal/IGmsCallbacks;Lcom/google/android/gms/common/internal/GetServiceRequest;)V

    goto :goto_1

    :cond_3
    const-string v0, "GmsClient"

    const-string v1, "mServiceBroker is null, client disconnected"

    .line 17
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    :goto_1
    monitor-exit p2

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v0
    :try_end_2
    .catch Landroid/os/DeadObjectException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception p2

    const-string v0, "GmsClient"

    const-string v1, "IGmsServiceBroker.getService failed"

    .line 19
    invoke-static {v0, v1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/16 p2, 0x8

    .line 20
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mDisconnectCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 21
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    .line 22
    iget-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;

    const/4 v3, 0x0

    invoke-direct {v2, p0, p2, v3, v3}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;-><init>(Lcom/google/android/gms/common/internal/BaseGmsClient;ILandroid/os/IBinder;Landroid/os/Bundle;)V

    const/4 p0, -0x1

    .line 23
    invoke-virtual {v1, p1, v0, p0, v2}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object p0

    .line 24
    invoke-virtual {v1, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void

    :catch_1
    move-exception p0

    .line 25
    throw p0

    :catch_2
    move-exception p2

    const-string v0, "GmsClient"

    const-string v1, "IGmsServiceBroker.getService failed"

    .line 26
    invoke-static {v0, v1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 27
    iget-object p2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza:Landroid/os/Handler;

    iget-object p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mDisconnectCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 28
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p0

    const/4 v0, 0x6

    .line 29
    invoke-virtual {p2, v0, p0, p1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p0

    .line 30
    invoke-virtual {p2, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public abstract getServiceDescriptor()Ljava/lang/String;
.end method

.method public abstract getStartServiceAction()Ljava/lang/String;
.end method

.method public isConnected()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzm:Ljava/lang/Object;

    monitor-enter v0

    .line 2
    :try_start_0
    iget p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzs:I

    const/4 v1, 0x4

    if-ne p0, v1, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    .line 3
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public isConnecting()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzm:Ljava/lang/Object;

    monitor-enter v0

    .line 2
    :try_start_0
    iget p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzs:I

    const/4 v1, 0x2

    if-eq p0, v1, :cond_1

    const/4 v1, 0x3

    if-ne p0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    .line 3
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 2

    .line 1
    iget p1, p1, Lcom/google/android/gms/common/ConnectionResult;->zzc:I

    .line 2
    iput p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzf:I

    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzg:J

    return-void
.end method

.method public onUserSignOut(Lcom/google/android/gms/common/internal/BaseGmsClient$SignOutCallbacks;)V
    .locals 1

    .line 1
    check-cast p1, Lcom/google/android/gms/common/api/internal/zzbt;

    .line 2
    iget-object p0, p1, Lcom/google/android/gms/common/api/internal/zzbt;->zza:Lcom/google/android/gms/common/api/internal/zzbp;

    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 3
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 4
    new-instance v0, Lcom/google/android/gms/common/api/internal/zzbu;

    invoke-direct {v0, p1}, Lcom/google/android/gms/common/api/internal/zzbu;-><init>(Lcom/google/android/gms/common/api/internal/zzbt;)V

    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public requiresGooglePlayServices()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public requiresSignIn()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public abstract zza(Landroid/os/IBinder;)Landroid/os/IInterface;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/IBinder;",
            ")TT;"
        }
    .end annotation
.end method

.method public final zzab()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzh:Lcom/google/android/gms/common/internal/zzu;

    if-eqz p0, :cond_0

    .line 2
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "com.google.android.gms"

    return-object p0

    .line 3
    :cond_0
    new-instance p0, Ljava/lang/RuntimeException;

    const-string v0, "Failed to connect when checking package"

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final zzag()Landroid/os/IInterface;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/DeadObjectException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzm:Ljava/lang/Object;

    monitor-enter v0

    .line 2
    :try_start_0
    iget v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzs:I

    const/4 v2, 0x5

    if-eq v1, v2, :cond_2

    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 4
    iget-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzp:Landroid/os/IInterface;

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const-string v2, "Client is connected but service is null"

    invoke-static {v1, v2}, Landroidx/preference/R$string;->zza(ZLjava/lang/Object;)V

    .line 5
    iget-object p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzp:Landroid/os/IInterface;

    monitor-exit v0

    return-object p0

    .line 6
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v1, "Not connected. Call connect() and wait for onConnected() to be called."

    invoke-direct {p0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 7
    :cond_2
    new-instance p0, Landroid/os/DeadObjectException;

    invoke-direct {p0}, Landroid/os/DeadObjectException;-><init>()V

    throw p0

    :catchall_0
    move-exception p0

    .line 8
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public zzb()Landroid/os/Bundle;
    .locals 0

    .line 45
    new-instance p0, Landroid/os/Bundle;

    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    return-object p0
.end method

.method public final zzb(ILandroid/os/IInterface;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    const/4 v0, 0x4

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne p1, v0, :cond_0

    move v3, v1

    goto :goto_0

    :cond_0
    move v3, v2

    :goto_0
    if-eqz p2, :cond_1

    move v4, v1

    goto :goto_1

    :cond_1
    move v4, v2

    :goto_1
    if-ne v3, v4, :cond_2

    move v3, v1

    goto :goto_2

    :cond_2
    move v3, v2

    .line 1
    :goto_2
    invoke-static {v3}, Landroidx/preference/R$string;->zzb(Z)V

    .line 2
    iget-object v3, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzm:Ljava/lang/Object;

    monitor-enter v3

    .line 3
    :try_start_0
    iput p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzs:I

    .line 4
    iput-object p2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzp:Landroid/os/IInterface;

    const/16 p2, 0x81

    if-eq p1, v1, :cond_6

    const/4 v1, 0x2

    const/4 v4, 0x3

    if-eq p1, v1, :cond_4

    if-eq p1, v4, :cond_4

    if-eq p1, v0, :cond_3

    goto/16 :goto_3

    .line 5
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zze:J

    goto/16 :goto_3

    .line 6
    :cond_4
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzr:Lcom/google/android/gms/common/internal/BaseGmsClient$zze;

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzh:Lcom/google/android/gms/common/internal/zzu;

    if-eqz p1, :cond_5

    const-string v0, "GmsClient"

    .line 7
    iget-object p1, p1, Lcom/google/android/gms/common/internal/zzu;->zza:Ljava/lang/String;

    const-string v1, "com.google.android.gms"

    .line 8
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x46

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v4, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v4, "Calling connect() while still connected, missing disconnect() for "

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " on "

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 9
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzk:Lcom/google/android/gms/common/internal/GmsClientSupervisor;

    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzh:Lcom/google/android/gms/common/internal/zzu;

    .line 11
    iget-object v0, v0, Lcom/google/android/gms/common/internal/zzu;->zza:Ljava/lang/String;

    const-string v1, "com.google.android.gms"

    .line 12
    iget-object v4, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzr:Lcom/google/android/gms/common/internal/BaseGmsClient$zze;

    .line 13
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzc()Ljava/lang/String;

    move-result-object v5

    .line 14
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    new-instance v6, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;

    invoke-direct {v6, v0, v1, p2}, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {p1, v6, v4, v5}, Lcom/google/android/gms/common/internal/GmsClientSupervisor;->unbindService(Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;Landroid/content/ServiceConnection;Ljava/lang/String;)V

    .line 16
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mDisconnectCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 17
    :cond_5
    new-instance p1, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;

    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mDisconnectCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    invoke-direct {p1, p0, v0}, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;-><init>(Lcom/google/android/gms/common/internal/BaseGmsClient;I)V

    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzr:Lcom/google/android/gms/common/internal/BaseGmsClient$zze;

    .line 18
    new-instance p1, Lcom/google/android/gms/common/internal/zzu;

    const-string v0, "com.google.android.gms"

    .line 19
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getStartServiceAction()Ljava/lang/String;

    move-result-object v1

    .line 20
    invoke-direct {p1, v0, v1, v2, p2}, Lcom/google/android/gms/common/internal/zzu;-><init>(Ljava/lang/String;Ljava/lang/String;ZI)V

    .line 21
    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzh:Lcom/google/android/gms/common/internal/zzu;

    .line 22
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzk:Lcom/google/android/gms/common/internal/GmsClientSupervisor;

    .line 23
    iget-object v2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzr:Lcom/google/android/gms/common/internal/BaseGmsClient$zze;

    .line 24
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzc()Ljava/lang/String;

    move-result-object v4

    .line 25
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    new-instance v5, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;

    invoke-direct {v5, v1, v0, p2}, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {p1, v5, v2, v4}, Lcom/google/android/gms/common/internal/GmsClientSupervisor;->bindService(Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;Landroid/content/ServiceConnection;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_7

    const-string p1, "GmsClient"

    .line 27
    iget-object p2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzh:Lcom/google/android/gms/common/internal/zzu;

    .line 28
    iget-object p2, p2, Lcom/google/android/gms/common/internal/zzu;->zza:Ljava/lang/String;

    const-string v0, "com.google.android.gms"

    .line 29
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x22

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "unable to connect to service: "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " on "

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 30
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/16 p1, 0x10

    .line 31
    iget-object p2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mDisconnectCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 32
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p2

    .line 33
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/common/internal/BaseGmsClient$zzh;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzh;-><init>(Lcom/google/android/gms/common/internal/BaseGmsClient;I)V

    const/4 p0, 0x7

    const/4 p1, -0x1

    .line 34
    invoke-virtual {v0, p0, p2, p1, v1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_3

    .line 36
    :cond_6
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzr:Lcom/google/android/gms/common/internal/BaseGmsClient$zze;

    if-eqz p1, :cond_7

    .line 37
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzk:Lcom/google/android/gms/common/internal/GmsClientSupervisor;

    .line 38
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getStartServiceAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.google.android.gms"

    .line 39
    iget-object v2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzr:Lcom/google/android/gms/common/internal/BaseGmsClient$zze;

    .line 40
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzc()Ljava/lang/String;

    move-result-object v4

    .line 41
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    new-instance v5, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;

    invoke-direct {v5, v0, v1, p2}, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {p1, v5, v2, v4}, Lcom/google/android/gms/common/internal/GmsClientSupervisor;->unbindService(Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;Landroid/content/ServiceConnection;Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 43
    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzr:Lcom/google/android/gms/common/internal/BaseGmsClient$zze;

    .line 44
    :cond_7
    :goto_3
    monitor-exit v3

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final zzc()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzw:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzi:Landroid/content/Context;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    return-object v0
.end method
